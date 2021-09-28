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

# This is a generated connector for [GoDaddy Orders API v1](https://developer.godaddy.com/doc/endpoint/orders) OpenAPI specification.
# The GoDaddy Orders API provides capability to access GoDaddy operations related to orders.
@display {label: "GoDaddy Orders", iconPath: "resources/godaddy.orders.svg"}
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
    # Retrieve a list of orders for the authenticated shopper. Only one filter may be used at a time
    #
    # + periodStart - Start of range indicating what time-frame should be returned. Inclusive 
    # + periodEnd - End of range indicating what time-frame should be returned. Inclusive 
    # + domain - Domain name to use as the filter of results 
    # + productGroupId - Product group id to use as the filter of results 
    # + paymentProfileId - Payment profile id to use as the filter of results 
    # + parentOrderId - Parent order id to use as the filter of results 
    # + offset - Number of results to skip for pagination 
    # + 'limit - Maximum number of items to return 
    # + sort - Property name that will be used to sort results. '-' indicates descending 
    # + xShopperId - Shopper ID to be operated on, if different from JWT<br/><b>Reseller subaccounts are not supported</b> 
    # + xMarketId - Unique identifier of the Market in which the request is happening 
    # + return - Request was successful 
    remote isolated function listOrders(string? periodStart = (), string? periodEnd = (), string? domain = (), int? productGroupId = (), int? paymentProfileId = (), string? parentOrderId = (), int offset = 0, int 'limit = 25, string sort = "-createdAt", string? xShopperId = (), string xMarketId = "en-US") returns OrderList|error {
        string  path = string `/v1/orders`;
        map<anydata> queryParam = {"periodStart": periodStart, "periodEnd": periodEnd, "domain": domain, "productGroupId": productGroupId, "paymentProfileId": paymentProfileId, "parentOrderId": parentOrderId, "offset": offset, "limit": 'limit, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderList response = check self.clientEp-> get(path, accHeaders, targetType = OrderList);
        return response;
    }
    # Retrieve details for specified order
    #
    # + orderId - Order id whose details are to be retrieved 
    # + xShopperId - Shopper ID to be operated on, if different from JWT<br/><b>Reseller subaccounts are not supported</b> 
    # + xMarketId - Unique identifier of the Market in which the request is happening 
    # + return - Request was successful 
    remote isolated function getOrderByID(string orderId, string? xShopperId = (), string xMarketId = "en-US") returns Order|error {
        string  path = string `/v1/orders/${orderId}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Order response = check self.clientEp-> get(path, accHeaders, targetType = Order);
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
