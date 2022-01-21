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

import ballerina/http;

# This is a generated connector from [Novel COVID-19 API version 3.0.0](https://disease.sh/docs/) OpenAPI Specification.
# Ballerina connector for COVID-19 provides easy access to latest COVID-19 related data across the world. Please refer to [API documentation](https://disease.sh) for more detail.
@display {label: "COVID-19", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://disease.sh") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get global COVID-19 totals for today, yesterday and two days ago
    #
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Global COVID-19 status 
    remote isolated function getGlobalStatus(string? yesterday = (), string? twoDaysAgo = (), string? allowNull = ()) returns CovidAll|error {
        string resourcePath = string `/v3/covid-19/all`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidAll response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for all US States
    #
    # + sort - Provided a key (e.g. cases, todayCases, deaths, active), result will be sorted from greatest to least 
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Status OK 
    remote isolated function getAllUSAStatesStatus(string? sort = (), string? yesterday = (), string? allowNull = ()) returns CovidStates|error {
        string resourcePath = string `/v3/covid-19/states`;
        map<anydata> queryParam = {"sort": sort, "yesterday": yesterday, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidStates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for specific US State(s)
    #
    # + states - State name or comma separated names spelled correctly 
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - COVID-19 status of the given US state 
    remote isolated function getUSAStatusByState(string states, string? yesterday = (), string? allowNull = ()) returns CovidState|error {
        string resourcePath = string `/v3/covid-19/states/${states}`;
        map<anydata> queryParam = {"yesterday": yesterday, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidState response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for all continents
    #
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + sort - Provided a key (e.g. cases, todayCases, deaths, recovered, active), results will be sorted from greatest to least 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Status OK 
    remote isolated function getAllContinentsStatus(string? yesterday = (), string? twoDaysAgo = (), string? sort = (), string? allowNull = ()) returns CovidContinents|error {
        string resourcePath = string `/v3/covid-19/continents`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "sort": sort, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidContinents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for a specific continent
    #
    # + continent - Continent name 
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + strict - Setting to false gives you the ability to fuzzy search continents (i.e. Oman vs. rOMANia) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - COVID-19 status of the given continent 
    remote isolated function getStatusByContinent(string continent, string? yesterday = (), string? twoDaysAgo = (), string strict = "true", string? allowNull = ()) returns CovidContinent|error {
        string resourcePath = string `/v3/covid-19/continents/${continent}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "strict": strict, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidContinent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for all countries
    #
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + sort - Provided a key (e.g. cases, todayCases, deaths, recovered, active), the result will be sorted from greatest to least 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Status OK 
    remote isolated function getAllCountriesStatus(string? yesterday = (), string? twoDaysAgo = (), string? sort = (), string? allowNull = ()) returns CovidCountries|error {
        string resourcePath = string `/v3/covid-19/countries`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "sort": sort, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for a specific country
    #
    # + country - A country name, iso2, iso3, or country ID code 
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + strict - Setting to false gives you the ability to fuzzy search countries (i.e. Oman vs. rOMANia) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - COVID-19 status of the given country 
    remote isolated function getStatusByCountry(string country, string? yesterday = (), string? twoDaysAgo = (), string strict = "true", string? allowNull = ()) returns CovidCountry|error {
        string resourcePath = string `/v3/covid-19/countries/${country}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "strict": strict, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidCountry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for a specific set of countries
    #
    # + countries - Multiple country names, iso2, iso3, or country IDs separated by commas 
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0) 
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0) 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Status OK 
    remote isolated function getMultipleCountriesStatus(string countries, string? yesterday = (), string? twoDaysAgo = (), string? allowNull = ()) returns CovidCountries|error {
        string resourcePath = string `/v3/covid-19/countries/${countries}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for all countries and their provinces
    #
    # + return - Status OK 
    remote isolated function getAllCountriesAndProvincesStatus() returns CovidJHUCountries|error {
        string resourcePath = string `/v3/covid-19/jhucsse`;
        CovidJHUCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for all US counties
    #
    # + return - Status OK 
    remote isolated function getUSCountiesStatus() returns CovidJHUCounties|error {
        string resourcePath = string `/v3/covid-19/jhucsse/counties`;
        CovidJHUCounties response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 totals for a specific county
    #
    # + county - Name of any county in the USA. All counties are listed in the /v3/covid-19/jhucsse/counties/ endpoint 
    # + return - Status OK 
    remote isolated function getUSAStatusByCounty(string county) returns CovidJHUCounties|error {
        string resourcePath = string `/v3/covid-19/jhucsse/counties/${county}`;
        CovidJHUCounties response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for all countries and their provinces
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status OK 
    remote isolated function getTimeSeriesForAllCountriesAndProvinces(string lastdays = "30") returns CovidHistorical|error {
        string resourcePath = string `/v3/covid-19/historical`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistorical response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get global accumulated COVID-19 time series data
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getGlobalStatusInTimeSeries(string lastdays = "30") returns CovidHistoricalAll|error {
        string resourcePath = string `/v3/covid-19/historical/all`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalAll response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a specific country
    #
    # + country - A country name, iso2, iso3, or country ID code 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - COVID-19 related time series for the given country 
    remote isolated function getTimeSeriesBycountry(string country, string lastdays = "30") returns CovidHistoricalCountry|error {
        string resourcePath = string `/v3/covid-19/historical/${country}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalCountry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a specific set of countries
    #
    # + countries - Multiple country names, iso2, iso3, or country IDs separated by commas 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesOfMultipleCountries(string countries, string lastdays = "30") returns CovidHistoricalCountries|error {
        string resourcePath = string `/v3/covid-19/historical/${countries}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a specific province in a country
    #
    # + country - A country name, iso2, iso3, or country ID code 
    # + province - Province name. All available names can be found in the /v3/covid-19/historical/{query} endpoint 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesByProvince(string country, string province, string lastdays = "30") returns CovidHistoricalProvince|error {
        string resourcePath = string `/v3/covid-19/historical/${country}/${province}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalProvince response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a set of provinces in a country
    #
    # + country - A country name, iso2, iso3, or country ID code 
    # + provinces - Provinces spelled correctly separated by ',' or '|' delimiters, never both in the same query 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesDataForMultipleProvinces(string country, string provinces, string lastdays = "30") returns CovidHistoricalProvinces|error {
        string resourcePath = string `/v3/covid-19/historical/${country}/${provinces}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalProvinces response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all possible US States to query the /historical/usacounties/{state} endpoint with
    #
    # + return - Status OK 
    remote isolated function getTimeSeriesForUSACounties() returns CovidHistoricalUSCounties|error {
        string resourcePath = string `/v3/covid-19/historical/usacounties`;
        CovidHistoricalUSCounties response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for all counties in a specified US state
    #
    # + state - US state name, validated in the array returned from the /v3/covid-19/historical/usacounties endpoint 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getUSACountiesDataByState(string state, string lastdays = "30") returns CovidHistoricalUSCounty|error {
        string resourcePath = string `/v3/covid-19/historical/usacounties/${state}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidHistoricalUSCounty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for all states, with an entry for each day since the pandemic began
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesForAllUSAStatesNYT(string lastdays = "30") returns CovidNYTState|error {
        string resourcePath = string `/v3/covid-19/nyt/states`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidNYTState response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a state or set of states, with an entry for each day since the pandemic began
    #
    # + state - State name(s), separated by commas (e.g. 'Illinois, California') 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesByUSAStateNYT(string state, string lastdays = "30") returns CovidNYTState|error {
        string resourcePath = string `/v3/covid-19/nyt/states/${state}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidNYTState response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for a county or set of counties, with an entry for each day since the pandemic began
    #
    # + county - County name(s), separated by commas (e.g. 'Alameda, Humboldt') 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + return - Status Ok 
    remote isolated function getTimeSeriesByUSACountyNYT(string county, string lastdays = "30") returns CovidNYTCounty|error {
        string resourcePath = string `/v3/covid-19/nyt/counties/${county}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CovidNYTCounty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 time series data for the entire USA, with an entry for each day since the pandemic began
    #
    # + return - Status Ok 
    remote isolated function getTimeSeriesForUSANYT() returns CovidNYTUSA|error {
        string resourcePath = string `/v3/covid-19/nyt/usa`;
        CovidNYTUSA response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of supported countries for Apple mobility data
    #
    # + return - Status Ok 
    remote isolated function getAppleMobilityDataSupportedCountries() returns CovidAppleCountries|error {
        string resourcePath = string `/v3/covid-19/apple/countries`;
        CovidAppleCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of supported subregions for specific country in the Apple mobility data set
    #
    # + country - A valid country name from the /v3/covid-19/apple/countries endpoint 
    # + return - Status Ok 
    remote isolated function getAppleMobilityDataSupportedSubRegions(string country) returns CovidAppleSubregions|error {
        string resourcePath = string `/v3/covid-19/apple/countries/${country}`;
        CovidAppleSubregions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 Apple mobility data for subregions of a country
    #
    # + country - A valid country name from the /v3/covid-19/apple/countries endpoint 
    # + subregions - Valid subregion(s) from the /v3/covid-19/apple/countries/{country} endpoint, separated by with commas 
    # + return - Status Ok 
    remote isolated function getStatusBySubRegionUsingAppleMobilotyData(string country, string subregions) returns CovidAppleData|error {
        string resourcePath = string `/v3/covid-19/apple/countries/${country}/${subregions}`;
        CovidAppleData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of supported countries for government specific data
    #
    # + return - Status Ok 
    remote isolated function getGovenrmentDataSupportedCountries() returns CovidGov|error {
        string resourcePath = string `/v3/covid-19/gov/`;
        CovidGov response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 government reported data for a specific country
    #
    # + country - A valid country name from the /v3/covid-19/gov endpoint 
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned 
    # + return - Status Ok 
    remote isolated function getGovernmentReportedDataByCountry(string country, string? allowNull = ()) returns http:Response|error {
        string resourcePath = string `/v3/covid-19/gov/${country}`;
        map<anydata> queryParam = {"allowNull": allowNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get vaccine trial data from RAPS (Regulatory Affairs Professional Society). Specifically published by Jeff Craven at https://www.raps.org/news-and-articles/news-articles/2020/3/covid-19-vaccine-tracker
    #
    # + return - Vaccine trial data 
    remote isolated function getVaccineTrialData() returns Vaccines|error {
        string resourcePath = string `/v3/covid-19/vaccine`;
        Vaccines response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get total global COVID-19 vaccine doses administered. Sourced from https://covid.ourworldindata.org/
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + fullData - Flag indicating whether to return data type as SimpleVaccineTimeline (false) or FullVaccineTimeline (true). 
    # + return - Vaccine coverage data 
    remote isolated function getTotalGlobalVaccineDosesAdministered(string lastdays = "30", string fullData = "false") returns VaccineCoverage|error {
        string resourcePath = string `/v3/covid-19/vaccine/coverage`;
        map<anydata> queryParam = {"lastdays": lastdays, "fullData": fullData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VaccineCoverage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 vaccine doses administered for all countries that have reported rolling out vaccination. Sourced  from https://covid.ourworldindata.org/
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + fullData - Flag indicating whether to return data type as SimpleVaccineTimeline (false) or FullVaccineTimeline (true). 
    # + return - Status Ok 
    remote isolated function getVaccineCoverageOfAllCountries(string lastdays = "30", string fullData = "false") returns VaccineCountriesCoverage|error {
        string resourcePath = string `/v3/covid-19/vaccine/coverage/countries`;
        map<anydata> queryParam = {"lastdays": lastdays, "fullData": fullData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VaccineCountriesCoverage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 vaccine doses administered for a country that has reported vaccination rollout. Sourced from https://covid.ourworldindata.org/
    #
    # + country - A valid country name, iso2, iso3 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + fullData - Flag indicating whether to return data type as SimpleVaccineTimeline (false) or FullVaccineTimeline (true). 
    # + return - Status Ok 
    remote isolated function getVaccineCoverageByCountry(string country, string lastdays = "30", string fullData = "false") returns VaccineCountryCoverage|error {
        string resourcePath = string `/v3/covid-19/vaccine/coverage/countries/${country}`;
        map<anydata> queryParam = {"lastdays": lastdays, "fullData": fullData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VaccineCountryCoverage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 vaccine doses administered for all states that have reported rolling out vaccination. Sourced  from https://covid.ourworldindata.org/
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + fullData - Flag indicating whether to return data type as SimpleVaccineTimeline (false) or FullVaccineTimeline (true). 
    # + return - Status Ok 
    remote isolated function getVaccineCoverageOfAllUSAStates(string lastdays = "30", string fullData = "false") returns VaccineStatesCoverage|error {
        string resourcePath = string `/v3/covid-19/vaccine/coverage/states`;
        map<anydata> queryParam = {"lastdays": lastdays, "fullData": fullData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VaccineStatesCoverage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get COVID-19 vaccine doses administered for a state that has reported vaccination rollout. Sourced from https://covid.ourworldindata.org/
    #
    # + state - A valid state name 
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24) 
    # + fullData - Flag indicating whether to return data type as SimpleVaccineTimeline (false) or FullVaccineTimeline (true). 
    # + return - Status Ok 
    remote isolated function getVaccineCoverageByUSAState(string state, string lastdays = "30", string fullData = "false") returns VaccineStateCoverage|error {
        string resourcePath = string `/v3/covid-19/vaccine/coverage/states/${state}`;
        map<anydata> queryParam = {"lastdays": lastdays, "fullData": fullData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VaccineStateCoverage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get therapeutics trial data from RAPS (Regulatory Affairs Professional Society). Specifically published by Jeff Craven at https://www.raps.org/news-and-articles/news-articles/2020/3/covid-19-therapeutics-tracker
    #
    # + return - Status Ok 
    remote isolated function getTherapeuticsTrialData() returns Therapeutics|error {
        string resourcePath = string `/v3/covid-19/therapeutics`;
        Therapeutics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Influenza-like-illness data for the 2019 and 2020 outbreaks from the US Center for Disease Control
    #
    # + return - Status Ok 
    remote isolated function getInfluenzaLikeIllnessData() returns InfluenzaILINet|error {
        string resourcePath = string `/v3/influenza/cdc/ILINet`;
        InfluenzaILINet response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Influenza report data for the 2019 and 2020 outbreaks from the US Center for Disease Control, reported by US clinical labs
    #
    # + return - Status Ok 
    remote isolated function getInfluenzaReportsByUCLA() returns InfluenzaUSCL|error {
        string resourcePath = string `/v3/influenza/cdc/USCL`;
        InfluenzaUSCL response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Influenza report data for the 2019 and 2020 outbreaks from the US Center for Disease Control, reported by US public health labs
    #
    # + return - Status Ok 
    remote isolated function getInfluenzaReportsByUSPHL() returns InfluenzaUSPHL|error {
        string resourcePath = string `/v3/influenza/cdc/USPHL`;
        InfluenzaUSPHL response = check self.clientEp->get(resourcePath);
        return response;
    }
}
