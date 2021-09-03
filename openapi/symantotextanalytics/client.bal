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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Symanto Psycholinguistic Text Analytics version 1.5.0](https://api.symanto.net/docs) OpenAPI Specification.
# Symanto psycholinguistic text analytics API provides capability to access operations related to the deepest understanding of people through psychology & AI
@display {label: "Symanto Text Analytics", iconPath: "resources/SymantoTextAnalytics.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Symanto account](https://www.symanto.com/) and obtain OAuth tokens following [this guide](https://symanto-research.github.io/symanto-docs/#authentication)
    #
    # + apiKeyConfig - Provide your API Key as `x-api-key`. Eg: {x-api-key : [<Personal API_KEY>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.symanto.net") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Communication & Tonality
    #
    # + payload - Request Details 
    # + 'all - Returns all predictions, not only the most probable one 
    # + return - Successful Response 
    remote isolated function getCommunicationStyle(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/communication`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Emotion Analysis
    #
    # + payload - Request Details 
    # + 'all - Returns all predictions, not only the most probable one 
    # + return - Successful Response 
    remote isolated function getEmotion(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/emotion`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Emotion Analysis
    #
    # + payload - Request Details 
    # + 'all - Returns all predictions, not only the most probable one 
    # + return - Successful Response 
    remote isolated function getEkmanEmotion(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/ekman-emotion`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Personality Traits
    #
    # + payload - Request Details 
    # + 'all - Returns all predictions, not only the most probable one 
    # + return - Successful Response 
    remote isolated function getPersonality(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/personality`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Sentiment Analysis
    #
    # + payload - Request Details 
    # + 'all - Returns all predictions, not only the most probable one 
    # + return - Successful Response 
    remote isolated function getSentiment(PostRequest payload, boolean 'all = false) returns PredictionResults|error {
        string  path = string `/sentiment`;
        map<anydata> queryParam = {"all": 'all};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PredictionResults response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PredictionResults);
        return response;
    }
    # Extracts topics and sentiments and relates them.
    #
    # + payload - Request Details 
    # + domain - Provide analysis domain for better extraction (optional) 
    # + return - Successful Response 
    remote isolated function getTopicSentiment(PostRequest payload, string? domain = ()) returns TopicSentimentResponse|error {
        string  path = string `/topic-sentiment`;
        map<anydata> queryParam = {"domain": domain};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
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
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LanguageDetectionResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LanguageDetectionResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
