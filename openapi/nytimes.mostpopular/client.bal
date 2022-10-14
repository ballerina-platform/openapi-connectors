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
    # Represents API Key `api-key`
    string apiKey;
|};

# This is a generated connector from [New York Times Most Popular API v2.0.0](https://developer.nytimes.com/docs/most-popular-product/1/overview) OpenAPI specification.
# With the New York Times Most Popular API you can get popular articles on NYTimes.com. 
# The Most Popular API provides services for getting the most popular articles on NYTimes.com based on emails, shares, or views.
@display {label: "New York Times Most Popular", iconPath: "icon.png"}
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/mostpopular/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Most Emailed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostemailed(string section, string timePeriod) returns InlineResponse200|error {
        string resourcePath = string `/mostemailed/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Most Shared by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostshared(string section, string timePeriod) returns InlineResponse2001|error {
        string resourcePath = string `/mostshared/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Most Viewed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use `all-sections` or one or more section names seperated by semicolons. See `viewed/sections.json` call to get a list of sections.  
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content. 
    # + return - An array of Articles 
    remote isolated function getMostviewed(string section, string timePeriod) returns InlineResponse2001|error {
        string resourcePath = string `/mostviewed/${getEncodedUri(section)}/${getEncodedUri(timePeriod)}.json`;
        map<anydata> queryParam = {"api-key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
