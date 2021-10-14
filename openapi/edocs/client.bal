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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # You can obtain a **X-DM-DST** by connecting to a DM Server.
    # 
    # It can be found under "HEADERS" in the response body.
    string xDmDst;
|};

# This is a generated connector from [eDocs](https://www.opentext.com/products-and-solutions/industries/legal/legal-content-management-edocs) OpenAPI Specification.
# An API that allows interaction with the resources stored on an eDOCS DM Server.
@display {label: "eDocs", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [OpenText account](https://login.opentext.com/register) and obtain an API key.
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get a collection of available libraries
    #
    # + configuration - Retrieve DM Server configuration information (if available) 
    # + return - Expected response to a valid request 
    remote isolated function getLibraries(string? configuration = ()) returns json|error {
        string path = string `/libraries`;
        map<anydata> queryParam = {"configuration": configuration};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(path, accHeaders, targetType = json);
        return response;
    }
    # Connect to the DM Server and get key information in the response
    #
    # + payload - Credentials to connect to library 
    # + return - Expected response to a valid request 
    remote isolated function connect(ConnectBody payload) returns json|error {
        string path = string `/connect`;
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Retrieve a collection of available folders
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of available folders 
    remote isolated function getFolders(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a new folder
    #
    # + library - Name of library (lib) 
    # + payload - Profile data needed to create a folder 
    # + return - Expected response to a valid request 
    remote isolated function addNewFolder(string library, ProfileData payload) returns json|error {
        string path = string `/folders`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Retrieve a collection of public folders
    #
    # + library - Name of library (lib) 
    # + libs - Comma delimited list of multiple libraries 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of public folders 
    remote isolated function getPublicFolders(string library, string? libs = (), int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/public`;
        map<anydata> queryParam = {"library": library, "libs": libs, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of recently edited items
    #
    # + library - Name of library (lib) 
    # + libs - Comma delimited list of multiple libraries 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of recently edited items 
    remote isolated function getRecentEdits(string library, string? libs = (), int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/recentedits`;
        map<anydata> queryParam = {"library": library, "libs": libs, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of checked out items
    #
    # + library - Name of library (lib) 
    # + libs - Comma delimited list of multiple libraries 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of checked out items 
    remote isolated function getCheckedOutItems(string library, string? libs = (), int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/checkedout`;
        map<anydata> queryParam = {"library": library, "libs": libs, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of deleted items
    #
    # + library - Name of library (lib) 
    # + libs - Comma delimited list of multiple libraries 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of deleted items 
    remote isolated function getDeletedItems(string library, string? libs = (), int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/deleted`;
        map<anydata> queryParam = {"library": library, "libs": libs, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of system defined templates
    #
    # + library - Name of library (lib) 
    # + libs - Comma delimited list of multiple libraries 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of system defined templates 
    remote isolated function getTemplates(string library, string? libs = (), int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/templates`;
        map<anydata> queryParam = {"library": library, "libs": libs, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of content from this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of folder content 
    remote isolated function getFolder(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this folder be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteFolder(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileForTheFolder(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the profile data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Profile data that needs to be replaced. 
    # + return - Null response 
    remote isolated function updateProfileData(string id, string library, ProfileData payload) returns http:Response|error {
        string path = string `/folders/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the security data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getSecurityInfo(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the security data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Security data that needs to replaced for this folder 
    # + return - Null response 
    remote isolated function updateSecurityInfo(string id, string library, SecurityData payload) returns http:Response|error {
        string path = string `/folders/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the user's security rights for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getSecurityRights(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/security/rights`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of references to this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of references 
    remote isolated function getFolderReferences(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/folders/${id}/references`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a reference to this folder into folders and workspaces
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Reference information 
    # + return - Expected response to a valid request 
    remote isolated function addReferenceToFolder(string id, string library, IdReferencesBody payload) returns json|error {
        string path = string `/folders/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request the reference to this folder be deleted from a folder or workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteReferenceFromFolder(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the facet data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getFacetData(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/facets`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the history data for this folder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getHistoryData(string id, string library) returns http:Response|error {
        string path = string `/folders/${id}/history`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of available documents
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of documents 
    remote isolated function getAvailableDocuments(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/documents`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this document be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteDocumentById(string id, string library) returns http:Response|error {
        string path = string `/documents/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileDataOfDocument(string id, string library) returns http:Response|error {
        string path = string `/documents/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the profile data for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Profile data
    # + return - Null response 
    remote isolated function updateProfileDataOfDocument(string id, string library, ProfileData payload) returns http:Response|error {
        string path = string `/documents/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the security data for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getSecurityDataOfDocument(string id, string library) returns http:Response|error {
        string path = string `/documents/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the security data for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Security data that needs to be replaced for this document. 
    # + return - Expected response to a valid request 
    remote isolated function updateSecurityData(string id, string library, SecurityData payload) returns json|error {
        string path = string `/documents/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Retrieve a collection of versions for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of versions for this document 
    remote isolated function getVersionsOfDocument(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/documents/${id}/versions`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this version of the document be deleted
    #
    # + id - Resource identification 
    # + 'version - Version identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteSpecificVersionofSpecificDocument(string id, string 'version, string library) returns http:Response|error {
        string path = string `/documents/${id}/versions/${'version}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of references to this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of references to this document 
    remote isolated function getCollectionOfReferences(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/documents/${id}/references`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a reference to this document into folders and workspaces
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Reference information 
    # + return - Expected response to a valid request 
    remote isolated function addReferencesToFoldersAndWorkspaces(string id, string library, IdReferencesBody1 payload) returns json|error {
        string path = string `/documents/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request the reference to this document be deleted from a folder or workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteReference(string id, string library) returns http:Response|error {
        string path = string `/documents/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of attachments for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of attachments for this document 
    remote isolated function getAttachments(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/documents/${id}/attachments/`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve the contents of this attachment
    #
    # + id - Resource identification 
    # + attachment - Attachment identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getContentOfAttachment(string id, string attachment, string library) returns http:Response|error {
        string path = string `/documents/${id}/attachments/${attachment}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Request this attachment be deleted
    #
    # + id - Resource identification 
    # + attachment - Attachment identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteAttachment(string id, string attachment, string library) returns http:Response|error {
        string path = string `/documents/${id}/attachments/${attachment}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the history data for this document
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getHistoryDataForDocument(string id, string library) returns http:Response|error {
        string path = string `/documents/${id}/history`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get a collection of available saved searches
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of saved searches 
    remote isolated function getSavedSearches(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/searches`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of results that satisfy the saved search criteria
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of search results 
    remote isolated function getSearches(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/searches/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this saved search be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteSearch(string id, string library) returns http:Response|error {
        string path = string `/searches/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this saved search
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileForSavedSearch(string id, string library) returns http:Response|error {
        string path = string `/searches/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of references to this saved search
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of references to this saved search 
    remote isolated function getReferencesForSavedSearch(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/searches/${id}/references`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a reference to this saved search into workspaces
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Reference information 
    # + return - Expected response to a valid request 
    remote isolated function addReferenceToSavedSearch(string id, string library, IdReferencesBody2 payload) returns json|error {
        string path = string `/searches/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request the reference to this saved search be deleted from a workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteReferenceFromSavedSearch(string id, string library) returns http:Response|error {
        string path = string `/searches/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get a collection of available workspaces
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of workspaces 
    remote isolated function getWorkspaces(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/workspaces`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a new workspace
    #
    # + library - Name of library (lib) 
    # + payload - Profile data for new workspace. 
    # + return - Expected response to a valid request 
    remote isolated function addNewWorkspace(string library, ProfileData payload) returns json|error {
        string path = string `/workspaces`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Retrieve a collection of content from this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of content from this workspace 
    remote isolated function getWorkspaceById(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/workspaces/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this workspace be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteWorkspaces(string id, string library) returns http:Response|error {
        string path = string `/workspaces/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileDataForWorkspace(string id, string library) returns http:Response|error {
        string path = string `/workspaces/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the profile data for this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Profile data that needs to be replaced in workspace 
    # + return - Null response 
    remote isolated function repalceProfileDataForWorkspace(string id, string library, ProfileData payload) returns http:Response|error {
        string path = string `/workspaces/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the security data for this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getSecurityDataForWorkspace(string id, string library) returns http:Response|error {
        string path = string `/workspaces/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Replace the security data for this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Security data that needs to replaced in workspace. 
    # + return - Null response 
    remote isolated function updateSecurityDataForWorkspace(string id, string library, SecurityData payload) returns http:Response|error {
        string path = string `/workspaces/${id}/security`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the user's security rights for this workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getUserSecurityRightsForWorkspace(string id, string library) returns http:Response|error {
        string path = string `/workspaces/${id}/security/rights`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get a collection of available FlexFolders
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of FlexFolders 
    remote isolated function getCollectionOfFlexFolders(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/flexfolders`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of content from this FlexFolder
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of content from this FlexFolder 
    remote isolated function getFlexFolder(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/flexfolders/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Request this FlexFolder (subscription) be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteFlexFolder(string id, string library) returns http:Response|error {
        string path = string `/flexfolders/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of available first level terms
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of fileplans 
    remote isolated function getFilePlans(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/fileplans`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of recently used fileplans
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of recently used fileplans 
    remote isolated function getCollectionOfFilePlans(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/fileplans/recentused`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of group favourite fileplans
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of group favourite fileplans 
    remote isolated function getFavoriteGroupFilePlans(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/fileplans/groupfavorites`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of available items of this fileplan level
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of fileplan items 
    remote isolated function getFilePlansById(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/fileplans/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve the history data for this fileplan level
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Null response 
    remote isolated function getHistoryDataForFilePlan(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns http:Response|error {
        string path = string `/fileplans/${id}/history`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this fileplan level
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getFilePlansData(string id, string library) returns http:Response|error {
        string path = string `/fileplans/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of reference for this fileplan
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of references to this fileplan 
    remote isolated function getCollectionOfReferecenForFilePlan(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/fileplans/${id}/references`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a reference to this fileplan into folders and workspaces
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Reference information for fileplan 
    # + return - Expected response to a valid request 
    remote isolated function addReferenceToFilePlan(string id, string library, IdReferencesBody3 payload) returns json|error {
        string path = string `/fileplans/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request the reference to this fileplan be deleted from a folder or workspace
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteReferencesToFilePlan(string id, string library) returns http:Response|error {
        string path = string `/fileplans/${id}/references`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Add a request to this fileplan item
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + payload - Request information 
    # + return - Expected response to a valid request 
    remote isolated function addRequestToFilePlan(string id, string library, IdRequestsBody payload) returns json|error {
        string path = string `/fileplans/${id}/requests`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Retrieve a collection of content from this box
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of boxes 
    remote isolated function getBoxes(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/boxes/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve the history data for this box
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Null response 
    remote isolated function getHistoryDataForBox(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns http:Response|error {
        string path = string `/boxes/${id}/history`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the profile data for this box
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileDataForBox(string id, string library) returns http:Response|error {
        string path = string `/boxes/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve a collection of requests
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of requests 
    remote isolated function getRequests(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/requests`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Add a request to this fileplan item
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Expected response to a valid request 
    remote isolated function addRequestToFilePlanItem(string id, string library) returns json|error {
        string path = string `/requests/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request the request to this fileplan item be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteRequestToFilePlanItem(string id, string library) returns http:Response|error {
        string path = string `/requests/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Access to user settings
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of user settings 
    remote isolated function getUserSettings(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/settings`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of this setting
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of this setting 
    remote isolated function getSettingsById(string id, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/settings/${id}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve the configurable attributes of this setting
    #
    # + id - Resource identification 
    # + setting - Setting identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of attributes of this setting 
    remote isolated function getConfigurableAttributes(string id, string setting, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/settings/${id}/${setting}`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Replace the configurable attributes of this setting
    #
    # + id - Resource identification 
    # + setting - Setting identification 
    # + payload - Setting body
    # + library - Name of library (lib) 
    # + return - Expected response to a valid request 
    remote isolated function replaceConfigurables(string id, string setting, string library, IdSettingBody payload) returns json|error {
        string path = string `/settings/${id}/${setting}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Request this setting be deleted
    #
    # + id - Resource identification 
    # + setting - Setting identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteSettting(string id, string setting, string library) returns http:Response|error {
        string path = string `/settings/${id}/${setting}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Access to form defenitions
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of forms 
    remote isolated function getForms(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/forms`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of applications and their associated form data
    #
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getApplications(string library) returns http:Response|error {
        string path = string `/forms/app_ids`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the definition data for this form
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getDefinitionDataForForm(string id, string library) returns http:Response|error {
        string path = string `/forms/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the column definition data for this form
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getColumnDefinitionDataForForm(string id, string library) returns http:Response|error {
        string path = string `/forms/${id}/columns`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get a collection of available tables
    #
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of tables 
    remote isolated function getLookups(string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/lookups`;
        map<anydata> queryParam = {"library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve a collection of entries from this table
    #
    # + 'table - Table identification 
    # + 'key - Key identification 
    # + profile - Profile identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of entries from this table 
    remote isolated function getEntriesFromTable(string 'table, string 'key, string profile, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/lookups/${'table}`;
        map<anydata> queryParam = {"key": 'key, "profile": profile, "library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Retrieve the definition for this table
    #
    # + 'table - Table identification 
    # + 'key - Key identification 
    # + profile - Profile identification 
    # + library - Name of library (lib) 
    # + 'start - (zero-based) Index of first item to retrieve 
    # + max - Maximum number of items to retrieve 
    # + 'ascending - Retrieve items in ascending order by this field 
    # + 'descending - Retrieve items in descending order by this field 
    # + filter - Restrict items to retrieve based on this criteria 
    # + return - Collection of definition for this table 
    remote isolated function getDefenitionForThisTable(string 'table, string 'key, string profile, string library, int 'start = 0, int max = 10, string? 'ascending = (), string? 'descending = (), string? filter = ()) returns CollectionResponse|error {
        string path = string `/lookups/${'table}/profile`;
        map<anydata> queryParam = {"key": 'key, "profile": profile, "library": library, "start": 'start, "max": max, "ascending": 'ascending, "descending": 'descending, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(path, accHeaders, targetType = CollectionResponse);
        return response;
    }
    # Create a URL
    #
    # + library - Name of library (lib) 
    # + payload - URL information to create a URL 
    # + return - Null response 
    remote isolated function createURL(string library, UrlsBody payload) returns http:Response|error {
        string path = string `/urls`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Request this url be deleted
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function deleteURL(string id, string library) returns http:Response|error {
        string path = string `/urls/${id}`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the column definition data for this form
    #
    # + id - Resource identification 
    # + library - Name of library (lib) 
    # + return - Null response 
    remote isolated function getProfileDataForURL(string id, string library) returns http:Response|error {
        string path = string `/urls/${id}/profile`;
        map<anydata> queryParam = {"library": library};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-DM-DST": self.apiKeyConfig.xDmDst};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
}
