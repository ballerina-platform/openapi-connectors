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

# This is a generated connector for [Abstract IP geolocation API version 1](https://www.abstractapi.com/ip-geolocation-api#docs) OpenAPI Specification.
# Abstract IP geolocation API allows developers to retrieve the region, country and city behind any IP worldwide.
# The API covers the geolocation of IPv4 and IPv6 addresses in 180+ countries worldwide.
# Extra information can be retrieved like the currency, flag or language associated to an IP.
@display {label: "Abstract IP Geolocation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Abstract API account for IP Geolocation API](https://www.abstractapi.com/ip-geolocation-api)and obtain
    # tokens by following [this guide](https://app.abstractapi.com/api/ip-geolocation/documentation).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://ipgeolocation.abstractapi.com") returns error? {
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieve the location of an IP address
    #
    # + ipAddress - The IP address to geolocate. Both IPv4 and IPv6 addresses are supported. Note that if this parameter is left blank, the service will geolocate the IP address from which the request was made. 
    # + fields - Comma separated fields to only receive a few fields from the JSON response. 
    # + return - Location of geolocated IP 
    remote isolated function getGeolocation(string? ipAddress = (), string? fields = ()) returns Geolocation|error {
        string resourcePath = string `/v1/`;
        map<anydata> queryParam = {"ip_address": ipAddress, "fields": fields, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Geolocation response = check self.clientEp->get(resourcePath);
        return response;
    }
}
