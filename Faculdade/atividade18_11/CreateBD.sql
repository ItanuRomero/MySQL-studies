SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SiteNoticias` DEFAULT CHARACTER SET utf8 ;
USE `SiteNoticias` ;

-- -----------------------------------------------------
-- Table `SiteNoticias`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SiteNoticias`.`usuario` (
  `idusuario` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `senha` VARCHAR(10) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SiteNoticias`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SiteNoticias`.`categoria` (
  `idcategoria` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SiteNoticias`.`noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SiteNoticias`.`noticia` (
  `idnoticia` INT NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `data` DATETIME NOT NULL,
  `texto` TEXT NOT NULL,
  `imagem` VARCHAR(200) NOT NULL,
  `categoria_idcategoria` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idnoticia`, `categoria_idcategoria`, `usuario_idusuario`),
  INDEX `fk_noticia_categoria1_idx` (`categoria_idcategoria` ASC),
  INDEX `fk_noticia_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_noticia_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `SiteNoticias`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_noticia_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `SiteNoticias`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SiteNoticias`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SiteNoticias`.`comentario` (
  `idcomentario` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `texto` TEXT NOT NULL,
  `noticia_idnoticia` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idcomentario`, `noticia_idnoticia`, `usuario_idusuario`),
  INDEX `fk_comentario_noticia1_idx` (`noticia_idnoticia` ASC),
  INDEX `fk_comentario_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_comentario_noticia1`
    FOREIGN KEY (`noticia_idnoticia`)
    REFERENCES `SiteNoticias`.`noticia` (`idnoticia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `SiteNoticias`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
