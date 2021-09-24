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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [IRIS E-Signature API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the E-Signature API to create workflows that send specific documents for e-signature documents.
# Create field mappings between Lead fields to populate their respective PDF documents.
# Receive notifications when documents are generated, opened, and signed by recipients.
@display {label: "IRIS E-Signature", iconPath: "resources/iris.esignature.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - Provide your API key as `X-API-KEY`. Eg: `{"X-API-KEY" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Generate an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + payload - Payload data 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function generateEsignatureDocument(int leadId, int applicationId, Body9 payload) returns InlineResponse20037|error {
        string  path = string `/api/v1/leads/${leadId}/signatures/${applicationId}/generate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20037 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20037);
        return response;
    }
    # Send an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + payload - Payload data 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function sendEsignatureDocument(int leadId, int applicationId, Body10 payload) returns InlineResponse20038|error {
        string  path = string `/api/v1/leads/${leadId}/signatures/${applicationId}/send`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20038 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20038);
        return response;
    }
    # Download an e-signature document
    #
    # + applicationId - Application Id 
    # + return - E-Sign document 
    remote isolated function downloadEsignatureDocument(int applicationId) returns string|error {
        string  path = string `/api/v1/leads/signatures/${applicationId}/download`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get a list of all lead e-signatures documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list with all lead e-signatures 
    remote isolated function getAllLeadEsignaturesDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20039|error {
        string  path = string `/api/v1/leads/${leadId}/signatures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20039 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20039);
        return response;
    }
    # Get a list of available applications
    #
    # + return - A list of available applications 
    remote isolated function getAvailableApplications() returns BriefApplicationInfo[]|error {
        string  path = string `/api/v1/leads/applications`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BriefApplicationInfo[] response = check self.clientEp-> get(path, accHeaders, targetType = BriefApplicationInfoArr);
        return response;
    }
    # Get a list of available application field mappings
    #
    # + appId - Application Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available application field mappings 
    remote isolated function getAvailableApplicationFieldMappings(int appId, int? page = (), int? perPage = ()) returns InlineResponse20050|error {
        string  path = string `/api/v1/leads/applications/${appId}/mappings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20050 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20050);
        return response;
    }
    # Create a new application field mapping
    #
    # + appId - Application Id 
    # + payload - ApplicationField data 
    # + return - Created new application field mapping 
    remote isolated function createNewApplicationFieldMapping(int appId, ApplicationField payload) returns ApplicationField|error {
        string  path = string `/api/v1/leads/applications/${appId}/mappings`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApplicationField response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApplicationField);
        return response;
    }
    # Get an application field mapping list
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Application field mapping 
    remote isolated function getApplicationFieldMappingList(int appId, int mapId) returns ApplicationField|error {
        string  path = string `/api/v1/leads/applications/${appId}/mappings/${mapId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApplicationField response = check self.clientEp-> get(path, accHeaders, targetType = ApplicationField);
        return response;
    }
    # Delete an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Updated application field mapping 
    remote isolated function deleteApplicationFieldMapping(int appId, int mapId) returns InlineResponse20051|error {
        string  path = string `/api/v1/leads/applications/${appId}/mappings/${mapId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20051 response = check self.clientEp-> delete(path, accHeaders, targetType = InlineResponse20051);
        return response;
    }
    # Update an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + payload - ApplicationField data 
    # + return - Updated application field mapping 
    remote isolated function updateApplicationFieldMapping(int appId, int mapId, ApplicationField payload) returns ApplicationField|error {
        string  path = string `/api/v1/leads/applications/${appId}/mappings/${mapId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeys["X-API-KEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApplicationField response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ApplicationField);
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
