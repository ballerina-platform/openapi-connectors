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

# This is a generated connector for [Bing Autosuggest API v1](https://www.microsoft.com/en-us/bing/apis/bing-autosuggest-api) OpenAPI specification.
# "The Autosuggest API lets partners send a partial search query to Bing\ \ and get back a list of suggested queries that other users have searched on.\ \ In addition to including searches that other users have made, the list may include\ \ suggestions based on user intent. For example, if the query string is weather\ \ in Lo, the list will include relevant weather suggestions.\r\n<br><br>\r\nTypically,\ \ you use this API to support an auto-suggest search box feature. For example,\ \ as the user types a query into the search box, you would call this API to populate\ \ a drop-down list of suggested query strings. If the user selects a query from\ \ the list, you would either send the user to the Bing search results page for\ \ the selected query or call the Bing Search API to get the search results and\ \ display the results yourself.\r\n"
@display {label: "Bing Autosuggest", iconPath: "resources/bing.autosuggest.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Bing Text Analytics account](https://azure.microsoft.com/en-us/services/cognitive-services/text-analytics/) and obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal).
    #
    # + apiKeyConfig - Provide your API keys as Ocp-Apim-Subscription-Key & subscription-key . Eg: {"Ocp-Apim-Subscription-Key" : "<API key>", "subscription-key" : "<API key>"} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Suggestions
    #
    # + q - Query 
    remote isolated function getSuggestions(string q) returns json|error {
        string  path = string `/`;
        map<anydata> queryParam = {"q": q, "subscription-key": self.apiKeys["subscription-key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeys["Ocp-Apim-Subscription-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
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
