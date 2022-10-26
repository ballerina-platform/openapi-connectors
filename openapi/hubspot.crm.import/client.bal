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
import ballerina/mime;

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
@display {label: "HubSpot CRM Import", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com") returns error? {
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
    # Get active imports
    #
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + before - The paging cursor token from second page onwards will be returned as the `paging.next.before` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + return - successful operation 
    remote isolated function getPage(string? after = (), string? before = (), int? 'limit = ()) returns PublicImportCollectionResponse|error {
        string resourcePath = string `/crm/v3/imports/`;
        map<anydata> queryParam = {"after": after, "before": before, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PublicImportCollectionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start a new import
    #
    # + payload - Data import resourses 
    # + return - successful operation 
    remote isolated function create(V3ImportsBody payload) returns PublicImportResponse|error {
        string resourcePath = string `/crm/v3/imports/`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        PublicImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the information on any import
    #
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function getById(int importId) returns PublicImportResponse|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}`;
        PublicImportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel an active import
    #
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function cancel(int importId) returns ActionResponse|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function errors(int importId, string? after = (), int? 'limit = ()) returns PublicImportErrorCollection|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}/errors`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PublicImportErrorCollection response = check self.clientEp->get(resourcePath);
        return response;
    }
}
