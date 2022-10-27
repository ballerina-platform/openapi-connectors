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

# This is a generated connector for [GitLab GitLab REST API v4](https://about.gitlab.com/) OpenAPI specification.
# 
# Client endpoint for GitLab API currently supports operations related to access requests and access tokens in GitLab.
@display {label: "GitLab", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [GitLab](https://about.gitlab.com/) account and obtain tokens following [this](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) guide.
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://gitlab.com/api/") returns error? {
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
    # Retrieve version information for this GitLab instance.
    #
    # + return - Successful 
    @display {label: "Get GitLab Instance Version"}
    remote isolated function getVersion() returns VersionResponse|error {
        string resourcePath = string `/v4/version`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        VersionResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List access requests for a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated userr. 
    # + return - Successful 
    @display {label: "List Access Requests"}
    remote isolated function accessrequestsprojectsGet(string id) returns ProjectAccessResponse|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_requests`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProjectAccessResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Requests access for the authenticated user to a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user. 
    # + return - Successful 
    @display {label: "Request Access to a Project"}
    remote isolated function accessrequestsprojectsPost(string id) returns ProjectAccessRequest|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_requests`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProjectAccessRequest response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Approves access for the authenticated user to a project
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user. 
    # + userId - The userID of the access requester 
    # + accessLevel - A valid project access level.  0 = no access , 10 = guest, 20 = reporter, 30 = developer, 40 = Maintainer.  Default is 30.' 
    # + return - Successful 
    @display {label: "Approve Access to User"}
    remote isolated function accessrequestsprojectsapprovePut(string id, int userId, int accessLevel = 30) returns ProjectAccessApprove|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_requests/${getEncodedUri(userId)}/approve`;
        map<anydata> queryParam = {"access_level": accessLevel};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProjectAccessApprove response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Denies a project access request for the given user
    #
    # + id - The ID or URL-encoded path of the project owned by the authenticated user. 
    # + userId - The user ID of the access requester 
    # + return - Successful 
    @display {label: "Reject Access Request from User"}
    remote isolated function accessrequestprojectsdenyDelete(string id, int userId) returns http:Response|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_requests/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List access requests for a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user. 
    # + return - Successful 
    @display {label: "List Access Requests for Group"}
    remote isolated function accessrequestsgroupsGet(string id) returns GroupAccessResponse|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(id)}/access_requests`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupAccessResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Requests access for the authenticated user to a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user. 
    # + return - Successful 
    @display {label: "Request Access to a Group"}
    remote isolated function accessrequestsgroupsPost(string id) returns GroupAccessRequest|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(id)}/access_requests`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GroupAccessRequest response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Approves access for the authenticated user to a group
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user. 
    # + userId - The userID of the access requester 
    # + accessLevel - A valid group access level.  0 = no access , 10 = Guest, 20 = Reporter, 30 = Developer, 40 = Maintainer, 50 = Owner.  Default is 30. 
    # + return - Successful 
    @display {label: "Approve Access Request to a Group"}
    remote isolated function accessrequestsgroupsapprovePut(string id, int userId, int accessLevel = 30) returns GroupAccessApprove|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(id)}/access_requests/${getEncodedUri(userId)}/approve`;
        map<anydata> queryParam = {"access_level": accessLevel};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GroupAccessApprove response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Denies a group access request for the given user
    #
    # + id - The ID or URL-encoded path of the group owned by the authenticated user. 
    # + userId - The userID of the access requester 
    # + return - Successful 
    @display {label: "Delete Access Request to a Group"}
    remote isolated function accessrequestsgroupsdenyDelete(string id, int userId) returns http:Response|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(id)}/access_requests/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List access tokens for a project
    #
    # + id - The ID or URL-encoded path of the project 
    # + return - Successful 
    @display {label: "List Access Tokens for a Project"}
    remote isolated function accesstokensGet(string id) returns AccessToken|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_tokens`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccessToken response = check self.clientEp->get(resourcePath, httpHeaders);
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
    remote isolated function accesstokensPost(string id, string name, string[] scopes, string? expiresAt = ()) returns AccessTokenList|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_tokens`;
        map<anydata> queryParam = {"name": name, "scopes": scopes, "expires_at": expiresAt};
        map<Encoding> queryParamEncoding = {"scopes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        AccessTokenList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Revokes an access token
    #
    # + id - The ID or URL-encoded path of the project 
    # + tokenId - The ID of the project access token 
    # + return - No content if successfully revoked 
    @display {label: "Revoke an Access Token"}
    remote isolated function accesstokensDelete(string id, string tokenId) returns http:Response|error {
        string resourcePath = string `/v4/projects/${getEncodedUri(id)}/access_tokens/${getEncodedUri(tokenId)}'`;
        map<any> headerValues = {"Private-Token": self.apiKeyConfig.privateToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
}
