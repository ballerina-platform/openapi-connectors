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

# This is a generated connector from [Siemens identity management API](https://developer.mindsphere.io/apis/core-identitymanagement/api-identitymanagement-overview.html) OpenAPI Specification.
# The Identity Management API provides a means form managing users, groups and OAuth clients.<br> The user and group management is based on SCIM (System for Cross-domain Identity Management).<br><br> <i>Note:</i> Unless stated otherwise the Identity Management APIs allow each caller only to act within the context of the tenant to which the caller belong's to.</br>
# <i>Note2:</i> UIAM stands for User Identity Access Management, since users and providers are separated in system. Therefore this API documentation is related to users generally.
@display {label: "Siemens Platform Core Identity Management", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a (Siemens MindSphere)(https://siemens.mindsphere.io/en) account and obtain tokens by following [this guide](https://developer.mindsphere.io/howto/howto-selfhosted-api-access.html)
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # List all the groups of a tenant.
    #
    # + filter - SCIM filter for searching see [here](http://www.simplecloud.info/specs/draft-scim-api-01.html). The available filter attributes are: id, displayname, created or meta.created, lastmodified or meta.lastmodified, version or meta.version 
    # + count - Number of objects to be returned (defaults to 100) 
    # + startIndex - The starting index of the search results when paginated. Index starts with 1. 
    # + return - OK 
    remote isolated function listGroups(string? filter = (), decimal count = 100.0, decimal startIndex = 1.0) returns ScimGroupSearchResults|error {
        string resourcePath = string `/Groups`;
        map<anydata> queryParam = {"filter": filter, "count": count, "startIndex": startIndex};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScimGroupSearchResults response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create group
    #
    # + payload - Details of group 
    # + return - Created 
    remote isolated function createGroup(ScimGroupPost payload) returns ScimGroup|error {
        string resourcePath = string `/Groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScimGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get group
    #
    # + id - Id of group 
    # + return - OK 
    remote isolated function getGroup(string id) returns ScimGroup|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}`;
        ScimGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update group.
    #
    # + id - Id of group 
    # + payload - New details 
    # + return - OK 
    remote isolated function updateGroup(string id, ScimGroupPost payload) returns ScimGroup|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScimGroup response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete group
    #
    # + id - Id of the group 
    # + return - OK 
    remote isolated function deleteGroup(string id) returns ScimGroup|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}`;
        ScimGroup response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List members of a group
    #
    # + id - Id of group 
    # + return - OK 
    remote isolated function listGroupMembers(string id) returns ScimGroupMemberList|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}/members`;
        ScimGroupMemberList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member to a group
    #
    # + id - Id of group 
    # + payload - Details of the new member 
    # + return - Created 
    remote isolated function addMemberToGroup(string id, ScimGroupMember payload) returns ScimGroupMember|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScimGroupMember response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete member from a group
    #
    # + id - Id of user group 
    # + memberId - Id of member 
    # + return - OK 
    remote isolated function removeMemberFromGroup(string id, string memberId) returns ScimGroupMember|error {
        string resourcePath = string `/Groups/${getEncodedUri(id)}/members/${getEncodedUri(memberId)}`;
        ScimGroupMember response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List of users of a tenant.
    #
    # + filter - "SCIM filter for searching see [here](http://www.simplecloud.info/specs/draft-scim-api-01.html). The available filter attributes are: id, username, email or emails.value, givenname, familyname, active, phonenumber, verified, origin, created or meta.created, lastmodified or meta.lastmodified, version or meta.version, groups.display. </br> <b>Note</b>: <i>groups.display</i> parameter cannot be used in complex filter expression and only <i>eq</i> operator is allowed eg. <i>filter=groups.display eq "MyGroupName"</i> 
    # + attributes - Comma separated list of attribute names to be returned, e.g., userName, name, meta. The attributes parameters does not support the parameter "subtenants". 
    # + sortBy - Sorting field name, like email or id 
    # + sortOrder - Sort order, ascending/descending (defaults to ascending) 
    # + count - Number of objects to be returned (defaults to 100) 
    # + startIndex - The starting index of the search results when paginated. Index starts with 1 (defaults to 1). 
    # + subtenant - Filter for subtenant users 
    # + return - OK 
    remote isolated function list(string? filter = (), string? attributes = (), string? sortBy = (), string sortOrder = "ascending", decimal count = 100.0, decimal startIndex = 1.0, string? subtenant = ()) returns ScimUserResponseSearchResults|error {
        string resourcePath = string `/Users`;
        map<anydata> queryParam = {"filter": filter, "attributes": attributes, "sortBy": sortBy, "sortOrder": sortOrder, "count": count, "startIndex": startIndex, "subtenant": subtenant};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScimUserResponseSearchResults response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create user
    #
    # + payload - Details of user 
    # + return - Created 
    remote isolated function create(ScimUserPost payload) returns ScimUserPostResponse|error {
        string resourcePath = string `/Users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScimUserPostResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get user
    #
    # + id - Id of user 
    # + return - OK 
    remote isolated function get(string id) returns ScimUserResponse|error {
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
        ScimUserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update user
    #
    # + id - Id of user 
    # + payload - New details 
    # + return - OK 
    remote isolated function update(string id, ScimUserPut payload) returns ScimUserResponse|error {
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScimUserResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete user
    #
    # + id - Id of user 
    # + return - OK 
    remote isolated function delete(string id) returns ScimUserResponse|error {
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
        ScimUserResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get list of groups starting with the prefix "mdsp:" in which the user is a member.
    #
    # + return - OK 
    remote isolated function getUserRoles() returns Group[]|error {
        string resourcePath = string `/Users/me`;
        Group[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get OAuth client details
    #
    # + id - Id of your client. It must be the same as the `client_id` claim in the bearer token. 
    # + return - OK 
    remote isolated function getProviderOAuthClient(string id) returns OAuthClient|error {
        string resourcePath = string `/provider/oauth/clients/${getEncodedUri(id)}`;
        OAuthClient response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update OAuth client's secret
    #
    # + id - Client identifier 
    # + currentSecret - Required, unless your have `prv.oc.sec.admin` scope. It is used to make sure the requestor has permission to modify the given client's secret. 
    # + payload - Parameters of the new secret. 
    # + return - Secret has been changed successfully. 
    remote isolated function updateSecret(string id, ChangeSecretRequest payload, string? currentSecret = ()) returns ChangedSecretResponse|error {
        string resourcePath = string `/provider/oauth/clients/${getEncodedUri(id)}/secrets`;
        map<any> headerValues = {"Current-Secret": currentSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChangedSecretResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Add new OAuth client's secret
    #
    # + id - Client identifier 
    # + currentSecret - Required, unless your have `prv.oc.sec.admin` scope. It is used to make sure the requestor has permission to modify the given client's secret. 
    # + payload - Parameters of the new secret. 
    # + return - Secret has been added successfully. 
    remote isolated function createSecret(string id, ChangeSecretRequest payload, string? currentSecret = ()) returns ChangedSecretResponse|error {
        string resourcePath = string `/provider/oauth/clients/${getEncodedUri(id)}/secrets`;
        map<any> headerValues = {"Current-Secret": currentSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChangedSecretResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete old OAuth client's secret
    #
    # + id - Client identifier 
    # + currentSecret - Required, unless your have `prv.oc.sec.admin` scope. It is used to make sure the requestor has permission to modify the given client's secret. 
    # + return - Older secret has been removed successfully. 
    remote isolated function deleteSecret(string id, string? currentSecret = ()) returns http:Response|error {
        string resourcePath = string `/provider/oauth/clients/${getEncodedUri(id)}/secrets`;
        map<any> headerValues = {"Current-Secret": currentSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
}
