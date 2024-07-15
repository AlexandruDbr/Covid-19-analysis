# Covid-19-analysis. An overview of the global impact of Covid-19 pandemic.

## Overview

In this project I used SQL and Power BI to modify, query and analyse a data set containing a multitude of information related to the impact of SARS-COV2 pandemic around the globe, as well as demographic data, by country and date. The data source is the website "Our world in data", a project created by Global Change Data Lab, a non-profit organization based in United Kingdom. <br>
"Our word of data" is maintained by researchers from different prestigious universities aiming to provide accurate data in order to make knowledge on the big problems worldwide accessible and understandable. The data collected is claimed to be from National reports or United Nations reports. <br> 


##  Data set content

### The data set contains the following tables:

1. A SQL view with aggregated data between 2020.01.01 and 2023.12.31 reported by most of the countries around the globe. This table contains the following information: <br>
  * total people vaccinated, 
  * boosters and doses administered,
  * total cases,
  * total deaths,
  * country population,
  * world population, 
  * percentage of population in extreme poverty, 
  * average life expectancy, 
  * GDP per capita, 
  * percentage of people over 64 and 69, 
  * nr. of cardiovascular deaths per 100k people per country, 
  * percentage of smokers by gender <br>

Attached the data in CSV format in "Data set" folder. File name: **"CovidVaccView.csv"** <br>


2. A SQL query containing cases, deaths and hospitalized population data at the end of month, when available, between 2020.01.01 and 2023.12.31 by continent, sub-region, country. <br>

Attached the data in CSV format in "Data set" folder. File name: **"EOM deaths.csv"**


3. A .CSV file containing the population by gender in 2022. Depending on the country, population is either estimated or based on census. 

Attached the data in CSV format in "Data set" folder. File name: **"Population_by_gender_UNdata_Export"**

4. A .CSV file containing continents, sub-regions and countries. This table is used for the sub-regions component in order to be used in analyses.
Attached the data in CSV format in "Data set" folder. File name: **"UNSD — countries and regions.csv"** 
<br><br>

 For column meanings please consult the data dictionary attached in this repository.

### Data accuracy

Take the information presented in this report with a grain of salt. The data could not be entirely verified, as it required an excessive amount of time. This project is intended more for an general overview of the Covid-19 pandemic impact and as showcase of my technical skils. <br>

However, I took the time to verify some information which is fairly easy to access, such as:

  * If the report contains all the countries and which countries are missing. Only 12 small islands did not report, which is non material for this analysis (<1000 inhabitants). These are the following: 
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
    
  * If population by country is from most recent year available and if it is accurate.
  * If GDP per capita is from most recent year available and and if it is accurate.
  * Population by gender https://data.worldbank.org/indicator/SP.POP.TOTL.FE.IN <br>

For data source checked, consult "data dictionary" table,  column "description".

## Analysis starting point:

This dashboard is based on the following requirements: <br>

**1. "Main report" tab"**
  * Evolution of total cases and total deaths per continent and sub-region over the period analysed
  * How accessible were vaccines overall? Were the low income citizens provided the possibility of taking a vaccine shot?
  * What is the vaccination rate and COVID-19 infection rate per continent and sub-region?
  * Evolution of the nr. of hospitalisations by continent and sub-region for the entire period analysed.
  

**2. "Demographics" tab**

  * Create a map which shows population over 64 years old, absolute and relative. Highlight with red the countries where the % of population over 64 is higher than the continent average, and with green when is lower than the average.
  * Create a chart to show the percentage of smokers by gender, continent and sub-region.
  * Create a chart to show the population by gender, continent and sub-region.
  * Create a chart to show the deaths due to cardiovascular diseases by continent and sub-region.
  * Create a chart to show extreme poverty rate by continent and sub-region.

**3. "Scorecards" tab**

* Create a matrix to show Year on Year variantion of cases and deaths per continent, sub-region, country.
* Create a chart to show the countries which registered more than than 5% of total cases per continent.
* Create a chart to show the countries which registered more than 8% of total deaths per continent.
* Create a chart to show top 10 countries with most vaccinated citizens per continent.

