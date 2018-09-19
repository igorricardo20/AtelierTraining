/// Mensagem de resposta do processo de exportação REST para Plannexo
Class ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse Extends Ens.Response
{

/************************
Data da Alteração: 02-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Alteração Realizada: Criação da classe 
*************************/
/// Status da operação
Property Status As %Status;

Storage Default
{
<Data name="ViewExportResponseDefaultData">
<Subscript>"ViewExportResponse"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>ViewExportResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
