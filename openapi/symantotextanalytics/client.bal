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
    # Represents API Key `x-api-key`
    string xApiKey;
|};

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
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.symanto.net") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Communication & Tonality
    #
    # + 'all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getCommunicationStyle(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/communication`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Emotion Analysis
    #
    # + 'all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getEmotion(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/emotion`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Emotion Analysis
    #
    # + 'all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getEkmanEmotion(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/ekman-emotion`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Personality Traits
    #
    # + 'all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getPersonality(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/personality`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Sentiment Analysis
    #
    # + 'all - Returns all predictions, not only the most probable one 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getSentiment(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/sentiment`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Extracts topics and sentiments and relates them.
    #
    # + domain - Provide analysis domain for better extraction (optional) 
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getTopicSentiment(PostRequest payload, string? domain = ()) returns TopicSentimentResponse|error {
        string  path = string `/topic-sentiment`;
        map<anydata> queryParam = {"domain": domain};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TopicSentimentResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TopicSentimentResponse);
        return response;
    }
    # Language Detection
    #
    # + payload - Request Details 
    # + return - Successful Response 
    remote isolated function getLanguageDetection(LanguageDetectionRequest payload) returns LanguageDetectionResponse|error {
        string  path = string `/language-detection`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LanguageDetectionResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LanguageDetectionResponse);
        return response;
    }
}
