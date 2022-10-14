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

# This is a generated connector from [Quickbase API v1](https://developer.quickbase.com/) OpenAPI Specification.
# The Quickbase JSON RESTful API provides secure access to Quickbase apps and allow users to manage access using  Quickbase roles. Users can automate the app lifecycle using the Quickbase API. 
@display {label: "Quickbase", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # To use the Quickbase RESTful API, you need to authenticate with either a permanent user token or a temporary one if you are writing a utility client-side. Please refer [the guide](https://developer.quickbase.com/auth) here for more details. 
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.quickbase.com/v1/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create an app
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - App details 
    # + return - Success 
    remote isolated function createApp(string qbRealmHostname, string authorization, AppsBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/apps`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get an app
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getApp(string appId, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an app
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - App details 
    # + return - Success 
    remote isolated function updateApp(string appId, string qbRealmHostname, string authorization, AppsAppidBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get app events
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getAppEvents(string appId, string qbRealmHostname, string authorization, string? userAgent = ()) returns InlineResponse200[]|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/events`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Copy an app
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - App details 
    # + return - Success 
    remote isolated function copyApp(string appId, string qbRealmHostname, string authorization, AppidCopyBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/copy`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get tables for an app
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getAppTables(string appId, string qbRealmHostname, string authorization, string? userAgent = ()) returns InlineResponse2001[]|error {
        string resourcePath = string `/tables`;
        map<anydata> queryParam = {"appId": appId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a table
    #
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Table details 
    # + return - Success 
    remote isolated function createTable(string appId, string qbRealmHostname, string authorization, TablesBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables`;
        map<anydata> queryParam = {"appId": appId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a table
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getTable(string tableId, string appId, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}`;
        map<anydata> queryParam = {"appId": appId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a table
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Table details 
    # + return - Success 
    remote isolated function updateTable(string tableId, string appId, string qbRealmHostname, string authorization, TablesTableidBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}`;
        map<anydata> queryParam = {"appId": appId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a table
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + appId - The unique identifier of an app 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function deleteTable(string tableId, string appId, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}`;
        map<anydata> queryParam = {"appId": appId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get all relationships
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + skip - The number of relationships to skip. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getRelationships(string tableId, string qbRealmHostname, string authorization, int? skip = (), string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}/relationships`;
        map<anydata> queryParam = {"skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a relationship
    #
    # + tableId - The unique identifier (dbid) of the table. This will be the child table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Relationship details 
    # + return - Success 
    remote isolated function createRelationship(string tableId, string qbRealmHostname, string authorization, TableidRelationshipBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}/relationship`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update a relationship
    #
    # + tableId - The unique identifier (dbid) of the table. This will be the child table. 
    # + relationshipId - The relationship id. This is the field id of the reference field on the child table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Relationship details 
    # + return - Success 
    remote isolated function updateRelationship(string tableId, decimal relationshipId, string qbRealmHostname, string authorization, RelationshipRelationshipidBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}/relationship/${getEncodedUri(relationshipId)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a relationship
    #
    # + tableId - The unique identifier (dbid) of the table. This will be the child table. 
    # + relationshipId - The relationship id. This is the field id of the reference field on the child table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function deleteRelationship(string tableId, decimal relationshipId, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/tables/${getEncodedUri(tableId)}/relationship/${getEncodedUri(relationshipId)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get reports for a table
    #
    # + tableId - The unique identifier of the table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getTableReports(string tableId, string qbRealmHostname, string authorization, string? userAgent = ()) returns InlineResponse2002[]|error {
        string resourcePath = string `/reports`;
        map<anydata> queryParam = {"tableId": tableId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a report
    #
    # + reportId - The identifier of the report, unique to the table. 
    # + tableId - The unique identifier of table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getReport(string reportId, string tableId, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}`;
        map<anydata> queryParam = {"tableId": tableId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Run a report
    #
    # + reportId - The identifier of the report, unique to the table. 
    # + tableId - The identifier of the table for the report. 
    # + skip - The number of records to skip. You can set this value when paginating through a set of results. 
    # + top - The maximum number of records to return. You can override the default Quickbase pagination to get more or fewer results. If your requested value here exceeds the dynamic maximums, we will return a subset of results and the rest can be gathered in subsequent API calls. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Report details 
    # + return - Success 
    remote isolated function runReport(string reportId, string tableId, string qbRealmHostname, string authorization, json payload, int? skip = (), int? top = (), string? userAgent = ()) returns json|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/run`;
        map<anydata> queryParam = {"tableId": tableId, "skip": skip, "top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get fields for a table
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + includeFieldPerms - Set to 'true' if you'd like to get back the custom permissions for the field(s). 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getFields(string tableId, string qbRealmHostname, string authorization, boolean includeFieldPerms = false, string? userAgent = ()) returns InlineResponse2003[]|error {
        string resourcePath = string `/fields`;
        map<anydata> queryParam = {"tableId": tableId, "includeFieldPerms": includeFieldPerms};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a field
    #
    # + tableId - The unique identifier of the table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Field details 
    # + return - Success 
    remote isolated function createField(string tableId, string qbRealmHostname, string authorization, FieldsBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/fields`;
        map<anydata> queryParam = {"tableId": tableId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get field
    #
    # + fieldId - The unique identifier (fid) of the field. 
    # + tableId - The unique identifier (dbid) of the table. 
    # + includeFieldPerms - Set to 'true' if you'd like to get back the custom permissions for the field(s). 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getField(int fieldId, string tableId, string qbRealmHostname, string authorization, boolean includeFieldPerms = false, string? userAgent = ()) returns json|error {
        string resourcePath = string `/fields/${getEncodedUri(fieldId)}`;
        map<anydata> queryParam = {"tableId": tableId, "includeFieldPerms": includeFieldPerms};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a field
    #
    # + fieldId - The unique identifier (fid) of the field. 
    # + tableId - The unique identifier of the table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Field details 
    # + return - Success 
    remote isolated function updateField(int fieldId, string tableId, string qbRealmHostname, string authorization, FieldsFieldidBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/fields/${getEncodedUri(fieldId)}`;
        map<anydata> queryParam = {"tableId": tableId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get usage for all fields
    #
    # + tableId - The unique identifier (dbid) of the table. 
    # + skip - The number of fields to skip from the list. 
    # + top - The maximum number of fields to return. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getFieldsUsage(string tableId, string qbRealmHostname, string authorization, int? skip = (), int? top = (), string? userAgent = ()) returns InlineResponse2004[]|error {
        string resourcePath = string `/fields/usage`;
        map<anydata> queryParam = {"tableId": tableId, "skip": skip, "top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get usage for a field
    #
    # + fieldId - The unique identifier (fid) of the field. 
    # + tableId - The unique identifier (dbid) of the table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function getFieldUsage(int fieldId, string tableId, string qbRealmHostname, string authorization, string? userAgent = ()) returns InlineResponse2004[]|error {
        string resourcePath = string `/fields/usage/${getEncodedUri(fieldId)}`;
        map<anydata> queryParam = {"tableId": tableId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Run a formula
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Formula details 
    # + return - Success 
    remote isolated function runFormula(string qbRealmHostname, string authorization, FormulaRunBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/formula/run`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Insert/Update record(s)
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Record details 
    # + return - Success 
    remote isolated function upsert(string qbRealmHostname, string authorization, RecordsBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/records`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Query for data
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Query details 
    # + return - Success 
    remote isolated function runQuery(string qbRealmHostname, string authorization, RecordsQueryBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/records/query`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a temporary token for a dbid
    #
    # + dbid - The unique identifier of an app or table. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + qbAppToken - Your Quickbase app token 
    # + return - This token is used in the authorization header value (similar to the QB-USER-TOKEN), except it uses the QB-TEMP-TOKEN prefix header['Authorization'] = 'QB-TEMP-TOKEN {token}' 
    remote isolated function getTempTokenDBID(string dbid, string qbRealmHostname, string? userAgent = (), string? qbAppToken = ()) returns json|error {
        string resourcePath = string `/auth/temporary/${getEncodedUri(dbid)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "QB-App-Token": qbAppToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Clone a user token
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - Token details 
    # + return - Success 
    remote isolated function cloneUserToken(string qbRealmHostname, string authorization, UsertokenCloneBody payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/usertoken/clone`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Deactivate a user token
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function deactivateUserToken(string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/usertoken/deactivate`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a user token
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function deleteUserToken(string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/usertoken`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Download file
    #
    # + tableId - The unique identifier of the table. 
    # + recordId - The unique identifier of the record. 
    # + fieldId - The unique identifier of the field. 
    # + versionNumber - The file attachment version number. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Success 
    remote isolated function downloadFile(string tableId, int recordId, int fieldId, int versionNumber, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/files/${getEncodedUri(tableId)}/${getEncodedUri(recordId)}/${getEncodedUri(fieldId)}/${getEncodedUri(versionNumber)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete file
    #
    # + tableId - The unique identifier of the table. 
    # + recordId - The unique identifier of the record. 
    # + fieldId - The unique identifier of the field. 
    # + versionNumber - The file attachment version number. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - Information is entered by the person or utility invoking the API. Choose between the default in your toolkit or custom create it. Being as descriptive as possible will help in identification and troubleshooting. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + return - Successfully Deleted the File Attachment 
    remote isolated function deleteFile(string tableId, int recordId, int fieldId, int versionNumber, string qbRealmHostname, string authorization, string? userAgent = ()) returns json|error {
        string resourcePath = string `/files/${getEncodedUri(tableId)}/${getEncodedUri(recordId)}/${getEncodedUri(fieldId)}/${getEncodedUri(versionNumber)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Deny users
    #
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - A list of user IDs that need to be denied 
    # + return - Success 
    remote isolated function denyUsers(string qbRealmHostname, string authorization, string[] payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/users/deny`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Deny and remove users from groups
    #
    # + shouldDeleteFromGroups - Specifies if the users should also be removed from all groups. 
    # + qbRealmHostname - Your Quickbase domain, for example demo.quickbase.com 
    # + userAgent - This is entered by the person or utility invoking the API. You might custom create this or use the default one of your toolkit. Being descriptive here may offer more identification and troubleshooting capabilities. 
    # + authorization - The Quickbase authentication scheme you are using to authenticate the request, as described on the [authorization page](../auth). 
    # + payload - A list of user IDs that need to be denied 
    # + return - Success 
    remote isolated function denyUsersFromGroups(boolean shouldDeleteFromGroups, string qbRealmHostname, string authorization, string[] payload, string? userAgent = ()) returns json|error {
        string resourcePath = string `/users/deny/${getEncodedUri(shouldDeleteFromGroups)}`;
        map<any> headerValues = {"QB-Realm-Hostname": qbRealmHostname, "User-Agent": userAgent, "Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
}
