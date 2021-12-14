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
    # Represents API Key `Ocp-Apim-Subscription-Key`
    string ocpApimSubscriptionKey;
    # Represents API Key `subscription-key`
    string subscriptionKey;
|};

# This is a generated connector for [Bing Autosuggest API v1](https://www.microsoft.com/en-us/bing/apis/bing-autosuggest-api) OpenAPI specification.
# "The Autosuggest API lets partners send a partial search query to Bing\ \ and get back a list of suggested queries that other users have searched on.\ \ In addition to including searches that other users have made, the list may include\ \ suggestions based on user intent. For example, if the query string is weather\ \ in Lo, the list will include relevant weather suggestions.\r\n<br><br>\r\nTypically,\ \ you use this API to support an auto-suggest search box feature. For example,\ \ as the user types a query into the search box, you would call this API to populate\ \ a drop-down list of suggested query strings. If the user selects a query from\ \ the list, you would either send the user to the Bing search results page for\ \ the selected query or call the Bing Search API to get the search results and\ \ display the results yourself.\r\n"
@display {label: "Bing Autosuggest", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Bing Text Analytics account](https://azure.microsoft.com/en-us/services/cognitive-services/text-analytics/) and obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Suggestions
    #
    # + q - Query 
    remote isolated function getSuggestions(string q) returns json|error {
        string resourcePath = string `/`;
        map<anydata> queryParam = {"q": q, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
