/// Mensagem de resposta da BO MVSQLImport
Class ACSC.ConsumoDiario.BO.SQL.MV.Response Extends Ens.Response
{

/***********************************************************************
Data da Alteração: 06-06-2017
Nome do Desenvolvedor: Cesar Birck
Alteração Realizada:  "Criação da classe/mensagem de resposta"
**********************************************************************/
/// Id do armazenamento do snapshot da consulta a view
Property IdSnapShot As %String;

/// Recebe o status  da operaçao
Property Status As %Status;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>IdSnapShot</Value>
</Value>
<Value name="2">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
