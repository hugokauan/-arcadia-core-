-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para cyberarcadia
CREATE DATABASE IF NOT EXISTS `cyberarcadia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `cyberarcadia`;

-- Copiando estrutura para tabela cyberarcadia.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(200) DEFAULT NULL,
  `discordid` varchar(200) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `banned` int(11) DEFAULT 0,
  `whitelist` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_clothing
CREATE TABLE IF NOT EXISTS `players_clothing` (
  `id` int(11) DEFAULT NULL,
  `mascara` int(11) DEFAULT NULL,
  `mascara_textura` int(11) DEFAULT NULL,
  `cabelo` int(11) DEFAULT NULL,
  `cabelo_textura` int(11) DEFAULT NULL,
  `maos` int(11) DEFAULT NULL,
  `calcas` int(11) DEFAULT NULL,
  `calcas_textura` int(11) DEFAULT NULL,
  `mochilas` int(11) DEFAULT NULL,
  `mochilas_textura` int(11) DEFAULT NULL,
  `sapatos` int(11) DEFAULT NULL,
  `sapatos_textura` int(11) DEFAULT NULL,
  `acessorios` int(11) DEFAULT NULL,
  `acessorios_textura` int(11) DEFAULT NULL,
  `camisetabug` int(11) DEFAULT NULL,
  `camisetabug_textura` int(11) DEFAULT NULL,
  `coletes` int(11) DEFAULT NULL,
  `coletes_textura` int(11) DEFAULT NULL,
  `decals` int(11) DEFAULT NULL,
  `decals_textura` int(11) DEFAULT NULL,
  `camiseta` int(11) DEFAULT NULL,
  `camiseta_textura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_data
CREATE TABLE IF NOT EXISTS `players_data` (
  `id` int(11) DEFAULT NULL,
  `grupo` varchar(50) DEFAULT NULL,
  `organizacao` varchar(50) DEFAULT NULL,
  `lastposition` varchar(500) DEFAULT NULL,
  `dinheiro` int(11) DEFAULT 5000,
  `banco` int(11) DEFAULT 0,
  `trabalho` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_props
CREATE TABLE IF NOT EXISTS `players_props` (
  `id` int(11) DEFAULT NULL,
  `chapeu` int(11) DEFAULT NULL,
  `chapeu_textura` int(11) DEFAULT NULL,
  `oculos` int(11) DEFAULT NULL,
  `oculos_textura` int(11) DEFAULT NULL,
  `orelhas` int(11) DEFAULT NULL,
  `orelhas_textura` int(11) DEFAULT NULL,
  `relogios` int(11) DEFAULT NULL,
  `relogios_textura` int(11) DEFAULT NULL,
  `braceletes` int(11) DEFAULT NULL,
  `braceletes_textura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
