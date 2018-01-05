Class TRE.BSAtelier extends EnsLib.SOAP.Service {

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the web service
Parameter SERVICENAME = "BSAtelier";

/// TODO: Change to a valid network address
/// URL for invoking the web service
Parameter LOCATION = "/csp/healthshare/treinamento/TRE.BSAtelier.cls";

/// TODO: Change this to actual SOAP namespace
/// SOAP namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

Method RecuperaCursoPorNome(pNome As %String) As %String [ WebMethod ]
{
	Set tSC=..ProcessInput(pNome,.tResponse)
	If $$$ISERR(tSC) Do ..ReturnMethodStatusFault(tSC) g
	Quit tSC_"-"_tResponse.Nome
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{

	Set pOutput = ##Class(TRE.Curso).RecuperaCursoPorNome(pInput)
	Quit 1
}

}