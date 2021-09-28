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

# This is a generated connector for [Google Cloud Build REST API v1](https://cloud.google.com/build/docs/api/reference/rest) OpenAPI specification.
# The Google Cloud Build API provides the capability to manage builds on Google Cloud Platform.
@display {label: "Google Cloud Build", iconPath: "resources/googleapis.cloudbuild.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://cloudbuild.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists previously requested builds. Previously requested builds may still be in-progress, or may have finished successfully or unsuccessfully.
    #
    # + projectId - Required. ID of the project.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - The raw filter text to constrain the results.
    # + pageSize - Number of results to return in the list.
    # + pageToken - The page token for the next page of Builds. If unspecified, the first page of results is returned. If the token is rejected for any reason, INVALID_ARGUMENT will be thrown. In this case, the token should be discarded, and pagination should be restarted from the first page of results. See https://google.aip.dev/158 for more.
    # + parent - The parent of the collection of `Builds`. Format: `projects/{project}/locations/location`
    # + return - Successful response
    remote isolated function listBuilds(string projectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = (), string? parent = ()) returns ListBuildsResponse|error {
        string  path = string `/v1/projects/${projectId}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken, "parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        ListBuildsResponse response = check self.clientEp-> get(path, targetType = ListBuildsResponse);
        return response;
    }
    # Starts a build with the specified configuration. This method returns a long-running `Operation`, which includes the build ID. Pass the build ID to `GetBuild` to determine the build status (such as `SUCCESS` or `FAILURE`).
    #
    # + projectId - Required. ID of the project.
    # + payload - Build to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + parent - The parent resource where this build will be created. Format: `projects/{project}/locations/{location}`
    # + return - Successful response
    remote isolated function createBuild(string projectId, Build payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? parent = ()) returns Operation|error {
        string  path = string `/v1/projects/${projectId}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Returns information about a previously requested build. The `Build` that is returned includes its status (such as `SUCCESS`, `FAILURE`, or `WORKING`), and timing information.
    #
    # + projectId - Required. ID of the project.
    # + id - Required. ID of the build.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + name - The name of the `Build` to retrieve. Format: `projects/{project}/locations/{location}/builds/{build}`
    # + return - Successful response
    remote isolated function getBuild(string projectId, string id, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns Build|error {
        string  path = string `/v1/projects/${projectId}/builds/${id}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        Build response = check self.clientEp-> get(path, targetType = Build);
        return response;
    }
    # Cancels a build in progress.
    #
    # + projectId - Required. ID of the project.
    # + id - Required. ID of the build.
    # + payload - Build to be cancelled
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function cancelBuild(string projectId, string id, CancelBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Build|error {
        string  path = string `/v1/projects/${projectId}/builds/${id}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Build response = check self.clientEp->post(path, request, targetType=Build);
        return response;
    }
    # Creates a new build based on the specified build. This method creates a new build using the original build request, which may or may not result in an identical build. For triggered builds: * Triggered builds resolve to a precise revision; therefore a retry of a triggered build will result in a build that uses the same revision. For non-triggered builds that specify `RepoSource`: * If the original build built from the tip of a branch, the retried build will build from the tip of that branch, which may not be the same revision as the original build. * If the original build specified a commit sha or revision ID, the retried build will use the identical source. For builds that specify `StorageSource`: * If the original build pulled source from Google Cloud Storage without specifying the generation of the object, the new build will use the current object, which may be different from the original build source. * If the original build pulled source from Cloud Storage and specified the generation of the object, the new build will attempt to use the same object, which may or may not be available depending on the bucket's lifecycle management settings.
    #
    # + projectId - Required. ID of the project.
    # + id - Required. Build ID of the original build.
    # + payload - Build to be retried
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function retryBuild(string projectId, string id, RetryBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/projects/${projectId}/builds/${id}:retry`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Lists existing `BuildTrigger`s. This API is experimental.
    #
    # + projectId - Required. ID of the project for which to list BuildTriggers.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - Number of results to return in the list.
    # + pageToken - Token to provide to skip to a particular spot in the list.
    # + parent - The parent of the collection of `Triggers`. Format: `projects/{project}/locations/{location}`
    # + return - Successful response
    remote isolated function listTriggers(string projectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? parent = ()) returns ListBuildTriggersResponse|error {
        string  path = string `/v1/projects/${projectId}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        ListBuildTriggersResponse response = check self.clientEp-> get(path, targetType = ListBuildTriggersResponse);
        return response;
    }
    # Creates a new `BuildTrigger`. This API is experimental.
    #
    # + projectId - Required. ID of the project for which to configure automatic builds.
    # + payload - Trigger to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + parent - The parent resource where this trigger will be created. Format: `projects/{project}/locations/{location}`
    # + return - Successful response
    remote isolated function createTrigger(string projectId, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? parent = ()) returns BuildTrigger|error {
        string  path = string `/v1/projects/${projectId}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BuildTrigger response = check self.clientEp->post(path, request, targetType=BuildTrigger);
        return response;
    }
    # Returns information about a `BuildTrigger`. This API is experimental.
    #
    # + projectId - Required. ID of the project that owns the trigger.
    # + triggerId - Required. Identifier (`id` or `name`) of the `BuildTrigger` to get.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + name - The name of the `Trigger` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + return - Successful response
    remote isolated function getTrigger(string projectId, string triggerId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns BuildTrigger|error {
        string  path = string `/v1/projects/${projectId}/triggers/${triggerId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        BuildTrigger response = check self.clientEp-> get(path, targetType = BuildTrigger);
        return response;
    }
    # Deletes a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + projectId - Required. ID of the project that owns the trigger.
    # + triggerId - Required. ID of the `BuildTrigger` to delete.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + name - The name of the `Trigger` to delete. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + return - Successful response
    remote isolated function deleteTrigger(string projectId, string triggerId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns http:Response|error {
        string  path = string `/v1/projects/${projectId}/triggers/${triggerId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Updates a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + projectId - Required. ID of the project that owns the trigger.
    # + triggerId - Required. ID of the `BuildTrigger` to update.
    # + payload - Trigger to be updated
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updateTrigger(string projectId, string triggerId, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BuildTrigger|error {
        string  path = string `/v1/projects/${projectId}/triggers/${triggerId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BuildTrigger response = check self.clientEp->patch(path, request, targetType=BuildTrigger);
        return response;
    }
    # Runs a `BuildTrigger` at a particular source revision.
    #
    # + projectId - Required. ID of the project.
    # + triggerId - Required. ID of the trigger.
    # + payload - Trigger to be ran
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + name - The name of the `Trigger` to run. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + return - Successful response
    remote isolated function runTrigger(string projectId, string triggerId, RepoSource payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns Operation|error {
        string  path = string `/v1/projects/${projectId}/triggers/${triggerId}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # ReceiveTriggerWebhook [Experimental] is called when the API receives a webhook request targeted at a specific trigger.
    #
    # + projectId - Project in which the specified trigger lives
    # + trigger - Name of the trigger to run the payload against
    # + payload - Webhook to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + name - The name of the `ReceiveTriggerWebhook` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + secret - Secret token used for authorization if an OAuth token isn't provided.
    # + return - Successful response
    remote isolated function receiveWebhookTrigger(string projectId, string trigger, HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = (), string? secret = ()) returns http:Response|error {
        string  path = string `/v1/projects/${projectId}/triggers/${trigger}:webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name, "secret": secret};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # ReceiveWebhook is called when the API receives a GitHub webhook.
    #
    # + payload - Webhook to be received
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + webhookKey - For GitHub Enterprise webhooks, this key is used to associate the webhook request with the GitHubEnterpriseConfig to use for validation.
    # + return - Successful response
    remote isolated function receiveWebhook(HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? webhookKey = ()) returns http:Response|error {
        string  path = string `/v1/webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "webhookKey": webhookKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Returns details of a `WorkerPool`.
    #
    # + name - Required. The name of the `WorkerPool` to retrieve. Format: `projects/{project}/locations/{location}/workerPools/{workerPool}`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - Required. ID of the project that owns the trigger.
    # + triggerId - Required. Identifier (`id` or `name`) of the `BuildTrigger` to get.
    # + return - Successful response
    remote isolated function getWorkerPool(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? triggerId = ()) returns WorkerPool|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "triggerId": triggerId};
        path = path + check getPathForQueryParam(queryParam);
        WorkerPool response = check self.clientEp-> get(path, targetType = WorkerPool);
        return response;
    }
    # Deletes a `WorkerPool`.
    #
    # + name - Required. The name of the `WorkerPool` to delete. Format: `projects/{project}/locations/{workerPool}/workerPools/{workerPool}`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + allowMissing - If set to true, and the `WorkerPool` is not found, the request will succeed but no action will be taken on the server.
    # + etag - Optional. If this is provided, it must match the server's etag on the workerpool for the request to be processed.
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it.
    # + return - Successful response
    remote isolated function deleteWorkerPool(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? allowMissing = (), string? etag = (), boolean? validateOnly = ()) returns Operation|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "allowMissing": allowMissing, "etag": etag, "validateOnly": validateOnly};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Operation response = check self.clientEp-> delete(path, request, targetType = Operation);
        return response;
    }
    # Updates a `WorkerPool`.
    #
    # + name - Output only. The resource name of the `WorkerPool`, with format `projects/{project}/locations/{location}/workerPools/{worker_pool}`. The value of `{worker_pool}` is provided by `worker_pool_id` in `CreateWorkerPool` request and the value of `{location}` is determined by the endpoint accessed.
    # + payload - WorkerPool to be updated
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + updateMask - A mask specifying which fields in `worker_pool` to update.
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it.
    # + return - Successful response
    remote isolated function updateWorkerPool(string name, WorkerPool payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? updateMask = (), boolean? validateOnly = ()) returns Operation|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "updateMask": updateMask, "validateOnly": validateOnly};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->patch(path, request, targetType=Operation);
        return response;
    }
    # Approves or rejects a pending build. If approved, the returned LRO will be analogous to the LRO returned from a CreateBuild call. If rejected, the returned LRO will be immediately done.
    #
    # + name - Required. Name of the target build. For example: "projects/{$project_id}/builds/{$build_id}"
    # + payload - WorkerPool to be approved
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function approveBuild(string name, ApproveBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/${name}:approve`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    #
    # + name - The name of the operation resource to be cancelled.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function cancelOperation(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/${name}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Creates a new build based on the specified build. This method creates a new build using the original build request, which may or may not result in an identical build. For triggered builds: * Triggered builds resolve to a precise revision; therefore a retry of a triggered build will result in a build that uses the same revision. For non-triggered builds that specify `RepoSource`: * If the original build built from the tip of a branch, the retried build will build from the tip of that branch, which may not be the same revision as the original build. * If the original build specified a commit sha or revision ID, the retried build will use the identical source. For builds that specify `StorageSource`: * If the original build pulled source from Google Cloud Storage without specifying the generation of the object, the new build will use the current object, which may be different from the original build source. * If the original build pulled source from Cloud Storage and specified the generation of the object, the new build will attempt to use the same object, which may or may not be available depending on the bucket's lifecycle management settings.
    #
    # + name - The name of the `Build` to retry. Format: `projects/{project}/locations/{location}/builds/{build}`
    # + payload - Build to be retried
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function retryBuildByName(string name, RetryBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/${name}:retry`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Runs a `BuildTrigger` at a particular source revision.
    #
    # + name - The name of the `Trigger` to run. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + payload - Trigger to be run
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function runTriggerByName(string name, RunBuildTriggerRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/${name}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # ReceiveTriggerWebhook [Experimental] is called when the API receives a webhook request targeted at a specific trigger.
    #
    # + name - The name of the `ReceiveTriggerWebhook` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}`
    # + payload - Webhook trigger to be received
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - Project in which the specified trigger lives
    # + secret - Secret token used for authorization if an OAuth token isn't provided.
    # + trigger - Name of the trigger to run the payload against
    # + return - Successful response
    remote isolated function receiveWebhookTriggerByName(string name, HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? secret = (), string? trigger = ()) returns http:Response|error {
        string  path = string `/v1/${name}:webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "secret": secret, "trigger": trigger};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Lists previously requested builds. Previously requested builds may still be in-progress, or may have finished successfully or unsuccessfully.
    #
    # + parent - The parent of the collection of `Builds`. Format: `projects/{project}/locations/location`
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - The raw filter text to constrain the results.
    # + pageSize - Number of results to return in the list.
    # + pageToken - The page token for the next page of Builds. If unspecified, the first page of results is returned. If the token is rejected for any reason, INVALID_ARGUMENT will be thrown. In this case, the token should be discarded, and pagination should be restarted from the first page of results. See https://google.aip.dev/158 for more.
    # + projectId - Required. ID of the project.
    # + return - Successful response
    remote isolated function listBuildsByPath(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = (), string? projectId = ()) returns ListBuildsResponse|error {
        string  path = string `/v1/${parent}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        ListBuildsResponse response = check self.clientEp-> get(path, targetType = ListBuildsResponse);
        return response;
    }
    # Starts a build with the specified configuration. This method returns a long-running `Operation`, which includes the build ID. Pass the build ID to `GetBuild` to determine the build status (such as `SUCCESS` or `FAILURE`).
    #
    # + parent - The parent resource where this build will be created. Format: `projects/{project}/locations/{location}`
    # + payload - Build to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - Required. ID of the project.
    # + return - Successful response
    remote isolated function createBuildByPath(string parent, Build payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns Operation|error {
        string  path = string `/v1/${parent}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # List all GitHubEnterpriseConfigs for a given project. This API is experimental.
    #
    # + parent - Name of the parent project. For example: projects/{$project_number} or projects/{$project_id}
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - ID of the project
    # + return - Successful response
    remote isolated function listGithubEnterpriseConfigs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns ListGithubEnterpriseConfigsResponse|error {
        string  path = string `/v1/${parent}/githubEnterpriseConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        ListGithubEnterpriseConfigsResponse response = check self.clientEp-> get(path, targetType = ListGithubEnterpriseConfigsResponse);
        return response;
    }
    # Create an association between a GCP project and a GitHub Enterprise server. This API is experimental.
    #
    # + parent - Name of the parent project. For example: projects/{$project_number} or projects/{$project_id}
    # + payload - Github Enterprise Config to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - ID of the project.
    # + return - Successful response
    remote isolated function createGithubEnterpriseConfig(string parent, GitHubEnterpriseConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns Operation|error {
        string  path = string `/v1/${parent}/githubEnterpriseConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Lists existing `BuildTrigger`s. This API is experimental.
    #
    # + parent - The parent of the collection of `Triggers`. Format: `projects/{project}/locations/{location}`
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - Number of results to return in the list.
    # + pageToken - Token to provide to skip to a particular spot in the list.
    # + projectId - Required. ID of the project for which to list BuildTriggers.
    # + return - Successful response
    remote isolated function listTriggersByPath(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? projectId = ()) returns ListBuildTriggersResponse|error {
        string  path = string `/v1/${parent}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        ListBuildTriggersResponse response = check self.clientEp-> get(path, targetType = ListBuildTriggersResponse);
        return response;
    }
    # Creates a new `BuildTrigger`. This API is experimental.
    #
    # + parent - The parent resource where this trigger will be created. Format: `projects/{project}/locations/{location}`
    # + payload - Trigger to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - Required. ID of the project for which to configure automatic builds.
    # + return - Successful response
    remote isolated function createTriggerByPath(string parent, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns BuildTrigger|error {
        string  path = string `/v1/${parent}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BuildTrigger response = check self.clientEp->post(path, request, targetType=BuildTrigger);
        return response;
    }
    # Lists `WorkerPool`s.
    #
    # + parent - Required. The parent of the collection of `WorkerPools`. Format: `projects/{project}/locations/{location}`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of `WorkerPool`s to return. The service may return fewer than this value. If omitted, the server will use a sensible default.
    # + pageToken - A page token, received from a previous `ListWorkerPools` call. Provide this to retrieve the subsequent page.
    # + return - Successful response
    remote isolated function listWorkerPools(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListWorkerPoolsResponse|error {
        string  path = string `/v1/${parent}/workerPools`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListWorkerPoolsResponse response = check self.clientEp-> get(path, targetType = ListWorkerPoolsResponse);
        return response;
    }
    # Creates a `WorkerPool`.
    #
    # + parent - Required. The parent resource where this worker pool will be created. Format: `projects/{project}/locations/{location}`.
    # + payload - WorkerPool to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it.
    # + workerPoolId - Required. Immutable. The ID to use for the `WorkerPool`, which will become the final component of the resource name. This value should be 1-63 characters, and valid characters are /a-z-/.
    # + return - Successful response
    remote isolated function createWorkerPool(string parent, WorkerPool payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? validateOnly = (), string? workerPoolId = ()) returns Operation|error {
        string  path = string `/v1/${parent}/workerPools`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "validateOnly": validateOnly, "workerPoolId": workerPoolId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Updates a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + resourceName - The `Trigger` name with format: `projects/{project}/locations/{location}/triggers/{trigger}`, where {trigger} is a unique identifier generated by the service.
    # + payload - Trigger to be updated
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + projectId - Required. ID of the project that owns the trigger.
    # + triggerId - Required. ID of the `BuildTrigger` to update.
    # + return - Successful response
    remote isolated function updateTriggerByName(string resourceName, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? triggerId = ()) returns BuildTrigger|error {
        string  path = string `/v1/${resourceName}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "triggerId": triggerId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BuildTrigger response = check self.clientEp->patch(path, request, targetType=BuildTrigger);
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
