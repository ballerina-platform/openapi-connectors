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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Orbit API v1](https://docs.orbit.love/reference/about-the-orbit-api) OpenAPI specification. 
# Orbit API used to track activities of users and manage users.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Orbit Account](https://app.orbit.love/signup) and obtain tokens by following [this guide](https://docs.orbit.love/reference/authorization).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://app.orbit.love/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get all activity types
    #
    # + return - success
    remote isolated function getActivityTypes() returns json|error {
        string  path = string `/activity_types`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get info about the current user
    #
    # + return - success
    remote isolated function getCurrentUser() returns json|error {
        string  path = string `/user`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get all workspaces for the current user
    #
    # + return - success
    remote isolated function getWorkspaces() returns json|error {
        string  path = string `/workspaces`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get a workspace
    #
    # + workspaceId - Workspace ID
    # + return - success
    remote isolated function getWorkspaceById(string workspaceId) returns json|error {
        string  path = string `/workspaces/${workspaceId}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List activities for a workspace
    #
    # + workspaceId - Workspace ID
    # + activityTags - Activity tags allow to group activities
    # + affiliation - Association with either 'member' or 'teammate'
    # + memberTags - Member tags allow to group members
    # + orbitLevel - Orbit level
    # + activityType - Activity type related to activities
    # + weight - Weighted score of activity
    # + identity - Activity identity of platforms
    # + location - Identifier for the location
    # + company - Identifier for the company
    # + startDate - Activity start date
    # + endDate - Activity end date
    # + page - Page of the activities
    # + direction - Sort activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of activities
    # + sort - Sort activities by properties of activity
    # + 'type - Type related to activities
    # + return - success
    remote isolated function getActivitiesInWorkspace(string workspaceId, string? activityTags = (), string? affiliation = (), string? memberTags = (), string? orbitLevel = (), string? activityType = (), string? weight = (), string? identity = (), string? location = (), string? company = (), string? startDate = (), string? endDate = (), string? page = (), string? direction = (), string? items = (), string? sort = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspaceId}/activities`;
        map<anydata> queryParam = {"activity_tags": activityTags, "affiliation": affiliation, "member_tags": memberTags, "orbit_level": orbitLevel, "activity_type": activityType, "weight": weight, "identity": identity, "location": location, "company": company, "start_date": startDate, "end_date": endDate, "page": page, "direction": direction, "items": items, "sort": sort, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a Custom or a Content activity for a new or existing member
    #
    # + workspaceId - Workspace ID
    # + payload - Create Activity
    # + return - success
    remote isolated function postActivitiesById(string workspaceId, ActivityAndIdentity payload) returns json|error {
        string  path = string `/${workspaceId}/activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Get an activity in the workspace
    #
    # + workspaceId - Workspace ID
    # + id - Activity ID
    # + return - success
    remote isolated function getActivitiesById(string workspaceId, string id) returns json|error {
        string  path = string `/${workspaceId}/activities/${id}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List members in a workspace
    #
    # + workspaceId - Workspace ID
    # + activityTags - Activity tags allow to group activities
    # + affiliation - Association with either 'member' or 'teammate'
    # + memberTags - Member tags allow to group members
    # + orbitLevel - Orbit level
    # + activityType - Activity type related to activities
    # + weight - Weighted score of activity
    # + identity - Activity identity of platforms
    # + location - Identifier for the location
    # + company - Identifier for the company
    # + startDate - Activity start date
    # + endDate - Activity end date
    # + query - Activity query
    # + page - Page of the members
    # + direction - Organise activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of members
    # + activitiesCountMin - Minumum count of activities
    # + activitiesCountMax - Maximum count of activities
    # + sort - Sort activities by properties of activity
    # + 'type - Type related to activities
    # + return - success
    remote isolated function getMembers(string workspaceId, string? activityTags = (), string? affiliation = (), string? memberTags = (), string? orbitLevel = (), string? activityType = (), string? weight = (), string? identity = (), string? location = (), string? company = (), string? startDate = (), string? endDate = (), string? query = (), string? page = (), string? direction = (), string? items = (), string? activitiesCountMin = (), string? activitiesCountMax = (), string? sort = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspaceId}/members`;
        map<anydata> queryParam = {"activity_tags": activityTags, "affiliation": affiliation, "member_tags": memberTags, "orbit_level": orbitLevel, "activity_type": activityType, "weight": weight, "identity": identity, "location": location, "company": company, "start_date": startDate, "end_date": endDate, "query": query, "page": page, "direction": direction, "items": items, "activities_count_min": activitiesCountMin, "activities_count_max": activitiesCountMax, "sort": sort, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create or update a member
    #
    # + workspaceId - Workspace ID
    # + payload - Create member
    # + return - success
    remote isolated function postMembers(string workspaceId, MemberAndIdentity payload) returns json|error {
        string  path = string `/${workspaceId}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Find a member by an identity
    #
    # + workspaceId - Workspace ID
    # + 'source - Source of member in a workspace
    # + sourceHost - Source host of member in a workspace
    # + uid - Unique identifier of member in a workspace
    # + username - Username of member in a workspace
    # + email - Email of member in a workspace
    # + github - Deprecated, please use source=github and username=<username> instead
    # + return - success
    remote isolated function findMembers(string workspaceId, string? 'source = (), string? sourceHost = (), string? uid = (), string? username = (), string? email = (), string? github = ()) returns json|error {
        string  path = string `/${workspaceId}/members/find`;
        map<anydata> queryParam = {"source": 'source, "source_host": sourceHost, "uid": uid, "username": username, "email": email, "github": github};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get a member
    #
    # + workspaceId - Workspace ID
    # + id - Member ID
    # + return - success
    remote isolated function getMembersById(string workspaceId, string id) returns json|error {
        string  path = string `/${workspaceId}/members/${id}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Update a member
    #
    # + workspaceId - Workspace ID
    # + id - Member ID
    # + payload - Update member
    # + return - member updated
    remote isolated function updateMembersById(string workspaceId, string id, Member payload) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a member
    #
    # + workspaceId - Workspace ID
    # + id - Member ID
    # + return - member deleted
    remote isolated function deleteMembersById(string workspaceId, string id) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List activities for a member
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + page - Page of the activities
    # + direction - Sort activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of activities
    # + sort - Sort activities by properties of activity
    # + activityType - Activity type related to activities
    # + 'type - Type related to activities
    # + return - success
    remote isolated function getActivities(string workspaceId, string memberId, string? page = (), string? direction = (), string? items = (), string? sort = (), string? activityType = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspaceId}/members/${memberId}/activities`;
        map<anydata> queryParam = {"page": page, "direction": direction, "items": items, "sort": sort, "activity_type": activityType, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a Custom or a Content activity for a member
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + payload - Create member activity
    # + return - success
    remote isolated function postActivities(string workspaceId, string memberId, Activity payload) returns json|error {
        string  path = string `/${workspaceId}/members/${memberId}/activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Update a custom activity for a member
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + id - Activity ID
    # + payload - Update member activity
    # + return - activity updated
    remote isolated function updateActivityById(string workspaceId, string memberId, string id, Activity payload) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${memberId}/activities/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a post activity
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + id - Activity ID
    # + return - activity deleted
    remote isolated function deleteActivityById(string workspaceId, string memberId, string id) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${memberId}/activities/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Add identity to a member
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + payload - Add member identity
    # + return - success
    remote isolated function postIdentities(string workspaceId, string memberId, Identity payload) returns json|error {
        string  path = string `/${workspaceId}/members/${memberId}/identities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Remove identity from a member
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + return - success; no content
    remote isolated function deleteIdentities(string workspaceId, string memberId) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${memberId}/identities`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get the member's notes
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + page - Page of the notes
    # + return - success
    remote isolated function getNotes(string workspaceId, string memberId, string? page = ()) returns json|error {
        string  path = string `/${workspaceId}/members/${memberId}/notes`;
        map<anydata> queryParam = {"page": page};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a note
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + payload - Create note
    # + return - note created
    remote isolated function postNotes(string workspaceId, string memberId, Note payload) returns json|error {
        string  path = string `/${workspaceId}/members/${memberId}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Update a note
    #
    # + workspaceId - Workspace ID
    # + memberId - Member ID
    # + id - Note ID
    # + payload - Update note
    # + return - note updated
    remote isolated function updateNoteById(string workspaceId, string memberId, string id, Note payload) returns http:Response|error {
        string  path = string `/${workspaceId}/members/${memberId}/notes/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get a workspace stats
    #
    # + workspaceId - Workspace ID
    # + startDate - Report start date
    # + endDate - Report end date
    # + 'group - Group in report generation
    # + activityType - Activity type related to activities
    # + 'type - Report type to generate
    # + return - success
    remote isolated function getReports(string workspaceId, string? startDate = (), string? endDate = (), string? 'group = (), string? activityType = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspaceId}/reports`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "group": 'group, "activity_type": activityType, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
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
