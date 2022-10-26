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

# This is a generated connector for [ODWeather API v1.0](https://api.oceandrivers.com/) OpenAPI specification.
# The ODWeather API provides the capability to access the real time and forecast ocean information.
@display {label: "ODWeather", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization does not require setting the API credentials. 
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://api.oceandrivers.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get forecast and realtime information for known points
    #
    # + stationName - Weather station to compare, values: cnareanl|rcnp | cmsap|boyaenderrocat|areopuertopalma | EWXXX 
    # + return - No response was specified 
    remote isolated function compareStation(string stationName) returns http:Response|error {
        string resourcePath = string `/v1.0/compareStation/${getEncodedUri(stationName)}/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get data from the aemet stations
    #
    # + stationName - station name currently: aeropuertopalma | caboblanco  
    # + period - Period of time to get the data. Options: lastdata lastday 
    # + return - No response was specified 
    remote isolated function getAemetStation(string stationName, string period) returns http:Response|error {
        string resourcePath = string `/v1.0/getAemetStation/${getEncodedUri(stationName)}/${getEncodedUri(period)}/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get data from the easywind weather stations
    #
    # + easywindId - currently: 'EW013'|'EW008' 
    # + period - Period of time to get the data latestdata|latesthour|latestday 
    # + return - No response was specified 
    remote isolated function getEasywind(string easywindId, string period) returns http:Response|error {
        string resourcePath = string `/v1.0/getEasyWind/${getEncodedUri(easywindId)}/`;
        map<anydata> queryParam = {"period": period};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get stations in an event
    #
    # + eventId - currently: 'trofeoprincesasofia|palmavela' 
    # + return - No response was specified 
    remote isolated function getEventStations(string eventId) returns http:Response|error {
        string resourcePath = string `/v1.0/getEventStations/${getEncodedUri(eventId)}/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get forecast points of a yatchclub
    #
    # + yatchclubid - base URL for the the 
    # + language - Language 
    # + return - No response was specified 
    remote isolated function getForecastPoints(string yatchclubid, string language) returns http:Response|error {
        string resourcePath = string `/v1.0/getForecastPoints/${getEncodedUri(yatchclubid)}/language/${getEncodedUri(language)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get timeseries forecast information
    #
    # + latitude - latitude for the forecast 
    # + longitude - longitude for the forecast 
    # + inittime - initial date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + endtime - end date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + days - optional number of days in string. Will be added to init forecast date 
    # + hours - optional number of hours in string. Will be added to init forecast date 
    # + weather -  Comma separated values for the weather parameteres temperature,rain,wind_u,wind_v,gust,pressure,cloud,humidity&wave=height,direction,period 
    # + wave -  Comma separated values for the wave parameteres height,direction,period 
    # + entryid - Direct file I want to extract 
    # + return - No response was specified 
    remote isolated function getForecastTimeSeries(decimal latitude, decimal longitude, string weather, string? inittime = (), string? endtime = (), int? days = (), int? hours = (), string? wave = (), string? entryid = ()) returns http:Response|error {
        string resourcePath = string `/v1.0/getForecastTimeSeries/${getEncodedUri(latitude)}/${getEncodedUri(longitude)}/`;
        map<anydata> queryParam = {"inittime": inittime, "endtime": endtime, "days": days, "hours": hours, "weather": weather, "wave": wave, "entryid": entryid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get timeseries forecast information
    #
    # + latitude - latitude for the forecast 
    # + longitude - longitude for the forecast 
    # + inittime - initial date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + endtime - end date for the forecast ISO string YYYY-MM-DDTHH:mm:SS.SZ 
    # + days - optional number of days in string. Will be added to init forecast date 
    # + hours - optional number of hours in string. Will be added to init forecast date 
    # + weather -  Comma separated values for the weather parameteres temperature,rain,wind_u,wind_v,gust,pressure,cloud,humidity&wave=height,direction,period 
    # + wave -  Comma separated values for the wave parameteres height,direction,period 
    # + entryid - Direct file I want to extract 
    # + return - No response was specified 
    remote isolated function getForecastTimeSeriesWrf(decimal latitude, decimal longitude, string weather, string? inittime = (), string? endtime = (), int? days = (), int? hours = (), string? wave = (), string? entryid = ()) returns http:Response|error {
        string resourcePath = string `/v1.0/getForecastTimeSeriesWrf/${getEncodedUri(latitude)}/${getEncodedUri(longitude)}/`;
        map<anydata> queryParam = {"inittime": inittime, "endtime": endtime, "days": days, "hours": hours, "weather": weather, "wave": wave, "entryid": entryid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get data from the socib bahia de palma buoy
    #
    # + stationName - station name currently: boyaenderrocat | playadepalma 
    # + period - Period of time to get the data. Options: lastdata lasthour lastday 
    # + return - No response was specified 
    remote isolated function getSocibWeatherStation(string stationName, string period) returns http:Response|error {
        string resourcePath = string `/v1.0/getSocibWeatherStation/${getEncodedUri(stationName)}/${getEncodedUri(period)}/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get data from the weather display software
    #
    # + stationName - currently: 'cnarenal'|'campastilla' | 'cncg' 
    # + period - Period of time to get the data latestdata|latesthour|latestday|dailylog 
    # + return - No response was specified 
    remote isolated function getWeatherDisplay(string stationName, string period) returns http:Response|error {
        string resourcePath = string `/v1.0/getWeatherDisplay/${getEncodedUri(stationName)}/`;
        map<anydata> queryParam = {"period": period};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get forecast and realtime information for known points
    #
    # + return - No response was specified 
    remote isolated function getWebCams() returns http:Response|error {
        string resourcePath = string `/v1.0/getWebCams/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
}
