-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: crop_diseases
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `solution` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Apple___Apple_scab','Apple scab is a fungal disease that affects apple trees.','Apply fungicides and remove infected leaves.'),(2,'Apple___Black_rot','Black rot is a fungal disease that causes fruit rot.','Prune infected branches and apply fungicides.'),(3,'Apple___Cedar_apple_rust','Cedar apple rust is a fungal disease that affects both apples and cedars.','Remove nearby cedar trees and apply fungicides.'),(4,'Apple___healthy','The plant is healthy.','No action required.'),(5,'Corn___Common_rust','Common rust is a fungal disease that affects corn plants.','Use resistant varieties and apply fungicides.'),(6,'Corn___Northern_Leaf_Blight','Northern leaf blight is a fungal disease that causes long, grayish lesions on corn leaves.','Rotate crops and apply fungicides.'),(7,'Grape___Black_rot','Black rot is a fungal disease that affects grapes.','Prune infected vines and apply fungicides.'),(8,'Grape___Esca','Esca is a fungal disease that causes leaf discoloration and wood decay in grapevines.','Remove infected plants and apply fungicides.'),(9,'Potato___Early_blight','Early blight is a fungal disease that causes dark spots on potato leaves.','Rotate crops and apply fungicides.'),(10,'Potato___Late_blight','Late blight is a fungal disease that causes rapid plant decay.','Remove infected plants and apply fungicides.'),(11,'Tomato___Bacterial_spot','Bacterial spot is a disease that causes dark lesions on tomato leaves and fruit.','Use disease-free seeds and apply copper-based sprays.'),(12,'Tomato___Early_blight','Early blight is a fungal disease that causes dark spots on tomato leaves.','Rotate crops and apply fungicides.'),(13,'Tomato___Late_blight','Late blight is a fungal disease that causes rapid plant decay.','Remove infected plants and apply fungicides.'),(14,'Tomato___Leaf_Mold','Leaf mold is a fungal disease that causes yellow spots on tomato leaves.','Improve air circulation and apply fungicides.'),(15,'Tomato___Septoria_leaf_spot','Septoria leaf spot is a fungal disease that causes small, circular spots on tomato leaves.','Remove infected leaves and apply fungicides.'),(16,'Tomato___Spider_mites','Spider mites are tiny pests that cause yellowing and stippling on tomato leaves.','Use insecticidal soap or neem oil.'),(17,'Tomato___Target_Spot','Target spot is a fungal disease that causes dark, concentric spots on tomato leaves.','Remove infected leaves and apply fungicides.'),(18,'Tomato___Tomato_Yellow_Leaf_Curl_Virus','Tomato yellow leaf curl virus is a viral disease that causes leaf curling and yellowing.','Remove infected plants and control whiteflies.'),(19,'Tomato___healthy','The plant is healthy.','No action required.');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-23 13:10:26
