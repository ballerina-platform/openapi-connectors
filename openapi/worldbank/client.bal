// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector from [World Bank API v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation) OpenAPI Specification. 
# The World Bank Indicators API provides access to nearly 16,000 time series indicators. Most of these indicators are available online through tools such as `Databank` and the `Open Data` website. The API provides programmatic access to this same data. Many data series date back over 50 years, and can be used to create interesting applications.
@display {label: "World Bank", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://api.worldbank.org/v2/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get population of each country
    #
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Population of each countries 
    @display {label: "Get Population"}
    remote isolated function getPopulation(@display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/all/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get population of a country
    #
    # + countryCode - Country code (Example- AFG, ALB, LKA) 
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Yearly population of the given country 
    @display {label: "Get Country Population"}
    remote isolated function getPopulationByCountry(@display {label: "Country Code"} string countryCode, @display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get GDP of each country.
    #
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - GDP of each country 
    @display {label: "Get GDP"}
    remote isolated function getGDP(string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/all/indicator/NY.GDP.MKTP.CD`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get GDP of a country.
    #
    # + countryCode - Country code (Example- AFG, ALB, LKA) 
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Yearly GDP of the given country 
    @display {label: "Get GDP By Country"}
    remote isolated function getGDPByCountry(@display {label: "Country Code"} string countryCode, string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/indicator/NY.GDP.MKTP.CD`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get percentage of population with access to electricity of countries in the world.
    #
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Population percentage having electricity of each country. 
    @display {label: "Get Population% Having Electricity"}
    remote isolated function getAccessToElectricityPercentage(string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/all/indicator/1.1_ACCESS.ELECTRICITY.TOT`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get percentage of population with access to electricity of a given country.
    #
    # + countryCode - Country code (Example- AFG, ALB, LKA) 
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Yearly population percentage having electricity of the given country. 
    @display {label: "Get Population% Having Electricity By Country"}
    remote isolated function getAccessToElectricityPercentageByCountry(@display {label: "Country Code"} string countryCode, string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/indicator/1.1_ACCESS.ELECTRICITY.TOT`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get literacy rate of youth (% of people ages 15-24) of countries in the world.
    #
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Youth literacy rate of each country. 
    @display {label: "Get Youth Literacy Rate"}
    remote isolated function getYouthLiteracyRate(@display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/all/indicator/1.1_YOUTH.LITERACY.RATE`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get literacy rate of youth (% of people ages 15-24) of a country.
    #
    # + countryCode - Country code (Example- AFG, ALB, LKA) 
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Youth literacy rate of the given country. 
    @display {label: "Get Youth Literacy Rate By Country"}
    remote isolated function getYouthLiteracyRateByCountry(@display {label: "Country Code"} string countryCode, @display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/indicator/1.1_YOUTH.LITERACY.RATE`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get government expenditure on primary education of each country
    #
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Government expenditure on primary education of each country. 
    @display {label: "Get Government Expenditure On Education"}
    remote isolated function getGovernmentExpenditureOnPrimaryEducation(@display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/all/indicator/UIS.X.PPP.1.FSGOV`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get government expenditure on primary education of a country.
    #
    # + countryCode - Country code (Example- AFG, ALB, LKA) 
    # + date - Date-range by year, month or quarter that scopes the result-set. 
    # + format - Format of the response. 
    # + page - Page number 
    # + perPage - Per page record count 
    # + return - Government expenditure on primary education of a country. 
    @display {label: "Get Government Expenditure On Education By Country"}
    remote isolated function getGovernmentExpenditureOnPrimaryEducationByCountry(@display {label: "Country Code"} string countryCode, @display {label: "Date"} string date = "2010", @display {label: "Response Format"} string format = "json", @display {label: "Page Number"} int page = 1, @display {label: "Per Page Record Count"} int perPage = 50) returns WorldBankResponse|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/indicator/UIS.X.PPP.1.FSGOV`;
        map<anydata> queryParam = {"date": date, "format": format, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorldBankResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
