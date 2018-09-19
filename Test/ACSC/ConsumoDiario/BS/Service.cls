/// Essa classe é chamada pela task para começar a execução do processo 
Class ACSC.ConsumoDiario.BS.Service Extends Ens.BusinessService
{

/*******************************************************************************************************************
Data da Alteração: 09-05-2017
Nome do Desenvolvedor: Daniel Sanches, Giuliano Junior
Alteração Realizada: Criação e implementação dos metodos
Alteração Realizada: Criação da propriedade IdIssue 

********************************************************************************************************************
Data da Alteração: 29-05-2017
Nome do Desenvolvedor: Giuliano Junior
Alteração realizada: Implementação de chamadas de metodo para envio de informaçãpo para o Monitor de Intergração
					 Inclusão do parâmetro pIdCompany 

********************************************************************************************************************/
/// Recebe Id da ocorrencia
Property IdIssue As %String;

/// Recebe a data hora de inicio da integração
Property StartTS As %TimeStamp;

/// Recebe Id da casa
Property IdCompany As %Integer;

/// Recebe a hora de inicio da task, envia para o Monitor de Integração hora e data de inicio e recebe o Id da ocorrencia 
Method StartProcess(pStarTs As %TimeStamp, pIdCompany As %String, pCodEstab As %String)
{
	SET tSC = $System.Status.OK()
	TRY
	{
		SET ^%IdIssue = $I(^%IdIssue)
		SET ..IdIssue = ^%IdIssue_"_MV_PLANNEXO"
		SET ..StartTS = pStarTs
		SET ..IdCompany = pIdCompany
							
		JOB ##class(ACSC.Utils.ControleIssue).StartIssue(2, ..StartTS, ..IdCompany, 1,..IdIssue)
		
	 	SET tRequest = ##class(ACSC.ConsumoDiario.BP.Mensagem.Request).%New()
		SET tRequest.IdIssue = ..IdIssue
		SET tRequest.StartTs = ..StartTS
		SET tRequest.IdCompany = ..IdCompany
		SET tRequest.CodEstab = pCodEstab
		
		SET tSC = ..ProcessInput(tRequest,.tResponse)
	}
	CATCH(e)
	{	
		SET tErro = $System.Error.FromException(e)	
 		SET tSC = $System.Status.Error(-1,tErro.Message)	
	}
	QUIT tSC
}

/// Realiza a chamada do Bp informando o objeto que contem o Id da ocorrencia e data e hora de incio
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	SET tSC = $System.Status.OK()
	
	TRY
	{	
	
		//Chama o Bp referente ao Hospital Santa Catarina
		IF (pInput.IdCompany = "100")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario CORP", pInput, .pOutput)
		}
		//Chama o Bp referente a Casa de Saude São Jose
		IF (pInput.IdCompany = "225")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario CSSJ", pInput, .pOutput)
		}
		//Chama o Bp referente ao Hospital Santa Tereza
		IF (pInput.IdCompany = "234")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario HST", pInput, .pOutput)
		}
		//Chama o Bp referente ao Hospital Madre Regina Protmann
		IF (pInput.IdCompany = "231")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario HMR", pInput, .pOutput)
		}
		//Chama o Bp referente ao Hospital São Luiz
		IF (pInput.IdCompany = "233")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario HSL", pInput, .pOutput)
		}
		//Chama o Bp referente ao Hospital Amparo Maternal
		IF (pInput.IdCompany = "229")
		{
			SET pInput.Legacy = 1
			SET tSC = ..SendRequestSync("Envia Consumo Diario HAM", pInput, .pOutput)
		}
		// Verifica se não ouve erro no processo e salva na tabela de controle e informa o Monitor de Integração
		IF (tSC)
		{			
            SET tEndTS = $ZDATETIME($HOROLOG,3,3)
    		SET tCtrlTable = ##class(ACSC.ConsumoDiario.DATA.ControlTable).%New()
    		SET tCtrlTable.Status = 1 //sucesso
    		SET tCtrlTable.RequestType = "SetCount"
    		SET tCtrlTable.StartTS = ..StartTS
    		SET tCtrlTable.EndTS = tEndTS
    		SET tSC = tCtrlTable.%Save()
    		
    		// Verifica se foi possivel salvar o sucesso na tabela de controle
    		IF ('tSC)
			{
				SET tErrorFullDesc = $System.Status.GetErrorText(tSC)
				SET tError = "Falha ao armazenar o sucesso do processo"
				JOB ##class(ACSC.Utils.ControleIssue).UpdateIssue(..IdIssue, "",tEndTS , tErrorFullDesc, tError , $get($$$JobSessionId) , 0, 1, 0)
			}
			ELSE
			{
	    		/* 
  				  	UpdateIssue:
     				parametro 1: pId  - id da issue
    				parametro 2: pISSFinishTS  - data de termino da integração
	      			parametro 3: pISSStopAlertTS - data de ocorreu o erro
    	  			parametro 4: pISSFullDescription - descrição completa do erro
      				parametro 5: pISSDescription - descrição resumida do erro
     				parametro 6: pISSEnsSession -  id da sessão no ensemble
      				parametro 7: pISSType - tipos de erro: 0 bloqueante, 1 contornado, 2 não impedem a execução, 3 conclusão da integração sem erros
      				parametro 8: pIdISSIssueTypeDr - Id do tipo de erro
      				parametro 9: pISSFlag - booleano, integração pode ser reenviada   
    			*/
    		
    			// Informa para o Monitor de Integração o sucesso do processo 
    			
    			
    			JOB ##class(ACSC.Utils.ControleIssue).UpdateIssue(..IdIssue, tEndTS,"","","",$get($$$JobSessionId),3,"",0)
    			
			}
		}
		Else
		{
			JOB ##class(ACSC.Utils.ControleIssue).UpdateIssue(..IdIssue,"",$ZDATETIME($HOROLOG,3,3),$System.Status.GetErrorText(tSC),"Erro ao Executar Integração",$get($$$JobSessionId),0,6,0)
			
			// Grava na Tabela de Controle De REENVIO DE INTEGRAÇÃO
			JOB ##class(ACSC.Utils.ControleIssue).InsertControlTable("PLANNEXO", pInput.IdIssue, pInput.IdCompany, "","PLANNEXO", "E")
			
		}		
		
	}
	CATCH(e)
	{
		SET tErro = $System.Error.FromException(e)
 		SET tSC = $System.Status.Error(-1,tErro.Message)
	}	
	QUIT tSC
}

}
