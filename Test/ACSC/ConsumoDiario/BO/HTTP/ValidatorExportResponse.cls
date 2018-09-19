/// Classe responsável por receber a resposta de envio de totalizadores
Class ACSC.ConsumoDiario.BO.HTTP.ValidatorExportResponse Extends Ens.Response
{

/***********************************************************************
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Criação da Classe da mensagem Response
**********************************************************************/
Property Status As %Status;

Property SentJSON As %GlobalCharacterStream;

Property PlannexoResponse As %GlobalCharacterStream;

Storage Default
{
<Data name="ValidatorExportResponseDefaultData">
<Subscript>"ValidatorExportResponse"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
<Value name="2">
<Value>SentJSON</Value>
</Value>
<Value name="3">
<Value>PlannexoResponse</Value>
</Value>
</Data>
<DefaultData>ValidatorExportResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
