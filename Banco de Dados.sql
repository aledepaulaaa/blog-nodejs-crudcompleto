CREATE DATABASE  IF NOT EXISTS `guiapress` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guiapress`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guiapress
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (32,'Artigo de teste','Artigo-de-teste','<h2>Aqui podemos inserir textos personalizados, links, fotos e v&iacute;deos.</h2>\r\n<p>&nbsp;</p>\r\n<p><strong>Fa&ccedil;a um teste, crie sua conta e divirta-se!</strong></p>\r\n<p><strong><img src=\"data:image/png;base64,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\" width=\"179\" height=\"88\"></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"text-decoration: underline;\"><span style=\"font-family: \'comic sans ms\', sans-serif;\">Obs: imagens por enquanto s&oacute; pegando da web e colando aqui.</span></span></p>\r\n<p><span style=\"text-decoration: underline;\"><span style=\"font-family: \'comic sans ms\', sans-serif;\">Pela galeria do celular ainda n&atilde;o &eacute; poss&iacute;vel, se for necess&aacute;rio eu coloco !</span></span></p>','2023-01-14 12:56:43','2023-01-14 21:40:47',36),(33,'Inflação Brasileira','Inflacao-Brasileira','<p>&nbsp;</p>\r\n<p>A taxa do Brasil fechou 2022 aos 5,79%, em queda comparado com 2021, quando foi de 10,06%. Ainda assim, ficou acima do teto da meta, de 5%. O n&iacute;vel registrado em 2022 &eacute; menor que da Zona do Euro (9,2%), Alemanha (8,6%), Estados Unidos (6,5%) e Fran&ccedil;a (5,9%)....<br><br>Leia mais no texto original: (https://www.poder360.com.br/economia/inflacao-do-brasil-e-a-6a-menor-do-g20-em-2022/)<br>&copy; 2023 Todos os direitos s&atilde;o reservados ao Poder360, conforme a Lei n&ordm; 9.610/98. A publica&ccedil;&atilde;o, redistribui&ccedil;&atilde;o, transmiss&atilde;o e reescrita sem autoriza&ccedil;&atilde;o pr&eacute;via s&atilde;o proibidas.</p>\r\n<p><img src=\"https://static.poder360.com.br/2023/01/inflacao-g20-america-latina-10jan2023-02-738x1024.png\" alt=\"\" width=\"738\" height=\"1024\"></p>\r\n<p>Fonte: <a href=\"https://www.poder360.com.br/economia/inflacao-do-brasil-e-a-6a-menor-do-g20-em-2022/#:~:text=A%20taxa%20do%20Brasil%20fechou,Fran%C3%A7a%20(5%2C9%25).\">Poder 360 Infla&ccedil;&atilde;o do Brasil &eacute; a 6&ordf; menor do G20</a></p>','2023-01-15 08:54:34','2023-01-15 08:54:34',37),(34,'Elon Musk comenta sobre Redes Sociais no Brasil','Elon-Musk-comenta-sobre-Redes-Sociais-no-Brasil','<h1 class=\"post__title\">&ldquo;Extremamente preocupante&rdquo;, diz Elon Musk sobre bloqueios em redes sociais no Brasil</h1>\r\n<p>O fundador da Tesla e dono do Twitter,&nbsp;<a href=\"https://www.cnnbrasil.com.br/tudo-sobre/elon-musk/\">Elon Musk</a>, diz achar &ldquo;muito preocupante&rdquo; o bloqueio de perfis de redes sociais, a pedido do ministro do Supremo Tribunal Federal (STF)&nbsp;<a href=\"https://www.cnnbrasil.com.br/tudo-sobre/alexandre-de-moraes/\">Alexandre de Moraes</a>.</p>\r\n<p>Moraes ordenou a exclus&atilde;o de conte&uacute;do de incentivo a atos antidemocr&aacute;ticos no pa&iacute;s.</p>\r\n<p>O coment&aacute;rio de Musk, feito no Twitter neste s&aacute;bado (14), foi uma resposta a uma publica&ccedil;&atilde;o do jornalista americano Glenn Greenwald.</p>\r\n<p>fonte:<a href=\"https://www.cnnbrasil.com.br/politica/extremamente-preocupante-diz-elon-musk-sobre-bloqueios-em-redes-sociais-no-brasil/\"> https://www.cnnbrasil.com.br/politica/extremamente-preocupante-diz-elon-musk-sobre-bloqueios-em-redes-sociais-no-brasil/</a></p>','2023-01-15 08:56:46','2023-01-15 08:56:46',38);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (36,'Categoria Teste','Categoria-Teste','2023-01-14 12:50:56','2023-01-14 12:50:56'),(37,'Economia no Brasil','Economia-no-Brasil','2023-01-15 08:51:34','2023-01-15 08:51:34'),(38,'Tecnologia','Tecnologia','2023-01-15 08:51:56','2023-01-15 08:51:56');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'emailteste@email.com','Nome Teste','$2a$10$tUHJR3YwJVyXZ8EFW8nVvuEYTJGr.AV50124fBhCvgyYsuO/ZIdOe','2023-01-14 10:53:45','2023-01-14 10:53:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'guiapress'
--

--
-- Dumping routines for database 'guiapress'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 10:30:44
