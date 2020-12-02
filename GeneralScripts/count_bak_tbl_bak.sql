USE [VLT_AX500105_P_BAK]
GO

SELECT COUNT(*) AS SalesLink
  FROM [dbo].[CUSTCONFIRMSALESLINK]
SELECT COUNT(*) AS InvoiceJour
  FROM [dbo].[CUSTINVOICEJOUR]
SELECT COUNT(*) AS InvoiceTrans
  FROM [dbo].[CUSTINVOICETrans]
SELECT COUNT(*) AS PackingSlipJour
  FROM [dbo].[CUSTPACKINGSLIPJOUR]
SELECT COUNT(*) AS PackingSlipTrans
  FROM [dbo].[CUSTPACKINGSLIPTRANS] 
SELECT COUNT(*) AS SalesLine
  FROM [dbo].[SALESLINE] 
SELECT COUNT(*) AS SalesTable
  FROM [dbo].[SALESTABLE] 

GO

