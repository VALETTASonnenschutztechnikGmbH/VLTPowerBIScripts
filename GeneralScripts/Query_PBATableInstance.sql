USE [VLT_AX500105_D]
GO

SELECT VLT_AX500105_P.dbo.PBATABLEINSTANCE.PBAID,
	   VLT_AX500105_P.dbo.PBATABLEINSTANCE.VARIABLE
FROM PBATABLEINSTANCE
WHERE VLT_AX500105_P.dbo.PBATABLEINSTANCE.VARIABLE LIKE '%hoehe%'
	AND VLT_AX500105_P.dbo.PBATABLEINSTANCE.PBAPREPOSTVALUE = 1
GROUP BY VLT_AX500105_P.dbo.PBATABLEINSTANCE.PBAID,
		 VLT_AX500105_P.dbo.PBATABLEINSTANCE.VARIABLE
ORDER BY VLT_AX500105_P.dbo.PBATABLEINSTANCE.VARIABLE
GO


