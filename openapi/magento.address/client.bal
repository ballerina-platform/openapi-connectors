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

# This is a generated connector for [Magento REST API v2.2](https://devdocs.magento.com/guides/v2.4/rest/bk-rest.html) OpenAPI specification.
# The Magento B2B Rest API service enables applications to build and manage a customized commerce store. 
@display {label: "Magento Amazon billing address & analytics", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide](https://devdocs.magento.com/guides/v2.4/get-started/authentication/gs-authentication-token.html) and obtain tokens.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Delete customer address by ID.
    #
    # + addressId - Address ID 
    # + return - 200 Success. 
    remote isolated function customerAddressDeleteByIdV1(int addressId) returns boolean|error {
        string resourcePath = string `/V1/addresses/${getEncodedUri(addressId)}`;
        boolean response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update Amazon-billing-address by ID
    #
    # + amazonOrderReferenceId - Amazon order reference ID 
    # + payload - Address Consent Token 
    # + return - 200 Success. 
    remote isolated function updateAmazonPaymentAddressV1(string amazonOrderReferenceId, AmazonbillingaddressAmazonorderreferenceidBody payload) returns string|error {
        string resourcePath = string `/V1/amazon-billing-address/${getEncodedUri(amazonOrderReferenceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Update amazon-shipping-address by reference ID
    #
    # + amazonOrderReferenceId - Amazon Order Reference ID 
    # + payload - Address consent token 
    # + return - 200 Success. 
    remote isolated function updateAmazonPaymentShippingAddress(string amazonOrderReferenceId, AmazonshippingaddressAmazonorderreferenceidBody payload) returns string|error {
        string resourcePath = string `/V1/amazon-shipping-address/${getEncodedUri(amazonOrderReferenceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # amazon/order-ref
    #
    # + return - Unexpected error 
    remote isolated function deleteAmazonPaymentOrderReferenceV1() returns http:Response|error {
        string resourcePath = string `/V1/amazon/order-ref`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # analytics/link
    #
    # + return - 200 Success. 
    remote isolated function getAnalyticsLinkV1() returns AnalyticsDataLinkInterface|error {
        string resourcePath = string `/V1/analytics/link`;
        AnalyticsDataLinkInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
}
