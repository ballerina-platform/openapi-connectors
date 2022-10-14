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
    # All requests on the State Data API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `license`.
    string license;
|};

# This is a generated connector for [Interzoid State Data API v1.0.0] (https://www.interzoid.com/services/getstateabbreviation) OpenAPI specification.
# This API provides the two-letter state abbreviation  (or the province abbreviation for Canada) for the purposes of standardizing state name data,  improving query results, analytics, and data merging.
# For additional help getting started with the API,  visit [Interzoid State Data API](https://www.interzoid.com/services/getstateabbreviation).
@display {label: "Interzoid State Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Interzoid Account](https://www.interzoid.com/register)  and obtain tokens by log into [Interzoid Account](https://www.interzoid.com/account).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.interzoid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Gets a two-letter abbreviation for a state or province name data
    #
    # + state - State (or province) name from which to retrieve the two letter abbreviation. 
    # + return - State (or province) standardized two-letter abbreviation 
    remote isolated function getstateabbreviation(string state) returns StateData|error {
        string resourcePath = string `/getstateabbreviation`;
        map<anydata> queryParam = {"state": state, "license": self.apiKeyConfig.license};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StateData response = check self.clientEp->get(resourcePath);
        return response;
    }
}
