WITH last_day_deaths
AS
(SELECT 
	*,
	ROW_NUMBER() OVER(PARTITION BY continent, location, DATETRUNC("Month", date) ORDER BY date DESC) AS rnk
FROM CovidDeaths
WHERE
total_cases IS NOT NULL
OR
total_deaths IS NOT NULL
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
last_day_deaths
WHERE
rnk = 1
AND
YEAR(date) < 2024
ORDER BY 
continent,
location,
date





WITH last_day_vacc 
AS
(SELECT 
	*,
	ROW_NUMBER() OVER(PARTITION BY continent, location, DATETRUNC("Month", date) ORDER BY date DESC) AS rnk
FROM CovidVaccinations
WHERE
total_tests IS NOT NULL
OR
total_vaccinations IS NOT NULL
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
FROM last_day_vacc  as b
WHERE
YEAR(date) < 2024
AND
rnk = 1
ORDER BY 
continent,
location,
date



SELECT * FROM CovidVaccinations
WHERE
location = 'Angola'
AND
year(date) = 2022
and
month(date) = 9


-- Select the last reported number of people vaccined by country

SELECT 
	iso_code,
	continent,
	location,
	date,
	people_vaccinated,
	people_fully_vaccinated
FROM 
	CovidVaccinations as a
WHERE
	people_vaccinated IS NOT NULL
	and
	date = (SELECT MAX(date) as date 
					from CovidVaccinations as b 
					WHERE 
					a.continent = b.continent
					AND
					a.location = b.location
					AND
					people_vaccinated IS NOT NULL
					AND
					YEAR(b.date) < 2024
			)
ORDER BY date


-- check if data is correct

SELECT * FROM CovidVaccinations
WHERE
location = 'India'
AND
people_vaccinated IS NOT NULL
