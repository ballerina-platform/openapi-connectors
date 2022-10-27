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

# This is a generated connector for [Dropbox API v2](https://www.dropbox.com/developers/documentation/http/overview) OpenAPI specification. 
# Dropbox is a modern workspace designed to reduce busywork-so you can focus on the things that matter. Sign in and put your creative energy to work.  
@display {label: "Dropbox", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Dropbox account](https://www.dropbox.com/) and obtain tokens by following [this guide](https://www.dropbox.com/developers/documentation/http/documentation).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Copy a file or folder to a different location in the user's Dropbox.
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for relocation. 
    # + return - Success 
    remote isolated function copyFileOrFolder(RelocationArg payload, string? dropboxApiSelectAdmin = ()) returns RelocationResult|error {
        string resourcePath = string `/files/copy_v2`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RelocationResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a folder at a given path.
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for folder creation. 
    # + return - Success 
    remote isolated function createFolder(CreateFolderArg payload, string? dropboxApiSelectAdmin = ()) returns CreateFolderResult|error {
        string resourcePath = string `/files/create_folder_v2`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateFolderResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete the file or folder at a given path.
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for deletion. 
    # + return - Success 
    remote isolated function deleteFileOrFolder(DeleteArg payload, string? dropboxApiSelectAdmin = ()) returns DeleteResult|error {
        string resourcePath = string `/files/delete_v2`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeleteResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Move a file or folder to a different location in the user's Dropbox.
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for move. 
    # + return - Success 
    remote isolated function moveFileOrFolder(RelocationArg payload, string? dropboxApiSelectAdmin = ()) returns RelocationResult|error {
        string resourcePath = string `/files/move_v2`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RelocationResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Restore a file to a specific revision.
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for restore. 
    # + return - Success 
    remote isolated function restoreFiles(RestoreArg payload, string? dropboxApiSelectAdmin = ()) returns FileMetadata|error {
        string resourcePath = string `/files/restore`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileMetadata response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create Shared Link With Settings
    #
    # + dropboxApiSelectAdmin - The specified `team_member_id` which refer to a team administrator. 
    # + payload - Arguments for create a Dropbox link. 
    # + return - Success 
    remote isolated function createSharedLinkWithSettings(CreateSharedLinkWithSettingsArg payload, string? dropboxApiSelectAdmin = ()) returns SharedLinkMetadata|error {
        string resourcePath = string `/sharing/create_shared_link_with_settings`;
        map<any> headerValues = {"Dropbox-API-Select-Admin": dropboxApiSelectAdmin};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SharedLinkMetadata response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a temporary link to stream content of a file.
    #
    # + payload - Arguments to get temporary link. 
    # + return - Success 
    remote isolated function getTemporaryLink(GetTemporaryLinkArg payload) returns GetTemporaryLinkResult|error {
        string resourcePath = string `/files/get_temporary_link`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetTemporaryLinkResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the metadata for a file or folder.
    #
    # + dropboxApiSelectUser - The specified `team_member_id`. 
    # + payload - Arguments to get metadata. 
    # + return - Success 
    remote isolated function getFileOrFolderMetadata(GetMetadataArg payload, string? dropboxApiSelectUser = ()) returns FileMetadata|error {
        string resourcePath = string `/files/get_metadata`;
        map<any> headerValues = {"Dropbox-API-Select-User": dropboxApiSelectUser};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileMetadata response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns revisions for files based on a file path or a file id.
    #
    # + dropboxApiSelectUser - The specified `team_member_id`. 
    # + payload - Arguments to list revisions. 
    # + return - Success 
    remote isolated function listRevisions(ListRevisionsArg payload, string? dropboxApiSelectUser = ()) returns ListRevisionsResult|error {
        string resourcePath = string `/files/list_revisions`;
        map<any> headerValues = {"Dropbox-API-Select-User": dropboxApiSelectUser};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListRevisionsResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Searches for files and folders.
    #
    # + payload - Arguments to search. 
    # + return - Success 
    remote isolated function searchFiles(SearchArg payload) returns SearchResult|error {
        string resourcePath = string `/files/search_v2`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Download a file from a user's Dropbox.
    #
    # + dropboxApiSelectUser - The specified `team_member_id`. 
    # + dropboxApiArg - Download arguments. 
    # + return - Success 
    remote isolated function downloadFiles(record {} dropboxApiArg, string? dropboxApiSelectUser = ()) returns FileMetadata|error {
        string resourcePath = string `/files/download`;
        map<any> headerValues = {"Dropbox-API-Select-User": dropboxApiSelectUser, "Dropbox-API-Arg": dropboxApiArg};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FileMetadata response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
