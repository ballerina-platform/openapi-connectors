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
    # All Automata API endpoints require an API key distributed by Automata. Retrieve an API key at https://apis.byautomata.io for the /similar and /search endpoints. The ContentPro API endpoints are not included in the standard Market Intelligence API plans. Contact support@byautomata.io for access.
    string xApiKey;
|};

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
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.byautomata.io/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Send a company website to receive a list of companies related to them.
    #
    # + link - We'll provide information about related companies based on the site you provide. If a LinkedIn page is sent, we will try to identify the company related to the page. Ex. https://api.byautomata.io/similar?link=ibm.com 
    # + page - Page number of search results. Ex. https://api.byautomata.io/similar?link=ibm.com&page=1 
    # + return - A successful operation 
    remote isolated function getSimilar(string link, string page = "0") returns SimilarCompanyResponse|error {
        string  path = string `/similar`;
        map<anydata> queryParam = {"link": link, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SimilarCompanyResponse response = check self.clientEp-> get(path, accHeaders, targetType = SimilarCompanyResponse);
        return response;
    }
    # Send search terms to receive the most relevant companies along with text snippets.
    #
    # + terms - We provide information about related companies based on the search terms you provide. Separate search terms with commas. Ex. https://api.byautomata.io/search?link=cloud+computing,enterprise,security 
    # + page - Page number of search results. Ex. https://api.byautomata.io/search?page=0&link=cloud+computing,enterprise,security 
    # + return - A successful operation 
    remote isolated function search(string terms, string page = "0") returns SearchResponse|error {
        string  path = string `/search`;
        map<anydata> queryParam = {"terms": terms, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SearchResponse response = check self.clientEp-> get(path, accHeaders, targetType = SearchResponse);
        return response;
    }
    # The /contentpro-similar-text endpoint accepts and arbitrary piece of text and returns similar articles and blogs written by companies.
    #
    # + return - A successful operation 
    remote isolated function searchSimilarText() returns SimilarTextResponse|error {
        string  path = string `/contentpro-similar-text`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SimilarTextResponse response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = SimilarTextResponse);
        return response;
    }
    # Send search terms to receive the most relevant articles and companies.
    #
    # + terms - We provide information about related companies and articles based on the search terms you provide. Separate search terms with commas. Ex. https://api.byautomata.io/contentpro-search?terms=cloud+computing,enterprise,security 
    # + return - A successful operation 
    remote isolated function searchContent(string terms) returns ContentSearchResponse|error {
        string  path = string `/contentpro-search`;
        map<anydata> queryParam = {"terms": terms};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ContentSearchResponse response = check self.clientEp-> get(path, accHeaders, targetType = ContentSearchResponse);
        return response;
    }
}
