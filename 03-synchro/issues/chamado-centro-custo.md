> [!NOTE]  # [PANCO] - 0135886: Synchro4TDF V 25.1.0 - ECD - ISSUE #1318

```sql
-- 1
SELECT
	MANDT AS MANDT,
	EMPRESA AS EMPRESA,
	ANO AS ANO,
	DT_INI AS DT_INI,
	DT_FIN AS DT_FIN,
	COD_CTA AS COD_CTA,
	COD_CCUS AS COD_CCUS
FROM
	"SYN4TDF"."/SYN/V_ECD_SALDOS_CONTABEIS_COM_MOV"
WHERE
	MANDT = '300'
    AND EMPRESA = 'LN01'
    AND ANO = '2026'
GROUP BY
	MANDT,
	EMPRESA,
	ANO,
	COD_CTA,
	DT_INI,
	DT_FIN,
	COD_CCUS;


-- 2
SELECT
	COD_CTA,
    ANO,
    MANDT,
    EMPRESA,
    COD_CCUS,
    COUNT(*) AS MESES_COM_MOV
FROM "SYN4TDF"."/SYN/SALDOS_CONTABEIS"
WHERE 
	-- FILTROS CONTEXTO
    MANDT = '300'
    AND EMPRESA = 'LN01'
    AND ANO = '2026'
    --
	AND (VL_SLD_INI_ORIGINAL > 0
        OR VL_DEB_ACUMULADO > 0
        OR VL_CRED_ACUMULADO > 0
        OR VL_DEB_MENSAL > 0
        OR VL_CRED_MENSAL > 0)
	AND PER_APUR != 'A00'
	AND PER_APUR LIKE 'A%'
    AND IND_SALDO_CENTRO_CUSTO = 'S'
    AND COD_CCUS != ''
    GROUP BY COD_CTA, COD_CCUS, ANO, MANDT, EMPRESA;

-- 3
SELECT
	COD_CTA,
    ANO,
    MANDT,
    EMPRESA,
    COD_CCUS,
    COUNT(*) AS MESES_COM_MOV
FROM "/SYN/SALDOS_CONTABEIS" SC
WHERE
	-- FILTROS CONTEXTO
    MANDT = '300'
    AND EMPRESA = 'LN01'
    AND ANO = '2026'
    --
	AND (VL_SLD_INI_ORIGINAL > 0
	OR VL_DEB_ACUMULADO > 0
    OR VL_CRED_ACUMULADO > 0
    OR VL_DEB_MENSAL > 0
    OR VL_CRED_MENSAL > 0)
	AND PER_APUR != 'A00'
    AND PER_APUR LIKE 'A%'
    AND IND_SALDO_CENTRO_CUSTO = 'N'
    AND NOT EXISTS (SELECT 1 FROM "SYN4TDF"."/SYN/SALDOS_CONTABEIS" T
						WHERE (VL_SLD_INI_ORIGINAL > 0
						OR VL_DEB_ACUMULADO > 0
                        OR VL_CRED_ACUMULADO > 0
                        OR VL_DEB_MENSAL > 0
                        OR VL_CRED_MENSAL > 0)
	AND PER_APUR != 'A00'
    AND PER_APUR LIKE 'A%'
    AND SC.PER_APUR = T.PER_APUR
    AND IND_SALDO_CENTRO_CUSTO = 'S'
    AND COD_CCUS != ''
    AND SC.EMPRESA = T.EMPRESA
    AND SC.ANO = T.ANO
    AND SC.COD_CTA = T.COD_CTA)
GROUP BY COD_CTA, COD_CCUS, ANO, MANDT, EMPRESA;
```

- A fonte dos dados é uma view com o seguinte DDL ques está desde a versao 1.19
```SQL
CREATE VIEW SYN4TDF_SUPORTE."/SYN/V_ECD_SALDOS_CONTABEIS_COM_MOV" AS
SELECT
                    MANDT,
                    EMPRESA,
                    ANO,
                    ANO || '0101' AS DT_INI,
                    ANO || '1231' AS DT_FIN,
                    COD_CTA,
                    COD_CCUS
                 FROM (SELECT
                          COD_CTA,
                          ANO,
                          MANDT,
                          EMPRESA,
                          COD_CCUS,
                          COUNT(*) AS MESES_COM_MOV
                       FROM "SYN4TDF_SUPORTE"."/SYN/SALDOS_CONTABEIS"
                       WHERE (VL_SLD_INI_ORIGINAL > 0
                              OR VL_DEB_ACUMULADO > 0
                              OR VL_CRED_ACUMULADO > 0
                              OR VL_DEB_MENSAL > 0
                              OR VL_CRED_MENSAL > 0)
                       AND PER_APUR != 'A00'
                       AND PER_APUR LIKE 'A%'
                       AND IND_SALDO_CENTRO_CUSTO = 'S'
                       AND COD_CCUS != ''
                       GROUP BY COD_CTA, COD_CCUS, ANO, MANDT, EMPRESA
                       UNION
                       SELECT
                          COD_CTA,
                          ANO,
                          MANDT,
                          EMPRESA,
                          COD_CCUS,
                          COUNT(*) AS MESES_COM_MOV
                       FROM "/SYN/SALDOS_CONTABEIS" SC
                       WHERE (VL_SLD_INI_ORIGINAL > 0
                              OR VL_DEB_ACUMULADO > 0
                              OR VL_CRED_ACUMULADO > 0
                              OR VL_DEB_MENSAL > 0
                              OR VL_CRED_MENSAL > 0)
                      AND PER_APUR != 'A00'
                      AND PER_APUR LIKE 'A%'
                      AND IND_SALDO_CENTRO_CUSTO = 'N'
                      AND NOT EXISTS (SELECT 1 FROM "SYN4TDF_SUPORTE"."/SYN/SALDOS_CONTABEIS" T
                                      WHERE (VL_SLD_INI_ORIGINAL > 0
                                             OR VL_DEB_ACUMULADO > 0
                                             OR VL_CRED_ACUMULADO > 0
                                             OR VL_DEB_MENSAL > 0
                                             OR VL_CRED_MENSAL > 0)
                                      AND PER_APUR != 'A00'
                                      AND PER_APUR LIKE 'A%'
                                      AND SC.PER_APUR = T.PER_APUR
                                      AND IND_SALDO_CENTRO_CUSTO = 'S'
                                      AND COD_CCUS != ''
                                      AND SC.EMPRESA = T.EMPRESA
                                      AND SC.ANO = T.ANO
                                      AND SC.COD_CTA = T.COD_CTA)
                      GROUP BY COD_CTA, COD_CCUS, ANO, MANDT, EMPRESA)
                 WHERE MESES_COM_MOV > 0;
```