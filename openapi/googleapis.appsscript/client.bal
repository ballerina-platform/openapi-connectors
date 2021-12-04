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

# This is a generated connector for [Google Apps Script API v1](https://developers.google.com/apps-script/api/) OpenAPI specification.
# Manages and executes Google Apps Script projects.
@display {label: "Google Apps Script", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://script.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List information about processes made by or on behalf of a user, such as process type and current status.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of returned processes per page of results. Defaults to 50.
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response.
    # + userprocessfilterDeploymentid - Optional field used to limit returned processes to those originating from projects with a specific deployment ID.
    # + userprocessfilterEndtime - Optional field used to limit returned processes to those that completed on or before the given timestamp.
    # + userprocessfilterFunctionname - Optional field used to limit returned processes to those originating from a script function with the given function name.
    # + userprocessfilterProjectname - Optional field used to limit returned processes to those originating from projects with project names containing a specific string.
    # + userprocessfilterScriptid - Optional field used to limit returned processes to those originating from projects with a specific script ID.
    # + userprocessfilterStarttime - Optional field used to limit returned processes to those that were started on or after the given timestamp.
    # + userprocessfilterStatuses - Optional field used to limit returned processes to those having one of the specified process statuses.
    # + userprocessfilterTypes - Optional field used to limit returned processes to those having one of the specified process types.
    # + userprocessfilterUseraccesslevels - Optional field used to limit returned processes to those having one of the specified user access levels.
    # + return - Successful response
    remote isolated function listProcesses(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? userprocessfilterDeploymentid = (), string? userprocessfilterEndtime = (), string? userprocessfilterFunctionname = (), string? userprocessfilterProjectname = (), string? userprocessfilterScriptid = (), string? userprocessfilterStarttime = (), string[]? userprocessfilterStatuses = (), string[]? userprocessfilterTypes = (), string[]? userprocessfilterUseraccesslevels = ()) returns ListUserProcessesResponse|error {
        string  path = string `/v1/processes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "userProcessFilter.deploymentId": userprocessfilterDeploymentid, "userProcessFilter.endTime": userprocessfilterEndtime, "userProcessFilter.functionName": userprocessfilterFunctionname, "userProcessFilter.projectName": userprocessfilterProjectname, "userProcessFilter.scriptId": userprocessfilterScriptid, "userProcessFilter.startTime": userprocessfilterStarttime, "userProcessFilter.statuses": userprocessfilterStatuses, "userProcessFilter.types": userprocessfilterTypes, "userProcessFilter.userAccessLevels": userprocessfilterUseraccesslevels};
        path = path + check getPathForQueryParam(queryParam);
        ListUserProcessesResponse response = check self.clientEp-> get(path, targetType = ListUserProcessesResponse);
        return response;
    }
    # List information about a script's executed processes, such as process type and current status.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of returned processes per page of results. Defaults to 50.
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response.
    # + scriptId - The script ID of the project whose processes are listed.
    # + scriptprocessfilterDeploymentid - Optional field used to limit returned processes to those originating from projects with a specific deployment ID.
    # + scriptprocessfilterEndtime - Optional field used to limit returned processes to those that completed on or before the given timestamp.
    # + scriptprocessfilterFunctionname - Optional field used to limit returned processes to those originating from a script function with the given function name.
    # + scriptprocessfilterStarttime - Optional field used to limit returned processes to those that were started on or after the given timestamp.
    # + scriptprocessfilterStatuses - Optional field used to limit returned processes to those having one of the specified process statuses.
    # + scriptprocessfilterTypes - Optional field used to limit returned processes to those having one of the specified process types.
    # + scriptprocessfilterUseraccesslevels - Optional field used to limit returned processes to those having one of the specified user access levels.
    # + return - Successful response
    remote isolated function listscriptprocessesProcesses(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? scriptId = (), string? scriptprocessfilterDeploymentid = (), string? scriptprocessfilterEndtime = (), string? scriptprocessfilterFunctionname = (), string? scriptprocessfilterStarttime = (), string[]? scriptprocessfilterStatuses = (), string[]? scriptprocessfilterTypes = (), string[]? scriptprocessfilterUseraccesslevels = ()) returns ListScriptProcessesResponse|error {
        string  path = string `/v1/processes:listScriptProcesses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "scriptId": scriptId, "scriptProcessFilter.deploymentId": scriptprocessfilterDeploymentid, "scriptProcessFilter.endTime": scriptprocessfilterEndtime, "scriptProcessFilter.functionName": scriptprocessfilterFunctionname, "scriptProcessFilter.startTime": scriptprocessfilterStarttime, "scriptProcessFilter.statuses": scriptprocessfilterStatuses, "scriptProcessFilter.types": scriptprocessfilterTypes, "scriptProcessFilter.userAccessLevels": scriptprocessfilterUseraccesslevels};
        path = path + check getPathForQueryParam(queryParam);
        ListScriptProcessesResponse response = check self.clientEp-> get(path, targetType = ListScriptProcessesResponse);
        return response;
    }
    # Creates a new, empty script project with no script files and a base manifest file.
    #
    # + payload - CreateProject request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createProjects(CreateProjectRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Project|error {
        string  path = string `/v1/projects`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, targetType=Project);
        return response;
    }
    # Gets a script project's metadata.
    #
    # + scriptId - The script project's Drive ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Project|error {
        string  path = string `/v1/projects/${scriptId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Gets the content of the script project, including the code source and metadata for each script file.
    #
    # + scriptId - The script project's Drive ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + versionNumber - The version number of the project to retrieve. If not provided, the project's HEAD version is returned.
    # + return - Successful response
    remote isolated function getcontentProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? versionNumber = ()) returns Content|error {
        string  path = string `/v1/projects/${scriptId}/content`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "versionNumber": versionNumber};
        path = path + check getPathForQueryParam(queryParam);
        Content response = check self.clientEp-> get(path, targetType = Content);
        return response;
    }
    # Updates the content of the specified script project. This content is stored as the HEAD version, and is used when the script is executed as a trigger, in the script editor, in add-on preview mode, or as a web app or Apps Script API in development mode. This clears all the existing files in the project.
    #
    # + scriptId - The script project's Drive ID.
    # + payload - Content request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updatecontentProjects(string scriptId, Content payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Content|error {
        string  path = string `/v1/projects/${scriptId}/content`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Content response = check self.clientEp->put(path, request, targetType=Content);
        return response;
    }
    # Lists the deployments of an Apps Script project.
    #
    # + scriptId - The script project's Drive ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of deployments on each returned page. Defaults to 50.
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response.
    # + return - Successful response
    remote isolated function listProjectsDeployments(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListDeploymentsResponse|error {
        string  path = string `/v1/projects/${scriptId}/deployments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListDeploymentsResponse response = check self.clientEp-> get(path, targetType = ListDeploymentsResponse);
        return response;
    }
    # Creates a deployment of an Apps Script project.
    #
    # + scriptId - The script project's Drive ID.
    # + payload - DeploymentConfig request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createProjectsDeployments(string scriptId, DeploymentConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string  path = string `/v1/projects/${scriptId}/deployments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Deployment response = check self.clientEp->post(path, request, targetType=Deployment);
        return response;
    }
    # Gets a deployment of an Apps Script project.
    #
    # + scriptId - The script project's Drive ID.
    # + deploymentId - The deployment ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getProjectsDeployments(string scriptId, string deploymentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string  path = string `/v1/projects/${scriptId}/deployments/${deploymentId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Deployment response = check self.clientEp-> get(path, targetType = Deployment);
        return response;
    }
    # Updates a deployment of an Apps Script project.
    #
    # + scriptId - The script project's Drive ID.
    # + deploymentId - The deployment ID for this deployment.
    # + payload - UpdateDeployment request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updateProjectsDeployments(string scriptId, string deploymentId, UpdateDeploymentRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string  path = string `/v1/projects/${scriptId}/deployments/${deploymentId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Deployment response = check self.clientEp->put(path, request, targetType=Deployment);
        return response;
    }
    # Deletes a deployment of an Apps Script project.
    #
    # + scriptId - The script project's Drive ID.
    # + deploymentId - The deployment ID to be undeployed.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteProjectsDeployments(string scriptId, string deploymentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/projects/${scriptId}/deployments/${deploymentId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get metrics data for scripts, such as number of executions and active users.
    #
    # + scriptId - Required field indicating the script to get metrics for.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + metricsfilterDeploymentid - Optional field indicating a specific deployment to retrieve metrics from.
    # + metricsGranularity - Required field indicating what granularity of metrics are returned.
    # + return - Successful response
    remote isolated function getmetricsProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? metricsfilterDeploymentid = (), string? metricsGranularity = ()) returns Metrics|error {
        string  path = string `/v1/projects/${scriptId}/metrics`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "metricsFilter.deploymentId": metricsfilterDeploymentid, "metricsGranularity": metricsGranularity};
        path = path + check getPathForQueryParam(queryParam);
        Metrics response = check self.clientEp-> get(path, targetType = Metrics);
        return response;
    }
    # List the versions of a script project.
    #
    # + scriptId - The script project's Drive ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of versions on each returned page. Defaults to 50.
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response.
    # + return - Successful response
    remote isolated function listProjectsVersions(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListVersionsResponse|error {
        string  path = string `/v1/projects/${scriptId}/versions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListVersionsResponse response = check self.clientEp-> get(path, targetType = ListVersionsResponse);
        return response;
    }
    # Creates a new immutable version using the current code, with a unique version number.
    #
    # + scriptId - The script project's Drive ID.
    # + payload - Version description
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createProjectsVersions(string scriptId, Version payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Version|error {
        string  path = string `/v1/projects/${scriptId}/versions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Version response = check self.clientEp->post(path, request, targetType=Version);
        return response;
    }
    # Gets a version of a script project.
    #
    # + scriptId - The script project's Drive ID.
    # + versionNumber - The version number.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getProjectsVersions(string scriptId, int versionNumber, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Version|error {
        string  path = string `/v1/projects/${scriptId}/versions/${versionNumber}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Version response = check self.clientEp-> get(path, targetType = Version);
        return response;
    }
    # Runs a function in an Apps Script project. The script project must be deployed for use with the Apps Script API and the calling application must share the same Cloud Platform project. This method requires authorization with an OAuth 2.0 token that includes at least one of the scopes listed in the [Authorization](#authorization-scopes) section; script projects that do not require authorization cannot be executed through this API. To find the correct scopes to include in the authentication token, open the script project **Overview** page and scroll down to "Project OAuth Scopes." The error `403, PERMISSION_DENIED: The caller does not have permission` indicates that the Cloud Platform project used to authorize the request is not the same as the one used by the script.
    #
    # + scriptId - The script ID of the script to be executed. Find the script ID on the **Project settings** page under "IDs."
    # + payload - Execution request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function runScripts(string scriptId, ExecutionRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/scripts/${scriptId}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
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
