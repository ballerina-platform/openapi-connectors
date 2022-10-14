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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the Who Hosts This API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `key`. API Keys available at https://www.who-hosts-this.com/API
    string 'key;
|};

# This is a generated connector for [Who Hosts This API v0.0.1](https://www.who-hosts-this.com/Documentation) OpenAPI specification.
# The Who Hosts This API provides services to get discover the hosting provider for any web site.
@display {label: "Who Hosts This", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Who Hosts This Account](https://www.who-hosts-this.com/Profile?cmd=RegisterForm) and obtain token by following [this link](https://www.who-hosts-this.com/APIKey).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://www.who-hosts-this.com/APIEndpoint") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Discover the hosting provider for a web site
    #
    # + url - The url of the page to check 
    # + return - Status of the detection and list of any found hosting providers 
    remote isolated function discoverHostingProvider(string url) returns json|error {
        string resourcePath = string `/Detect`;
        map<anydata> queryParam = {"url": url, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # View usage details for the current billing period
    #
    # + return - Status of the detection and list of any found hosting providers 
    remote isolated function listHostingProvider() returns json|error {
        string resourcePath = string `/Status`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
}
