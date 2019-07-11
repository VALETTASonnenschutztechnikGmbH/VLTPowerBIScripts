USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_SalesTable]    Script Date: 29.05.2018 15:52:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT 1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_SALESTABLE'
			AND TYPE = 'V'
	)
	DROP VIEW VLT_DB_POWERBI_SALESTABLE;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_SALESTABLE]
AS
	SELECT SALESTABLE.SALESID,
		   SALESTABLE.SALESNAME,
		   SALESTABLE.CUSTACCOUNT,
		   SALESTABLE.INVOICEACCOUNT,
		   SALESTABLE.DELIVERYDATE,
		   SALESTABLE.DELIVERYADDRESS,
		   SALESTABLE.DELIVERYCOUNTRYREGIONID,
		   SALESTABLE.DELIVERYCOUNTY,
		   SALESTABLE.DELIVERYCITY,
		   SALESTABLE.DELIVERYZIPCODE,
		   SALESTABLE.DELIVERYSTREET,
		   SALESTABLE.SALESGROUP,
		   SALESTABLE.DELIVERYNAME,
		   SALESTABLE.SALESPOOLID,
		   SALESTABLE.ENDDISC,
		   SALESTABLE.CREATEDDATETIME,
		   SALESTABLE.SALESSTATUS,
		   (
			   SELECT CASE
					   WHEN SALESTABLE.CURRENCYCODE = 'ATS' AND SUM(dbo.SALESLINE.LineAmount) != 0 THEN SUM(dbo.SALESLINE.LineAmount) / 13.7603
					   ELSE SUM(dbo.SALESLINE.LineAmount)
				   END
			   FROM SALESLINE
			   WHERE SALESLINE.SALESID = SALESTABLE.SALESID
				   AND SALESLINE.DATAAREAID = SALESTABLE.DATAAREAID
		   ) AS TotalAmount,
		   CASE
			   WHEN (
					   SELECT CUSTINVOICESALESLINK.SALESID AS CountId
					   FROM dbo.CUSTINVOICESALESLINK
					   WHERE CUSTINVOICESALESLINK.ORIGSALESID = SALESTABLE.SALESID
						   AND CUSTINVOICESALESLINK.DATAAREAID = SALESTABLE.DATAAREAID
						   AND CUSTINVOICESALESLINK.SALESID != SALESTABLE.SALESID
					   GROUP BY dbo.CUSTINVOICESALESLINK.SALESID
				   ) IS NULL THEN SALESTABLE.SALESID
			   ELSE (
					   SELECT CUSTINVOICESALESLINK.SALESID AS CountId
					   FROM dbo.CUSTINVOICESALESLINK
					   WHERE CUSTINVOICESALESLINK.ORIGSALESID = SALESTABLE.SALESID
						   AND CUSTINVOICESALESLINK.DATAAREAID = SALESTABLE.DATAAREAID
						   AND CUSTINVOICESALESLINK.SALESID != SALESTABLE.SALESID
					   GROUP BY dbo.CUSTINVOICESALESLINK.SALESID
				   )
		   END AS InvoicedSalesId,
		   SALESTABLE.MAINSALESID_ADDON,
		   SALESTABLE.MAINSALESORDER_ADDON,
		   CASE
			   WHEN SALESTABLE.MAINSALESORDER_ADDON = 0 THEN 'Nein'
			   WHEN SALESTABLE.MAINSALESORDER_ADDON = 1 THEN 'Ja'
		   END AS MAINSALESORDER_ADDON_DESC,
		   SALESTABLE.NVKLZFERTDATUM AS Fertiggemeldet,
		   SALESTABLE.NVPROJECTID AS Projektnummer,
		   CASE
			   WHEN SALESTABLE.SALESSTATUS = 0 THEN 'Kein'
			   WHEN SALESTABLE.SALESSTATUS = 1 THEN 'Offener Auftrag'
			   WHEN SALESTABLE.SALESSTATUS = 2 THEN 'Geliefert'
			   WHEN SALESTABLE.SALESSTATUS = 3 THEN 'Fakturiert'
			   WHEN SALESTABLE.SALESSTATUS = 4 THEN 'Storniert'
		   END AS SalesStatusDesc,
		   SALESTABLE.SALESGROUP + SALESTABLE.DATAAREAID AS FKSalesGroup,
		   SALESTABLE.SALESID + SALESTABLE.DATAAREAID AS FKSalesId,
		   SALESTABLE.CUSTACCOUNT + SALESTABLE.DATAAREAID AS FKCustAccount,
		   SALESTABLE.INVOICEACCOUNT + SALESTABLE.DATAAREAID AS FKInvoiceAccount,
		   SALESTABLE.MAINSALESID_ADDON + SALESTABLE.DATAAREAID AS FKMainSalesOrder,
		   SALESTABLE.NVPROJECTID + SALESTABLE.DATAAREAID AS FKProjectID,
		   SALESTABLE.VLT_SALESORDERPRODREGSTATUS,
		   CASE
			   WHEN SALESTABLE.VLT_SALESORDERPRODREGSTATUS = 0 THEN 'Nicht angemeldet'
			   WHEN SALESTABLE.VLT_SALESORDERPRODREGSTATUS = 1 THEN 'In Produktion'
			   WHEN SALESTABLE.VLT_SALESORDERPRODREGSTATUS = 2 THEN 'Fertiggemeldet'
			   WHEN SALESTABLE.VLT_SALESORDERPRODREGSTATUS = 3 THEN 'Für Produktion freigegeben (AB)'
			   ELSE 'Für Produktion gesperrt!'
		   END AS ProdStatus,
		   SALESTABLE.CURRENCYCODE,
		   SALESTABLE.DATAAREAID,
		   SALESPOOL.SALESPOOLID + ' (' + SALESPOOL.NAME + ')' AS Pool
	--(select stuff((select  ', ' + convert(varchar,FORMAT(sum(salesLine.SalesQty),'###,###,###.00','de-de')) + ' Stk. ' +SALESLINE.ITEMID from [dbo].[SALESLINE] 
	--	where salesLine.SALESID = SalesTable.SALESID 
	--	AND SalesLine.SalesQty != 0 
	--	AND SalesLine.ITEMPBAID	!= ''
	--	group by salesLine.itemid 
	--	for xml path ('')), 1, 2, '')) as Produkte
	FROM dbo.SALESTABLE AS SALESTABLE
	LEFT JOIN SALESPOOL AS SALESPOOL ON (SALESPOOL.SALESPOOLID = SALESTABLE.SALESPOOLID AND SALESPOOL.DATAAREAID = SALESTABLE.DATAAREAID)
	WHERE SALESTABLE.DATAAREAID = '100'
		AND SALESTABLE.VLT_ISSALESORDERTEST = 0
		AND SALESTABLE.CREATEDDATETIME > DATETIMEFROMPARTS(YEAR(GETDATE())-4, 3, 1, 0, 0, 0, 0)

GO

