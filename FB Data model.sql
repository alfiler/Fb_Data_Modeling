CREATE TABLE `calendar_table` (
  `Id_Date` date PRIMARY KEY,
  `Year` int,
  `month` int,
  `day` int,
  `month_description` varchar(30),
  `day_description` varchar(30)
);

CREATE TABLE `fb_business_account` (
  `Id_Business` varchar(45) PRIMARY KEY,
  `Name_Business` varchar(255),
  `FB_Page_URL` varchar(255),
  `Website` varchar(255),
  `Erevu_App_Integratesd` bit(1),
  `Active` bit(1),
  `Created_Date` datetime,
  `Entry_Date` datetime
);

CREATE TABLE `fb_ad_account` (
  `Id_AdAccount` varchar(45) PRIMARY KEY,
  `Id_Business` varchar(45),
  `Id_Timezone` int,
  `FB_Page_URL` varchar(255),
  `AdAccount_Full_Id` varchar(45),
  `Name_Account` varchar(255),
  `End_Advertiser` varchar(255),
  `Account_Status` int,
  `Amount_Spent` float,
  `Balance` float,
  `Currency` char(3),
  `Active` bit(1),
  `Created_Date` datetime,
  `Entry_Date` Datetime
);

CREATE TABLE `fb_timezone` (
  `Id_Timezone` int PRIMARY KEY,
  `Name_Timezone` varchar(45),
  `ISOName` varchar(45),
  `UTCOffsetString` char(9),
  `UTCOffset` tinyint,
  `Entry_Date` datetime
);

CREATE TABLE `fb_ad_campaign` (
  `Id_Campaign` varchar(45) PRIMARY KEY,
  `Id_AdAccount` varchar(45),
  `Name_Campaign` varchar(255),
  `Effective_Status` varchar(45),
  `Status` varchar(45),
  `Start_Time` datetime,
  `Stop_Time` datetime,
  `Budget_Remaining` decimal(10,0),
  `Last_Modified` datetime,
  `Created_Date` datetime,
  `Entry_Date` datetime
);

CREATE TABLE `fb_adset` (
  `Id_Adset` varchar(45) PRIMARY KEY,
  `Id_Campaign` varchar(45),
  `Name_Adset` varchar(255),
  `Effective_Status` varchar(45),
  `Billingevent` varchar(64),
  `Optimization_Goal` varchar(45),
  `Daily_Budget` decimal(10,0),
  `Targeting` Json,
  `Start_Time` varchar(45),
  `Created_Date` datetime,
  `Entry_Date` datetime
);

CREATE TABLE `fb_ad` (
  `Id_Ad` varchar(45) PRIMARY KEY,
  `Id_Adset` varchar(45),
  `Name_Ad` varchar(255),
  `Effective_Status` varchar(45),
  `Insight` Json,
  `Created_Date` datetime,
  `Entry_Date` datetime
);

CREATE TABLE `fb_lead` (
  `Id_Lead` varchar(45) PRIMARY KEY,
  `id_Lead_Form` varchar(45),
  `Id_Ad` varchar(45),
  `Name_Lead` varchar(255),
  `Field_Data` Json,
  `Partner` varchar(255),
  `Platform` varchar(45),
  `Created_Date` datetime,
  `Entry_Date` datetime
);

CREATE TABLE `fb_lead_form` (
  `Id_Lead_Form` varchar(45) PRIMARY KEY,
  `Id_Fb_Page` varchar(45),
  `Name_Form` varchar(255),
  `Locale` varchar(45),
  `Status` varchar(45),
  `Entry_Date` datetime
);

CREATE TABLE `fb_page` (
  `Id_Fb_Page` varchar(45) PRIMARY KEY,
  `Id_AdAccount` varchar(45),
  `Name_page` varchar(255),
  `FB_Page_URL` varchar(255),
  `Permitted_Task` Json,
  `Access_Token` varchar(1024),
  `Is_Client_Owned` bit(1),
  `Has_Access` bit(1),
  `Entry_Date` datetime
);

CREATE TABLE `fb_insight` (
  `Id_Insight` varchar(255) PRIMARY KEY,
  `Id_Business` varchar(45),
  `Id_AdAccount` varchar(45),
  `Id_Campaign` varchar(45),
  `Id_Adset` varchar(45),
  `Id_Ad` varchar(45),
  `Id_CRM` varchar(64),
  `Start_Date` Datetime,
  `Name_Account` varchar(255),
  `Name_Campaign` varchar(255),
  `Name_Adset` varchar(255),
  `Name_Ad` varchar(255),
  `Spend` decimal(10,0),
  `Impressions` int,
  `Reach` int,
  `Unique_Clicks` int,
  `Stop_Date` datetime,
  `Entry_Date` datetime
);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Id_Business`) REFERENCES `fb_business_account` (`Id_Business`);

ALTER TABLE `fb_ad_account` ADD FOREIGN KEY (`Id_Timezone`) REFERENCES `fb_timezone` (`Id_Timezone`);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Id_AdAccount`) REFERENCES `fb_ad_account` (`Id_AdAccount`);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Id_Campaign`) REFERENCES `fb_ad_campaign` (`Id_Campaign`);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Id_Adset`) REFERENCES `fb_adset` (`Id_Adset`);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Id_Ad`) REFERENCES `fb_ad` (`Id_Ad`);

ALTER TABLE `fb_lead` ADD FOREIGN KEY (`Id_Ad`) REFERENCES `fb_ad` (`Id_Ad`);

ALTER TABLE `fb_lead_form` ADD FOREIGN KEY (`Id_Lead_Form`) REFERENCES `fb_lead` (`id_Lead_Form`);

ALTER TABLE `fb_page` ADD FOREIGN KEY (`Id_Fb_Page`) REFERENCES `fb_lead_form` (`Id_Fb_Page`);

ALTER TABLE `fb_insight` ADD FOREIGN KEY (`Start_Date`) REFERENCES `calendar_table` (`Id_Date`);
