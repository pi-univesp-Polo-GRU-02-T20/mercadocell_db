CREATE TABLE  DB_COMERCIO.SUBCATEGORIA 
(
  COD_SUBCATEGORIA 	INT 		NOT NULL AUTO_INCREMENT,
  NME_SUBCATEGORIA 	VARCHAR(95) NULL ,
  COD_CATEGORIA 	INT 		NULL ,
  PRIMARY KEY (COD_SUBCATEGORIA),
  INDEX FK_SUBCATEGORIA_CATEGORA_IDX (COD_CATEGORIA ASC) ,
  CONSTRAINT FK_SUBCATEGORIA_CATEGORA
    FOREIGN KEY (COD_CATEGORIA)
    REFERENCES DB_COMERCIO.CATEGORIA (COD_CATEGORIA))
;
