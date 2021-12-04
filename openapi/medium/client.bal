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

# This is a generated connector for [Medium API v1](https://github.com/Medium/medium-api-docs) OpenAPI Specification.
# Medium’s Publishing API provides capability to access the Medium network, create your content on Medium from  anywhere you write, and expand your audience and your influence.
@display {label: "Medium", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Medium account](https://medium.com/) and obtain tokens following [this guide](https://github.com/Medium/medium-api-docs#2-authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.medium.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get the authenticated user’s details
    #
    # + return - If success returns details of the user who has granted permission to the application otherwise the relevant error 
    remote isolated function getUserDetail() returns UserResponse|error {
        string  path = string `/me`;
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    # List the user’s publications
    #
    # + userId - A unique identifier for the user. 
    # + return - If success returns a list of publications that the user is subscribed to, writes to, or edits otherwise the relevant error 
    remote isolated function getPublicationList(string userId) returns PublicationResponse|error {
        string  path = string `/users/${userId}/publications`;
        PublicationResponse response = check self.clientEp-> get(path, targetType = PublicationResponse);
        return response;
    }
    # List contributors for a given publication
    #
    # + publicationId - A unique identifier for the publication. 
    # + return - If success returns a list of contributors 
    remote isolated function getContributorList(string publicationId) returns ContributorResponse|error {
        string  path = string `/publications/${publicationId}/contributors`;
        ContributorResponse response = check self.clientEp-> get(path, targetType = ContributorResponse);
        return response;
    }
    # Creates a post on the authenticated user’s profile
    #
    # + authorId - authorId is the user id of the authenticated user. 
    # + payload - Creates a post for user. 
    # + return - If success returns a Post record that includes the newly created post detail otherwise the relevant error 
    remote isolated function createUserPost(string authorId, Post payload) returns PostResponse|error {
        string  path = string `/users/${authorId}/posts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostResponse response = check self.clientEp->post(path, request, targetType=PostResponse);
        return response;
    }
}
