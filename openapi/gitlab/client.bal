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

# Please visit [here](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) and obtain a PAT token.
#
# + apiKeys - Provide your PAT token as `Private-Token`. Eg: `{"Private-Token" : "<PAT token>"}` 
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Client endpoint for GitLab API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration details
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return -  Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://gitlab.com/api/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Retrieve version information for this GitLab instance.
    #
    # + return - Successful
    @display {label: "Get GitLab Instance Version"}
    remote isolated function getVersion() returns VersionResponse|error {
        string  path = string `/v4/version`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        VersionResponse response = check self.clientEp-> get(path, accHeaders, targetType = VersionResponse);
        return response;
    }
    # List access requests for a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user.
    # + return - Successful
    @display {label: "List Access Requests"}
    remote isolated function accessrequestsprojectsGet(string id) returns ProjectAccessResponse|error {
        string  path = string `/v4/projects/${id}/access_requests`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectAccessResponse response = check self.clientEp-> get(path, accHeaders, targetType = ProjectAccessResponse);
        return response;
    }
    # Requests access for the authenticated user to a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user.
    # + return - Successful
    @display {label: "Request Access to a Project"}
    remote isolated function accessrequestsprojectsPost(string id) returns ProjectAccessRequest|error {
        string  path = string `/v4/projects/${id}/access_requests`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProjectAccessRequest response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ProjectAccessRequest);
        return response;
    }
    # Approves access for the authenticated user to a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user.
    # + user_id - The userID of the access requester
    # + accessLevel - A valid project access level.  0 = no access , 10 = guest, 20 = reporter, 30 = developer, 40 = Maintainer.  Default is 30.'
    # + return - Successful
    @display {label: "Approve Access to User"}
    remote isolated function accessrequestsprojectsapprovePut(string id, int user_id, int? accessLevel = 30) returns ProjectAccessApprove|error {
        string  path = string `/v4/projects/${id}/access_requests/${user_id}/approve`;
        map<anydata> queryParam = {"access_level": accessLevel};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProjectAccessApprove response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = ProjectAccessApprove);
        return response;
    }
    # Denies a project access request for the given user
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user.
    # + user_id - The user ID of the access requester
    # + return - Successful
    @display {label: "Reject Access Request from User"}
    remote isolated function accessrequestprojectsdenyDelete(string id, int user_id) returns error? {
        string  path = string `/v4/projects/${id}/access_requests/${user_id}`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, headers = accHeaders, targetType=http:Response);
    }
    # List access requests for a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user.
    # + return - Successful
    @display {label: "List Access Requests for Group"}
    remote isolated function accessrequestsgroupsGet(string id) returns GroupAccessResponse|error {
        string  path = string `/v4/groups/${id}/access_requests`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupAccessResponse response = check self.clientEp-> get(path, accHeaders, targetType = GroupAccessResponse);
        return response;
    }
    # Requests access for the authenticated user to a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user.
    # + return - Successful
    @display {label: "Request Access to a Group"}
    remote isolated function accessrequestsgroupsPost(string id) returns GroupAccessRequest|error {
        string  path = string `/v4/groups/${id}/access_requests`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GroupAccessRequest response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = GroupAccessRequest);
        return response;
    }
    # Approves access for the authenticated user to a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user.
    # + user_id - The userID of the access requester
    # + accessLevel - A valid group access level.  0 = no access , 10 = Guest, 20 = Reporter, 30 = Developer, 40 = Maintainer, 50 = Owner.  Default is 30.
    # + return - Successful
    @display {label: "Approve Access Request to a Group"}
    remote isolated function accessrequestsgroupsapprovePut(string id, int user_id, int? accessLevel = 30) returns GroupAccessApprove|error {
        string  path = string `/v4/groups/${id}/access_requests/${user_id}/approve`;
        map<anydata> queryParam = {"access_level": accessLevel};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GroupAccessApprove response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = GroupAccessApprove);
        return response;
    }
    # Denies a group access request for the given user
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user.
    # + user_id - The userID of the access requester
    # + return - Successful
    @display {label: "Delete Access Request to a Group"}
    remote isolated function accessrequestsgroupsdenyDelete(string id, int user_id) returns error? {
        string  path = string `/v4/groups/${id}/access_requests/${user_id}`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, headers = accHeaders, targetType=http:Response);
    }
    # List access tokens for a project
    #
    # + id - The ID or URL-encoded path of the project
    # + return - Successful
    @display {label: "List Access Tokens for a Project"}
    remote isolated function accesstokensGet(string id) returns AccessTokenList|error {
        string  path = string `/v4/projects/${id}/access_tokens`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccessTokenList response = check self.clientEp-> get(path, accHeaders, targetType = AccessTokenList);
        return response;
    }
    # Creates an access token for a project
    #
    # + id - The ID or URL-encoded path of the project
    # + name - The name of the project access token
    # + scopes - Defines read and write permissions for the token
    # + expiresAt - Date when the token expires. Time of day is Midnight UTC of that date.
    # + return - Successful
    @display {label: "Create Access Tokens for a Project"}
    remote isolated function accesstokensPost(string id, string name, string[] scopes, string? expiresAt = ()) returns Accesstokenlist1|error {
        string  path = string `/v4/projects/${id}/access_tokens`;
        map<anydata> queryParam = {"name": name, "scopes": scopes, "expires_at": expiresAt};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Accesstokenlist1 response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = Accesstokenlist1);
        return response;
    }
    # Revokes an access token
    #
    # + id - The ID or URL-encoded path of the project
    # + token_id - The ID of the project access token
    # + return - No content if successfully revoked
    @display {label: "Revoke an Access Token"}
    remote isolated function accesstokensDelete(string id, string token_id) returns error? {
        string  path = string `/v4/projects/${id}/access_tokens/${token_id}'`;
        map<any> headerValues = {'Private\-Token: self.apiKeys["Private-Token"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, headers = accHeaders, targetType=http:Response);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
