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

# This is a generated connector for [Xero Files API v2.16.1](https://developer.xero.com/documentation/api/files/overview) OpenAPI specification.
# The Files API provides access to the files, folders, and the association of files within a Xero organisation. It can be used to upload/download files, manage folders and associate files to invoices, contacts, payments etc.
@display {label: "Xero Files", iconPath: "resources/xero.files.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/files.xro/1.0/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves files
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + pagesize - pass an optional page size value 
    # + page - number of records to skip for pagination 
    # + sort - values to sort by 
    # + return - search results matching criteria 
    remote isolated function getFiles(string xeroTenantId, int? pagesize = (), int? page = (), string? sort = ()) returns Files|error {
        string  path = string `/Files`;
        map<anydata> queryParam = {"pagesize": pagesize, "page": page, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Files response = check self.clientEp-> get(path, accHeaders, targetType = Files);
        return response;
    }
    # Uploads a File to the inbox
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - A record of type `UploadObject` which contains details to upload a file to inbox 
    # + return - A successful request 
    remote isolated function uploadFile(string xeroTenantId, UploadObject payload) returns FileObject|error {
        string  path = string `/Files`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        FileObject response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileObject);
        return response;
    }
    # Retrieves a file by a unique file ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - search results matching criteria 
    remote isolated function getFile(string xeroTenantId, string fileId) returns FileObject|error {
        string  path = string `/Files/${fileId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileObject response = check self.clientEp-> get(path, accHeaders, targetType = FileObject);
        return response;
    }
    # Update a file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + payload - A record of type `FileObject` which contains details to update a file 
    # + return - A successful request 
    remote isolated function updateFile(string xeroTenantId, string fileId, FileObject payload) returns FileObject|error {
        string  path = string `/Files/${fileId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileObject response = check self.clientEp->put(path, request, headers = accHeaders, targetType=FileObject);
        return response;
    }
    # Deletes a specific file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFile(string xeroTenantId, string fileId) returns http:Response|error {
        string  path = string `/Files/${fileId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Uploads a File to a specific folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - pass required folder id to save file to specific folder 
    # + payload - A record of type `UploadObject` which contains details to upload a file to specific folder 
    # + return - A successful request 
    remote isolated function uploadFileToFolder(string xeroTenantId, string folderId, UploadObject payload) returns FileObject|error {
        string  path = string `/Files/${folderId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        FileObject response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileObject);
        return response;
    }
    # Retrieves the content of a specific file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - returns the byte array of the specific file based on id 
    remote isolated function getFileContent(string xeroTenantId, string fileId) returns string|error {
        string  path = string `/Files/${fileId}/Content`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific file associations
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - search results matching criteria 
    remote isolated function getFileAssociations(string xeroTenantId, string fileId) returns Association[]|error {
        string  path = string `/Files/${fileId}/Associations`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Association[] response = check self.clientEp-> get(path, accHeaders, targetType = AssociationArr);
        return response;
    }
    # Creates a new file association
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + payload - A record of type `Association` which contains details to create a new file association 
    # + return - A successful request 
    remote isolated function createFileAssociation(string xeroTenantId, string fileId, Association payload) returns Association|error {
        string  path = string `/Files/${fileId}/Associations`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Association response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Association);
        return response;
    }
    # Deletes an existing file association
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + objectId - Object id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFileAssociation(string xeroTenantId, string fileId, string objectId) returns http:Response|error {
        string  path = string `/Files/${fileId}/Associations/${objectId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieves an association object using a unique object ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + objectId - Object id for single object 
    # + return - search results matching criteria 
    remote isolated function getAssociationsByObject(string xeroTenantId, string objectId) returns Association[]|error {
        string  path = string `/Associations/${objectId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Association[] response = check self.clientEp-> get(path, accHeaders, targetType = AssociationArr);
        return response;
    }
    # Retrieves folders
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + sort - values to sort by 
    # + return - search results matching criteria 
    remote isolated function getFolders(string xeroTenantId, string? sort = ()) returns Folder[]|error {
        string  path = string `/Folders`;
        map<anydata> queryParam = {"sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Folder[] response = check self.clientEp-> get(path, accHeaders, targetType = FolderArr);
        return response;
    }
    # Creates a new folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - A record of type `Folder` which contains details to create a new folder 
    # + return - search results matching criteria 
    remote isolated function createFolder(string xeroTenantId, Folder payload) returns Folder|error {
        string  path = string `/Folders`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Folder);
        return response;
    }
    # Retrieves specific folder by using a unique folder ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + return - search results matching criteria 
    remote isolated function getFolder(string xeroTenantId, string folderId) returns Folder|error {
        string  path = string `/Folders/${folderId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp-> get(path, accHeaders, targetType = Folder);
        return response;
    }
    # Updates an existing folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + payload - A record of type `Folder` which contains details to update a existing folder 
    # + return - return the updated object 
    remote isolated function updateFolder(string xeroTenantId, string folderId, Folder payload) returns Folder|error {
        string  path = string `/Folders/${folderId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Folder);
        return response;
    }
    # Deletes a folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFolder(string xeroTenantId, string folderId) returns http:Response|error {
        string  path = string `/Folders/${folderId}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieves inbox folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + return - search results matching criteria 
    remote isolated function getInbox(string xeroTenantId) returns Folder|error {
        string  path = string `/Inbox`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp-> get(path, accHeaders, targetType = Folder);
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
