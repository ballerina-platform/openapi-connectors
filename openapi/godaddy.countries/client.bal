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
    # Represents API Key 'Authorization'
    string authorization;
|};

# This is a generated connector for [GoDaddy Countries API v1](https://developer.godaddy.com/doc/endpoint/countries) OpenAPI specification.
# The GoDaddy Countries API provides capability to access GoDaddy operations related to countries.
@display {label: "GoDaddy Countries", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieves summary country information for the provided marketId and filters
    #
    # + marketId - MarketId in which the request is being made, and for which responses should be localized 
    # + regionTypeId - Restrict countries to this region type; required if regionName is supplied 
    # + regionName - Restrict countries to this region name; required if regionTypeId is supplied 
    # + sort - The term to sort the result countries by. 
    # + 'order - The direction to sort the result countries by. 
    # + return - Request was successful 
    remote isolated function getCountries(string marketId, int? regionTypeId = (), string? regionName = (), string sort = "key", string 'order = "ascending") returns ArrayOfCountrySummary|error {
        string resourcePath = string `/v1/countries`;
        map<anydata> queryParam = {"marketId": marketId, "regionTypeId": regionTypeId, "regionName": regionName, "sort": sort, "order": 'order};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ArrayOfCountrySummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves country and summary state information for provided countryKey
    #
    # + countryKey - The country key 
    # + marketId - MarketId in which the request is being made, and for which responses should be localized 
    # + sort - The term to sort the result country states by. 
    # + 'order - The direction to sort the result country states by. 
    # + return - Request was successful 
    remote isolated function getCountry(string countryKey, string marketId, string sort = "key", string 'order = "ascending") returns ArrayOfCountry|error {
        string resourcePath = string `/v1/countries/${countryKey}`;
        map<anydata> queryParam = {"marketId": marketId, "sort": sort, "order": 'order};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ArrayOfCountry response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
