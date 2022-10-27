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

# This is a generated connector for [Xero Files API v2.16.1](https://developer.xero.com/documentation/api/files/overview) OpenAPI specification.
# The Files API provides access to the files, folders, and the association of files within a Xero organisation. It can be used to upload/download files, manage folders and associate files to invoices, contacts, payments etc.
@display {label: "Xero Files", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.xero.com/files.xro/1.0/") returns error? {
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
    # Retrieves files
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + pagesize - pass an optional page size value 
    # + page - number of records to skip for pagination 
    # + sort - values to sort by 
    # + return - search results matching criteria 
    remote isolated function getFiles(string xeroTenantId, int? pagesize = (), int? page = (), string? sort = ()) returns Files|error {
        string resourcePath = string `/Files`;
        map<anydata> queryParam = {"pagesize": pagesize, "page": page, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Files response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Uploads a File to the inbox
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - A record of type `UploadObject` which contains details to upload a file to inbox 
    # + return - A successful request 
    remote isolated function uploadFile(string xeroTenantId, UploadObject payload) returns FileObject|error {
        string resourcePath = string `/Files`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        FileObject response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves a file by a unique file ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - search results matching criteria 
    remote isolated function getFile(string xeroTenantId, string fileId) returns FileObject|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + payload - A record of type `FileObject` which contains details to update a file 
    # + return - A successful request 
    remote isolated function updateFile(string xeroTenantId, string fileId, FileObject payload) returns FileObject|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileObject response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes a specific file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFile(string xeroTenantId, string fileId) returns http:Response|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Uploads a File to a specific folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - pass required folder id to save file to specific folder 
    # + payload - A record of type `UploadObject` which contains details to upload a file to specific folder 
    # + return - A successful request 
    remote isolated function uploadFileToFolder(string xeroTenantId, string folderId, UploadObject payload) returns FileObject|error {
        string resourcePath = string `/Files/${getEncodedUri(folderId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        FileObject response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the content of a specific file
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - returns the byte array of the specific file based on id 
    remote isolated function getFileContent(string xeroTenantId, string fileId) returns string|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}/Content`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves a specific file associations
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + return - search results matching criteria 
    remote isolated function getFileAssociations(string xeroTenantId, string fileId) returns Association[]|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}/Associations`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Association[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new file association
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + payload - A record of type `Association` which contains details to create a new file association 
    # + return - A successful request 
    remote isolated function createFileAssociation(string xeroTenantId, string fileId, Association payload) returns Association|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}/Associations`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Association response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes an existing file association
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + fileId - File id for single object 
    # + objectId - Object id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFileAssociation(string xeroTenantId, string fileId, string objectId) returns http:Response|error {
        string resourcePath = string `/Files/${getEncodedUri(fileId)}/Associations/${getEncodedUri(objectId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieves an association object using a unique object ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + objectId - Object id for single object 
    # + return - search results matching criteria 
    remote isolated function getAssociationsByObject(string xeroTenantId, string objectId) returns Association[]|error {
        string resourcePath = string `/Associations/${getEncodedUri(objectId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Association[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves folders
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + sort - values to sort by 
    # + return - search results matching criteria 
    remote isolated function getFolders(string xeroTenantId, string? sort = ()) returns Folder[]|error {
        string resourcePath = string `/Folders`;
        map<anydata> queryParam = {"sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Folder[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - A record of type `Folder` which contains details to create a new folder 
    # + return - search results matching criteria 
    remote isolated function createFolder(string xeroTenantId, Folder payload) returns Folder|error {
        string resourcePath = string `/Folders`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Folder response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves specific folder by using a unique folder ID
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + return - search results matching criteria 
    remote isolated function getFolder(string xeroTenantId, string folderId) returns Folder|error {
        string resourcePath = string `/Folders/${getEncodedUri(folderId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates an existing folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + payload - A record of type `Folder` which contains details to update a existing folder 
    # + return - return the updated object 
    remote isolated function updateFolder(string xeroTenantId, string folderId, Folder payload) returns Folder|error {
        string resourcePath = string `/Folders/${getEncodedUri(folderId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Folder response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes a folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + folderId - Folder id for single object 
    # + return - Successful deletion - return response 204 no content 
    remote isolated function deleteFolder(string xeroTenantId, string folderId) returns http:Response|error {
        string resourcePath = string `/Folders/${getEncodedUri(folderId)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieves inbox folder
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + return - search results matching criteria 
    remote isolated function getInbox(string xeroTenantId) returns Folder|error {
        string resourcePath = string `/Inbox`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
