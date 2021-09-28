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

# This is a generated connector for [GoDaddy Countries API v1](https://developer.godaddy.com/doc/endpoint/countries) OpenAPI specification.
# The GoDaddy Countries API provides capability to access GoDaddy operations related to countries.
@display {label: "GoDaddy Countries", iconPath: "resources/godaddy.countries.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization : sso-key [<API_KEY>]:[<API_SECRET>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
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
        string  path = string `/v1/countries`;
        map<anydata> queryParam = {"marketId": marketId, "regionTypeId": regionTypeId, "regionName": regionName, "sort": sort, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArrayOfCountrySummary response = check self.clientEp-> get(path, accHeaders, targetType = ArrayOfCountrySummary);
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
        string  path = string `/v1/countries/${countryKey}`;
        map<anydata> queryParam = {"marketId": marketId, "sort": sort, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArrayOfCountry response = check self.clientEp-> get(path, accHeaders, targetType = ArrayOfCountry);
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
