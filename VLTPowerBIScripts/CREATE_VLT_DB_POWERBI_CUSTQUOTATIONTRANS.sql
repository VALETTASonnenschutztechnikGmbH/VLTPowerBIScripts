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
		WHERE NAME = 'VLT_DB_POWERBI_CUSTQUOTATIONTRANS'
			AND type = 'v'
	)
	DROP VIEW VLT_DB_POWERBI_CUSTQUOTATIONTRANS;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_CUSTQUOTATIONTRANS]
AS
	SELECT
		CUSTQUOTATIONTRANS.[QUOTATIONID],
		CUSTQUOTATIONTRANS.[QUOTATIONDATE],
		CUSTQUOTATIONTRANS.[SALESID],
		CUSTQUOTATIONTRANS.ITEMID,
		CUSTQUOTATIONTRANS.QTY,
		CUSTQUOTATIONTRANS.LINEAMOUNT,
		CUSTQUOTATIONTRANS.SALESID + CONVERT(VARCHAR, CUSTQUOTATIONTRANS.QUOTATIONDATE, 112) + CUSTQUOTATIONTRANS.QUOTATIONID +CUSTQUOTATIONTRANS.DATAAREAID AS FKCustQuotationJour
	FROM dbo.CUSTQUOTATIONTRANS AS CUSTQUOTATIONTRANS
	WHERE CUSTQUOTATIONTRANS.DATAAREAID = '100'
		AND CUSTQUOTATIONTRANS.QUOTATIONDATE > DATETIMEFROMPARTS(YEAR(GETDATE()) - 3, 1, 1, 0, 0, 0, 0)
GO