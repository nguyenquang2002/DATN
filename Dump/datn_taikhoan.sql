-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datn
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (1,'admin','$2a$04$x6gKqKUeYLySEdki0EqsreLnvywqEc4bz3dRdPUeI6gI1Z4Ty8dCq','admin','123','abbbcc','admin@gmail.com',NULL,NULL,NULL,NULL,1,1),(2,'test','$2a$04$UnwofQGRYjEKuGAyzSPTX.12LQP7jtheZCObe8OLmMJRM5.JIfxRa','test','111','t','test@gmail.com',NULL,NULL,NULL,NULL,3,1),(3,'employee','$2a$04$6FdIU0hjqQrnbWmlMThcsOMNIng65bNBiPoPpu/wO5005N5wuSt/G','employee','222','a','employee@gmail.com',NULL,NULL,NULL,NULL,2,1),(4,'tk1','$2a$04$9jCkkQ.SWPu3eqqJIz/3RevR8NB5uoRNIgegYnqDI6fu5NgmgI7fC','a','1234567','a','a@email.com','2024-05-07 17:10:35',NULL,NULL,NULL,3,1),(5,'a','$2a$04$nPKr7DMy6Id59O67mLa3luzswNscnp61.CO7NxmZLZM.gUxsgUryG','aA','1111','a','1@email.com','2024-05-07 19:51:56',NULL,NULL,NULL,3,1),(6,'tk2','$2a$04$CmtKYs2JV3jFmnMfZt2Gd.0IK7atflOeaQBUNlKSUkCPSCn.XOYwq','a','1111','a','tk2@email.com','2024-05-07 20:02:27',NULL,NULL,NULL,3,1),(7,'e1','$2a$04$nvOnUt1X/OQyN5rwDFaRlefrs/0iDjtxg2N4yLAybsCi1k4aLFDJm','e1','123456','Hà Nội','e1@email.com','2024-05-16 22:39:52',NULL,NULL,NULL,2,1),(8,'e2','$2a$04$Ix1qDXVsWJMnF53jqIatTO8R9mz/PkeCrkFc7ByZiqQt.hMc383r2','e2','123','a','e2@email.com','2024-05-16 22:57:42',NULL,NULL,NULL,2,1);
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 13:37:33
