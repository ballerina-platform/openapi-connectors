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

# This is a generated connector for [ODWeather API v1.0](https://api.oceandrivers.com/) OpenAPI specification.
# The ODWeather API provides the capability to access the real time and forecast ocean information.
@display {label: "ODWeather", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization does not require setting the API credentials. 
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.oceandrivers.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get forecast and realtime information for known points
    #
    # + stationName - Weather station to compare, values: cnareanl|rcnp | cmsap|boyaenderrocat|areopuertopalma | EWXXX 
    # + return - No response was specified 
    remote isolated function compareStation(string stationName) returns http:Response|error {
        string  path = string `/v1.0/compareStation/${stationName}/`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get data from the aemet stations
    #
    # + stationName - station name currently: aeropuertopalma | caboblanco  
    # + period - Period of time to get the data. Options: lastdata lastday 
    # + return - No response was specified 
    remote isolated function getAemetStation(string stationName, string period) returns http:Response|error {
        string  path = string `/v1.0/getAemetStation/${stationName}/${period}/`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get data from the easywind weather stations
    #
    # + easywindId - currently: 'EW013'|'EW008' 
    # + period - Period of time to get the data latestdata|latesthour|latestday 
    # + return - No response was specified 
    remote isolated function getEasywind(string easywindId, string period) returns http:Response|error {
        string  path = string `/v1.0/getEasyWind/${easywindId}/`;
        map<anydata> queryParam = {"period": period};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get stations in an event
    #
    # + eventId - currently: 'trofeoprincesasofia|palmavela' 
    # + return - No response was specified 
    remote isolated function getEventStations(string eventId) returns http:Response|error {
        string  path = string `/v1.0/getEventStations/${eventId}/`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get forecast points of a yatchclub
    #
    # + yatchclubid - base URL for the the 
    # + language - Language 
    # + return - No response was specified 
    remote isolated function getForecastPoints(string yatchclubid, string language) returns http:Response|error {
        string  path = string `/v1.0/getForecastPoints/${yatchclubid}/language/${language}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get timeseries forecast information
    #
    # + latitude - latitude for the forecast 
    # + longitude - longitude for the forecast 
    # + weather -  Comma separated values for the weather parameteres temperature,rain,wind_u,wind_v,gust,pressure,cloud,humidity&wave=height,direction,period 
    # + inittime - initial date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + endtime - end date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + days - optional number of days in string. Will be added to init forecast date 
    # + hours - optional number of hours in string. Will be added to init forecast date 
    # + wave -  Comma separated values for the wave parameteres height,direction,period 
    # + entryid - Direct file I want to extract 
    # + return - No response was specified 
    remote isolated function getForecastTimeSeries(decimal latitude, decimal longitude, string weather, string? inittime = (), string? endtime = (), int? days = (), int? hours = (), string? wave = (), string? entryid = ()) returns http:Response|error {
        string  path = string `/v1.0/getForecastTimeSeries/${latitude}/${longitude}/`;
        map<anydata> queryParam = {"inittime": inittime, "endtime": endtime, "days": days, "hours": hours, "weather": weather, "wave": wave, "entryid": entryid};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get timeseries forecast information
    #
    # + latitude - latitude for the forecast 
    # + longitude - longitude for the forecast 
    # + weather -  Comma separated values for the weather parameteres temperature,rain,wind_u,wind_v,gust,pressure,cloud,humidity&wave=height,direction,period 
    # + inittime - initial date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + endtime - end date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + days - optional number of days in string. Will be added to init forecast date 
    # + hours - optional number of hours in string. Will be added to init forecast date 
    # + wave -  Comma separated values for the wave parameteres height,direction,period 
    # + entryid - Direct file I want to extract 
    # + return - No response was specified 
    remote isolated function getForecastTimeSeriesWrf(decimal latitude, decimal longitude, string weather, string? inittime = (), string? endtime = (), int? days = (), int? hours = (), string? wave = (), string? entryid = ()) returns http:Response|error {
        string  path = string `/v1.0/getForecastTimeSeriesWrf/${latitude}/${longitude}/`;
        map<anydata> queryParam = {"inittime": inittime, "endtime": endtime, "days": days, "hours": hours, "weather": weather, "wave": wave, "entryid": entryid};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get data from the socib bahia de palma buoy
    #
    # + stationName - station name currently: boyaenderrocat | playadepalma 
    # + period - Period of time to get the data. Options: lastdata lasthour lastday 
    # + return - No response was specified 
    remote isolated function getSocibWeatherStation(string stationName, string period) returns http:Response|error {
        string  path = string `/v1.0/getSocibWeatherStation/${stationName}/${period}/`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get data from the weather display software
    #
    # + stationName - currently: 'cnarenal'|'campastilla' | 'cncg' 
    # + period - Period of time to get the data latestdata|latesthour|latestday|dailylog 
    # + return - No response was specified 
    remote isolated function getWeatherDisplay(string stationName, string period) returns http:Response|error {
        string  path = string `/v1.0/getWeatherDisplay/${stationName}/`;
        map<anydata> queryParam = {"period": period};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get forecast and realtime information for known points
    #
    # + return - No response was specified 
    remote isolated function getWebCams() returns http:Response|error {
        string  path = string `/v1.0/getWebCams/`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
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
