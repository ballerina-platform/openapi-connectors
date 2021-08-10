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

# This is a generated connector for [Google Docs API v1.0](https://developers.google.com/docs/api) OpenAPI specification.
# The Docs API provides access to reads and writes Google Docs documents.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://docs.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function docsDocumentsCreate(Document payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Document|error {
        string  path = string `/v1/documents`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Document response = check self.clientEp->post(path, request, targetType=Document);
        return response;
    }
    #
    # + documentId - The ID of the document to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + suggestionsViewMode - The suggestions view mode to apply to the document. This allows viewing the document with all suggestions inline, accepted or rejected. If one is not specified, DEFAULT_FOR_CURRENT_ACCESS is used.
    # + return - Successful response
    remote isolated function docsDocumentsGet(string documentId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? suggestionsViewMode = ()) returns Document|error {
        string  path = string `/v1/documents/${documentId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "suggestionsViewMode": suggestionsViewMode};
        path = path + check getPathForQueryParam(queryParam);
        Document response = check self.clientEp-> get(path, targetType = Document);
        return response;
    }
    #
    # + documentId - The ID of the document to update.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function docsDocumentsBatchupdate(string documentId, BatchUpdateDocumentRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BatchUpdateDocumentResponse|error {
        string  path = string `/v1/documents/${documentId}:batchUpdate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchUpdateDocumentResponse response = check self.clientEp->post(path, request, targetType=BatchUpdateDocumentResponse);
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
