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
    # Represents API Key `api_key`
    string apiKey;
|};

# This is a generated connector for [Abstract IP geolocation API version 1](https://www.abstractapi.com/ip-geolocation-api#docs) OpenAPI Specification.
# Abstract IP geolocation API allows developers to retrieve the region, country and city behind any IP worldwide.
# The API covers the geolocation of IPv4 and IPv6 addresses in 180+ countries worldwide.
# Extra information can be retrieved like the currency, flag or language associated to an IP.
@display {label: "Abstract IP Geolocation", iconPath: "resources/ipgeolocation.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Abstract API account for IP Geolocation API](https://www.abstractapi.com/ip-geolocation-api)and obtain
    # tokens by following [this guide](https://app.abstractapi.com/api/ip-geolocation/documentation).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://ipgeolocation.abstractapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Retrieve the location of an IP address
    #
    # + ipAddress - The IP address to geolocate. Both IPv4 and IPv6 addresses are supported. Note that if this parameter is left blank, the service will geolocate the IP address from which the request was made. 
    # + fields - Comma separated fields to only receive a few fields from the JSON response. 
    # + return - Location of geolocated IP 
    remote isolated function getGeolocation(string? ipAddress = (), string? fields = ()) returns Geolocation|error {
        string  path = string `/v1/`;
        map<anydata> queryParam = {"ip_address": ipAddress, "fields": fields, "api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        Geolocation response = check self.clientEp-> get(path, targetType = Geolocation);
        return response;
    }
}
