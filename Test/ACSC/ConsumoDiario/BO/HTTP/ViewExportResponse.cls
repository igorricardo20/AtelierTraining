/// Mensagem de resposta do processo de exporta��o REST para Plannexo
Class ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse Extends Ens.Response
{

/************************
Data da Altera��o: 02-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Altera��o Realizada: Cria��o da classe 
*************************/
/// Status da opera��o
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
