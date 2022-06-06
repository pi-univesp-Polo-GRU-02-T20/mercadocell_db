CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_faturamento_detalhado_anual` AS
    SELECT 
        `vw_apuracao_faturamento_detalhado`.`COD_PRODUTO` AS `COD_PRODUTO`,
        `vw_apuracao_faturamento_detalhado`.`NME_PRODUTO` AS `NME_PRODUTO`,
        SUM(`vw_apuracao_faturamento_detalhado`.`QTD_ITEM`) AS `QTD_ITEM`,
        SUM(`vw_apuracao_faturamento_detalhado`.`VLR_PRECO_MEDIO`) AS `VLR_PRECO_MEDIO`,
        DATE_FORMAT(`vw_apuracao_faturamento_detalhado`.`DTA_OPERACAO`,
                '%Y') AS `ANO_OPERACAO`
    FROM
        `vw_apuracao_faturamento_detalhado`
    WHERE
        (`vw_apuracao_faturamento_detalhado`.`TPO_OPERACAO` = 'v')
    GROUP BY `vw_apuracao_faturamento_detalhado`.`COD_PRODUTO` , `vw_apuracao_faturamento_detalhado`.`NME_PRODUTO` , DATE_FORMAT(`vw_apuracao_faturamento_detalhado`.`DTA_OPERACAO`,
            '%Y')