/// Essa classe � chamada pela task para come�ar a execu��o do processo 
Class ACSC.ConsumoDiario.BS.Service Extends Ens.BusinessService
{

/*******************************************************************************************************************
Data da Altera��o: 09-05-2017
Nome do Desenvolvedor: Daniel Sanches, Giuliano Junior
Altera��o Realizada: Cria��o e implementa��o dos metodos
Altera��o Realizada: Cria��o da propriedade IdIssue 

********************************************************************************************************************
Data da Altera��o: 29-05-2017
Nome do Desenvolvedor: Giuliano Junior
Altera��o realizada: Implementa��o de chamadas de metodo para envio de informa��po para o Monitor de Intergra��o
					 Inclus�o do par�metro pIdCompany 

********************************************************************************************************************/
/// Recebe Id da ocorrencia
Property IdIssue As %String;

/// Recebe a data hora de inicio da integra��o
Property StartTS As %TimeStamp;

/// Recebe Id da casa
Property IdCompany As %Integer;

/// Recebe a hora de inicio da task, envia para o Monitor de Integra��o hora e data de inicio e recebe o Id da ocorrencia 
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
		//Chama o Bp referente a Casa de Saude S�o Jose
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
		//Chama o Bp referente ao Hospital S�o Luiz
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
		// Verifica se n�o ouve erro no processo e salva na tabela de controle e informa o Monitor de Integra��o
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
    				parametro 2: pISSFinishTS  - data de termino da integra��o
	      			parametro 3: pISSStopAlertTS - data de ocorreu o erro
    	  			parametro 4: pISSFullDescription - descri��o completa do erro
      				parametro 5: pISSDescription - descri��o resumida do erro
     				parametro 6: pISSEnsSession -  id da sess�o no ensemble
      				parametro 7: pISSType - tipos de erro: 0 bloqueante, 1 contornado, 2 n�o impedem a execu��o, 3 conclus�o da integra��o sem erros
      				parametro 8: pIdISSIssueTypeDr - Id do tipo de erro
      				parametro 9: pISSFlag - booleano, integra��o pode ser reenviada   
    			*/
    		
    			// Informa para o Monitor de Integra��o o sucesso do processo 
    			
    			
    			JOB ##class(ACSC.Utils.ControleIssue).UpdateIssue(..IdIssue, tEndTS,"","","",$get($$$JobSessionId),3,"",0)
    			
			}
		}
		Else
		{
			JOB ##class(ACSC.Utils.ControleIssue).UpdateIssue(..IdIssue,"",$ZDATETIME($HOROLOG,3,3),$System.Status.GetErrorText(tSC),"Erro ao Executar Integra��o",$get($$$JobSessionId),0,6,0)
			
			// Grava na Tabela de Controle De REENVIO DE INTEGRA��O
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
