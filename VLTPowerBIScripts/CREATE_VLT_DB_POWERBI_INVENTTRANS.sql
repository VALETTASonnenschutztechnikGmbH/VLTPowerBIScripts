USE [VLT_AX500105_P]
GO

IF EXISTS (
		SELECT 1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_INVENTTRANS'
			AND type = 'V'
	)
	DROP VIEW [dbo].[VLT_DB_POWERBI_INVENTTRANS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_INVENTTRANS]
AS
	SELECT [ITEMID],
		   [STATUSISSUE],
		   [DATEPHYSICAL],
		   [QTY],
		   [COSTAMOUNTPOSTED],
		   [CURRENCYCODE],
		   [TRANSTYPE],
		   [TRANSREFID],
		   [INVOICEID],
		   [VOUCHER],
		   [DATEEXPECTED],
		   [DATEFINANCIAL],
		   [COSTAMOUNTPHYSICAL],
		   [INVENTTRANSID],
		   [STATUSRECEIPT],
		   [PACKINGSLIPRETURNED],
		   [INVOICERETURNED],
		   [PACKINGSLIPID],
		   [VOUCHERPHYSICAL],
		   [COSTAMOUNTADJUSTMENT],
		   [QTYSETTLED],
		   [COSTAMOUNTSETTLED],
		   [VALUEOPEN],
		   [DIRECTION],		   
		   [DATECLOSED],
		   [DATEINVENT],
		   [CUSTVENDAC],
		   [DATAAREAID],
		   INVENTTRANS.INVENTTRANSID + INVENTTRANS.DATAAREAID AS FKInventTransId,
		   INVENTTRANS.INVENTTRANSID + INVENTTRANS.INVENTDIMID + INVENTTRANS.RECID + INVENTTRANS.DATAAREAID AS PKInventTransId
	FROM [dbo].[INVENTTRANS]
	WHERE [INVENTTRANS].DATAAREAID = '100'
	AND INVENTTRANS.DATEPHYSICAL > DATETIMEFROMPARTS(YEAR(GETDATE())-4, 1, 1, 0, 0, 0, 0)
GO