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

# Configuration for HubSpot Files connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Upload and manage files.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Upload file
    #
    # + payload - File information
    # + return - successful operation
    remote isolated function filesUpload(Body payload) returns File|error {
        string  path = string `/files/v3/files`;
        http:Request request = new;
        File response = check self.clientEp->post(path, request, targetType=File);
        return response;
    }
    # Import a file from a URL into the file manager.
    #
    # + payload - Import information
    # + return - accepted
    remote isolated function postFilesV3FilesImportFromUrlAsyncImportfromurl(ImportFromUrlInput payload) returns ImportFromUrlTaskLocator|error {
        string  path = string `/files/v3/files/import-from-url/async`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ImportFromUrlTaskLocator response = check self.clientEp->post(path, request, targetType=ImportFromUrlTaskLocator);
        return response;
    }
    # Check import status.
    #
    # + taskId - Import by URL task ID
    # + return - successful operation
    remote isolated function tasksStatusCheckimport(string taskId) returns FileActionResponse|error {
        string  path = string `/files/v3/files/import-from-url/async/tasks/${taskId}/status`;
        FileActionResponse response = check self.clientEp-> get(path, targetType = FileActionResponse);
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
    remote isolated function filesSearchDosearch(string[]? properties = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = (), string? id = (), string? createdAt = (), string? createdAtLte = (), string? createdAtGte = (), string? updatedAt = (), string? updatedAtLte = (), string? updatedAtGte = (), string? name = (), string? filePath = (), int? parentFolderId = (), int? size = (), int? height = (), int? width = (), string? encoding = (), string? 'type = (), string? extension = (), string? url = (), boolean? isUsableInContent = (), boolean? allowsAnonymousAccess = ()) returns CollectionResponseFile|error {
        string  path = string `/files/v3/files/search`;
        map<anydata> queryParam = {"properties": properties, "after": after, "before": before, "limit": 'limit, "sort": sort, "id": id, "createdAt": createdAt, "createdAtLte": createdAtLte, "createdAtGte": createdAtGte, "updatedAt": updatedAt, "updatedAtLte": updatedAtLte, "updatedAtGte": updatedAtGte, "name": name, "filePath": filePath, "parentFolderId": parentFolderId, "size": size, "height": height, "width": width, "encoding": encoding, "type": 'type, "extension": extension, "url": url, "isUsableInContent": isUsableInContent, "allowsAnonymousAccess": allowsAnonymousAccess};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseFile response = check self.clientEp-> get(path, targetType = CollectionResponseFile);
        return response;
    }
    # Get file.
    #
    # + fileId - Id of the desired file.
    # + properties - File properties.
    # + return - successful operation
    remote isolated function filesGetbyId(string fileId, string[]? properties = ()) returns File|error {
        string  path = string `/files/v3/files/${fileId}`;
        map<anydata> queryParam = {"properties": properties};
        path = path + check getPathForQueryParam(queryParam);
        File response = check self.clientEp-> get(path, targetType = File);
        return response;
    }
    # Replace file.
    #
    # + fileId - Id of the desired file.
    # + payload - File information.
    # + return - successful operation
    remote isolated function filesReplace(string fileId, Body1 payload) returns File|error {
        string  path = string `/files/v3/files/${fileId}`;
        http:Request request = new;
        File response = check self.clientEp->put(path, request, targetType=File);
        return response;
    }
    # Delete file
    #
    # + fileId - File ID to delete
    # + return - No content
    remote isolated function deleteFiles(string fileId) returns http:Response|error {
        string  path = string `/files/v3/files/${fileId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # update file properties
    #
    # + fileId - ID of file to update
    # + payload - Options to update.
    # + return - successful operation
    remote isolated function filesUpdateproperties(string fileId, FileUpdateInput payload) returns File|error {
        string  path = string `/files/v3/files/${fileId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->patch(path, request, targetType=File);
        return response;
    }
    # GDPR delete
    #
    # + fileId - ID of file to GDPR delete
    # + return - No content
    remote isolated function deleteArchivegdpr(string fileId) returns http:Response|error {
        string  path = string `/files/v3/files/${fileId}/gdpr-delete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
        string  path = string `/files/v3/files/${fileId}/signed-url`;
        map<anydata> queryParam = {"size": size, "expirationSeconds": expirationSeconds, "upscale": upscale};
        path = path + check getPathForQueryParam(queryParam);
        SignedUrl response = check self.clientEp-> get(path, targetType = SignedUrl);
        return response;
    }
    # Create folder.
    #
    # + payload - Folder creation options
    # + return - successful operation
    remote isolated function postFilesV3FoldersCreate(FolderInput payload) returns Folder|error {
        string  path = string `/files/v3/folders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->post(path, request, targetType=Folder);
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
    remote isolated function foldersSearchDosearch(string[]? properties = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = (), string? id = (), string? createdAt = (), string? createdAtLte = (), string? createdAtGte = (), string? updatedAt = (), string? updatedAtLte = (), string? updatedAtGte = (), string? name = (), string? folderPath = (), int? parentFolderId = ()) returns CollectionResponseFolder|error {
        string  path = string `/files/v3/folders/search`;
        map<anydata> queryParam = {"properties": properties, "after": after, "before": before, "limit": 'limit, "sort": sort, "id": id, "createdAt": createdAt, "createdAtLte": createdAtLte, "createdAtGte": createdAtGte, "updatedAt": updatedAt, "updatedAtLte": updatedAtLte, "updatedAtGte": updatedAtGte, "name": name, "folderPath": folderPath, "parentFolderId": parentFolderId};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseFolder response = check self.clientEp-> get(path, targetType = CollectionResponseFolder);
        return response;
    }
    # Update folder properties
    #
    # + payload - Properties to change in the folder
    # + return - accepted
    remote isolated function updateAsyncUpdateproperties(FolderUpdateInput payload) returns FolderUpdateTaskLocator|error {
        string  path = string `/files/v3/folders/update/async`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FolderUpdateTaskLocator response = check self.clientEp->post(path, request, targetType=FolderUpdateTaskLocator);
        return response;
    }
    # Check folder update status.
    #
    # + taskId - Task ID of folder update
    # + return - successful operation
    remote isolated function statusCheckupdatestatus(string taskId) returns FolderActionResponse|error {
        string  path = string `/files/v3/folders/update/async/tasks/${taskId}/status`;
        FolderActionResponse response = check self.clientEp-> get(path, targetType = FolderActionResponse);
        return response;
    }
    # Get folder
    #
    # + folderId - ID of desired folder
    # + properties - Properties to set on returned folder.
    # + return - successful operation
    remote isolated function foldersGetbyid(string folderId, string[]? properties = ()) returns Folder|error {
        string  path = string `/files/v3/folders/${folderId}`;
        map<anydata> queryParam = {"properties": properties};
        path = path + check getPathForQueryParam(queryParam);
        Folder response = check self.clientEp-> get(path, targetType = Folder);
        return response;
    }
    # Delete folder.
    #
    # + folderId - ID of folder to delete.
    # + return - No content
    remote isolated function deleteFolders(string folderId) returns http:Response|error {
        string  path = string `/files/v3/folders/${folderId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get folder.
    #
    # + folderPath - Path of desired folder.
    # + properties - Properties to set on returned folder.
    # + return - successful operation
    remote isolated function foldersGetbypath(string folderPath, string[]? properties = ()) returns Folder|error {
        string  path = string `/files/v3/folders/${folderPath}`;
        map<anydata> queryParam = {"properties": properties};
        path = path + check getPathForQueryParam(queryParam);
        Folder response = check self.clientEp-> get(path, targetType = Folder);
        return response;
    }
    # Delete folder.
    #
    # + folderPath - Path of folder to delete
    # + return - No content
    remote isolated function foldersArchivebypath(string folderPath) returns http:Response|error {
        string  path = string `/files/v3/folders/${folderPath}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
