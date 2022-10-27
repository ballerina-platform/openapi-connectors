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

# This is a generated connector from [Symanto Psycholinguistic Text Analytics version 1.5.0](https://api.symanto.net/docs) OpenAPI Specification.
# Symanto psycholinguistic text analytics API provides capability to access operations related to the deepest understanding of people through psychology & AI
@display {label: "Symanto Text Analytics", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Symanto account](https://www.symanto.com/) and obtain OAuth tokens following [this guide](https://symanto-research.github.io/symanto-docs/#authentication)
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.symanto.net") returns error? {
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
    # Communication & Tonality
    #
    # + all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getCommunicationStyle(PostRequest payload, boolean all = false) returns PredictionResults|error {
        string resourcePath = string `/communication`;
        map<anydata> queryParam = {"all": all};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PredictionResults response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Emotion Analysis
    #
    # + all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getEmotion(PostRequest payload, boolean all = false) returns PredictionResults|error {
        string resourcePath = string `/emotion`;
        map<anydata> queryParam = {"all": all};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PredictionResults response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Emotion Analysis
    #
    # + all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getEkmanEmotion(PostRequest payload, boolean all = false) returns PredictionResults|error {
        string resourcePath = string `/ekman-emotion`;
        map<anydata> queryParam = {"all": all};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PredictionResults response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Personality Traits
    #
    # + all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getPersonality(PostRequest payload, boolean all = false) returns PredictionResults|error {
        string resourcePath = string `/personality`;
        map<anydata> queryParam = {"all": all};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PredictionResults response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sentiment Analysis
    #
    # + all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getSentiment(PostRequest payload, boolean all = false) returns PredictionResults|error {
        string resourcePath = string `/sentiment`;
        map<anydata> queryParam = {"all": all};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PredictionResults response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Extracts topics and sentiments and relates them.
    #
    # + domain - Provide analysis domain for better extraction (optional) 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getTopicSentiment(PostRequest payload, string? domain = ()) returns TopicSentimentResponse|error {
        string resourcePath = string `/topic-sentiment`;
        map<anydata> queryParam = {"domain": domain};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TopicSentimentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Language Detection
    #
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getLanguageDetection(LanguageDetectionRequest payload) returns LanguageDetectionResponse|error {
        string resourcePath = string `/language-detection`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LanguageDetectionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
