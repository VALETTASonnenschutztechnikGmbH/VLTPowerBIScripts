USE [VLT_AX500105_P]
GO

/****** Object:  View [dbo].[VLT_DB_POWERBI_CUSTTRANS]    Script Date: 29.05.2018 15:52:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT
			1
		FROM sys.VIEWS
		WHERE NAME = 'VLT_DB_POWERBI_CUSTCOLLECTIONLETTERJOUR'
			AND type = 'V'
	)
	DROP VIEW [VLT_DB_POWERBI_CUSTCOLLECTIONLETTERJOUR];
GO

CREATE VIEW [DBO].[VLT_DB_POWERBI_CUSTCOLLECTIONLETTERJOUR]
AS
	SELECT
		[COLLECTIONLETTERNUM],
		[COLLECTIONLETTERDATE],
		[ACCOUNTNUM],
		[COLLECTIONLETTERCODE],
		COLLECTIONLETTERCODE.CustCollectionLetterCodeDesc,
		[CURRENCYCODE],
		[FEE],
		[PRINTDATE],
		[UPDATED],
		[LEDGERVOUCHER],
		[NAME],
		[ADDRESS],
		[COUNTRYREGIONID],
		[BLOCK],
		[DIMENSION],
		[DIMENSION2_],
		[DIMENSION3_],
		[POSTINGPROFILE],
		[CANCELED],
		[NUMBERSEQUENCE],
		[ZIPCODE],
		[STATE],
		[COUNTY],
		[NOTES],
		[TAXITEMGROUP],
		[TAXGROUP],
		[TAXAMOUNT],
		[TAXWRITECODE],
		[STATUS],
		[LANGUAGEID],
		[JOURNALPRINTED],
		[CREATEDDATETIME],
		[DEL_CREATEDTIME],
		[CREATEDBY],
		[DATAAREAID],
		[RECID],
		[STREET],
		[CITY],
		[DEL_REFZIPCODE],
		[NVCOMPANYID],
		[RECVERSION],
		[NBABANKINGPAYMTERMID],
		[NBABANKINGDUEDATE],
		[GIROTYPE],
		[PAYMID],
		[DEL_NPIBANKINGPAYMID],
		[PAYMTERMID],
		[DUEDATE],
		CustCollectionLetterJour.ACCOUNTNUM + CustCollectionLetterJour.DATAAREAID AS FKAccountNum,
		CustCollectionLetterJour.ACCOUNTNUM + CUSTCOLLECTIONLETTERJOUR.COLLECTIONLETTERNUM + CustCollectionLetterJour.DATAAREAID AS FKAccountNumCollectionLetterNum
	FROM [DBO].[CustCollectionLetterJour] AS CUSTCOLLECTIONLETTERJOUR
	LEFT JOIN VLT_DB_POWERBI_CustCollectionLetterCode COLLECTIONLETTERCODE ON (COLLECTIONLETTERCODE.CustCollectionLetterCode = CUSTCOLLECTIONLETTERJOUR.COLLECTIONLETTERCODE)

GO