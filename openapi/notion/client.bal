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
import ballerina/lang.'string;

# Client configuration for Notion Connector
#
# + authConfig - Bearer token configuration
# + secureSocketConfig - SSL configuration 
public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Notion API v1)](https://developers.notion.com/reference/intro) OpenAPI Specification. 
# Notion API provides capability to access all-in-one workspace where you can write, plan, collaborate and get organized. 
# it has components such as notes, databases, kanban boards, wikis, calendars, and reminders. You can connect these  
# components to take notes, add tasks, manage projects & more. Notion provides the building blocks and you can  create 
# your own layouts and toolkit to get work done. This ballerina connector allows you to connect Notion through its 
# [REST API](https://developers.notion.com/docs).
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Notion account](https://www.notion.so/)  and obtain tokens following 
    # [this guide](https://developers.notion.com/docs/authorization).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.notion.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Retrieve block children
    #
    # + id - block children ID
    # + pageSize - Page size
    # + notionVersion - API Version
    # + return - 200 Success - Retrieve block children
    remote isolated function retrieveBlockChildren(string id, string? pageSize = (), string notionVersion = "2021-05-13") returns BlockChildrenResponse|error {
        string  path = string `/v1/blocks/${id}/children`;
        map<anydata> queryParam = {"page_size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BlockChildrenResponse response = check self.clientEp-> get(path, accHeaders, targetType = BlockChildrenResponse);
        return response;
    }
    # Append block children
    #
    # + id - block children ID
    # + payload - Request Body Parameters  
    # + notionVersion - API Version
    # + return - 200 Success - Append block children
    remote isolated function appendBlockChildren(string id, PageUpdateRequestBody payload, string notionVersion = "2021-05-13") returns ChildBlockContent|error {
        string  path = string `/v1/blocks/${id}/children`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ChildBlockContent response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ChildBlockContent);
        return response;
    }
    # List all databases
    #
    # + startCursor - If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    # + pageSize - The number of items from the full list desired in the response. Maximum- 100
    # + notionVersion - API Version
    # + return - 200 Success - List all databases
    remote isolated function listAllDatabases(string? startCursor = (), int? pageSize = (), string notionVersion = "2021-05-13") returns DatabaseResponse|error {
        string  path = string `/v1/databases`;
        map<anydata> queryParam = {"start_cursor": startCursor, "page_size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DatabaseResponse response = check self.clientEp-> get(path, accHeaders, targetType = DatabaseResponse);
        return response;
    }
    # Create a database
    #
    # + payload - Page information
    # + notionVersion - API Version
    # + return - 200 Success - Create a database
    remote isolated function createDatabase(DatabaseBodyParams payload, string notionVersion = "2021-05-13") returns DatabaseBodyParams|error {
        string  path = string `/v1/databases`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DatabaseBodyParams response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DatabaseBodyParams);
        return response;
    }
    # Retrieve a database
    #
    # + id - Database ID
    # + notionVersion - API Version
    # + return - 200 Success - Retrieve a database
    remote isolated function retrieveDatabase(string id, string notionVersion = "2021-05-13") returns Database|error {
        string  path = string `/v1/databases/${id}`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Database response = check self.clientEp-> get(path, accHeaders, targetType = Database);
        return response;
    }
    # Query a Database
    #
    # + id - Database ID
    # + payload - Request Body Parameters 
    # + notionVersion - API Version
    # + return - 200 Success - Query a Database (Single Filter)
    remote isolated function queryDatabase(string id, DatabaseContent payload, string notionVersion = "2021-05-13") returns DatabaseResponse|error {
        string  path = string `/v1/databases/${id}/query`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DatabaseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DatabaseResponse);
        return response;
    }
    # Create a page
    #
    # + payload - Page information
    # + notionVersion - API Version
    # + return - 200 Success - Create Page
    remote isolated function createPage(PageBodyParams payload, string notionVersion = "2021-05-13") returns PageResponse|error {
        string  path = string `/v1/pages`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PageResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PageResponse);
        return response;
    }
    # Retrieve a Page
    #
    # + id - Page ID
    # + notionVersion - API Version
    # + return - 200 Success - Retrieve a Page
    remote isolated function retrievePage(string id, string notionVersion = "2021-05-13") returns PageResponse|error {
        string  path = string `/v1/pages/${id}`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PageResponse response = check self.clientEp-> get(path, accHeaders, targetType = PageResponse);
        return response;
    }
    # Update Page properties 
    #
    # + id - Page ID
    # + payload - Request Body Parameters 
    # + notionVersion - API Version
    # + return - 200 Success - Update Page properties
    remote isolated function updatePageProperties(string id, PageContent payload, string notionVersion = "2021-05-13") returns PageUpdatedProperties|error {
        string  path = string `/v1/pages/${id}`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PageUpdatedProperties response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=PageUpdatedProperties);
        return response;
    }
    # List all users
    #
    # + startCursor - If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    # + pageSize - The number of items from the full list desired in the response. Maximum- 100
    # + notionVersion - API Version
    # + return - 200 Success - List all users
    remote isolated function listAllUsers(string? startCursor = (), int? pageSize = (), string notionVersion = "2021-05-13") returns PaginatedUsers|error {
        string  path = string `/v1/users`;
        map<anydata> queryParam = {"start_cursor": startCursor, "page_size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PaginatedUsers response = check self.clientEp-> get(path, accHeaders, targetType = PaginatedUsers);
        return response;
    }
    # Retrieve a user
    #
    # + id - User ID
    # + notionVersion - API Version
    # + return - 200 Success - Retrieve a user
    remote isolated function retrieveUser(string id, string notionVersion = "2021-05-13") returns User|error {
        string  path = string `/v1/users/${id}`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # Searches all pages and child pages
    #
    # + notionVersion - API Version
    # + return - 200 Success - List all user
    remote isolated function searchPages(string notionVersion = "2021-05-13") returns json|error {
        string  path = string `/v1/search`;
        map<any> headerValues = {"Notion-Version": notionVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
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
