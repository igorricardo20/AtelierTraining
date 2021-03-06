/// Mensagem de resposta da bo prepara array envio
Class ACSC.ConsumoDiario.BO.Utils.Response Extends Ens.Response
{

/***********************************************************************
Data da Cria��o: 08-05-2017 
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Cria��o da mensagem de response 
******************************************************************/
/// Resultado do array para transformar em json
Property ResultArray As list Of %Stream.GlobalCharacter;

Property Status As %Status;

Storage Default
{
<Data name="PrepareJSONArrayRespDefaultData">
<Subscript>"PrepareJSONArrayResp"</Subscript>
<Value name="1">
<Value>ResultArray</Value>
</Value>
<Value name="2">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>PrepareJSONArrayRespDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
