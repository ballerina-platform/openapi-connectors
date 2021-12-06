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
    # All requests on this API needs to include an API key.  The API key can be provided as part of the query string or as a request header.  The name of the API key needs to be `api-key`
    # Authentication for some endpoints, like write operations on the Articles API require a DEV API key.
    # ### Getting an API key
    # To obtain one, please follow these steps:
    # 
    #   - visit https://dev.to/settings/account
    #   - in the "DEV API Keys" section create a new key by adding a
    #     description and clicking on "Generate API Key"
    # 
    #     ![obtain a DEV API Key](https://user-images.githubusercontent.com/146201/64421366-af3f8b00-d0a1-11e9-8ff6-7cc0ca6e854e.png)
    #   - You'll see the newly generated key in the same view
    #     ![generated DEV API Key](https://user-images.githubusercontent.com/146201/64421367-af3f8b00-d0a1-11e9-9831-73d3bdfdff66.png)
    string apiKey;
|};

# This is a generated connector for [DEV API v0.9.7](https://developers.forem.com/api/) OpenAPI specification.
# Access Forem articles, users and other resources via API.
# For a real-world example of Forem in action, check out [DEV](https://www.dev.to).
# All endpoints that don't require authentication are CORS enabled.
# Dates and date times, unless otherwise specified, must be inthe [RFC 3339](https://tools.ietf.org/html/rfc3339) format.
@display {label: "dev.to", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [DEVto Account](https://dev.to/settings/account)  and obtain tokens by log into [DEV Account](https://www.interzoid.com/account).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://dev.to/api") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Published articles
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + tag - Using this parameter will retrieve articles that contain the requested tag. Articles will be ordered by descending popularity. This parameter can be used in conjuction with `top`. 
    # + tags - Using this parameter will retrieve articles with any of the comma-separated tags. Articles will be ordered by descending popularity. 
    # + tagsExclude - Using this parameter will retrieve articles that do _not_ contain _any_ of comma-separated tags. Articles will be ordered by descending popularity. 
    # + username - Using this parameter will retrieve articles belonging to a User or Organization ordered by descending publication date. If `state=all` the number of items returned will be `1000` instead of the default `30`. This parameter can be used in conjuction with `state`. 
    # + state - Using this parameter will allow the client to check which articles are fresh or rising. If `state=fresh` the server will return fresh articles. If `state=rising` the server will return rising articles. This param can be used in conjuction with `username`, only if set to `all`. 
    # + top - Using this parameter will allow the client to return the most popular articles in the last `N` days. `top` indicates the number of days since publication of the articles returned. This param can be used in conjuction with `tag`. 
    # + collectionId - Adding this will allow the client to return the list of articles belonging to the requested collection, ordered by ascending publication date. 
    # + return - A list of articles 
    remote isolated function getArticles(int page = 1, int perPage = 30, string? tag = (), string? tags = (), string? tagsExclude = (), string? username = (), string? state = (), int? top = (), int? collectionId = ()) returns ArticleIndex[]|error {
        string  path = string `/articles`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "tag": tag, "tags": tags, "tags_exclude": tagsExclude, "username": username, "state": state, "top": top, "collection_id": collectionId};
        path = path + check getPathForQueryParam(queryParam);
        ArticleIndex[] response = check self.clientEp-> get(path, targetType = ArticleIndexArr);
        return response;
    }
    # Create a new article
    #
    # + payload - Article to create 
    # + return - A newly created article 
    remote isolated function createArticle(ArticleCreate payload) returns ArticleShow|error {
        string  path = string `/articles`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ArticleShow response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ArticleShow);
        return response;
    }
    # Published articles sorted by publish date
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of articles sorted by descending publish date 
    remote isolated function getLatestArticles(int page = 1, int perPage = 30) returns ArticleIndex[]|error {
        string  path = string `/articles/latest`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        ArticleIndex[] response = check self.clientEp-> get(path, targetType = ArticleIndexArr);
        return response;
    }
    # User's articles
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of published articles 
    remote isolated function getUserArticles(int page = 1, int perPage = 30) returns ArticleMe[]|error {
        string  path = string `/articles/me`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArticleMe[] response = check self.clientEp-> get(path, accHeaders, targetType = ArticleMeArr);
        return response;
    }
    # User's all articles
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of articles 
    remote isolated function getUserAllArticles(int page = 1, int perPage = 30) returns ArticleMe[]|error {
        string  path = string `/articles/me/all`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArticleMe[] response = check self.clientEp-> get(path, accHeaders, targetType = ArticleMeArr);
        return response;
    }
    # User's published articles
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of published articles 
    remote isolated function getUserPublishedArticles(int page = 1, int perPage = 30) returns ArticleMe[]|error {
        string  path = string `/articles/me/published`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArticleMe[] response = check self.clientEp-> get(path, accHeaders, targetType = ArticleMeArr);
        return response;
    }
    # User's unpublished articles
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of articles 
    remote isolated function getUserUnpublishedArticles(int page = 1, int perPage = 30) returns ArticleMe[]|error {
        string  path = string `/articles/me/unpublished`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArticleMe[] response = check self.clientEp-> get(path, accHeaders, targetType = ArticleMeArr);
        return response;
    }
    # A published article by ID
    #
    # + id - Id of the article 
    # + return - An article 
    remote isolated function getArticleById(int id) returns ArticleShow|error {
        string  path = string `/articles/${id}`;
        ArticleShow response = check self.clientEp-> get(path, targetType = ArticleShow);
        return response;
    }
    # Update an article
    #
    # + id - Id of the article 
    # + payload - Article params for the update. 
    # + return - The updated article 
    remote isolated function updateArticle(int id, ArticleUpdate payload) returns ArticleShow|error {
        string  path = string `/articles/${id}`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ArticleShow response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ArticleShow);
        return response;
    }
    # A published article by path
    #
    # + username - User or organization username. 
    # + slug - Slug of the article. 
    # + return - An article 
    remote isolated function getArticleByPath(string username, string slug) returns ArticleShow|error {
        string  path = string `/articles/${username}/${slug}`;
        ArticleShow response = check self.clientEp-> get(path, targetType = ArticleShow);
        return response;
    }
    # Comments
    #
    # + aId - Article identifier. 
    # + pId - Podcast Episode identifier. 
    # + return - A list of threads of comments 
    remote isolated function getCommentsByArticleId(int? aId = (), int? pId = ()) returns Comment[]|error {
        string  path = string `/comments`;
        map<anydata> queryParam = {"a_id": aId, "p_id": pId};
        path = path + check getPathForQueryParam(queryParam);
        Comment[] response = check self.clientEp-> get(path, targetType = CommentArr);
        return response;
    }
    # Comment
    #
    # + id - Comment identifier. 
    # + return - A comment and its descendants 
    remote isolated function getCommentById(string id) returns Comment|error {
        string  path = string `/comments/${id}`;
        Comment response = check self.clientEp-> get(path, targetType = Comment);
        return response;
    }
    # Followers
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + sort - Specifies the sort order for the `created_at` param of the follow relationship. To sort by newest followers first (descending order) specify `?sort=-created_at`. 
    # + return - A list of followers 
    remote isolated function getFollowers(int page = 1, int perPage = 80, string sort = "created_at") returns Follower[]|error {
        string  path = string `/followers/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Follower[] response = check self.clientEp-> get(path, accHeaders, targetType = FollowerArr);
        return response;
    }
    # Followed tags
    #
    # + return - A list of followed tags 
    remote isolated function getFollowedTags() returns FollowedTag[]|error {
        string  path = string `/follows/tags`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FollowedTag[] response = check self.clientEp-> get(path, accHeaders, targetType = FollowedTagArr);
        return response;
    }
    # Published listings
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + category - Using this parameter will return listings belonging to the requested category. 
    # + return - A list of listings 
    remote isolated function getListings(int page = 1, int perPage = 30, string? category = ()) returns Listing[]|error {
        string  path = string `/listings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "category": category};
        path = path + check getPathForQueryParam(queryParam);
        Listing[] response = check self.clientEp-> get(path, targetType = ListingArr);
        return response;
    }
    # Create a new listing
    #
    # + payload - Listing to create 
    # + return - A newly created Listing 
    remote isolated function createListing(ListingCreate payload) returns Listing|error {
        string  path = string `/listings`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Listing response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Listing);
        return response;
    }
    # Published listings by category
    #
    # + category - The category of the listing 
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of listings 
    remote isolated function getListingsByCategory(ListingCategory category, int page = 1, int perPage = 30) returns Listing[]|error {
        string  path = string `/listings/category/${category}`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Listing[] response = check self.clientEp-> get(path, targetType = ListingArr);
        return response;
    }
    # A listing
    #
    # + id - Id of the listing 
    # + return - A listing 
    remote isolated function getListingById(int id) returns Listing|error {
        string  path = string `/listings/${id}`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Listing response = check self.clientEp-> get(path, accHeaders, targetType = Listing);
        return response;
    }
    # Update a listing
    #
    # + id - Id of the listing 
    # + payload - Listing params for the update. 
    # + return - The updated article 
    remote isolated function updateListing(int id, ListingUpdate payload) returns ArticleShow|error {
        string  path = string `/listings/${id}`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ArticleShow response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ArticleShow);
        return response;
    }
    # An organization
    #
    # + username - Username of the organization 
    # + return - An organization 
    remote isolated function getOrganization(string username) returns Organization|error {
        string  path = string `/organizations/${username}`;
        Organization response = check self.clientEp-> get(path, targetType = Organization);
        return response;
    }
    # Organization's Articles
    #
    # + username - Username of the organization 
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of users belonging to the organization 
    remote isolated function getOrgArticles(string username, int page = 1, int perPage = 30) returns ArticleIndex[]|error {
        string  path = string `/organizations/${username}/articles`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        ArticleIndex[] response = check self.clientEp-> get(path, targetType = ArticleIndexArr);
        return response;
    }
    # Organization's listings
    #
    # + username - Username of the organization 
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + category - Using this parameter will return listings belonging to the requested category. 
    # + return - A list of listings belonging to the organization 
    remote isolated function getOrgListings(string username, int page = 1, int perPage = 30, string? category = ()) returns json[]|error {
        string  path = string `/organizations/${username}/listings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "category": category};
        path = path + check getPathForQueryParam(queryParam);
        json[] response = check self.clientEp-> get(path, targetType = jsonArr);
        return response;
    }
    # Organization's users
    #
    # + username - Username of the organization 
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of users belonging to the organization 
    remote isolated function getOrgUsers(string username, int page = 1, int perPage = 30) returns User[]|error {
        string  path = string `/organizations/${username}/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Published podcast episodes
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + username - Using this parameter will retrieve episodes belonging to a specific podcast. 
    # + return - A list of podcast episodes 
    remote isolated function getPodcastEpisodes(int page = 1, int perPage = 30, string? username = ()) returns PodcastEpisode[]|error {
        string  path = string `/podcast_episodes`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        PodcastEpisode[] response = check self.clientEp-> get(path, targetType = PodcastEpisodeArr);
        return response;
    }
    # User or organization profile picture
    #
    # + username - Username of the user or organization 
    # + return - The profile image 
    remote isolated function getProfileImage(string username) returns ProfileImage|error {
        string  path = string `/profile_images/${username}`;
        ProfileImage response = check self.clientEp-> get(path, targetType = ProfileImage);
        return response;
    }
    # User's reading list
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - The reading list with a overwiew of the article 
    remote isolated function getReadinglist(int page = 1, int perPage = 30) returns ReadingList[]|error {
        string  path = string `/readinglist`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReadingList[] response = check self.clientEp-> get(path, accHeaders, targetType = ReadingListArr);
        return response;
    }
    # Tags
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of tags 
    remote isolated function getTags(int page = 1, int perPage = 10) returns Tag[]|error {
        string  path = string `/tags`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Tag[] response = check self.clientEp-> get(path, targetType = TagArr);
        return response;
    }
    # The authenticated user
    #
    # + return - A user 
    remote isolated function getUserMe() returns User|error {
        string  path = string `/users/me`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # A user
    #
    # + id - Id of the user. It can be either of the following two values:   - an integer representing the id of the user   - the string `by_username` (needs to be used in conjuction with the param `url`) 
    # + url - Username of the user 
    # + return - A user 
    remote isolated function getUser(string id, string? url = ()) returns User|error {
        string  path = string `/users/${id}`;
        map<anydata> queryParam = {"url": url};
        path = path + check getPathForQueryParam(queryParam);
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Articles with a video
    #
    # + page - Pagination page. 
    # + perPage - Page size (the number of items to return per page). 
    # + return - A list of video articles 
    remote isolated function getArticlesWithVideo(int page = 1, int perPage = 24) returns ArticleVideo[]|error {
        string  path = string `/videos`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        ArticleVideo[] response = check self.clientEp-> get(path, targetType = ArticleVideoArr);
        return response;
    }
    # Webhooks
    #
    # + return - A list of webhooks 
    remote isolated function getWebhooks() returns WebhookIndex[]|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebhookIndex[] response = check self.clientEp-> get(path, accHeaders, targetType = WebhookIndexArr);
        return response;
    }
    # Create a new webhook
    #
    # + payload - Webhook to create 
    # + return - A newly created webhook 
    remote isolated function createWebhook(WebhookCreate payload) returns WebhookShow|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookShow response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WebhookShow);
        return response;
    }
    # A webhook endpoint
    #
    # + id - Id of the webhook 
    # + return - A webhook endpoint 
    remote isolated function getWebhookById(int id) returns WebhookShow|error {
        string  path = string `/webhooks/${id}`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebhookShow response = check self.clientEp-> get(path, accHeaders, targetType = WebhookShow);
        return response;
    }
    # A webhook endpoint
    #
    # + id - Id of the webhook 
    # + return - A successful deletion 
    remote isolated function deleteWebhook(int id) returns http:Response|error {
        string  path = string `/webhooks/${id}`;
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
}
