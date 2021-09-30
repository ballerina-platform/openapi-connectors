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
    # Represents API Key `api_key`
    string apiKey;
|};

# This is a generated connector for [Dataflow Kit API v1.3](https://dataflowkit.com/doc-api) OpenAPI Specification.
# Render Javascript driven pages, while we internally manage Headless Chrome and proxies for you. 
# 
# - Build a custom web scraper with our Visual point-and-click toolkit.
# - Scrape the most popular Search engines result pages (SERP).
# - Convert web pages to PDF and capture screenshots.
# ***
# ### Authentication
# Dataflow Kit API require you to sign up for an API key in order to use the API. 
# 
# The API key can be found in the [DFK Dashboard](https://account.dataflowkit.com) after _free registration_.
# 
# Pass a secret API Key to all API requests to the server as the `api_key` query parameter. 
@display {label: "Dataflow Kit", iconPath: "resources/dataflowkit.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Dataflow Kit account](https://account.dataflowkit.com/signup) and obtain tokens by following [this guide](https://dataflowkit.com/doc-api#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.dataflowkit.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Save web page as PDF
    #
    # + payload - URL to be converted 
    # + return - A PDF file. 
    remote isolated function urlToPdf(Url2pdfrequest payload) returns string|error {
        string  path = string `/convert/url/pdf`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, targetType=string);
        return response;
    }
    # Capture web page Screenshots.
    #
    # + payload - URL to be converted 
    # + return - Returns jpg or png file. 
    remote isolated function urlToScreenshot(Url2screenshotrequest payload) returns string|error {
        string  path = string `/convert/url/screenshot`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, targetType=string);
        return response;
    }
    # Download web page content
    #
    # + payload - - _Base fetcher type_ is the right choice for fetching server-side rendered pages. It takes fewer resources and works faster than rendering HTML with _Chrome fetcher_ 
    # + return - Returns utf8 encoded web page content. 
    remote isolated function fetch(Fetchrequest payload) returns json|error {
        string  path = string `/fetch`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Extract structured data from web pages
    #
    # + payload - ### Field types and attributes 
    # + return - Returns data in the one of the follwing formats - JSON, JSON Lines, CSV, MS Excel, XML 
    remote isolated function parse(Parserequest payload) returns json|error {
        string  path = string `/parse`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Collect search results from search engines
    #
    # + payload - <h2>Search parameters</h2> 
    # + return - Returns data in the one of the follwing formats - JSON, JSON Lines, CSV, MS Excel, XML 
    remote isolated function serp(Serprequest payload) returns json|error {
        string  path = string `/serp`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
}
