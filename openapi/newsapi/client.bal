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

# Please visit [here](https://newsapi.org/register) and obtain an `API Key`.
#
# + apiKeys - Provide your API Key as `apiKey`. Eg: `{"apiKey" : "<Your API Key>"}` 
public type ApiKeysConfig record {
    map<string|string[]> apiKeys;
};

# Client endpoint for News API
#
# + clientEp - Connector http endpoint
@display {label: "News API Client"}
public client class Client {
    http:Client clientEp;
    map<string|string[]> apiKeys;
    # News API Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://newsapi.org/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Returns a list of news sources or blogs
    #
    # + language - Find sources that display news in a specific language. Possible options: ar de en es fr he it nl no pt ru se ud zh. Default: all languages
    # + country - Find sources that display news in a specific country. Default: all countries
    # + category - Find sources that display news of this category. Default: all categories
    # + return - Record containing list of news sources
    @display {label: "List News Sources"}
    remote isolated function listSources(@display {label: "Language"} string? language = (), @display {label: "Country"} string? country = (), @display {label: "Category"} string? category = ()) returns WSNewsSourcesResponse|error {
        string  path = string `/sources`;
        map<anydata> queryParam = {"language": language, "country": country, "category": category, apiKey: self.apiKeys["apiKey"]};
        path = path + check getPathForQueryParam(queryParam);
        WSNewsSourcesResponse response = check self.clientEp-> get(path, targetType = WSNewsSourcesResponse);
        return response;
    }
    # Returns a list of top headlines
    #
    # + q - Keywords or a phrase to search for
    # + sources - Comma-seperated string of source identifiers for news sources or blogs
    # + country - Find sources that display news in a specific country. Default: all countries
    # + category - Find sources that display news of this category. Default: all categories
    # + page - Use this to page through results if total results found is greater than page size
    # + pageSize - Number of results to return per page (request). 20 is default, 100 is maximum
    # + return - Record containing list of top headlines
    @display {label: "List Top Headlines"}
    remote isolated function listTopHeadlines(@display {label: "Keyword"} string? q = (), @display {label: "Sources"} string? sources = (), @display {label: "Country"} string? country = (), @display {label: "Category"} string? category = (), @display {label: "Page Number"} int? page = (), @display {label: "Page Size"} int? pageSize = 20) returns WSNewsTopHeadlineResponse|error {
        string  path = string `/top-headlines`;
        map<anydata> queryParam = {"q": q, "sources": sources, "country": country, "category": category, "page": page, "pageSize": pageSize, apiKey: self.apiKeys["apiKey"]};
        path = path + check getPathForQueryParam(queryParam);
        WSNewsTopHeadlineResponse response = check self.clientEp-> get(path, targetType = WSNewsTopHeadlineResponse);
        return response;
    }
    # Returns list of articles
    #
    # + page - Use this to page through results
    # + pageSize - Number of results to return per page. 20 is default, 100 is maximum
    # + q - Keywords or phrases to search for in article title and body. Complete value for query must be URL-encoded
    # + qInTitle - Keywords or phrases to search for in article title only. Complete value for qInTitle must be URL-encoded
    # + sources - Comma-seperated string of source identifiers (maximum 20) for news sources or blogs
    # + domains - Comma-seperated string of domains (eg bbc.co.uk, techcrunch.com, engadget.com) to restrict search
    # + excludeDomains - Comma-seperated string of domains (eg bbc.co.uk, techcrunch.com, engadget.com) to remove from results
    # + 'from - Date and optional time for oldest article allowed. This should be in ISO 8601 format (e.g. 2021-02-15 or 2021-02-15T19:07:40) Default: oldest according to pricing plan
    # + to - Date and optional time for newest article allowed. This should be in ISO 8601 format (e.g. 2021-02-15 or 2021-02-15T19:07:40) Default: newest according to pricing plan
    # + language - Find sources that display news in a specific language. Possible options: ar de en es fr he it nl no pt ru se ud zh .Default: all languages
    # + sortBy - Order to sort articles in. Possible options: relevancy, popularity, publishedAt
    # + return - Record containing list of articles
    @display {label: "List Articles"}
    remote isolated function listArticles(@display {label: "Page Number"} int page, @display {label: "Page Size"} int pageSize, @display {label: "Keyword"} string? q = (), @display {label: "Title Keyword"} string? qInTitle = (), @display {label: "Sources"} string? sources = (), @display {label: "Domains To Include"} string? domains = (), @display {label: "Domains To Exclude"} string? excludeDomains = (), @display {label: "From"} string? 'from = (), @display {label: "To"} string? to = (), @display {label: "Language"} string? language = (), @display {label: "Sort By"} string? sortBy = ()) returns WSNewsTopHeadlineResponse|error {
        string  path = string `/everything`;
        map<anydata> queryParam = {"q": q, "qInTitle": qInTitle, "sources": sources, "domains": domains, "excludeDomains": excludeDomains, "from": 'from, "to": to, "language": language, "sortBy": sortBy, "page": page, "pageSize": pageSize, apiKey: self.apiKeys["apiKey"]};
        path = path + check getPathForQueryParam(queryParam);
        WSNewsTopHeadlineResponse response = check self.clientEp-> get(path, targetType = WSNewsTopHeadlineResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function getPathForQueryParam(map<anydata> queryParam) returns string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach var [key, value] in queryParam.entries() {
        if value is () {
            _ = queryParam.remove(key);
        } else {
            if string:startsWith( key, "'") {
                param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if value is string {
                string updateV = check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
