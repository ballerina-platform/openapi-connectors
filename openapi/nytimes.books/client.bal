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

# This is a generated connector for [New York Times Books API v3.0.0](https://developer.nytimes.com/docs/books-product/1/overview) OpenAPI specification.
# The Books API provides information about book reviews and The New York Times bestsellers lists.
# For additional help getting started with the API, visit [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview).
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [New York Times Account](https://developer.nytimes.com/accounts/create) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - Provide your API key as `api-key`. Eg: `{"api-key" : "<your API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/books/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Best Seller List
    #
    # + format - Type format
    # + list - The name of the Times best-seller list. To get valid values, use a list names request.
    # + weeksOnList - The number of weeks that the best seller has been on list-name, as of bestsellers-date
    # + bestsellersDate - YYYY-MM-DD
    # + date - YYYY-MM-DD  The date the best-seller list was published on NYTimes.com (compare bestsellers-date)
    # + isbn - International Standard Book Number, 10 or 13 digits
    # + publishedDate - YYYY-MM-DD
    # + rank - The rank of the best seller on list-name as of bestsellers-date
    # + rankLastWeek - The rank of the best seller on list-name one week prior to bestsellers-date
    # + offset - Sets the starting point of the result set
    # + sortOrder - Sets the sort order of the result set
    # + return - Best seller list
    remote isolated function getListsFormat(string format, string? list = (), int? weeksOnList = (), string? bestsellersDate = (), string? date = (), string? isbn = (), string? publishedDate = (), int? rank = (), int? rankLastWeek = (), int? offset = (), string? sortOrder = ()) returns InlineResponse200|error {
        string  path = string `/lists.${format}`;
        map<anydata> queryParam = {"list": list, "weeks-on-list": weeksOnList, "bestsellers-date": bestsellersDate, "date": date, "isbn": isbn, "published-date": publishedDate, "rank": rank, "rank-last-week": rankLastWeek, "offset": offset, "sort-order": sortOrder, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Best Seller History List
    #
    # + ageGroup - The target age group for the best seller.
    # + author - The author of the best seller. The author field does not include additional contributors (see Data Structure for more details about the author and contributor fields).
    # + contributor - The author of the best seller, as well as other contributors such as the illustrator (to search or sort by author name only, use author instead).
    # + isbn - International Standard Book Number, 10 or 13 digits
    # + price - The publisher's list price of the best seller, including decimal point
    # + publisher - The standardized name of the publisher
    # + title - The title of the best seller
    # + return - Best seller history list
    remote isolated function getListsBestSellersHistoryJson(string? ageGroup = (), string? author = (), string? contributor = (), string? isbn = (), string? price = (), string? publisher = (), string? title = ()) returns InlineResponse2001|error {
        string  path = string `/lists/best-sellers/history.json`;
        map<anydata> queryParam = {"age-group": ageGroup, "author": author, "contributor": contributor, "isbn": isbn, "price": price, "publisher": publisher, "title": title, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Best Seller List Names
    #
    # + format - Type format
    # + return - Best seller list names
    remote isolated function getListsNamesFormat(string format) returns InlineResponse2002|error {
        string  path = string `/lists/names.${format}`;
        map<anydata> queryParam = {"api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp-> get(path, targetType = InlineResponse2002);
        return response;
    }
    # Best Seller List Overview
    #
    # + format - Type format
    # + publishedDate - The best-seller list publication date. YYYY-MM-DD
    # + return - Best seller list overview
    remote isolated function getListsOverviewFormat(string format, string? publishedDate = ()) returns InlineResponse2003|error {
        string  path = string `/lists/overview.${format}`;
        map<anydata> queryParam = {"published_date": publishedDate, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
        return response;
    }
    # Best Seller List by Date
    #
    # + date - Date filter
    # + list - Name of the Best Sellers List. You can get the full list from /lists/names.json
    # + isbn - International Standard Book Number, 10 or 13 digits
    # + listName - The name of the Times best-seller list. To get valid values, use a list names request.
    # + publishedDate - YYYY-MM-DD
    # + bestsellersDate - YYYY-MM-DD
    # + weeksOnList - The number of weeks that the best seller has been on list-name, as of bestsellers-date
    # + rank - The rank of the best seller on list-name as of bestsellers-date
    # + rankLastWeek - The rank of the best seller on list-name one week prior to bestsellers-date
    # + offset - Sets the starting point of the result set
    # + sortOrder - The default is ASC (ascending). The sort-order parameter is used with the sort-by parameter — for details, see each request type.
    # + return - Best seller list by date
    remote isolated function getListsDateListJson(string date, string list, int? isbn = (), string? listName = (), string? publishedDate = (), string? bestsellersDate = (), int? weeksOnList = (), string? rank = (), int? rankLastWeek = (), int? offset = (), string? sortOrder = ()) returns InlineResponse2004|error {
        string  path = string `/lists/${date}/${list}.json`;
        map<anydata> queryParam = {"isbn": isbn, "list-name": listName, "published-date": publishedDate, "bestsellers-date": bestsellersDate, "weeks-on-list": weeksOnList, "rank": rank, "rank-last-week": rankLastWeek, "offset": offset, "sort-order": sortOrder, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp-> get(path, targetType = InlineResponse2004);
        return response;
    }
    # Reviews
    #
    # + format - Type format
    # + isbn - Searching by ISBN is the recommended method. You can enter 10- or 13-digit ISBNs.
    # + title - You’ll need to enter the full title of the book. Spaces in the title will be converted into the characters %20.
    # + author - You’ll need to enter the author’s first and last name, separated by a space. This space will be converted into the characters %20.
    # + return - Reviews
    remote isolated function getReviewsFormat(string format, int? isbn = (), string? title = (), string? author = ()) returns InlineResponse2005|error {
        string  path = string `/reviews.${format}`;
        map<anydata> queryParam = {"isbn": isbn, "title": title, "author": author, "api-key": self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp-> get(path, targetType = InlineResponse2005);
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
