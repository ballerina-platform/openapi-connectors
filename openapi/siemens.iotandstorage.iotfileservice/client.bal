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

# This is a generated connector from [Siemens IoT File Service API](https://developer.mindsphere.io/apis/core-identitymanagement/api-identitymanagement-overview.html) OpenAPI Specification.
# The IoT File API enables storing and retrieving files for asset (entity) instances.
@display {label: "Siemens IoT And Storage File Service", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Siemens MindSphere](https://siemens.mindsphere.io/en) account and obtain tokens by following [this guide](https://developer.mindsphere.io/concepts/concept-roles-scopes.html#iot-file-service)
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
    # read a file
    #
    # + entityId - Id to instance of asset (entity) 
    # + filepath - path of the file along with filename 
    # + ifNoneMatch - etag of the latest version (not supported in this release) 
    # + range - Part of a file to return in Bytes, eg bytes=200-600 
    # + return - file content 
    remote isolated function getFile(string entityId, string filepath, int? ifNoneMatch = (), string? range = ()) returns string|error {
        string resourcePath = string `/files/${getEncodedUri(entityId)}/${getEncodedUri(filepath)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # delete a file
    #
    # + entityId - unique identifier of the asset (entity) 
    # + filepath - unique identifier of the file 
    # + return - deleted 
    remote isolated function deleteFile(string entityId, string filepath) returns http:Response|error {
        string resourcePath = string `/files/${getEncodedUri(entityId)}/${getEncodedUri(filepath)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # search files
    #
    # + entityId - asset (entity) instance id 
    # + offset - number of files to skip 
    # + 'limit - maximum number of files to return (max 200) 
    # + count - return total number of matching files 
    # + 'order - sort based on supported fields - see order syntax for more details (name, path, type, size, timestamp, created, updated) 
    # + filter - filter based on supported fields - see filter syntax for more details (name, path, type, size, timestamp, created, updated) 
    # + return - successful operation 
    remote isolated function searchFiles(string entityId, int? offset = (), int? 'limit = (), boolean? count = (), string? 'order = (), string? filter = ()) returns File[]|error {
        string resourcePath = string `/files/${getEncodedUri(entityId)}`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "count": count, "order": 'order, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        File[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # list multi part uploads
    #
    # + entityId - Id to instance of asset (entity) 
    # + filepath - path of the file 
    # + return - multi part list 
    remote isolated function getFileList(string entityId, string filepath) returns Fileslist[]|error {
        string resourcePath = string `/fileslist/${getEncodedUri(entityId)}/${getEncodedUri(filepath)}`;
        Fileslist[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # get all bulk delete jobs
    #
    # + return - return all bulk delete jobs submitted by the tenant 1. <b>id</b>: Job Id created when bulk delete job is accepted 2. <b>timestamp</b>: Timestamp when the job was created 3. <b>status</b>: current status of the job. Possible values can be <br><b>[IN_PROGRESS, COMPLETED_WITH_ERRORS, COMPLETED, FAILED]</b> 
    remote isolated function getDeleteJobs() returns DeleteJobsResponse|error {
        string resourcePath = string `/files/deleteJobs`;
        DeleteJobsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # initiate job to delete all files for the given asset identifier
    #
    # + payload - bulk delete request 
    # + return - bulk delete request has been accepted for processing 
    remote isolated function submitDeleteJob(BulkDeleteRequest payload) returns BulkDeleteResponse|error {
        string resourcePath = string `/files/deleteJobs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkDeleteResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # get the job status of bulk delete operation
    #
    # + id - Job Id of bulk delete operation 
    # + return - return bulk delete job by job id submitted by the tenant 1. <b>id</B>: Job Id created when bulk delete job is accepted 2. <b>timestamp</b>: Timestamp when the job was created 3. <b>status</b>: current status of the job. Possible values can be<br><b>[IN_PROGRESS, COMPLETED_WITH_ERRORS, COMPLETED, FAILED]</b> 
    remote isolated function getDeleteJobStatus(string id) returns BulkDeleteJobResponse|error {
        string resourcePath = string `/files/deleteJobs/${getEncodedUri(id)}`;
        BulkDeleteJobResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
