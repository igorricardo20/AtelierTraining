/// Mensagem de requisi��o bp para o bo mv sql import referente a view VW_ERP_INVENTORY
Class ACSC.ConsumoDiario.BO.SQL.MV.Request Extends Ens.Request
{

/***********************************************************************
Data da Cria��o: 06-06-2017
Nome do Desenvolvedor: Cesar Birck
Altera��o Realizada: Cria��o da messagem de request 
**********************************************************************/
/// Id que � usado para alimentar o Monitor de Integra��es		
Property IdIssue As %String;

/// Campo que identifica qual View do MV deve ser consultada
Property ViewMV As %String;

/// Armazena data e hora da ocorr�ncia
Property StartTS As %TimeStamp;

/// Id da casa para alimentar o monitor de Integra��es.
Property IdCompany As %String;

Property Legacy As %Boolean;

Property CodEstab As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>IdIssue</Value>
</Value>
<Value name="2">
<Value>ViewMV</Value>
</Value>
<Value name="3">
<Value>StartTS</Value>
</Value>
<Value name="4">
<Value>IdCompany</Value>
</Value>
<Value name="5">
<Value>Legacy</Value>
</Value>
<Value name="6">
<Value>CodEstab</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
