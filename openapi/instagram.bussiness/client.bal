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

# This is a generated connector for [Instagram Graph API v12.0](https://developers.facebook.com/docs/instagram-api) OpenAPI specification. 
# Instagram is a free photo-sharing application that enables its users to take photos, apply filters, and share them on social networks. The Instagram Graph API is a collection of Facebook Graph API endpoints that allow apps to access data in Instagram Professional accounts (both Business and Creator accounts).
@display {label: "Instagram For Bussiness", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Instagram account](https://www.instagram.com/?hl=en) and obtain tokens by following [this guide](https://developers.facebook.com/docs/instagram-api/overview).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://graph.instagram.com/") returns error? {
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
    # Retrieves information about a media object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + fields - A comma-separated list of Fields you want returned. 
    # + return - Success 
    remote isolated function getMediaInfo(string igMediaId, string[]? fields = ()) returns MediaFieldsObject|error {
        string resourcePath = string `/${getEncodedUri(igMediaId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MediaFieldsObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Getting Comments on a Media Object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + return - Success 
    remote isolated function getMediaComments(string igMediaId) returns Comments|error {
        string resourcePath = string `/${getEncodedUri(igMediaId)}/comments`;
        Comments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creating a Comment on a Media Object
    #
    # + igMediaId - ID of the image, video, or album. 
    # + message - The text to be included in the comment. 
    # + return - Success 
    remote isolated function createComment(string igMediaId, string message) returns Comment|error {
        string resourcePath = string `/${getEncodedUri(igMediaId)}/comments`;
        map<anydata> queryParam = {"message": message};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Comment response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get insights data on an IG Media object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + metric - A comma-separated list of Metrics you want returned. 
    # + return - Success 
    remote isolated function getMediaInsights(string igMediaId, string[]? metric = ()) returns MediaMetrics|error {
        string resourcePath = string `/${getEncodedUri(igMediaId)}/insights`;
        map<anydata> queryParam = {"metric": metric};
        map<Encoding> queryParamEncoding = {"metric": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MediaMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns data about another Instagram Business or Creator IG User. 
    # 
    # Perform this request on the Instagram Business or Creator IG User who is making the query, and identify the 
    # targeted business with the username parameter.
    #
    # + igUserId - ID of an IG User who calls the function. 
    # + username - The username of the Instagram Business or Creator IG User you want to get data about. 
    # + fieldset - A comma-separated list of Fields you want returned. 
    # + return - Success 
    remote isolated function getUserData(string igUserId, string username, string fieldset) returns BussinessDiscoveryData|error {
        string resourcePath = string `/${getEncodedUri(igUserId)}?fields=business_discovery.username(${getEncodedUri(username)})${getEncodedUri(fieldset)}`;
        BussinessDiscoveryData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns insights on an IG User.
    #
    # + igUserId - ID of an IG User who calls the function. 
    # + metric - A comma-separated list of Metrics you want returned. If requesting multiple metrics, they must all have the same compatible Period. 
    # + period - A Period that is compatible with the metrics you are requesting. 
    # + since - Used in conjunction with {until} to define a Range. If you omit since and until, the API defaults to a 2 day range - yesterday through today. 
    # + until - Used in conjunction with {since} to define a Range. If you omit since and until, the API defaults to a 2 day range - yesterday through today. 
    # + return - Success 
    remote isolated function getUserInsights(string igUserId, string period, int since, int until, string[]? metric = ()) returns UserMetrics|error {
        string resourcePath = string `/${getEncodedUri(igUserId)}/insights`;
        map<anydata> queryParam = {"metric": metric, "period": period, "since": since, "until": until};
        map<Encoding> queryParamEncoding = {"metric": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all IG Media objects on an IG User.
    #
    # + igUserId - ID of an IG User who calls the function. 
    # + return - Success 
    remote isolated function getUserMedia(string igUserId) returns Media|error {
        string resourcePath = string `/${getEncodedUri(igUserId)}/media`;
        Media response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns Fields and Edges on an IG Hashtag.
    #
    # + igHashtagId - The ID of the IG Hashtag. 
    # + fields - A comma-separated list of Fields and Edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getHashtagFields(string igHashtagId, string[]? fields = ()) returns HashtagResponse|error {
        string resourcePath = string `/${getEncodedUri(igHashtagId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        HashtagResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of the most recently published photo and video IG Media objects published with a specific hashtag.
    #
    # + igHashtagId - The ID of the IG Hashtag. 
    # + userId - The ID of the IG User performing the query. 
    # + fields - A comma-separated list of Fields you want returned. 
    # + return - Success 
    remote isolated function getRecentHashtagMedia(string igHashtagId, string userId, string[]? fields = ()) returns Media|error {
        string resourcePath = string `/${getEncodedUri(igHashtagId)}/recent_media`;
        map<anydata> queryParam = {"user_id": userId, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Media response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the ID of an IG Hashtag.
    #
    # + userId - The ID of the IG User performing the request. 
    # + q - The hashtag name to query. 
    # + return - Success 
    remote isolated function searchHashtag(string userId, string q) returns Hashtags|error {
        string resourcePath = string `/ig_hashtag_search`;
        map<anydata> queryParam = {"user_id": userId, "q": q};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Hashtags response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
