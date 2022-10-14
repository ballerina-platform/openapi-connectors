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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the Weather Zip API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `license`.
    string license;
|};

# This is a generated connector for [Interzoid Weather by Zip Code API v1.0.0] (https://interzoid.com/services/getweatherzip) OpenAPI specification.
# This API provides current weather information for US Cities, including temperatures,  wind speeds, wind direction, relative humidity, and visibility.
# For additional help getting started with the API,  visit [Interzoid Weather by Zip Code API](https://interzoid.com/services/getweatherzip).
@display {label: "Interzoid Weather by Zip Code", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Interzoid Account](https://www.interzoid.com/register)  and obtain tokens by log into [Interzoid Account](https://www.interzoid.com/account).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.interzoid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Gets current weather information for a US zip code
    #
    # + zip - Zip code for weather information 
    # + return - Current weather information for zip code 
    remote isolated function getweatherzipcode(string zip) returns WeatherData|error {
        string resourcePath = string `/getweatherzipcode`;
        map<anydata> queryParam = {"zip": zip, "license": self.apiKeyConfig.license};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WeatherData response = check self.clientEp->get(resourcePath);
        return response;
    }
}
