CREATE TABLE  DB_COMERCIO.PAGAMENTO_OPERACAO (
  COD_PAGAMENTO 		INT 			NOT NULL AUTO_INCREMENT,
  VLR_PAGAMENTO 		DECIMAL(10,2) 	NULL ,
  DTA_PAGAMENTO 		DATE 			NULL ,
  DTA_VENCIMENTO 		DATE 			NULL ,
  COD_OPERACAO 			INT 			NOT NULL,
  COD_TIPO_PAGAMENTO 	INT 			NULL,
  PRIMARY KEY (COD_PAGAMENTO),
  INDEX FK_PARCELA_COMPRA_IDX (COD_OPERACAO ASC) ,
  INDEX FK_TIPO_PAGAMENTO_OPERACAO_IDX (COD_TIPO_PAGAMENTO ASC) ,
  CONSTRAINT FK_PARCELA_COMPRA
    FOREIGN KEY (COD_OPERACAO)
    REFERENCES DB_COMERCIO.OPERACAO (COD_OPERACAO),
  CONSTRAINT FK_TIPO_PAGAMENTO_OPERACAO_
    FOREIGN KEY (COD_TIPO_PAGAMENTO)
    REFERENCES DB_COMERCIO.TIPO_PAGAMENTO (COD_TIPO_PAGAMENTO)
);