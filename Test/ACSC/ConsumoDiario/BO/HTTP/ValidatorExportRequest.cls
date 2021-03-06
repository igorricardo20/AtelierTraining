/// Classe respons�vel pelo envio de totalizadores
Class ACSC.ConsumoDiario.BO.HTTP.ValidatorExportRequest Extends Ens.Request
{

/***********************************************************************
Data da Cria��o: 08-05-2017
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Cria��o da classe da mensagem Request
Data da Cria��o: 08-05-2017
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Altera��o do coment�rio IdCompany  e LetraMaiuscula do IdIntregration
Data da Cria��o: 10-05-2017
Nome do Desenvolvedor: J�ssica Santos
Altera��o Realizada: Removido o IdIntegration
***********************************************************************
Data da Cria��o: 24-05-2017
Nome do Desenvolvedor: Rodrigo Borrelli
Altera��o Realizada: Adicionado StartTS e IdCompany
**********************************************************************/
/// Id da ocorrencia	
Property IdIssue As %String;

/// Data e Hora que inicio a integra��o
Property StartTS As %TimeStamp;

/// Id da casa
Property IdCompany As %Integer;

Property Credential As %String;

Storage Default
{
<Data name="ValidatorExportRequestDefaultData">
<Subscript>"ValidatorExportRequest"</Subscript>
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
<Value>Credential</Value>
</Value>
</Data>
<DefaultData>ValidatorExportRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
