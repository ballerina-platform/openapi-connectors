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

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector from [New York Times Movie Review API v2.0.0](https://developer.nytimes.com/docs/movie-reviews-api/1/overview) OpenAPI specification.
# With the New York Times Movie Reviews API you can search for movie reviews. 
# The Movie Reviews API provides services for searching New York Times movie reviews by keyword and opening date and filter by Critics' Picks.
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
    # + return - An error at the failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/movies/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get movie reviews that are critics' picks. You can either specify the reviewer name or use "all", "full-time", or "part-time".
    #
    # + resourceType - all | full-time | part-time | [reviewer-name]
    # + return - An array of Movie Critics
    remote isolated function criticsPicks(string resourceType) returns InlineResponse200|error {
        string  path = string `/critics/${resourceType}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Search for movie reviews. Supports filtering by Critics' Pick.
    #
    # + query - Search keywords; matches movie title and indexed terms
    # + criticsPick - Set this parameter to Y to limit the results to NYT Critics' Picks. To get only those movies that have not been highlighted by Times critics, specify critics-pick=N. (To get all reviews regardless of critics-pick status, simply omit this parameter.)
    # + reviewer - Include this parameter to limit your results to reviews by a specific critic. Reviewer names should be formatted like this: Manohla Dargis.
    # + publicationDate - Single date: YYYY-MM-DD
    # + openingDate - Single date: YYYY-MM-DD
    # + offset - Positive integer, multiple of 20
    # + 'order - Sets the sort order of the results.
    # + return - An array of Movies
    remote isolated function searchMovieReviews(string? query = (), string? criticsPick = (), string? reviewer = (), string? publicationDate = (), string? openingDate = (), int offset = 20, string? 'order = ()) returns InlineResponse2001|error {
        string  path = string `/reviews/search.json`;
        map<anydata> queryParam = {"query": query, "critics-pick": criticsPick, "reviewer": reviewer, "publication-date": publicationDate, "opening-date": openingDate, "offset": offset, "order": 'order, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Get movie reviews. Can filter to only return Critics' Picks. Supports ordering results by-publication-date or by-opening-date. Use offset to paginate thru results, 20 at a time.
    #
    # + resourceType - Specify all to retrieve all reviews, including NYT Critics' Picks.
    # + offset - Positive integer, multiple of 20
    # + 'order - Sets the sort order of the results.
    # + return - An array of Movies
    remote isolated function getMovieReviews(string resourceType, int offset = 20, string 'order = "by-publication-date") returns InlineResponse2001|error {
        string  path = string `/reviews/${resourceType}.json`;
        map<anydata> queryParam = {"offset": offset, "order": 'order, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
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
