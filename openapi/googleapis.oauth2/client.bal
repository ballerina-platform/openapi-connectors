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

# This is a generated connector for [Google OAuth2 API v2.0](https://developers.google.com/identity/protocols/oauth2/) OpenAPI specification.
# Obtains end-user authorization grants for use with other Google APIs.
@display {label: "Google OAuth2", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens following [this guide](https://developers.google.com/identity/protocols/oauth2)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    #
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getOAuth2TokenInfo(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? accessToken = (), string? idToken = ()) returns Tokeninfo|error {
        string resourcePath = string `/oauth2/v2/tokeninfo`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "access_token": accessToken, "id_token": idToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Tokeninfo response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getOAuth2UserInfo(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Userinfo|error {
        string resourcePath = string `/oauth2/v2/userinfo`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Userinfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + prettyPrint - Returns response with indentations and line breaks. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getMyOAuth2UserInfo(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Userinfo|error {
        string resourcePath = string `/userinfo/v2/me`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Userinfo response = check self.clientEp->get(resourcePath);
        return response;
    }
}
