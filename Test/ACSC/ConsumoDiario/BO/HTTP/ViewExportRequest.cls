/// Mensagem de resposta da BO PlannexoRestExport
Class ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest Extends Ens.Request
{

/***********************************************************************
Data da Alteração: 03-05-2017
Nome do Desenvolvedor: Daniel Sanches
Alteração Realizada: Criação da Classe/Mensagem de Requisição
Data da Alteração: 08-05-2017
Nome do Desenvolvedor: Felipe de Camargo Vieira
Alteração Realizada: Adição das propriedades do Id da casa e a soma
						do campo quantitativo
**********************************************************************/
/// Id da ocorrencia	
Property IdIssue As %String;

///  data e hora de incio
Property StartTS As %TimeStamp;

/// Id da casa
Property IdCompany As %Integer;

/// Nome da view a ser consultada
Property ViewName As %String;

/// Array para transformar em json
Property ResultJSON As %Stream.GlobalCharacter;

Property Credential As %String;

Storage Default
{
<Data name="ViewExportRequestDefaultData">
<Subscript>"ViewExportRequest"</Subscript>
<Value name="1">
<Value>IdIssue</Value>
</Value>
<Value name="2">
<Value>StartTS</Value>
</Value>
<Value name="3">
<Value>IdCompany</Value>
</Value>
<Value name="4">
<Value>ViewName</Value>
</Value>
<Value name="5">
<Value>ResultJSON</Value>
</Value>
<Value name="6">
<Value>Credential</Value>
</Value>
</Data>
<DefaultData>ViewExportRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
