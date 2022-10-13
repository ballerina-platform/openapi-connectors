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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.brex.com/oauth2/v1/token";
|};

# This is a generated connector for [Brex Team API v0.1](https://developer.brex.com/openapi/team_api/) OpenAPI specification. 
# Team API lets you manage users, departments, locations and cards.
@display {label: "brex.team", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Brex account](https://www.brex.com/) and obtain tokens by following [this guide](https://developer.brex.com/docs/authentication/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://platform.staging.brexapps.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List cards
    #
    # + userId - User ID 
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listCardsByUserIdGet 200 response 
    remote isolated function listCardsByUserIdGet(string? userId = (), string? cursor = (), int? 'limit = ()) returns PageCard|error {
        string resourcePath = string `/v2/cards`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageCard response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create card
    #
    # + idempotencyKey - Idempotency key 
    # + payload - Create card request 
    # + return - createCardPost 200 response 
    remote isolated function createCardPost(CreateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string resourcePath = string `/v2/cards`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Card response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get card
    #
    # + id - Card ID 
    # + return - getCardByIdGet 200 response 
    remote isolated function getCardByIdGet(string id) returns Card|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}`;
        Card response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update card
    #
    # + idempotencyKey - Idenmpotency key 
    # + id - Card ID 
    # + payload - Update card request 
    # + return - updateCardPut 200 response 
    remote isolated function updateCardPut(string id, UpdateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Card response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Lock card
    #
    # + idempotencyKey - Idempotency key 
    # + id - Card ID 
    # + payload - Lock card request payload 
    # + return - lockCardPost 200 response 
    remote isolated function lockCardPost(string id, LockCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}/lock`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Card response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get card number
    #
    # + id - Card ID 
    # + return - getCardNumberGet 200 response 
    remote isolated function getCardNumberGet(string id) returns CardNumberResponse|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}/pan`;
        CardNumberResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Terminate card
    #
    # + idempotencyKey - Idempotency key 
    # + id - Card ID 
    # + payload - Terminate card request 
    # + return - terminateCardPost 200 response 
    remote isolated function terminateCardPost(string id, TerminateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}/terminate`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Card response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlock card
    #
    # + idempotencyKey - Idempotency key 
    # + id - Card ID 
    # + payload - Card unlock payload 
    # + return - unlockCardPost 200 response 
    remote isolated function unlockCardPost(string id, json payload, string? idempotencyKey = ()) returns Card|error {
        string resourcePath = string `/v2/cards/${getEncodedUri(id)}/unlock`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Card response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List departments
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listDepartmentsGet 200 response 
    remote isolated function listDepartmentsGet(string? cursor = (), int? 'limit = ()) returns PageDepartmentresponse|error {
        string resourcePath = string `/v2/departments`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageDepartmentresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create department
    #
    # + idempotencyKey - Idempotency key 
    # + payload - Create department request 
    # + return - createDepartmentPost 200 response 
    remote isolated function createDepartmentPost(CreateDepartmentRequest payload, string? idempotencyKey = ()) returns DepartmentResponse|error {
        string resourcePath = string `/v2/departments`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DepartmentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get department
    #
    # + id - Department ID 
    # + return - getDepartmentByIdGet 200 response 
    remote isolated function getDepartmentByIdGet(string id) returns DepartmentResponse|error {
        string resourcePath = string `/v2/departments/${getEncodedUri(id)}`;
        DepartmentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List locations
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listLocationsGet 200 response 
    remote isolated function listLocationsGet(string? cursor = (), int? 'limit = ()) returns PageLocationresponse|error {
        string resourcePath = string `/v2/locations`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageLocationresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create location
    #
    # + idempotencyKey - Idempotency key 
    # + payload - Create location request 
    # + return - createLocationPost 200 response 
    remote isolated function createLocationPost(CreateLocationRequest payload, string? idempotencyKey = ()) returns LocationResponse|error {
        string resourcePath = string `/v2/locations`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LocationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get location
    #
    # + id - Location ID 
    # + return - getLocationByIdGet 200 response 
    remote isolated function getLocationByIdGet(string id) returns LocationResponse|error {
        string resourcePath = string `/v2/locations/${getEncodedUri(id)}`;
        LocationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List users
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listUsersGet 200 response 
    remote isolated function listUsersGet(string? cursor = (), int? 'limit = ()) returns PageUserresponse|error {
        string resourcePath = string `/v2/users`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageUserresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Invite user
    #
    # + idempotencyKey - Idempotency key 
    # + payload - Create user request 
    # + return - createUserPost 200 response 
    remote isolated function createUserPost(CreateUserRequest payload, string? idempotencyKey = ()) returns UserResponse|error {
        string resourcePath = string `/v2/users`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get current user
    #
    # + return - getMeGet 200 response 
    remote isolated function getMeGet() returns UserResponse|error {
        string resourcePath = string `/v2/users/me`;
        UserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user
    #
    # + id - User ID 
    # + return - getUserByIdGet 200 response 
    remote isolated function getUserByIdGet(string id) returns UserResponse|error {
        string resourcePath = string `/v2/users/${getEncodedUri(id)}`;
        UserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update user
    #
    # + idempotencyKey - Idempotency key 
    # + id - User ID 
    # + payload - Update user request 
    # + return - updateUserPut 200 response 
    remote isolated function updateUserPut(string id, UpdateUserRequest payload, string? idempotencyKey = ()) returns UserResponse|error {
        string resourcePath = string `/v2/users/${getEncodedUri(id)}`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get limit for the user
    #
    # + id - User ID 
    # + return - getUserLimitGet 200 response 
    remote isolated function getUserLimitGet(string id) returns UserLimitResponse|error {
        string resourcePath = string `/v2/users/${getEncodedUri(id)}/limit`;
        UserLimitResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set limit for the user
    #
    # + idempotencyKey - Idempotency key 
    # + id - User ID 
    # + payload - Set user limit request 
    # + return - setUserLimitPost 200 response 
    remote isolated function setUserLimitPost(string id, SetUserLimitRequest payload, string? idempotencyKey = ()) returns UserLimitResponse|error {
        string resourcePath = string `/v2/users/${getEncodedUri(id)}/limit`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserLimitResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
