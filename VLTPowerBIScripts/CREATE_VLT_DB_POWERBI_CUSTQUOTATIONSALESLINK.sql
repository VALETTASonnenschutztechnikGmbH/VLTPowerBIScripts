USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_CUSTINVOICEJOUR]    Script Date: 29.05.2018 15:51:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT
			1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_CUSTQUOTATIONSALESLINK'
			AND type = 'v'
	)
	DROP VIEW VLT_DB_POWERBI_CUSTQUOTATIONSALESLINK;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_CUSTQUOTATIONSALESLINK]
AS
	SELECT
		CUSTQUOTATIONSALESLINK.[QUOTATIONID],
		CUSTQUOTATIONSALESLINK.[QUOTATIONDATE],
		CUSTQUOTATIONSALESLINK.SALESID,
		CUSTQUOTATIONSALESLINK.ORIGSALESID,
		CUSTQUOTATIONSALESLINK.ORIGQUOTATIONID,
		CUSTQUOTATIONSALESLINK.SALESID + CUSTQUOTATIONSALESLINK.QUOTATIONID + CONVERT(VARCHAR, CUSTQUOTATIONSALESLINK.QUOTATIONDATE, 112) + CUSTQUOTATIONSALESLINK.DATAAREAID AS FKCustQuotationJour, 
		CUSTQUOTATIONSALESLINK.ORIGSALESID + CUSTQUOTATIONSALESLINK.QUOTATIONID + CONVERT(VARCHAR, CUSTQUOTATIONSALESLINK.QUOTATIONDATE, 112) + CUSTQUOTATIONSALESLINK.DATAAREAID AS PKCustQuotationJour, 
		CUSTQUOTATIONSALESLINK.ORIGQUOTATIONID + CUSTQUOTATIONSALESLINK.DATAAREAID AS FKSalesQuotationTable			
	FROM dbo.CUSTQUOTATIONSALESLINK AS CUSTQUOTATIONSALESLINK
	WHERE CUSTQUOTATIONSALESLINK.DATAAREAID = '100'
		AND CUSTQUOTATIONSALESLINK.QUOTATIONDATE > DATETIMEFROMPARTS(YEAR(GETDATE()) - 3, 1, 1, 0, 0, 0, 0)
GO