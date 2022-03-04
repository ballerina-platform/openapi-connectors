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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# All HubSpot objects store data in default and custom properties. These endpoints provide access to read and modify object properties in HubSpot.
@display {label: "HubSpot CRM Property", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Read all properties
    #
    # + objectType - CRM object type 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getAll(string objectType, boolean archived = false) returns CollectionResponseProperty|error {
        string resourcePath = string `/crm/v3/properties/${objectType}`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/batch/archive`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/batch/create`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/batch/read`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/groups`;
        CollectionResponsePropertyGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a property group
    #
    # + objectType - CRM object type 
    # + payload - Property group data 
    # + return - successful operation 
    remote isolated function groupsCreate(string objectType, PropertyGroupCreate payload) returns PropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${objectType}/groups`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
        PropertyGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive a property group
    #
    # + objectType - CRM object type 
    # + groupName - Group name 
    # + return - No content 
    remote isolated function groupsArchive(string objectType, string groupName) returns http:Response|error {
        string resourcePath = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update a property group
    #
    # + objectType - CRM object type 
    # + groupName - Group name 
    # + payload - Property group data to update 
    # + return - successful operation 
    remote isolated function groupsUpdate(string objectType, string groupName, PropertyGroupUpdate payload) returns PropertyGroup|error {
        string resourcePath = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/${propertyName}`;
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
        string resourcePath = string `/crm/v3/properties/${objectType}/${propertyName}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update a property
    #
    # + objectType - CRM object type 
    # + propertyName - Property name 
    # + payload - Property data to update 
    # + return - successful operation 
    remote isolated function propertyUpdate(string objectType, string propertyName, PropertyUpdate payload) returns Property|error {
        string resourcePath = string `/crm/v3/properties/${objectType}/${propertyName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Property response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
