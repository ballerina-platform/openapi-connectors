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

# This is a generated connector for [Mitto SMS and Bulk SMS APIs v1](https://docs.mitto.ch/sms-api-reference/) OpenAPI specification.
# Send individual SMS reliably and securely, or send them in bulk. 
# You can choose from different servers to test with based on where you want to send a message to.
@display {label: "Mitto SMS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mitto account](https://docs.mitto.ch) and obtain tokens by following [this guide](https://docs.mitto.ch/sms-api/#authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://rest.mittoapi.net") returns error? {
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
    # Send an SMS
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendSms(SmsBody payload) returns Sms|error {
        string resourcePath = string `/sms`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Sms response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Track Conversions
    #
    # + payload - Request payload 
    # + return - Success 
    remote isolated function trackConversions(SmsConvertedBody payload) returns http:Response|error {
        string resourcePath = string `/sms/converted`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send SMS in Bulk
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendBulkSms(SmsbulkBody payload) returns Smsbulk|error {
        string resourcePath = string `/smsbulk`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Smsbulk response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Usage by Country
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function getUsageByCountry(UsageBycountryBody payload) returns Usage|error {
        string resourcePath = string `/usage/bycountry`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Usage response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
