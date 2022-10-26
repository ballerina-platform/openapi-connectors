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

# This is a generated connector for [Shipwire Carrier API v3.0](https://www.shipwire.com/developers/carrier/) OpenAPI specification.
# The Carriers API is used to manage supported carriers and their respective capabilities. 
# Use it to view, add or remove carriers enabled to function with Shipwire and Shipwire Anywhere warehouses.
@display {label: "Shipwire Carrier", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.shipwire.com/") returns error? {
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
    # Get carriers availability
    #
    # + name - Add description 
    # + carrierCode - Add description 
    # + serviceLevelCode - Add description 
    # + isPoBoxSupported - Add description 
    # + return - Carriers response 
    remote isolated function getCarriers(string? name = (), string? carrierCode = (), string? serviceLevelCode = (), string? isPoBoxSupported = ()) returns GetCarriersResponse|error {
        string resourcePath = string `/api/v3.1/carriers`;
        map<anydata> queryParam = {"name": name, "carrierCode": carrierCode, "serviceLevelCode": serviceLevelCode, "isPoBoxSupported": isPoBoxSupported};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetCarriersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get carrier availability
    #
    # + id - The prefix concatenated with '-' and service level code of the carrier. 
    # + return - Carrier response 
    remote isolated function getCarrier(string id) returns GetCarrierResponse|error {
        string resourcePath = string `/api/v3.1/carriers/${getEncodedUri(id)}`;
        GetCarrierResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
