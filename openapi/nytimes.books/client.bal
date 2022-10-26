// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [New York Times Books API v3.0.0](https://developer.nytimes.com/docs/books-product/1/overview) OpenAPI specification.
# The Books API provides information about book reviews and The New York Times bestsellers lists.
# For additional help getting started with the API, visit [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview).
@display {label: "New York Times Books", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [New York Times Account](https://developer.nytimes.com/accounts/create) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.nytimes.com/svc/books/v3") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Best Seller List
    #
    # + format - Type format 
    # + list - The name of the Times best-seller list. To get valid values, use a list names request. Be sure to replace spaces with hyphens (e.g., e-book-fiction or hardcover-fiction, not E-Book Fiction or Hardcover Fiction). (The parameter is not case sensitive.) 
    # + weeksOnList - The number of weeks that the best seller has been on list-name, as of bestsellers-date 
    # + bestsellersDate - YYYY-MM-DD The week-ending date for the sales reflected on list-name. Times best-seller lists are compiled using available book sale data. The bestsellers-date may be significantly earlier than published-date. For additional information, see the explanation at the bottom of any best-seller list page on NYTimes.com (example: Hardcover Fiction, published Dec. 5 but reflecting sales to Nov. 29). 
    # + date - YYYY-MM-DD  The date the best-seller list was published on NYTimes.com (compare bestsellers-date) 
    # + isbn - International Standard Book Number, 10 or 13 digits 
    # + publishedDate - YYYY-MM-DD The date the best-seller list was published on NYTimes.com (compare bestsellers-date) 
    # + rank - The rank of the best seller on list-name as of bestsellers-date 
    # + rankLastWeek - The rank of the best seller on list-name one week prior to bestsellers-date 
    # + offset - Sets the starting point of the result set 
    # + sortOrder - Sets the sort order of the result set 
    # + return - Best seller list 
    remote isolated function getListsFormat(string format, string? list = (), int? weeksOnList = (), string? bestsellersDate = (), string? date = (), string? isbn = (), string? publishedDate = (), int? rank = (), int? rankLastWeek = (), int? offset = (), string? sortOrder = ()) returns InlineResponse200|error {
        string resourcePath = string `/lists.${getEncodedUri(format)}`;
        map<anydata> queryParam = {"list": list, "weeks-on-list": weeksOnList, "bestsellers-date": bestsellersDate, "date": date, "isbn": isbn, "published-date": publishedDate, "rank": rank, "rank-last-week": rankLastWeek, "offset": offset, "sort-order": sortOrder, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Best Seller History List
    #
    # + ageGroup - The target age group for the best seller. 
    # + author - The author of the best seller. The author field does not include additional contributors (see Data Structure for more details about the author and contributor fields). When searching the author field, you can specify any combination of first, middle and last names. When sort-by is set to author, the results will be sorted by author's first name.  
    # + contributor - The author of the best seller, as well as other contributors such as the illustrator (to search or sort by author name only, use author instead). When searching, you can specify any combination of first, middle and last names of any of the contributors. When sort-by is set to contributor, the results will be sorted by the first name of the first contributor listed.  
    # + isbn - International Standard Book Number, 10 or 13 digits A best seller may have both 10-digit and 13-digit ISBNs, and may have multiple ISBNs of each type. To search on multiple ISBNs, separate the ISBNs with semicolons (example: 9780446579933;0061374229). 
    # + price - The publisher's list price of the best seller, including decimal point 
    # + publisher - The standardized name of the publisher 
    # + title - The title of the best seller When searching, you can specify a portion of a title or a full title. 
    # + return - Best seller history list 
    remote isolated function getListsBestSellersHistoryJson(string? ageGroup = (), string? author = (), string? contributor = (), string? isbn = (), string? price = (), string? publisher = (), string? title = ()) returns InlineResponse2001|error {
        string resourcePath = string `/lists/best-sellers/history.json`;
        map<anydata> queryParam = {"age-group": ageGroup, "author": author, "contributor": contributor, "isbn": isbn, "price": price, "publisher": publisher, "title": title, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Best Seller List Names
    #
    # + format - Type format 
    # + return - Best seller list names 
    remote isolated function getListsNamesFormat(string format) returns InlineResponse2002|error {
        string resourcePath = string `/lists/names.${getEncodedUri(format)}`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Best Seller List Overview
    #
    # + format - Type format 
    # + publishedDate - The best-seller list publication date. YYYY-MM-DD You do not have to specify the exact date the list was published. The service will search forward (into the future) for the closest publication date to the date you specify. For example, a request for lists/overview/2013-05-22 will retrieve the list that was published on 05-26. If you do not include a published_date, the current week's best-sellers lists will be returned. 
    # + return - Best seller list overview 
    remote isolated function getListsOverviewFormat(string format, string? publishedDate = ()) returns InlineResponse2003|error {
        string resourcePath = string `/lists/overview.${getEncodedUri(format)}`;
        map<anydata> queryParam = {"published_date": publishedDate, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Best Seller List by Date
    #
    # + date - Date filter 
    # + list - Name of the Best Sellers List. You can get the full list from /lists/names.json 
    # + isbn - International Standard Book Number, 10 or 13 digits 
    # + listName - The name of the Times best-seller list. To get valid values, use a list names request. Be sure to replace spaces with hyphens (e.g., e-book-fiction or hardcover-fiction, not E-Book Fiction or Hardcover Fiction). (The parameter is not case sensitive.) 
    # + publishedDate - YYYY-MM-DD The date the best-seller list was published on NYTimes.com (compare bestsellers-date) 
    # + bestsellersDate - YYYY-MM-DD The week-ending date for the sales reflected on list-name. Times best-seller lists are compiled using available book sale data. The bestsellers-date may be significantly earlier than published-date. For additional information, see the explanation at the bottom of any best-seller list page on NYTimes.com (example: Hardcover Fiction, published Dec. 5 but reflecting sales to Nov. 29). 
    # + weeksOnList - The number of weeks that the best seller has been on list-name, as of bestsellers-date 
    # + rank - The rank of the best seller on list-name as of bestsellers-date 
    # + rankLastWeek - The rank of the best seller on list-name one week prior to bestsellers-date 
    # + offset - Sets the starting point of the result set 
    # + sortOrder - The default is ASC (ascending). The sort-order parameter is used with the sort-by parameter — for details, see each request type. 
    # + return - Best seller list by date 
    remote isolated function getListsDateListJson(string date, string list, int? isbn = (), string? listName = (), string? publishedDate = (), string? bestsellersDate = (), int? weeksOnList = (), string? rank = (), int? rankLastWeek = (), int? offset = (), string? sortOrder = ()) returns InlineResponse2004|error {
        string resourcePath = string `/lists/${getEncodedUri(date)}/${getEncodedUri(list)}.json`;
        map<anydata> queryParam = {"isbn": isbn, "list-name": listName, "published-date": publishedDate, "bestsellers-date": bestsellersDate, "weeks-on-list": weeksOnList, "rank": rank, "rank-last-week": rankLastWeek, "offset": offset, "sort-order": sortOrder, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/reviews.${getEncodedUri(format)}`;
        map<anydata> queryParam = {"isbn": isbn, "title": title, "author": author, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
