Class ACSC.ConsumoDiario.DATA.ViewMvQuery Extends %Persistent
{

/************************************************************************************
Data da Criação: 06-06-2017
Nome do Desenvolvedor: Cesar Birck
Objetivo da Implementação: Criação da classe para armazenar Querys das Views do MV
**************************************************************************************/
/// Nome da View do MV
Property ViewMV As %String;

Property Legacy As %Boolean;

/// Query para consulta no MV
Property Query As %String(MAXLEN = "");

/// Índice do nome da View do MV
Index ViewMVIdx On (ViewMV, Legacy) [ Unique ];

/************************************************************************************
Data da Criação: 06-06-2017
Nome do Desenvolvedor: Cesar Birck
Objetivo da Implementação: Método insere ou atualiza Query pelo nome da View do MV
*************************************************************************************/
ClassMethod InsertValues(pViewMV As %String, pQuery As %String(MAXLEN=""), pLegacy As %Boolean) As %Status
{
	TRY
	{
		SET tObject = ##Class(ACSC.ConsumoDiario.DATA.ViewMvQuery).ViewMVIdxOpen(pViewMV, pLegacy)
		IF '$ISOBJECT(tObject)
		{
			SET tObject = ##Class(ACSC.ConsumoDiario.DATA.ViewMvQuery).%New()
			SET tObject.ViewMV	= pViewMV
			SET tObject.Legacy = pLegacy
		}	
		SET tObject.Query	= pQuery
		
		SET tSC = tObject.%Save()
	}
	CATCH(e)
	{
		Set tSC = $System.Error.FromException(e)
	}
	QUIT tSC
}

/**************************************************************************************************************
Data da Criação           : 06-06-2017
Nome do Desenvolvedor     : Cesar Birck
Objetivo da Implementação : Método cria base de dados com o nome da View do MV com suas respectivas Querys
Observação                : Ao executar este método a tabela é populada para utilização (carga inicial)
**************************************************************************************************************
Data da Criação           : 12-06-2017
Nome do Desenvolvedor     : Rodrigo Borrelli
Objetivo da Atualização : Atualização das Querys baseado na homologação V1.0			
***************************************************************************************************************/
ClassMethod CreateDataBase() As %Status
{
	
	//Insere informações da view: VW_ERP_SKU_V2 - SOUL
	SET tViewName	= "VW_ERP_SKU_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK,COD_ESTAB_PK,COD_ITEM_PK, DESC_ITEM,VAL_UNIT_SKU,COD_STD_UNIT, NVL(TO_CHAR(YN_PARENT),'N') AS YN_PARENT, COD_ITEM_PARENT "_
						 ",COD_GROUP2,COD_GROUP3 ,NVL(TO_CHAR(DESC_GROUP2),'#') AS DESC_GROUP2, NVL(TO_CHAR(DESC_GROUP3),'#') AS DESC_GROUP3 ,"_ 
						 "NVL(TO_CHAR(COD_ORDER_UNIT),COD_STD_UNIT) AS COD_ORDER_UNIT, NVL(TO_CHAR(QTY_MULT_ORDER),1) AS QTY_MULT_ORDER,DESC_ORDER_UNIT, "_
						 "DESC_STD_UNIT, TO_CHAR(DATE_ADDED , ' ddmmyyyy ') FROM VW_ERP_SKU "_
					     " WHERE COD_ESTAB_PK = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
	//Insere informações da view: VW_ERP_SKU_V2 - LEGADO
	SET tViewName	= "VW_ERP_SKU_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK,COD_ESTAB_PK,COD_ITEM_PK, DESC_ITEM,VAL_UNIT_SKU,COD_STD_UNIT, NVL(TO_CHAR(YN_PARENT),'N') AS YN_PARENT, COD_ITEM_PARENT "_
						 ",COD_GROUP2,COD_GROUP3 ,NVL(TO_CHAR(DESC_GROUP2),'#') AS DESC_GROUP2, NVL(TO_CHAR(DESC_GROUP3),'#') AS DESC_GROUP3 ,"_ 
						 "NVL(TO_CHAR(COD_ORDER_UNIT),COD_STD_UNIT) AS COD_ORDER_UNIT, NVL(TO_CHAR(QTY_MULT_ORDER),1) AS QTY_MULT_ORDER,DESC_ORDER_UNIT, "_
						 "DESC_STD_UNIT, TO_CHAR(DATE_ADDED , ' ddmmyyyy ') FROM VW_ERP_SKU "	
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	
	
	//Insere informações da view: VW_ERP_INVENTORY_V2 - SOUL
	SET tViewName	= "VW_ERP_INVENTORY_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK,COD_ITEM_PK , COD_LOCAL_PK, "_ 
						 "QTY_INV FROM VW_ERP_INVENTORY "_
						 " WHERE COD_ESTAB_PK = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery,0)
		
	//Insere informações da view: VW_ERP_INVENTORY_V2 - LEGADO
	SET tViewName	= "VW_ERP_INVENTORY_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK,COD_ITEM_PK , COD_LOCAL_PK, "_ 
						 "QTY_INV FROM VW_ERP_INVENTORY "
	SET tSC 		= ..InsertValues(tViewName,tQuery,1)
	
	
	//Insere informações da view: VW_ERP_TRANSACTION_OUT_DAY_V2 - SOUL
	SET tViewName	= "VW_ERP_TRANSACTION_OUT_DAY_V2"
	SET tQuery 		= "SELECT  ID_COMPANY_FK, COD_ESTAB_PK, COD_ITEM_PK, COD_LOCAL_PK,"_
					 	" TO_CHAR(DATE_TRANS_PK ,  'DDMMYYYY ') AS DATE_TRANS_PK ,QTY_TRANS FROM VW_ERP_TRANSACTION_OUT_DAY "_
						" WHERE COD_ESTAB_PK = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery,0)
	
	//Insere informações da view: VW_ERP_TRANSACTION_OUT_DAY_V2 - LEGADO
	SET tViewName	= "VW_ERP_TRANSACTION_OUT_DAY_V2"
	SET tQuery 		= "SELECT  ID_COMPANY_FK, COD_ESTAB_PK, COD_ITEM_PK, COD_LOCAL_PK,"_
					 	" TO_CHAR(DATE_TRANS_PK ,  'DDMMYYYY ') AS DATE_TRANS_PK ,QTY_TRANS FROM VW_ERP_TRANSACTION_OUT_DAY "
	SET tSC 		= ..InsertValues(tViewName,tQuery,1)
	
	
	//Insere informações da view: VW_ERP_TRANSACTION_OUT_MONTH_V2 - SOUL
	SET tViewName	= "VW_ERP_TRANSACTION_OUT_MONTH_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK, COD_ITEM_PK, COD_LOCAL_PK, "_ 
					 "COD_LOCAL_PK, TO_CHAR (MONTH_TRANS_PK, ' ddmmyyyy ') AS MONTH_TRANS_PK, "_
					 "QTY_TRANS FROM VW_ERP_TRANSACTION_OUT_MONTH"_
					 " WHERE COD_ESTAB_PK = ?"
	SET tSC = ..InsertValues(tViewName,tQuery,0)
	
	//Insere informações da view: VW_ERP_TRANSACTION_OUT_MONTH_V2 - LEGADO
	SET tViewName	= "VW_ERP_TRANSACTION_OUT_MONTH_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK, COD_ITEM_PK, COD_LOCAL_PK, "_ 
					 "COD_LOCAL_PK, TO_CHAR (MONTH_TRANS_PK, ' ddmmyyyy ') AS MONTH_TRANS_PK, "_
					 "QTY_TRANS FROM VW_ERP_TRANSACTION_OUT_MONTH"
	SET tSC = ..InsertValues(tViewName,tQuery,1)
	
	
	//Insere informações da view: VW_ERP_PURCHASE_ORDER_V2 - SOUL
	SET tViewName	= "VW_ERP_PURCHASE_ORDER_V2"
	SET tQuery = "SELECT ID_COMPANY_FK, ID_ORDER_PK, NUM_ORDER, NUM_PAC_ORDER,"_
					 " COD_ITEM, COD_ESTAB, TO_CHAR (DATE_ORDER ,  ' ddmmyyyy ') AS DATE_ORDER , QTY_PARC, QTY_REC,"_
                     " TO_CHAR (DATE_EXP , ' ddmmyyyy ')AS DATE_EXP , ID_SUPPLIER, VAL_UNIT, NUM_REQ,"_ 
                     " TO_CHAR (DATE_REQ , ' ddmmyyyy ')AS DATE_REQ FROM VW_ERP_PURCHASE_ORDER"_
					 " WHERE COD_ESTAB = ?"
	SET tSC = ..InsertValues(tViewName,tQuery,0)
	
		//Insere informações da view: VW_ERP_PURCHASE_ORDER_V2 - LEGADO
	SET tViewName	= "VW_ERP_PURCHASE_ORDER_V2"
	SET tQuery = "SELECT ID_COMPANY_FK, ID_ORDER_PK, NUM_ORDER, NUM_PAC_ORDER,"_
					 " COD_ITEM, COD_ESTAB, TO_CHAR (DATE_ORDER ,  ' ddmmyyyy ') AS DATE_ORDER , QTY_PARC, QTY_REC,"_
                     " TO_CHAR (DATE_EXP , ' ddmmyyyy ')AS DATE_EXP , ID_SUPPLIER, VAL_UNIT, NUM_REQ,"_ 
                     " TO_CHAR (DATE_REQ , ' ddmmyyyy ')AS DATE_REQ FROM VW_ERP_PURCHASE_ORDER"
	SET tSC = ..InsertValues(tViewName,tQuery,1)
	
	
	//Insere informações da view: VW_ERP_PURCHASE_REQ_V2 - SOUL
	SET tViewName	= "VW_ERP_PURCHASE_REQ_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, ID_COMPANY_FK, COD_ESTAB, ID_REQ_PK, NUM_REQ, "_ 
                     "TO_CHAR (DATE_REQ,' ddmmyyyy ') AS DATE_REQ, COD_ITEM, QTY_PARC, TO_CHAR (DATE_EXP,' ddmmyyyy ') AS DATE_EXP "_
					 "FROM VW_ERP_PURCHASE_REQ"_
					 " WHERE COD_ESTAB = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
	//Insere informações da view: VW_ERP_PURCHASE_REQ_V2 - LEGADO
	SET tViewName	= "VW_ERP_PURCHASE_REQ_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, ID_COMPANY_FK, COD_ESTAB, ID_REQ_PK, NUM_REQ, "_ 
                     "TO_CHAR (DATE_REQ,' ddmmyyyy ') AS DATE_REQ, COD_ITEM, QTY_PARC, TO_CHAR (DATE_EXP,' ddmmyyyy ') AS DATE_EXP "_
					 "FROM VW_ERP_PURCHASE_REQ"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	
	
	//Insere informações da view: VW_ERP_INVOICE_V2 - SOUL
	SET tViewName	= "VW_ERP_INVOICE_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, NUM_INVOICE, ID_INVOICE_PK, ID_SUPPLIER, COD_ITEM, TO_CHAR (DATE_INVOICE , ' ddmmyyyy ' )AS DATE_INVOICE,"_
                     "TO_CHAR (DATE_INVOICE_RECEIVED, ' ddmmyyyy ') AS DATE_INVOICE_RECEIVED, QTY_INVOICE, VAL_UNIT_INVOICE, NUM_ORDER"_
                     ",TO_CHAR (DATE_ORDER,' ddmmyyyy ') AS DATE_ORDER,TO_CHAR  (DATE_ORDER_EXP,' ddmmyyyy ') AS DATE_ORDER_EXP"_ 
                     ",QTY_ORDER, VAL_UNIT_ORDER, NUM_REQ, TO_CHAR (DATE_REQ,' ddmmyyyy ') AS DATE_REQ , TO_CHAR (DATE_REQ_EXP,' ddmmyyyy ') AS DATE_REQ_EXP ,"_
                     " QTY_REQ FROM VW_ERP_INVOICE"_
					 " WHERE COD_ESTAB = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
	//Insere informações da view: VW_ERP_INVOICE_V2
	SET tViewName	= "VW_ERP_INVOICE_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, NUM_INVOICE, ID_INVOICE_PK, ID_SUPPLIER, COD_ITEM, TO_CHAR (DATE_INVOICE , ' ddmmyyyy ' )AS DATE_INVOICE,"_
                     "TO_CHAR (DATE_INVOICE_RECEIVED, ' ddmmyyyy ') AS DATE_INVOICE_RECEIVED, QTY_INVOICE, VAL_UNIT_INVOICE, NUM_ORDER"_
                     ",TO_CHAR (DATE_ORDER,' ddmmyyyy ') AS DATE_ORDER,TO_CHAR  (DATE_ORDER_EXP,' ddmmyyyy ') AS DATE_ORDER_EXP"_ 
                     ",QTY_ORDER, VAL_UNIT_ORDER, NUM_REQ, TO_CHAR (DATE_REQ,' ddmmyyyy ') AS DATE_REQ , TO_CHAR (DATE_REQ_EXP,' ddmmyyyy ') AS DATE_REQ_EXP ,"_
                     " QTY_REQ FROM VW_ERP_INVOICE"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	
	
	
	//Insere informações da view: VW_ERP_SUPPLIER_V2 - SOUL
	SET tViewName	= "VW_ERP_SUPPLIER_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, ID_COMPANY_FK, ID_SUPPLIER_PK, COD_SUPPLIER, desc_supplier,"_ 
					 " SUPPLIER_CONTACT_NAME, EMAIL_SUPPLIER FROM VW_ERP_SUPPLIER"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
		//Insere informações da view: VW_ERP_SUPPLIER_V2 - LEGADO
	SET tViewName	= "VW_ERP_SUPPLIER_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, ID_COMPANY_FK, ID_SUPPLIER_PK, COD_SUPPLIER, desc_supplier,"_ 
					 " SUPPLIER_CONTACT_NAME, EMAIL_SUPPLIER FROM VW_ERP_SUPPLIER"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	
	
	
	//Insere informações da view: VW_ERP_LOCAL_V2 - SOUL
	SET tViewName	= "VW_ERP_LOCAL_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK, COD_LOCAL_PK, DESC_LOCAL FROM VW_ERP_LOCAL "_
					 " WHERE COD_ESTAB_PK = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
	//Insere informações da view: VW_ERP_LOCAL_V2 - LEGADO
	SET tViewName	= "VW_ERP_LOCAL_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB_PK, COD_LOCAL_PK, DESC_LOCAL FROM VW_ERP_LOCAL "
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)

	
	//Insere informações da view: VW_ERP_RESERVE_V2 - SOUL
	SET tViewName	= "VW_ERP_RESERVE_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, ID_RESERVE_PK, COD_ITEM,"_ 
					 "COD_LOCAL, TO_CHAR (DATE_REQ, 'ddmmyyyy ') AS DATE_REQ, QTY_REQ, TYPE_RESERVE_PK,"_ 
					 "OBSERVATION FROM VW_ERP_RESERVE"_
					 " WHERE COD_ESTAB = ?"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)

	//Insere informações da view: VW_ERP_RESERVE_V2 - LEGADO
	SET tViewName	= "VW_ERP_RESERVE_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, ID_RESERVE_PK, COD_ITEM,"_ 
					 "COD_LOCAL, TO_CHAR (DATE_REQ, 'ddmmyyyy ') AS DATE_REQ, QTY_REQ, TYPE_RESERVE_PK,"_ 
					 "OBSERVATION FROM VW_ERP_RESERVE"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	
		
	//Insere informações da view: VW_ERP_TRANSACTION_IN_V2 - SOUL
	SET tViewName	= "VW_ERP_TRANSACTION_IN_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, COD_ITEM, TO_CHAR(DATE_TRANS_PK , ' ddmmyyyy ') AS DATE_TRANS_PK,"_
						 "QTY_TRANS FROM VW_ERP_TRANSACTION_IN"_
					 " WHERE COD_ESTAB = ?"	
	SET tSC 		= ..InsertValues(tViewName,tQuery, 0)
	
	//Insere informações da view: VW_ERP_TRANSACTION_IN_V2 - LEGADO
	SET tViewName	= "VW_ERP_TRANSACTION_IN_V2"
	SET tQuery 		= "SELECT ID_COMPANY_FK, COD_ESTAB, COD_ITEM, TO_CHAR(DATE_TRANS_PK , ' ddmmyyyy ') AS DATE_TRANS_PK,"_
						 "QTY_TRANS FROM VW_ERP_TRANSACTION_IN"
	SET tSC 		= ..InsertValues(tViewName,tQuery, 1)
	 
	QUIT tSC
}

Storage Default
{
<Data name="ViewMvQueryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ViewMV</Value>
</Value>
<Value name="3">
<Value>Legacy</Value>
</Value>
<Value name="4">
<Value>Query</Value>
</Value>
</Data>
<DataLocation>^ACSC.ConsumoDiA60D.ViewMvQueryD</DataLocation>
<DefaultData>ViewMvQueryDefaultData</DefaultData>
<IdLocation>^ACSC.ConsumoDiA60D.ViewMvQueryD</IdLocation>
<IndexLocation>^ACSC.ConsumoDiA60D.ViewMvQueryI</IndexLocation>
<StreamLocation>^ACSC.ConsumoDiA60D.ViewMvQueryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
