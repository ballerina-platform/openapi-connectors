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

# This is a generated connector for [Shortcut API v3.0](https://shortcut.com/api/rest/v3) OpenAPI specification.
# The Shortcut API bring the flow to your software team's workflow. Plan, collaborate, build, and measure success with Shortcut.
# The Shortcut API provides a greater amount of control over your organization’s Shortcut data than what is possible using the Shortcut web app. 
# You can use this API to build custom integrations or automate even more of your organization’s workflow.
@display {label: "Shortcut", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shortcut account](https://shortcut.com) and obtain tokens by following [this guide](https://shortcut.com/api/rest/v3#Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.app.shortcut.com/") returns error? {
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # List Categories
    #
    # + return - Resource 
    remote isolated function listCategories() returns Category[]|error {
        string resourcePath = string `/api/v3/categories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Category[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Category
    #
    # + payload - Create category data 
    # + return - Resource 
    remote isolated function createCategory(CreateCategory payload) returns Category|error {
        string resourcePath = string `/api/v3/categories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Category
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - Resource 
    remote isolated function getCategory(int categoryPublicId) returns Category|error {
        string resourcePath = string `/api/v3/categories/${getEncodedUri(categoryPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Category response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Category
    #
    # + categoryPublicId - The unique ID of the Category you wish to update. 
    # + payload - Update category data 
    # + return - Resource 
    remote isolated function updateCategory(int categoryPublicId, UpdateCategory payload) returns Category|error {
        string resourcePath = string `/api/v3/categories/${getEncodedUri(categoryPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Category
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - No Content 
    remote isolated function deleteCategory(int categoryPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/categories/${getEncodedUri(categoryPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Category Milestones
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - Resource 
    remote isolated function listCategoryMilestones(int categoryPublicId) returns Milestone[]|error {
        string resourcePath = string `/api/v3/categories/${getEncodedUri(categoryPublicId)}/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Milestone[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Entity Templates
    #
    # + return - Resource 
    remote isolated function listEntityTemplates() returns EntityTemplate[]|error {
        string resourcePath = string `/api/v3/entity-templates`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EntityTemplate[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Entity Template
    #
    # + payload - Request paramaters for creating an entirely new entity template. 
    # + return - Resource 
    remote isolated function createEntityTemplate(CreateEntityTemplate payload) returns EntityTemplate|error {
        string resourcePath = string `/api/v3/entity-templates`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntityTemplate response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable Story Templates
    #
    # + return - No Content 
    remote isolated function disableStoryTemplates() returns http:Response|error {
        string resourcePath = string `/api/v3/entity-templates/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Enable Story Templates
    #
    # + return - No Content 
    remote isolated function enableStoryTemplates() returns http:Response|error {
        string resourcePath = string `/api/v3/entity-templates/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the entity template. 
    # + return - Resource 
    remote isolated function getEntityTemplate(string entityTemplatePublicId) returns EntityTemplate|error {
        string resourcePath = string `/api/v3/entity-templates/${getEncodedUri(entityTemplatePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EntityTemplate response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the template to be updated. 
    # + payload - Request parameters for changing either a template's name or any of 
    # + return - Resource 
    remote isolated function updateEntityTemplate(string entityTemplatePublicId, UpdateEntityTemplate payload) returns EntityTemplate|error {
        string resourcePath = string `/api/v3/entity-templates/${getEncodedUri(entityTemplatePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntityTemplate response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the entity template. 
    # + return - No Content 
    remote isolated function deleteEntityTemplate(string entityTemplatePublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/entity-templates/${getEncodedUri(entityTemplatePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Epic Workflow
    #
    # + return - Resource 
    remote isolated function getEpicWorkflow() returns EpicWorkflow|error {
        string resourcePath = string `/api/v3/epic-workflow`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpicWorkflow response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Epics
    #
    # + return - Resource 
    remote isolated function listEpics() returns EpicSlim[]|error {
        string resourcePath = string `/api/v3/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Epic
    #
    # + payload - Create epic data 
    # + return - Resource 
    remote isolated function createEpic(CreateEpic payload) returns Epic|error {
        string resourcePath = string `/api/v3/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Epic response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function getEpic(int epicPublicId) returns Epic|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Epic response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + payload - Update epic data 
    # + return - Resource 
    remote isolated function updateEpic(int epicPublicId, UpdateEpic payload) returns Epic|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Epic response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - No Content 
    remote isolated function deleteEpic(int epicPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Epic Comments
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function listEpicComments(int epicPublicId) returns ThreadedComment[]|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ThreadedComment[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + payload - Create epic comment data 
    # + return - Resource 
    remote isolated function createEpicComment(int epicPublicId, CreateEpicComment payload) returns ThreadedComment|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ThreadedComment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + return - Resource 
    remote isolated function getEpicComment(int epicPublicId, int commentPublicId) returns ThreadedComment|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ThreadedComment response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + payload - Update epic comment data 
    # + return - Resource 
    remote isolated function updateEpicComment(int epicPublicId, int commentPublicId, UpdateComment payload) returns ThreadedComment|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ThreadedComment response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create Epic Comment Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the parent Epic Comment. 
    # + payload - Create epic comment comment data 
    # + return - Resource 
    remote isolated function createEpicCommentComment(int epicPublicId, int commentPublicId, CreateCommentComment payload) returns ThreadedComment|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ThreadedComment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteEpicComment(int epicPublicId, int commentPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Epic Stories
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function listEpicStories(int epicPublicId) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Unlink Productboard from Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - No Content 
    remote isolated function unlinkProductboardFromEpic(int epicPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/epics/${getEncodedUri(epicPublicId)}/unlink-productboard`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get External Link Stories
    #
    # + return - Resource 
    remote isolated function getExternalLinkStories() returns StorySlim[]|error {
        string resourcePath = string `/api/v3/external-link/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Files
    #
    # + return - Resource 
    remote isolated function listFiles() returns UploadedFile[]|error {
        string resourcePath = string `/api/v3/files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UploadedFile[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get File
    #
    # + filePublicId - The File’s unique ID. 
    # + return - Resource 
    remote isolated function getFile(int filePublicId) returns UploadedFile|error {
        string resourcePath = string `/api/v3/files/${getEncodedUri(filePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UploadedFile response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update File
    #
    # + filePublicId - The unique ID assigned to the file in Shortcut. 
    # + payload - Update file data 
    # + return - Resource 
    remote isolated function updateFile(int filePublicId, UpdateFile payload) returns UploadedFile|error {
        string resourcePath = string `/api/v3/files/${getEncodedUri(filePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UploadedFile response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete File
    #
    # + filePublicId - The File’s unique ID. 
    # + return - No Content 
    remote isolated function deleteFile(int filePublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/files/${getEncodedUri(filePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Groups
    #
    # + return - Resource 
    remote isolated function listGroups() returns Group[]|error {
        string resourcePath = string `/api/v3/groups`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Group[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Group
    #
    # + payload - Create group data 
    # + return - Resource 
    remote isolated function createGroup(CreateGroup payload) returns Group|error {
        string resourcePath = string `/api/v3/groups`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable Groups
    #
    # + return - No Content 
    remote isolated function disableGroups() returns http:Response|error {
        string resourcePath = string `/api/v3/groups/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Enable Groups
    #
    # + return - No Content 
    remote isolated function enableGroups() returns http:Response|error {
        string resourcePath = string `/api/v3/groups/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Group
    #
    # + groupPublicId - The unique ID of the Group. 
    # + return - Resource 
    remote isolated function getGroup(string groupPublicId) returns Group|error {
        string resourcePath = string `/api/v3/groups/${getEncodedUri(groupPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Group response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Group
    #
    # + groupPublicId - The unique ID of the Group. 
    # + payload - Update group data 
    # + return - Resource 
    remote isolated function updateGroup(string groupPublicId, UpdateGroup payload) returns Group|error {
        string resourcePath = string `/api/v3/groups/${getEncodedUri(groupPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List Group Stories
    #
    # + groupPublicId - The unique ID of the Group. 
    # + return - Resource 
    remote isolated function listGroupStories(string groupPublicId) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/groups/${getEncodedUri(groupPublicId)}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Iterations
    #
    # + return - Resource 
    remote isolated function listIterations() returns IterationSlim[]|error {
        string resourcePath = string `/api/v3/iterations`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IterationSlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Iteration
    #
    # + payload - Create iteration data 
    # + return - Resource 
    remote isolated function createIteration(CreateIteration payload) returns Iteration|error {
        string resourcePath = string `/api/v3/iterations`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Iteration response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable Iterations
    #
    # + return - No Content 
    remote isolated function disableIterations() returns http:Response|error {
        string resourcePath = string `/api/v3/iterations/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Enable Iterations
    #
    # + return - No Content 
    remote isolated function enableIterations() returns http:Response|error {
        string resourcePath = string `/api/v3/iterations/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - Resource 
    remote isolated function getIteration(int iterationPublicId) returns Iteration|error {
        string resourcePath = string `/api/v3/iterations/${getEncodedUri(iterationPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Iteration response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + payload - Update iteration data 
    # + return - Resource 
    remote isolated function updateIteration(int iterationPublicId, UpdateIteration payload) returns Iteration|error {
        string resourcePath = string `/api/v3/iterations/${getEncodedUri(iterationPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Iteration response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - No Content 
    remote isolated function deleteIteration(int iterationPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/iterations/${getEncodedUri(iterationPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Iteration Stories
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - Resource 
    remote isolated function listIterationStories(int iterationPublicId) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/iterations/${getEncodedUri(iterationPublicId)}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Labels
    #
    # + return - Resource 
    remote isolated function listLabels() returns Label[]|error {
        string resourcePath = string `/api/v3/labels`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Label[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Label
    #
    # + payload - Request parameters for creating a Label on a Shortcut Story. 
    # + return - Resource 
    remote isolated function createLabel(CreateLabelParams payload) returns Label|error {
        string resourcePath = string `/api/v3/labels`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Label response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Label
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function getLabel(int labelPublicId) returns Label|error {
        string resourcePath = string `/api/v3/labels/${getEncodedUri(labelPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Label response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Label
    #
    # + labelPublicId - The unique ID of the Label you wish to update. 
    # + payload - Update label data 
    # + return - Resource 
    remote isolated function updateLabel(int labelPublicId, UpdateLabel payload) returns Label|error {
        string resourcePath = string `/api/v3/labels/${getEncodedUri(labelPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Label response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Label
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - No Content 
    remote isolated function deleteLabel(int labelPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/labels/${getEncodedUri(labelPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Label Epics
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function listLabelEpics(int labelPublicId) returns EpicSlim[]|error {
        string resourcePath = string `/api/v3/labels/${getEncodedUri(labelPublicId)}/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Label Stories
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function listLabelStories(int labelPublicId) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/labels/${getEncodedUri(labelPublicId)}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Linked Files
    #
    # + return - Resource 
    remote isolated function listLinkedFiles() returns LinkedFile[]|error {
        string resourcePath = string `/api/v3/linked-files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LinkedFile[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Linked File
    #
    # + payload - Create linked file data 
    # + return - Resource 
    remote isolated function createLinkedFile(CreateLinkedFile payload) returns LinkedFile|error {
        string resourcePath = string `/api/v3/linked-files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkedFile response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + return - Resource 
    remote isolated function getLinkedFile(int linkedFilePublicId) returns LinkedFile|error {
        string resourcePath = string `/api/v3/linked-files/${getEncodedUri(linkedFilePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LinkedFile response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + payload - Update linked file data 
    # + return - Resource 
    remote isolated function updateLinkedFile(int linkedFilePublicId, UpdateLinkedFile payload) returns LinkedFile|error {
        string resourcePath = string `/api/v3/linked-files/${getEncodedUri(linkedFilePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkedFile response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + return - No Content 
    remote isolated function deleteLinkedFile(int linkedFilePublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/linked-files/${getEncodedUri(linkedFilePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Current Member Info
    #
    # + return - Resource 
    remote isolated function getCurrentMemberInfo() returns MemberInfo|error {
        string resourcePath = string `/api/v3/member`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MemberInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Members
    #
    # + return - Resource 
    remote isolated function listMembers() returns Member[]|error {
        string resourcePath = string `/api/v3/members`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Member[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Member
    #
    # + memberPublicId - The Member's unique ID. 
    # + return - Resource 
    remote isolated function getMember(string memberPublicId) returns Member|error {
        string resourcePath = string `/api/v3/members/${getEncodedUri(memberPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Member response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Milestones
    #
    # + return - Resource 
    remote isolated function listMilestones() returns Milestone[]|error {
        string resourcePath = string `/api/v3/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Milestone[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Milestone
    #
    # + payload - Create milestone data 
    # + return - Resource 
    remote isolated function createMilestone(CreateMilestone payload) returns Milestone|error {
        string resourcePath = string `/api/v3/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Milestone response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - Resource 
    remote isolated function getMilestone(int milestonePublicId) returns Milestone|error {
        string resourcePath = string `/api/v3/milestones/${getEncodedUri(milestonePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Milestone response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + payload - Update milestone data 
    # + return - Resource 
    remote isolated function updateMilestone(int milestonePublicId, UpdateMilestone payload) returns Milestone|error {
        string resourcePath = string `/api/v3/milestones/${getEncodedUri(milestonePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Milestone response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - No Content 
    remote isolated function deleteMilestone(int milestonePublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/milestones/${getEncodedUri(milestonePublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Milestone Epics
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - Resource 
    remote isolated function listMilestoneEpics(int milestonePublicId) returns EpicSlim[]|error {
        string resourcePath = string `/api/v3/milestones/${getEncodedUri(milestonePublicId)}/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Projects
    #
    # + return - Resource 
    remote isolated function listProjects() returns Project[]|error {
        string resourcePath = string `/api/v3/projects`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Project[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Project
    #
    # + payload - Create project data 
    # + return - Resource 
    remote isolated function createProject(CreateProject payload) returns Project|error {
        string resourcePath = string `/api/v3/projects`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - Resource 
    remote isolated function getProject(int projectPublicId) returns Project|error {
        string resourcePath = string `/api/v3/projects/${getEncodedUri(projectPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + payload - Update project data 
    # + return - Resource 
    remote isolated function updateProject(int projectPublicId, UpdateProject payload) returns Project|error {
        string resourcePath = string `/api/v3/projects/${getEncodedUri(projectPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - No Content 
    remote isolated function deleteProject(int projectPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/projects/${getEncodedUri(projectPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Stories
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - Resource 
    remote isolated function listStories(int projectPublicId) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/projects/${getEncodedUri(projectPublicId)}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Repositories
    #
    # + return - Resource 
    remote isolated function listRepositories() returns Repository[]|error {
        string resourcePath = string `/api/v3/repositories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Repository[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Repository
    #
    # + repoPublicId - The unique ID of the Repository. 
    # + return - Resource 
    remote isolated function getRepository(int repoPublicId) returns Repository|error {
        string resourcePath = string `/api/v3/repositories/${getEncodedUri(repoPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Repository response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search
    #
    # + return - Resource 
    remote isolated function search() returns SearchResults|error {
        string resourcePath = string `/api/v3/search`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SearchResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search Epics
    #
    # + return - Resource 
    remote isolated function searchEpics() returns EpicSearchResults|error {
        string resourcePath = string `/api/v3/search/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpicSearchResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search Stories
    #
    # + return - Resource 
    remote isolated function searchStories() returns StorySearchResults|error {
        string resourcePath = string `/api/v3/search/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StorySearchResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Story
    #
    # + payload - Request parameters for creating a story. 
    # + return - Resource 
    remote isolated function createStory(CreateStoryParams payload) returns Story|error {
        string resourcePath = string `/api/v3/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Story response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update Multiple Stories
    #
    # + payload - Update multiple stories data 
    # + return - Resource 
    remote isolated function updateMultipleStories(UpdateStories payload) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StorySlim[] response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create Multiple Stories
    #
    # + payload - Create multiple stories 
    # + return - Resource 
    remote isolated function createMultipleStories(CreateStories payload) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StorySlim[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Multiple Stories
    #
    # + return - No Content 
    remote isolated function deleteMultipleStories() returns http:Response|error {
        string resourcePath = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Search Stories (Old)
    #
    # + payload - Search stories (old) data 
    # + return - Resource 
    remote isolated function searchStoriesOld(SearchStories payload) returns StorySlim[]|error {
        string resourcePath = string `/api/v3/stories/search`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StorySlim[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Story
    #
    # + storyPublicId - The ID of the Story. 
    # + return - Resource 
    remote isolated function getStory(int storyPublicId) returns Story|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Story response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Story
    #
    # + storyPublicId - The unique identifier of this story. 
    # + payload - Update story data 
    # + return - Resource 
    remote isolated function updateStory(int storyPublicId, UpdateStory payload) returns Story|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Story response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Story
    #
    # + storyPublicId - The ID of the Story. 
    # + return - No Content 
    remote isolated function deleteStory(int storyPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Create Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + payload - Create story comment data 
    # + return - Resource 
    remote isolated function createStoryComment(int storyPublicId, CreateStoryComment payload) returns StoryComment|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StoryComment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - Resource 
    remote isolated function getStoryComment(int storyPublicId, int commentPublicId) returns StoryComment|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoryComment response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment 
    # + payload - Update story comment data 
    # + return - Resource 
    remote isolated function updateStoryComment(int storyPublicId, int commentPublicId, UpdateStoryComment payload) returns StoryComment|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StoryComment response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteStoryComment(int storyPublicId, int commentPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments/${getEncodedUri(commentPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Create Story Reaction
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + payload - Create story reaction data 
    # + return - Resource 
    remote isolated function createStoryReaction(int storyPublicId, int commentPublicId, CreateOrDeleteStoryReaction payload) returns StoryReaction[]|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments/${getEncodedUri(commentPublicId)}/reactions`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StoryReaction[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Story Reaction
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteStoryReaction(int storyPublicId, int commentPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/comments/${getEncodedUri(commentPublicId)}/reactions`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Story History
    #
    # + storyPublicId - The ID of the Story. 
    # + return - Resource 
    remote isolated function storyHistory(int storyPublicId) returns History[]|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/history`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        History[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Task
    #
    # + storyPublicId - The ID of the Story that the Task will be in. 
    # + payload - Create task data 
    # + return - Resource 
    remote isolated function createTask(int storyPublicId, CreateTask payload) returns Task|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/tasks`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Task
    #
    # + storyPublicId - The unique ID of the Story this Task is associated with. 
    # + taskPublicId - The unique ID of the Task. 
    # + return - Resource 
    remote isolated function getTask(int storyPublicId, int taskPublicId) returns Task|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/tasks/${getEncodedUri(taskPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Task response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Task
    #
    # + storyPublicId - The unique identifier of the parent Story. 
    # + taskPublicId - The unique identifier of the Task you wish to update. 
    # + payload - Update task data 
    # + return - Resource 
    remote isolated function updateTask(int storyPublicId, int taskPublicId, UpdateTask payload) returns Task|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/tasks/${getEncodedUri(taskPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Task
    #
    # + storyPublicId - The unique ID of the Story this Task is associated with. 
    # + taskPublicId - The unique ID of the Task. 
    # + return - No Content 
    remote isolated function deleteTask(int storyPublicId, int taskPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/stories/${getEncodedUri(storyPublicId)}/tasks/${getEncodedUri(taskPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Create Story Link
    #
    # + payload - Create story link data 
    # + return - Resource 
    remote isolated function createStoryLink(CreateStoryLink payload) returns StoryLink|error {
        string resourcePath = string `/api/v3/story-links`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StoryLink response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + return - Resource 
    remote isolated function getStoryLink(int storyLinkPublicId) returns StoryLink|error {
        string resourcePath = string `/api/v3/story-links/${getEncodedUri(storyLinkPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoryLink response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + payload - Update story link data 
    # + return - Resource 
    remote isolated function updateStoryLink(int storyLinkPublicId, UpdateStoryLink payload) returns StoryLink|error {
        string resourcePath = string `/api/v3/story-links/${getEncodedUri(storyLinkPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StoryLink response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + return - No Content 
    remote isolated function deleteStoryLink(int storyLinkPublicId) returns http:Response|error {
        string resourcePath = string `/api/v3/story-links/${getEncodedUri(storyLinkPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Workflows
    #
    # + return - Resource 
    remote isolated function listWorkflows() returns Workflow[]|error {
        string resourcePath = string `/api/v3/workflows`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Workflow[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Workflow
    #
    # + workflowPublicId - The ID of the Workflow. 
    # + return - Resource 
    remote isolated function getWorkflow(int workflowPublicId) returns Workflow|error {
        string resourcePath = string `/api/v3/workflows/${getEncodedUri(workflowPublicId)}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Workflow response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
