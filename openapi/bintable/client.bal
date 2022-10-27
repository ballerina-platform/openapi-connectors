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

# This is a generated connector from [BINTable API v1](https://bintable.com/get-api) OpenAPI Specification. 
# BIN lookup API, the free api service from bintable.com to lookup card information using it's BIN. 
# The service maintains updated database based on the comunity and other third party services to make sure all BINs in the database are accurate and up to date.
@display {label: "BINTable", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Create a [BINTable Account](https://bintable.com/get-api) and obtain the API key.
    # Some operations may require passing the token as a parameter.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://api.bintable.com/v1") returns error? {
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
    # Check Balance
    #
    # + apiKey - The API key, which you can get from bintable.com website. 
    # + return - Balance reponse 
    remote isolated function balanceLookup(string apiKey) returns ResponseItem|error {
        string resourcePath = string `/balance`;
        map<anydata> queryParam = {"api_key": apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ResponseItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lookup for bin
    #
    # + bin - pass the required BIN(Bank Identification Number) code 
    # + apiKey - The API key, which you can get from bintable.com website. 
    # + return - BIN data response 
    remote isolated function binLookup(string bin, string apiKey) returns ResponseItem|error {
        string resourcePath = string `/${getEncodedUri(bin)}`;
        map<anydata> queryParam = {"api_key": apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ResponseItem response = check self.clientEp->get(resourcePath);
        return response;
    }
}
