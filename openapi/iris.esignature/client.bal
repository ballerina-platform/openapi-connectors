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

# This is a generated connector for [IRIS E-Signature API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the E-Signature API to create workflows that send specific documents for e-signature documents.
# Create field mappings between Lead fields to populate their respective PDF documents.
# Receive notifications when documents are generated, opened, and signed by recipients.
@display {label: "IRIS E-Signature", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
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
    # Generate an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + payload - Payload data 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function generateEsignatureDocument(int leadId, int applicationId, ApplicationidGenerateBody payload) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/signatures/${getEncodedUri(applicationId)}/generate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse200 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + payload - Payload data 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function sendEsignatureDocument(int leadId, int applicationId, ApplicationidSendBody payload) returns InlineResponse2001|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/signatures/${getEncodedUri(applicationId)}/send`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of all lead e-signatures documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list with all lead e-signatures 
    remote isolated function getAllLeadEsignaturesDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse2002|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/signatures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available applications
    #
    # + return - A list of available applications 
    remote isolated function getAvailableApplications() returns BriefApplicationInfo[]|error {
        string resourcePath = string `/api/v1/leads/applications`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BriefApplicationInfo[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available application field mappings
    #
    # + appId - Application Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available application field mappings 
    remote isolated function getAvailableApplicationFieldMappings(int appId, int? page = (), int? perPage = ()) returns InlineResponse2003|error {
        string resourcePath = string `/api/v1/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new application field mapping
    #
    # + appId - Application Id 
    # + payload - ApplicationField data 
    # + return - Created new application field mapping 
    remote isolated function createNewApplicationFieldMapping(int appId, ApplicationField payload) returns ApplicationField|error {
        string resourcePath = string `/api/v1/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationField response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get an application field mapping list
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Application field mapping 
    remote isolated function getApplicationFieldMappingList(int appId, int mapId) returns ApplicationField|error {
        string resourcePath = string `/api/v1/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApplicationField response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Updated application field mapping 
    remote isolated function deleteApplicationFieldMapping(int appId, int mapId) returns InlineResponse2004|error {
        string resourcePath = string `/api/v1/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + payload - ApplicationField data 
    # + return - Updated application field mapping 
    remote isolated function updateApplicationFieldMapping(int appId, int mapId, ApplicationField payload) returns ApplicationField|error {
        string resourcePath = string `/api/v1/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationField response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
}
