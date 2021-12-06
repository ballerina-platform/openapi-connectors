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
    # Represents API Key `Shortcut-Token`
    string shortcutToken;
|};

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
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.app.shortcut.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # List Categories
    #
    # + return - Resource 
    remote isolated function listCategories() returns Category[]|error {
        string  path = string `/api/v3/categories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Category[] response = check self.clientEp-> get(path, accHeaders, targetType = CategoryArr);
        return response;
    }
    # Create Category
    #
    # + payload - Create category data 
    # + return - Resource 
    remote isolated function createCategory(CreateCategory payload) returns Category|error {
        string  path = string `/api/v3/categories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Category response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Category);
        return response;
    }
    # Get Category
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - Resource 
    remote isolated function getCategory(int categoryPublicId) returns Category|error {
        string  path = string `/api/v3/categories/${categoryPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Category response = check self.clientEp-> get(path, accHeaders, targetType = Category);
        return response;
    }
    # Update Category
    #
    # + categoryPublicId - The unique ID of the Category you wish to update. 
    # + payload - Update category data 
    # + return - Resource 
    remote isolated function updateCategory(int categoryPublicId, UpdateCategory payload) returns Category|error {
        string  path = string `/api/v3/categories/${categoryPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Category response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Category);
        return response;
    }
    # Delete Category
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - No Content 
    remote isolated function deleteCategory(int categoryPublicId) returns http:Response|error {
        string  path = string `/api/v3/categories/${categoryPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Category Milestones
    #
    # + categoryPublicId - The unique ID of the Category. 
    # + return - Resource 
    remote isolated function listCategoryMilestones(int categoryPublicId) returns Milestone[]|error {
        string  path = string `/api/v3/categories/${categoryPublicId}/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Milestone[] response = check self.clientEp-> get(path, accHeaders, targetType = MilestoneArr);
        return response;
    }
    # List Entity Templates
    #
    # + return - Resource 
    remote isolated function listEntityTemplates() returns EntityTemplate[]|error {
        string  path = string `/api/v3/entity-templates`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EntityTemplate[] response = check self.clientEp-> get(path, accHeaders, targetType = EntityTemplateArr);
        return response;
    }
    # Create Entity Template
    #
    # + payload - Request paramaters for creating an entirely new entity template. 
    # + return - Resource 
    remote isolated function createEntityTemplate(CreateEntityTemplate payload) returns EntityTemplate|error {
        string  path = string `/api/v3/entity-templates`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EntityTemplate response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EntityTemplate);
        return response;
    }
    # Disable Story Templates
    #
    # + return - No Content 
    remote isolated function disableStoryTemplates() returns http:Response|error {
        string  path = string `/api/v3/entity-templates/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Enable Story Templates
    #
    # + return - No Content 
    remote isolated function enableStoryTemplates() returns http:Response|error {
        string  path = string `/api/v3/entity-templates/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the entity template. 
    # + return - Resource 
    remote isolated function getEntityTemplate(string entityTemplatePublicId) returns EntityTemplate|error {
        string  path = string `/api/v3/entity-templates/${entityTemplatePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EntityTemplate response = check self.clientEp-> get(path, accHeaders, targetType = EntityTemplate);
        return response;
    }
    # Update Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the template to be updated. 
    # + payload - Request parameters for changing either a template's name or any of 
    # + return - Resource 
    remote isolated function updateEntityTemplate(string entityTemplatePublicId, UpdateEntityTemplate payload) returns EntityTemplate|error {
        string  path = string `/api/v3/entity-templates/${entityTemplatePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EntityTemplate response = check self.clientEp->put(path, request, headers = accHeaders, targetType=EntityTemplate);
        return response;
    }
    # Delete Entity Template
    #
    # + entityTemplatePublicId - The unique ID of the entity template. 
    # + return - No Content 
    remote isolated function deleteEntityTemplate(string entityTemplatePublicId) returns http:Response|error {
        string  path = string `/api/v3/entity-templates/${entityTemplatePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get Epic Workflow
    #
    # + return - Resource 
    remote isolated function getEpicWorkflow() returns EpicWorkflow|error {
        string  path = string `/api/v3/epic-workflow`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EpicWorkflow response = check self.clientEp-> get(path, accHeaders, targetType = EpicWorkflow);
        return response;
    }
    # List Epics
    #
    # + return - Resource 
    remote isolated function listEpics() returns EpicSlim[]|error {
        string  path = string `/api/v3/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp-> get(path, accHeaders, targetType = EpicSlimArr);
        return response;
    }
    # Create Epic
    #
    # + payload - Create epic data 
    # + return - Resource 
    remote isolated function createEpic(CreateEpic payload) returns Epic|error {
        string  path = string `/api/v3/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Epic response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Epic);
        return response;
    }
    # Get Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function getEpic(int epicPublicId) returns Epic|error {
        string  path = string `/api/v3/epics/${epicPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Epic response = check self.clientEp-> get(path, accHeaders, targetType = Epic);
        return response;
    }
    # Update Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + payload - Update epic data 
    # + return - Resource 
    remote isolated function updateEpic(int epicPublicId, UpdateEpic payload) returns Epic|error {
        string  path = string `/api/v3/epics/${epicPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Epic response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Epic);
        return response;
    }
    # Delete Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - No Content 
    remote isolated function deleteEpic(int epicPublicId) returns http:Response|error {
        string  path = string `/api/v3/epics/${epicPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Epic Comments
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function listEpicComments(int epicPublicId) returns ThreadedComment[]|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ThreadedComment[] response = check self.clientEp-> get(path, accHeaders, targetType = ThreadedCommentArr);
        return response;
    }
    # Create Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + payload - Create epic comment data 
    # + return - Resource 
    remote isolated function createEpicComment(int epicPublicId, CreateEpicComment payload) returns ThreadedComment|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThreadedComment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ThreadedComment);
        return response;
    }
    # Get Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + return - Resource 
    remote isolated function getEpicComment(int epicPublicId, int commentPublicId) returns ThreadedComment|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ThreadedComment response = check self.clientEp-> get(path, accHeaders, targetType = ThreadedComment);
        return response;
    }
    # Update Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + payload - Update epic comment data 
    # + return - Resource 
    remote isolated function updateEpicComment(int epicPublicId, int commentPublicId, UpdateComment payload) returns ThreadedComment|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThreadedComment response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ThreadedComment);
        return response;
    }
    # Create Epic Comment Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the parent Epic Comment. 
    # + payload - Create epic comment comment data 
    # + return - Resource 
    remote isolated function createEpicCommentComment(int epicPublicId, int commentPublicId, CreateCommentComment payload) returns ThreadedComment|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThreadedComment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ThreadedComment);
        return response;
    }
    # Delete Epic Comment
    #
    # + epicPublicId - The ID of the associated Epic. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteEpicComment(int epicPublicId, int commentPublicId) returns http:Response|error {
        string  path = string `/api/v3/epics/${epicPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Epic Stories
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - Resource 
    remote isolated function listEpicStories(int epicPublicId) returns StorySlim[]|error {
        string  path = string `/api/v3/epics/${epicPublicId}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # Unlink Productboard from Epic
    #
    # + epicPublicId - The unique ID of the Epic. 
    # + return - No Content 
    remote isolated function unlinkProductboardFromEpic(int epicPublicId) returns http:Response|error {
        string  path = string `/api/v3/epics/${epicPublicId}/unlink-productboard`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get External Link Stories
    #
    # + return - Resource 
    remote isolated function getExternalLinkStories() returns StorySlim[]|error {
        string  path = string `/api/v3/external-link/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # List Files
    #
    # + return - Resource 
    remote isolated function listFiles() returns UploadedFile[]|error {
        string  path = string `/api/v3/files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UploadedFile[] response = check self.clientEp-> get(path, accHeaders, targetType = UploadedFileArr);
        return response;
    }
    # Get File
    #
    # + filePublicId - The File’s unique ID. 
    # + return - Resource 
    remote isolated function getFile(int filePublicId) returns UploadedFile|error {
        string  path = string `/api/v3/files/${filePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UploadedFile response = check self.clientEp-> get(path, accHeaders, targetType = UploadedFile);
        return response;
    }
    # Update File
    #
    # + filePublicId - The unique ID assigned to the file in Shortcut. 
    # + payload - Update file data 
    # + return - Resource 
    remote isolated function updateFile(int filePublicId, UpdateFile payload) returns UploadedFile|error {
        string  path = string `/api/v3/files/${filePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UploadedFile response = check self.clientEp->put(path, request, headers = accHeaders, targetType=UploadedFile);
        return response;
    }
    # Delete File
    #
    # + filePublicId - The File’s unique ID. 
    # + return - No Content 
    remote isolated function deleteFile(int filePublicId) returns http:Response|error {
        string  path = string `/api/v3/files/${filePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Groups
    #
    # + return - Resource 
    remote isolated function listGroups() returns Group[]|error {
        string  path = string `/api/v3/groups`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Group[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupArr);
        return response;
    }
    # Create Group
    #
    # + payload - Create group data 
    # + return - Resource 
    remote isolated function createGroup(CreateGroup payload) returns Group|error {
        string  path = string `/api/v3/groups`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Group);
        return response;
    }
    # Disable Groups
    #
    # + return - No Content 
    remote isolated function disableGroups() returns http:Response|error {
        string  path = string `/api/v3/groups/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Enable Groups
    #
    # + return - No Content 
    remote isolated function enableGroups() returns http:Response|error {
        string  path = string `/api/v3/groups/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Group
    #
    # + groupPublicId - The unique ID of the Group. 
    # + return - Resource 
    remote isolated function getGroup(string groupPublicId) returns Group|error {
        string  path = string `/api/v3/groups/${groupPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Group response = check self.clientEp-> get(path, accHeaders, targetType = Group);
        return response;
    }
    # Update Group
    #
    # + groupPublicId - The unique ID of the Group. 
    # + payload - Update group data 
    # + return - Resource 
    remote isolated function updateGroup(string groupPublicId, UpdateGroup payload) returns Group|error {
        string  path = string `/api/v3/groups/${groupPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Group);
        return response;
    }
    # List Group Stories
    #
    # + groupPublicId - The unique ID of the Group. 
    # + return - Resource 
    remote isolated function listGroupStories(string groupPublicId) returns StorySlim[]|error {
        string  path = string `/api/v3/groups/${groupPublicId}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # List Iterations
    #
    # + return - Resource 
    remote isolated function listIterations() returns IterationSlim[]|error {
        string  path = string `/api/v3/iterations`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        IterationSlim[] response = check self.clientEp-> get(path, accHeaders, targetType = IterationSlimArr);
        return response;
    }
    # Create Iteration
    #
    # + payload - Create iteration data 
    # + return - Resource 
    remote isolated function createIteration(CreateIteration payload) returns Iteration|error {
        string  path = string `/api/v3/iterations`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Iteration response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Iteration);
        return response;
    }
    # Disable Iterations
    #
    # + return - No Content 
    remote isolated function disableIterations() returns http:Response|error {
        string  path = string `/api/v3/iterations/disable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Enable Iterations
    #
    # + return - No Content 
    remote isolated function enableIterations() returns http:Response|error {
        string  path = string `/api/v3/iterations/enable`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - Resource 
    remote isolated function getIteration(int iterationPublicId) returns Iteration|error {
        string  path = string `/api/v3/iterations/${iterationPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Iteration response = check self.clientEp-> get(path, accHeaders, targetType = Iteration);
        return response;
    }
    # Update Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + payload - Update iteration data 
    # + return - Resource 
    remote isolated function updateIteration(int iterationPublicId, UpdateIteration payload) returns Iteration|error {
        string  path = string `/api/v3/iterations/${iterationPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Iteration response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Iteration);
        return response;
    }
    # Delete Iteration
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - No Content 
    remote isolated function deleteIteration(int iterationPublicId) returns http:Response|error {
        string  path = string `/api/v3/iterations/${iterationPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Iteration Stories
    #
    # + iterationPublicId - The unique ID of the Iteration. 
    # + return - Resource 
    remote isolated function listIterationStories(int iterationPublicId) returns StorySlim[]|error {
        string  path = string `/api/v3/iterations/${iterationPublicId}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # List Labels
    #
    # + return - Resource 
    remote isolated function listLabels() returns Label[]|error {
        string  path = string `/api/v3/labels`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Label[] response = check self.clientEp-> get(path, accHeaders, targetType = LabelArr);
        return response;
    }
    # Create Label
    #
    # + payload - Request parameters for creating a Label on a Shortcut Story. 
    # + return - Resource 
    remote isolated function createLabel(CreateLabelParams payload) returns Label|error {
        string  path = string `/api/v3/labels`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Label response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Label);
        return response;
    }
    # Get Label
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function getLabel(int labelPublicId) returns Label|error {
        string  path = string `/api/v3/labels/${labelPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Label response = check self.clientEp-> get(path, accHeaders, targetType = Label);
        return response;
    }
    # Update Label
    #
    # + labelPublicId - The unique ID of the Label you wish to update. 
    # + payload - Update label data 
    # + return - Resource 
    remote isolated function updateLabel(int labelPublicId, UpdateLabel payload) returns Label|error {
        string  path = string `/api/v3/labels/${labelPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Label response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Label);
        return response;
    }
    # Delete Label
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - No Content 
    remote isolated function deleteLabel(int labelPublicId) returns http:Response|error {
        string  path = string `/api/v3/labels/${labelPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Label Epics
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function listLabelEpics(int labelPublicId) returns EpicSlim[]|error {
        string  path = string `/api/v3/labels/${labelPublicId}/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp-> get(path, accHeaders, targetType = EpicSlimArr);
        return response;
    }
    # List Label Stories
    #
    # + labelPublicId - The unique ID of the Label. 
    # + return - Resource 
    remote isolated function listLabelStories(int labelPublicId) returns StorySlim[]|error {
        string  path = string `/api/v3/labels/${labelPublicId}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # List Linked Files
    #
    # + return - Resource 
    remote isolated function listLinkedFiles() returns LinkedFile[]|error {
        string  path = string `/api/v3/linked-files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinkedFile[] response = check self.clientEp-> get(path, accHeaders, targetType = LinkedFileArr);
        return response;
    }
    # Create Linked File
    #
    # + payload - Create linked file data 
    # + return - Resource 
    remote isolated function createLinkedFile(CreateLinkedFile payload) returns LinkedFile|error {
        string  path = string `/api/v3/linked-files`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkedFile response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LinkedFile);
        return response;
    }
    # Get Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + return - Resource 
    remote isolated function getLinkedFile(int linkedFilePublicId) returns LinkedFile|error {
        string  path = string `/api/v3/linked-files/${linkedFilePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinkedFile response = check self.clientEp-> get(path, accHeaders, targetType = LinkedFile);
        return response;
    }
    # Update Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + payload - Update linked file data 
    # + return - Resource 
    remote isolated function updateLinkedFile(int linkedFilePublicId, UpdateLinkedFile payload) returns LinkedFile|error {
        string  path = string `/api/v3/linked-files/${linkedFilePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkedFile response = check self.clientEp->put(path, request, headers = accHeaders, targetType=LinkedFile);
        return response;
    }
    # Delete Linked File
    #
    # + linkedFilePublicId - The unique identifier of the linked file. 
    # + return - No Content 
    remote isolated function deleteLinkedFile(int linkedFilePublicId) returns http:Response|error {
        string  path = string `/api/v3/linked-files/${linkedFilePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get Current Member Info
    #
    # + return - Resource 
    remote isolated function getCurrentMemberInfo() returns MemberInfo|error {
        string  path = string `/api/v3/member`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MemberInfo response = check self.clientEp-> get(path, accHeaders, targetType = MemberInfo);
        return response;
    }
    # List Members
    #
    # + return - Resource 
    remote isolated function listMembers() returns Member[]|error {
        string  path = string `/api/v3/members`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Member[] response = check self.clientEp-> get(path, accHeaders, targetType = MemberArr);
        return response;
    }
    # Get Member
    #
    # + memberPublicId - The Member's unique ID. 
    # + return - Resource 
    remote isolated function getMember(string memberPublicId) returns Member|error {
        string  path = string `/api/v3/members/${memberPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Member response = check self.clientEp-> get(path, accHeaders, targetType = Member);
        return response;
    }
    # List Milestones
    #
    # + return - Resource 
    remote isolated function listMilestones() returns Milestone[]|error {
        string  path = string `/api/v3/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Milestone[] response = check self.clientEp-> get(path, accHeaders, targetType = MilestoneArr);
        return response;
    }
    # Create Milestone
    #
    # + payload - Create milestone data 
    # + return - Resource 
    remote isolated function createMilestone(CreateMilestone payload) returns Milestone|error {
        string  path = string `/api/v3/milestones`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Milestone response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Milestone);
        return response;
    }
    # Get Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - Resource 
    remote isolated function getMilestone(int milestonePublicId) returns Milestone|error {
        string  path = string `/api/v3/milestones/${milestonePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Milestone response = check self.clientEp-> get(path, accHeaders, targetType = Milestone);
        return response;
    }
    # Update Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + payload - Update milestone data 
    # + return - Resource 
    remote isolated function updateMilestone(int milestonePublicId, UpdateMilestone payload) returns Milestone|error {
        string  path = string `/api/v3/milestones/${milestonePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Milestone response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Milestone);
        return response;
    }
    # Delete Milestone
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - No Content 
    remote isolated function deleteMilestone(int milestonePublicId) returns http:Response|error {
        string  path = string `/api/v3/milestones/${milestonePublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Milestone Epics
    #
    # + milestonePublicId - The ID of the Milestone. 
    # + return - Resource 
    remote isolated function listMilestoneEpics(int milestonePublicId) returns EpicSlim[]|error {
        string  path = string `/api/v3/milestones/${milestonePublicId}/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EpicSlim[] response = check self.clientEp-> get(path, accHeaders, targetType = EpicSlimArr);
        return response;
    }
    # List Projects
    #
    # + return - Resource 
    remote isolated function listProjects() returns Project[]|error {
        string  path = string `/api/v3/projects`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project[] response = check self.clientEp-> get(path, accHeaders, targetType = ProjectArr);
        return response;
    }
    # Create Project
    #
    # + payload - Create project data 
    # + return - Resource 
    remote isolated function createProject(CreateProject payload) returns Project|error {
        string  path = string `/api/v3/projects`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Project);
        return response;
    }
    # Get Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - Resource 
    remote isolated function getProject(int projectPublicId) returns Project|error {
        string  path = string `/api/v3/projects/${projectPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp-> get(path, accHeaders, targetType = Project);
        return response;
    }
    # Update Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + payload - Update project data 
    # + return - Resource 
    remote isolated function updateProject(int projectPublicId, UpdateProject payload) returns Project|error {
        string  path = string `/api/v3/projects/${projectPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Project);
        return response;
    }
    # Delete Project
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - No Content 
    remote isolated function deleteProject(int projectPublicId) returns http:Response|error {
        string  path = string `/api/v3/projects/${projectPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Stories
    #
    # + projectPublicId - The unique ID of the Project. 
    # + return - Resource 
    remote isolated function listStories(int projectPublicId) returns StorySlim[]|error {
        string  path = string `/api/v3/projects/${projectPublicId}/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySlim[] response = check self.clientEp-> get(path, accHeaders, targetType = StorySlimArr);
        return response;
    }
    # List Repositories
    #
    # + return - Resource 
    remote isolated function listRepositories() returns Repository[]|error {
        string  path = string `/api/v3/repositories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Repository[] response = check self.clientEp-> get(path, accHeaders, targetType = RepositoryArr);
        return response;
    }
    # Get Repository
    #
    # + repoPublicId - The unique ID of the Repository. 
    # + return - Resource 
    remote isolated function getRepository(int repoPublicId) returns Repository|error {
        string  path = string `/api/v3/repositories/${repoPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Repository response = check self.clientEp-> get(path, accHeaders, targetType = Repository);
        return response;
    }
    # Search
    #
    # + return - Resource 
    remote isolated function search() returns SearchResults|error {
        string  path = string `/api/v3/search`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SearchResults response = check self.clientEp-> get(path, accHeaders, targetType = SearchResults);
        return response;
    }
    # Search Epics
    #
    # + return - Resource 
    remote isolated function searchEpics() returns EpicSearchResults|error {
        string  path = string `/api/v3/search/epics`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EpicSearchResults response = check self.clientEp-> get(path, accHeaders, targetType = EpicSearchResults);
        return response;
    }
    # Search Stories
    #
    # + return - Resource 
    remote isolated function searchStories() returns StorySearchResults|error {
        string  path = string `/api/v3/search/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StorySearchResults response = check self.clientEp-> get(path, accHeaders, targetType = StorySearchResults);
        return response;
    }
    # Create Story
    #
    # + payload - Request parameters for creating a story. 
    # + return - Resource 
    remote isolated function createStory(CreateStoryParams payload) returns Story|error {
        string  path = string `/api/v3/stories`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Story response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Story);
        return response;
    }
    # Update Multiple Stories
    #
    # + payload - Update multiple stories data 
    # + return - Resource 
    remote isolated function updateMultipleStories(UpdateStories payload) returns StorySlim[]|error {
        string  path = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorySlim[] response = check self.clientEp->put(path, request, headers = accHeaders, targetType=StorySlimArr);
        return response;
    }
    # Create Multiple Stories
    #
    # + payload - Create multiple stories 
    # + return - Resource 
    remote isolated function createMultipleStories(CreateStories payload) returns StorySlim[]|error {
        string  path = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorySlim[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StorySlimArr);
        return response;
    }
    # Delete Multiple Stories
    #
    # + return - No Content 
    remote isolated function deleteMultipleStories() returns http:Response|error {
        string  path = string `/api/v3/stories/bulk`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Search Stories (Old)
    #
    # + payload - Search stories (old) data 
    # + return - Resource 
    remote isolated function searchStoriesOld(SearchStories payload) returns StorySlim[]|error {
        string  path = string `/api/v3/stories/search`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorySlim[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StorySlimArr);
        return response;
    }
    # Get Story
    #
    # + storyPublicId - The ID of the Story. 
    # + return - Resource 
    remote isolated function getStory(int storyPublicId) returns Story|error {
        string  path = string `/api/v3/stories/${storyPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Story response = check self.clientEp-> get(path, accHeaders, targetType = Story);
        return response;
    }
    # Update Story
    #
    # + storyPublicId - The unique identifier of this story. 
    # + payload - Update story data 
    # + return - Resource 
    remote isolated function updateStory(int storyPublicId, UpdateStory payload) returns Story|error {
        string  path = string `/api/v3/stories/${storyPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Story response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Story);
        return response;
    }
    # Delete Story
    #
    # + storyPublicId - The ID of the Story. 
    # + return - No Content 
    remote isolated function deleteStory(int storyPublicId) returns http:Response|error {
        string  path = string `/api/v3/stories/${storyPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Create Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + payload - Create story comment data 
    # + return - Resource 
    remote isolated function createStoryComment(int storyPublicId, CreateStoryComment payload) returns StoryComment|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoryComment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StoryComment);
        return response;
    }
    # Get Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - Resource 
    remote isolated function getStoryComment(int storyPublicId, int commentPublicId) returns StoryComment|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoryComment response = check self.clientEp-> get(path, accHeaders, targetType = StoryComment);
        return response;
    }
    # Update Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment 
    # + payload - Update story comment data 
    # + return - Resource 
    remote isolated function updateStoryComment(int storyPublicId, int commentPublicId, UpdateStoryComment payload) returns StoryComment|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoryComment response = check self.clientEp->put(path, request, headers = accHeaders, targetType=StoryComment);
        return response;
    }
    # Delete Story Comment
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteStoryComment(int storyPublicId, int commentPublicId) returns http:Response|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments/${commentPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Create Story Reaction
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + payload - Create story reaction data 
    # + return - Resource 
    remote isolated function createStoryReaction(int storyPublicId, int commentPublicId, CreateOrDeleteStoryReaction payload) returns StoryReaction[]|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments/${commentPublicId}/reactions`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoryReaction[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StoryReactionArr);
        return response;
    }
    # Delete Story Reaction
    #
    # + storyPublicId - The ID of the Story that the Comment is in. 
    # + commentPublicId - The ID of the Comment. 
    # + return - No Content 
    remote isolated function deleteStoryReaction(int storyPublicId, int commentPublicId) returns http:Response|error {
        string  path = string `/api/v3/stories/${storyPublicId}/comments/${commentPublicId}/reactions`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Story History
    #
    # + storyPublicId - The ID of the Story. 
    # + return - Resource 
    remote isolated function storyHistory(int storyPublicId) returns History[]|error {
        string  path = string `/api/v3/stories/${storyPublicId}/history`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        History[] response = check self.clientEp-> get(path, accHeaders, targetType = HistoryArr);
        return response;
    }
    # Create Task
    #
    # + storyPublicId - The ID of the Story that the Task will be in. 
    # + payload - Create task data 
    # + return - Resource 
    remote isolated function createTask(int storyPublicId, CreateTask payload) returns Task|error {
        string  path = string `/api/v3/stories/${storyPublicId}/tasks`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Task);
        return response;
    }
    # Get Task
    #
    # + storyPublicId - The unique ID of the Story this Task is associated with. 
    # + taskPublicId - The unique ID of the Task. 
    # + return - Resource 
    remote isolated function getTask(int storyPublicId, int taskPublicId) returns Task|error {
        string  path = string `/api/v3/stories/${storyPublicId}/tasks/${taskPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Task response = check self.clientEp-> get(path, accHeaders, targetType = Task);
        return response;
    }
    # Update Task
    #
    # + storyPublicId - The unique identifier of the parent Story. 
    # + taskPublicId - The unique identifier of the Task you wish to update. 
    # + payload - Update task data 
    # + return - Resource 
    remote isolated function updateTask(int storyPublicId, int taskPublicId, UpdateTask payload) returns Task|error {
        string  path = string `/api/v3/stories/${storyPublicId}/tasks/${taskPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Task);
        return response;
    }
    # Delete Task
    #
    # + storyPublicId - The unique ID of the Story this Task is associated with. 
    # + taskPublicId - The unique ID of the Task. 
    # + return - No Content 
    remote isolated function deleteTask(int storyPublicId, int taskPublicId) returns http:Response|error {
        string  path = string `/api/v3/stories/${storyPublicId}/tasks/${taskPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Create Story Link
    #
    # + payload - Create story link data 
    # + return - Resource 
    remote isolated function createStoryLink(CreateStoryLink payload) returns StoryLink|error {
        string  path = string `/api/v3/story-links`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoryLink response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StoryLink);
        return response;
    }
    # Get Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + return - Resource 
    remote isolated function getStoryLink(int storyLinkPublicId) returns StoryLink|error {
        string  path = string `/api/v3/story-links/${storyLinkPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoryLink response = check self.clientEp-> get(path, accHeaders, targetType = StoryLink);
        return response;
    }
    # Update Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + payload - Update story link data 
    # + return - Resource 
    remote isolated function updateStoryLink(int storyLinkPublicId, UpdateStoryLink payload) returns StoryLink|error {
        string  path = string `/api/v3/story-links/${storyLinkPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoryLink response = check self.clientEp->put(path, request, headers = accHeaders, targetType=StoryLink);
        return response;
    }
    # Delete Story Link
    #
    # + storyLinkPublicId - The unique ID of the Story Link. 
    # + return - No Content 
    remote isolated function deleteStoryLink(int storyLinkPublicId) returns http:Response|error {
        string  path = string `/api/v3/story-links/${storyLinkPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # List Workflows
    #
    # + return - Resource 
    remote isolated function listWorkflows() returns Workflow[]|error {
        string  path = string `/api/v3/workflows`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Workflow[] response = check self.clientEp-> get(path, accHeaders, targetType = WorkflowArr);
        return response;
    }
    # Get Workflow
    #
    # + workflowPublicId - The ID of the Workflow. 
    # + return - Resource 
    remote isolated function getWorkflow(int workflowPublicId) returns Workflow|error {
        string  path = string `/api/v3/workflows/${workflowPublicId}`;
        map<any> headerValues = {"Shortcut-Token": self.apiKeyConfig.shortcutToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Workflow response = check self.clientEp-> get(path, accHeaders, targetType = Workflow);
        return response;
    }
}
