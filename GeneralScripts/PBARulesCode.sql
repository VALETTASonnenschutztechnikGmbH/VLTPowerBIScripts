SELECT
	pbaTbl.PBAID,
	pbaTblVar.INTVAR,
	pbaRC.RULECLAUSEID,
	pbaRC.RULECLAUSEREF,
	pRAVC.RULECODE
FROM PBATABLE pbaTbl

JOIN PBATABLEVARIABLE pbaTblVar ON pbaTblVar.PBAID = pbaTbl.PBAID
JOIN PBARULECLAUSE pbaRC ON (pbaRC.VARIABLE = pbaTblVar.INTVAR)
JOIN PBARULEACTIONVALUECODE pRAVC ON (pRAVC.RULECLAUSEID = pbaRC.RULECLAUSEID AND pRAVC.RULECLAUSETYPE = pbaRC.RULECLAUSETYPE AND pRAVC.PBAID = pbaRC.RULECLAUSEREF)
JOIN PBARULECLAUSEVERSION pbaRCV ON (pbaRCV.PBAID = pbaTbl.PBAID AND pbaRCV.RULECLAUSEVERSIONID = pbaRC.RULECLAUSEREF AND pbaRCV.ACTIVE = 1)
--WHERE pbaTblVar.INTVAR = 'PaketHoehe'


