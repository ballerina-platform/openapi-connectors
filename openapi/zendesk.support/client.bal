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

# This is a generated connector for [Zendesk Support API v2](https://developer.zendesk.com/api-reference/) OpenAPI specification.
# Zendesk Support is a simple system for tracking, prioritizing and solving customer support tickets.
@display {label: "Zendesk Support", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Zendesk account](https://www.zendesk.com/) and obtain tokens by following [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).
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
    # List Users.
    #
    # + return - Returns list of users available 
    remote isolated function listUsers() returns Users|error {
        string resourcePath = string `/api/v2/users.json`;
        Users response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create User.
    #
    # + payload - The information for create user request 
    # + return - Returns detail of user created 
    remote isolated function createUser(CreateUserInfo payload) returns User|error {
        string resourcePath = string `/api/v2/users.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search Users.
    #
    # + query - Query 
    # + return - Returns users matching the searchable string 
    remote isolated function searchUsers(string? query = ()) returns json|error {
        string resourcePath = string `/api/v2/search.json`;
        map<anydata> queryParam = {"query": query};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get User By Id.
    #
    # + userId - User Id 
    # + return - Returns user belong to the user id 
    remote isolated function getUserById(string userId) returns User|error {
        string resourcePath = string `/api/v2/users/${getEncodedUri(userId)}.json`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete User By Id.
    #
    # + userId - User Id 
    # + return - Returns detail of user deleted 
    remote isolated function deleteUserById(string userId) returns User|error {
        string resourcePath = string `/api/v2/users/${getEncodedUri(userId)}.json`;
        User response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Tickets.
    #
    # + return - Returns list of tickets available 
    remote isolated function listTickets() returns Tickets|error {
        string resourcePath = string `/api/v2/tickets.json`;
        Tickets response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Ticket.
    #
    # + payload - The information for create ticket request 
    # + return - Returns detail of created ticket 
    remote isolated function createTicket(CreateTicketInfo payload) returns Ticket|error {
        string resourcePath = string `/api/v2/tickets.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Ticket response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update Ticket.
    #
    # + ticketId - Ticket Id 
    # + payload - The information for update ticket request 
    # + return - Returns deatil of updated ticket by ticket id 
    remote isolated function updateTicket(string ticketId, UpdateTicketInfo payload) returns json|error {
        string resourcePath = string `/api/v2/tickets/${getEncodedUri(ticketId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create Organization.
    #
    # + payload - The information for create organization request 
    # + return - Organization created 
    remote isolated function createOrganization(CreateOrganizationInfo payload) returns Organization|error {
        string resourcePath = string `/api/v2/organizations.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
