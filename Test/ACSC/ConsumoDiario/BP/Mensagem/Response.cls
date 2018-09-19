Class ACSC.ConsumoDiario.BP.Mensagem.Response Extends Ens.Response
{

Property Status As %Status;

Storage Default
{
<Data name="EnviaConsumoDiarioBPRespDefaultData">
<Subscript>"EnviaConsumoDiarioBPResp"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>EnviaConsumoDiarioBPRespDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
