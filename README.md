# Covid-19-analysis

## Overview:

This project idea has arisen from a public SQL project initiative found on the internet, created by a data analyst "Alex the analyst". His project idea has been focused only on data manipulation and data cleaning with SQL. After I finished my own version of the project, I decided to create a few SQL views based on the original data set and to analyse the data using Power BI, based on a series of questions, listed below. <br> 


###  Data set

#### Data set origins and key information about dashboard's data source: <br>
The data set source is from a website called "Our world in data", a project created by Global Change Data Lab, a non-profit organization based in the United Kingdom. "Our word of data" is maintained by researchers from different prestigious universities aiming to provide accurate data in order to make knowledge on the big problems worldwide accessible and understandable. <br> <br>

The data set contains the following tables:

1. A SQL view with aggregated data from the period: 2020.01.01 and 2023.12.31 reported by most of the countries around the globe. This table contains the following information: <br>
  * total people vaccinated, 
  * boosters and doses administered,
  * total cases,
  * total deaths,
  * country population,
  * world population, 
  * percentage of population in extreme poverty, 
  * average life expectancy, GDP per capita, 
  * percentage of people over 64 and 69, 
  * nr. of cardiovascular deaths per 100k people per country, 
  * percentage of male and female population who are smokers. <br>

 **Attached a .CSV version.** <br>
* File name: "CovidVaccView.csv" 

2. A SQL query containing cases, deaths and hospitalized population data at the end of month, for each month (when available) between 2020.01.01 and 2023.12.31 by continent, sub-region, country. **Attached a .CSV version.**
* File name: "EOM deaths.csv"


3. A .CSV file containing the population by gender in 2022. Depending on the country, population is either estimated or based on census. 
  * File name: "Population_by_gender_UNdata_Export"

4. A .CSV file containing continents, sub-regions and countries.
  * File name: "UNSD — countries and regions.csv" <br><br>



 For column meanings please consult the data dictionary attached in this repository.

The following data has been verified by myself. For data source checked, consult "data dictionary" table,  column "description":
  * If all countries from the world reported data to WHO and which countries were missing. Only 12 small islands did not report, which is non material for this analysis. Link of the data source: 
    * British Indian Ocean Territory
    * French Southern Territories
    * Bouvet Island
    * South Georgia and the South Sandwich Islands
    * Antarctica
    * Åland Islands
    * Svalbard and Jan Mayen Islands
    * Christmas Island
    * Cocos (Keeling) Islands
    * Heard Island and McDonald Islands
    * Norfolk Island
    * United States Minor Outlying Islands
    
  * If country population was from most recent year available and if it is accurate
  * If GDP per capita is from most recent year available and data correctness
  * Population by gender https://data.worldbank.org/indicator/SP.POP.TOTL.FE.IN

## Analysis starting point:

This dashboard is based on the following requirements: <br>

**1. "Main report" tab"**
  * Evolution of total cases and total deaths per continent and sub-region over the period analysed
  * How accessible were vaccines overall? Were the low income citizens provided the possibility of taking a vaccine shot?
  * What is the vaccination rate and COVID-19 infection rate per continent and sub-region?
  * Evolution of the nr. of hospitalisations by continent and sub-region for the entire analysed period.
  

**2. "Demographics" tab**

  * Create a map which shows population over 64 years old. Highlight with red the countries where the % of population over 64 is higher than the continent average, and with green when is lower than the average.
  * Create a chart to show the percentage of smokers by gender, continent and sub-region.
  * Create a chart to show the population by gender, continent and sub-region.
  * Create a chart to show the deaths due to cardiovascular diseases by continent and sub-region.
  * Create a chart to show extreme poverty rate by continent and sub-region.

**3. "Scorecards" tab**

* Create a matrix to show Year on Year variantion of cases and deaths per continent, sub-region, country.
* Create a chart to show the countries which registered more than than 5% of total cases per continent.
* Create a chart to show the countries which registered more than 8% of total deaths per continent.
* Create a chart to show top 10 countries with most vaccinated citizens per continent.

