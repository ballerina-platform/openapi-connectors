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

# Move your app forward with the Uber API
@display {label: "Uber", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.uber.com/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        return;
    }
    # Product Types
    #
    # + latitude - Latitude component of location. 
    # + longitude - Longitude component of location. 
    # + return - An array of products 
    remote isolated function getProducts(decimal latitude, decimal longitude) returns Product[]|error {
        string resourcePath = string `/products`;
        map<anydata> queryParam = {"latitude": latitude, "longitude": longitude};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Product[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Price Estimates
    #
    # + startLatitude - Latitude component of start location. 
    # + startLongitude - Longitude component of start location. 
    # + endLatitude - Latitude component of end location. 
    # + endLongitude - Longitude component of end location. 
    # + return - An array of price estimates by product 
    remote isolated function getPrices(decimal startLatitude, decimal startLongitude, decimal endLatitude, decimal endLongitude) returns PriceEstimate[]|error {
        string resourcePath = string `/estimates/price`;
        map<anydata> queryParam = {"start_latitude": startLatitude, "start_longitude": startLongitude, "end_latitude": endLatitude, "end_longitude": endLongitude};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PriceEstimate[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Time Estimates
    #
    # + startLatitude - Latitude component of start location. 
    # + startLongitude - Longitude component of start location. 
    # + customerUuid - Unique customer identifier to be used for experience customization. 
    # + productId - Unique identifier representing a specific product for a given latitude & longitude. 
    # + return - An array of products 
    remote isolated function getTimes(decimal startLatitude, decimal startLongitude, string? customerUuid = (), string? productId = ()) returns Product[]|error {
        string resourcePath = string `/estimates/time`;
        map<anydata> queryParam = {"start_latitude": startLatitude, "start_longitude": startLongitude, "customer_uuid": customerUuid, "product_id": productId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Product[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # User Profile
    #
    # + return - Profile information for a user 
    remote isolated function getUser() returns Profile|error {
        string resourcePath = string `/me`;
        Profile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # User Activity
    #
    # + offset - Offset the list of returned results by this amount. Default is zero. 
    # + 'limit - Number of items to retrieve. Default is 5, maximum is 100. 
    # + return - History information for the given user 
    remote isolated function history(int? offset = (), int? 'limit = ()) returns Activities|error {
        string resourcePath = string `/history`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Activities response = check self.clientEp->get(resourcePath);
        return response;
    }
}
