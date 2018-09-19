/// 
Class ACSC.ConsumoDiario.BP.HSC.Process Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{
///Xdata dos Mapas em XML
/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ACSC.ConsumoDiario.BP.Mensagem.Request' response='ACSC.ConsumoDiario.BP.Mensagem.Response' height='5000' width='2000' layout='manual' >
<context>
<property name='INVENTORYStatus' type='%Status' instantiate='0' />
<property name='INVOICEStatus' type='%Status' instantiate='0' />
<property name='LOCALStatus' type='%Status' instantiate='0' />
<property name='PORDERStatus' type='%Status' instantiate='0' />
<property name='PREQStatus' type='%Status' instantiate='0' />
<property name='RESERVEStatus' type='%Status' instantiate='0' />
<property name='SKUStatus' type='%Status' instantiate='0' />
<property name='SUPPLIERStatus' type='%Status' instantiate='0' />
<property name='TRANSINStatus' type='%Status' instantiate='0' />
<property name='TRANSOUTDAYStatus' type='%Status' instantiate='0' />
<property name='TRANSOUTMONTHStatus' type='%Status' instantiate='0' />
<property name='JSONArray' type='%Stream.GlobalCharacter' initialexpression='""' collection='list' instantiate='0' />
<property name='Count' type='%Integer' instantiate='0' />
<property name='CompanyId' type='%Integer' instantiate='0' />
<property name='INVENTORYSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='INVOICESnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='LOCALSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='PORDERSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='PURCHASEReqSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='RESERVESnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='SKUSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='SUPPLIERSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='TRANSINSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='TRANSOutDaySnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='TRANSOutMonthSnapShotId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='SessionStatus' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Credential' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xpos='200' ypos='150' xend='200' yend='4600' >
<assign name="Update Session" property="context.SessionStatus" value="##class(Monitor.Controller.Issue).InsertSession(request.IdIssue,$get($$$JobSessionId))" action="set" xpos='200' ypos='250' />
<assign name="Credencial" property="context.Credential" value="&quot;Rest HSC&quot;" action="set" xpos='200' ypos='350' >
<annotation><![CDATA[Credencial REST]]></annotation>
</assign>
<sequence name='Import MV CSSJ' xpos='200' ypos='450' xend='200' yend='1450' >
<call name='Import ERP_INVENTORY' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_INVENTORY_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.INVENTORYStatus" value="callresponse.Status" action="set" />
<assign property="context.INVENTORYSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_INVOICE' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='350' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_INVOICE_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.INVOICEStatus" value="callresponse.Status" action="set" />
<assign property="context.INVOICESnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_LOCAL' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='450' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_LOCAL_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.LOCALStatus" value="callresponse.Status" action="set" />
<assign property="context.LOCALSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_PURCHASE_ORDER' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='550' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_PURCHASE_ORDER_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.PORDERStatus" value="callresponse.Status" action="set" />
<assign property="context.PORDERSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_PURCHASE_REQ' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='650' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_PURCHASE_REQ_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.PREQStatus" value="callresponse.Status" action="set" />
<assign property="context.PURCHASEReqSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_RESERVE' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='750' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_RESERVE_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.RESERVEStatus" value="callresponse.Status" action="set" />
<assign property="context.RESERVESnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_SKU' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='850' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_SKU_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.SKUStatus" value="callresponse.Status" action="set" />
<assign property="context.SKUSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_SUPPLIER' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='950' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_SUPPLIER_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.SUPPLIERStatus" value="callresponse.Status" action="set" />
<assign property="context.SUPPLIERSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_TRANSIN' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='1050' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_TRANSACTION_IN_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.TRANSINStatus" value="callresponse.Status" action="set" />
<assign property="context.TRANSINSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_TRANSOUTDAY' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='1150' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_TRANSACTION_OUT_DAY_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.TRANSOUTDAYStatus" value="callresponse.Status" action="set" />
<assign property="context.TRANSOutDaySnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<call name='Import ERP_TRANSOUTMONTH' target='MVSOUL CORP SQL Connector' async='1' xpos='200' ypos='1250' >
<request type='ACSC.ConsumoDiario.BO.SQL.MV.Request' >
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.ViewMV" value="&quot;VW_ERP_TRANSACTION_OUT_MONTH_V2&quot;" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Legacy" value="request.Legacy" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.SQL.MV.Response' >
<assign property="context.TRANSOUTMONTHStatus" value="callresponse.Status" action="set" />
<assign property="context.TRANSOutMonthSnapShotId" value="callresponse.IdSnapShot" action="set" />
</response>
</call>
<sync name='Sync' calls='Import ERP_INVENTORY,Import ERP_INVOICE,Import ERP_LOCAL,Import ERP_PURCHASE_ORDER,Import ERP_PURCHASE_REQ,Import ERP_RESERVE,Import ERP_SKU,Import ERP_SUPPLIER,Import ERP_TRANSIN,Import ERP_TRANSOUTDAY,Import ERP_TRANSOUTMONTH' type='all' xpos='200' ypos='1350' />
</sequence>
<sequence name='SKU REST' xpos='200' ypos='550' xend='200' yend='1250' >
<if name='Check SKU' condition='context.SKUStatus' xpos='200' ypos='250' xend='200' yend='1050' >
<true>
<call name='Prepare JSON SKU' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPSKUReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_SKU_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.SKUSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.SKUStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check SKU' condition='context.SKUStatus' xpos='335' ypos='500' xend='335' yend='950' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST SKU' condition='context.JSONArray.Count() &lt; context.Count' xpos='470' ypos='850' xend='200' yend='450' >
<call name='SKU REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_SKU_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.SKUStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.SKUStatus" action="set" xpos='200' ypos='1150' />
</sequence>
<if name='Check SKU' condition='context.SKUStatus' xpos='200' ypos='650' xend='200' yend='4400' >
<true>
<sequence name='SUPPLIER REST' xpos='335' ypos='800' xend='200' yend='1150' >
<if name='Check SUPPLIER' condition='context.SUPPLIERStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON SUPPLIER' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPSUPPLIERReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_SUPPLIER_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.SUPPLIERSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.SUPPLIERStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check SUPPLIER' condition='context.SUPPLIERStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST SUPPLIER' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='SUPPLIER REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_SUPPLIER_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.SUPPLIERStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.SUPPLIERStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check SUPPLIER' condition='context.SUPPLIERStatus' xpos='335' ypos='900' xend='335' yend='4300' >
<true>
<sequence name='LOCAL REST' xpos='470' ypos='1050' xend='200' yend='1150' >
<if name='Check LOCAL' condition='context.LOCALStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON LOCAL' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPLOCALReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_LOCAL_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.LOCALSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.LOCALStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check LOCAL' condition='context.LOCALStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST LOCAL' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='LOCAL REST' target='Plannexo Rest Connector' async='0' xpos='196' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_LOCAL_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.LOCALStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.LOCALStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check LOCAL' condition='context.LOCALStatus' xpos='470' ypos='1150' xend='470' yend='4200' >
<true>
<sequence name='INVOICE REST' xpos='605' ypos='1300' xend='200' yend='1150' >
<if name='Check INVOICE' condition='context.INVOICEStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON INVOICE' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPINVOICEReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_INVOICE_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.INVOICESnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.INVOICEStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check INVOICE' condition='context.INVOICEStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST INVOICE' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='INVOICE REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_INVOICE_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.INVOICEStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.INVOICEStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check INVOICE' condition='context.INVOICEStatus' xpos='605' ypos='1400' xend='605' yend='4100' >
<true>
<sequence name='INVENTORY REST' xpos='740' ypos='1550' xend='200' yend='1150' >
<if name='Check INVENTORY' condition='context.INVENTORYStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON INVENTORY' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPINVENTORYReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_INVENTORY_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.INVENTORYSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.INVENTORYStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check INVENTORY' condition='context.INVENTORYStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST INVENTORY' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='INVENTORY REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_INVENTORY_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.INVENTORYStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.INVENTORYStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check INVENTORY' condition='context.INVOICEStatus' xpos='740' ypos='1650' xend='740' yend='4000' >
<true>
<sequence name='PORDER REST' xpos='875' ypos='1800' xend='200' yend='1150' >
<if name='Check PORDER' condition='context.PORDERStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON PORDER' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPPURCHASEORDERReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_PURCHASE_ORDER_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.PORDERSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.PORDERStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check PORDER' condition='context.PORDERStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST PORDER' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='PORDER REST' target='Plannexo Rest Connector' async='0' xpos='199' ypos='254' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_PURCHASE_ORDER_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.PORDERStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.PORDERStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check PORDER' condition='context.PORDERStatus' xpos='875' ypos='1900' xend='875' yend='3900' >
<true>
<sequence name='PREQ REST' xpos='1010' ypos='2050' xend='200' yend='1150' >
<if name='Check PREQ' condition='context.PREQStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON PREQ' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPPURCHASEREQReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_PURCHASE_REQ_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.PURCHASEReqSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.PREQStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check PREQ' condition='context.PREQStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST PREQ' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='PREQ REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_PURCHASE_REQ_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.PREQStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.PREQStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check PREQ' condition='context.PREQStatus' xpos='1010' ypos='2150' xend='1010' yend='3800' >
<true>
<sequence name='RESERVE REST' xpos='1145' ypos='2300' xend='200' yend='1150' >
<if name='Check RESERVE' condition='context.RESERVEStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON RESERVE' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPRESERVEReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_RESERVE_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.RESERVESnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.RESERVEStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check RESERVE' condition='context.RESERVEStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST RESERVE' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='RESERVE REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_RESERVE_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.RESERVEStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.RESERVEStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check RESERVE' condition='context.RESERVEStatus' xpos='1145' ypos='2400' xend='1145' yend='3700' >
<true>
<sequence name='TRANSIN REST' xpos='1280' ypos='2550' xend='200' yend='1150' >
<if name='Check TRANSIN' condition='context.TRANSINStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON TRANSIN' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPTRANSACTIONINReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_IN_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.TRANSINSnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.TRANSINStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check TRANSIN' condition='context.TRANSINStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST TRANSIN' condition='context.JSONArray.Count() &lt; context.Count' xpos='475' ypos='761' xend='200' yend='450' >
<call name='TRANSIN REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_IN_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.TRANSINStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.TRANSINStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check TRANSIN' condition='context.TRANSINStatus' xpos='1280' ypos='2650' xend='1280' yend='3600' >
<true>
<sequence name='TRANSOUTDAY REST' xpos='1415' ypos='2800' xend='200' yend='1150' >
<if name='Check TRANSOUTDAY' condition='context.TRANSOUTDAYStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON TRANSOUTDAY' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPTRANSACTIONOUTDAYReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_OUT_DAY_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.TRANSOutDaySnapShotId" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.TRANSOUTDAYStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check TRANSOUTDAY' condition='context.TRANSOUTDAYStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST TRANSOUTDAY' condition='context.JSONArray.Count()  &lt; context.Count' xpos='471' ypos='759' xend='200' yend='450' >
<call name='TRANSOUTDAY REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_OUT_DAY_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.TRANSOUTDAYStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.TRANSOUTDAYStatus" action="set" xpos='164' ypos='1052' />
</sequence>
<if name='Check TRANSOUTDAY' condition='context.TRANSOUTDAYStatus' xpos='1415' ypos='2900' xend='1415' yend='3500' >
<true>
<sequence name='TRANSOUTMONTH REST' xpos='1550' ypos='3050' xend='200' yend='1150' >
<if name='Check TRANSOUTMONTH' condition='context.TRANSOUTMONTHStatus' xpos='200' ypos='250' xend='200' yend='950' >
<true>
<call name='Prepare JSON TRANSOUTMONTH' target='ACSC Utils' async='0' xpos='335' ypos='400' >
<request type='ACSC.ConsumoDiario.BO.Utils.ERPTRANSACTIONOUTMONTHReq' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_OUT_MONTH_V2&quot;" action="set" />
<assign property="callrequest.IDCOMPANYFK" value="request.IdCompany" action="set" />
<assign property="callrequest.IdSnapShot" value="context.TRANSOutMonthSnapShotId" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.Utils.Response' >
<assign property="context.JSONArray" value="callresponse.ResultArray" action="set" />
<assign property="context.TRANSOUTMONTHStatus" value="callresponse.Status" action="set" />
</response>
</call>
<if name='Check TRANSOUTMONTH' condition='context.TRANSOUTMONTHStatus' xpos='335' ypos='500' xend='335' yend='850' >
<true>
<assign name="Start Count" property="context.Count" value="1" action="set" xpos='470' ypos='650' />
<until name='Send REST TRANSOUTMONTH' condition='context.JSONArray.Count()  &lt; context.Count' xpos='470' ypos='750' xend='200' yend='450' >
<call name='TRANSOUTMONTH REST' target='Plannexo Rest Connector' async='0' xpos='200' ypos='250' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ViewExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.ViewName" value="&quot;VW_ERP_TRANSACTION_OUT_MONTH_V2&quot;" action="set" />
<assign property="callrequest.ResultJSON" value="context.JSONArray.GetAt(context.Count)" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
<assign property="callrequest.Credential" value="context.Credential" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ViewExportResponse' >
<assign property="context.TRANSOUTMONTHStatus" value="callresponse.Status" action="set" />
</response>
</call>
<assign name="Increment" property="context.Count" value="context.Count + 1" action="set" xpos='200' ypos='350' />
</until>
</true>
</if>
</true>
</if>
<assign name="Reponse Status" property="response.Status" value="context.TRANSOUTMONTHStatus" action="set" xpos='200' ypos='1050' />
</sequence>
<if name='Check TRANSOUTMONTH' condition='context.TRANSOUTMONTHStatus' xpos='1550' ypos='3150' xend='1550' yend='3400' >
<true>
<call name='SetCount REST' target='Plannexo Rest Connector' async='0' xpos='1685' ypos='3300' >
<request type='ACSC.ConsumoDiario.BO.HTTP.ValidatorExportRequest' >
<assign property="callrequest.IdIssue" value="request.IdIssue" action="set" />
<assign property="callrequest.StartTS" value="request.StartTs" action="set" />
<assign property="callrequest.IdCompany" value="request.IdCompany" action="set" />
</request>
<response type='ACSC.ConsumoDiario.BO.HTTP.ValidatorExportResponse' >
<assign property="response.Status" value="callresponse.Status" action="set" />
</response>
</call>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
</true>
</if>
<code name='Clear SnapShot' xpos='200' ypos='4500' >
<![CDATA[
             DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.INVENTORYSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.INVOICESnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.LOCALSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.PORDERSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.PURCHASEReqSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.RESERVESnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.SKUSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.SUPPLIERSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.TRANSINSnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.TRANSOutDaySnapShotId)
 DO ##Class(ACSC.Utils.Convert).PurgeSnapShotById(context.TRANSOutMonthSnapShotId)

        ]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
