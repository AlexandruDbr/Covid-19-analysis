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
	ISNULL(hosp_patients,0) AS hosp_patients
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
