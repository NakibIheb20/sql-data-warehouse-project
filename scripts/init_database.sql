
/*
--------------------------------------------------------------------------------
-- Project: Data Warehouse Setup Script
-- Author: [Your Name or Team Name]
-- Description:
--     This script is used to initialize the 'Datawarehouse' database.
--     It performs the following actions:
--         1. Drops the existing 'Datawarehouse' database if it exists.
--         2. Recreates the 'Datawarehouse' database.
--         3. Creates the core schemas used for data processing layers:
--            - bronze: Raw data layer
--            - silver: Cleaned/transformed data layer
--            - gold: Business-ready data layer
-- Usage:
--     Execute this script only when a full reset of the data warehouse 
--     environment is required. All existing data in the 'Datawarehouse' 
--     database will be lost.
--------------------------------------------------------------------------------
*/



USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

-- Create the "Datawarehouse" database
CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
