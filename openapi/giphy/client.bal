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
    string apiKey;
|};

# This is a generated connector for [Giphy API v1](https://developers.giphy.com/docs/api/) OpenAPI Specification.
# Giphy API provides functions to get GIFs and stickers.
@display {label: "Giphy", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Giphy account](https://giphy.com/login) and obtain tokens by following [this guide](https://support.giphy.com/hc/en-us/articles/360020283431-Request-A-GIPHY-API-Key).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.giphy.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get GIFs by ID
    #
    # + ids - Filters results by specified GIF IDs, separated by commas. 
    # + return - GIF or an error 
    remote isolated function getGifsById(string? ids = ()) returns PaginatedResponse|error {
        string resourcePath = string `/gifs`;
        map<anydata> queryParam = {"ids": ids, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Random GIF
    #
    # + tag - Filters results by specified tag. 
    # + rating - Filters results by specified rating. 
    # + return - Random GIF or an error 
    remote isolated function randomGif(string? tag = (), string? rating = ()) returns Response|error {
        string resourcePath = string `/gifs/random`;
        map<anydata> queryParam = {"tag": tag, "rating": rating, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search GIFs
    #
    # + q - Search query term or prhase. 
    # + 'limit - The maximum number of records to return. 
    # + offset - An optional results offset. 
    # + rating - Filters results by specified rating. 
    # + lang - Specify default language for regional content; use a 2-letter ISO 639-1 language code. 
    # + return - GIFs or an error 
    remote isolated function searchGifs(string q, int 'limit = 25, int offset = 0, string? rating = (), string? lang = ()) returns PaginatedResponse|error {
        string resourcePath = string `/gifs/search`;
        map<anydata> queryParam = {"q": q, "limit": 'limit, "offset": offset, "rating": rating, "lang": lang, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Translate phrase to GIF
    #
    # + s - Search term. 
    # + return - Translated GIF or an error 
    remote isolated function translateGif(string s) returns Response|error {
        string resourcePath = string `/gifs/translate`;
        map<anydata> queryParam = {"s": s, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Trending GIFs
    #
    # + 'limit - The maximum number of records to return. 
    # + offset - An optional results offset. 
    # + rating - Filters results by specified rating. 
    # + return - Treading GIFs or an error 
    remote isolated function trendingGifs(int 'limit = 25, int offset = 0, string? rating = ()) returns PaginatedResponse|error {
        string resourcePath = string `/gifs/trending`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "rating": rating, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get GIF by Id
    #
    # + gifId - Filters results by specified GIF ID. 
    # + return - Sticker or an error 
    remote isolated function getGifById(int gifId) returns Response|error {
        string resourcePath = string `/gifs/${gifId}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Random Sticker
    #
    # + tag - Filters results by specified tag. 
    # + rating - Filters results by specified rating. 
    # + return - Random sticker or an error 
    remote isolated function randomSticker(string? tag = (), string? rating = ()) returns Response|error {
        string resourcePath = string `/stickers/random`;
        map<anydata> queryParam = {"tag": tag, "rating": rating, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Stickers
    #
    # + q - Search query term or prhase. 
    # + 'limit - The maximum number of records to return. 
    # + offset - An optional results offset. 
    # + rating - Filters results by specified rating. 
    # + lang - Specify default language for regional content; use a 2-letter ISO 639-1 language code. 
    # + return - Stickers or an error 
    remote isolated function searchStickers(string q, int 'limit = 25, int offset = 0, string? rating = (), string? lang = ()) returns PaginatedResponse|error {
        string resourcePath = string `/stickers/search`;
        map<anydata> queryParam = {"q": q, "limit": 'limit, "offset": offset, "rating": rating, "lang": lang, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Translate phrase to Sticker
    #
    # + s - Search term. 
    # + return - Translated sticker or an error 
    remote isolated function translateSticker(string s) returns Response|error {
        string resourcePath = string `/stickers/translate`;
        map<anydata> queryParam = {"s": s, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Trending Stickers
    #
    # + 'limit - The maximum number of records to return. 
    # + offset - An optional results offset. 
    # + rating - Filters results by specified rating. 
    # + return - Treading stickers or an error 
    remote isolated function trendingStickers(int 'limit = 25, int offset = 0, string? rating = ()) returns PaginatedResponse|error {
        string resourcePath = string `/stickers/trending`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "rating": rating, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
