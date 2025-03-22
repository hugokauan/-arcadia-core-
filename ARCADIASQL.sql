-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           9.1.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
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
CREATE DATABASE IF NOT EXISTS `cyberarcadia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cyberarcadia`;

-- Copiando estrutura para tabela cyberarcadia.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `steamid` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discordid` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banned` int DEFAULT '0',
  `whitelist` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_clothing
CREATE TABLE IF NOT EXISTS `players_clothing` (
  `id` int DEFAULT NULL,
  `mascara` int DEFAULT NULL,
  `mascara_textura` int DEFAULT '0',
  `cabelo` int DEFAULT NULL,
  `cabelo_textura` int DEFAULT '0',
  `maos` int DEFAULT NULL,
  `calcas` int DEFAULT NULL,
  `calcas_textura` int DEFAULT '0',
  `mochilas` int DEFAULT NULL,
  `mochilas_textura` int DEFAULT '0',
  `sapatos` int DEFAULT NULL,
  `sapatos_textura` int DEFAULT '0',
  `acessorios` int DEFAULT NULL,
  `acessorios_textura` int DEFAULT '0',
  `camisetabug` int DEFAULT NULL,
  `camisetabug_textura` int DEFAULT '0',
  `coletes` int DEFAULT NULL,
  `coletes_textura` int DEFAULT '0',
  `decals` int DEFAULT NULL,
  `decals_textura` int DEFAULT '0',
  `camiseta` int DEFAULT NULL,
  `camiseta_textura` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_data
CREATE TABLE IF NOT EXISTS `players_data` (
  `id` int DEFAULT NULL,
  `Nome` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Índividuo',
  `Sobrenome` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Indigente',
  `Idade` int DEFAULT '18',
  `sexo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grupo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organizacao` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastposition` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dinheiro` int DEFAULT '5000',
  `banco` int DEFAULT '0',
  `trabalho` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cyberarcadia.players_props
CREATE TABLE IF NOT EXISTS `players_props` (
  `id` int DEFAULT NULL,
  `chapeu` int DEFAULT NULL,
  `chapeu_textura` int DEFAULT NULL,
  `oculos` int DEFAULT NULL,
  `oculos_textura` int DEFAULT NULL,
  `orelhas` int DEFAULT NULL,
  `orelhas_textura` int DEFAULT NULL,
  `relogios` int DEFAULT NULL,
  `relogios_textura` int DEFAULT NULL,
  `braceletes` int DEFAULT NULL,
  `braceletes_textura` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
