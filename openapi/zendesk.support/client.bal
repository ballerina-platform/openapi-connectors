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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [Zendesk Support API v2](https://developer.zendesk.com/api-reference/) OpenAPI specification.
# Zendesk Support is a simple system for tracking, prioritizing and solving customer support tickets.
@display {label: "Zendesk Support", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Zendesk account](https://www.zendesk.com/) and obtain tokens by following [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
