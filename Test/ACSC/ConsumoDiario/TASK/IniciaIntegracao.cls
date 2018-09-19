Class ACSC.ConsumoDiario.TASK.IniciaIntegracao Extends %SYS.Task.Definition
{

/***********************************************************************
Data da Alteração: 05-05-2017
Nome do Desenvolvedor: Angelo Bruno Braga
Alteração Realizada: Criação da Classe
**********************************************************************/
Property ExecutionTime As %Integer [ InitialExpression = 30 ];

Property IdCompany As %String(MAXLEN = "") [ InitialExpression = "100:7,225:3,234:4,231:11,233:18,229:43" ];

Method OnTask() As %Status
{
	#DIM pBS As Ens.BusinessService	

	;Garante que casas sejam processadas independente de terem sido cadastradas com vígula (,) ou ponto e vírgula(;)
	SET tCompanyIdList = $REPLACE(..IdCompany,",",";")

	SET tCodEstab = ""
	
	FOR i=1:1:$LENGTH(tCompanyIdList,";")
	{
		//Integração HOSPITAL SANTA CATARINA 		- Casa 100
		//Integração CASA DE SAUDESÃO JOSÉ 			- Casa 225
		//Integração HOSPITAL SANTA TEREZA 			- Casa 234
		//Integração HOSPITAL MADRE REGINA PROTMAN	- Casa 231
		//Integração HOSPITAL SÃO LUIZ		 		- Casa 233
		//Integração HOSPITAL AMPARO MATERNAL		- Casa 229
		
		SET tStartTime = $ZDATETIME($HOROLOG,3,3)
		SET tIdCompany = $PIECE($PIECE(tCompanyIdList,";",i),":",1)
		
		SET tCodEstab = $PIECE($PIECE(tCompanyIdList,";",i),":",2)

		SET tSC = ##Class(Ens.Director).CreateBusinessService("Schedule Envia Consumo Diario",.pBS)
		SET tSC = pBS.StartProcess(tStartTime,tIdCompany,tCodEstab)
		
		KILL pBS		
		HANG ..ExecutionTime
	}
	
	Quit tSC
}

}
