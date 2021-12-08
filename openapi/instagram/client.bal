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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents Access Token  `access_token`
    string accessToken;
|};

# This is a generated connector for [Instagram Basic Display API v12.0](https://developers.facebook.com/docs/instagram-basic-display-api) OpenAPI specification. 
# Instagram is a free photo-sharing application that enables its users to take photos, apply filters, and share them on social networks. The Instagram Basic Display API allows users of your app to get basic profile information, photos, and videos in their Instagram accounts.
@display {label: "Instagram", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Instagram account](https://www.instagram.com/?hl=en) and obtain tokens by following [this guide](https://developers.facebook.com/docs/instagram-basic-display-api/overview#instagram-user-access-tokens).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://graph.instagram.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get fields and edges on an image, video, or album.
    #
    # + mediaId - ID of the image, video, or album. 
    # + fields - A list of fields and edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getMedia(string mediaId, string[]? fields = ()) returns MediaFieldsObject|error {
        string path = string `/${mediaId}`;
        map<anydata> queryParam = {"fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        MediaFieldsObject response = check self.clientEp->get(path, targetType = MediaFieldsObject);
        return response;
    }
    # Get a list of images and videos on an album..
    #
    # + albumId - ID of the image, video, or album. 
    # + fields - A list of fields and edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getAlbumMedia(string albumId, string[]? fields = ()) returns Media|error {
        string path = string `/${albumId}/children`;
        map<anydata> queryParam = {"fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Media response = check self.clientEp->get(path, targetType = Media);
        return response;
    }
    # Get a collection of Media on a User.
    #
    # + apiVersion - API version. 
    # + userId - App user's app-scoped user ID (version 11.0+) or raw user ID (all versions). 
    # + fields - A list of fields and edges you want returned. If omitted, default fields will be returned. 
    # + since - A Unix timestamp or strtotime data value that points to the start of a range of time-based data. 
    # + until - A Unix timestamp or strtotime data value that points to the end of a range of time-based data. 
    # + return - Success 
    remote isolated function getUserMedia(string apiVersion, string userId, string[]? fields = (), string? since = (), string? until = ()) returns Media|error {
        string path = string `/${apiVersion}/${userId}/media`;
        map<anydata> queryParam = {"fields": fields, "since": since, "until": until, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Media response = check self.clientEp->get(path, targetType = Media);
        return response;
    }
    # Get fields and edges on the User whose Instagram User Access Token is being used in the query.
    #
    # + fields - A list of fields and edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getMyFields(string[]? fields = ()) returns UserFieldsObject|error {
        string path = string `/me`;
        map<anydata> queryParam = {"fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserFieldsObject response = check self.clientEp->get(path, targetType = UserFieldsObject);
        return response;
    }
    # Get fields and edges on a User.
    #
    # + apiVersion - API version. 
    # + userId - App user's app-scoped user ID (version 11.0+) or raw user ID (all versions). 
    # + fields - A list of fields and edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getUserFields(string apiVersion, string userId, string[]? fields = ()) returns UserFieldsObject|error {
        string path = string `/${apiVersion}/${userId}`;
        map<anydata> queryParam = {"fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserFieldsObject response = check self.clientEp->get(path, targetType = UserFieldsObject);
        return response;
    }
}
