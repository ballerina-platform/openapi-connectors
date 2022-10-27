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

# This is a generated connector for [Journey.io API v1.0.0](https://www.journey.io/) OpenAPI specification.
# The journy.io API is organized around REST. Our API has predictable resource-oriented URLs, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.
@display {label: "journey.io", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Journy.io account](https://www.journey.io) and obtain the API Key following [this guide](https://developers.journy.io/#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.journy.io") returns error? {
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
    # Link web activity to user
    #
    # + return - Object was created 
    remote isolated function link(LinkBody payload) returns InlineResponse201|error {
        string resourcePath = string `/link`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Push event
    #
    # + return - Object was created 
    remote isolated function trackJourneyEvent(EventsBody payload) returns InlineResponse201|error {
        string resourcePath = string `/events`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create or update user
    #
    # + return - Object was created 
    remote isolated function upsertUser(UsersUpsertBody payload) returns InlineResponse201|error {
        string resourcePath = string `/users/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create or update account
    #
    # + return - Object was created 
    remote isolated function upsertAccount(AccountsUpsertBody payload) returns InlineResponse201|error {
        string resourcePath = string `/accounts/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Add user to account
    #
    # + accountId - Unique identifier for the account in your database 
    # + return - Object was created 
    remote isolated function addUserToAccount(string accountId, AccountidUsersBody payload) returns InlineResponse201|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove user from account
    #
    # + accountId - Unique identifier for the account in your database 
    # + return - Object was created 
    remote isolated function removeUserFromAccount(string accountId) returns InlineResponse201|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse201 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Validate API key
    #
    # + return - Key validation 
    remote isolated function getValidity() returns InlineResponse200|error {
        string resourcePath = string `/validate`;
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get snippet for a website
    #
    # + domain - The domain you want to receive a snippet for 
    # + return - Snippet 
    remote isolated function getTrackingSnippet(string domain) returns InlineResponse2001|error {
        string resourcePath = string `/tracking/snippet`;
        map<anydata> queryParam = {"domain": domain};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Api-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
