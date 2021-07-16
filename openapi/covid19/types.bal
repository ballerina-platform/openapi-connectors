// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
public type CovidhistoricalcountryTimeline record {
    # Total cases
    CovidhistoricalallCases cases?;
    # Total deaths
    CovidhistoricalallDeaths deaths?;
    # Total recovered
    CovidhistoricalallRecovered recovered?;
};

# Continent information
public type CovidcontinentContinentinfo record {
    # Latitude
    decimal lat?;
    # Longtitude
    decimal long?;
};

# Covid-19 status in the given USA state
public type CovidState record {
    # State name
    string state?;
    # Last updated timestamp
    decimal updated?;
    # Total cases
    decimal cases?;
    # Today cases
    decimal todayCases?;
    # Total deaths
    decimal deaths?;
    # Today deaths
    decimal todayDeaths?;
    # Active cases
    decimal active?;
    # Cases per one million
    decimal casesPerOneMillion?;
    # Deaths per one million
    decimal deathsPerOneMillion?;
    # Total number of Covid-19 tests administered
    decimal tests?;
    # Covid-19 tests for one million
    decimal testsPerOneMillion?;
    # Population of the state
    decimal population?;
};

# Covid-19 global status
public type CovidAll record {
    # Last updated timestamp
    decimal updated?;
    # Total cases
    decimal cases?;
    # Today cases
    decimal todayCases?;
    # Total deaths
    decimal deaths?;
    # Today deaths
    decimal todayDeaths?;
    # Total recovered
    decimal recovered?;
    # Today recovered
    decimal todayRecovered?;
    # Active cases
    decimal active?;
    # Critical cases
    decimal critical?;
    # Cases per one million
    decimal casesPerOneMillion?;
    # Deaths per one million
    decimal deathsPerOneMillion?;
    # Total number of Covid-19 tests administered
    decimal tests?;
    # Covid-19 tests for one million
    decimal testsPerOneMillion?;
    # World population
    decimal population?;
    # One case per people
    decimal oneCasePerPeople?;
    # One deaths per people
    decimal oneDeathPerPeople?;
    # One tests per people
    decimal oneTestPerPeople?;
    # Active cases per one million
    decimal activePerOneMillion?;
    # Recovered cases per one million
    decimal recoveredPerOneMillion?;
    # Critical cases per one million
    decimal criticalPerOneMillion?;
    # Affected countries
    decimal affectedCountries?;
};

# Covid-19 status of the given country
public type CovidCountry record {
    # Last updated timestamp
    decimal updated?;
    # Country name
    string country?;
    # Country information
    CovidcountryCountryinfo countryInfo?;
    # Total cases
    decimal cases?;
    # Today cases
    decimal todayCases?;
    # Total deaths
    decimal deaths?;
    # Today deaths
    decimal todayDeaths?;
    # Total recovered
    decimal recovered?;
    # Today recovered
    decimal todayRecovered?;
    # Active cases
    decimal active?;
    # Critical cases
    decimal critical?;
    # Cases per one million
    decimal casesPerOneMillion?;
    # Deaths per one million
    decimal deathsPerOneMillion?;
    # Total number of Covid-19 tests administered
    decimal tests?;
    # Covid-19 tests for one million
    decimal testsPerOneMillion?;
    # Total population
    decimal population?;
    # Continent name
    string continent?;
    # One case per people
    decimal oneCasePerPeople?;
    # One death per people
    decimal oneDeathPerPeople?;
    # One test per people
    decimal oneTestPerPeople?;
    # Active cases per one million
    decimal activePerOneMillion?;
    # Recovered cases per one million
    decimal recoveredPerOneMillion?;
    # Critical cases per one million
    decimal criticalPerOneMillion?;
};

# Covid-19 vaccine related data
public type Vaccine record {
    # Candiate Id
    string candidate?;
    # Type of the vaccine
    string mechanism?;
    # Sponsors of the vaccine
    string[] sponsors?;
    # Details
    string details?;
    # Trial phase
    string trialPhase?;
    # Institutions
    string[] institutions?;
};

# Covid19-19 vaccine trial data
public type Vaccines record {
    # Source for the information
    string 'source?;
    # Total number of candidates
    string totalCandidates?;
    # Trial phases
    Phases[] phases?;
    # Vaccine data of each candidate
    Vaccine[] data?;
};

# Covid-19 status of the given continent
public type CovidContinent record {
    # Last updated timestamp
    decimal updated?;
    # Total cases
    decimal cases?;
    # Today cases
    decimal todayCases?;
    # Total deaths
    decimal deaths?;
    # Today deaths
    decimal todayDeaths?;
    # Total recovered
    decimal recovered?;
    # Today recovered
    decimal todayRecovered?;
    # Active cases
    decimal active?;
    # Critical cases
    decimal critical?;
    # Cases per one million
    decimal casesPerOneMillion?;
    # Deaths per one million
    decimal deathsPerOneMillion?;
    # Total number of Covid-19 tests administered
    decimal tests?;
    # Tests per one milliom
    decimal testsPerOneMillion?;
    # Population of the continent
    decimal population?;
    # Continent name
    string continent?;
    # Active cases per one million
    decimal activePerOneMillion?;
    # Recovered cases per one million
    decimal recoveredPerOneMillion?;
    # Critical cases per one million
    decimal criticalPerOneMillion?;
    # Continent information
    CovidcontinentContinentinfo continentInfo?;
    # List of countries in the continent
    string[] countries?;
};

# Total recovered
public type CovidhistoricalallRecovered record {
    # Date
    decimal date?;
};

# Covid-19 historical data of the given province
public type CovidHistoricalProvince record {
    # Country
    string country?;
    # Province
    string province?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    CovidhistoricalcountryTimeline timeline?;
};

# Covid-19 vaccine coverage related data
public type Phases record {
    # Trial phase
    string phase?;
    # Number of candidates
    string candidates?;
};

# Vaccine coverage of each country.
public type VaccineCountryCoverage record {
    # Country
    string country?;
    # Covid-19 Vaccine timeline briefly
    SimpleVaccineTimeline timeline?;
};

# The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
public type CovidHistoricalAll record {
    # Total cases
    CovidhistoricalallCases cases?;
    # Total deaths
    CovidhistoricalallDeaths deaths?;
    # Total recovered
    CovidhistoricalallRecovered recovered?;
};

# Covid-19 historical data of the given country
public type CovidHistoricalCountry record {
    # Country
    string country?;
    # Province
    string[] province?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    CovidhistoricalcountryTimeline timeline?;
};

# Total deaths
public type CovidhistoricalallDeaths record {
    # Date
    decimal date?;
};

# Country information
public type CovidcountryCountryinfo record {
    # Country Id
    decimal _id?;
    # Country ISO2 code
    string iso2?;
    # Country ISO3 code
    string iso3?;
    # Latitude
    decimal lat?;
    # Longtitude
    decimal long?;
    # URL for the country flag
    string flag?;
};

# Total cases
public type CovidhistoricalallCases record {
    # Date
    decimal date?;
};

# Covid-19 Vaccine timeline briefly
public type SimpleVaccineTimeline record {
    # Date
    decimal date?;
};
