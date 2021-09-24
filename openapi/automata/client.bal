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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Automata API v1.0.1](https://byautomata.io/api/) OpenAPI specification.
# The Automata API provides the capability to identify the market intelligence.
@display {label: "Automata", iconPath: "resources/automata.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Obtain tokens by following [this guide](https://apis.byautomata.io/?ref=api_landing_0).
    #
    # + apiKeyConfig - Provide your API Key as x-api-key. Eg: {x-api-key : <Your API Key>} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.byautomata.io/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
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
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
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
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SearchResponse response = check self.clientEp-> get(path, accHeaders, targetType = SearchResponse);
        return response;
    }
    # The /contentpro-similar-text endpoint accepts and arbitrary piece of text and returns similar articles and blogs written by companies.
    #
    # + return - A successful operation 
    remote isolated function searchSimilarText() returns SimilarTextResponse|error {
        string  path = string `/contentpro-similar-text`;
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
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
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ContentSearchResponse response = check self.clientEp-> get(path, accHeaders, targetType = ContentSearchResponse);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
