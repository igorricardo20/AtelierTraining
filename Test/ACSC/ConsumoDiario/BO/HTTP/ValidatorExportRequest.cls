/// Classe responsável pelo envio de totalizadores
Class ACSC.ConsumoDiario.BO.HTTP.ValidatorExportRequest Extends Ens.Request
{

/***********************************************************************
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Criação da classe da mensagem Request
Data da Criação: 08-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Alteração do comentário IdCompany  e LetraMaiuscula do IdIntregration
Data da Criação: 10-05-2017
Nome do Desenvolvedor: Jéssica Santos
Alteração Realizada: Removido o IdIntegration
***********************************************************************
Data da Criação: 24-05-2017
Nome do Desenvolvedor: Rodrigo Borrelli
Alteração Realizada: Adicionado StartTS e IdCompany
**********************************************************************/
/// Id da ocorrencia	
Property IdIssue As %String;

/// Data e Hora que inicio a integração
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
