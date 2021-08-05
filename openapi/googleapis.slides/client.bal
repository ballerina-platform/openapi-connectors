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

# Provides a set of configurations for communicating with a remote HTTP endpoint.
#
# + authConfig - Configurations related to client authentication
# + secureSocketConfig - SSL/TLS-related configurations 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Google Slides API v1](https://developers.google.com/slides/api) OpenAPI specification.
# Google Slides API allow read and write Google Slides presentations.
# For additional help getting started with the API, visit [Google Slides API](https://developers.google.com/slides/api/reference/rest).
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Google Account](https://developer.nytimes.com/accounts/create) 
    # and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://slides.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Creates a blank presentation using the title given in the request. If a `presentationId` is provided, it is used as the ID of the new presentation. Otherwise, a new ID is generated. Other fields in the request, including any provided content, are ignored. Returns the created presentation.
    #
    # + payload - A record of type `Presentation` which contains the necessary data to create a presentation
    # + xgafv - V1 error format
    # + accessToken - OAuth access token
    # + alt - Data format for response
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token
    # + oauthToken - OAuth 2.0 token for the current user
    # + prettyPrint - Returns response with indentations and line breaks
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart")
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart")
    # + return - Successful response
    remote isolated function createSlidesPresentations(Presentation payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Presentation|error {
        string  path = string `/v1/presentations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Presentation response = check self.clientEp->post(path, request, targetType=Presentation);
        return response;
    }
    # Gets the latest version of the specified presentation.
    #
    # + presentationId - The ID of the presentation to retrieve
    # + xgafv - V1 error format
    # + accessToken - OAuth access token
    # + alt - Data format for response
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token
    # + oauthToken - OAuth 2.0 token for the current user
    # + prettyPrint - Returns response with indentations and line breaks
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart")
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart")
    # + return - Successful response
    remote isolated function getSlidesPresentations(string presentationId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Presentation|error {
        string  path = string `/v1/presentations/${presentationId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Presentation response = check self.clientEp-> get(path, targetType = Presentation);
        return response;
    }
    # Gets the latest version of the specified page in the presentation.
    #
    # + presentationId - The ID of the presentation to retrieve
    # + pageObjectId - The object ID of the page to retrieve
    # + xgafv - V1 error format
    # + accessToken - OAuth access token
    # + alt - Data format for response
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token
    # + oauthToken - OAuth 2.0 token for the current user
    # + prettyPrint - Returns response with indentations and line breaks
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart")
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart")
    # + return - Successful response
    remote isolated function getSlidesPresentationsPages(string presentationId, string pageObjectId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Page|error {
        string  path = string `/v1/presentations/${presentationId}/pages/${pageObjectId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Page response = check self.clientEp-> get(path, targetType = Page);
        return response;
    }
    # Generates a thumbnail of the latest version of the specified page in the presentation and returns a URL to the thumbnail image. This request counts as an [expensive read request](/slides/limits) for quota purposes.
    #
    # + presentationId - The ID of the presentation to retrieve
    # + pageObjectId - The object ID of the page whose thumbnail to retrieve
    # + xgafv - V1 error format
    # + accessToken - OAuth access token
    # + alt - Data format for response
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token
    # + oauthToken - OAuth 2.0 token for the current user
    # + prettyPrint - Returns response with indentations and line breaks
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart")
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart")
    # + thumbnailpropertiesMimetype - The optional mime type of the thumbnail image. If you don't specify the mime type, the mime type defaults to PNG
    # + thumbnailpropertiesThumbnailsize - The optional thumbnail image size. If you don't specify the size, the server chooses a default size of the image
    # + return - Successful response
    remote isolated function getSlidesPresentationsPagesThumbnail(string presentationId, string pageObjectId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? thumbnailpropertiesMimetype = (), string? thumbnailpropertiesThumbnailsize = ()) returns Thumbnail|error {
        string  path = string `/v1/presentations/${presentationId}/pages/${pageObjectId}/thumbnail`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "thumbnailProperties.mimeType": thumbnailpropertiesMimetype, "thumbnailProperties.thumbnailSize": thumbnailpropertiesThumbnailsize};
        path = path + check getPathForQueryParam(queryParam);
        Thumbnail response = check self.clientEp-> get(path, targetType = Thumbnail);
        return response;
    }
    # Applies one or more updates to the presentation. Each request is validated before being applied. If any request is not valid, then the entire request will fail and nothing will be applied. Some requests have replies to give you some information about how they are applied. Other requests do not need to return information; these each return an empty reply. The order of replies matches that of the requests. For example, suppose you call batchUpdate with four updates, and only the third one returns information. The response would have two empty replies: the reply to the third request, and another empty reply, in that order. Because other users may be editing the presentation, the presentation might not exactly reflect your changes: your changes may be altered with respect to collaborator changes. If there are no collaborators, the presentation should reflect your changes. In any case, the updates in your request are guaranteed to be applied together atomically.
    #
    # + presentationId - The presentation to apply the updates to
    # + payload - A record of type `BatchUpdatePresentationRequest` which contains the necessary data to make one or more updates to the presentation
    # + xgafv - V1 error format
    # + accessToken - OAuth access token
    # + alt - Data format for response
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token
    # + oauthToken - OAuth 2.0 token for the current user
    # + prettyPrint - Returns response with indentations and line breaks
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart")
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart")
    # + return - Successful response
    remote isolated function batchupdateSlidesPresentations(string presentationId, BatchUpdatePresentationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BatchUpdatePresentationResponse|error {
        string  path = string `/v1/presentations/${presentationId}:batchUpdate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchUpdatePresentationResponse response = check self.clientEp->post(path, request, targetType=BatchUpdatePresentationResponse);
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
