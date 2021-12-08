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

# This is a generated connector for [Instagram Graph API v12.0](https://developers.facebook.com/docs/instagram-api) OpenAPI specification. 
# Instagram is a free photo-sharing application that enables its users to take photos, apply filters, and share them on social networks. The Instagram Graph API is a collection of Facebook Graph API endpoints that allow apps to access data in Instagram Professional accounts (both Business and Creator accounts).
@display {label: "Instagram For Bussiness", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Instagram account](https://www.instagram.com/?hl=en) and obtain tokens by following [this guide](https://developers.facebook.com/docs/instagram-api/overview).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://graph.instagram.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves information about a media object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + fields - A comma-separated list of Fields you want returned. 
    # + return - Success 
    remote isolated function getMediaInfo(string igMediaId, string[]? fields = ()) returns MediaFieldsObject|error {
        string path = string `/${igMediaId}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        MediaFieldsObject response = check self.clientEp->get(path, targetType = MediaFieldsObject);
        return response;
    }
    # Getting Comments on a Media Object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + return - Success 
    remote isolated function getMediaComments(string igMediaId) returns Comments|error {
        string path = string `/${igMediaId}/comments`;
        Comments response = check self.clientEp->get(path, targetType = Comments);
        return response;
    }
    # Creating a Comment on a Media Object
    #
    # + igMediaId - ID of the image, video, or album. 
    # + message - The text to be included in the comment. 
    # + return - Success 
    remote isolated function createComment(string igMediaId, string message) returns Comment|error {
        string path = string `/${igMediaId}/comments`;
        map<anydata> queryParam = {"message": message};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Comment response = check self.clientEp-> post(path, request, targetType = Comment);
        return response;
    }
    # Get insights data on an IG Media object.
    #
    # + igMediaId - ID of the image, video, or album. 
    # + metric - A comma-separated list of Metrics you want returned. 
    # + return - Success 
    remote isolated function getMediaInsights(string igMediaId, string[]? metric = ()) returns MediaMetrics|error {
        string path = string `/${igMediaId}/insights`;
        map<anydata> queryParam = {"metric": metric};
        map<Encoding> queryParamEncoding = {"metric": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        MediaMetrics response = check self.clientEp->get(path, targetType = MediaMetrics);
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
        string path = string `/${igUserId}?fields=business_discovery.username(${username})${fieldset}`;
        BussinessDiscoveryData response = check self.clientEp->get(path, targetType = BussinessDiscoveryData);
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
        string path = string `/${igUserId}/insights`;
        map<anydata> queryParam = {"metric": metric, "period": period, "since": since, "until": until};
        map<Encoding> queryParamEncoding = {"metric": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserMetrics response = check self.clientEp->get(path, targetType = UserMetrics);
        return response;
    }
    # Gets all IG Media objects on an IG User.
    #
    # + igUserId - ID of an IG User who calls the function. 
    # + return - Success 
    remote isolated function getUserMedia(string igUserId) returns Media|error {
        string path = string `/${igUserId}/media`;
        Media response = check self.clientEp->get(path, targetType = Media);
        return response;
    }
    # Returns Fields and Edges on an IG Hashtag.
    #
    # + igHashtagId - The ID of the IG Hashtag. 
    # + fields - A comma-separated list of Fields and Edges you want returned. If omitted, default fields will be returned. 
    # + return - Success 
    remote isolated function getHashtagFields(string igHashtagId, string[]? fields = ()) returns HashtagResponse|error {
        string path = string `/${igHashtagId}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        HashtagResponse response = check self.clientEp->get(path, targetType = HashtagResponse);
        return response;
    }
    # Returns a list of the most recently published photo and video IG Media objects published with a specific hashtag.
    #
    # + igHashtagId - The ID of the IG Hashtag. 
    # + userId - The ID of the IG User performing the query. 
    # + fields - A comma-separated list of Fields you want returned. 
    # + return - Success 
    remote isolated function getRecentHashtagMedia(string igHashtagId, string userId, string[]? fields = ()) returns Media|error {
        string path = string `/${igHashtagId}/recent_media`;
        map<anydata> queryParam = {"user_id": userId, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Media response = check self.clientEp->get(path, targetType = Media);
        return response;
    }
    # Returns the ID of an IG Hashtag.
    #
    # + userId - The ID of the IG User performing the request. 
    # + q - The hashtag name to query. 
    # + return - Success 
    remote isolated function searchHashtag(string userId, string q) returns Hashtags|error {
        string path = string `/ig_hashtag_search`;
        map<anydata> queryParam = {"user_id": userId, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Hashtags response = check self.clientEp-> post(path, request, targetType = Hashtags);
        return response;
    }
}
