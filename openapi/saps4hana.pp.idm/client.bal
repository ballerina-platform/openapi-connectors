// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    http:OAuth2ClientCredentialsGrantConfig auth;
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

# This is a generated connector for [SAP S/4HANA Procurement Planning System for Cross-domain Identity Management API v1.0.0](https://api.sap.com/api/SCIMService/overview) OpenAPI specification. 
# This service allows to read and write user data. It will be used by the Identity Provisioning Service. The SCIM Service is protected by the Identity Authentication Service, so the customer must configure the authentication in the Identity Provisioning Service.
@display {label: "SAPS4HANA Cross-domain Identity Management", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieves all users.
    #
    # + return - Retrieved entities. 
    remote isolated function getAllUsers() returns ReadMultipleUsers[]|error {
        string resourcePath = string `/Users`;
        ReadMultipleUsers[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new user.
    #
    # + payload - User object 
    # + return - Created. 
    remote isolated function addNewUser(User payload) returns http:Response|error {
        string resourcePath = string `/Users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the user.
    #
    # + id - ID of the user that will be created. 
    # + return - Retrieved entities. 
    remote isolated function getUserById(string id) returns ReadSingleUser|error {
        string resourcePath = string `/Users/${id}`;
        ReadSingleUser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the user.
    #
    # + id - ID of the user that will be updated. 
    # + payload - User details 
    # + return - Retrieved entities. 
    remote isolated function updateUserById(string id, User payload) returns User|error {
        string resourcePath = string `/Users/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a user from the system.
    #
    # + id - ID of the user that will be deleted. 
    # + return - The task was successfully completed and the context was updated. 
    remote isolated function deleteUserById(string id) returns Success204|error {
        string resourcePath = string `/Users/${id}`;
        Success204 response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
