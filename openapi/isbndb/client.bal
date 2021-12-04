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
    # All requests on the ISBNdb.com API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`.
    string authorization;
|};

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
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api2.isbndb.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Gets author details
    #
    # + name - The name of an author in the Author's database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + return - The author name was found in the database 
    remote isolated function getAuthorDetails(string name, int page = 1, int pageSize = 20) returns Author|error {
        string  path = string `/author/${name}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Author response = check self.clientEp-> get(path, accHeaders, targetType = Author);
        return response;
    }
    # Search authors
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Author’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the author's database 
    remote isolated function searchAuthors(string query, string? pageSize = (), string? page = ()) returns AuthorQueryResults|error {
        string  path = string `/authors/${query}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AuthorQueryResults response = check self.clientEp-> get(path, accHeaders, targetType = AuthorQueryResults);
        return response;
    }
    # Gets book details
    #
    # + isbn - an ISBN 10 or ISBN 13 in the Books database 
    # + withPrices - indicate if shows Real Time Prices. Only with the Pro plan 
    # + return - The book ISBN was found in the database 
    remote isolated function getBookDetails(string isbn, string? withPrices = ()) returns Book|error {
        string  path = string `/book/${isbn}`;
        map<anydata> queryParam = {"with_prices": withPrices};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Book response = check self.clientEp-> get(path, accHeaders, targetType = Book);
        return response;
    }
    # Search books
    #
    # + payload - Request payload to search to search books 
    # + return - The query string found results in the book's database 
    remote isolated function searchBooks(BooksBody payload) returns http:Response|error {
        string  path = string `/books`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
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
        string  path = string `/books/${query}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize, "column": column, "beta": beta};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Gets publisher details
    #
    # + name - The name of a publisher in the Publisher's database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + return - The publisher name was found in the database 
    remote isolated function getPublisherDetails(string name, int page = 1, int pageSize = 20) returns Publisher|error {
        string  path = string `/publisher/${name}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Publisher response = check self.clientEp-> get(path, accHeaders, targetType = Publisher);
        return response;
    }
    # Search publishers
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Publisher’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the publisher's database 
    remote isolated function searchPublishers(string query, string? pageSize = (), string? page = ()) returns http:Response|error {
        string  path = string `/publishers/${query}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
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
        string  path = string `/search/${index}`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize, "isbn": isbn, "isbn13": isbn13, "author": author, "text": text, "subject": subject, "publisher": publisher};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Gets status on the ISBNDB Database
    #
    # + return - Stats on the ISBNDB sucessfully retrieved 
    remote isolated function getISBNDBStatus() returns http:Response|error {
        string  path = string `/stats`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Gets subject details
    #
    # + name - A subject in the Subject's database 
    # + return - The subject was found in the database 
    remote isolated function getSubjectDetails(string name) returns Subject|error {
        string  path = string `/subject/${name}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Subject response = check self.clientEp-> get(path, accHeaders, targetType = Subject);
        return response;
    }
    # Search subjects
    #
    # + pageSize - How many items should be returned per page, maximum of 1,000 
    # + query - A string to search for in the Subject’s database 
    # + page - The number of page to retrieve, please note the API will not return more than 10,000 results no matter how you paginate them 
    # + return - The query string found results in the subject's database 
    remote isolated function searchSubject(string query, string? pageSize = (), string? page = ()) returns http:Response|error {
        string  path = string `/subjects/${query}`;
        map<anydata> queryParam = {"pageSize": pageSize, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
}
