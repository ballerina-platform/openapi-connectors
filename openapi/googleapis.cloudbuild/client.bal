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

# This is a generated connector for [Google Cloud Build REST API v1](https://cloud.google.com/build/docs/api/reference/rest) OpenAPI specification.
# The Google Cloud Build API provides the capability to manage builds on Google Cloud Platform.
@display {label: "Google Cloud Build", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://cloudbuild.googleapis.com/") returns error? {
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
    # Lists previously requested builds. Previously requested builds may still be in-progress, or may have finished successfully or unsuccessfully.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + filter - The raw filter text to constrain the results. 
    # + pageSize - Number of results to return in the list. 
    # + pageToken - The page token for the next page of Builds. If unspecified, the first page of results is returned. If the token is rejected for any reason, INVALID_ARGUMENT will be thrown. In this case, the token should be discarded, and pagination should be restarted from the first page of results. See https://google.aip.dev/158 for more. 
    # + parent - The parent of the collection of `Builds`. Format: `projects/{project}/locations/location` 
    # + return - Successful response 
    remote isolated function listBuilds(string projectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = (), string? parent = ()) returns ListBuildsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken, "parent": parent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Starts a build with the specified configuration. This method returns a long-running `Operation`, which includes the build ID. Pass the build ID to `GetBuild` to determine the build status (such as `SUCCESS` or `FAILURE`).
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + parent - The parent resource where this build will be created. Format: `projects/{project}/locations/{location}` 
    # + payload - Build to be created 
    # + return - Successful response 
    remote isolated function createBuild(string projectId, Build payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? parent = ()) returns Operation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "parent": parent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information about a previously requested build. The `Build` that is returned includes its status (such as `SUCCESS`, `FAILURE`, or `WORKING`), and timing information.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + id - Required. ID of the build. 
    # + name - The name of the `Build` to retrieve. Format: `projects/{project}/locations/{location}/builds/{build}` 
    # + return - Successful response 
    remote isolated function getBuild(string projectId, string id, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns Build|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/builds/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Build response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancels a build in progress.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + id - Required. ID of the build. 
    # + payload - Build to be cancelled 
    # + return - Successful response 
    remote isolated function cancelBuild(string projectId, string id, CancelBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Build|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/builds/${getEncodedUri(id)}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Build response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a new build based on the specified build. This method creates a new build using the original build request, which may or may not result in an identical build. For triggered builds: * Triggered builds resolve to a precise revision; therefore a retry of a triggered build will result in a build that uses the same revision. For non-triggered builds that specify `RepoSource`: * If the original build built from the tip of a branch, the retried build will build from the tip of that branch, which may not be the same revision as the original build. * If the original build specified a commit sha or revision ID, the retried build will use the identical source. For builds that specify `StorageSource`: * If the original build pulled source from Google Cloud Storage without specifying the generation of the object, the new build will use the current object, which may be different from the original build source. * If the original build pulled source from Cloud Storage and specified the generation of the object, the new build will attempt to use the same object, which may or may not be available depending on the bucket's lifecycle management settings.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + id - Required. Build ID of the original build. 
    # + payload - Build to be retried 
    # + return - Successful response 
    remote isolated function retryBuild(string projectId, string id, RetryBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/builds/${getEncodedUri(id)}:retry`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists existing `BuildTrigger`s. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project for which to list BuildTriggers. 
    # + pageSize - Number of results to return in the list. 
    # + pageToken - Token to provide to skip to a particular spot in the list. 
    # + parent - The parent of the collection of `Triggers`. Format: `projects/{project}/locations/{location}` 
    # + return - Successful response 
    remote isolated function listTriggers(string projectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? parent = ()) returns ListBuildTriggersResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "parent": parent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBuildTriggersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new `BuildTrigger`. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project for which to configure automatic builds. 
    # + parent - The parent resource where this trigger will be created. Format: `projects/{project}/locations/{location}` 
    # + payload - Trigger to be created 
    # + return - Successful response 
    remote isolated function createTrigger(string projectId, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? parent = ()) returns BuildTrigger|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "parent": parent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildTrigger response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information about a `BuildTrigger`. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project that owns the trigger. 
    # + triggerId - Required. Identifier (`id` or `name`) of the `BuildTrigger` to get. 
    # + name - The name of the `Trigger` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + return - Successful response 
    remote isolated function getTrigger(string projectId, string triggerId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns BuildTrigger|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers/${getEncodedUri(triggerId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BuildTrigger response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project that owns the trigger. 
    # + triggerId - Required. ID of the `BuildTrigger` to delete. 
    # + name - The name of the `Trigger` to delete. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + return - Successful response 
    remote isolated function deleteTrigger(string projectId, string triggerId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns http:Response|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers/${getEncodedUri(triggerId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project that owns the trigger. 
    # + triggerId - Required. ID of the `BuildTrigger` to update. 
    # + payload - Trigger to be updated 
    # + return - Successful response 
    remote isolated function updateTrigger(string projectId, string triggerId, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BuildTrigger|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers/${getEncodedUri(triggerId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildTrigger response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Runs a `BuildTrigger` at a particular source revision.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Required. ID of the project. 
    # + triggerId - Required. ID of the trigger. 
    # + name - The name of the `Trigger` to run. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + payload - Trigger to be ran 
    # + return - Successful response 
    remote isolated function runTrigger(string projectId, string triggerId, RepoSource payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = ()) returns Operation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers/${getEncodedUri(triggerId)}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ReceiveTriggerWebhook [Experimental] is called when the API receives a webhook request targeted at a specific trigger.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + projectId - Project in which the specified trigger lives 
    # + trigger - Name of the trigger to run the payload against 
    # + name - The name of the `ReceiveTriggerWebhook` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + secret - Secret token used for authorization if an OAuth token isn't provided. 
    # + payload - Webhook to be created 
    # + return - Successful response 
    remote isolated function receiveWebhookTrigger(string projectId, string trigger, HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? name = (), string? secret = ()) returns http:Response|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/triggers/${getEncodedUri(trigger)}:webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "name": name, "secret": secret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ReceiveWebhook is called when the API receives a GitHub webhook.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + webhookKey - For GitHub Enterprise webhooks, this key is used to associate the webhook request with the GitHubEnterpriseConfig to use for validation. 
    # + payload - Webhook to be received 
    # + return - Successful response 
    remote isolated function receiveWebhook(HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? webhookKey = ()) returns http:Response|error {
        string resourcePath = string `/v1/webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "webhookKey": webhookKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns details of a `WorkerPool`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The name of the `WorkerPool` to retrieve. Format: `projects/{project}/locations/{location}/workerPools/{workerPool}`. 
    # + projectId - Required. ID of the project that owns the trigger. 
    # + triggerId - Required. Identifier (`id` or `name`) of the `BuildTrigger` to get. 
    # + return - Successful response 
    remote isolated function getWorkerPool(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? triggerId = ()) returns WorkerPool|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "triggerId": triggerId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkerPool response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a `WorkerPool`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The name of the `WorkerPool` to delete. Format: `projects/{project}/locations/{workerPool}/workerPools/{workerPool}`. 
    # + allowMissing - If set to true, and the `WorkerPool` is not found, the request will succeed but no action will be taken on the server. 
    # + etag - Optional. If this is provided, it must match the server's etag on the workerpool for the request to be processed. 
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it. 
    # + return - Successful response 
    remote isolated function deleteWorkerPool(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? allowMissing = (), string? etag = (), boolean? validateOnly = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "allowMissing": allowMissing, "etag": etag, "validateOnly": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Operation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates a `WorkerPool`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Output only. The resource name of the `WorkerPool`, with format `projects/{project}/locations/{location}/workerPools/{worker_pool}`. The value of `{worker_pool}` is provided by `worker_pool_id` in `CreateWorkerPool` request and the value of `{location}` is determined by the endpoint accessed. 
    # + updateMask - A mask specifying which fields in `worker_pool` to update. 
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it. 
    # + payload - WorkerPool to be updated 
    # + return - Successful response 
    remote isolated function updateWorkerPool(string name, WorkerPool payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? updateMask = (), boolean? validateOnly = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "updateMask": updateMask, "validateOnly": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Approves or rejects a pending build. If approved, the returned LRO will be analogous to the LRO returned from a CreateBuild call. If rejected, the returned LRO will be immediately done.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. Name of the target build. For example: "projects/{$project_id}/builds/{$build_id}" 
    # + payload - WorkerPool to be approved 
    # + return - Successful response 
    remote isolated function approveBuild(string name, ApproveBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:approve`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the operation resource to be cancelled. 
    # + return - Successful response 
    remote isolated function cancelOperation(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Creates a new build based on the specified build. This method creates a new build using the original build request, which may or may not result in an identical build. For triggered builds: * Triggered builds resolve to a precise revision; therefore a retry of a triggered build will result in a build that uses the same revision. For non-triggered builds that specify `RepoSource`: * If the original build built from the tip of a branch, the retried build will build from the tip of that branch, which may not be the same revision as the original build. * If the original build specified a commit sha or revision ID, the retried build will use the identical source. For builds that specify `StorageSource`: * If the original build pulled source from Google Cloud Storage without specifying the generation of the object, the new build will use the current object, which may be different from the original build source. * If the original build pulled source from Cloud Storage and specified the generation of the object, the new build will attempt to use the same object, which may or may not be available depending on the bucket's lifecycle management settings.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the `Build` to retry. Format: `projects/{project}/locations/{location}/builds/{build}` 
    # + payload - Build to be retried 
    # + return - Successful response 
    remote isolated function retryBuildByName(string name, RetryBuildRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:retry`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Runs a `BuildTrigger` at a particular source revision.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the `Trigger` to run. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + payload - Trigger to be run 
    # + return - Successful response 
    remote isolated function runTriggerByName(string name, RunBuildTriggerRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ReceiveTriggerWebhook [Experimental] is called when the API receives a webhook request targeted at a specific trigger.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the `ReceiveTriggerWebhook` to retrieve. Format: `projects/{project}/locations/{location}/triggers/{trigger}` 
    # + projectId - Project in which the specified trigger lives 
    # + secret - Secret token used for authorization if an OAuth token isn't provided. 
    # + trigger - Name of the trigger to run the payload against 
    # + payload - Webhook trigger to be received 
    # + return - Successful response 
    remote isolated function receiveWebhookTriggerByName(string name, HttpBody payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? secret = (), string? trigger = ()) returns http:Response|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:webhook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "secret": secret, "trigger": trigger};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists previously requested builds. Previously requested builds may still be in-progress, or may have finished successfully or unsuccessfully.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The parent of the collection of `Builds`. Format: `projects/{project}/locations/location` 
    # + filter - The raw filter text to constrain the results. 
    # + pageSize - Number of results to return in the list. 
    # + pageToken - The page token for the next page of Builds. If unspecified, the first page of results is returned. If the token is rejected for any reason, INVALID_ARGUMENT will be thrown. In this case, the token should be discarded, and pagination should be restarted from the first page of results. See https://google.aip.dev/158 for more. 
    # + projectId - Required. ID of the project. 
    # + return - Successful response 
    remote isolated function listBuildsByPath(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = (), string? projectId = ()) returns ListBuildsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Starts a build with the specified configuration. This method returns a long-running `Operation`, which includes the build ID. Pass the build ID to `GetBuild` to determine the build status (such as `SUCCESS` or `FAILURE`).
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The parent resource where this build will be created. Format: `projects/{project}/locations/{location}` 
    # + projectId - Required. ID of the project. 
    # + payload - Build to be created 
    # + return - Successful response 
    remote isolated function createBuildByPath(string parent, Build payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/builds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List all GitHubEnterpriseConfigs for a given project. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Name of the parent project. For example: projects/{$project_number} or projects/{$project_id} 
    # + projectId - ID of the project 
    # + return - Successful response 
    remote isolated function listGithubEnterpriseConfigs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns ListGithubEnterpriseConfigsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/githubEnterpriseConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListGithubEnterpriseConfigsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an association between a GCP project and a GitHub Enterprise server. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Name of the parent project. For example: projects/{$project_number} or projects/{$project_id} 
    # + projectId - ID of the project. 
    # + payload - Github Enterprise Config to be created 
    # + return - Successful response 
    remote isolated function createGithubEnterpriseConfig(string parent, GitHubEnterpriseConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/githubEnterpriseConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists existing `BuildTrigger`s. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The parent of the collection of `Triggers`. Format: `projects/{project}/locations/{location}` 
    # + pageSize - Number of results to return in the list. 
    # + pageToken - Token to provide to skip to a particular spot in the list. 
    # + projectId - Required. ID of the project for which to list BuildTriggers. 
    # + return - Successful response 
    remote isolated function listTriggersByPath(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? projectId = ()) returns ListBuildTriggersResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBuildTriggersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new `BuildTrigger`. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The parent resource where this trigger will be created. Format: `projects/{project}/locations/{location}` 
    # + projectId - Required. ID of the project for which to configure automatic builds. 
    # + payload - Trigger to be created 
    # + return - Successful response 
    remote isolated function createTriggerByPath(string parent, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = ()) returns BuildTrigger|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/triggers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildTrigger response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists `WorkerPool`s.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent of the collection of `WorkerPools`. Format: `projects/{project}/locations/{location}`. 
    # + pageSize - The maximum number of `WorkerPool`s to return. The service may return fewer than this value. If omitted, the server will use a sensible default. 
    # + pageToken - A page token, received from a previous `ListWorkerPools` call. Provide this to retrieve the subsequent page. 
    # + return - Successful response 
    remote isolated function listWorkerPools(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListWorkerPoolsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/workerPools`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListWorkerPoolsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a `WorkerPool`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent resource where this worker pool will be created. Format: `projects/{project}/locations/{location}`. 
    # + validateOnly - If set, validate the request and preview the response, but do not actually post it. 
    # + workerPoolId - Required. Immutable. The ID to use for the `WorkerPool`, which will become the final component of the resource name. This value should be 1-63 characters, and valid characters are /a-z-/. 
    # + payload - WorkerPool to be created 
    # + return - Successful response 
    remote isolated function createWorkerPool(string parent, WorkerPool payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? validateOnly = (), string? workerPoolId = ()) returns Operation|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/workerPools`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "validateOnly": validateOnly, "workerPoolId": workerPoolId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates a `BuildTrigger` by its project ID and trigger ID. This API is experimental.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + resourceName - The `Trigger` name with format: `projects/{project}/locations/{location}/triggers/{trigger}`, where {trigger} is a unique identifier generated by the service. 
    # + projectId - Required. ID of the project that owns the trigger. 
    # + triggerId - Required. ID of the `BuildTrigger` to update. 
    # + payload - Trigger to be updated 
    # + return - Successful response 
    remote isolated function updateTriggerByName(string resourceName, BuildTrigger payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? projectId = (), string? triggerId = ()) returns BuildTrigger|error {
        string resourcePath = string `/v1/${getEncodedUri(resourceName)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "projectId": projectId, "triggerId": triggerId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildTrigger response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
