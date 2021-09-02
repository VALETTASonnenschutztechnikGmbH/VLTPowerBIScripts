USE [VLT_AX500105_P]
GO

IF EXISTS (
		SELECT
			1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_WINDREAM_COUNT_INVOICES_SENT'
			AND type = 'V'
	)
	DROP VIEW [VLT_DB_WINDREAM_COUNT_INVOICES_SENT];
GO

/****** Object:  View [dbo].[VLT_DB_PIM_ItemVirtualPath]    Script Date: 10.08.2018 08:56:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VLT_DB_WINDREAM_COUNT_INVOICES_SENT]
AS
	SELECT COUNT(*)	 AS 'Versendet'
	FROM CUSTINVOICEJOUR cij
	JOIN [VMVALMAR01\WINDREAM].[windream60].[dbo].[BaseAttributes] BA ON (BA.[szText28] = cij.INVOICEID)
	WHERE BA.[dwObjectTypeID] = 6
		AND BA.[szText30] = 'Rechnung'
		AND BA.szWM_Store = 'WORK'
		AND cij.EMAILSALESINVOICE_ADDON != ''
		AND BA.[szText32] = 'Versendet'
--AND cij.salesid = '642808/1'
--AND [szText28] = '0572530'
GO

