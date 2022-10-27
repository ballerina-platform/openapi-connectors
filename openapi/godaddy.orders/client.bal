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

# This is a generated connector for [GoDaddy Orders API v1](https://developer.godaddy.com/doc/endpoint/orders) OpenAPI specification.
# The GoDaddy Orders API provides capability to access GoDaddy operations related to orders.
@display {label: "GoDaddy Orders", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
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
        string resourcePath = string `/v1/orders`;
        map<anydata> queryParam = {"periodStart": periodStart, "periodEnd": periodEnd, "domain": domain, "productGroupId": productGroupId, "paymentProfileId": paymentProfileId, "parentOrderId": parentOrderId, "offset": offset, "limit": 'limit, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve details for specified order
    #
    # + orderId - Order id whose details are to be retrieved 
    # + xShopperId - Shopper ID to be operated on, if different from JWT<br/><b>Reseller subaccounts are not supported</b> 
    # + xMarketId - Unique identifier of the Market in which the request is happening 
    # + return - Request was successful 
    remote isolated function getOrderByID(string orderId, string? xShopperId = (), string xMarketId = "en-US") returns Order|error {
        string resourcePath = string `/v1/orders/${getEncodedUri(orderId)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Order response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
