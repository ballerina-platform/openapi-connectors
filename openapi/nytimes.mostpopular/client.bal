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

# This is a generated connector from [New York Times Most Popular API v2.0.0](https://developer.nytimes.com/docs/most-popular-product/1/overview) OpenAPI specification.
# With the New York Times Most Popular API you can get popular articles on NYTimes.com. 
# The Most Popular API provides services for getting the most popular articles on NYTimes.com based on emails, shares, or views.
@display {label: "New York Times Most Popular", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [NYTimes account](https://developer.nytimes.com/accounts/login) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.nytimes.com/svc/mostpopular/v2") returns error? {
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
    # Most Emailed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostemailed(string section, string timePeriod) returns InlineResponse200|error {
        string resourcePath = string `/mostemailed/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Most Shared by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostshared(string section, string timePeriod) returns InlineResponse2001|error {
        string resourcePath = string `/mostshared/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Most Viewed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostviewed(string section, string timePeriod) returns InlineResponse2001|error {
        string resourcePath = string `/mostviewed/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
