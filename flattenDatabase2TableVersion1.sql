-- Shefali Emmanuel
-- November 18, 2019

-- Step 1: Open Google Chrome
-- Step 2: Install SQLLiteManager 
    -- Link: https://chrome.google.com/webstore/detail/sqlite-manager/njognipnngillknkhikjecpnbkefclfe?hl=en
-- Step 3: Open SQLLiteManager
-- Step 4: Import Data (File > Open a Database > Select Downlaoded exercise01.sqlite File)
-- Step 5: Run the following commands

-- show all of the tables
SELECT name FROM sqlite_master WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%' ORDER BY 1

--Joining countries with records
CREATE TABLE countryTable AS
SELECT * 
FROM  records join countries on records.country_id=countries.id 

/*
--check the output
SELECT *
FROM  countryTable
*/

--Joining countryTable with education_levels
CREATE TABLE educationTable AS
SELECT * 
FROM  countryTable join education_levels on countryTable.education_level_id=education_levels.id

/*
--check the output
SELECT *
FROM  educationTable
*/

--Joining educationTable with marital_statuses
CREATE TABLE maritalStatusesTable AS
SELECT * 
FROM  educationTable join marital_statuses on educationTable.marital_status_id=marital_statuses.id

/*
--check the output
SELECT *
FROM  maritalStatusesTable
*/

--Joining maritalStatusesTable with occupations
CREATE TABLE occupationsTable AS
SELECT * 
FROM  maritalStatusesTable join occupations on maritalStatusesTable.occupation_id=occupations.id

/*
--check the output
SELECT *
FROM  occupationsTable
*/

--Joining occupationsTable with races
CREATE TABLE racesTable AS
SELECT * 
FROM  occupationsTable join races on occupationsTable.race_id=races.id

/*
--check the output
SELECT *
FROM  racesTable
*/

--Joining racesTable with sexes
CREATE TABLE sexesTable AS
SELECT * 
FROM  racesTable join sexes on racesTable.sex_id=sexes.id

/*
--check the output
SELECT *
FROM  sexesTable
*/

--Joining sexesTable with workclasses
CREATE TABLE workclassesTable AS
SELECT * 
FROM  sexesTable join workclasses on sexesTable.workclass_id=workclasses.id

--check the output
SELECT *
FROM  workclassesTable
-- Result of the finalzed "flattened" table is the "workclassesTable"