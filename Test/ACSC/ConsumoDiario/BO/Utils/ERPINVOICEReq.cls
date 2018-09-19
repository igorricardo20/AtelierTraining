Class ACSC.ConsumoDiario.BO.Utils.ERPINVOICEReq Extends Ens.Request
{

/***********************************************************************
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Criação da messagem de request 
Data da Criação: 10-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Alteração nas propriedades
******************************************************************/
/// Classe de mensagem de requisição do bo Prepara Array Envio
/// Identifição da ocorrência
Property IdIssue As %String;

/// TimeStamp (data e hora) de inicio da operação
Property StartTS As %TimeStamp;

/// Referente ao nome da View a ser consultada
Property ViewName As %String;

Property IDCOMPANYFK As %String;

Property IdSnapShot As %String;

/// Id de casa para monitor de integrações
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
