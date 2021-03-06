USE [VLT_AX500105_P]
GO


IF EXISTS (
		SELECT 1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_INVENTTABLEINFO'
			AND type = 'V'
	)
	DROP VIEW [dbo].[VLT_DB_POWERBI_INVENTTABLEINFO]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VLT_DB_POWERBI_INVENTTABLEINFO]
AS
SELECT INVENTTABLE.[ITEMID] AS Artikelnummer,
	   INVENTTABLE.[ITEMNAME] AS Artikelname,
	   INVENTTABLE.[VLT_PIMITEMNAME] AS 'PIM - Artikelname',
	   INVENTTABLE.[ITEMGROUPID] AS Artikelgruppe,
	   INVENTTABLE.ITEMGROUPID + ' (' + INVENTITEMGROUP.NAME +')' AS Artikelgruppenname,
	   INVENTTABLE.NVBLOCKED	AS Gesperrt,
	  (SELECT MAX(INVENTTRANS.DATEFINANCIAL) 
	  FROM INVENTTRANS	
		WHERE INVENTTRANS.ITEMID = INVENTTABLE.itemid
		AND (INVENTTRANS.TRANSTYPE = '0'
			OR INVENTTRANS.TRANSTYPE = 3
			OR INVENTTRANS.TRANSTYPE = 2)
		AND INVENTTRANS.DATAAREAID = '100') AS 'Letzte Buchung',
		PRICEDISCTABLE.ACCOUNTRELATION	AS Preisgruppe,
		PRICEDISCTABLE.FROMDATE AS 'G�ltig von',
		PRICEDISCTABLE.TODATE AS 'G�ltig bis',
		PRICEDISCTABLE.AMOUNT	AS 'Preis'	
FROM [dbo].[INVENTTABLE]
LEFT JOIN INVENTITEMGROUP AS INVENTITEMGROUP ON (INVENTITEMGROUP.ITEMGROUPID = INVENTTABLE.ITEMGROUPID AND INVENTITEMGROUP.DATAAREAID = INVENTTABLE.DATAAREAID)
LEFT JOIN PRICEDISCTABLE AS PRICEDISCTABLE ON (PRICEDISCTABLE.ITEMRELATION = INVENTTABLE.ITEMID AND PRICEDISCTABLE.DATAAREAID = INVENTTABLE.DATAAREAID)
	WHERE INVENTTABLE.DATAAREAID = '100'
	--AND INVENTTABLE.NVBLOCKED	= 0
	AND PRICEDISCTABLE.ACCOUNTCODE = '1'
GO


