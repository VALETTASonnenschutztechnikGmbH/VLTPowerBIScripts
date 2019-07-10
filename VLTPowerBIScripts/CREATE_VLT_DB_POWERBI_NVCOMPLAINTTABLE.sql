USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_SALESLINE]    Script Date: 23.07.2018 10:30:07 ******/
IF EXISTS (
		SELECT 1
		FROM SYS.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_NVCOMPLAINTTABLE'
			AND TYPE = 'V'
	)
	DROP VIEW [dbo].[VLT_DB_POWERBI_NVCOMPLAINTTABLE]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_NvCOMPLAINTTABLE]    Script Date: 23.07.2018 10:30:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VLT_DB_POWERBI_NVCOMPLAINTTABLE]
AS
	SELECT *
	FROM NVCOMPLAINTTABLE AS ComplaintTable
GO

