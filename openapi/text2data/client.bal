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

# This is a generated connector for [Text Analytics & Sentiment Analysis API v3.4](http://api.text2data.com/swagger/ui/index#/) OpenAPI specification.
# The current api version is <b>v3.4</b></p><br><br><p>The api methods listed below can be called directly from this page to test the output. You might set the api_key to pre-authenticate all requests on this page (this will work if your secret is blank).</p><br><br> API endpoint URL: http://{apiName}.text2data.com/v3/ {method}<br><br>The api can be consumed directly or using our SDK. Our Excel Add-In and Google Sheets Add-on are also using this api to process the data.'
@display {label: "Text2data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Interzoid Account](https://www.interzoid.com/register)  and obtain tokens by log into [Interzoid Account](https://www.interzoid.com/account).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "http://api.text2data.org/") returns error? {
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
    # Test api response without api key
    #
    # + return - OK 
    remote isolated function analyzeGet() returns DocumentResult|error {
        string resourcePath = string `/v3/Analyze`;
        DocumentResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sentiment analysis service
    #
    # + payload - Document payload in form of text, json or xml. 
    # + return - OK 
    remote isolated function analyzePost(Document payload) returns DocumentResult|error {
        string resourcePath = string `/v3/Analyze`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Test api response without api key
    #
    # + return - OK 
    remote isolated function categorizeGet() returns DocumentResult|error {
        string resourcePath = string `/v3/Categorize`;
        DocumentResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Document categorization service
    #
    # + payload - Document payload in form of text, json or xml. 
    # + return - OK 
    remote isolated function categorizePost(Document payload) returns DocumentResult|error {
        string resourcePath = string `/v3/Categorize`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Test api response without api key
    #
    # + return - OK 
    remote isolated function extractGet() returns DocumentResult|error {
        string resourcePath = string `/v3/Extract`;
        DocumentResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Document extraction service
    #
    # + payload - Document payload in form of text, json or xml. 
    # + return - OK 
    remote isolated function extractPost(Document payload) returns DocumentResult|error {
        string resourcePath = string `/v3/Extract`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
