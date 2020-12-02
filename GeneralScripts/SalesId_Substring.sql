USE VLT_AX500105_P
DECLARE @SalesIdCut nvarchar(20);
--DROP TABLE #SalesTableTmp

SELECT st.SALESID,
	CASE
	 WHEN CHARINDEX('/', st.SALESID) > 0 THEN SUBSTRING(st.SALESID,1,CHARINDEX('/', st.SALESID)-1) 
	 WHEN CHARINDEX('PARK', st.SALESID) > 0 THEN SUBSTRING(st.SALESID,CHARINDEX('PARK', st.SALESID)+4,LEN(st.SALESID)) 
	END AS SalesIdCut,
	0 AS SubOrderCount
	/*
	(SELECT COUNT(*) FROM SALESTABLE st1 WHERE st1.SALESID LIKE 
	CASE
	 WHEN CHARINDEX('/', st.SALESID) > 0 THEN SUBSTRING(st.SALESID,1,CHARINDEX('/', st.SALESID)) END + '%') AS SubOrderCount	*/
  INTO #SalesTableTmp
  FROM [dbo].[SALESTABLE] st
  --JOIN SALESTABLE st1 ON (st.SALESID LIKE SAlesIdCut)
  --WHERE st.CREATEDDATETIME	>= DATETIMEFROMPARTS(2014, 1, 1, 0, 0, 0, 0) AND
  --    st.CREATEDDATETIME <= DATETIMEFROMPARTS(2017, 4, 30, 0, 0, 0, 0)

	  SELECT * FROM #SalesTableTmp stt

SELECT SALESIDCUT,
(SELECT COUNT(*) FROM SALESTABLE st1 WHERE st1.SALESID LIKE 
	SALESIDCUT + '/%') AS SubOrderCount
FROM #SalesTableTmp stt
GROUP BY SALESIDCUT


SELECT SALESIDCUT,
 COUNT(*) AS SubOrderCount
FROM #SalesTableTmp stt
GROUP BY SALESIDCUT
ORDER BY SALESIDCUT ASC