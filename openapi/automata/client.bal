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

# This is a generated connector for [Automata API v1.0.1](https://byautomata.io/api/) OpenAPI specification.
# The Automata API provides the capability to identify the market intelligence.
@display {label: "Automata", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Obtain tokens by following [this guide](https://apis.byautomata.io/?ref=api_landing_0).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.byautomata.io/") returns error? {
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
    # Send a company website to receive a list of companies related to them.
    #
    # + link - We'll provide information about related companies based on the site you provide. If a LinkedIn page is sent, we will try to identify the company related to the page. Ex. https://api.byautomata.io/similar?link=ibm.com 
    # + page - Page number of search results. Ex. https://api.byautomata.io/similar?link=ibm.com&page=1 
    # + return - A successful operation 
    remote isolated function getSimilar(string link, string page = "0") returns SimilarCompanyResponse|error {
        string resourcePath = string `/similar`;
        map<anydata> queryParam = {"link": link, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SimilarCompanyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send search terms to receive the most relevant companies along with text snippets.
    #
    # + terms - We provide information about related companies based on the search terms you provide. Separate search terms with commas. Ex. https://api.byautomata.io/search?link=cloud+computing,enterprise,security 
    # + page - Page number of search results. Ex. https://api.byautomata.io/search?page=0&link=cloud+computing,enterprise,security 
    # + return - A successful operation 
    remote isolated function search(string terms, string page = "0") returns SearchResponse|error {
        string resourcePath = string `/search`;
        map<anydata> queryParam = {"terms": terms, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SearchResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # The /contentpro-similar-text endpoint accepts and arbitrary piece of text and returns similar articles and blogs written by companies.
    #
    # + return - A successful operation 
    remote isolated function searchSimilarText() returns SimilarTextResponse|error {
        string resourcePath = string `/contentpro-similar-text`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SimilarTextResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send search terms to receive the most relevant articles and companies.
    #
    # + terms - We provide information about related companies and articles based on the search terms you provide. Separate search terms with commas. Ex. https://api.byautomata.io/contentpro-search?terms=cloud+computing,enterprise,security 
    # + return - A successful operation 
    remote isolated function searchContent(string terms) returns ContentSearchResponse|error {
        string resourcePath = string `/contentpro-search`;
        map<anydata> queryParam = {"terms": terms};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContentSearchResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
