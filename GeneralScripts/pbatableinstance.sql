USE VLT_AX500105_P
GO

--SELECT * FROM PURCHLINE pl
--JOIN PURCHTABLE pt ON (pl.PURCHID = pt.PURCHID AND pl.DATAAREAID = pt.DATAAREAID)
--WHERE pl.DATAAREAID = '100'
--AND pl.ITEMID LIKE 'div%'
--AND pt.ORDERACCOUNT = '32010'
--AND pt.CREATEDDATETIME	>= DATETIMEFROMPARTS(2020, 1, 1, 0, 0, 0, 0)
--ORDER BY pl.CREATEDDATETIME DESC


--SELECT * FROM salestable st
--WHERE st.SALESTAKER = 'hum'

--SELECT sl.salesid, sl.ITEMID, sl.LINEPERCENT, sl.NVKLZSONDERRABATT FROM SALESLINE sl
--WHERE sl.DATAAREAID = '100'
--AND sl.ITEMID = 'PR�K'
--AND (sl.LINEPERCENT > 0 OR  sl.NVKLZSONDERRABATT > 0)
--AND sl.SALESQTY > 0


SELECT
	sl.SALESID,
	sl.ITEMID,
	sl.INVENTTRANSID,
	sl.SALESQTY,
	pbaTi.VALUE AS 'Breite',
	pbaTiAusl.VALUE AS 'Ausladung'
FROM SALESLINE sl
JOIN PBATABLEINSTANCE pbaTi ON (pbaTi.INVENTTRANSID = sl.INVENTTRANSID AND pbaTi.PBAPREPOSTVALUE = 1 AND pbaTi.VARIABLE = 'Breite')
JOIN PBATABLEINSTANCE pbaTiAusl ON (pbaTiAusl.INVENTTRANSID = sl.INVENTTRANSID AND pbaTiAusl.PBAPREPOSTVALUE = 1 AND pbaTiAusl.VARIABLE = 'GM_IBAusl')
WHERE sl.DATAAREAID = '100'
	AND (sl.ITEMID = 'Luna1' OR sl.ITEMID = 'Luna2' OR sl.ITEMID = 'Luna-FS')
	AND sl.CREATEDDATETIME >= DATETIMEFROMPARTS(2020, 1, 1, 0, 0, 0, 0)
	--AND sl.INVENTTRANSID = '37841597'
	--AND pbaTi.VALUE LIKE '6%'



