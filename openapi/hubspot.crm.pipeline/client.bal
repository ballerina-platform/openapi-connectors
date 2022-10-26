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

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# 
# Pipelines represent distinct stages in a workflow, like closing a deal or servicing a support ticket. These endpoints provide access to read and modify pipelines in HubSpot. Pipelines support `deals` and `tickets` object types.
# 
# When calling endpoints that take pipelineId as a parameter, that ID must correspond to an existing, un-archived pipeline. Otherwise the request will fail with a `404 Not Found` response.
@display {label: "HubSpot CRM Pipeline", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com") returns error? {
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
    # Retrieve all pipelines
    #
    # + objectType - CRM object type 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getAll(string objectType, boolean archived = false) returns CollectionResponsePipeline|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponsePipeline response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a pipeline
    #
    # + objectType - CRM object type 
    # + payload - Pipeline input 
    # + return - successful operation 
    remote isolated function create(string objectType, PipelineInput payload) returns Pipeline|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Pipeline response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Return a pipeline by ID
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getById(string objectType, string pipelineId, boolean archived = false) returns Pipeline|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Pipeline response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace a pipeline
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + payload - Pipeline input 
    # + return - successful operation 
    remote isolated function replace(string objectType, string pipelineId, PipelineInput payload) returns Pipeline|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Pipeline response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Archive a pipeline
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + return - No content 
    remote isolated function archive(string objectType, string pipelineId) returns http:Response|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a pipeline
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + archived - Whether to return only results that have been archived. 
    # + payload - Attributes to update in pipeline 
    # + return - successful operation 
    remote isolated function update(string objectType, string pipelineId, PipelinePatchInput payload, boolean archived = false) returns Pipeline|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Pipeline response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Return all stages of a pipeline
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function stageGetall(string objectType, string pipelineId, boolean archived = false) returns CollectionResponsePipelineStage|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponsePipelineStage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a pipeline stage
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + payload - Pipeline stage input 
    # + return - successful operation 
    remote isolated function stageCreate(string objectType, string pipelineId, PipelineStageInput payload) returns PipelineStage|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PipelineStage response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Return a pipeline stage by ID
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + stageId - Stage ID 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function stageGetbyid(string objectType, string pipelineId, string stageId, boolean archived = false) returns PipelineStage|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages/${getEncodedUri(stageId)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PipelineStage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace a pipeline stage
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + stageId - Stage ID 
    # + payload - Pipeline stage input 
    # + return - successful operation 
    remote isolated function stageReplace(string objectType, string pipelineId, string stageId, PipelineStageInput payload) returns PipelineStage|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages/${getEncodedUri(stageId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PipelineStage response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Archive a pipeline stage
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + stageId - Stage ID 
    # + return - No content 
    remote isolated function stageArchive(string objectType, string pipelineId, string stageId) returns http:Response|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages/${getEncodedUri(stageId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a pipeline stage
    #
    # + objectType - CRM object type 
    # + pipelineId - Pipeline ID 
    # + stageId - Stage ID 
    # + archived - Whether to return only results that have been archived. 
    # + payload - Pipeline stage patch input 
    # + return - successful operation 
    remote isolated function stageUpdate(string objectType, string pipelineId, string stageId, PipelineStagePatchInput payload, boolean archived = false) returns PipelineStage|error {
        string resourcePath = string `/crm/v3/pipelines/${getEncodedUri(objectType)}/${getEncodedUri(pipelineId)}/stages/${getEncodedUri(stageId)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PipelineStage response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
