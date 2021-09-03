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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [atSpoke API v0.1.0](https://askspoke.com/api/reference) OpenAPI specification.
# The atSpoke REST API provides a broad set of operations including:
# - Creation, manipulation, and deletion of requests in atSpoke
# - Management of users in atSpoke
# - Creation, manipulation, and deletion of knowledge resources in atSpoke
# The public API is served from https://api.askspoke.com/api/v1 – note `api` in the host name, not your usual organization id.
@display {label: "atSpoke", iconPath: "resources/atspoke.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [atSpoke account](https://www.atspoke.com) and obtain tokens by following [this guide](https://help.atspoke.com/article/uga6efxps2-api-authentication).
    #
    # + apiKeyConfig - Provide your API key as `api_key`. Eg: `{"api_key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.askspoke.com/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # List requests
    #
    # + filter - Parameter to filter queries 
    # + status - Parameter to get requests by status. Should be a comma-separated string of statuses. 
    # + team - Get requests belonging to this team 
    # + tag - Get requests tagged with this tag. Accepts a comma-separated string of many tags, and returns requests that match any provided tag. The keyword `none` can also be passed to return requests that are not tagged. 
    # + q - Searches and returns request with this text 
    # + 'start - The index of the request to start with 
    # + 'limit - The number of requests to return at once. Max is 100. 
    # + sort - The order by which requests should be returned. When querying with a `q` param, results will be sorted by their similarity to the query when no other `sort` is specified. 
    # + return - List of requests 
    remote isolated function getRequests(string filter = "inbox", string status = "OPEN", string? team = (), string? tag = (), string? q = (), int 'start = 0, int 'limit = 25, string sort = "updated") returns InlineResponse200|error {
        string  path = string `/requests`;
        map<anydata> queryParam = {"filter": filter, "status": status, "team": team, "tag": tag, "q": q, "start": 'start, "limit": 'limit, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Create new request
    #
    # + payload - AddRequest payload 
    # + return - Request detail. 
    remote isolated function addRequest(Body payload) returns Request|error {
        string  path = string `/requests`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Request response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Request);
        return response;
    }
    # Get open tasks
    #
    # + 'start - The index of the task to start with. 
    # + 'limit - The number of tasks to return. 
    # + byDueDate - Whether to sort tasks by due date or not. 
    # + return - List of pending tasks. 
    remote isolated function getOpenTasks(int? 'start = (), int? 'limit = (), boolean? byDueDate = ()) returns InlineResponse2001|error {
        string  path = string `/requests/tasks`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "byDueDate": byDueDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Get a request
    #
    # + requestId - the ID of the request, 24 characters, hexadecimal 
    # + return - Request object. 
    remote isolated function getRequest(string requestId) returns Request|error {
        string  path = string `/requests/${requestId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Request response = check self.clientEp-> get(path, accHeaders, targetType = Request);
        return response;
    }
    # Delete a request
    #
    # + requestId - the ID of the request, 24 characters, hexadecimal 
    # + return - No Content. 
    remote isolated function deleteRequest(string requestId) returns http:Response|error {
        string  path = string `/requests/${requestId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update a request
    #
    # + requestId - the ID of the request, 24 characters, hexadecimal 
    # + payload - RequestPatchBody payload 
    # + return - Updated request object. 
    remote isolated function updateRequest(string requestId, RequestPatchBody payload) returns Request|error {
        string  path = string `/requests/${requestId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Request response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Request);
        return response;
    }
    # Bulk add tags
    #
    # + payload - A payload containing the tag id of the tag to be added and a list of request ids that the tag will be added to. 
    # + return - No content 
    remote isolated function bulkAddTags(Body1 payload) returns Request|error {
        string  path = string `/requests/bulk_add_tag`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Request response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Request);
        return response;
    }
    # Get merged requests
    #
    # + requestId - the request id of the request for which you wish to see the merged requests of 
    # + 'start - The index of merged requests to start with 
    # + 'limit - The number of requests merged with your initial request to return. Defaults to 25. 
    # + return - List of requests. 
    remote isolated function getMergedRequests(string requestId, int? 'start = (), int? 'limit = ()) returns InlineResponse2002|error {
        string  path = string `/requests/${requestId}/secondary`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Post a message
    #
    # + requestId - ID of the request. 
    # + payload - PostRequestMessage payload 
    # + return - Update object. 
    remote isolated function postRequestMessage(string requestId, Body2 payload) returns Update|error {
        string  path = string `/requests/${requestId}/messages`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Update response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Update);
        return response;
    }
    # Merge requests
    #
    # + requestId - the request id of the request you wish to merge in to 
    # + payload - MergeRequest payload 
    # + return - No Content. 
    remote isolated function mergeRequest(string requestId, Body3 payload) returns http:Response|error {
        string  path = string `/requests/${requestId}/merge`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Add tags
    #
    # + requestId - ID of the request that needs to be updated. 
    # + payload - AddTagsToRequest payload 
    # + return - No Content. 
    remote isolated function addTagsToRequest(string requestId, Body4 payload) returns http:Response|error {
        string  path = string `/requests/${requestId}/tags`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Delete tag
    #
    # + requestId - ID of the request that needs to be updated. 
    # + tagId - ID of the tag to remove from the request. 
    # + return - No Content. 
    remote isolated function deleteTagFromRequest(string requestId, string tagId) returns http:Response|error {
        string  path = string `/requests/${requestId}/tags/${tagId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Add a subscriber
    #
    # + requestId - ID of the request that will have the new subscriber. 
    # + userId - ID of the user to subscribe to the request. 
    # + return - All request subscribers 
    remote isolated function addSubscriberToRequest(string requestId, string userId) returns SubscriberList|error {
        string  path = string `/requests/${requestId}/subscribers/${userId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SubscriberList response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = SubscriberList);
        return response;
    }
    # Remove a subscriber
    #
    # + requestId - ID of the request that will have the subscriber removed. 
    # + userId - ID of the user to remove as a subscriber. 
    # + return - All request subscribers 
    remote isolated function removeSubscriberFromRequest(string requestId, string userId) returns SubscriberList|error {
        string  path = string `/requests/${requestId}/subscribers/${userId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SubscriberList response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = SubscriberList);
        return response;
    }
    # List request types
    #
    # + q - Parameter for text-searching requestTypes 
    # + team - Get request types belonging to a team. 
    # + 'start - The index of the request type to start with. 
    # + 'limit - The number of request types to return. Defaults to 25. 
    # + sort - sort order for the returned request types 
    # + return - List of request types. 
    remote isolated function getRequestTypes(string? q = (), string? team = (), int? 'start = (), int? 'limit = (), string? sort = ()) returns InlineResponse2003|error {
        string  path = string `/request_types`;
        map<anydata> queryParam = {"q": q, "team": team, "start": 'start, "limit": 'limit, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Get a request type.
    #
    # + requestTypeId - id of the request type 
    # + return - A request type object. 
    remote isolated function getRequestType(string requestTypeId) returns RequestType|error {
        string  path = string `/request_types/${requestTypeId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RequestType response = check self.clientEp-> get(path, accHeaders, targetType = RequestType);
        return response;
    }
    # List resources
    #
    # + q - A search query to search resources for. 
    # + ai - Whether or not to use AI-based search. Requires q to be set as well. 
    # + status - Parameter to get resources by status.  0 = ok, 1 = needs_review, 2 = deprecated.. 
    # + team - Get resources belonging to one or more teams. Send comma-separated string for multiple teams, "none" for no team 
    # + author - Get resources created one or more authors. Send comma-separated string for multiple authors. 
    # + reviewBy - Get resources up for review before this timestamp (ms since epoch). 
    # + 'start - The index of the request to start with. 
    # + 'limit - The number of parameters to return. Defaults to 25. 
    # + return - List of resources. 
    remote isolated function getResources(string? q = (), boolean? ai = (), decimal? status = (), string? team = (), string? author = (), int? reviewBy = (), int? 'start = (), int? 'limit = ()) returns InlineResponse2004|error {
        string  path = string `/resources`;
        map<anydata> queryParam = {"q": q, "ai": ai, "status": status, "team": team, "author": author, "reviewBy": reviewBy, "start": 'start, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2004);
        return response;
    }
    # Create a resource
    #
    # + payload - ResourcePostBody payload 
    # + return - Updated resource object. 
    remote isolated function addResource(ResourcePostBody payload) returns Resource|error {
        string  path = string `/resources`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Resource response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Resource);
        return response;
    }
    # Get a resource
    #
    # + resourceId - ID of the resource. 
    # + return - Resource object. 
    remote isolated function getResource(string resourceId) returns Resource|error {
        string  path = string `/resources/${resourceId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Resource response = check self.clientEp-> get(path, accHeaders, targetType = Resource);
        return response;
    }
    # Delete a resource
    #
    # + resourceId - ID of resource that needs to be deleted. 
    # + return - No Content. 
    remote isolated function deleteResource(string resourceId) returns http:Response|error {
        string  path = string `/resources/${resourceId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update a resource
    #
    # + resourceId - ID of the resource that needs to be updated. 
    # + payload - ResourcePostBody payload 
    # + return - Updated resource object. 
    remote isolated function updateResource(string resourceId, ResourcePostBody payload) returns Resource|error {
        string  path = string `/resources/${resourceId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Resource response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Resource);
        return response;
    }
    # List tags
    #
    # + 'start - The index of the tag to start with. 
    # + 'limit - The number of tags to return. Defaults to 25. 
    # + q - A search query to search tags for 
    # + tagId - A comma separated list of tags 
    # + return - List of tags. 
    remote isolated function getTags(int? 'start = (), int? 'limit = (), string? q = (), string? tagId = ()) returns InlineResponse2005|error {
        string  path = string `/tags`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "q": q, "tagId": tagId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2005);
        return response;
    }
    # List teams
    #
    # + q - Text search to search teams for. 
    # + ai - Whether or not to use AI-based search. Requires q to be set as well. 
    # + slug - Comma-separated list of team slugs to get. 
    # + 'start - The index of the request to start with. Ignored if ai is set to true. 
    # + 'limit - The number of parameters to return. Defaults to 25. Ignored if ai is set to true. 
    # + return - List of teams. 
    remote isolated function getTeams(string? q = (), boolean? ai = (), string? slug = (), int? 'start = (), int? 'limit = ()) returns InlineResponse2006|error {
        string  path = string `/teams`;
        map<anydata> queryParam = {"q": q, "ai": ai, "slug": slug, "start": 'start, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2006);
        return response;
    }
    # Get a team
    #
    # + teamId - ID of the team. 
    # + return - Team object. 
    remote isolated function getTeam(string teamId) returns Team|error {
        string  path = string `/teams/${teamId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Team response = check self.clientEp-> get(path, accHeaders, targetType = Team);
        return response;
    }
    # Update a team
    #
    # + teamId - ID of the team. 
    # + payload - TeamPatchBody payload 
    # + return - Team object. 
    remote isolated function updateTeam(string teamId, TeamPatchBody payload) returns Team|error {
        string  path = string `/teams/${teamId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Team response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Team);
        return response;
    }
    # List users
    #
    # + q - Text search to search user for. 
    # + status - Filter user based on status. 
    # + team - Filter user based on team. 
    # + 'start - The index of the request to start with. 
    # + 'limit - The number of parameters to return. Defaults to 10. 
    # + return - List of users. 
    remote isolated function getUsers(string? q = (), string? status = (), string? team = (), int? 'start = (), int? 'limit = ()) returns InlineResponse2007|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"q": q, "status": status, "team": team, "start": 'start, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2007);
        return response;
    }
    # Get a user
    #
    # + userId - ID of the user. 
    # + return - User object. 
    remote isolated function getUser(string userId) returns User|error {
        string  path = string `/users/${userId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # Update a user
    #
    # + userId - ID of user that needs to be updated. 
    # + payload - UpdateUser payload 
    # + return - User detail. 
    remote isolated function updateUser(string userId, Body5 payload) returns User|error {
        string  path = string `/users/${userId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=User);
        return response;
    }
    # Get a user by email
    #
    # + address - Email address of the user. Case insensitive. 
    # + return - User object. 
    remote isolated function getUserByEmail(string address) returns User|error {
        string  path = string `/users/email/${address}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # Get API user details
    #
    # + return - User and Org details 
    remote isolated function whoami() returns InlineResponse2008|error {
        string  path = string `/whoami`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2008 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2008);
        return response;
    }
    # List config lists
    #
    # + q - Parameter for text-searching lists by name or item name 
    # + 'start - The index of the list to start with. 
    # + 'limit - The number of lists to return. Defaults to 25. 
    # + listId - comma-separated list of listids to return 
    # + withItem - comma-separated list of itemids to return 
    # + return - List of config lists. 
    remote isolated function getConfigLists(string? q = (), int? 'start = (), int? 'limit = (), string? listId = (), string? withItem = ()) returns InlineResponse2009|error {
        string  path = string `/configlists`;
        map<anydata> queryParam = {"q": q, "start": 'start, "limit": 'limit, "listId": listId, "withItem": withItem};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2009 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2009);
        return response;
    }
    # Create a config list.
    #
    # + listId - List ID 
    # + payload - ConfigList payload 
    # + return - A config list object. 
    remote isolated function addConfigList(string listId, ConfigList payload) returns ConfigList|error {
        string  path = string `/configlists/${listId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ConfigList response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ConfigList);
        return response;
    }
    # Delete a config list.
    #
    # + listId - the ID of the configlist, 24 characters, hexadecimal 
    # + return - No Content. 
    remote isolated function deleteConfigList(string listId) returns http:Response|error {
        string  path = string `/configlists/${listId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update a config list.
    #
    # + listId - the ID of the configlist, 24 characters, hexadecimal 
    # + payload - ConfigList payload 
    # + return - A config list object. 
    remote isolated function updateConfigList(string listId, ConfigList payload) returns ConfigList|error {
        string  path = string `/configlists/${listId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ConfigList response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ConfigList);
        return response;
    }
    # Lists webhook subscriptions
    #
    # + return - Lists all the webhook subscriptions for this user on this org. 
    remote isolated function getWebhooks() returns InlineResponse20010|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20010);
        return response;
    }
    # Creates a new webhook subscription
    #
    # + payload - WebhookSubscriptionPostBody payload 
    # + return - Webhook subscription detail. 
    remote isolated function addWebhook(WebhookSubscriptionPostBody payload) returns WebhookSubscription|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookSubscription response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WebhookSubscription);
        return response;
    }
    # Get a webhook subscription
    #
    # + webhookId - The ID of the webhook to get. 
    # + return - Webhook Subscription object. 
    remote isolated function getWebhook(string webhookId) returns WebhookSubscription|error {
        string  path = string `/webhooks/${webhookId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebhookSubscription response = check self.clientEp-> get(path, accHeaders, targetType = WebhookSubscription);
        return response;
    }
    # Delete a  webhook subscription.
    #
    # + webhookId - ID of  webhook subscription to deleted. 
    # + return - No Content. 
    remote isolated function deleteWebhook(string webhookId) returns http:Response|error {
        string  path = string `/webhooks/${webhookId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update a webhook subscription
    #
    # + webhookId - ID of the webhook subscription that needs to be updated. 
    # + payload - WebhookSubscriptionPostBody payload 
    # + return - Updated webhook subscription object. 
    remote isolated function updateWebhook(string webhookId, WebhookSubscriptionPostBody payload) returns WebhookSubscription|error {
        string  path = string `/webhooks/${webhookId}`;
        map<any> headerValues = {"Api-Key": self.apiKeys["Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookSubscription response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=WebhookSubscription);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
