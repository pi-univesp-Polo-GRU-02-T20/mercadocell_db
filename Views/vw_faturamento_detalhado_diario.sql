CREATE 
VIEW VW_FATURAMENTO_DETALHADO_MENSAL AS
    SELECT 
          VAPD.COD_PRODUTO 							
        , VAPD.NME_PRODUTO 							
        , SUM(VAPD.QTD_ITEM) 							AS QTD_ITEM
        , SUM(VAPD.VLR_PRECO_MEDIO) 					AS VLR_PRECO_MEDIO
        , DATE_FORMAT(VAPD.DSC_PERIODO, '%Y-%m-%d') 	AS ANO_OPERACAO
    FROM
        VW_APURACAO_FATURAMENTO_DETALHADO VAPD
    WHERE
        VAPD.TPO_OPERACAO = 'V'
    GROUP BY 
		VAPD.COD_PRODUTO, 
		VAPD.NME_PRODUTO, 
		DATE_FORMAT(VAPD.DSC_PERIODO, '%Y-%m-%d');