DROP TRIGGER IF EXISTS `TRG_ATUALIZAR_ESTOQUE` ;
DELIMITER $$
CREATE TRIGGER `TRG_ATUALIZAR_ESTOQUE` AFTER INSERT ON `ITEM_OPERACAO` FOR EACH ROW BEGIN
    SELECT TPO_OPERACAO INTO @TPO_OPERACAO 
		FROM OPERACAO OP WHERE OP.COD_OPERACAO = NEW.COD_OPERACAO;
       
	IF @TPO_OPERACAO  = 'C' THEN
		UPDATE 	ITEM_OPERACAO ITOP
		INNER JOIN PRODUTO PR 
		ON 	PR.COD_PRODUTO 			= NEW.COD_PRODUTO 		AND 
            ITOP.COD_ITEM_OPERACAO 	= NEW.COD_ITEM_OPERACAO
		SET PR.QTD_ESTOQUE_ATUAL = PR.QTD_ESTOQUE_ATUAL + ITOP.QTD_ITEM;
    ELSEIF @TPO_OPERACAO  = 'V' THEN
		UPDATE ITEM_OPERACAO ITOP
		INNER JOIN PRODUTO PR 
		ON 	PR.COD_PRODUTO 			= NEW.COD_PRODUTO		AND 
			ITOP.COD_ITEM_OPERACAO 	= NEW.COD_ITEM_OPERACAO
		SET PR.QTD_ESTOQUE_ATUAL = PR.QTD_ESTOQUE_ATUAL - ITOP.QTD_ITEM;
	END IF;
END $$
DELIMITER ;