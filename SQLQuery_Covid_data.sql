select *
from dbo.covid_Death_Data
where continent is not null
order by 3,4


-- Select Data that we are going to be starting with
select Location, date, total_cases, new_cases, total_deaths, population
from dbo.covid_Death_Data
where continent is not null
order by 1,2

--Looking at Total cases vs Total Population
--Shows what percentage of popolation got covid

select Location, date, total_cases, population, (total_cases/population)*100 As infected_percentage
from dbo.covid_Death_Data
order by 1,2

--Looking at countries with highest infection rate compared to population
select location,Max(Total_cases) AS Highest_Infection_count,population,Max((total_cases/population))*100 As infected_percentage_population
from dbo.covid_Death_Data
Group by location, population
order by infected_percentage_population desc


--Looking at countries with highest death rate per population
select location,Max(total_deaths) AS Highest_death_count,population,Max((total_deaths/population))*100 AS Death_percentage_population
from dbo.covid_Death_Data
Group by location, population
order by Death_percentage_population desc

select location,total_deaths,MAX((total_deaths/population))*100 AS percentage_death_population
from dbo.covid_Death_Data
group by  location, total_deaths 
order by percentage_death_population desc

--Showing Countries with Highest Death Count per population

select location,Max(cast(Total_deaths as int )) as Totaldeathcount
from dbo.covid_Death_Data
Where continent is not null
group by  location
order by Totaldeathcount desc

--Break it by Continenet

select continent,Max(cast(Total_deaths as int )) as Totaldeathcount
from dbo.covid_Death_Data
Where continent is not null
group by  continent
order by Totaldeathcount desc

--India NUMBERS
select  location,date, total_cases,total_deaths, (total_deaths/population)*100 As Death_percentage
from dbo.covid_Death_Data
--where location like '%india%'
where location = 'India' 




Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From dbo.covid_Death_Data
Group by Location, Population, date
order by PercentPopulationInfected desc






 

