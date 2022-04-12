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
import ballerina/mime;

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
# These APIs allow to upload and manage files.
@display {label: "HubSpot Files", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    # During initialization you can pass either http:BearerTokenConfig if you have a bearer token or http:OAuth2RefreshTokenGrantConfig if you have Oauth tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Upload file
    #
    # + payload - File data 
    # + return - successful operation 
    remote isolated function filesUpload(V3FilesBody payload) returns File|error {
        string resourcePath = string `/files/v3/files`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        File response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Import a file from a URL into the file manager.
    #
    # + payload - Import data input 
    # + return - accepted 
    remote isolated function filesImportFromUrl(ImportFromUrlInput payload) returns ImportFromUrlTaskLocator|error {
        string resourcePath = string `/files/v3/files/import-from-url/async`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImportFromUrlTaskLocator response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Check import status.
    #
    # + taskId - Import by URL task ID 
    # + return - successful operation 
    remote isolated function checkImportStatus(string taskId) returns FileActionResponse|error {
        string resourcePath = string `/files/v3/files/import-from-url/async/tasks/${taskId}/status`;
        FileActionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search files
    #
    # + properties - Desired file properties in the return object. 
    # + after - The maximum offset of items for a given search is 10000. Narrow your search down if you are reaching this limit. 
    # + before - The minimum offset of items for a given search is 10000. Narrow your search down if you are reaching this limit. 
    # + 'limit - Number of items to return. Maximum limit is 100. 
    # + sort - Sort files by a given field. 
    # + id - Search files by given ID. 
    # + createdAt - Search files by time of creation. 
    # + createdAtLte - Search files whose created time less than or equal to time 
    # + createdAtGte - Search files whose created time greater than or equal to time 
    # + updatedAt - Search files by time of latest updated. 
    # + updatedAtLte - Search files whose updated time less than or equal to time 
    # + updatedAtGte - Search files whose updated time greater than or equal to time 
    # + name - Search for files containing the given name. 
    # + filePath - Search files by path. 
    # + parentFolderId - Search files within given folder ID. 
    # + size - Query by file size. 
    # + height - Search files by height of image or video. 
    # + width - Search files by width of image or video. 
    # + encoding - Search files with specified encoding. 
    # + 'type - Filter by provided file type. 
    # + extension - Search files by given extension. 
    # + url - Search for given URL 
    # + isUsableInContent - If true shows files that have been marked to be used in new content. It false shows files that should not be used in new content. 
    # + allowsAnonymousAccess - If 'true' will show private files; if 'false' will show public files 
    # + return - successful operation 
    remote isolated function filesDoSearch(string[]? properties = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = (), string? id = (), string? createdAt = (), string? createdAtLte = (), string? createdAtGte = (), string? updatedAt = (), string? updatedAtLte = (), string? updatedAtGte = (), string? name = (), string? filePath = (), int? parentFolderId = (), int? size = (), int? height = (), int? width = (), string? encoding = (), string? 'type = (), string? extension = (), string? url = (), boolean? isUsableInContent = (), boolean? allowsAnonymousAccess = ()) returns CollectionResponseFile|error {
        string resourcePath = string `/files/v3/files/search`;
        map<anydata> queryParam = {"properties": properties, "after": after, "before": before, "limit": 'limit, "sort": sort, "id": id, "createdAt": createdAt, "createdAtLte": createdAtLte, "createdAtGte": createdAtGte, "updatedAt": updatedAt, "updatedAtLte": updatedAtLte, "updatedAtGte": updatedAtGte, "name": name, "filePath": filePath, "parentFolderId": parentFolderId, "size": size, "height": height, "width": width, "encoding": encoding, "type": 'type, "extension": extension, "url": url, "isUsableInContent": isUsableInContent, "allowsAnonymousAccess": allowsAnonymousAccess};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionResponseFile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get file.
    #
    # + fileId - Id of the desired file 
    # + properties - File properties 
    # + return - successful operation 
    remote isolated function filesGetById(string fileId, string[]? properties = ()) returns File|error {
        string resourcePath = string `/files/v3/files/${fileId}`;
        map<anydata> queryParam = {"properties": properties};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        File response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace file.
    #
    # + fileId - Id of the desired file 
    # + payload - File data 
    # + return - successful operation 
    remote isolated function filesReplace(string fileId, FilesFileidBody payload) returns File|error {
        string resourcePath = string `/files/v3/files/${fileId}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        File response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete file
    #
    # + fileId - File ID to delete 
    # + return - No content 
    remote isolated function deleteFiles(string fileId) returns http:Response|error {
        string resourcePath = string `/files/v3/files/${fileId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # update file properties
    #
    # + fileId - ID of file to update 
    # + payload - Options to update 
    # + return - successful operation 
    remote isolated function updateFileProperties(string fileId, FileUpdateInput payload) returns File|error {
        string resourcePath = string `/files/v3/files/${fileId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        File response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # GDPR delete
    #
    # + fileId - ID of file to GDPR delete 
    # + return - No content 
    remote isolated function deleteArchiveGdpr(string fileId) returns http:Response|error {
        string resourcePath = string `/files/v3/files/${fileId}/gdpr-delete`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get signed URL to access private file.
    #
    # + fileId - ID of file. 
    # + size - For image files. This will resize the image to the desired size before sharing. Does not affect the original file, just the file served by this signed URL. 
    # + expirationSeconds - How long in seconds the link will provide access to the file. 
    # + upscale - If size is provided, this will upscale the image to fit the size dimensions. 
    # + return - successful operation 
    remote isolated function getSignedUrl(string fileId, string? size = (), int? expirationSeconds = (), boolean? upscale = ()) returns SignedUrl|error {
        string resourcePath = string `/files/v3/files/${fileId}/signed-url`;
        map<anydata> queryParam = {"size": size, "expirationSeconds": expirationSeconds, "upscale": upscale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SignedUrl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create folder.
    #
    # + payload - Folder creation options 
    # + return - successful operation 
    remote isolated function foldersCreate(FolderInput payload) returns Folder|error {
        string resourcePath = string `/files/v3/folders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Folder response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search folders
    #
    # + properties - Properties that should be included in the returned folders. 
    # + after - The maximum offset of items for a given search is 10000. Narrow your search down if you are reaching this limit. 
    # + before - The minimum offset of items for a given search is 10000. Narrow your search down if you are reaching this limit. 
    # + 'limit - Limit of results to return. Max limit is 100. 
    # + sort - Sort results by given property. For example -name sorts by name field descending, name sorts by name field ascending. 
    # + id - Search folder by given ID. 
    # + createdAt - Search for folders with the given creation timestamp. 
    # + createdAtLte - Search files whose created time less than or equal to time 
    # + createdAtGte - Search files whose created time greater than or equal to time 
    # + updatedAt - Search for folder at given update timestamp. 
    # + updatedAtLte - Search files whose updated time less than or equal to time 
    # + updatedAtGte - Search files whose updated time greater than or equal to time 
    # + name - Search for folders containing the specified name. 
    # + folderPath - Search for folders by path. 
    # + parentFolderId - Search for folders with the given parent folder ID. 
    # + return - successful operation 
    remote isolated function doSearch(string[]? properties = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = (), string? id = (), string? createdAt = (), string? createdAtLte = (), string? createdAtGte = (), string? updatedAt = (), string? updatedAtLte = (), string? updatedAtGte = (), string? name = (), string? folderPath = (), int? parentFolderId = ()) returns CollectionResponseFolder|error {
        string resourcePath = string `/files/v3/folders/search`;
        map<anydata> queryParam = {"properties": properties, "after": after, "before": before, "limit": 'limit, "sort": sort, "id": id, "createdAt": createdAt, "createdAtLte": createdAtLte, "createdAtGte": createdAtGte, "updatedAt": updatedAt, "updatedAtLte": updatedAtLte, "updatedAtGte": updatedAtGte, "name": name, "folderPath": folderPath, "parentFolderId": parentFolderId};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionResponseFolder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update folder properties
    #
    # + payload - Properties to change in the folder 
    # + return - accepted 
    remote isolated function updateFolderProperties(FolderUpdateInput payload) returns FolderUpdateTaskLocator|error {
        string resourcePath = string `/files/v3/folders/update/async`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FolderUpdateTaskLocator response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Check folder update status.
    #
    # + taskId - Task ID of folder update 
    # + return - successful operation 
    remote isolated function checkUpdateStatus(string taskId) returns FolderActionResponse|error {
        string resourcePath = string `/files/v3/folders/update/async/tasks/${taskId}/status`;
        FolderActionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get folder
    #
    # + folderId - ID of desired folder 
    # + properties - Properties to set on returned folder. 
    # + return - successful operation 
    remote isolated function foldersGetById(string folderId, string[]? properties = ()) returns Folder|error {
        string resourcePath = string `/files/v3/folders/${folderId}`;
        map<anydata> queryParam = {"properties": properties};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Folder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete folder.
    #
    # + folderId - ID of folder to delete. 
    # + return - No content 
    remote isolated function deleteFolders(string folderId) returns http:Response|error {
        string resourcePath = string `/files/v3/folders/${folderId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get folder.
    #
    # + folderPath - Path of desired folder. 
    # + properties - Properties to set on returned folder. 
    # + return - successful operation 
    remote isolated function foldersGetByPath(string folderPath, string[]? properties = ()) returns Folder|error {
        string resourcePath = string `/files/v3/folders/${folderPath}`;
        map<anydata> queryParam = {"properties": properties};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Folder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete folder.
    #
    # + folderPath - Path of folder to delete 
    # + return - No content 
    remote isolated function foldersArchiveByPath(string folderPath) returns http:Response|error {
        string resourcePath = string `/files/v3/folders/${folderPath}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
