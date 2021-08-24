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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [New York Times Newswire API v3.0.0](https://developer.nytimes.com/docs/timeswire-product/1/overview) OpenAPI specification.
# With the Times Newswire API, you can get links and metadata for Times' articles as soon as they are published on NYTimes.com. 
# The Times Newswire API provides an up-to-the-minute stream of published articles. You can filter results by source (all, nyt, inyt) and section (arts, business, ...).
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [NYTimes account](https://developer.nytimes.com/accounts/login) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - Provide your API key as `api-key`. Eg: `{"api-key" : "<API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/news/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get articles.
    #
    # + url - The complete URL of a specific news item, URL-encoded or backslash-escaped
    # + return - An array of Articles
    remote isolated function getContents(string url) returns InlineResponse200|error {
        string  path = string `/content.json`;
        map<anydata> queryParam = {"url": url, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Filter articles by source and section.
    #
    # + 'source - Limits the set of items by originating source
    # + section - Limits the set of items by one or more sections
    # + 'limit - Limits the number of results, between 1 and 20
    # + offset - Sets the starting point of the result set
    # + return - An array of Articles
    remote isolated function filterContents(string 'source, string section, int 'limit = 20, int offset = 0) returns InlineResponse200|error {
        string  path = string `/content/${'source}/${section}.json`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Filter articles by source, section and time period.
    #
    # + 'source - Limits the set of items by originating source
    # + section - Limits the set of items by one or more sections
    # + timePeriod - Limits the set of items by time published, integer in number of hours
    # + 'limit - Limits the number of results, between 1 and 20
    # + offset - Sets the starting point of the result set
    # + return - An array of Articles
    remote isolated function filterContentsByTime(string 'source, string section, int timePeriod, int 'limit = 20, int offset = 0) returns InlineResponse200|error {
        string  path = string `/content/${'source}/${section}/${timePeriod}.json`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
