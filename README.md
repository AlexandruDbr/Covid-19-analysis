# Covid-19-analysis

## Overview:

This project has arisen from a public SQL project initiative found on the internet, created by a data analyst and content creator "Alex the analyst". His project idea has been focused only on data manipulation and data cleaning with SQL. After I finished my own version of the project, I decided to create a SQL view based on the original dataset with a few columns that I found useful in responding to some questions with regards to the COVID-19 pandemic using Power BI. <br> 


###  Data set

#### Key information about the data source: <br>
The data set source is from the page "Our world in data", which is a non-profit project by Global Change Data Lab, a non-profit organization based in the United Kingdom. "Our word of data" is maintained by researchers aiming to provide accurate data in order to make knowledge on the big problems worldwide accessible and understandable. <br> <br>

The data set is a summarization (SQL view) build from two tables, Covid Vaccinations and Covid Deaths, reported by almost all countries around the globe, from reporting period: 2020.01.01 - 2023.12.31 containing the following information:  <br>
  * total people vaccinated and fully vaccinated, 
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
 
 For column meanings please consult the data dictionary attached in this repository.

The following demographic information has been verified by myself (check data dictionary, "description" column):
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
    
  * If country population was from most recent year available and data correctness
  * If GDP per capita is from most recent year available and data correctness

## Analysis starting point and insights

### Analysis starting point

By doing this analysis I tried to answer the following questions: <br>
* Has vaccination significantly reduced the incidence rate of COVID-19 overall?
* Which continents have an increased number of people over 69 years old? Were these countries highly impacted compared to other countries with a smaller rate of seniors?
* How accessible were vaccines overall? Were the low income citizens provided the possibility of taking a vaccine shot?
* What was the number of people vaccinated with at least 1 dose per continent?
* What was the total number of Covid cases per continent? Which countries had total number of cases >= than 5% of total continent cases?
* What was the total number of Covid deaths per continent? Which countries had total number of deaths >= than 8% of total continent deaths?
* What was the number of world population, total people vaccinated with at least 1 dose, total cases and total deaths? Create 4 cards to show the results.

### Analysis insights:

Analysis insights can be found in the Power Bi file for each chart type or altogether.

## Requirements

To use this PowerBI dashboard, you will need:

* Microsoft PowerBI Desktop installed on your computer.
* Access to data source from GitHub or PowerBI service link.
* Basic understanding of PowerBI to navigate and interact with the dashboard. 

## Future posible enhancements

* A more detailed analysis based on time series by day, month, year evolution in cases, vaccinations and deaths.
* An analysis of cases and deaths based on other demographic information such as: population density per sq meter, percentage of cardiovascular deaths per country and/or continent, number of hospitals, number of beds per intensive care units.
