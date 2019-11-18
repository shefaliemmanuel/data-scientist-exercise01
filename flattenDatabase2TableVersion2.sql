-- Shefali Emmanuel
-- November 18, 2019

-- Step 1: Download RazorSQL
-- Step 2: Import sqlite file 
-- Step 3: Create Queary File
-- Step 5: Run the following commands

--References: 
	-- StackOverflow
	-- Inner Join Information: https://www.w3resource.com/sql/joins/perform-an-inner-join.php

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

-- perform an inner join with all the other tables (alphabetically)
SELECT
	*
FROM
	records
		INNER JOIN
		countries
		ON
		records.country_id = countries.id
		INNER JOIN
		education_levels
		ON
		records.education_level_id = education_levels.id
		INNER JOIN
		marital_statuses
		ON
		records.marital_status_id = marital_statuses.id
		INNER JOIN
		occupations
		ON
		records.occupation_id = occupations.id
		INNER JOIN
		races
		ON
		records.race_id = races.id
		INNER JOIN
		relationships
		ON
		records.relationship_id = relationships.id
		INNER JOIN
		sexes
		ON
		records.sex_id = sexes.id
		INNER JOIN
		workclasses
		ON
		records.workclass_id = workclasses.id;

	-- Result of the finalzed "flattened" table is the records table

-- Step 6: Export workclassesTable to CSV file
	-- DBTools> Export Data > Current Query Results > Next > Delimited File > select Export Destinatino > Next
