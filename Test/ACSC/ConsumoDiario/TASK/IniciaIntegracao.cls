Class ACSC.ConsumoDiario.TASK.IniciaIntegracao Extends %SYS.Task.Definition
{

/***********************************************************************
Data da Altera��o: 05-05-2017
Nome do Desenvolvedor: Angelo Bruno Braga
Altera��o Realizada: Cria��o da Classe
**********************************************************************/
Property ExecutionTime As %Integer [ InitialExpression = 30 ];

Property IdCompany As %String(MAXLEN = "") [ InitialExpression = "100:7,225:3,234:4,231:11,233:18,229:43" ];

Method OnTask() As %Status
{
	#DIM pBS As Ens.BusinessService	
	//teste2
	;Garante que casas sejam processadas independente de terem sido cadastradas com v�gula (,) ou ponto e v�rgula(;)
	SET tCompanyIdList = $REPLACE(..IdCompany,",",";")

	SET tCodEstab = ""
	
	FOR i=1:1:$LENGTH(tCompanyIdList,";")
	{
		//Integra��o HOSPITAL SANTA CATARINA 		- Casa 100
		//Integra��o CASA DE SAUDES�O JOS� 			- Casa 225
		//Integra��o HOSPITAL SANTA TEREZA 			- Casa 234
		//Integra��o HOSPITAL MADRE REGINA PROTMAN	- Casa 231
		//Integra��o HOSPITAL S�O LUIZ		 		- Casa 233
		//Integra��o HOSPITAL AMPARO MATERNAL		- Casa 229
		
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
