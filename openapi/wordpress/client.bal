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

# This is a generated connector for [WordPress API v1.0](https://developer.wordpress.org/rest-api/) OpenAPI specification.
# The WordPress REST API provides an interface for applications to interact with your WordPress site.  WordPress API provides a rich set of tools and interfaces for building sites, and you should not feel pressured to use the REST API  if your site is already working the way you expect. You do not need to use the REST API to build a WordPress theme or plugin.
@display {label: "WordPress", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [WordPress account](https://login.wordpress.org/register) and obtain tokens by following [this guide](https://developer.wordpress.org/rest-api/using-the-rest-api/authentication/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List Posts
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Posts Listed. 
    remote isolated function getPosts(string? context = ()) returns Post[]|error {
        string resourcePath = string `/posts`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Post[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Post
    #
    # + return - Post created. 
    remote isolated function createPosts(PostsBody payload) returns Post|error {
        string resourcePath = string `/posts`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Post response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Post
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Post retrieved. 
    remote isolated function getSinglePost(string id, string? context = ()) returns Post|error {
        string resourcePath = string `/posts/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Post response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Post
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Post updated. 
    remote isolated function updateSinglePost(string id, PostsIdBody payload, string? context = ()) returns Post|error {
        string resourcePath = string `/posts/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Post response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Post
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Post deleted. 
    remote isolated function deleteSinglePost(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/posts/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get post revisions
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Revisions Listed. 
    remote isolated function getPostRevisions(string id, string? context = ()) returns Revision[]|error {
        string resourcePath = string `/posts/${id}/revisions`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Revision[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get single post revisions
    #
    # + id - Id of object 
    # + revisionid - Id of revision 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Revision retrieved. 
    remote isolated function getSinglePostRevisions(string id, string revisionid, string? context = ()) returns Revision|error {
        string resourcePath = string `/posts/${id}/revisions/${revisionid}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Revision response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete single post revisions
    #
    # + id - Id of object 
    # + revisionid - Id of revision 
    # + return - Revision retrieved. 
    remote isolated function deleteSinglePostRevisions(string id, string revisionid) returns http:Response|error {
        string resourcePath = string `/posts/${id}/revisions/${revisionid}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Pages
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Pages Listed. 
    remote isolated function listPages(string? context = ()) returns Page[]|error {
        string resourcePath = string `/pages`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Page[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Page
    #
    # + return - Page created. 
    remote isolated function createPage(PagesBody payload) returns Page|error {
        string resourcePath = string `/pages`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Page response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Page
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Page retrieved. 
    remote isolated function getSinglePage(string id, string? context = ()) returns Page|error {
        string resourcePath = string `/pages/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Page response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Page
    #
    # + id - Id of object 
    # + return - Page updated. 
    remote isolated function updateSinglePage(string id, PagesIdBody payload) returns Page|error {
        string resourcePath = string `/pages/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Page response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Page
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Post deleted. 
    remote isolated function deleteSinglePage(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/pages/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Media
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Media Listed. 
    remote isolated function listMedia(string? context = ()) returns Media[]|error {
        string resourcePath = string `/media`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Media[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Media
    #
    # + return - Media created. 
    remote isolated function createMedia(MediaBody payload) returns Media|error {
        string resourcePath = string `/media`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Media response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Media
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Page retrieved. 
    remote isolated function getSingleMedia(string id, string? context = ()) returns Media|error {
        string resourcePath = string `/media/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Media response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Media
    #
    # + id - Id of object 
    # + return - Page updated. 
    remote isolated function updateSingleMedia(string id, MediaIdBody payload) returns Media|error {
        string resourcePath = string `/media/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Media response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Media
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Media deleted. 
    remote isolated function delteSingleMedia(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/media/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Type
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Types Listed. 
    remote isolated function listType(string? context = ()) returns Type[]|error {
        string resourcePath = string `/types`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Type[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Single Type
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Type retrieved. 
    remote isolated function getSingleType(string id, string? context = ()) returns Type|error {
        string resourcePath = string `/types/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Status
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Statuses Listed. 
    remote isolated function listStatus(string? context = ()) returns Status[]|error {
        string resourcePath = string `/statuses`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Status[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Single Status
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Status retrieved. 
    remote isolated function getSingleStatus(string id, string? context = ()) returns Status|error {
        string resourcePath = string `/statuses/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Status response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Comments
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Comments Listed. 
    remote isolated function listComments(string? context = ()) returns Comment[]|error {
        string resourcePath = string `/comments`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Comment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Comment
    #
    # + return - Comment created. 
    remote isolated function createComment(CommentsBody payload) returns Comment|error {
        string resourcePath = string `/comments`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Comment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Comment
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Comment retrieved. 
    remote isolated function getSingleComment(string id, string? context = ()) returns Comment|error {
        string resourcePath = string `/comments/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Comment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Comment
    #
    # + id - Id of object 
    # + return - Page updated. 
    remote isolated function updateSingleComment(string id, CommentsIdBody payload) returns Comment|error {
        string resourcePath = string `/comments/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Comment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Comment
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Comment deleted. 
    remote isolated function deleteSingleComment(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/comments/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Taxonomy
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Types Listed. 
    remote isolated function listTaxonomy(string? context = ()) returns Taxonomy[]|error {
        string resourcePath = string `/taxonomies`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Taxonomy[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Single Taxonomy
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Taxonomy retrieved. 
    remote isolated function getSingleTaxonomy(string id, string? context = ()) returns Taxonomy|error {
        string resourcePath = string `/taxonomies/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Taxonomy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List categories
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Category Listed. 
    remote isolated function listCategories(string? context = ()) returns Category[]|error {
        string resourcePath = string `/categories`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Category[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Category
    #
    # + return - Category created. 
    remote isolated function createCategory(CategoriesBody payload) returns Category|error {
        string resourcePath = string `/categories`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Category
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Category retrieved. 
    remote isolated function getSingleCategory(string id, string? context = ()) returns Category|error {
        string resourcePath = string `/categories/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Category
    #
    # + id - Id of object 
    # + return - Category updated. 
    remote isolated function updateSingleCategory(string id, CategoriesIdBody payload) returns Category|error {
        string resourcePath = string `/categories/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Category
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Category deleted. 
    remote isolated function deleteSingleCategory(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/categories/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Tags
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Tags Listed. 
    remote isolated function gettagList(string? context = ()) returns Tag[]|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tag[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Tag
    #
    # + return - Tag created. 
    remote isolated function createTag(TagsBody payload) returns Tag|error {
        string resourcePath = string `/tags`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Tag response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single Tag
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Tag retrieved. 
    remote isolated function getSingleTag(string id, string? context = ()) returns Tag|error {
        string resourcePath = string `/tags/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tag response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single Tag
    #
    # + id - Id of object 
    # + return - Tag updated. 
    remote isolated function updateSingleTag(string id, TagsIdBody payload) returns Tag|error {
        string resourcePath = string `/tags/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Tag response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single Tag
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - Tag deleted. 
    remote isolated function deleteSingleTag(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/tags/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List Users
    #
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - Users Listed. 
    remote isolated function listUsers(string? context = ()) returns User[]|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create User
    #
    # + return - User created. 
    remote isolated function createUser(UsersBody payload) returns User|error {
        string resourcePath = string `/users`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Single User
    #
    # + id - Id of object 
    # + context - Scope under which the request is made; determines fields present in response. 
    # + return - User retrieved. 
    remote isolated function getSingleUser(string id, string? context = ()) returns User|error {
        string resourcePath = string `/users/${id}`;
        map<anydata> queryParam = {"context": context};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Single User
    #
    # + id - Id of object 
    # + return - User updated. 
    remote isolated function updateSingleUser(string id, UsersIdBody payload) returns User|error {
        string resourcePath = string `/users/${id}`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Single User
    #
    # + id - Id of object 
    # + force - Whether to bypass trash and force deletion. 
    # + return - User deleted. 
    remote isolated function deleteSingleUser(string id, boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/users/${id}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
