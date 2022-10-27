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

# This is a generated connector for [Google OAuth2 API v2.0](https://developers.google.com/identity/protocols/oauth2/) OpenAPI specification.
# Obtains end-user authorization grants for use with other Google APIs.
@display {label: "Google OAuth2", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens following [this guide](https://developers.google.com/identity/protocols/oauth2)
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://www.googleapis.com/") returns error? {
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
