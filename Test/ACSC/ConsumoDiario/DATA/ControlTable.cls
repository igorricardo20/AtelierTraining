/// A classe ControlTable realiza a persistência para controle interno dos dados
Class ACSC.ConsumoDiario.DATA.ControlTable Extends %Persistent
{

/***********************************************************************
Data da Criação: 03-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Criação da classe de persitência e propriedades
*************************************************************************
Data da Alteração: 08-05-2017
Nome do Desenvolvedor: Felipe de Camargo Vieira
Alteração Realizada: Inserção dos atributos de erro
*************************************************************************
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Alteração das propriedades e comentários StartTS,EndTS,ErrorTS, 
					 e Status para %Status , ErroDescription, IdIntegration e inserido a propriedade IdIntegration
**********************************************************************/
/// Identificação da integração
Property IdIntegration As %String;

/// Id referente a casa, local
Property IdCompany As %Integer;

/// Nome da view da operação
Property RequestType As %String(MAXLEN = "");

/// Quantidade de registros enviados durante este processo
Property AffectedRows As %Integer;

/// Soma referente aos valores de campo de validação do cliente
Property SetCount As %Integer;

/// TimeStamp (data e hora) de inicio da operação
Property StartTS As %TimeStamp;

/// TimeStamp (data e hora) de fim da operação
Property EndTS As %TimeStamp;

/// Status 0/1 para indicar sucesso ou falha
Property Status As %Integer;

/// Descrição do erro em caso de falha
Property ErrorDescription As %String(MAXLEN = "");

/// TimeStamp(data e hora) do erro em caso de falha
Property ErrorTS As %TimeStamp;

/// Metodo para salvar o erro na tabela de controle
ClassMethod SaveErrorControlTable(pStrError As %String, pStartTs As %TimeStamp, pViewName As %String, Output pObj As %DynamicObject) As %Status
{
	SET tSC = $System.Status.OK()
	
	TRY
	{		
		//Salva na tabela de controle a data, hora e o tipo do erro 
		SET tCtrlTable 					= ##class(ACSC.ConsumoDiario.DATA.ControlTable).%New()
		SET tCtrlTable.Status 			= 0
		SET tCtrlTable.RequestType 		= pViewName
		SET tCtrlTable.ErrorDescription = pStrError
		SET tCtrlTable.StartTS 			= pStartTs
		SET tCtrlTable.ErrorTS 			= $ZDATETIME($HOROLOG,3,3)
		SET tSC 						= tCtrlTable.%Save()
		
		//Cria um objeto para ser utilizado no Monitor de Integração
		SET tDynObj = ##class(%DynamicObject).%New()
		SET tDynObj = tDynObj.%Set("Status", tCtrlTable.Status)
		SET tDynObj = tDynObj.%Set("RequestType", tCtrlTable.RequestType)
		SET tDynObj = tDynObj.%Set("ErrorDescription", tCtrlTable.ErrorDescription)
		SET tDynObj = tDynObj.%Set("StartTS", tCtrlTable.StartTS)
		SET tDynObj = tDynObj.%Set("ErrorTS", tCtrlTable.ErrorTS)
		SET pObj 	= tDynObj
	}
	CATCH(e)
	{
		SET tErro 	= $System.Error.FromException(e)
		SET tSC 	= $System.Status.Error(-999,"SaveErrorControlTable "_tErro.Message)				
	}
	
	QUIT tSC
}

/// Método para gravar o erro na tabela de controle
ClassMethod SaveErrorControlTableCount(pStrError As %String, pIdCompany As %String, pStartTS As %String, pIntegrationId As %String, Output pObj As %DynamicObject) As %Status
{
	SET tSC = $System.Status.OK()
	
	TRY
	{
		//Atribui os parâmetros e salva os erros na tabela de controle
		SET tCtrlTable					= ##class(ACSC.ConsumoDiario.DATA.ControlTable).%New()
		SET tCtrlTable.Status 			= 0
		SET tCtrlTable.IdIntegration 	= pIntegrationId
		SET tCtrlTable.IdCompany 		= pIdCompany
		SET tCtrlTable.RequestType 		= "SetCount"
		SET tCtrlTable.ErrorDescription = pStrError
		SET tCtrlTable.StartTS 			= pStartTS
		SET tCtrlTable.ErrorTS 			= $ZDATETIME($HOROLOG,3,3)	
					
		SET tSC = tCtrlTable.%Save() 
		
		SET dynObj = ##class(%DynamicObject).%New()
		SET dynObj = dynObj.%Set("Status", tCtrlTable.Status)
		SET dynObj = dynObj.%Set("IdIntegration", tCtrlTable.IdIntegration)
		SET dynObj = dynObj.%Set("IdCompany", tCtrlTable.IdCompany)
		SET dynObj = dynObj.%Set("RequestType", tCtrlTable.RequestType)
		SET dynObj = dynObj.%Set("ErrorDescription", tCtrlTable.ErrorDescription)
		SET dynObj = dynObj.%Set("StartTS", tCtrlTable.StartTS)
		SET dynObj = dynObj.%Set("ErrorTS", tCtrlTable.ErrorTS)
		
		SET pObj = dynObj		
	}
	CATCH(e)
	{
		SET tErro 	= $System.Error.FromException(e)
		SET tSC 	= $System.Status.Error(-999,tErro.Message)	
	}
	QUIT tSC
}

Storage Default
{
<Data name="ControlTableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>IdIntegration</Value>
</Value>
<Value name="3">
<Value>IdCompany</Value>
</Value>
<Value name="4">
<Value>RequestType</Value>
</Value>
<Value name="5">
<Value>AffectedRows</Value>
</Value>
<Value name="6">
<Value>SetCount</Value>
</Value>
<Value name="7">
<Value>StartTS</Value>
</Value>
<Value name="8">
<Value>EndTS</Value>
</Value>
<Value name="9">
<Value>Status</Value>
</Value>
<Value name="10">
<Value>ErrorDescription</Value>
</Value>
<Value name="11">
<Value>ErrorTS</Value>
</Value>
</Data>
<DataLocation>^ACSC.ConsumoDA60D.ControlTableD</DataLocation>
<DefaultData>ControlTableDefaultData</DefaultData>
<IdLocation>^ACSC.ConsumoDA60D.ControlTableD</IdLocation>
<IndexLocation>^ACSC.ConsumoDA60D.ControlTableI</IndexLocation>
<StreamLocation>^ACSC.ConsumoDA60D.ControlTableS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
