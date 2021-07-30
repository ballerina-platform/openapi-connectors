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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration for HubSpot CRM connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};
# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# All HubSpot objects store data in default and custom properties. These endpoints provide access to read and modify object properties in HubSpot.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Read all properties
    #
    # + objectType - CRM object type
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getAll(string objectType, boolean archived = false) returns CollectionResponseProperty|error {
        string  path = string `/crm/v3/properties/${objectType}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseProperty response = check self.clientEp-> get(path, targetType = CollectionResponseProperty);
        return response;
    }
    # Create a property
    #
    # + objectType - CRM object type
    # + payload - Property data
    # + return - successful operation
    remote isolated function create(string objectType, PropertyCreate payload) returns Property|error {
        string  path = string `/crm/v3/properties/${objectType}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Property response = check self.clientEp->post(path, request, targetType=Property);
        return response;
    }
    # Archive a batch of properties
    #
    # + objectType - CRM object type
    # + payload - Property data
    # + return - No content
    remote isolated function batchArchiveArchive(string objectType, BatchInputPropertyName payload) returns http:Response|error {
        string  path = string `/crm/v3/properties/${objectType}/batch/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Create a batch of properties
    #
    # + objectType - CRM object type
    # + payload - Property data
    # + return - successful operation
    remote isolated function batchCreateCreate(string objectType, BatchInputPropertyCreate payload) returns BatchResponseProperty|error {
        string  path = string `/crm/v3/properties/${objectType}/batch/create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseProperty response = check self.clientEp->post(path, request, targetType=BatchResponseProperty);
        return response;
    }
    # Read a batch of properties
    #
    # + objectType - CRM object type
    # + payload - Property data
    # + return - successful operation
    remote isolated function batchReadRead(string objectType, BatchReadInputPropertyName payload) returns BatchResponseProperty|error {
        string  path = string `/crm/v3/properties/${objectType}/batch/read`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseProperty response = check self.clientEp->post(path, request, targetType=BatchResponseProperty);
        return response;
    }
    # Read all property groups
    #
    # + objectType - CRM object type
    # + return - successful operation
    remote isolated function groupsGetall(string objectType) returns CollectionResponsePropertyGroup|error {
        string  path = string `/crm/v3/properties/${objectType}/groups`;
        CollectionResponsePropertyGroup response = check self.clientEp-> get(path, targetType = CollectionResponsePropertyGroup);
        return response;
    }
    # Create a property group
    #
    # + objectType - CRM object type
    # + payload - Property group data
    # + return - successful operation
    remote isolated function groupsCreate(string objectType, PropertyGroupCreate payload) returns PropertyGroup|error {
        string  path = string `/crm/v3/properties/${objectType}/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PropertyGroup response = check self.clientEp->post(path, request, targetType=PropertyGroup);
        return response;
    }
    # Read a property group
    #
    # + objectType - CRM object type
    # + groupName - Group name
    # + return - successful operation
    remote isolated function groupsGetbyname(string objectType, string groupName) returns PropertyGroup|error {
        string  path = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
        PropertyGroup response = check self.clientEp-> get(path, targetType = PropertyGroup);
        return response;
    }
    # Archive a property group
    #
    # + objectType - CRM object type
    # + groupName - Group name
    # + return - No content
    remote isolated function groupsArchive(string objectType, string groupName) returns http:Response|error {
        string  path = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a property group
    #
    # + objectType - CRM object type
    # + groupName - Group name
    # + payload - Property group data
    # + return - successful operation
    remote isolated function groupsUpdate(string objectType, string groupName, PropertyGroupUpdate payload) returns PropertyGroup|error {
        string  path = string `/crm/v3/properties/${objectType}/groups/${groupName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PropertyGroup response = check self.clientEp->patch(path, request, targetType=PropertyGroup);
        return response;
    }
    # Read a property
    #
    # + objectType - CRM object type
    # + propertyName - Property name
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function propertyGetbyname(string objectType, string propertyName, boolean archived = false) returns Property|error {
        string  path = string `/crm/v3/properties/${objectType}/${propertyName}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        Property response = check self.clientEp-> get(path, targetType = Property);
        return response;
    }
    # Archive a property
    #
    # + objectType - CRM object type
    # + propertyName - Property name
    # + return - No content
    remote isolated function propertyArchive(string objectType, string propertyName) returns http:Response|error {
        string  path = string `/crm/v3/properties/${objectType}/${propertyName}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a property
    #
    # + objectType - CRM object type
    # + propertyName - Property name
    # + payload - Property data
    # + return - successful operation
    remote isolated function propertyUpdate(string objectType, string propertyName, PropertyUpdate payload) returns Property|error {
        string  path = string `/crm/v3/properties/${objectType}/${propertyName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Property response = check self.clientEp->patch(path, request, targetType=Property);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
