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

# Configuration for HubSpot CRM connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};
# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to pipelines. 
# Pipelines represent distinct stages in a workflow, like closing a deal or servicing a support ticket. These endpoints provide access to read and modify pipelines in HubSpot. 
# They support `deals` and `tickets` object types.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Retrieve all pipelines
    #
    # + objectType - CRM object type
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getAll(string objectType, boolean archived = false) returns CollectionResponsePipeline|error {
        string  path = string `/crm/v3/pipelines/${objectType}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponsePipeline response = check self.clientEp-> get(path, targetType = CollectionResponsePipeline);
        return response;
    }
    # Create a pipeline
    #
    # + objectType - CRM object type
    # + payload - Pipeline properties
    # + return - successful operation
    remote isolated function create(string objectType, PipelineInput payload) returns Pipeline|error {
        string  path = string `/crm/v3/pipelines/${objectType}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Pipeline response = check self.clientEp->post(path, request, targetType=Pipeline);
        return response;
    }
    # Return a pipeline by ID
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getById(string objectType, string pipelineId, boolean archived = false) returns Pipeline|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        Pipeline response = check self.clientEp-> get(path, targetType = Pipeline);
        return response;
    }
    # Replace a pipeline
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + payload - Pipeline properties
    # + return - successful operation
    remote isolated function replace(string objectType, string pipelineId, PipelineInput payload) returns Pipeline|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Pipeline response = check self.clientEp->put(path, request, targetType=Pipeline);
        return response;
    }
    # Archive a pipeline
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + return - No content
    remote isolated function archive(string objectType, string pipelineId) returns http:Response|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a pipeline
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + payload - Pipeline properties
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function update(string objectType, string pipelineId, PipelinePatchInput payload, boolean archived = false) returns Pipeline|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Pipeline response = check self.clientEp->patch(path, request, targetType=Pipeline);
        return response;
    }
    # Return all stages of a pipeline
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function stageGetall(string objectType, string pipelineId, boolean archived = false) returns CollectionResponsePipelineStage|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponsePipelineStage response = check self.clientEp-> get(path, targetType = CollectionResponsePipelineStage);
        return response;
    }
    # Create a pipeline stage
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + payload - Pipeline stage properties
    # + return - successful operation
    remote isolated function stageCreate(string objectType, string pipelineId, PipelineStageInput payload) returns PipelineStage|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PipelineStage response = check self.clientEp->post(path, request, targetType=PipelineStage);
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
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages/${stageId}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        PipelineStage response = check self.clientEp-> get(path, targetType = PipelineStage);
        return response;
    }
    # Replace a pipeline stage
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + stageId - Stage ID
    # + payload - Pipeline stage properties    
    # + return - successful operation
    remote isolated function stageReplace(string objectType, string pipelineId, string stageId, PipelineStageInput payload) returns PipelineStage|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages/${stageId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PipelineStage response = check self.clientEp->put(path, request, targetType=PipelineStage);
        return response;
    }
    # Archive a pipeline stage
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + stageId - Stage ID
    # + return - No content
    remote isolated function stageArchive(string objectType, string pipelineId, string stageId) returns http:Response|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages/${stageId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a pipeline stage
    #
    # + objectType - CRM object type
    # + pipelineId - Pipeline ID
    # + stageId - Stage ID
    # + payload - Pipeline stage properties
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function stageUpdate(string objectType, string pipelineId, string stageId, PipelineStagePatchInput payload, boolean archived = false) returns PipelineStage|error {
        string  path = string `/crm/v3/pipelines/${objectType}/${pipelineId}/stages/${stageId}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PipelineStage response = check self.clientEp->patch(path, request, targetType=PipelineStage);
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
