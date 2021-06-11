// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

type CountryPopulationArr CountryPopulation[];

type GrossDomesticProductArr GrossDomesticProduct[];

type AccessToElectricityArr AccessToElectricity[];

type YouthLiteracyRateArr YouthLiteracyRate[];

type PrimaryEducationExpenditureArr PrimaryEducationExpenditure[];

@display {label: "World Bank Indicator Client"}
public client class Client {
    http:Client clientEp;
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://api.worldbank.org/v2/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    @display {label: "Country Population"}
    remote isolated function getCountryPopulation(@display {label: "Date"} string date, @display {label: "Response Format"} string? format = (), @display {label: "Page Number"} anydata? page = (), @display {label: "Per Page Record Count"} anydata? per_page = ()) returns CountryPopulationArr|error {
        string  path = string `/country/all/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {date: date, format: format, page: page, per_page: per_page};
        path = path + getPathForQueryParam(queryParam);
        http:Response httpResponse = check self.clientEp-> get(path);
        json[] payload = <json[]> check httpResponse.getJsonPayload();
        return payload[1].cloneWithType(CountryPopulationArr);
    }
    @display {label: "GDP By Country"}
    remote isolated function getGDPBycountry(@display {label: "Country Name"} string country_name, string? date = (), @display {label: "Response Format"} string? format = (), @display {label: "Page Number"} anydata? page = (), @display {label: "Per Page Record Count"} anydata? per_page = ()) returns GrossDomesticProductArr|error {
        string  path = string `/country/${country_name}/indicator/NY.GDP.MKTP.CD`;
        map<anydata> queryParam = {date: date, format: format, page: page, per_page: per_page};
        path = path + getPathForQueryParam(queryParam);
        http:Response httpResponse = check self.clientEp-> get(path);
        json[] payload = <json[]> check httpResponse.getJsonPayload();
        return payload[1].cloneWithType(GrossDomesticProductArr);
    }
    @display {label: "Population Percentage Having Electricity"}
    remote isolated function getAccessToElectricityPercentage(@display {label: "Country Name"} string country_name, @display {label: "Response Format"} string? format = (), @display {label: "Page Number"} anydata? page = (), @display {label: "Per Page Record Count"} anydata? per_page = ()) returns AccessToElectricityArr|error {
        string  path = string `/country/${country_name}/indicator/1.1_ACCESS.ELECTRICITY.TOT`;
        map<anydata> queryParam = {format: format, page: page, per_page: per_page};
        path = path + getPathForQueryParam(queryParam);
        http:Response httpResponse = check self.clientEp-> get(path);
        json[] payload = <json[]> check httpResponse.getJsonPayload();
        return payload[1].cloneWithType(AccessToElectricityArr);
    }
    @display {label: "Youth Literacy Rate"}
    remote isolated function getYouthLiteracyRate(@display {label: "Country Name"} string country_name, @display {label: "Date"} string? date = (), @display {label: "Response Format"} string? format = (), @display {label: "Page Number"} anydata? page = (), @display {label: "Per Page Record Count"} anydata? per_page = ()) returns YouthLiteracyRateArr|error {
        string  path = string `/country/${country_name}/indicator/1.1_YOUTH.LITERACY.RATE`;
        map<anydata> queryParam = {date: date, format: format, page: page, per_page: per_page};
        path = path + getPathForQueryParam(queryParam);
        http:Response httpResponse = check self.clientEp-> get(path);
        json[] payload = <json[]> check httpResponse.getJsonPayload();
        return payload[1].cloneWithType(YouthLiteracyRateArr);
    }
    @display {label: "Government Expenditure On Education"}
    remote isolated function getGovernmentExpenditureOnPrimaryEducation(@display {label: "Country Name"} string country_name, @display {label: "Date"} string? date = (), @display {label: "Response Format"} string? format = (), @display {label: "Page Number"} anydata? page = (), @display {label: "Per Page Record Count"} anydata? per_page = ()) returns PrimaryEducationExpenditureArr|error {
        string  path = string `/country/${country_name}/indicator/UIS.X.PPP.1.FSGOV`;
        map<anydata> queryParam = {date: date, format: format, page: page, per_page: per_page};
        path = path + getPathForQueryParam(queryParam);
        http:Response httpResponse = check self.clientEp-> get(path);
        json[] payload = <json[]> check httpResponse.getJsonPayload();
        return payload[1].cloneWithType(PrimaryEducationExpenditureArr);
    }
}

isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string {
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
                string updateV =  checkpanic url:encode(value, "UTF-8");
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
 