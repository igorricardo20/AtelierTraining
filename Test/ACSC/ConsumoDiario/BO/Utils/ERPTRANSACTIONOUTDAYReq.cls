Class ACSC.ConsumoDiario.BO.Utils.ERPTRANSACTIONOUTDAYReq Extends Ens.Request
{

/***********************************************************************
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Criação da messagem de request 
************************************************************************
Data da Criação: 10-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Alteração nas propriedades,
************************************************************************
Data da Criação: 29-05-2017
Nome do Desenvolvedor: Giuliano Junior
Alteração Realizada: Alteração nas propriedades
************************************************************************/
/// Classe de mensagem de requisição do bo Prepara Array Envio
/// Identifição da ocorrência
Property IdIssue As %String;

/// Id de casa para monitor de integrações
Property IdCompany As %String;

/// TimeStamp (data e hora) de inicio da operação
Property StartTS As %TimeStamp;

/// Referente ao nome da View a ser consultada
Property ViewName As %String;

Property IDCOMPANYFK As %String;

Property IdSnapShot As %String;

Storage Default
{
<Data name="PrepareJSONArrayERPTRANSACTIONOUTDAYReqDefaultData">
<Subscript>"PrepareJSONArrayERPTRANSACTIONOUTDAYReq"</Subscript>
<Value name="1">
<Value>IdIssue</Value>
</Value>
<Value name="2">
<Value>IdCompany</Value>
</Value>
<Value name="3">
<Value>StartTS</Value>
</Value>
<Value name="4">
<Value>ViewName</Value>
</Value>
<Value name="5">
<Value>IDCOMPANYFK</Value>
</Value>
<Value name="6">
<Value>IdSnapShot</Value>
</Value>
</Data>
<DefaultData>PrepareJSONArrayERPTRANSACTIONOUTDAYReqDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
