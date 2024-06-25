CREATE VIEW cases_and_deaths AS
WITH get_latest_day_of_mo 
AS
(SELECT 
	*,
	ROW_NUMBER() OVER(PARTITION BY continent, location, DATETRUNC("Month", date) ORDER BY date DESC) AS rnk
FROM CovidDeaths
)
SELECT
	continent,
	location,
	date,
	total_cases,
	total_deaths,
	total_cases_per_million,
	total_deaths_per_million,
	icu_patients,
	icu_patients_per_million,
	hosp_patients,
	hosp_patients_per_million,
	weekly_hosp_admissions,
	weekly_hosp_admissions_per_million
FROM
get_latest_day_of_mo
WHERE
rnk = (SELECT TOP 1 rnk
		FROM get_latest_day_of_mo
		WHERE 
		total_deaths IS NOT NULL
		AND
		total_cases IS NOT NULL
		ORDER BY rnk)
AND
YEAR(date) < 2024


SELECT * FROM 
cases_and_deaths 
ORDER BY 
location,
date


WITH get_latest_day_of_mo 
AS
(SELECT 
	*,
	ROW_NUMBER() OVER(PARTITION BY continent, location, DATETRUNC("Month", date) ORDER BY date DESC) AS rnk
FROM CovidVaccinations
)
SELECT
	continent,
	location,
	date,
	total_tests,
	total_tests_per_thousand,
	total_vaccinations,
	people_vaccinated,
	people_fully_vaccinated,
	total_boosters,
	median_age,
	cardiovasc_death_rate,
	diabetes_prevalence,
	female_smokers,
	male_smokers,
	hospital_beds_per_thousand,
	life_expectancy
FROM get_latest_day_of_mo as b
WHERE
rnk = (SELECT TOP 1 c.rnk
		FROM get_latest_day_of_mo as c
		WHERE 
		c.total_tests IS NOT NULL
		AND
		c.total_vaccinations IS NOT NULL
		ORDER BY rnk)
AND
YEAR(date) < 2024
ORDER BY 
location,
date


SELECT * FROM CovidVaccinations