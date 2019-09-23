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
		WHERE NAME = 'VLT_DB_POWERBI_CUSTQUOTATIONJOUR'
			AND type = 'v'
	)
	DROP VIEW VLT_DB_POWERBI_CUSTQUOTATIONJOUR;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_CUSTQUOTATIONJOUR]
AS
	SELECT
		[QUOTATIONID],
		[QUOTATIONDATE],
		[SALESID],
		CUSTQUOTATIONJOUR.QUOTATIONDOCNUM,
		CUSTQUOTATIONJOUR.QUOTATIONAMOUNT,
		CUSTQUOTATIONJOUR.SALESID + CUSTQUOTATIONJOUR.QUOTATIONID + CONVERT(VARCHAR, CUSTQUOTATIONJOUR.QUOTATIONDATE, 112) + CUSTQUOTATIONJOUR.DATAAREAID AS FKCUSTQUOTATIONSALESLINK,
		CUSTQUOTATIONJOUR.SALESID + CONVERT(VARCHAR, CUSTQUOTATIONJOUR.QUOTATIONDATE, 112) + CUSTQUOTATIONJOUR.QUOTATIONID + CUSTQUOTATIONJOUR.DATAAREAID AS FKCustQuotationTrans
	FROM dbo.CUSTQUOTATIONJOUR AS CUSTQUOTATIONJOUR
	WHERE CUSTQUOTATIONJOUR.DATAAREAID = '100'
		AND CUSTQUOTATIONJOUR.QUOTATIONDATE > DATETIMEFROMPARTS(YEAR(GETDATE()) - 3, 1, 1, 0, 0, 0, 0)
GO
