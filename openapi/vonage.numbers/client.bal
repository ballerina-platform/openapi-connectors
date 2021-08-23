// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [Vonage Numbers API v1.0.20](https://nexmo-api-specification.herokuapp.com/numbers) OpenAPI specification.
# The Numbers API enables you to manage your existing numbers and buy new virtual numbers for use with the Vonage APIs. 
# Further information is here: <https://developer.nexmo.com/numbers/overview>
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://www.vonage.com/) and obtain tokens by following [this guide](https://developer.nexmo.com/concepts/guides/authentication).
    #
    # + apiKeyConfig - Provide your API keys as `api_key` and `api_secret`. Eg: `{"api_key" : "<API key>", "api_secret" : "<API secret>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://rest.nexmo.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # List the numbers you own
    #
    # + applicationId - The Application that you want to return the numbers for.
    # + hasApplication - Set this optional field to `true` to restrict your results to numbers
    # + country - The two character country code in ISO 3166-1 alpha-2 format
    # + pattern - The number pattern you want to search for. Use in conjunction with `search_pattern`.
    # + searchPattern - The strategy you want to use for matching:
    # + size - Page size
    # + index - Page index
    # + return - OK
    remote isolated function getOwnedNumbers(string? applicationId = (), boolean? hasApplication = (), string? country = (), string? pattern = (), int searchPattern = 0, int size = 10, int index = 1) returns InboundNumbers|error {
        string  path = string `/account/numbers`;
        map<anydata> queryParam = {"application_id": applicationId, "has_application": hasApplication, "country": country, "pattern": pattern, "search_pattern": searchPattern, "size": size, "index": index, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        InboundNumbers response = check self.clientEp-> get(path, targetType = InboundNumbers);
        return response;
    }
    # Search available numbers
    #
    # + country - The two character country code to filter on (in ISO 3166-1 alpha-2 format)
    # + 'type - Set this parameter to filter the type of number, such as mobile or landline
    # + pattern - The number pattern you want to search for. Use in conjunction with `search_pattern`.
    # + searchPattern - The strategy you want to use for matching:
    # + features - Available features are `SMS`, `VOICE` and `MMS`. To look for numbers that support multiple features, use a comma-separated value: `SMS,MMS,VOICE`.
    # + size - Page size
    # + index - Page index
    # + return - OK
    remote isolated function getAvailableNumbers(string country, string? 'type = (), string? pattern = (), int searchPattern = 0, string? features = (), int size = 10, int index = 1) returns AvailableNumbers|error {
        string  path = string `/number/search`;
        map<anydata> queryParam = {"country": country, "type": 'type, "pattern": pattern, "search_pattern": searchPattern, "features": features, "size": size, "index": index, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        AvailableNumbers response = check self.clientEp-> get(path, targetType = AvailableNumbers);
        return response;
    }
    # Buy a number
    #
    # + payload - Number details
    # + return - OK
    remote isolated function buyANumber(NumberDetails payload) returns Response|error {
        string  path = string `/number/buy`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Response response = check self.clientEp->post(path, request, targetType=Response);
        return response;
    }
    # Cancel a number
    #
    # + payload - Number details
    # + return - OK
    remote isolated function cancelANumber(NumberDetails payload) returns Response|error {
        string  path = string `/number/cancel`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Response response = check self.clientEp->post(path, request, targetType=Response);
        return response;
    }
    # Update a number
    #
    # + payload - Number details
    # + return - OK
    remote isolated function updateANumber(NumberDetailsUpdate payload) returns Response|error {
        string  path = string `/number/update`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Response response = check self.clientEp->post(path, request, targetType=Response);
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
