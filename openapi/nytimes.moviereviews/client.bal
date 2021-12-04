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
    # Represents API Key `api-key`
    string apiKey;
|};

# This is a generated connector from [New York Times Movie Review API v2.0.0](https://developer.nytimes.com/docs/movie-reviews-api/1/overview) OpenAPI specification.
# With the New York Times Movie Reviews API you can search for movie reviews. 
# The Movie Reviews API provides services for searching New York Times movie reviews by keyword and opening date and filter by Critics' Picks.
@display {label: "New York Times Movie Reviews", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [NYTimes account](https://developer.nytimes.com/accounts/login) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/movies/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get movie reviews that are critics' picks. You can either specify the reviewer name or use "all", "full-time", or "part-time".
    #
    # + resourceType - all | full-time | part-time | [reviewer-name] Specify all to get all Times reviewers, or specify full-time or part-time to get that subset. Specify a reviewer's name to get details about a particular reviewer. 
    # + return - An array of Movie Critics 
    remote isolated function criticsPicks(string resourceType) returns InlineResponse200|error {
        string  path = string `/critics/${resourceType}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Search for movie reviews. Supports filtering by Critics' Pick.
    #
    # + query - Search keywords; matches movie title and indexed terms To limit your search to exact matches only, surround your search string with single quotation marks (e.g., query='28+days+later'). Otherwise, responses will include partial matches ("head words") as well as exact matches (e.g., president will match president, presidents and presidential).   If you specify multiple terms without quotation marks, they will be combined in an OR search.   If you omit the query parameter, your request will be equivalent to a reviews and NYT Critics' Picks request. 
    # + criticsPick - Set this parameter to Y to limit the results to NYT Critics' Picks. To get only those movies that have not been highlighted by Times critics, specify critics-pick=N. (To get all reviews regardless of critics-pick status, simply omit this parameter.) 
    # + reviewer - Include this parameter to limit your results to reviews by a specific critic. Reviewer names should be formatted like this: Manohla Dargis. 
    # + publicationDate - Single date: YYYY-MM-DD Start and end date: YYYY-MM-DD;YYYY-MM-DD The publication-date is the date the review was first published in The Times. 
    # + openingDate - Single date: YYYY-MM-DD Start and end date: YYYY-MM-DD;YYYY-MM-DD The opening-date is the date the movie's opening date in the New York region. 
    # + offset - Positive integer, multiple of 20 
    # + 'order - Sets the sort order of the results. Results ordered by-title are in ascending alphabetical order. Results ordered by one of the date parameters are in reverse chronological order. If you do not specify a sort order, the results will be ordered by publication-date. 
    # + return - An array of Movies 
    remote isolated function searchMovieReviews(string? query = (), string? criticsPick = (), string? reviewer = (), string? publicationDate = (), string? openingDate = (), int offset = 20, string? 'order = ()) returns InlineResponse2001|error {
        string  path = string `/reviews/search.json`;
        map<anydata> queryParam = {"query": query, "critics-pick": criticsPick, "reviewer": reviewer, "publication-date": publicationDate, "opening-date": openingDate, "offset": offset, "order": 'order, "api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Get movie reviews. Can filter to only return Critics' Picks. Supports ordering results by-publication-date or by-opening-date. Use offset to paginate thru results, 20 at a time.
    #
    # + resourceType - Specify all to retrieve all reviews, including NYT Critics' Picks. Specify picks to get NYT Critics' Picks currently in theaters. 
    # + offset - Positive integer, multiple of 20 
    # + 'order - Sets the sort order of the results. Results ordered by-title are in ascending alphabetical order. Results ordered by one of the date parameters are in reverse chronological order. If you do not specify a sort order, the results will be ordered by publication-date. 
    # + return - An array of Movies 
    remote isolated function getMovieReviews(string resourceType, int offset = 20, string 'order = "by-publication-date") returns InlineResponse2001|error {
        string  path = string `/reviews/${resourceType}.json`;
        map<anydata> queryParam = {"offset": offset, "order": 'order, "api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
}
