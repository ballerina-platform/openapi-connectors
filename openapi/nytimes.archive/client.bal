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

# This is a generated connector for [New York Times Archive API v1.0.0](https://developer.nytimes.com/docs/archive-product/1/overview) OpenAPI specification. 
# With the New York Times Archive API you can get all NYTimes article metadata for a given month. The Archive API returns an array of NYT articles for a given month, going back to 1851. Its response fields are the same as the Article Search API. 
# The Archive API is very useful if you want to build your own database of NYT article metadata. You simply pass the API the year and month and it returns all articles for that month. The response size can be large (~20mb).
@display {label: "New York Times Archive", iconPath: "resources/nytimes.archive.svg"}
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/archive/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Archive API
    #
    # + year - The year (e.g. 2016). 
    # + month - The month number (e.g. 1 for January). 
    # + return - The docs requested. 
    remote isolated function getArticles(int year, int month) returns InlineResponse200|error {
        string  path = string `/${year}/${month}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
}
