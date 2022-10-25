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

# This is a generated connector from [file360](https://developer.opentext.com/apis/ebc5860f-3e04-4d1b-a8be-b2683738c701/File360) OpenAPI Specification.
# An API that allows interaction with File360 Web client.
# The File360 Web client, a world class user experience powered by Angular/CSS, is built upon a set of RESTful APIs. The power of the web application is available to our customers and partners with the RESTful APIs which power every bit of the web application.
# Please see https://file360demo.otxlab.com/File360Web/test/api for examples and test harness.
@display {label: "file360", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [OpenText account](https://login.opentext.com/register) and obtain an API key.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(string serviceUrl, ConnectionConfig config =  {}) returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
    # Get a listing of archives and applications.
    #
    # + accesstype - Access Type, an OR'ed set of the following : No Access = 0, Retrieval Access = 1, Export Access = 2, Entry Access = 4, Import Access = 8, Update Access = 16, Delete Access = 32, Super Access (includes all above) = 65535 
    # + return - Applications archive pair array listing 
    remote isolated function applications(int accesstype) returns ArchiveApplications[]|error {
        string resourcePath = string `/v1/applications`;
        map<anydata> queryParam = {"accesstype": accesstype};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ArchiveApplications[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Logs on a user with the given credentials defined in the Authentication object.
    #
    # + payload - Authentication information 
    # + return - Logged on user object. 
    remote isolated function logOn(Authentication payload) returns User|error {
        string resourcePath = string `/v1/auth`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Logs off the current user.
    #
    # + return - Logged off. 
    remote isolated function logOff() returns http:Response|error {
        string resourcePath = string `/v1/auth`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Authenticates a user via OTDS, using the state and code, and logs that user onto File360.
    #
    # + code - OAuth code provided by OTDS via the Authorization code grant type 
    # + state - Authorization specific state value 
    # + return - Logged on user object. 
    remote isolated function logonOAuth(string code, string state) returns User|error {
        string resourcePath = string `/v1/oauth`;
        map<anydata> queryParam = {"code": code, "state": state};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Destroy the index data and the files for a document.
    #
    # + masterId - Master id 
    # + 'version - Version id  
    # + allversions - Destroy all versions 
    # + priorversions - Destroy versions prior to the version listed in the version id parameter 
    # + return - Destroy document result. 
    remote isolated function destroyDocument(int masterId, int 'version, boolean allversions, boolean priorversions) returns SourceDocumentResult|error {
        string resourcePath = string `/v1/document`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version, "allversions": allversions, "priorversions": priorversions};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SourceDocumentResult response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a list of devices for a document.
    #
    # + masterId - Master id 
    # + versionId - Version id 
    # + return - Available devices for a document. 
    remote isolated function getDocumentDevices(int masterId, int versionId) returns AvailableDevices|error {
        string resourcePath = string `/v1/document/devices`;
        map<anydata> queryParam = {"masterId": masterId, "versionId": versionId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AvailableDevices response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the file information for the document.
    #
    # + masterId - Master id 
    # + versionId - Version id 
    # + return - Files for the version of the document. 
    remote isolated function getDocumentFileInfo(int masterId, int versionId) returns FileInfo[]|error {
        string resourcePath = string `/v1/document/files`;
        map<anydata> queryParam = {"masterId": masterId, "versionId": versionId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FileInfo[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the index data for a document.
    #
    # + masterId - Master id 
    # + 'version - Version id 
    # + suffix - Suffix 
    # + keyfileDocId - Keyfile public document id 
    # + return - An array with the index data for the document. 
    remote isolated function fetchDocumentIndex(int masterId, int 'version, int suffix, string keyfileDocId) returns FetchDocumentIndexReturn[]|error {
        string resourcePath = string `/v1/document/index`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version, "suffix": suffix, "keyfileDocId": keyfileDocId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FetchDocumentIndexReturn[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the index data for a document.
    #
    # + masterId - Master id 
    # + 'version - Version id 
    # + suffix - Suffix 
    # + payload - Data entry template with modified data entry fields 
    # + return - An identifier for the newly created document. 
    remote isolated function updateDocumentIndex(int masterId, int 'version, int suffix, DataEntryTemplate payload) returns DocumentIdentifier[]|error {
        string resourcePath = string `/v1/document/index`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version, "suffix": suffix};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentIdentifier[] response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a document.
    #
    # + indexDataId - Folder document index id used when uploading document files. Set to 0 if using a list of files in CreateDocumentInfo. 
    # + action - One of the following indexing action : IndexFirstSuffix = 1, Index = 2, Modify = 4 
    # + payload - List of files and index information 
    # + return - Indexed document and folder data. 
    remote isolated function createDocument(int indexDataId, int action, CreateDocumentinfo payload) returns IndexedDocument|error {
        string resourcePath = string `/v1/document/index`;
        map<anydata> queryParam = {"indexDataId": indexDataId, "action": action};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IndexedDocument response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a document.
    #
    # + masterId - Master id 
    # + 'version - Version id 
    # + suffix - Suffix 
    # + return - Delete document results. 
    remote isolated function deleteDocument(int masterId, int 'version, int suffix) returns DeleteDocumentResult|error {
        string resourcePath = string `/v1/document/index`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version, "suffix": suffix};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeleteDocumentResult response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get the keywords associated with a document.
    #
    # + masterId - Master id 
    # + return - Keywords for a document. 
    remote isolated function getKeywords(int masterId) returns Keywords|error {
        string resourcePath = string `/v1/document/keywords`;
        map<anydata> queryParam = {"masterId": masterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Keywords response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Put new keywords in a document.
    #
    # + payload - New Keywords data. 
    # + return - Keywords for a document. 
    remote isolated function putKeywords(Keywords payload) returns Keywords|error {
        string resourcePath = string `/v1/document/keywords`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Keywords response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the legal hold status for a document.
    #
    # + masterId - Master id 
    # + return - Legal hold status for a document. The legal hold status object will be empty if the document is not on legal hold. 
    remote isolated function getLegalHold(int masterId) returns LegalHoldStatus|error {
        string resourcePath = string `/v1/document/legalhold`;
        map<anydata> queryParam = {"masterId": masterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LegalHoldStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set the legal hold data for a document.
    #
    # + masterId - Master id 
    # + 'version - Version 
    # + payload - New legal hold status data. 
    # + return - Document identifier. 
    remote isolated function setLegalHold(int masterId, int 'version, LegalHoldStatus payload) returns SourceDocumentIdentifier|error {
        string resourcePath = string `/v1/document/legalhold`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SourceDocumentIdentifier response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes a document from legal hold .
    #
    # + masterId - Master id 
    # + return - Document identifier. 
    remote isolated function removeLegalHold(int masterId) returns SourceDocumentIdentifier|error {
        string resourcePath = string `/v1/document/legalhold`;
        map<anydata> queryParam = {"masterId": masterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SourceDocumentIdentifier response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get the remarks associated with a document.
    #
    # + masterId - Master id 
    # + suffix - Suffix id 
    # + return - Remarks for a document. 
    remote isolated function getRemarks(int masterId, int suffix) returns Remark|error {
        string resourcePath = string `/v1/document/remarks`;
        map<anydata> queryParam = {"masterId": masterId, "suffix": suffix};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Remark response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Put new remarks in a document.
    #
    # + payload - New remark data. 
    # + return - Remarks for a document. 
    remote isolated function putRemarks(Remark payload) returns Remark|error {
        string resourcePath = string `/v1/document/remarks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Remark response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a suffix for a document.
    #
    # + masterId - Master id 
    # + 'version - Version id 
    # + payload - Data entry template. 
    # + return - Identifier for the new suffix entry. 
    remote isolated function createSuffix(int masterId, int 'version, DataEntryTemplate payload) returns DocumentIdentifier|error {
        string resourcePath = string `/v1/document/suffix`;
        map<anydata> queryParam = {"masterId": masterId, "version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentIdentifier response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlock a document.
    #
    # + masterId - Master id 
    # + return - Identifier of unlocked document. 
    remote isolated function unlock(int masterId) returns SourceDocumentIdentifier|error {
        string resourcePath = string `/v1/document/unlock`;
        map<anydata> queryParam = {"masterId": masterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SourceDocumentIdentifier response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a new version for a document.
    #
    # + masterId - Master id of the document 
    # + versionLabel - New version label 
    # + deviceId - Id of device where version is to be created.  Use document/devices to get a list of available devices for user. 
    # + payload - Collection of file identifiers 
    # + return - New document version identifier. 
    remote isolated function createVersion(int masterId, string versionLabel, int deviceId, DocumentCreateVersionFile[] payload) returns SourceDocumentIdentifier|error {
        string resourcePath = string `/v1/document/version`;
        map<anydata> queryParam = {"masterId": masterId, "versionLabel": versionLabel, "deviceId": deviceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SourceDocumentIdentifier response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a list of versions for a document.
    #
    # + masterId - Master id 
    # + return - Versions for a document. 
    remote isolated function getVersions(int masterId) returns SourceDocumentIdentifier[]|error {
        string resourcePath = string `/v1/document/versions`;
        map<anydata> queryParam = {"masterId": masterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SourceDocumentIdentifier[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update document index data.
    #
    # + payload - Index data change message 
    # + return - Changed documents results. 
    remote isolated function updateDocumentIndexes(DocumentIdentifierIndexDataChangeMessage payload) returns json|error {
        string resourcePath = string `/v1/documents/index`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get a list of error folders for user.
    #
    # + return - A collection of error folders. 
    remote isolated function getIndexErrorFolders() returns IndexFoldersMessage|error {
        string resourcePath = string `/v1/errorfolders`;
        IndexFoldersMessage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update properties of an index folder.
    #
    # + action - Actions to perform on the folder : SendFolderToApplication = 1, SendFolderToUser = 3, SendFolderToGroup = 4, RenameFolder = 5, ReleaseFolder = 6, CloseFolder = 10 
    # + payload - Folder and data to update. 
    # + return - Updated index folder. 
    remote isolated function updateFolder(int action, IndexFolder payload) returns IndexFolder|error {
        string resourcePath = string `/v1/folder`;
        map<anydata> queryParam = {"action": action};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IndexFolder response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an indexing folder.
    #
    # + folderId - Folder id. 
    # + return - Index folder deleted. 
    remote isolated function deleteFolder(int folderId) returns IndexFolder|error {
        string resourcePath = string `/v1/folder`;
        map<anydata> queryParam = {"folderId": folderId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IndexFolder response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get the document information from a folder.
    #
    # + folderId - Id of folder from which to get the document 
    # + id - When viewing a specific document, use IndexDataId; when using prevDoc or nextDoc use DocumentId; when opening folder for indexing, use 0 to return first document in the folder 
    # + prevDoc - Move to the document previous from the index id parameter value 
    # + nextDoc - Move to the next document from the index id parameter value 
    # + isFolderShared - Is this index folder shared with other users or groups 
    # + return - Index folder document viewer information 
    remote isolated function getIndexFolderDocs(int folderId, int id, int prevDoc, int nextDoc, boolean isFolderShared) returns IndexFolderDocumentViewer|error {
        string resourcePath = string `/v1/folder/document`;
        map<anydata> queryParam = {"folderId": folderId, "id": id, "prevDoc": prevDoc, "nextDoc": nextDoc, "isFolderShared": isFolderShared};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IndexFolderDocumentViewer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a user folder document.
    #
    # + sessionName - Document folder name used to identify the directory where the files were uploaded. tThe folder name will be combined with the user's temorary File360 Server path. Like : 'C:/Users/{username}/AppData/Local/Temp/File360Server/Documents/Upload/my-folder-files'. These folders must resolve to a path within the user's File360 Server temporary folder. 
    # + archiveId - With applicationId, archive id is used to find or created the user folder to place document 
    # + applicationId - With archiveId, application id is used to find or created the user folder to place document 
    # + return - The destination folder, and the document created as part of a collection of documents 
    remote isolated function createUserFolderDocument(string sessionName, int archiveId, int applicationId) returns IndexFolderDocuments|error {
        string resourcePath = string `/v1/folder/document`;
        map<anydata> queryParam = {"sessionName": sessionName, "archiveId": archiveId, "applicationId": applicationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        IndexFolderDocuments response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete a document in the user folder.
    #
    # + indexDataId - The index id of the document in the folder.  Returned as part of the IndexFolderDocuments object. 
    # + return - Deleted index folder document. 
    remote isolated function deleteFolderDocument(int indexDataId) returns IndexFolderDocument|error {
        string resourcePath = string `/v1/folder/document`;
        map<anydata> queryParam = {"indexDataId": indexDataId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IndexFolderDocument response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a Brava composition id for a list of folder document files.
    #
    # + payload - List of files in the folder document. 
    # + return - Brava composition id for a list of folder document files. 
    remote isolated function getIndexFolderDocCompID(IndexFolderDocumentFiles payload) returns IndexFolderDocumentViewer|error {
        string resourcePath = string `/v1/folder/document/compid`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IndexFolderDocumentViewer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a list of files in a document.
    #
    # + indexId - Document index id 
    # + isFolderShared - Is this folder shared between users or groups 
    # + return - Folder document files. 
    remote isolated function getIndexFolderDocFiles(int indexId, int isFolderShared) returns FileInfo[]|error {
        string resourcePath = string `/v1/folder/document/files`;
        map<anydata> queryParam = {"indexId": indexId, "isFolderShared": isFolderShared};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FileInfo[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of documents in a folder.
    #
    # + folderId - Folder id 
    # + return - A collection of index folder documents. 
    remote isolated function getIndexFolderDocuments(int folderId) returns IndexFolderDocuments|error {
        string resourcePath = string `/v1/folder/documents`;
        map<anydata> queryParam = {"folderId": folderId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IndexFolderDocuments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of data entry folders.
    #
    # + return - A collection of data entry folders. 
    remote isolated function getIndexFolders() returns IndexFoldersMessage|error {
        string resourcePath = string `/v1/folders`;
        IndexFoldersMessage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Log a client message to the Web Server debug log.
    #
    # + payload - Log message information. 
    # + return - Message logged. 
    remote isolated function log(LogMessage payload) returns http:Response|error {
        string resourcePath = string `/v1/log`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the status of the RESTAPI server.
    #
    # + return - Status returned. 
    remote isolated function status() returns ServerStatus[]|error {
        string resourcePath = string `/v1/status`;
        ServerStatus[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Route documents to a user or group.
    #
    # + title - Routing message title 
    # + comment - Routing message comment 
    # + templateId - Retrieval template id 
    # + payload - Routing details 
    # + return - Identifier for the Route just created. 
    remote isolated function routeDocuments(string title, int templateId, RoutingDetails payload, string? comment = ()) returns int|error {
        string resourcePath = string `/v1/route`;
        map<anydata> queryParam = {"title": title, "comment": comment, "templateId": templateId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a data entry template.
    #
    # + id - Template id 
    # + return - Data entry template. 
    remote isolated function getDataEntryTemplate(int id) returns DataEntryTemplate|error {
        string resourcePath = string `/v1/template/dataentry`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataEntryTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Run a data entry template callback.
    #
    # + callbackHandleId - Callback handle id 
    # + fieldId - Field id 
    # + payload - Data entry template object 
    # + return - Call back result. 
    remote isolated function runCallbackDataEntry(int callbackHandleId, int fieldId, DataEntryTemplate payload) returns CallbackResult|error {
        string resourcePath = string `/v1/template/dataentry/callback`;
        map<anydata> queryParam = {"callbackHandleId": callbackHandleId, "fieldId": fieldId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CallbackResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a retrieval template.
    #
    # + id - Template id 
    # + applicationid - Application id 
    # + return - Retrieval template. 
    remote isolated function getRetrievalTemplate(int id, int applicationid) returns RetrievalTemplate|error {
        string resourcePath = string `/v1/template/retrieval`;
        map<anydata> queryParam = {"id": id, "applicationid": applicationid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrievalTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Run a retrieval template callback.
    #
    # + callbackHandleId - Callback handle id 
    # + fieldId - Field id 
    # + payload - Retrieval template 
    # + return - Call back result. 
    remote isolated function runCallbackRetrieval(int callbackHandleId, int fieldId, RetrievalTemplate payload) returns CallbackResult|error {
        string resourcePath = string `/v1/template/retrieval/callback`;
        map<anydata> queryParam = {"callbackHandleId": callbackHandleId, "fieldId": fieldId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CallbackResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search for a list of documents.
    #
    # + payload - Retrieval template filled in with search criteria 
    # + return - Hit list. 
    remote isolated function performRetrieval(RetrievalTemplate payload) returns Hits|error {
        string resourcePath = string `/v1/template/retrieval/documents`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Hits response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update retrieval template layout for user.
    #
    # + payload - Retrieval template 
    # + return - Retrieval template. 
    remote isolated function savePersonalRetrievalTemplate(RetrievalTemplate payload) returns RetrievalTemplate|error {
        string resourcePath = string `/v1/template/retrieval/layout`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RetrievalTemplate response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete retrieval template layout for user.
    #
    # + templateId - Template id 
    # + return - Retrieval template. 
    remote isolated function removePersonalRetrievalTemplate(int templateId) returns RetrievalTemplate|error {
        string resourcePath = string `/v1/template/retrieval/layout`;
        map<anydata> queryParam = {"templateId": templateId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrievalTemplate response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Data entry templates listing.
    #
    # + return - A collection of data entry templates. 
    remote isolated function dataentrytemplates() returns DataEntryTemplatesList|error {
        string resourcePath = string `/v1/templates/dataentry`;
        DataEntryTemplatesList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieval templates listing.
    #
    # + return - A collection of retrieval templates. 
    remote isolated function retrievaltemplates() returns RetrievalTemplatesList|error {
        string resourcePath = string `/v1/templates/retrieval`;
        RetrievalTemplatesList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of users.
    #
    # + return - A collection of user identifiers. 
    remote isolated function users() returns UserIdentifier[]|error {
        string resourcePath = string `/v1/users`;
        UserIdentifier[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of groups.
    #
    # + return - A collection of groups. 
    remote isolated function groups() returns GroupIdentifier[]|error {
        string resourcePath = string `/v1/groups`;
        GroupIdentifier[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of all users.
    #
    # + return - A collection of users. 
    remote isolated function adminUsers() returns User[]|error {
        string resourcePath = string `/v1/admin/users`;
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a user.
    #
    # + userId - User id 
    # + return - A user. 
    remote isolated function getUser(int userId) returns User[]|error {
        string resourcePath = string `/v1/admin/user`;
        map<anydata> queryParam = {"userId": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a user.
    #
    # + userId - User id 
    # + return - Deleted user id. 
    remote isolated function deleteUser(int userId) returns int|error {
        string resourcePath = string `/v1/admin/user`;
        map<anydata> queryParam = {"userId": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        int response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a list of groups.
    #
    # + return - A collection of groups. 
    remote isolated function adminGroups() returns Group[]|error {
        string resourcePath = string `/v1/admin/groups`;
        Group[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a group.
    #
    # + groupId - Group id 
    # + return - A group to administer. 
    remote isolated function getGroup(int groupId) returns Group|error {
        string resourcePath = string `/v1/admin/group`;
        map<anydata> queryParam = {"groupId": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Group response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a group.
    #
    # + payload - Group updates 
    # + return - Updated group. 
    remote isolated function editGroup(Group payload) returns Group|error {
        string resourcePath = string `/v1/admin/group`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a group.
    #
    # + payload - Group identifier 
    # + return - Group identifier. 
    remote isolated function createGroup(GroupIdentifier payload) returns GroupIdentifier|error {
        string resourcePath = string `/v1/admin/group`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupIdentifier response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a group.
    #
    # + groupId - Group id 
    # + return - Deleted group id. 
    remote isolated function deleteGroup(int groupId) returns int|error {
        string resourcePath = string `/v1/admin/group`;
        map<anydata> queryParam = {"groupId": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        int response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a the list of users for a group.
    #
    # + groupId - Group id 
    # + return - A group with user information. 
    remote isolated function adminGroupMembers(int groupId) returns Group|error {
        string resourcePath = string `/v1/admin/group/members`;
        map<anydata> queryParam = {"groupId": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Group response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Edit a document security level.
    #
    # + level - Security level 
    # + payload - Document security level 
    # + return - Updated document security level. 
    remote isolated function updateDocumentLevelSecurity(int level, DocumentLevelSecurity payload) returns DocumentLevelSecurity|error {
        string resourcePath = string `/v1/admin/document-security-level`;
        map<anydata> queryParam = {"level": level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentLevelSecurity response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get a workitem.
    #
    # + workitemId - Workitem id 
    # + 'type - Workitem type 
    # + workstep - Workstep name 
    # + workset - Workset name 
    # + workflowId - Workflow id 
    # + timestamp - Workitem timestamp 
    # + return - A workitem. 
    remote isolated function retrieveWorkitem(string workitemId, int 'type, string workstep, string workset, int workflowId, string timestamp) returns Workitem|error {
        string resourcePath = string `/v1/workflow/workitem`;
        map<anydata> queryParam = {"workitemId": workitemId, "type": 'type, "workstep": workstep, "workset": workset, "workflowId": workflowId, "timestamp": timestamp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Workitem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Make changes to a workitem.
    #
    # + payload - Workitem 
    # + return - An updated workitem. 
    remote isolated function saveWorkitem(Workitem payload) returns Workitem|error {
        string resourcePath = string `/v1/workflow/workitem`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Workitem response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Send the changes for the workitem.
    #
    # + payload - Workitem 
    # + return - An updated workitem. 
    remote isolated function sendWorkitem(Workitem payload) returns Workitem|error {
        string resourcePath = string `/v1/workflow/workitem`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Workitem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the history for a workitem.
    #
    # + workitemId - Workitem id 
    # + return - The workitem history. 
    remote isolated function getHistory(string workitemId) returns Workitem|error {
        string resourcePath = string `/v1/workflow/workitem/history`;
        map<anydata> queryParam = {"workitemId": workitemId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Workitem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of workitems.
    #
    # + workflowId - Workflow id 
    # + worksetName - Workset name 
    # + return - A collection of workitems. 
    remote isolated function workitems(int workflowId, string worksetName) returns json|error {
        string resourcePath = string `/v1/workflow/workitems`;
        map<anydata> queryParam = {"workflowId": workflowId, "worksetName": worksetName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a count of workflow items awaiting initiation.
    #
    # + return - Count of workitems awaiting initiation. 
    remote isolated function getCountOfWorkflowBacklog() returns int|error {
        string resourcePath = string `/v1/workflow/workitems/backlog`;
        int response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of workitems on the currently logged on users worklist.
    #
    # + return - A collection of workitems. 
    remote isolated function worklist() returns Workitems|error {
        string resourcePath = string `/v1/workflow/worklist`;
        Workitems response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the workflow form.
    #
    # + className - Class name 
    # + return - The workflow form for the class. 
    remote isolated function getForm(string className) returns WorkitemForm|error {
        string resourcePath = string `/v1/workflow/worklist/form`;
        map<anydata> queryParam = {"className": className};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkitemForm response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove a workitem from the current users worklist.
    #
    # + workitemId - Workitem id 
    # + return - The workitem id that was removed. 
    remote isolated function removeWorkitemFromWorklist(string workitemId) returns string|error {
        string resourcePath = string `/v1/workflow/worklist/workitem`;
        map<anydata> queryParam = {"workitemId": workitemId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a list of worksets.
    #
    # + return - A collection of worksets. 
    remote isolated function worksets() returns Worksets|error {
        string resourcePath = string `/v1/workflow/worksets`;
        Worksets response = check self.clientEp->get(resourcePath);
        return response;
    }
}
