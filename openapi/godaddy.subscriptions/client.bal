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

# This is a generated connector for [GoDaddy Subscriptions API v1](https://developer.godaddy.com/doc/endpoint/subscriptions) OpenAPI specification.
# The GoDaddy subscriptions API provides capability to access GoDaddy operations related to subscriptions.
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "//api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Retrieve a list of Subscriptions for the specified Shopper
    #
    # + xShopperId - Shopper ID to return subscriptions for when not using JWT 
    # + xMarketId - The market that the response should be formatted for 
    # + productGroupKeys - Only return Subscriptions with the specified product groups 
    # + includes - Optional details to be included in the response 
    # + offset - Number of Subscriptions to skip before starting to return paged results (must be a multiple of the limit) 
    # + 'limit - Number of Subscriptions to retrieve in this page, starting after offset 
    # + sort - Property name that will be used to sort results. "-" indicates descending 
    # + return - Request was successful 
    remote isolated function listSubscriptions(string? xShopperId = (), string xMarketId = "en-US", string[]? productGroupKeys = (), string[]? includes = (), int offset = 0, int 'limit = 25, string sort = "-expiresAt") returns SubscriptionList|error {
        string  path = string `/v1/subscriptions`;
        map<anydata> queryParam = {"productGroupKeys": productGroupKeys, "includes": includes, "offset": offset, "limit": 'limit, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionList response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionList);
        return response;
    }
    # Retrieve a list of ProductGroups for the specified Shopper
    #
    # + xShopperId - Shopper ID to return data for when not using JWT 
    # + xMarketId - The market that the response should be formatted for 
    # + return - Request was successful 
    remote isolated function listProductGroups(string? xShopperId = (), string xMarketId = "en-US") returns ProductGroup[]|error {
        string  path = string `/v1/subscriptions/productGroups`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProductGroup[] response = check self.clientEp-> get(path, accHeaders, targetType = ProductGroupArr);
        return response;
    }
    # Retrieve details for the specified Subscription
    #
    # + subscriptionId - Unique identifier of the Subscription to retrieve 
    # + xShopperId - Shopper ID to be operated on, if different from JWT 
    # + xMarketId - Unique identifier of the Market in which the request is happening 
    # + return - Request was successful 
    remote isolated function getSubscription(string subscriptionId, string? xShopperId = (), string xMarketId = "en-US") returns Subscription|error {
        string  path = string `/v1/subscriptions/${subscriptionId}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Subscription response = check self.clientEp-> get(path, accHeaders, targetType = Subscription);
        return response;
    }
    # Cancel the specified Subscription
    #
    # + subscriptionId - Unique identifier of the Subscription to cancel 
    # + xShopperId - Shopper ID to cancel subscriptions for when not using JWT 
    # + return - Request was successful 
    remote isolated function cancelSubscription(string subscriptionId, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/subscriptions/${subscriptionId}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update details for the specified Subscription
    #
    # + subscriptionId - Unique identifier of the Subscription to update 
    # + payload - Details of the Subscription to change 
    # + return - Request was successful 
    remote isolated function updateSubscription(string subscriptionId, SubscriptionUpdate payload) returns http:Response|error {
        string  path = string `/v1/subscriptions/${subscriptionId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
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
