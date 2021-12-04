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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-IBM-Client-Id`
    string xIbmClientId;
|};

# This is a generated connector for [Apptigent PowerTools Developer API v2021.3.01](https://portal.apptigent.com/node/904) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for weather conditions, forecasts and related operations.
@display {label: "PowerTools Developer Weather", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens by following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Weather - Weather Conditions
    #
    # + payload - Input weather conditions 
    # + return - OK 
    remote isolated function weatherConditions(InputWeatherConditions payload) returns OutputWeatherConditions|error {
        string  path = string `/WeatherConditions`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputWeatherConditions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputWeatherConditions);
        return response;
    }
    # Weather - Daily Forecast
    #
    # + payload - Input weather daily forecast 
    # + return - OK 
    remote isolated function weatherDailyForecast(InputWeatherDailyForecast payload) returns OutputDailyForecast|error {
        string  path = string `/WeatherDailyForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputDailyForecast response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputDailyForecast);
        return response;
    }
    # Weather - Hourly Forecast
    #
    # + payload - Input weather hourly forecast 
    # + return - OK 
    remote isolated function weatherHourlyForecast(InputWeatherHourlyForecast payload) returns OutputHourlyForecast|error {
        string  path = string `/WeatherHourlyForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputHourlyForecast response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputHourlyForecast);
        return response;
    }
    # Weather - Activity Forecast
    #
    # + payload - Input weather activity forecast 
    # + return - OK 
    remote isolated function weatherActivityForecast(InputWeatherActivityForecast payload) returns OutputActivityForecast|error {
        string  path = string `/WeatherActivityForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputActivityForecast response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputActivityForecast);
        return response;
    }
}
