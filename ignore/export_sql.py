import pandas as pd
from sqlalchemy.engine import URL
from sqlalchemy import create_engine
import pyodbc

url_obj = URL.create(
    "mssql+pyodbc",
     host= "ALEXANDRUPC\SQLSERVER2022",
     database= "ProjectsDB",
     query= {
         "driver": "ODBC Driver 18 for SQL Server",
         "TrustServerCertificate": "yes",
         "authentication": "ActiveDirectoryIntegrated",
     },
)

con = create_engine(url_obj)

file_path = "D:\Projects and practice\PBI practice\Covid-19 project\coviddata.xlsx"

with con.connect() as conn, conn.begin():
    df = pd.read_sql_query('''SELECT
	a.iso_code,
	a.continent,
	a.location,
	population = MAX(b.population),
	world_population = MAX(b.world_pop),
	total_people_vaccinated =  /*Total number of people who received at least one vaccine dose*/
			ISNULL(
				MAX(a.people_vaccinated),0),
    total_vaccination =   /*Total number of COVID-19 vaccination doses administered*/
			ISNULL(
				MAX(a.total_vaccinations),0),
	dose_nr_avg = ROUND(ISNULL(  /*Average nr. of COVID-19 vaccination doses per person vaccinated*/
				MAX(a.total_vaccinations),0)
					/MAX(a.people_vaccinated),0),
	total_boosers = 
			ISNULL(
				MAX(a.total_boosters),0),/*Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol)*/
	total_cases = 
			ISNULL(
				MAX(c.total_c),0),  /*Total confirmed cases of COVID-19. Counts can include probable cases, where reported.*/
	total_deaths = 
			ISNULL(
				MAX(c.total_d),0),  /*Total deaths attributed to COVID-19. Counts can include probable deaths, where reported.*/
	population_over_64 = 
			ISNULL(
				MAX(a.aged_65_older),0),  /*Share of the population that is 65 years and older in 2015 */
	population_over_69 = 
			ISNULL(
				MAX(a.aged_70_older),0), /*Share of the population that is 70 years and older in 2015 */
	extreme_poverty_rate = 
			ISNULL(
				MAX(a.extreme_poverty),0), /*Share of the population living in extreme poverty, most recent year available since 2010*/
	life_exp = 
			ISNULL(
				MAX(a.life_expectancy),0), /*Life expectancy at birth in 2019*/
	handwashing_fac_rate = 
			ISNULL(
				MAX(a.handwashing_facilities),0), /*Share of the population with basic handwashing facilities on premises, most recent year available */
	cardiov_deaths_per100k = 
			ISNULL(
				MAX(a.cardiovasc_death_rate),0),
	male_smokers_perc = 
			ISNULL(
				MAX(a.male_smokers),0), /*share of men who smoke in most recent year available*/
	female_smokers_perc = 
			ISNULL(
				MAX(a.female_smokers), 0), /*share of woman who smoke in most recent year available*/
	gdp_per_capita = 
			ISNULL(
				MAX(a.gdp_per_capita), 0)
FROM CovidVaccinations AS a
LEFT JOIN
	(SELECT  /* get population from CovidDeaths table */
		iso_code,
		population,
		world_pop = SUM(population) OVER()
	FROM CovidDeaths
	WHERE 
		continent IS NOT NULL
	OR
		location NOT IN ('Africa', 'Europe', 'North America', 
		'South America', 'Oceania', 'Asia', 'European Union', 'World', 'International', 
		'High income', 'Low income', 'Low middle income', 'Upper middle income', 'Lower middle income')
	GROUP BY iso_code, population
	) AS b
ON
	a.iso_code = b.iso_code
LEFT JOIN
	(SELECT
		iso_code,
		continent,
		location,
		MAX(total_cases) total_c, /* get the latest number of total cases not null*/
		MAX(total_deaths) total_d /* get the latest number of total death not null*/
	FROM CovidDeaths
	WHERE 
		iso_code IS NOT NULL
		AND
		continent IS NOT NULL
		AND
		location IS NOT NULL
	GROUP BY iso_code, continent, location
	) AS c
ON
	b.iso_code = c.iso_code
WHERE 
	a.continent IS NOT NULL
OR
	a.location NOT IN ('Africa', 'Europe', 'North America', 
	'South America', 'Oceania', 'Asia', 'European Union', 'World', 'International', 
	'High income', 'Low income', 'Low middle income', 'Upper middle income', 'Lower middle income')
GROUP BY  a.iso_code, a.continent, a.location
''', conn)

    df.to_excel(file_path, index_label='SEQ')