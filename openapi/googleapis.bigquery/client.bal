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

# This is a generated connector for [Google BigQuery API v2.0](https://cloud.google.com/bigquery/docs/reference/rest) OpenAPI specification.
# The BigQuery API provides access to create, manage, share and query data.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [google account](https://accounts.google.com/signup) and obtain tokens following [this guide](https://developers.google.com/identity/protocols/oauth2)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://bigquery.googleapis.com/bigquery/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists all projects to which you have been granted any project role.
    #
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + return - Successful response 
    remote isolated function listProjects(string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), int? maxResults = (), string? pageToken = ()) returns ProjectList|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ProjectList response = check self.clientEp-> get(path, targetType = ProjectList);
        return response;
    }
    # Lists all datasets in the specified project to which you have been granted the READER dataset role.
    #
    # + projectId - Project ID of the datasets to be listed 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + 'all - Whether to list all datasets, including hidden ones 
    # + filter - An expression for filtering the results of the request by label. The syntax is "labels.<name>[:<value>]". Multiple filters can be ANDed together by connecting with a space. Example: "labels.department:receiving labels.active". See Filtering datasets using labels for details. 
    # + maxResults - The maximum number of results to return 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + return - Successful response 
    remote isolated function listDatasets(string projectId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), boolean? 'all = (), string? filter = (), int? maxResults = (), string? pageToken = ()) returns DatasetList|error {
        string  path = string `/projects/${projectId}/datasets`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "all": 'all, "filter": filter, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        DatasetList response = check self.clientEp-> get(path, targetType = DatasetList);
        return response;
    }
    # Creates a new empty dataset.
    #
    # + projectId - Project ID of the new dataset 
    # + payload - Dataset Detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function insertDataset(string projectId, Dataset payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Dataset|error {
        string  path = string `/projects/${projectId}/datasets`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dataset response = check self.clientEp->post(path, request, targetType=Dataset);
        return response;
    }
    # Returns the dataset specified by datasetID.
    #
    # + projectId - Project ID of the requested dataset 
    # + datasetId - Dataset ID of the requested dataset 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getDataset(string projectId, string datasetId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Dataset|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        Dataset response = check self.clientEp-> get(path, targetType = Dataset);
        return response;
    }
    # Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource.
    #
    # + projectId - Project ID of the dataset being updated 
    # + datasetId - Dataset ID of the dataset being updated 
    # + payload - Dataset detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function updateDataset(string projectId, string datasetId, Dataset payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Dataset|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dataset response = check self.clientEp->put(path, request, targetType=Dataset);
        return response;
    }
    # Deletes the dataset specified by the datasetId value. Before you can delete a dataset, you must delete all its tables, either manually or by specifying deleteContents. Immediately after deletion, you can create another dataset with the same name.
    #
    # + projectId - Project ID of the dataset being deleted 
    # + datasetId - Dataset ID of dataset being deleted 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + deleteContents - If True, delete all the tables in the dataset. If False and the dataset contains tables, the request will fail. Default is False 
    # + return - Successful response 
    remote isolated function deleteDataset(string projectId, string datasetId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), boolean? deleteContents = ()) returns http:Response|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "deleteContents": deleteContents};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource. This method supports patch semantics.
    #
    # + projectId - Project ID of the dataset being updated 
    # + datasetId - Dataset ID of the dataset being updated 
    # + payload - Dataset detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function patchDataset(string projectId, string datasetId, Dataset payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Dataset|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dataset response = check self.clientEp->patch(path, request, targetType=Dataset);
        return response;
    }
    # Lists all models in the specified dataset. Requires the READER dataset role. After retrieving the list of models, you can get information about a particular model by calling the models.get method.
    #
    # + projectId - Required. Project ID of the models to list. 
    # + datasetId - Required. Dataset ID of the models to list. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + maxResults - The maximum number of results to return in a single response page. Leverage the page tokens to iterate through the entire collection. 
    # + pageToken - Page token, returned by a previous call to request the next page of results 
    # + return - Successful response 
    remote isolated function listModel(string projectId, string datasetId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), int? maxResults = (), string? pageToken = ()) returns ListModelsResponse|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/models`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListModelsResponse response = check self.clientEp-> get(path, targetType = ListModelsResponse);
        return response;
    }
    # Gets the specified model resource by model ID.
    #
    # + projectId - Required. Project ID of the requested model. 
    # + datasetId - Required. Dataset ID of the requested model. 
    # + modelId - Required. Model ID of the requested model. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getModel(string projectId, string datasetId, string modelId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Model|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/models/${modelId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        Model response = check self.clientEp-> get(path, targetType = Model);
        return response;
    }
    # Deletes the model specified by modelId from the dataset.
    #
    # + projectId - Required. Project ID of the model to delete. 
    # + datasetId - Required. Dataset ID of the model to delete. 
    # + modelId - Required. Model ID of the model to delete. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function deleteModel(string projectId, string datasetId, string modelId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns http:Response|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/models/${modelId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Patch specific fields in the specified model.
    #
    # + projectId - Required. Project ID of the model to patch. 
    # + datasetId - Required. Dataset ID of the model to patch. 
    # + modelId - Required. Model ID of the model to patch. 
    # + payload - Model detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function patchModel(string projectId, string datasetId, string modelId, Model payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Model|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/models/${modelId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Model response = check self.clientEp->patch(path, request, targetType=Model);
        return response;
    }
    # Lists all routines in the specified dataset. Requires the READER dataset role.
    #
    # + projectId - Required. Project ID of the routines to list 
    # + datasetId - Required. Dataset ID of the routines to list 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + filter - If set, then only the Routines matching this filter are returned. The current supported form is either "routine_type:" or "routineType:", where is a RoutineType enum. Example: "routineType:SCALAR_FUNCTION". 
    # + maxResults - The maximum number of results to return in a single response page. Leverage the page tokens to iterate through the entire collection. 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + readMask - If set, then only the Routine fields in the field mask, as well as project_id, dataset_id and routine_id, are returned in the response. If unset, then the following Routine fields are returned: etag, project_id, dataset_id, routine_id, routine_type, creation_time, last_modified_time, and language. 
    # + return - Successful response 
    remote isolated function listRoutines(string projectId, string datasetId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? filter = (), int? maxResults = (), string? pageToken = (), string? readMask = ()) returns ListRoutinesResponse|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/routines`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "filter": filter, "maxResults": maxResults, "pageToken": pageToken, "readMask": readMask};
        path = path + check getPathForQueryParam(queryParam);
        ListRoutinesResponse response = check self.clientEp-> get(path, targetType = ListRoutinesResponse);
        return response;
    }
    # Creates a new routine in the dataset.
    #
    # + projectId - Required. Project ID of the new routine 
    # + datasetId - Required. Dataset ID of the new routine 
    # + payload - Routine detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function insertRoutine(string projectId, string datasetId, Routine payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Routine|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/routines`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Routine response = check self.clientEp->post(path, request, targetType=Routine);
        return response;
    }
    # Gets the specified routine resource by routine ID.
    #
    # + projectId - Required. Project ID of the requested routine 
    # + datasetId - Required. Dataset ID of the requested routine 
    # + routineId - Required. Routine ID of the requested routine 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + readMask - If set, only the Routine fields in the field mask are returned in the response. If unset, all Routine fields are returned. 
    # + return - Successful response 
    remote isolated function getRoutine(string projectId, string datasetId, string routineId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? readMask = ()) returns Routine|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/routines/${routineId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "readMask": readMask};
        path = path + check getPathForQueryParam(queryParam);
        Routine response = check self.clientEp-> get(path, targetType = Routine);
        return response;
    }
    # Updates information in an existing routine. The update method replaces the entire Routine resource.
    #
    # + projectId - Required. Project ID of the routine to update 
    # + datasetId - Required. Dataset ID of the routine to update 
    # + routineId - Required. Routine ID of the routine to update 
    # + payload - Routine detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function updateRoutine(string projectId, string datasetId, string routineId, Routine payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Routine|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/routines/${routineId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Routine response = check self.clientEp->put(path, request, targetType=Routine);
        return response;
    }
    # Deletes the routine specified by routineId from the dataset.
    #
    # + projectId - Required. Project ID of the routine to delete 
    # + datasetId - Required. Dataset ID of the routine to delete 
    # + routineId - Required. Routine ID of the routine to delete 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function deleteRoutine(string projectId, string datasetId, string routineId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns http:Response|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/routines/${routineId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Lists all tables in the specified dataset. Requires the READER dataset role.
    #
    # + projectId - Project ID of the tables to list 
    # + datasetId - Dataset ID of the tables to list 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + return - Successful response 
    remote isolated function listTables(string projectId, string datasetId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), int? maxResults = (), string? pageToken = ()) returns TableList|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        TableList response = check self.clientEp-> get(path, targetType = TableList);
        return response;
    }
    # Creates a new, empty table in the dataset.
    #
    # + projectId - Project ID of the new table 
    # + datasetId - Dataset ID of the new table 
    # + payload - Table detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function insertTable(string projectId, string datasetId, Table payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Table|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Table response = check self.clientEp->post(path, request, targetType=Table);
        return response;
    }
    # Gets the specified table resource by table ID. This method does not return the data in the table, it only returns the table resource, which describes the structure of this table.
    #
    # + projectId - Project ID of the requested table 
    # + datasetId - Dataset ID of the requested table 
    # + tableId - Table ID of the requested table 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + selectedFields - List of fields to return (comma-separated). If unspecified, all fields are returned 
    # + return - Successful response 
    remote isolated function getTable(string projectId, string datasetId, string tableId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? selectedFields = ()) returns Table|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "selectedFields": selectedFields};
        path = path + check getPathForQueryParam(queryParam);
        Table response = check self.clientEp-> get(path, targetType = Table);
        return response;
    }
    # Updates information in an existing table. The update method replaces the entire table resource, whereas the patch method only replaces fields that are provided in the submitted table resource.
    #
    # + projectId - Project ID of the table to update 
    # + datasetId - Dataset ID of the table to update 
    # + tableId - Table ID of the table to update 
    # + payload - Table detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function updateTable(string projectId, string datasetId, string tableId, Table payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Table|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Table response = check self.clientEp->put(path, request, targetType=Table);
        return response;
    }
    # Deletes the table specified by tableId from the dataset. If the table contains data, all the data will be deleted.
    #
    # + projectId - Project ID of the table to delete 
    # + datasetId - Dataset ID of the table to delete 
    # + tableId - Table ID of the table to delete 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function deleteTable(string projectId, string datasetId, string tableId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns http:Response|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Updates information in an existing table. The update method replaces the entire table resource, whereas the patch method only replaces fields that are provided in the submitted table resource. This method supports patch semantics.
    #
    # + projectId - Project ID of the table to update 
    # + datasetId - Dataset ID of the table to update 
    # + tableId - Table ID of the table to update 
    # + payload - Table detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function patchTable(string projectId, string datasetId, string tableId, Table payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Table|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Table response = check self.clientEp->patch(path, request, targetType=Table);
        return response;
    }
    # Retrieves table data from a specified set of rows. Requires the READER dataset role.
    #
    # + projectId - Project ID of the table to read 
    # + datasetId - Dataset ID of the table to read 
    # + tableId - Table ID of the table to read 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - Page token, returned by a previous call, identifying the result set 
    # + selectedFields - List of fields to return (comma-separated). If unspecified, all fields are returned 
    # + startIndex - Zero-based index of the starting row to read 
    # + return - Successful response 
    remote isolated function listTableData(string projectId, string datasetId, string tableId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), int? maxResults = (), string? pageToken = (), string? selectedFields = (), string? startIndex = ()) returns TableDataList|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}/data`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "maxResults": maxResults, "pageToken": pageToken, "selectedFields": selectedFields, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        TableDataList response = check self.clientEp-> get(path, targetType = TableDataList);
        return response;
    }
    # Streams data into BigQuery one record at a time without needing to run a load job. Requires the WRITER dataset role.
    #
    # + projectId - Project ID of the destination table. 
    # + datasetId - Dataset ID of the destination table. 
    # + tableId - Table ID of the destination table. 
    # + payload - Table data insert all request detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function insertAllTableData(string projectId, string datasetId, string tableId, TableDataInsertAllRequest payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns TableDataInsertAllResponse|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}/insertAll`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TableDataInsertAllResponse response = check self.clientEp->post(path, request, targetType=TableDataInsertAllResponse);
        return response;
    }
    # Lists all row access policies on the specified table.
    #
    # + projectId - Required. Project ID of the row access policies to list. 
    # + datasetId - Required. Dataset ID of row access policies to list. 
    # + tableId - Required. Table ID of the table to list row access policies. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + pageSize - The maximum number of results to return in a single response page. Leverage the page tokens to iterate through the entire collection. 
    # + pageToken - Page token, returned by a previous call, to request the next page of results. 
    # + return - Successful response 
    remote isolated function listRowAccessPolicies(string projectId, string datasetId, string tableId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), int? pageSize = (), string? pageToken = ()) returns ListRowAccessPoliciesResponse|error {
        string  path = string `/projects/${projectId}/datasets/${datasetId}/tables/${tableId}/rowAccessPolicies`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListRowAccessPoliciesResponse response = check self.clientEp-> get(path, targetType = ListRowAccessPoliciesResponse);
        return response;
    }
    # Lists all jobs that you started in the specified project. Job information is available for a six month period after creation. The job list is sorted in reverse chronological order, by job creation time. Requires the Can View project role, or the Is Owner project role if you set the allUsers property.
    #
    # + projectId - Project ID of the jobs to list 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + allUsers - Whether to display jobs owned by all users in the project. Default false 
    # + maxCreationTime - Max value for job creation time, in milliseconds since the POSIX epoch. If set, only jobs created before or at this timestamp are returned 
    # + maxResults - Maximum number of results to return 
    # + minCreationTime - Min value for job creation time, in milliseconds since the POSIX epoch. If set, only jobs created after or at this timestamp are returned 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + parentJobId - If set, retrieves only jobs whose parent is this job. Otherwise, retrieves only jobs which have no parent 
    # + projection - Restrict information returned to a set of selected fields 
    # + stateFilter - Filter for job state 
    # + return - Successful response 
    remote isolated function listJobs(string projectId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), boolean? allUsers = (), string? maxCreationTime = (), int? maxResults = (), string? minCreationTime = (), string? pageToken = (), string? parentJobId = (), string? projection = (), string[]? stateFilter = ()) returns JobList|error {
        string  path = string `/projects/${projectId}/jobs`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "allUsers": allUsers, "maxCreationTime": maxCreationTime, "maxResults": maxResults, "minCreationTime": minCreationTime, "pageToken": pageToken, "parentJobId": parentJobId, "projection": projection, "stateFilter": stateFilter};
        path = path + check getPathForQueryParam(queryParam);
        JobList response = check self.clientEp-> get(path, targetType = JobList);
        return response;
    }
    # Starts a new asynchronous job. Requires the Can View project role.
    #
    # + projectId - Project ID of the project that will be billed for the job 
    # + payload - Job detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function insertJob(string projectId, Job payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Job|error {
        string  path = string `/projects/${projectId}/jobs`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Job response = check self.clientEp->post(path, request, targetType=Job);
        return response;
    }
    # Returns information about a specific job. Job information is available for a six month period after creation. Requires that you're the person who ran the job, or have the Is Owner project role.
    #
    # + projectId - [Required] Project ID of the requested job 
    # + jobId - [Required] Job ID of the requested job 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + location - The geographic location of the job. Required except for US and EU. See details at https://cloud.google.com/bigquery/docs/locations#specifying_your_location. 
    # + return - Successful response 
    remote isolated function getJob(string projectId, string jobId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? location = ()) returns Job|error {
        string  path = string `/projects/${projectId}/jobs/${jobId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "location": location};
        path = path + check getPathForQueryParam(queryParam);
        Job response = check self.clientEp-> get(path, targetType = Job);
        return response;
    }
    # Requests that a job be cancelled. This call will return immediately, and the client will need to poll for the job status to see if the cancel completed successfully. Cancelled jobs may still incur costs.
    #
    # + projectId - [Required] Project ID of the job to cancel 
    # + jobId - [Required] Job ID of the job to cancel 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + location - The geographic location of the job. Required except for US and EU. See details at https://cloud.google.com/bigquery/docs/locations#specifying_your_location. 
    # + return - Successful response 
    remote isolated function cancelJob(string projectId, string jobId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? location = ()) returns JobCancelResponse|error {
        string  path = string `/projects/${projectId}/jobs/${jobId}/cancel`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "location": location};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        JobCancelResponse response = check self.clientEp-> post(path, request, targetType = JobCancelResponse);
        return response;
    }
    # Requests that a job is deleted. This call will return when the job is deleted. This method is available in limited preview.
    #
    # + projectId - Required. Project ID of the job to be deleted. 
    # + jobId - Required. Job ID of the job to be deleted. If this is a parent job which has child jobs, all child jobs will be deleted as well. Deletion of child jobs directly is not allowed. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + location - The geographic location of the job. Required. See details at: https://cloud.google.com/bigquery/docs/locations#specifying_your_location. 
    # + return - Successful response 
    remote isolated function deleteJob(string projectId, string jobId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? location = ()) returns http:Response|error {
        string  path = string `/projects/${projectId}/jobs/${jobId}/delete`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "location": location};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Runs a BigQuery SQL query synchronously and returns query results if the query completes within a specified timeout.
    #
    # + projectId - Project ID of the project billed for the query 
    # + payload - Query Request Detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function queryJob(string projectId, QueryRequest payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns QueryResponse|error {
        string  path = string `/projects/${projectId}/queries`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        QueryResponse response = check self.clientEp->post(path, request, targetType=QueryResponse);
        return response;
    }
    # Retrieves the results of a query job.
    #
    # + projectId - [Required] Project ID of the query job 
    # + jobId - [Required] Job ID of the query job 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + location - The geographic location where the job should run. Required except for US and EU. See details at https://cloud.google.com/bigquery/docs/locations#specifying_your_location. 
    # + maxResults - Maximum number of results to read 
    # + pageToken - Page token, returned by a previous call, to request the next page of results 
    # + startIndex - Zero-based index of the starting row 
    # + timeoutMs - How long to wait for the query to complete, in milliseconds, before returning. Default is 10 seconds. If the timeout passes before the job completes, the 'jobComplete' field in the response will be false 
    # + return - Successful response 
    remote isolated function getJobQueryResults(string projectId, string jobId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? location = (), int? maxResults = (), string? pageToken = (), string? startIndex = (), int? timeoutMs = ()) returns GetQueryResultsResponse|error {
        string  path = string `/projects/${projectId}/queries/${jobId}`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "location": location, "maxResults": maxResults, "pageToken": pageToken, "startIndex": startIndex, "timeoutMs": timeoutMs};
        path = path + check getPathForQueryParam(queryParam);
        GetQueryResultsResponse response = check self.clientEp-> get(path, targetType = GetQueryResultsResponse);
        return response;
    }
    # Returns the email address of the service account for your project used for interactions with Google Cloud KMS.
    #
    # + projectId - Project ID for which the service account is requested. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getProjectServiceAccount(string projectId, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns GetServiceAccountResponse|error {
        string  path = string `/projects/${projectId}/serviceAccount`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        GetServiceAccountResponse response = check self.clientEp-> get(path, targetType = GetServiceAccountResponse);
        return response;
    }
    # Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
    #
    # + 'resource - REQUIRED: The resource for which the policy is being requested. See the operation documentation for the appropriate value for this field. 
    # + payload - Policy detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getIamPolicy(string 'resource, GetIamPolicyRequest payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Policy|error {
        string  path = string `/${'resource}:getIamPolicy`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Policy response = check self.clientEp->post(path, request, targetType=Policy);
        return response;
    }
    # Sets the access control policy on the specified resource. Replaces any existing policy. Can return `NOT_FOUND`, `INVALID_ARGUMENT`, and `PERMISSION_DENIED` errors.
    #
    # + 'resource - REQUIRED: The resource for which the policy is being specified. See the operation documentation for the appropriate value for this field. 
    # + payload - Policy detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function setIamPolicy(string 'resource, SetIamPolicyRequest payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Policy|error {
        string  path = string `/${'resource}:setIamPolicy`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Policy response = check self.clientEp->post(path, request, targetType=Policy);
        return response;
    }
    # Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a `NOT_FOUND` error. Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
    #
    # + 'resource - REQUIRED: The resource for which the policy detail is being requested. See the operation documentation for the appropriate value for this field. 
    # + payload - Permission request detail 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function testIamPermissions(string 'resource, TestIamPermissionsRequest payload, string? alt = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns TestIamPermissionsResponse|error {
        string  path = string `/${'resource}:testIamPermissions`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TestIamPermissionsResponse response = check self.clientEp->post(path, request, targetType=TestIamPermissionsResponse);
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
