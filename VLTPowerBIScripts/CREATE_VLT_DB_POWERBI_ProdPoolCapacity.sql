USE [VLT_AX500105_P]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT
			1
		FROM sys.views
		WHERE NAME = 'VLT_DB_POWERBI_ProdPoolCapacity'
			AND TYPE = 'V'
	)
	DROP VIEW VLT_DB_POWERBI_ProdPoolCapacity;
GO

CREATE VIEW [dbo].VLT_DB_POWERBI_ProdPoolCapacity
AS

	SELECT it.PRODPOOLID AS ProdPool,
		SUM(sl.SALESQTY) AS Quantity,
		--sl.SHIPPINGDATECONFIRMED AS DELIVERYDATE,
		DATEPART(WEEK, sl.SHIPPINGDATECONFIRMED) AS DeliveryWeek,
		ppw.PRODWEEKCAPACITY	 AS CapacityPerWeek,
		it.PRODPOOLID+CONVERT(VARCHAR(10),DATEPART(Year, sl.SHIPPINGDATECONFIRMED)*100) + CONVERT(VARCHAR(10),DATEPART(WEEK, sl.SHIPPINGDATECONFIRMED)) AS FKYearWeek 
		FROM SALESLINE sl
	JOIN INVENTTABLE it ON (sl.ITEMID = it.ITEMID AND sl.DATAAREAID = it.DATAAREAID)
	JOIN	 SALESTABLE st ON (sl.SALESID = st.SALESID AND it.DATAAREAID = st.DATAAREAID)
	LEFT JOIN VLT_DB_POWERBI_NvProdPoolWeek ppw ON (it.PRODPOOLID = ppw.PRODPOOLID AND ppw.Weeknumber = DATEPART(WEEK, sl.SHIPPINGDATECONFIRMED) AND ppw.YearStart = DATEPART(Year, sl.SHIPPINGDATECONFIRMED))
	WHERE sl.DATAAREAID	= '100'
	AND DATEPART(YEAR, sl.SHIPPINGDATECONFIRMED) = DATEPART(YEAR, GETDATE())
	AND st.SALESSTATUS	< 2
	GROUP BY it.PRODPOOLID, DATEPART(WEEK, sl.SHIPPINGDATECONFIRMED), DATEPART(Year, sl.SHIPPINGDATECONFIRMED), ppw.PRODWEEKCAPACITY
GO

