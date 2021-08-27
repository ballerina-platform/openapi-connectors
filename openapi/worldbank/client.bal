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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

type JsonArr json[];

type ErrorResponse record {
    ErrorMessage[] message;
};

type ErrorMessage record {
    string id;
    string 'key;
    string value;
};

# This is a generated connector from [World Bank API v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation) OpenAPI Specification. 
# The World Bank Indicators API provides access to nearly 16,000 time series indicators. Most of these indicators are available online through tools such as `Databank` and the `Open Data` website. The API provides programmatic access to this same data. Many data series date back over 50 years, and can be used to create interesting applications.
@display {label: "World Bank", iconPath: "resources/worldbank.svg"}
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
    }
    # Get population of each country
    #
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Population of each countries
    @display {label: "Get Population"}
    remote isolated function getPopulation(@display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns CountryPopulation[]|error {
        string  path = string `/country/all/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get population of a country
    #
    # + country_code - Country code (Example- AFG, ALB, LKA)
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Yearly population of the given country
    @display {label: "Get Country Population"}
    remote isolated function getPopulationByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns CountryPopulation[]|error {
        string  path = string `/country/${country_code}/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }           
        }
    }
    # Get GDP of each country.
    #
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - GDP of each country
    @display {label: "Get GDP"}
    remote isolated function getGDP(@display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns GrossDomesticProduct[]|error {
        string  path = string `/country/all/indicator/NY.GDP.MKTP.CD`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get GDP of a country.
    #
    # + country_code - Country code (Example- AFG, ALB, LKA)
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Yearly GDP of the given country
    @display {label: "Get GDP By Country"}
    remote isolated function getGDPByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns GrossDomesticProduct[]|error {
        string  path = string `/country/${country_code}/indicator/NY.GDP.MKTP.CD`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get percentage of population with access to electricity of countries in the world.
    #
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Population percentage having electricity of each country.
    @display {label: "Get Population% Having Electricity"}
    remote isolated function getAccessToElectricityPercentage(@display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns AccessToElectricity[]|error {
        string  path = string `/country/all/indicator/1.1_ACCESS.ELECTRICITY.TOT`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get percentage of population with access to electricity of a given country.
    #
    # + country_code - Country code (Example- AFG, ALB, LKA)
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Yearly population percentage having electricity of the given country.
    @display {label: "Get Population% Having Electricity By Country"}
    remote isolated function getAccessToElectricityPercentageByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns AccessToElectricity[]|error {
        string  path = string `/country/${country_code}/indicator/1.1_ACCESS.ELECTRICITY.TOT`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get literacy rate of youth (% of people ages 15-24) of countries in the world.
    #
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Youth literacy rate of each country.
    @display {label: "Get Youth Literacy Rate"}
    remote isolated function getYouthLiteracyRate(@display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns YouthLiteracyRate[]|error {
        string  path = string `/country/all/indicator/1.1_YOUTH.LITERACY.RATE`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get literacy rate of youth (% of people ages 15-24) of a country.
    #
    # + country_code - Country code (Example- AFG, ALB, LKA)
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Youth literacy rate of the given country.
    @display {label: "Get Youth Literacy Rate By Country"}
    remote isolated function getYouthLiteracyRateByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns YouthLiteracyRate[]|error {
        string  path = string `/country/${country_code}/indicator/1.1_YOUTH.LITERACY.RATE`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get government expenditure on primary education of each country
    #
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Government expenditure on primary education of each country.
    @display {label: "Get Government Expenditure On Education"}
    remote isolated function getGovernmentExpenditureOnPrimaryEducation(@display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns PrimaryEducationExpenditure[]|error {
        string  path = string `/country/all/indicator/UIS.X.PPP.1.FSGOV`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
    # Get government expenditure on primary education of a country.
    #
    # + country_code - Country code (Example- AFG, ALB, LKA)
    # + date - Date by year (2010), Date-range by year(2005:2010), month(2010M02:2010M08) or quarter(2012Q1:2012Q3) that scopes the result-set.
    # + page - Page number
    # + per_page - Per page record count
    # + return - Government expenditure on primary education of a country.
    @display {label: "Get Government Expenditure On Education By Country"}
    remote isolated function getGovernmentExpenditureOnPrimaryEducationByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date="2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns PrimaryEducationExpenditure[]|error {
        string  path = string `/country/${country_code}/indicator/UIS.X.PPP.1.FSGOV`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp-> get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType(); 
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }    
        }
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
