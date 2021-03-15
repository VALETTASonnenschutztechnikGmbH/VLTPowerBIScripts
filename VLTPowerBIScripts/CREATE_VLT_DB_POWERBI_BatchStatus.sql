USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_PowerBI_EmplTable]    Script Date: 29.05.2018 15:51:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT
			1
		FROM sys.views
		WHERE NAME = 'VLT_DB_POWERBI_BatchStatus'
			AND type = 'V'
	)
	DROP VIEW VLT_DB_POWERBI_BatchStatus;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_BatchStatus]
AS
	SELECT
		0			   AS BATCHSTATUS,
		'Zurückhalten' AS BATCHSTATUSDesc
	UNION
	SELECT
		1				  AS BATCHSTATUS,
		'Im Wartezustand' AS BATCHSTATUSDesc
	UNION
	SELECT
		2			 AS BATCHSTATUS,
		'Ausführung' AS BATCHSTATUSDesc
	UNION
	SELECT
		3		 AS BATCHSTATUS,
		'Fehler' AS BATCHSTATUSDesc
	UNION
	SELECT
		4			   AS BATCHSTATUS,
		'Abgeschloßen' AS BATCHSTATUSDesc
	UNION
	SELECT
		5		 AS BATCHSTATUS,
		'Bereit' AS BATCHSTATUSDesc
	UNION
	SELECT
		6				   AS BATCHSTATUS,
		'Nicht ausgeführt' AS BATCHSTATUSDesc
	UNION
	SELECT
		7				 AS BATCHSTATUS,
		'Wird storniert' AS BATCHSTATUSDesc
	UNION
	SELECT
		8			AS BATCHSTATUS,
		'Storniert' AS BATCHSTATUSDesc
GO