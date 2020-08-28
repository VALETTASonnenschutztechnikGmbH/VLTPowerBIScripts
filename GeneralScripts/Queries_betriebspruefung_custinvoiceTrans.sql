SELECT [INVOICEID]
      ,[INVOICEDATE]
      ,[LINENUM]
      ,[INVENTTRANSID]
      ,[ITEMID]
      ,[EXTERNALITEMID]
      ,[NAME]
      ,[TAXGROUP]
      ,[CURRENCYCODE]
      ,[PRICEUNIT]
      ,[QTY]
      ,[SALESPRICE]
      ,[DISCPERCENT]
      ,[DISCAMOUNT]
      ,[LINEAMOUNT]
      ,[SALESGROUP]
      ,[LEDGERACCOUNT]
      ,[DIMENSION]
      ,[DIMENSION2_]
      ,[DIMENSION3_]
      ,[QTYPHYSICAL]
      ,[PARTDELIVERY]
      ,[REMAIN]
      ,[SALESID]
      ,[SALESUNIT]
      ,[SALESMARKUP]
      ,[COMMISSCALC]
      ,[COMMISSAMOUNTCUR]
      ,[TRANSACTIONCODE]
      ,[TAXAUTOGENERATED]
      ,[TAXITEMGROUP]
      ,[TAXAMOUNT]
      ,[TAXWRITECODE]
      ,[MULTILNDISC]
      ,[MULTILNPERCENT]
      ,[LINEDISC]
      ,[LINEPERCENT]
      ,[ORIGSALESID]
      ,[LINEHEADER]
      ,[TRANSPORT]
      ,[INVENTDIMID]
      ,[NUMBERSEQUENCEGROUP]
      ,[STATPROCID]
      ,[DLVDATE]
      ,[LINEAMOUNTTAX]
      ,[PORT]
      ,[CUSTOMERLINENUM]
      ,[LINEAMOUNTMST]
      ,[TAXAMOUNTMST]
      ,[LINEAMOUNTTAXMST]
      ,[COMMISSAMOUNTMST]
      ,[SUMLINEDISC]
      ,[SUMLINEDISCMST]
      ,[INTERCOMPANYINVENTTRANSID]
      ,[NVORIGSALESPRICE]
      ,[NVKLZSONDERRABATT]
      ,[NVMODELDESCRIPTIONTEXT]
      ,[NVMODELMAINDIM2]
      ,[NVMODELMAINDIM1]
      ,[NVCONFIGSTRING]
      ,[DATAAREAID]
      ,[RECID]
      ,[NVMARKUPPERCENT]
      ,[NVAUTOLINE]
      ,[NVSTATISTICVARIABLEVALUE]
      ,[NVSTATISTICVARIABLEVALUE2_]
      ,[NVSTATISTICVARIABLEVALUE3_]
      ,[NVSTATISTICVARIABLEVALUE4_]
      ,[NVSTATISTICVARIABLEVALUE5_]
      ,[NVSTATISTICVARIABLEVALUE6_]
      ,[NVSTATISTICVARIABLEVALUE7_]
      ,[NVSTATISTICVARIABLEVALUE8_]
      ,[NVSTATISTICVARIABLEVALUE9_]
      ,[NVSTATISTICVARIABLEVALUE10_]
      ,[RECVERSION]
      ,[INVENTREFID]
      ,[DLVCOUNTY]
      ,[DLVSTATE]
      ,[DELIVERYTYPE]
      ,[COUNTRYREGIONOFSHIPMENT]
      ,[ITEMCODEID]
      ,[ORIGCOUNTRYREGIONID]
      ,[OLAPCOSTVALUE]
      ,[EINVOICEACCOUNTCODE]
      ,[RETURNDISPOSITIONCODEID]
      ,[STATLINEAMOUNTMST]
      ,[INTRASTATDISPATCHID]
      ,[INVENTQTY]
      ,[ORIGSTATE]
      ,[INVENTREFTYPE]
      ,[INVENTREFTRANSID]
      ,[DLVCOUNTRYREGIONID]
      ,[WEIGHT]
      ,[RETURNARRIVALDATE]
      ,[RETURNCLOSEDDATE]
      ,[REASONREFRECID]
      ,[ASSETID]
      ,[ASSETBOOKID]
      ,[SALESQTY_ADDON]
      ,[DELIVEREDINTOTALOBJECTORD30011]
      ,[REMAINSALESPHYSICALOBJECT30012]
      ,[SALESBOQID_ADDON]
      ,[DONOTPRINTLINE_ADDON]
  FROM [dbo].[CUSTINVOICETRANS] cit
   WHERE cit.INVOICEDATE	>= DATETIMEFROMPARTS(2014, 1, 1, 0, 0, 0, 0) AND
      cit.INVOICEDATE <= DATETIMEFROMPARTS(2017, 4, 30, 0, 0, 0, 0)

