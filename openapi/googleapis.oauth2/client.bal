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
import ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Google OAuth2 API v2.0](https://developers.google.com/identity/protocols/oauth2/) OpenAPI specification.
# Obtains end-user authorization grants for use with other Google APIs.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens following [this guide](https://developers.google.com/identity/protocols/oauth2)
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
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
    remote isolated function oauth2Tokeninfo(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = (), string? accessToken = (), string? idToken = ()) returns Tokeninfo|error {
        string  path = string `/oauth2/v2/tokeninfo`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp, "access_token": accessToken, "id_token": idToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Tokeninfo response = check self.clientEp-> post(path, request, targetType = Tokeninfo);
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
    remote isolated function oauth2UserinfoGet(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Userinfo|error {
        string  path = string `/oauth2/v2/userinfo`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        Userinfo response = check self.clientEp-> get(path, targetType = Userinfo);
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
    remote isolated function oauth2UserinfoV2MeGet(string? alt = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? userIp = ()) returns Userinfo|error {
        string  path = string `/userinfo/v2/me`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        Userinfo response = check self.clientEp-> get(path, targetType = Userinfo);
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
