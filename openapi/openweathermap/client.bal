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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Open Weather Map API version 2.5](https://openweathermap.org/) OpenAPI Specification. 
# The Open Weather Map API provides access to current weather data and weather forecast of any location worldwide including 200,000 cities by consuming the [`Current Weather Data`](https://openweathermap.org/current) and [`One Call`](https://openweathermap.org/api/one-call-api) API endpoints.  
@display {label: "Open Weather Client"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create an account at https://openweathermap.org and an API key following [this guide](https://openweathermap.org/appid).  Choose a subscription that matches with your requirements.
    #
    # + apiKeyConfig - Provide your API Key as `appid`. Eg: `{"appid" : "<Your API Key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://api.openweathermap.org/data/2.5/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Access current weather data for any location. **Note**: All parameters are optional, but you must provide at least one parameter. Calling the API by city ID (using the `id` parameter) will provide the most precise location results.
    #
    # + q - City name, or city name and country code. For the query value, type the city name and optionally the country code divided by comma; use ISO 3166 country codes.
    # + id - City ID. Example: `2172797`. The List of city IDs can be downloaded [here](http://bulk.openweathermap.o/sample/).
    # + lat - Latitude
    # + lon - Longtitude
    # + zip - Zip code. Search by zip code. Example: 95050,us.
    # + units - Temperature in Fahrenheit use `units=imperial`, temperature in Celsius use `units=metric`, temperature in `Kelvin` is used by default.
    # + lang - Language
    # + mode - Format of response. Possible values are `xml` and `html`. If mode parameter is empty the format is `json` by default.
    # + return - Current weather data of the given location
    @display {label: "Current Weather"}
    remote isolated function getCurretWeatherData(@display {label: "CityName or StateCode or CountryCode"} string? q = (), @display {label: "City Id"} string? id = (), @display {label: "Latitude"} string? lat = (), @display {label: "Longitude"} string? lon = (), @display {label: "Zip Code"} string? zip = (), @display {label: "Units"} string units = "imperial", @display {label: "Language"} string lang = "en", @display {label: "Mode"} string mode = "json") returns CurrentWeatherData|error {
        string  path = string `/weather`;
        map<anydata> queryParam = {"q": q, "id": id, "lat": lat, "lon": lon, "zip": zip, "units": units, "lang": lang, "mode": mode, "appid": self.apiKeys["appid"]};
        path = path + check getPathForQueryParam(queryParam);
        CurrentWeatherData response = check self.clientEp-> get(path, targetType = CurrentWeatherData);
        return response;
    }
    # Access to current weather, minute forecast for 1 hour, hourly forecast for 48 hours, daily forecast for 7 days and government weather alerts.
    #
    # + lat - Latitude
    # + lon - Longtitude
    # + exclude - Exclude parts of the weather data from the API response. It should be a comma-delimited list (without spaces).
    # + units - For temperature in Fahrenheit and wind speed in miles/hour, use `units=imperial`. For temperature in Celsius and wind speed in meter/sec, use `units=metric`. Temperature in Kelvin and wind speed in meter/sec is used by default, so there is no need to use the units parameter in the API call if you want this.
    # + lang - Language
    # + return - Weather forecast of the given location
    @display {label: "Weather Forecast"}
    remote isolated function getWeatherForecast(@display {label: "Latitude"} string lat, @display {label: "Longtitude"} string lon, @display {label: "Exclude"} string? exclude = (), @display {label: "Units"} string? units = (), @display {label: "Language"} string? lang = ()) returns WeatherForecast|error {
        string  path = string `/onecall`;
        map<anydata> queryParam = {"lat": lat, "lon": lon, "exclude": exclude, "units": units, "lang": lang, "appid": self.apiKeys["appid"]};
        path = path + check getPathForQueryParam(queryParam);
        WeatherForecast response = check self.clientEp-> get(path, targetType = WeatherForecast);
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
