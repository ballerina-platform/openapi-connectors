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

# This is a generated connector for [ISBNdb API v2.0.0](https://isbndb.com/apidocs/v2) OpenAPI specification.
# The ISBNdb.com API exposes data such as title, author, publisher and publish date about books.
@display {label: "ISBNdb", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [ISBNdb Account](https://isbndb.com/isbn-database) by selecting a pricing plan and obtain tokens following [this guide](https://isbndb.com/apidocs/v2).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api2.isbndb.com/") returns error? {
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
    # Gets author details
    #
    # + name - The name of an author in the Author's database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + return - The author name was found in the database 
    remote isolated function getAuthorDetails(string name, int page = 1, int pageSize = 20) returns Author|error {
        string resourcePath = string `/author/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Author response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search authors
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Author’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the author's database 
    remote isolated function searchAuthors(string query, string? pageSize = (), string? page = ()) returns AuthorQueryResults|error {
        string resourcePath = string `/authors/${getEncodedUri(query)}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuthorQueryResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets book details
    #
    # + isbn - an ISBN 10 or ISBN 13 in the Books database 
    # + withPrices - indicate if shows Real Time Prices. Only with the Pro plan 
    # + return - The book ISBN was found in the database 
    remote isolated function getBookDetails(string isbn, string? withPrices = ()) returns Book|error {
        string resourcePath = string `/book/${getEncodedUri(isbn)}`;
        map<anydata> queryParam = {"with_prices": withPrices};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Book response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search books
    #
    # + payload - Request payload to search to search books 
    # + return - The query string found results in the book's database 
    remote isolated function searchBooks(BooksBody payload) returns http:Response|error {
        string resourcePath = string `/books`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Search books
    #
    # + query - A string to search for in the Book’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + column - Search limited to this column:  * `` - Empty value search in every column  * `title` - Only searches in Books Title  * `author` - Only searches books by the given Author  * `date_published` - Only searches books in a given year, e.g. 1998 
    # + beta - A integer (1 or 0) for enable or disable beta searching. 
    # + return - The query string found results in the books's database 
    remote isolated function searchBooksByQuery(string query, int page = 1, int pageSize = 20, string? column = (), int beta = 0) returns http:Response|error {
        string resourcePath = string `/books/${getEncodedUri(query)}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize, "column": column, "beta": beta};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets publisher details
    #
    # + name - The name of a publisher in the Publisher's database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + return - The publisher name was found in the database 
    remote isolated function getPublisherDetails(string name, int page = 1, int pageSize = 20) returns Publisher|error {
        string resourcePath = string `/publisher/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Publisher response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search publishers
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Publisher’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the publisher's database 
    remote isolated function searchPublishers(string query, string? pageSize = (), string? page = ()) returns http:Response|error {
        string resourcePath = string `/publishers/${getEncodedUri(query)}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search all ISBNDB databases
    #
    # + index - Only this values are valids: subjects, publishers, authors y books 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + isbn - an ISBN 10 in the Books database 
    # + isbn13 - an ISBN 13 in the Books database 
    # + author - The name of an author in the Author's database 
    # + text - A string to search for determinated index database 
    # + subject - A subject in the Subject's database 
    # + publisher - The name of a publisher in the Publisher's database 
    # + return - Results were found in the requested database 
    remote isolated function searchISBNDB(string index, string? page = (), string? pageSize = (), string? isbn = (), string? isbn13 = (), string? author = (), string? text = (), string? subject = (), string? publisher = ()) returns http:Response|error {
        string resourcePath = string `/search/${getEncodedUri(index)}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize, "isbn": isbn, "isbn13": isbn13, "author": author, "text": text, "subject": subject, "publisher": publisher};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets status on the ISBNDB Database
    #
    # + return - Stats on the ISBNDB sucessfully retrieved 
    remote isolated function getISBNDBStatus() returns http:Response|error {
        string resourcePath = string `/stats`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets subject details
    #
    # + name - A subject in the Subject's database 
    # + return - The subject was found in the database 
    remote isolated function getSubjectDetails(string name) returns Subject|error {
        string resourcePath = string `/subject/${getEncodedUri(name)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Subject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search subjects
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Subject’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the subject's database 
    remote isolated function searchSubject(string query, string? pageSize = (), string? page = ()) returns http:Response|error {
        string resourcePath = string `/subjects/${getEncodedUri(query)}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
