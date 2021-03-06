Class ACSC.ConsumoDiario.BO.Utils.ERPINVOICEReq Extends Ens.Request
{

/***********************************************************************
Data da Cria��o: 08-05-2017
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Cria��o da messagem de request 
Data da Cria��o: 10-05-2017
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Altera��o nas propriedades
******************************************************************/
/// Classe de mensagem de requisi��o do bo Prepara Array Envio
/// Identifi��o da ocorr�ncia
Property IdIssue As %String;

/// TimeStamp (data e hora) de inicio da opera��o
Property StartTS As %TimeStamp;

/// Referente ao nome da View a ser consultada
Property ViewName As %String;

Property IDCOMPANYFK As %String;

Property IdSnapShot As %String;

/// Id de casa para monitor de integra��es
Property IdCompany As %String;

Storage Default
{
<Data name="PrepareJSONArrayERPINVOICEReqDefaultData">
<Subscript>"PrepareJSONArrayERPINVOICEReq"</Subscript>
<Value name="1">
<Value>IdIssue</Value>
</Value>
<Value name="2">
<Value>StartTS</Value>
</Value>
<Value name="3">
<Value>ViewName</Value>
</Value>
<Value name="4">
<Value>IDCOMPANYFK</Value>
</Value>
<Value name="5">
<Value>IdSnapShot</Value>
</Value>
<Value name="6">
<Value>IdCompany</Value>
</Value>
</Data>
<DefaultData>PrepareJSONArrayERPINVOICEReqDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
