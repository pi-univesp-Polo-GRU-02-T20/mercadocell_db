CREATE 
VIEW VW_FATURAMENTO_SUMARIZADO_ANUAL AS
    SELECT 
        COD_PRODUTO 					AS COD_PRODUTO,
        SUM(VLR_CUSTO_VENDA) 			AS VLR_CUSTO_VENDA,
        SUM(VLR_FATURADO) 				AS VLR_FATURADO,
        SUM(VLR_LIQUIDO) 				AS VLR_LIQUIDO,
        SUM(QTD_ITEM_ESTOQUE_ENTRADA) 	AS QTD_ITEM_ESTOQUE_ENTRADA,
        SUM(QTD_ITEM_ESTOQUE_SAIDA) 	AS QTD_ITEM_ESTOQUE_SAIDA,
        DATE_FORMAT(DSC_PERIODO,'%Y') 	AS DSC_PERIODO
    FROM
        VW_APURACAO_FATURAMENTO_SUMARIZADO
    WHERE
        (COD_PRODUTO = COD_PRODUTO)
    GROUP BY 
		COD_PRODUTO, DATE_FORMAT(DSC_PERIODO,'%Y')