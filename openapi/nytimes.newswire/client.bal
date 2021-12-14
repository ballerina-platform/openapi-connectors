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
    # Represents API Key `api-key`
    string apiKey;
|};

# This is a generated connector for [New York Times Newswire API v3.0.0](https://developer.nytimes.com/docs/timeswire-product/1/overview) OpenAPI specification.
# With the Times Newswire API, you can get links and metadata for Times' articles as soon as they are published on NYTimes.com. 
# The Times Newswire API provides an up-to-the-minute stream of published articles. You can filter results by source (all, nyt, inyt) and section (arts, business, ...).
@display {label: "New York Times Newswire", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [NYTimes account](https://developer.nytimes.com/accounts/login) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/news/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get articles.
    #
    # + url - The complete URL of a specific news item, URL-encoded or backslash-escaped 
    # + return - An array of Articles 
    remote isolated function getContents(string url) returns InlineResponse200|error {
        string resourcePath = string `/content.json`;
        map<anydata> queryParam = {"url": url, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Filter articles by source and section.
    #
    # + 'source - Limits the set of items by originating source all = items from both The New York Times and The International New York Times nyt = New York Times items only iht = International New York Times items only 
    # + section - Limits the set of items by one or more sections all | One or more section names, separated by semicolons  To get all sections, specify all. To get a particular section or sections, use the section names returned by this request:  http://api.nytimes.com/svc/news/v3/content/section-list.json 
    # + 'limit - Limits the number of results, between 1 and 20 
    # + offset - Sets the starting point of the result set 
    # + return - An array of Articles 
    remote isolated function filterContents(string 'source, string section, int 'limit = 20, int offset = 0) returns InlineResponse200|error {
        string resourcePath = string `/content/${'source}/${section}.json`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Filter articles by source, section and time period.
    #
    # + 'source - Limits the set of items by originating source all = items from both The New York Times and The International New York Times nyt = New York Times items only iht = International New York Times items only 
    # + section - Limits the set of items by one or more sections all | One or more section names, separated by semicolons  To get all sections, specify all. To get a particular section or sections, use the section names returned by this request:  http://api.nytimes.com/svc/news/v3/content/section-list.json 
    # + timePeriod - Limits the set of items by time published, integer in number of hours 
    # + 'limit - Limits the number of results, between 1 and 20 
    # + offset - Sets the starting point of the result set 
    # + return - An array of Articles 
    remote isolated function filterContentsByTime(string 'source, string section, int timePeriod, int 'limit = 20, int offset = 0) returns InlineResponse200|error {
        string resourcePath = string `/content/${'source}/${section}/${timePeriod}.json`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
