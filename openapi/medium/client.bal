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

# This is a generated connector for [Medium API v1](https://github.com/Medium/medium-api-docs) OpenAPI Specification.
# Medium’s Publishing API provides capability to access the Medium network, create your content on Medium from  anywhere you write, and expand your audience and your influence.
@display {label: "Medium", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Medium account](https://medium.com/)  and obtain tokens following [this guide](https://github.com/Medium/medium-api-docs#2-authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.medium.com/v1") returns error? {
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
    # Get the authenticated user’s details
    #
    # + return - If success returns details of the user who has granted permission to the application otherwise the relevant error 
    remote isolated function getUserDetail() returns UserResponse|error {
        string resourcePath = string `/me`;
        UserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List the user’s publications
    #
    # + userId - A unique identifier for the user. 
    # + return - If success returns a list of publications that the user is subscribed to, writes to, or edits otherwise the relevant error 
    remote isolated function getPublicationList(string userId) returns PublicationResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/publications`;
        PublicationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List contributors for a given publication
    #
    # + publicationId - A unique identifier for the publication. 
    # + return - If success returns a list of contributors 
    remote isolated function getContributorList(string publicationId) returns ContributorResponse|error {
        string resourcePath = string `/publications/${getEncodedUri(publicationId)}/contributors`;
        ContributorResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a post on the authenticated user’s profile
    #
    # + authorId - authorId is the user id of the authenticated user. 
    # + payload - Creates a post for user. 
    # + return - If success returns a Post record that includes the newly created post detail otherwise the relevant error 
    remote isolated function createUserPost(string authorId, Post payload) returns PostResponse|error {
        string resourcePath = string `/users/${getEncodedUri(authorId)}/posts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PostResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
