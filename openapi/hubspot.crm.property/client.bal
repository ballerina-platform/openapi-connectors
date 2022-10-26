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

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# All HubSpot objects store data in default and custom properties. These endpoints provide access to read and modify object properties in HubSpot.
@display {label: "HubSpot CRM Property", iconPath: "icon.png"}
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
    # Read all properties
    #
    # + objectType - CRM object type 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getAll(string objectType, boolean archived = false) returns CollectionResponseProperty|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponseProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a property
    #
    # + objectType - CRM object type 
    # + payload - Property data 
    # + return - successful operation 
    remote isolated function create(string objectType, PropertyCreate payload) returns Property|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Property response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Archive a batch of properties
    #
    # + objectType - CRM object type 
    # + payload - Property name 
    # + return - No content 
    remote isolated function batchArchive(string objectType, BatchInputPropertyName payload) returns http:Response|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/batch/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a batch of properties
    #
    # + objectType - CRM object type 
    # + payload - Property data array 
    # + return - successful operation 
    remote isolated function batchCreate(string objectType, BatchInputPropertyCreate payload) returns BatchResponseProperty|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/batch/create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchResponseProperty response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read a batch of properties
    #
    # + objectType - CRM object type 
    # + payload - Property name input array 
    # + return - successful operation 
    remote isolated function batchRead(string objectType, BatchReadInputPropertyName payload) returns BatchResponseProperty|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/batch/read`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchResponseProperty response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read all property groups
    #
    # + objectType - CRM object type 
    # + return - successful operation 
    remote isolated function groupsGetall(string objectType) returns CollectionResponsePropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/groups`;
        CollectionResponsePropertyGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a property group
    #
    # + objectType - CRM object type 
    # + payload - Property group data 
    # + return - successful operation 
    remote isolated function groupsCreate(string objectType, PropertyGroupCreate payload) returns PropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PropertyGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read a property group
    #
    # + objectType - CRM object type 
    # + groupName - Group name 
    # + return - successful operation 
    remote isolated function groupsGetbyname(string objectType, string groupName) returns PropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/groups/${getEncodedUri(groupName)}`;
        PropertyGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive a property group
    #
    # + objectType - CRM object type 
    # + groupName - Group name 
    # + return - No content 
    remote isolated function groupsArchive(string objectType, string groupName) returns http:Response|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/groups/${getEncodedUri(groupName)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a property group
    #
    # + objectType - CRM object type 
    # + groupName - Group name 
    # + payload - Property group data to update 
    # + return - successful operation 
    remote isolated function groupsUpdate(string objectType, string groupName, PropertyGroupUpdate payload) returns PropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/groups/${getEncodedUri(groupName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PropertyGroup response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Read a property
    #
    # + objectType - CRM object type 
    # + propertyName - Property name 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function propertyGetbyname(string objectType, string propertyName, boolean archived = false) returns Property|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/${getEncodedUri(propertyName)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Property response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive a property
    #
    # + objectType - CRM object type 
    # + propertyName - Property name 
    # + return - No content 
    remote isolated function propertyArchive(string objectType, string propertyName) returns http:Response|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/${getEncodedUri(propertyName)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a property
    #
    # + objectType - CRM object type 
    # + propertyName - Property name 
    # + payload - Property data to update 
    # + return - successful operation 
    remote isolated function propertyUpdate(string objectType, string propertyName, PropertyUpdate payload) returns Property|error {
        string resourcePath = string `/crm/v3/properties/${getEncodedUri(objectType)}/${getEncodedUri(propertyName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Property response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
