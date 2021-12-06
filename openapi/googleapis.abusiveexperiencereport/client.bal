// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [Google Abusive Experience Report API v1](https://developers.google.com/abusive-experience-report/) OpenAPI specification.
# Views Abusive Experience Report data, and gets a list of sites that have a significant number of abusive experiences.
@display {label: "Google Abusive Experience", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/abusive-experience-report/v1/how-tos/authorizing).
    # Some operations may require passing the token as a parameter.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://abusiveexperiencereport.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists sites that are failing in the Abusive Experience Report.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function listViolatingsites(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ViolatingSitesResponse|error {
        string  path = string `/v1/violatingSites`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ViolatingSitesResponse response = check self.clientEp-> get(path, targetType = ViolatingSitesResponse);
        return response;
    }
    # Gets a site's Abusive Experience Report summary.
    #
    # + name - Required. The name of the site whose summary to get, e.g. `sites/http%3A%2F%2Fwww.google.com%2F`. Format: `sites/{site}`
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getSites(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns SiteSummaryResponse|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        SiteSummaryResponse response = check self.clientEp-> get(path, targetType = SiteSummaryResponse);
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
