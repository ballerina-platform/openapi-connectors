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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# This is a generated connector for [Google Blogger API v3.0](https://developers.google.com/blogger/docs/3.0/getting_started) OpenAPI specification.
# The Blogger API provides access to posts, comments and pages of a Blogger blog.
@display {label: "Google Blogger", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://blogger.googleapis.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Gets a blog by url.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + url - Blog URL 
    # + view - View type 
    # + return - Successful response 
    remote isolated function getbyurlBloggerBlogs(string url, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? view = ()) returns Blog|error {
        string resourcePath = string `/v3/blogs/byurl`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "url": url, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Blog response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a blog by id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + maxPosts - Maximum posts 
    # + view - View type 
    # + return - Successful response 
    remote isolated function getBloggerBlogs(string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxPosts = (), string? view = ()) returns Blog|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxPosts": maxPosts, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Blog response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists comments by blog.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + endDate - End date 
    # + fetchBodies - Fetch bodies 
    # + maxResults - Maximum results 
    # + pageToken - Page token 
    # + startDate - Start date 
    # + status - Status 
    # + return - Successful response 
    remote isolated function listbyblogBloggerComments(string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endDate = (), boolean? fetchBodies = (), int? maxResults = (), string? pageToken = (), string? startDate = (), string[]? status = ()) returns CommentList|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/comments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "endDate": endDate, "fetchBodies": fetchBodies, "maxResults": maxResults, "pageToken": pageToken, "startDate": startDate, "status": status};
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CommentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists pages.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + fetchBodies - Fetch bodies 
    # + maxResults - Maximum results 
    # + pageToken - Page token 
    # + status - Status 
    # + view - View 
    # + return - Successful response 
    remote isolated function listBloggerPages(string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBodies = (), int? maxResults = (), string? pageToken = (), string[]? status = (), string? view = ()) returns PageList|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchBodies": fetchBodies, "maxResults": maxResults, "pageToken": pageToken, "status": status, "view": view};
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Inserts a page.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + isDraft - Is draft 
    # + payload - Page request 
    # + return - Successful response 
    remote isolated function insertBloggerPages(string blogId, Page payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? isDraft = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "isDraft": isDraft};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Page response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a page by blog id and page id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + view - View type 
    # + return - Successful response 
    remote isolated function getBloggerPages(string blogId, string pageId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? view = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Page response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a page by blog id and page id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + publish - Publish 
    # + revert - Revert 
    # + payload - Page request 
    # + return - Successful response 
    remote isolated function updateBloggerPages(string blogId, string pageId, Page payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? publish = (), boolean? revert = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "publish": publish, "revert": revert};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Page response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a page by blog id and page id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + return - Successful response 
    remote isolated function deleteBloggerPages(string blogId, string pageId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Patches a page.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + publish - Publish 
    # + revert - Revert 
    # + payload - Page request 
    # + return - Successful response 
    remote isolated function patchBloggerPages(string blogId, string pageId, Page payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? publish = (), boolean? revert = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "publish": publish, "revert": revert};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Page response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Publishes a page.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + return - Successful response 
    remote isolated function publishBloggerPages(string blogId, string pageId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}/publish`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Page response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Reverts a published or scheduled page to draft state.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + pageId - Page ID 
    # + return - Successful response 
    remote isolated function revertBloggerPages(string blogId, string pageId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Page|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pages/${getEncodedUri(pageId)}/revert`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Page response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets page views by blog id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + range - Range 
    # + return - Successful response 
    remote isolated function getBloggerPageviews(string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? range = ()) returns Pageviews|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/pageviews`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "range": range};
        map<Encoding> queryParamEncoding = {"range": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Pageviews response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists posts.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + endDate - End date 
    # + fetchBodies - Fetch bodies 
    # + fetchImages - Fetch images 
    # + labels - Labels 
    # + maxResults - Maximum results 
    # + orderBy - Order by 
    # + pageToken - Page token 
    # + startDate - Start date 
    # + status - Status 
    # + view - View 
    # + return - Successful response 
    remote isolated function listBloggerPosts(string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endDate = (), boolean? fetchBodies = (), boolean? fetchImages = (), string? labels = (), int? maxResults = (), string? orderBy = (), string? pageToken = (), string? startDate = (), string[]? status = (), string? view = ()) returns PostList|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "endDate": endDate, "fetchBodies": fetchBodies, "fetchImages": fetchImages, "labels": labels, "maxResults": maxResults, "orderBy": orderBy, "pageToken": pageToken, "startDate": startDate, "status": status, "view": view};
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PostList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Inserts a post.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + fetchBody - Fetch body 
    # + fetchImages - Fetch images 
    # + isDraft - Is draft 
    # + payload - Post request 
    # + return - Successful response 
    remote isolated function insertBloggerPosts(string blogId, Post payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBody = (), boolean? fetchImages = (), boolean? isDraft = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchBody": fetchBody, "fetchImages": fetchImages, "isDraft": isDraft};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Post response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a post by path.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + path - Path 
    # + maxComments - Maximum comments 
    # + view - View 
    # + return - Successful response 
    remote isolated function getbypathBloggerPosts(string blogId, string path, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxComments = (), string? view = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/bypath`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "path": path, "maxComments": maxComments, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Post response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Searches for posts matching given query terms in the specified blog.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + q - q 
    # + fetchBodies - Fetch bodies 
    # + orderBy - Order by 
    # + return - Successful response 
    remote isolated function searchBloggerPosts(string blogId, string q, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBodies = (), string? orderBy = ()) returns PostList|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/search`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "q": q, "fetchBodies": fetchBodies, "orderBy": orderBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PostList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a post by blog id and post id
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + fetchBody - Fetch body 
    # + fetchImages - Fetch images 
    # + maxComments - Maximum comments 
    # + view - View 
    # + return - Successful response 
    remote isolated function getBloggerPosts(string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBody = (), boolean? fetchImages = (), int? maxComments = (), string? view = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchBody": fetchBody, "fetchImages": fetchImages, "maxComments": maxComments, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Post response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a post by blog id and post id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + fetchBody - Fetch body 
    # + fetchImages - Fetch images 
    # + maxComments - Maximum comments 
    # + publish - Publish 
    # + revert - Revert 
    # + payload - Post request 
    # + return - Successful response 
    remote isolated function updateBloggerPosts(string blogId, string postId, Post payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBody = (), boolean? fetchImages = (), int? maxComments = (), boolean? publish = (), boolean? revert = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchBody": fetchBody, "fetchImages": fetchImages, "maxComments": maxComments, "publish": publish, "revert": revert};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Post response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a post by blog id and post id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + return - Successful response 
    remote isolated function deleteBloggerPosts(string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Patches a post.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + fetchBody - Fetch body 
    # + fetchImages - Fetch images 
    # + maxComments - Maximum comments 
    # + publish - Publish 
    # + revert - Revert 
    # + payload - Post request 
    # + return - Successful response 
    remote isolated function patchBloggerPosts(string blogId, string postId, Post payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchBody = (), boolean? fetchImages = (), int? maxComments = (), boolean? publish = (), boolean? revert = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchBody": fetchBody, "fetchImages": fetchImages, "maxComments": maxComments, "publish": publish, "revert": revert};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Post response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Lists comments.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + endDate - End date 
    # + fetchBodies - Fetch bodies 
    # + maxResults - Maximum results 
    # + pageToken - Page token 
    # + startDate - Start date 
    # + status - Status 
    # + view - View type 
    # + return - Successful response 
    remote isolated function listBloggerComments(string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endDate = (), boolean? fetchBodies = (), int? maxResults = (), string? pageToken = (), string? startDate = (), string? status = (), string? view = ()) returns CommentList|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "endDate": endDate, "fetchBodies": fetchBodies, "maxResults": maxResults, "pageToken": pageToken, "startDate": startDate, "status": status, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CommentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a comment by id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + commentId - Comment ID 
    # + view - View 
    # + return - Successful response 
    remote isolated function getBloggerComments(string blogId, string postId, string commentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? view = ()) returns Comment|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments/${getEncodedUri(commentId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Comment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a comment by blog id, post id and comment id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + commentId - Comment ID 
    # + return - Successful response 
    remote isolated function deleteBloggerComments(string blogId, string postId, string commentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments/${getEncodedUri(commentId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Marks a comment as not spam by blog id, post id and comment id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + commentId - Comment ID 
    # + return - Successful response 
    remote isolated function approveBloggerComments(string blogId, string postId, string commentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Comment|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments/${getEncodedUri(commentId)}/approve`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Comment response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Removes the content of a comment by blog id, post id and comment id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + commentId - Comment ID 
    # + return - Successful response 
    remote isolated function removecontentBloggerComments(string blogId, string postId, string commentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Comment|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments/${getEncodedUri(commentId)}/removecontent`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Comment response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Marks a comment as spam by blog id, post id and comment id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + commentId - Comment ID 
    # + return - Successful response 
    remote isolated function markasspamBloggerComments(string blogId, string postId, string commentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Comment|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/comments/${getEncodedUri(commentId)}/spam`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Comment response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Publishes a post.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + publishDate - Publish date 
    # + return - Successful response 
    remote isolated function publishBloggerPosts(string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? publishDate = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/publish`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "publishDate": publishDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Post response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Reverts a published or scheduled post to draft state.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + return - Successful response 
    remote isolated function revertBloggerPosts(string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Post|error {
        string resourcePath = string `/v3/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}/revert`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Post response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets one user by user_id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - User ID 
    # + return - Successful response 
    remote isolated function getBloggerUsers(string userId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns User|error {
        string resourcePath = string `/v3/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists blogs by user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - User ID 
    # + fetchUserInfo - Fetch user information 
    # + role - Role 
    # + status - Default value of status is LIVE. 
    # + view - View type 
    # + return - Successful response 
    remote isolated function listbyuserBloggerBlogs(string userId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? fetchUserInfo = (), string[]? role = (), string[]? status = (), string? view = ()) returns BlogList|error {
        string resourcePath = string `/v3/users/${getEncodedUri(userId)}/blogs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "fetchUserInfo": fetchUserInfo, "role": role, "status": status, "view": view};
        map<Encoding> queryParamEncoding = {"role": {style: FORM, explode: true}, "status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BlogList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets one blog and user info pair by blog id and user id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - User ID 
    # + blogId - Blog ID 
    # + maxPosts - Maximum posts 
    # + return - Successful response 
    remote isolated function getBloggerBloguserinfos(string userId, string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxPosts = ()) returns BlogUserInfo|error {
        string resourcePath = string `/v3/users/${getEncodedUri(userId)}/blogs/${getEncodedUri(blogId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxPosts": maxPosts};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BlogUserInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists post and user info pairs.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - User ID 
    # + blogId - Blog ID 
    # + endDate - End date 
    # + fetchBodies - Fetch bodies 
    # + labels - Labels 
    # + maxResults - Maximum results 
    # + orderBy - Order by 
    # + pageToken - Page token 
    # + startDate - Start date 
    # + status - Status 
    # + view - View type 
    # + return - Successful response 
    remote isolated function listBloggerPostuserinfos(string userId, string blogId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endDate = (), boolean? fetchBodies = (), string? labels = (), int? maxResults = (), string? orderBy = (), string? pageToken = (), string? startDate = (), string[]? status = (), string? view = ()) returns PostUserInfosList|error {
        string resourcePath = string `/v3/users/${getEncodedUri(userId)}/blogs/${getEncodedUri(blogId)}/posts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "endDate": endDate, "fetchBodies": fetchBodies, "labels": labels, "maxResults": maxResults, "orderBy": orderBy, "pageToken": pageToken, "startDate": startDate, "status": status, "view": view};
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PostUserInfosList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets one post and user info pair, by post_id and user_id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - User ID 
    # + blogId - Blog ID 
    # + postId - Post ID 
    # + maxComments - Maximum Comments 
    # + return - Successful response 
    remote isolated function getBloggerPostuserinfos(string userId, string blogId, string postId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxComments = ()) returns PostUserInfo|error {
        string resourcePath = string `/v3/users/${getEncodedUri(userId)}/blogs/${getEncodedUri(blogId)}/posts/${getEncodedUri(postId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxComments": maxComments};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PostUserInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
}
