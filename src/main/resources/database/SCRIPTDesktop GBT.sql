-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema game_bug_tracker
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema game_bug_tracker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `game_bug_tracker` DEFAULT CHARACTER SET utf8mb3 ;
USE `game_bug_tracker` ;

-- -----------------------------------------------------
-- Table `game_bug_tracker`.`platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`platform` (
  `idPlatform` INT NOT NULL,
  `PlatformName` VARCHAR(45) NOT NULL,
  `Game_idGame` INT NOT NULL,
  PRIMARY KEY (`idPlatform`),
  UNIQUE INDEX `idPlatform_UNIQUE` (`idPlatform` ASC) VISIBLE,
  INDEX `fk_Platform_Game1_idx` (`Game_idGame` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`usercompanyassociation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`usercompanyassociation` (
  `idUserCompanyAssociation` INT NOT NULL,
  `Role` VARCHAR(50) NOT NULL,
  `User_idUser` INT NOT NULL,
  `Company_idCompany` INT NOT NULL,
  PRIMARY KEY (`idUserCompanyAssociation`),
  UNIQUE INDEX `idUserCompanyAssociation_UNIQUE` (`idUserCompanyAssociation` ASC) VISIBLE,
  INDEX `fk_UserCompanyAssociation_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_UserCompanyAssociation_Company1_idx` (`Company_idCompany` ASC) VISIBLE,
  CONSTRAINT `fk_UserCompanyAssociation_Company1`
    FOREIGN KEY (`Company_idCompany`)
    REFERENCES `game_bug_tracker`.`company` (`idCompany`),
  CONSTRAINT `fk_UserCompanyAssociation_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`company` (
  `idCompany` INT NOT NULL AUTO_INCREMENT,
  `name_Company` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `Company_Description` TEXT NOT NULL,
  `Adress` VARCHAR(45) NOT NULL,
  `WebSite` VARCHAR(45) NOT NULL,
  `Industry` VARCHAR(45) NOT NULL,
  `UserCompanyAssociation_idUserCompanyAssociation` INT NULL DEFAULT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idCompany`),
  UNIQUE INDEX `idCompany_UNIQUE` (`idCompany` ASC) VISIBLE,
  UNIQUE INDEX `e-mail_UNIQUE` (`e-mail` ASC) VISIBLE,
  UNIQUE INDEX `name_Company_UNIQUE` (`name_Company` ASC) VISIBLE,
  INDEX `fk_Company_UserCompanyAssociation1_idx` (`UserCompanyAssociation_idUserCompanyAssociation` ASC) VISIBLE,
  CONSTRAINT `fk_Company_UserCompanyAssociation1`
    FOREIGN KEY (`UserCompanyAssociation_idUserCompanyAssociation`)
    REFERENCES `game_bug_tracker`.`usercompanyassociation` (`idUserCompanyAssociation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`notification` (
  `idNotification` INT NOT NULL,
  `Notification_Title` VARCHAR(45) NOT NULL,
  `NotificationType` VARCHAR(45) NOT NULL,
  `Recipient` VARCHAR(45) NOT NULL,
  `Message` LONGTEXT NOT NULL,
  `SendDate` TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (`idNotification`),
  UNIQUE INDEX `idNotification_UNIQUE` (`idNotification` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`report` (
  `idReport` INT NOT NULL,
  `Report_Name` VARCHAR(45) NOT NULL,
  `ReportType` VARCHAR(80) NOT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `CreationDate` DATE NOT NULL,
  `Path_Archive2` VARCHAR(100) NULL DEFAULT NULL,
  `Game_idGame` INT NOT NULL,
  `Project_idProject` INT NOT NULL,
  `Task_idTask` INT NOT NULL,
  `Charts_Graphics_idCharts_Graphics` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idReport`),
  UNIQUE INDEX `idReport_UNIQUE` (`idReport` ASC) VISIBLE,
  INDEX `fk_Report_Game1_idx` (`Game_idGame` ASC) VISIBLE,
  INDEX `fk_Report_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  INDEX `fk_Report_Task1_idx` (`Task_idTask` ASC) VISIBLE,
  INDEX `fk_Report_Charts_Graphics1_idx` (`Charts_Graphics_idCharts_Graphics` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Charts_Graphics1`
    FOREIGN KEY (`Charts_Graphics_idCharts_Graphics`)
    REFERENCES `game_bug_tracker`.`charts_graphics` (`idCharts_Graphics`),
  CONSTRAINT `fk_Report_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_Report_Task1`
    FOREIGN KEY (`Task_idTask`)
    REFERENCES `game_bug_tracker`.`task` (`idTask`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `user_name` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(255) NULL DEFAULT NULL,
  `Age` INT NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `nationality` VARCHAR(255) NULL DEFAULT NULL,
  `date_joined` DATE NOT NULL,
  `bio` VARCHAR(255) NULL DEFAULT NULL,
  `access_type` VARCHAR(255) NULL DEFAULT NULL,
  `Company_idCompany` INT NULL DEFAULT NULL,
  `Task_idTask` INT NULL DEFAULT NULL,
  `Notification_idNotification` INT NULL DEFAULT NULL,
  `Comment_idComment` INT NULL DEFAULT NULL,
  `Report_idReport` INT NULL DEFAULT NULL,
  `company_id_company` INT NULL DEFAULT NULL,
  `comment_id_comment` INT NULL DEFAULT NULL,
  `notification_id_notification` INT NULL DEFAULT NULL,
  `task_id_task` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `idUser_UNIQUE` (`id_user` ASC) VISIBLE,
  UNIQUE INDEX `e-mail_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE,
  INDEX `fk_User_Company_idx` (`Company_idCompany` ASC) VISIBLE,
  INDEX `fk_User_Task1_idx` (`Task_idTask` ASC) VISIBLE,
  INDEX `fk_User_Notification1_idx` (`Notification_idNotification` ASC) VISIBLE,
  INDEX `fk_User_Comment1_idx` (`Comment_idComment` ASC) VISIBLE,
  INDEX `fk_User_Report1_idx` (`Report_idReport` ASC) VISIBLE,
  INDEX `fk_user_game1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_User_Comment1`
    FOREIGN KEY (`Comment_idComment`)
    REFERENCES `game_bug_tracker`.`comment` (`idComment`),
  CONSTRAINT `fk_User_Company`
    FOREIGN KEY (`Company_idCompany`)
    REFERENCES `game_bug_tracker`.`company` (`idCompany`),
  CONSTRAINT `fk_User_Notification1`
    FOREIGN KEY (`Notification_idNotification`)
    REFERENCES `game_bug_tracker`.`notification` (`idNotification`),
  CONSTRAINT `fk_User_Report1`
    FOREIGN KEY (`Report_idReport`)
    REFERENCES `game_bug_tracker`.`report` (`idReport`),
  CONSTRAINT `fk_User_Task1`
    FOREIGN KEY (`Task_idTask`)
    REFERENCES `game_bug_tracker`.`task` (`idTask`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`task` (
  `idTask` INT NOT NULL,
  `TaskName` VARCHAR(45) NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `Archive_Path` VARCHAR(100) NULL DEFAULT NULL,
  `User_idUser` INT NOT NULL,
  `Project_idProject` INT NOT NULL,
  PRIMARY KEY (`idTask`),
  UNIQUE INDEX `idTask_UNIQUE` (`idTask` ASC) VISIBLE,
  INDEX `fk_Task_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_Task_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_Task_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`comment` (
  `idComment` INT NOT NULL,
  `CreationDate` DATE NOT NULL,
  `Comment_Text` LONGTEXT NOT NULL,
  `Path_Archive4` VARCHAR(100) NULL DEFAULT NULL,
  `Project_idProject` INT NOT NULL,
  `Task_idTask` INT NOT NULL,
  PRIMARY KEY (`idComment`),
  UNIQUE INDEX `idComment_UNIQUE` (`idComment` ASC) VISIBLE,
  INDEX `fk_Comment_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  INDEX `fk_Comment_Task1_idx` (`Task_idTask` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_Comment_Task1`
    FOREIGN KEY (`Task_idTask`)
    REFERENCES `game_bug_tracker`.`task` (`idTask`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`project` (
  `idProject` INT NOT NULL,
  `ProjectName` VARCHAR(45) NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `User_idUser` INT NOT NULL,
  `Comment_idComment` INT NOT NULL,
  `Game_idGame` INT NOT NULL,
  `Platform_idPlatform` INT NOT NULL,
  PRIMARY KEY (`idProject`),
  UNIQUE INDEX `idProject_UNIQUE` (`idProject` ASC) VISIBLE,
  INDEX `fk_Project_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_Project_Comment1_idx` (`Comment_idComment` ASC) VISIBLE,
  INDEX `fk_Project_Game1_idx` (`Game_idGame` ASC) VISIBLE,
  INDEX `fk_Project_Platform1_idx` (`Platform_idPlatform` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Comment1`
    FOREIGN KEY (`Comment_idComment`)
    REFERENCES `game_bug_tracker`.`comment` (`idComment`),
  CONSTRAINT `fk_Project_Platform1`
    FOREIGN KEY (`Platform_idPlatform`)
    REFERENCES `game_bug_tracker`.`platform` (`idPlatform`),
  CONSTRAINT `fk_Project_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`charts_graphics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`charts_graphics` (
  `idCharts_Graphics` INT NOT NULL,
  `Name_Graphic` VARCHAR(70) NOT NULL,
  `Created_Date` DATE NOT NULL,
  `Task_idTask` INT NOT NULL,
  `Project_idProject` INT NOT NULL,
  `Platform_idPlatform` INT NOT NULL,
  PRIMARY KEY (`idCharts_Graphics`),
  UNIQUE INDEX `idCharts and Graphics_UNIQUE` (`idCharts_Graphics` ASC) VISIBLE,
  INDEX `fk_Charts and Graphics_Task1_idx` (`Task_idTask` ASC) VISIBLE,
  INDEX `fk_Charts and Graphics_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  INDEX `fk_Charts and Graphics_Platform1_idx` (`Platform_idPlatform` ASC) VISIBLE,
  CONSTRAINT `fk_Charts and Graphics_Platform1`
    FOREIGN KEY (`Platform_idPlatform`)
    REFERENCES `game_bug_tracker`.`platform` (`idPlatform`),
  CONSTRAINT `fk_Charts and Graphics_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_Charts and Graphics_Task1`
    FOREIGN KEY (`Task_idTask`)
    REFERENCES `game_bug_tracker`.`task` (`idTask`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`errorlog_bug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`errorlog_bug` (
  `idErrorLog` INT NOT NULL,
  `Bug_Name` VARCHAR(45) NOT NULL,
  `Severity` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `Location_in_Game` VARCHAR(200) NOT NULL,
  `ErrorDescription` LONGTEXT NOT NULL,
  `DateReported` DATE NOT NULL,
  `Category` VARCHAR(255) NOT NULL,
  `Option` VARCHAR(255) NOT NULL,
  `ScreenshotPath` VARCHAR(100) NULL DEFAULT NULL,
  `Game_idGame` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `Project_idProject` INT NOT NULL,
  `Platform_idPlatform` INT NOT NULL,
  PRIMARY KEY (`idErrorLog`),
  UNIQUE INDEX `idErrorLog_UNIQUE` (`idErrorLog` ASC) VISIBLE,
  INDEX `fk_ErrorLog_Game1_idx` (`Game_idGame` ASC) VISIBLE,
  INDEX `fk_ErrorLog_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_ErrorLog_BUG_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  INDEX `fk_ErrorLog_BUG_Platform1_idx` (`Platform_idPlatform` ASC) VISIBLE,
  CONSTRAINT `fk_ErrorLog_BUG_Platform1`
    FOREIGN KEY (`Platform_idPlatform`)
    REFERENCES `game_bug_tracker`.`platform` (`idPlatform`),
  CONSTRAINT `fk_ErrorLog_BUG_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_ErrorLog_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`game` (
  `id_game` INT NOT NULL AUTO_INCREMENT,
  `game_name` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `release_date` VARCHAR(10) NULL DEFAULT NULL,
  `description` TINYTEXT NOT NULL,
  `Status` VARCHAR(255) NULL DEFAULT NULL,
  `Platform_idPlatform` INT NULL DEFAULT NULL,
  `Comment_idComment` INT NULL DEFAULT NULL,
  `Project_idProject` INT NULL DEFAULT NULL,
  `platform` VARCHAR(255) NULL DEFAULT NULL,
  `priority_rate` VARCHAR(150) NULL DEFAULT NULL,
  `user_id_user` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_game`),
  INDEX `fk_game_user1_idx1` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_game_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`technical_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`technical_details` (
  `idTechnical_Details` INT NOT NULL,
  `Loader_Time` DOUBLE NULL DEFAULT NULL,
  `Frame_Rate` INT NULL DEFAULT NULL,
  `CPU_Usage` VARCHAR(45) NULL DEFAULT NULL,
  `GPU_Usage%` INT NULL DEFAULT NULL,
  `Network_Latency` VARCHAR(10) NULL DEFAULT NULL,
  `Imput_Lag` VARCHAR(10) NULL DEFAULT NULL,
  `Average_Bug_Resolution_Day` INT NULL DEFAULT NULL,
  `Secundary_Missions_Completition_Rate` INT NULL DEFAULT NULL,
  `Enemies_Defeat_Hour` INT NULL DEFAULT NULL,
  `Average_Playtime` VARCHAR(45) NULL DEFAULT NULL,
  `Level_Completion_Rate%` INT NULL DEFAULT NULL,
  `Player_Retention_Rate%` INT NULL DEFAULT NULL,
  `AverageTime_Level_Completion` VARCHAR(45) NULL DEFAULT NULL,
  `Average_Score` INT NULL DEFAULT NULL,
  `Average_Speed` VARCHAR(45) NULL DEFAULT NULL,
  `Average_Collisions` INT NULL DEFAULT NULL,
  `Lap_Time` INT NULL DEFAULT NULL,
  `Damage_Level%` INT NULL DEFAULT NULL,
  `Penalty_Count` INT NULL DEFAULT NULL,
  `Items_Collected` VARCHAR(20) NULL DEFAULT NULL,
  `Average_Special_AbilityUsed%` INT NULL DEFAULT NULL,
  `Time_Spent_MiniGames` INT NULL DEFAULT NULL,
  `Map_Exploration_Rate%` INT NULL DEFAULT NULL,
  `Time_Invested_Building_Activities` VARCHAR(45) NULL DEFAULT NULL,
  `Shopping_Time_Frequence` INT NULL DEFAULT NULL,
  `Number_Unclocked_Achievements` INT NULL DEFAULT NULL,
  `Adittions` LONGTEXT NULL DEFAULT NULL,
  `Platform_idPlatform` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idTechnical_Details`),
  UNIQUE INDEX `idTechnical_Details_UNIQUE` (`idTechnical_Details` ASC) VISIBLE,
  INDEX `fk_Technical_Details_Platform1_idx` (`Platform_idPlatform` ASC) VISIBLE,
  INDEX `fk_Technical_Details_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Technical_Details_Platform1`
    FOREIGN KEY (`Platform_idPlatform`)
    REFERENCES `game_bug_tracker`.`platform` (`idPlatform`),
  CONSTRAINT `fk_Technical_Details_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `game_bug_tracker`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `game_bug_tracker`.`test_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game_bug_tracker`.`test_report` (
  `idTest_Report` INT NOT NULL,
  `Test_Identification_Information` VARCHAR(45) NOT NULL,
  `Test_Date` DATE NOT NULL,
  `Path_Archive3` VARCHAR(100) NULL DEFAULT NULL,
  `Executive_Summary` LONGTEXT NOT NULL,
  `Test_Objectives` LONGTEXT NOT NULL,
  `Test_Setup` LONGTEXT NOT NULL,
  `Testing_Methodology` LONGTEXT NOT NULL,
  `Issues_Found` LONGTEXT NOT NULL,
  `Recommendations` LONGTEXT NOT NULL,
  `General_Feedback` LONGTEXT NOT NULL,
  `Project_idProject` INT NOT NULL,
  `Task_idTask` INT NOT NULL,
  PRIMARY KEY (`idTest_Report`),
  UNIQUE INDEX `idTest_Report_UNIQUE` (`idTest_Report` ASC) VISIBLE,
  INDEX `fk_Test_Report_Project1_idx` (`Project_idProject` ASC) VISIBLE,
  INDEX `fk_Test_Report_Task1_idx` (`Task_idTask` ASC) VISIBLE,
  CONSTRAINT `fk_Test_Report_Project1`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `game_bug_tracker`.`project` (`idProject`),
  CONSTRAINT `fk_Test_Report_Task1`
    FOREIGN KEY (`Task_idTask`)
    REFERENCES `game_bug_tracker`.`task` (`idTask`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
