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

# This is a generated connector for [Google Cloud Natural Language API v1](https://cloud.google.com/natural-language/) OpenAPI specification.
# Provides natural language understanding technologies, such as sentiment analysis, entity recognition, entity sentiment analysis, and other text annotations, to developers.
@display {label: "Google Cloud Natural Language", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://language.googleapis.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
    # Finds named entities (currently proper names and common nouns) in the text along with entity types, salience, mentions for each entity, and other properties.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - AnalyzeEntities request 
    # + return - Successful response 
    remote isolated function analyzeentitiesDocuments(AnalyzeEntitiesRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeEntitiesResponse|error {
        string resourcePath = string `/v1/documents:analyzeEntities`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyzeEntitiesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Finds entities, similar to AnalyzeEntities in the text and analyzes sentiment associated with each entity and its mentions.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - AnalyzeEntitySentiment request 
    # + return - Successful response 
    remote isolated function analyzeentitysentimentDocuments(AnalyzeEntitySentimentRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeEntitySentimentResponse|error {
        string resourcePath = string `/v1/documents:analyzeEntitySentiment`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyzeEntitySentimentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Analyzes the sentiment of the provided text.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - AnalyzeSentiment request 
    # + return - Successful response 
    remote isolated function analyzesentimentDocuments(AnalyzeSentimentRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeSentimentResponse|error {
        string resourcePath = string `/v1/documents:analyzeSentiment`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyzeSentimentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Analyzes the syntax of the text and provides sentence boundaries and tokenization along with part of speech tags, dependency trees, and other properties.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - AnalyzeSyntax request 
    # + return - Successful response 
    remote isolated function analyzesyntaxDocuments(AnalyzeSyntaxRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeSyntaxResponse|error {
        string resourcePath = string `/v1/documents:analyzeSyntax`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyzeSyntaxResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # A convenience method that provides all the features that analyzeSentiment, analyzeEntities, and analyzeSyntax provide in one call.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - AnnotateText request 
    # + return - Successful response 
    remote isolated function annotatetextDocuments(AnnotateTextRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnnotateTextResponse|error {
        string resourcePath = string `/v1/documents:annotateText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnnotateTextResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Classifies a document into categories.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - ClassifyText request 
    # + return - Successful response 
    remote isolated function classifytextDocuments(ClassifyTextRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ClassifyTextResponse|error {
        string resourcePath = string `/v1/documents:classifyText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClassifyTextResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
