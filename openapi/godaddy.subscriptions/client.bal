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
    string authorization;
|};

# This is a generated connector for [GoDaddy Subscriptions API v1](https://developer.godaddy.com/doc/endpoint/subscriptions) OpenAPI specification.
# The GoDaddy Subscriptions API provides capability to access GoDaddy operations related to subscriptions.
@display {label: "GoDaddy Subscriptions", iconPath: "icon.png"}
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
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
        string resourcePath = string `/v1/subscriptions`;
        map<anydata> queryParam = {"productGroupKeys": productGroupKeys, "includes": includes, "offset": offset, "limit": 'limit, "sort": sort};
        map<Encoding> queryParamEncoding = {"productGroupKeys": {style: FORM, explode: false}, "includes": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a list of ProductGroups for the specified Shopper
    #
    # + xShopperId - Shopper ID to return data for when not using JWT 
    # + xMarketId - The market that the response should be formatted for 
    # + return - Request was successful 
    remote isolated function listProductGroups(string? xShopperId = (), string xMarketId = "en-US") returns ProductGroup[]|error {
        string resourcePath = string `/v1/subscriptions/productGroups`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductGroup[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve details for the specified Subscription
    #
    # + xShopperId - Shopper ID to be operated on, if different from JWT 
    # + xMarketId - Unique identifier of the Market in which the request is happening 
    # + subscriptionId - Unique identifier of the Subscription to retrieve 
    # + return - Request was successful 
    remote isolated function getSubscription(string subscriptionId, string? xShopperId = (), string xMarketId = "en-US") returns Subscription|error {
        string resourcePath = string `/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Subscription response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel the specified Subscription
    #
    # + xShopperId - Shopper ID to cancel subscriptions for when not using JWT 
    # + subscriptionId - Unique identifier of the Subscription to cancel 
    # + return - Request was successful 
    remote isolated function cancelSubscription(string subscriptionId, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update details for the specified Subscription
    #
    # + subscriptionId - Unique identifier of the Subscription to update 
    # + payload - Details of the Subscription to change 
    # + return - Request was successful 
    remote isolated function updateSubscription(string subscriptionId, SubscriptionUpdate payload) returns http:Response|error {
        string resourcePath = string `/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
