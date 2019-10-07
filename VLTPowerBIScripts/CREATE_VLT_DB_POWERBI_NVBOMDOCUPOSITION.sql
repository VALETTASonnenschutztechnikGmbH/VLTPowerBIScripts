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
		WHERE NAME = 'VLT_DB_POWERBI_NVBOMDOCUPOSITION'
			AND TYPE = 'V'
	)
	DROP VIEW VLT_DB_POWERBI_NVBOMDOCUPOSITION;
GO

CREATE VIEW [DBO].[VLT_DB_POWERBI_NVBOMDOCUPOSITION]
AS
	SELECT
		[PRODUCTID],
		[POSITIONID],
		[LINENUM],
		[VERSIONID],
		[BLOCKED],
		[TXT],
		[CHANGEREQ],
		[CHANGETXT],
		[WIDTHADJ],
		[HEIGHTADJ],
		[DATAAREAID],
		[RECID],
		[BENCHID],
		[RECVERSION],
		[QTY],
		[VALUEX],
		[VALUEY],
		[VALUEZ],
		[VLT_EXPLOREBOM],
		PRODUCTID + DATAAREAID AS FKProductID,
		VERSIONID + PRODUCTID + DATAAREAID AS FKVersionProductID,
		POSITIONID + VERSIONID + PRODUCTID + DATAAREAID AS FKPositionVersionProductID
	FROM [DBO].[NVBOMDOCUPOSITION]
GO