/// Mensagem que envia a hora de incio da Task para o BP. 
Class ACSC.ConsumoDiario.BP.Mensagem.Request Extends Ens.Request
{

/**********************************************************

Data da Cria��o 02-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Altera��o Realizada: Cria��o da classe 

***********************************************************

Data da Altera��o: 29-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Altera��o Realizada: Inclus�o da propriedade 

***********************************************************/
/// Ts do inicio da Ocorrencia 
Property StartTs As %TimeStamp;

/// ID da Ocorrencia
Property IdIssue As %String;

/// Id da casa 
Property IdCompany As %String;

Property Legacy As %Boolean;

Property CodEstab As %String;

Storage Default
{
<Data name="EnviaConsumoDiarioBPReqDefaultData">
<Subscript>"EnviaConsumoDiarioBPReq"</Subscript>
<Value name="1">
<Value>StartTs</Value>
</Value>
<Value name="2">
<Value>IdIssue</Value>
</Value>
<Value name="3">
<Value>IdCompany</Value>
</Value>
<Value name="4">
<Value>Legacy</Value>
</Value>
<Value name="5">
<Value>CodEstab</Value>
</Value>
</Data>
<DefaultData>EnviaConsumoDiarioBPReqDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
