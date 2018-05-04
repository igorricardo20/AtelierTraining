Class Treinamento.asdasdaasdasdas extends EnsLib.SOAP.Service {

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the web service
Parameter SERVICENAME = "asdasdaasdasdas";

/// TODO: Change to a valid network address
/// URL for invoking the web service
Parameter LOCATION = "http://127.0.0.1:8972/csp/ensemble";

/// TODO: Change this to actual SOAP namespace
/// SOAP namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

Method Sample(pInput As %String) As %Status [ WebMethod ]
{
	Set tSC=..ProcessInput(pInput,.tResponse,"Sample")
	If $$$ISERR(tSC) Do ..ReturnMethodStatusFault(tSC)
	Quit tResponse
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{

	Quit $$$ERROR($$$NotImplemented)
}

}