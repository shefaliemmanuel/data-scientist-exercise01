-- Shefali Emmanuel
-- November 19, 2019

-- Step 1: Download RazorSQL
-- Step 2: Import sqlite file 
-- Step 3: Create Query File
-- Step 5: Run the following commands

--References: 
	-- StackOverflow
	-- Inner Join Information: https://www.w3resource.com/sql/joins/perform-an-inner-join.php
	-- SQL Aliases for renaming column headers https://www.w3schools.com/sql/sql_alias.asp

-- show all of the tables
SELECT
	name
FROM
	sqlite_master
WHERE
	type IN ('table',
	'view') AND
	name NOT LIKE 'sqlite_%'
ORDER BY
	1;


SELECT
	--record columns that are just renamed start with records.....
	--record column names that are joined with another start with that tables_name.name...... 

	records.id,
	records.age,
	workclasses.name as workClass,
	education_levels.name as eduLevel,
	records.education_num as eduNum,
	marital_statuses.name as maritalStatus,
	occupations.name as occupation,
	relationships.name as relationship,
	races.name as race,
	sexes.name as sex,
	records.capital_gain as capitalGain,
	records.capital_loss as capitalLoss,
	records.hours_week as hoursPerWeek,
	countries.name as country,
	records.over_50k as over50K

FROM
	records
	-- perform an inner join with all the other tables (alphabetically) based on the id column
		JOIN
		countries
		ON
		records.country_id = countries.id
		JOIN
		education_levels
		ON
		records.education_level_id = education_levels.id
		JOIN
		marital_statuses
		ON
		records.marital_status_id = marital_statuses.id
		JOIN
		occupations
		ON
		records.occupation_id = occupations.id
		JOIN
		races
		ON
		records.race_id = races.id
		JOIN
		relationships
		ON
		records.relationship_id = relationships.id
		JOIN
		sexes
		ON
		records.sex_id = sexes.id
		JOIN
		workclasses
		ON
		records.workclass_id = workclasses.id;

-- Result of the finalzed "flattened" table is the records table

-- Step 6: Export workclassesTable to CSV file
	-- DBTools> Export Data > Current Query Results > Next > Delimited File > Include Column Names in Export> Next
