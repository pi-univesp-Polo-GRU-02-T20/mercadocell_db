CREATE DEFINER=`root`@`localhost` TRIGGER `trg_Atualizar_Estoque` AFTER INSERT ON `item_operacao` FOR EACH ROW BEGIN
	IF TPO_OPERACAO = 'C' THEN
		UPDATE operacao OP
		INNER JOIN item_operacao ITOP
		ON OP.COD_OPERACAO = ITOP.COD_OPERACAO
		INNER JOIN produto PR 
		ON PR.COD_PRODUTO = ITOP.COD_PRODUTO
		SET PR.QTD_ESTOQUE_ATUAL = PR.QTD_ESTOQUE_ATUAL + ITOP.QTD_ITEM;
    ELSEIF TPO_OPERACAO = 'V' THEN
		UPDATE operacao OP
		INNER JOIN item_operacao ITOP
		ON OP.COD_OPERACAO = ITOP.COD_OPERACAO
		INNER JOIN produto PR 
		ON PR.COD_PRODUTO = ITOP.COD_PRODUTO
		SET PR.QTD_ESTOQUE_ATUAL = PR.QTD_ESTOQUE_ATUAL - ITOP.QTD_ITEM;
	END IF;
END