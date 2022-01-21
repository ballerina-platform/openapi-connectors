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
    # Represents API Key `access_token`
    string accessToken;
    # Represents API Key `api_key`
    string apiKey;
    # Represents API Key `api_secret`
    string apiSecret;
|};

# This is a generated connector for [Disqus API v1](https://disqus.com/api/docs) OpenAPI specification.
# Disqus is a service for web comments and discussions. 
# Disqus makes commenting easier and more interactive, helping publishers power online discussions.
@display {label: "Disqus", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Disqus account](https://disqus.com) and obtain tokens by following [this guide](https://help.disqus.com/en/articles/1717212-using-the-api).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://disqus.com/api/3.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Returns a list of categories within a forum.
    #
    # + forum - Looks up a forum by ID (aka short name) 
    # + sinceId - since_id. Defaults to null. 
    # + cursor - cursor. Defaults to null. 
    # + 'limit - limit. Defaults to 25. Maximum value of 100. 
    # + 'order - order. Defaults to 'asc'. Choices: asc, desc. 
    # + return - An object with a single property response which is an array of Category objects. 
    remote isolated function listCategories(string forum, string? sinceId = (), string? cursor = (), string? 'limit = (), string? 'order = ()) returns Categories|error {
        string resourcePath = string `/categories/list.json`;
        map<anydata> queryParam = {"forum": forum, "since_id": sinceId, "cursor": cursor, "limit": 'limit, "order": 'order, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Categories response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns category details.
    #
    # + category - Looks up a category by ID. 
    # + return - An object with a single property response which is a Category object. 
    remote isolated function getCategoryDetails(string category) returns Category|error {
        string resourcePath = string `/categories/details.json`;
        map<anydata> queryParam = {"category": category, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns forum details.
    #
    # + forum - Looks up a forum by ID (aka short name) 
    # + attach - Choices: followsForum, forumCanDisableAds, forumForumCategory, counters, forumDaysAlive, forumFeatures, forumIntegration, forumNewPolicy, forumPermissions. Defaults to []. 
    # + related - You may specify relations to include with your response. Choices: author. Defaults to []. 
    # + return - An object with a single property response which is a Forum object. 
    remote isolated function getForumDetails(string forum, string? attach = (), string? related = ()) returns Forum|error {
        string resourcePath = string `/forums/details.json`;
        map<anydata> queryParam = {"forum": forum, "attach": attach, "related": related, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Forum response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of posts ordered by the date created.
    #
    # + category - Looks up a category by ID. Defaults to null. 
    # + end - Unix timestamp (or ISO datetime standard). Defaults to null. 
    # + sortType - Choices: date, priority. Defaults to 'date'. 
    # + thread - Looks up a thread by ID. Defaults to null. 
    # + forum - Defaults to all forums you moderate. Use :all to retrieve all forums. Defaults to null. 
    # + 'start - Unix timestamp (or ISO datetime standard). Defaults to null. 
    # + since - Unix timestamp (or ISO datetime standard). Defaults to null. 
    # + related - You may specify relations to include with your response. Choices: forum, thread. Defaults to []. 
    # + cursor - Cursor. Defaults to null. 
    # + 'limit - Limit. Maximum value of 100. Defaults to 25. 
    # + filters - Filters. Defaults to []. Valid values are Is_Anonymous, Has_Link, Has_Low_Rep_Author, Has_Bad_Word, Is_Flagged, No_Issue, Is_Toxic, Modified_By_Rule, Shadow_Banned, Has_Media, Is_At_Flag_Limit, Shadow_Banned_Global. 
    # + query - Query. Defaults to null. 
    # + include - Choices: unapproved, approved, spam, deleted, flagged, highlighted. Defaults to [ 'approved' ]. 
    # + 'order - Choices: asc, desc. Defaults to 'desc' 
    # + return - An object with a single property response which is an array of Post objects. 
    remote isolated function listPosts(string? category = (), string? end = (), string? sortType = (), string? thread = (), string? forum = (), string? 'start = (), string? since = (), string? related = (), string? cursor = (), int? 'limit = (), string? filters = (), string? query = (), string? include = (), string? 'order = ()) returns Posts|error {
        string resourcePath = string `/posts/list.json`;
        map<anydata> queryParam = {"category": category, "end": end, "sortType": sortType, "thread": thread, "forum": forum, "start": 'start, "since": since, "related": related, "cursor": cursor, "limit": 'limit, "filters": filters, "query": query, "include": include, "order": 'order, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Posts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information about a post.
    #
    # + post - Looks up a post by ID. 
    # + related - You may specify relations to include with your response. Choices: forum, thread. Defaults to []. 
    # + return - An object with a single property response which is a Post object. 
    remote isolated function getPostDetails(string post, string? related = ()) returns Post|error {
        string resourcePath = string `/posts/details.json`;
        map<anydata> queryParam = {"post": post, "related": related, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Post response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of threads sorted by the date created.
    #
    # + category - Looks up a category by ID. Defaults to null. 
    # + forum - Looks up a forum by ID (aka short name). Defaults to null. 
    # + thread - Looks up a thread by ID. You may pass us the 'ident' query type instead of an ID by including 'forum'. You may pass us the 'link' query type to filter by URL. You must pass the 'forum' if you do not have the Pro API Access addon. Defaults to null. 
    # + author - Looks up a user by ID. You may look up a user by username using the 'username' query type. Defaults to null. 
    # + since - Unix timestamp (or ISO datetime standard). Defaults to null. 
    # + related - You may specify relations to include with your response. Choices: forum, author, category. Defaults to []. 
    # + cursor - Cursor. Defaults to null. 
    # + attach - Attach. Defaults to []. 
    # + 'limit - Limit. Maximum value of 100. Defaults to 25. 
    # + include - Choices: open, closed, killed. Defaults to [ 'open', 'closed' ] 
    # + 'order - Choices: asc, desc. Defaults to 'desc'. 
    # + return - An object with a single property response which is an array of Thread objects. 
    remote isolated function listThreads(string? category = (), string? forum = (), string? thread = (), string? author = (), string? since = (), string? related = (), string? cursor = (), string? attach = (), int? 'limit = (), string? include = (), string? 'order = ()) returns Threads|error {
        string resourcePath = string `/threads/list.json`;
        map<anydata> queryParam = {"category": category, "forum": forum, "thread": thread, "author": author, "since": since, "related": related, "cursor": cursor, "attach": attach, "limit": 'limit, "include": include, "order": 'order, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Threads response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns thread details.
    #
    # + thread - Looks up a thread by ID. You may pass us the 'ident' or 'link' query types instead of an ID by including 'forum'. 
    # + forum - Looks up a forum by ID (aka short name). Defaults to null. 
    # + related - You may specify relations to include with your response. Choices: forum, author, category. Defaults to []. 
    # + attach - Choices: topics. Defaults to []. 
    # + return - An object with a single property response which is a Thread object. 
    remote isolated function getThreadDetails(string thread, string? forum = (), string? related = (), string? attach = ()) returns DisqusThread|error {
        string resourcePath = string `/threads/details.json`;
        map<anydata> queryParam = {"thread": thread, "forum": forum, "related": related, "attach": attach, "access_token": self.apiKeyConfig.accessToken, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DisqusThread response = check self.clientEp->get(resourcePath);
        return response;
    }
}
