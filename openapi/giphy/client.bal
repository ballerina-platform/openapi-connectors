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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# API key configuration.
# 
# + apiKeys - Key value pair
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Giphy API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.giphy.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Get GIFs by ID
    #
    # + ids - Filters results by specified GIF IDs, separated by commas.
    # + return - GIF or an error
    remote isolated function getGifsById(string? ids = ()) returns PaginatedResponse|error {
        string  path = string `/gifs`;
        map<anydata> queryParam = {"ids": ids, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp-> get(path, targetType = PaginatedResponse);
        return response;
    }
    # Random GIF
    #
    # + tag - Filters results by specified tag.
    # + rating - Filters results by specified rating.
    # + return - Random GIF or an error
    remote isolated function randomGif(string? tag = (), string? rating = ()) returns Response|error {
        string  path = string `/gifs/random`;
        map<anydata> queryParam = {"tag": tag, "rating": rating, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
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
    remote isolated function searchGifs(string q, int? 'limit = 25, int? offset = 0, string? rating = (), string? lang = ()) returns PaginatedResponse|error {
        string  path = string `/gifs/search`;
        map<anydata> queryParam = {"q": q, "limit": 'limit, "offset": offset, "rating": rating, "lang": lang, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp-> get(path, targetType = PaginatedResponse);
        return response;
    }
    # Translate phrase to GIF
    #
    # + s - Search term.
    # + return - Translated GIF or an error
    remote isolated function translateGif(string s) returns Response|error {
        string  path = string `/gifs/translate`;
        map<anydata> queryParam = {"s": s, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
        return response;
    }
    # Trending GIFs
    #
    # + 'limit - The maximum number of records to return.
    # + offset - An optional results offset.
    # + rating - Filters results by specified rating.
    # + return - Treading GIFs or an error
    remote isolated function trendingGifs(int? 'limit = 25, int? offset = 0, string? rating = ()) returns PaginatedResponse|error {
        string  path = string `/gifs/trending`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "rating": rating, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp-> get(path, targetType = PaginatedResponse);
        return response;
    }
    # Get GIF by Id
    #
    # + gifId - Filters results by specified GIF ID.
    # + return - Sticker or an error
    remote isolated function getGifById(int gifId) returns Response|error {
        string  path = string `/gifs/${gifId}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
        return response;
    }
    # Random Sticker
    #
    # + tag - Filters results by specified tag.
    # + rating - Filters results by specified rating.
    # + return - Random sticker or an error
    remote isolated function randomSticker(string? tag = (), string? rating = ()) returns Response|error {
        string  path = string `/stickers/random`;
        map<anydata> queryParam = {"tag": tag, "rating": rating, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
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
    remote isolated function searchStickers(string q, int? 'limit = 25, int? offset = 0, string? rating = (), string? lang = ()) returns PaginatedResponse|error {
        string  path = string `/stickers/search`;
        map<anydata> queryParam = {"q": q, "limit": 'limit, "offset": offset, "rating": rating, "lang": lang, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp-> get(path, targetType = PaginatedResponse);
        return response;
    }
    # Translate phrase to Sticker
    #
    # + s - Search term.
    # + return - Translated sticker or an error
    remote isolated function translateSticker(string s) returns Response|error {
        string  path = string `/stickers/translate`;
        map<anydata> queryParam = {"s": s, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
        return response;
    }
    # Trending Stickers
    #
    # + 'limit - The maximum number of records to return.
    # + offset - An optional results offset.
    # + rating - Filters results by specified rating.
    # + return - Treading stickers or an error
    remote isolated function trendingStickers(int? 'limit = 25, int? offset = 0, string? rating = ()) returns PaginatedResponse|error {
        string  path = string `/stickers/trending`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "rating": rating, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedResponse response = check self.clientEp-> get(path, targetType = PaginatedResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
