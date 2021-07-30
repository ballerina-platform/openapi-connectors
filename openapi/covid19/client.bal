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
import ballerina/url;
import ballerina/lang.'string;

# This is a generated connector from [Novel Covid19 API version 3.0.0](https://disease.sh/docs/) OpenAPI Specification.
# Ballerina connector for Covid19 provides easy access to latest Covid19 related data across the world. Please refer to [API documentation](https://disease.sh) for more detail.
@display {label: "Covid19 Client"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://disease.sh") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get global COVID-19 totals for today, yesterday and two days ago.
    #
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0)
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0)
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned
    # + return - Global Covid-19 status
    @display {label: "Global Status"}
    remote isolated function getGlobalStatus(@display {label: "Yesterday"} string? yesterday = (), @display {label: "Two Days Ago"} string? twoDaysAgo = (), @display {label: "Allow Null"} string? allowNull = ()) returns CovidAll|error {
        string  path = string `/v3/covid-19/all`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "allowNull": allowNull};
        path = path + check getPathForQueryParam(queryParam);
        CovidAll response = check self.clientEp-> get(path, targetType = CovidAll);
        return response;
    }
    # Get COVID-19 totals for specific US State(s).
    #
    # + states - State name or comma separated names spelled correctly
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0)
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned
    # + return - Covid-19 status of the given US state
    @display {label: "USA State Status"}
    remote isolated function getUSAStatusByState(@display {label: "State Name"} string states, @display {label: "Yesterday"} string? yesterday = (), @display {label: "Allow Null"} string? allowNull = ()) returns CovidState|error {
        string  path = string `/v3/covid-19/states/${states}`;
        map<anydata> queryParam = {"yesterday": yesterday, "allowNull": allowNull};
        path = path + check getPathForQueryParam(queryParam);
        CovidState response = check self.clientEp-> get(path, targetType = CovidState);
        return response;
    }
    # Get COVID-19 totals for a specific continent.
    #
    # + continent - Continent name
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0)
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0)
    # + strict - Setting to `false` gives you the ability to fuzzy search continents (i.e. Oman vs. rOMANia). Default is `true`.
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned
    # + return - Covid-19 status of the given continent
    @display {label: "Continent Status"}
    remote isolated function getStatusByContinent(@display {label: "Continent"} string continent, @display {label: "Yesterday"} string? yesterday = (), @display {label: "Two Days Ago"} string? twoDaysAgo = (), @display {label: "Strict"} string strict = "true", @display {label: "Allow Null"} string? allowNull = ()) returns CovidContinent|error {
        string  path = string `/v3/covid-19/continents/${continent}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "strict": strict, "allowNull": allowNull};
        path = path + check getPathForQueryParam(queryParam);
        CovidContinent response = check self.clientEp-> get(path, targetType = CovidContinent);
        return response;
    }
    # Get COVID-19 totals for a specific country.
    #
    # + country - Country name, iso2, iso3, or country ID code
    # + yesterday - Enter `true`(1) to receive data reported a day ago. Default is `false`(0)
    # + twoDaysAgo - Enter `true`(1) to receive data reported two days ago. Default is `false`(0)
    # + strict - Setting to false gives you the ability to fuzzy search countries (i.e. Oman vs. rOMANia). Default is `true`.
    # + allowNull - By default, value is 0. Enter `1` to allow nulls to be returned
    # + return - Covid-19 status of the given country
    @display {label: "Country Status"}
    remote isolated function getStatusByCountry(@display {label: "Country"} string country, @display {label: "Yesterday"} string? yesterday = (), @display {label: "Two Days Ago"} string? twoDaysAgo = (), @display {label: "Strict"} string strict = "true", @display {label: "Allow Null"} string? allowNull = ()) returns CovidCountry|error {
        string  path = string `/v3/covid-19/countries/${country}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "strict": strict, "allowNull": allowNull};
        path = path + check getPathForQueryParam(queryParam);
        CovidCountry response = check self.clientEp-> get(path, targetType = CovidCountry);
        return response;
    }
    # Get global accumulated COVID-19 time series data.
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24)
    # + return - Global accumulated COVID-19 time series data
    @display {label: "Global Status By Time Series"}
    remote isolated function getGlobalStatusInTimeSeries(@display {label: "Number Of Days"} string? lastdays = ()) returns CovidHistoricalAll|error {
        string  path = string `/v3/covid-19/historical/all`;
        map<anydata> queryParam = {"lastdays": lastdays};
        path = path + check getPathForQueryParam(queryParam);
        CovidHistoricalAll response = check self.clientEp-> get(path, targetType = CovidHistoricalAll);
        return response;
    }
    # Get COVID-19 time series data for a specific country.
    #
    # + country - Country name, iso2, iso3, or country ID code
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24)
    # + return - COVID-19 related time series for the given country
    @display {label: "Country Status By Time Series"}
    remote isolated function getTimeSeriesBycountry(@display {label: "Country"} string country, @display {label: "Number Of Days"} string lastdays = "30") returns CovidHistoricalCountry|error {
        string  path = string `/v3/covid-19/historical/${country}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        path = path + check getPathForQueryParam(queryParam);
        CovidHistoricalCountry response = check self.clientEp-> get(path, targetType = CovidHistoricalCountry);
        return response;
    }
    # Get COVID-19 time series data for a specific province in a country.
    #
    # + country - Country name, iso2, iso3, or country ID code
    # + province - Province name. All available names can be found in the /v3/covid-19/historical/{query} endpoint
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24)
    # + return - COVID-19 related time series for the given province
    @display {label: "Province Status By Time Series"}
    remote isolated function getTimeSeriesByProvince(@display {label: "Country"} string country, @display {label: "Province"} string province, @display {label: "Number of Days"} string lastdays = "30") returns CovidHistoricalProvince|error {
        string  path = string `/v3/covid-19/historical/${country}/${province}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        path = path + check getPathForQueryParam(queryParam);
        CovidHistoricalProvince response = check self.clientEp-> get(path, targetType = CovidHistoricalProvince);
        return response;
    }
    # Get vaccine trial data from RAPS (Regulatory Affairs Professional Society).
    #
    # + return - Vaccine trial data
    @display {label: "Vaccine Trial Data"}
    remote isolated function getVaccineTrialData() returns Vaccines|error {
        string  path = string `/v3/covid-19/vaccine`;
        Vaccines response = check self.clientEp-> get(path, targetType = Vaccines);
        return response;
    }
    # Get total global COVID-19 Vaccine doses administered.
    #
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24)
    # + return - Vaccine coverage data
    @display {label: "Global Vaccine Administration"}
    remote isolated function getTotalGlobalVaccineDosesAdministered(@display {label: "Number of Days"} string lastdays = "30") returns SimpleVaccineTimeline|error {
        string  path = string `/v3/covid-19/vaccine/coverage`;
        map<anydata> queryParam = {"lastdays": lastdays};
        path = path + check getPathForQueryParam(queryParam);
        SimpleVaccineTimeline response = check self.clientEp-> get(path, targetType = SimpleVaccineTimeline);
        return response;
    }
    # Get COVID-19 vaccine doses administered for a country that has reported vaccination rollout.
    #
    # + country - Country name, iso2, iso3
    # + lastdays - Number of days to return. Use 'all' for the full data set (e.g. 15, all, 24)
    # + return - Vaccine coverage data of the given country
    @display {label: "Vaccine Coverage By Country"}
    remote isolated function getVaccineCoverageByCountry(@display {label: "Country"} string country, @display {label: "Last Days"} string lastdays = "30") returns VaccineCountryCoverage|error {
        string  path = string `/v3/covid-19/vaccine/coverage/countries/${country}`;
        map<anydata> queryParam = {"lastdays": lastdays};
        path = path + check getPathForQueryParam(queryParam);
        VaccineCountryCoverage response = check self.clientEp-> get(path, targetType = VaccineCountryCoverage);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
