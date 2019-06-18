USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_SALESLINESUBORDER]    Script Date: 29.05.2018 15:52:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT 1
		FROM SYS.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_SALESLINESUBORDER'
			AND TYPE = 'V'
	)
	DROP VIEW VLT_DB_POWERBI_SALESLINESUBORDER;
GO

CREATE VIEW [dbo].[VLT_DB_POWERBI_SALESLINESUBORDER]
AS
	SELECT NvProjectTable.PROJECTID,
		   MainSalesTable.SALESID AS MainSalesId,
		   SubSalesTable.SALESID AS SubSalesId,
		   SubSalesLine.LINENUM,
		   SubSalesLine.SALESBOQID,
		   SubSalesLine.SALESQTY,
		   SubSalesLine.LineAmount,
		   NvProjectTable.PROJECTID + NvProjectTable.DATAAREAID AS FKProjectId
	FROM dbo.NVPROJECTTABLE AS NvProjectTable
	JOIN dbo.SALESTABLE AS MainSalesTable ON (MainSalesTable.NVPROJECTID = NvProjectTable.PROJECTID AND MainSalesTable.MAINSALESORDER_ADDON = 1)
	JOIN dbo.SALESTABLE AS SubSalesTable ON (SubSalesTable.MAINSALESID_ADDON = MainSalesTable.SALESID AND SubSalesTable.MAINSALESORDER_ADDON = 0)
	JOIN SALESLINE AS SubSalesLine ON (SubSalesLine.SALESID = SubSalesTable.SALESID AND SubSalesLine.SALESQTY > 0)
	WHERE NvProjectTable.DATAAREAID = '100'
--AND NvProjectTable.PROJECTID = '009690'

GO

