// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Magento REST API v2.2](https://devdocs.magento.com/guides/v2.4/rest/bk-rest.html) OpenAPI specification.
# The Magento B2B Rest API service enables applications to build and manage a customized commerce store. 
@display {label: "Magento Amazon billing address & analytics", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide](https://devdocs.magento.com/guides/v2.4/get-started/authentication/gs-authentication-token.html) and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Delete customer address by ID.
    #
    # + addressId - Address ID 
    # + return - 200 Success. 
    remote isolated function customerAddressDeleteByIdV1(int addressId) returns boolean|error {
        string resourcePath = string `/V1/addresses/${addressId}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update Amazon-billing-address by ID
    #
    # + amazonOrderReferenceId - Amazon order reference ID 
    # + payload - Address Consent Token 
    # + return - 200 Success. 
    remote isolated function updateAmazonPaymentAddressV1(string amazonOrderReferenceId, AmazonbillingaddressAmazonorderreferenceidBody payload) returns string|error {
        string resourcePath = string `/V1/amazon-billing-address/${amazonOrderReferenceId}`;
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
        string resourcePath = string `/V1/amazon-shipping-address/${amazonOrderReferenceId}`;
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
        http:Response response = check self.clientEp->delete(resourcePath);
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
