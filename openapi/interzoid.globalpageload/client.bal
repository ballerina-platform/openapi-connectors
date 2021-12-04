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
    # All requests on this API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `license`.
    string license;
|};

# This is a generated connector for [Interzoid Global Page Load Performance API v1.0.0](https://interzoid.com/services/globalpageload) OpenAPI specification.
# This API provides a timed, browser-simulated page load function (or a measured API call) from the specified geography using a server from that geography.
# For additional help getting started with the API,  visit [Interzoid Global Page Load Performance API](https://interzoid.com/services/globalpageload)
@display {label: "Interzoid Global Page Load Performance", iconPath: "icon.png"}
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
    }
    # Gets page load (or an API call) performance from a specified global geography such as Paris, Tokyo, Virginia, Mumbai, Frankfurt, London, Seoul, California, Sao Paolo, and many more.
    #
    # + origin - Geographic location to perform the measurement from (Paris, Hong Kong, Seoul, Mumbai, Sao Paolo, London, etc. see API home page for full list) 
    # + url - specific URL to perform load test time 
    # + return - Page load performance measurement response 
    remote isolated function getGlobalPageLoad(string origin, string url) returns PageLoadPerformance|error {
        string  path = string `/globalpageload`;
        map<anydata> queryParam = {"origin": origin, "url": url, "license": self.apiKeyConfig.license};
        path = path + check getPathForQueryParam(queryParam);
        PageLoadPerformance response = check self.clientEp-> get(path, targetType = PageLoadPerformance);
        return response;
    }
}
