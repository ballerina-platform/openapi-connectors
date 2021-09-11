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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Brex Team API v0.1](https://developer.brex.com/openapi/team_api/) OpenAPI specification. 
# Team API lets you manage users, departments, locations and cards.
@display {label: "brex.team", iconPath: "resources/brex.team.svg"}
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
    }
    # List cards
    #
    # + userId - User ID 
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listCardsByUserIdGet 200 response 
    remote isolated function listCardsByUserIdGet(string? userId = (), string? cursor = (), int? 'limit = ()) returns PageCard|error {
        string  path = string `/v2/cards`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PageCard response = check self.clientEp-> get(path, targetType = PageCard);
        return response;
    }
    # Create card
    #
    # + payload - Create card request 
    # + idempotencyKey - Idempotency key 
    # + return - createCardPost 200 response 
    remote isolated function createCardPost(CreateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string  path = string `/v2/cards`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Card response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Card);
        return response;
    }
    # Get card
    #
    # + id - Card ID 
    # + return - getCardByIdGet 200 response 
    remote isolated function getCardByIdGet(string id) returns Card|error {
        string  path = string `/v2/cards/${id}`;
        Card response = check self.clientEp-> get(path, targetType = Card);
        return response;
    }
    # Update card
    #
    # + id - Card ID 
    # + payload - Update card request 
    # + idempotencyKey - Idenmpotency key 
    # + return - updateCardPut 200 response 
    remote isolated function updateCardPut(string id, UpdateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string  path = string `/v2/cards/${id}`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Card response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Card);
        return response;
    }
    # Lock card
    #
    # + id - Card ID 
    # + payload - Lock card request payload 
    # + idempotencyKey - Idempotency key 
    # + return - lockCardPost 200 response 
    remote isolated function lockCardPost(string id, LockCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string  path = string `/v2/cards/${id}/lock`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Card response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Card);
        return response;
    }
    # Get card number
    #
    # + id - Card ID 
    # + return - getCardNumberGet 200 response 
    remote isolated function getCardNumberGet(string id) returns CardNumberResponse|error {
        string  path = string `/v2/cards/${id}/pan`;
        CardNumberResponse response = check self.clientEp-> get(path, targetType = CardNumberResponse);
        return response;
    }
    # Terminate card
    #
    # + id - Card ID 
    # + payload - Terminate card request 
    # + idempotencyKey - Idempotency key 
    # + return - terminateCardPost 200 response 
    remote isolated function terminateCardPost(string id, TerminateCardRequest payload, string? idempotencyKey = ()) returns Card|error {
        string  path = string `/v2/cards/${id}/terminate`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Card response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Card);
        return response;
    }
    # Unlock card
    #
    # + id - Card ID 
    # + payload - Card unlock payload 
    # + idempotencyKey - Idempotency key 
    # + return - unlockCardPost 200 response 
    remote isolated function unlockCardPost(string id, UnlockCardPostRequest payload, string? idempotencyKey = ()) returns Card|error {
        string  path = string `/v2/cards/${id}/unlock`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Card response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Card);
        return response;
    }
    # List departments
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listDepartmentsGet 200 response 
    remote isolated function listDepartmentsGet(string? cursor = (), int? 'limit = ()) returns PageDepartmentresponse|error {
        string  path = string `/v2/departments`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PageDepartmentresponse response = check self.clientEp-> get(path, targetType = PageDepartmentresponse);
        return response;
    }
    # Create department
    #
    # + payload - Create department request 
    # + idempotencyKey - Idempotency key 
    # + return - createDepartmentPost 200 response 
    remote isolated function createDepartmentPost(CreateDepartmentRequest payload, string? idempotencyKey = ()) returns DepartmentResponse|error {
        string  path = string `/v2/departments`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DepartmentResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DepartmentResponse);
        return response;
    }
    # Get department
    #
    # + id - Department ID 
    # + return - getDepartmentByIdGet 200 response 
    remote isolated function getDepartmentByIdGet(string id) returns DepartmentResponse|error {
        string  path = string `/v2/departments/${id}`;
        DepartmentResponse response = check self.clientEp-> get(path, targetType = DepartmentResponse);
        return response;
    }
    # List locations
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listLocationsGet 200 response 
    remote isolated function listLocationsGet(string? cursor = (), int? 'limit = ()) returns PageLocationresponse|error {
        string  path = string `/v2/locations`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PageLocationresponse response = check self.clientEp-> get(path, targetType = PageLocationresponse);
        return response;
    }
    # Create location
    #
    # + payload - Create location request 
    # + idempotencyKey - Idempotency key 
    # + return - createLocationPost 200 response 
    remote isolated function createLocationPost(CreateLocationRequest payload, string? idempotencyKey = ()) returns LocationResponse|error {
        string  path = string `/v2/locations`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LocationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LocationResponse);
        return response;
    }
    # Get location
    #
    # + id - Location ID 
    # + return - getLocationByIdGet 200 response 
    remote isolated function getLocationByIdGet(string id) returns LocationResponse|error {
        string  path = string `/v2/locations/${id}`;
        LocationResponse response = check self.clientEp-> get(path, targetType = LocationResponse);
        return response;
    }
    # List users
    #
    # + cursor - Page cursor 
    # + 'limit - Object limit 
    # + return - listUsersGet 200 response 
    remote isolated function listUsersGet(string? cursor = (), int? 'limit = ()) returns PageUserresponse|error {
        string  path = string `/v2/users`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PageUserresponse response = check self.clientEp-> get(path, targetType = PageUserresponse);
        return response;
    }
    # Invite user
    #
    # + payload - Create user request 
    # + idempotencyKey - Idempotency key 
    # + return - createUserPost 200 response 
    remote isolated function createUserPost(CreateUserRequest payload, string? idempotencyKey = ()) returns UserResponse|error {
        string  path = string `/v2/users`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserResponse);
        return response;
    }
    # Get current user
    #
    # + return - getMeGet 200 response 
    remote isolated function getMeGet() returns UserResponse|error {
        string  path = string `/v2/users/me`;
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    # Get user
    #
    # + id - User ID 
    # + return - getUserByIdGet 200 response 
    remote isolated function getUserByIdGet(string id) returns UserResponse|error {
        string  path = string `/v2/users/${id}`;
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    # Update user
    #
    # + id - User ID 
    # + payload - Update user request 
    # + idempotencyKey - Idempotency key 
    # + return - updateUserPut 200 response 
    remote isolated function updateUserPut(string id, UpdateUserRequest payload, string? idempotencyKey = ()) returns UserResponse|error {
        string  path = string `/v2/users/${id}`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=UserResponse);
        return response;
    }
    # Get limit for the user
    #
    # + id - User ID 
    # + return - getUserLimitGet 200 response 
    remote isolated function getUserLimitGet(string id) returns UserLimitResponse|error {
        string  path = string `/v2/users/${id}/limit`;
        UserLimitResponse response = check self.clientEp-> get(path, targetType = UserLimitResponse);
        return response;
    }
    # Set limit for the user
    #
    # + id - User ID 
    # + payload - Set user limit request 
    # + idempotencyKey - Idempotency key 
    # + return - setUserLimitPost 200 response 
    remote isolated function setUserLimitPost(string id, SetUserLimitRequest payload, string? idempotencyKey = ()) returns UserLimitResponse|error {
        string  path = string `/v2/users/${id}/limit`;
        map<any> headerValues = {"Idempotency-Key": idempotencyKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserLimitResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserLimitResponse);
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
