SELECT * FROM lat.global ORDER BY freelancer_id ASC;
SELECT DISTINCT COUNT(freelancer_id)FROM lat.global;

SELECT "name", TRIM("name")
FROM lat.global;

SELECT
	"gender", CASE
	WHEN gender ILIKE 'f' THEN 'Female'
	WHEN gender ILIKE 'm' THEN 'Male'
	WHEN gender ILIKE 'female' THEN 'Female'
	WHEN gender ILIKE 'male' THEN 'Male'
	ELSE NULL
	END AS gender_proper
FROM lat.global;

UPDATE lat.global
SET gender = CASE
	WHEN gender ILIKE 'f' THEN 'Female'
	WHEN gender ILIKE 'm' THEN 'Male'
	WHEN gender ILIKE 'female' THEN 'Female'
	WHEN gender ILIKE 'male' THEN 'Male'
	ELSE NULL
	END;

SELECT age, ROUND(CAST(age AS DECIMAL),0)AS age_round
FROM lat.global;

UPDATE lat.global
SET age = ROUND(CAST(age AS DECIMAL),0);

ALTER TABLE lat.global ALTER COLUMN age TYPE INTEGER
USING age::integer;

UPDATE lat.global
SET years_of_experience = ROUND(CAST(years_of_experience AS DECIMAL),0);

ALTER TABLE lat.global ALTER COLUMN years_of_experience TYPE INTEGER
USING years_of_experience::integer;

SELECT
	hourly_rate,
	REPLACE(REPLACE(hourly_rate,'$',''), 'USD ', '')
FROM lat.global ; 

UPDATE lat.global
SET hourly_rate = REPLACE(REPLACE(hourly_rate,'$',''), 'USD ', '');

ALTER TABLE lat.global ALTER COLUMN hourly_rate TYPE INTEGER
USING hourly_rate::integer;

SELECT DISTINCT rating FROM lat.global ORDER BY rating ASC;

SELECT 
	is_active, CASE
	WHEN is_active ILIKE '0' THEN 'NO'
	WHEN is_active ILIKE '1' THEN 'YES'
	WHEN is_active ILIKE 'TRUE' THEN 'YES'
	WHEN is_active ILIKE 'FALSE' THEN 'NO'
	WHEN is_active ILIKE 'yes' THEN 'YES'
	WHEN is_active ILIKE 'no' THEN 'NO'
	WHEN is_active ILIKE 'y' THEN 'YES'
	WHEN is_active ILIKE 'n' THEN 'NO'
	ELSE NULL
	END as is_active_2
FROM lat.global;

UPDATE lat.global
SET is_active = CASE
	WHEN is_active ILIKE '0' THEN 'NO'
	WHEN is_active ILIKE '1' THEN 'YES'
	WHEN is_active ILIKE 'TRUE' THEN 'YES'
	WHEN is_active ILIKE 'FALSE' THEN 'NO'
	WHEN is_active ILIKE 'yes' THEN 'YES'
	WHEN is_active ILIKE 'no' THEN 'NO'
	WHEN is_active ILIKE 'y' THEN 'YES'
	WHEN is_active ILIKE 'n' THEN 'NO'
	ELSE NULL
	END;

ALTER TABLE lat.global 
	ALTER COLUMN gender TYPE VARCHAR USING gender::VARCHAR,
	ALTER COLUMN country TYPE VARCHAR USING country::VARCHAR,
	ALTER COLUMN "language" TYPE VARCHAR USING "language"::VARCHAR,
	ALTER COLUMN primary_skill TYPE VARCHAR USING primary_skill::VARCHAR,
	ALTER COLUMN is_active TYPE VARCHAR USING is_active::VARCHAR,
	ALTER COLUMN rating TYPE DECIMAL USING rating::DECIMAL;

SELECT freelancer_id, "name"
FROm lat.global
WHERE freelancer_id IS NULL;