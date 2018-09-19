/// Mensagem que envia a hora de incio da Task para o BP. 
Class ACSC.ConsumoDiario.BP.Mensagem.Request Extends Ens.Request
{

/**********************************************************

Data da Criação 02-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Alteração Realizada: Criação da classe 

***********************************************************

Data da Alteração: 29-05-2017
Nome do Desenvolvedor: Giuliano Reis Junior
Alteração Realizada: Inclusão da propriedade 

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
