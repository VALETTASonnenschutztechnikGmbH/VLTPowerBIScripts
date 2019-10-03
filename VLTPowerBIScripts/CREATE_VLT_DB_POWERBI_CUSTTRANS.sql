USE [VLT_AX500105_P]
GO
/****** Object:  View [dbo].[VLT_DB_POWERBI_CUSTTRANS]    Script Date: 29.05.2018 15:52:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT 1
		FROM SYS.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_CUSTTRANS'
			AND TYPE = 'V'
	)
	DROP VIEW [VLT_DB_POWERBI_CUSTTRANS];
GO

CREATE VIEW [DBO].[VLT_DB_POWERBI_CUSTTRANS]
AS
	SELECT CUSTTRANS.ACCOUNTNUM,
	CUSTTRANS.TRANSDATE,
	CUSTTRANS.VOUCHER,
	CUSTTRANS.INVOICE,
	CUSTTRANS.TXT,
	CUSTTRANS.AMOUNTCUR,
	CUSTTRANS.SETTLEAMOUNTCUR,
	CUSTTRANS.AMOUNTMST,
	CUSTTRANS.SETTLEAMOUNTMST,
	CUSTTRANS.CURRENCYCODE,
	CUSTTRANS.DUEDATE,
	CUSTTRANS.LASTSETTLEVOUCHER,
	CUSTTRANS.LASTSETTLEDATE,
	CUSTTRANS.CLOSED,
	CUSTTRANS.TRANSTYPE,
	CUSTTRANS.ACCOUNTNUM + CUSTTRANS.RECID + CUSTTRANS.DATAAREAID AS FKAccountNumRecId
	FROM dbo.CUSTTRANS AS CustTrans
	WHERE CustTrans.DATAAREAID = '100'
	AND CUSTTRANS.TRANSDATE > DATETIMEFROMPARTS(YEAR(GETDATE())-3, 3, 1, 0, 0, 0, 0)
GO