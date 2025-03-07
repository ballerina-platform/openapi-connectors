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
# The CRM uses schemas to define how custom objects should store and represent information in the HubSpot CRM. Schemas define details about an object's type, properties, and associations. The schema can be uniquely identified by its **object type ID**.
@display {label: "HubSpot CRM Schema", iconPath: "icon.png"}
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
    # Get all schemas
    #
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getAll(boolean archived = false) returns CollectionResponseObjectSchemaNoPaging|error {
        string resourcePath = string `/crm/v3/schemas`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponseObjectSchemaNoPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new schema
    #
    # + payload - Object schema definition, including properties and associations. 
    # + return - successful operation 
    remote isolated function create(ObjectSchemaEgg payload) returns ObjectSchema|error {
        string resourcePath = string `/crm/v3/schemas`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObjectSchema response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get an existing schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + return - successful operation 
    remote isolated function getById(string objectType) returns ObjectSchema|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        ObjectSchema response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + archived - Whether to return only results that have been archived. 
    # + return - No content 
    remote isolated function archive(string objectType, boolean archived = false) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + payload - Attributes to update in schema 
    # + return - successful operation 
    remote isolated function update(string objectType, ObjectTypeDefinitionPatch payload) returns ObjectTypeDefinition|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObjectTypeDefinition response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Create an association
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + payload - Attributes that define the association. 
    # + return - successful operation 
    remote isolated function associationsCreateassociation(string objectType, AssociationDefinitionEgg payload) returns AssociationDefinition|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/associations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssociationDefinition response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove an association
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + associationIdentifier - Unique ID of the association to remove. 
    # + return - No content 
    remote isolated function associationsArchiveassociation(string objectType, string associationIdentifier) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/associations/${getEncodedUri(associationIdentifier)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Purge schemas
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + return - No content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function purge(string objectType) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/purge`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
