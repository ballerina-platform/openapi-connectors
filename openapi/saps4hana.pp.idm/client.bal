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

# This is a generated connector for [SAP S/4HANA Procurement Planning System for Cross-domain Identity Management API v1.0.0](https://api.sap.com/api/SCIMService/overview) OpenAPI specification. 
# This service allows to read and write user data. It will be used by the Identity Provisioning Service. The SCIM Service is protected by the Identity Authentication Service, so the customer must configure the authentication in the Identity Provisioning Service.
@display {label: "SAPS4HANA Cross-domain Identity Management", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
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
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
        ReadSingleUser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the user.
    #
    # + id - ID of the user that will be updated. 
    # + payload - User details 
    # + return - Retrieved entities. 
    remote isolated function updateUserById(string id, User payload) returns User|error {
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
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
        string resourcePath = string `/Users/${getEncodedUri(id)}`;
        Success204 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
