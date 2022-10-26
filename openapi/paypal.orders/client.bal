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

# This is a generated connector for [Paypal Orders API v2](https://developer.paypal.com/docs/api/orders/v2/) OpenAPI specification.
# An order represents a payment between two or more parties. 
# Use the Orders API to create, update, retrieve, authorize, and capture orders.
@display {label: "Paypal Orders", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Paypal account](https://www.paypal.com) and obtain tokens by following [this guide](https://developer.paypal.com/docs/api/overview/#get-credentials).
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
    # Creates an order.
    #
    # + paypalRequestId - The server stores keys for 6 hours. The API callers can request the times to up to 72 hours by speaking to their Account Manager. 
    # + paypalPartnerAttributionId - PayPal partner attribution ID 
    # + paypalClientMetadataId - PayPal client metadata ID 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + payload - The create order request 
    # + return - Created order details 
    remote isolated function createOrder(CreateOrderRequest payload, string? paypalRequestId = (), string? paypalPartnerAttributionId = (), string? paypalClientMetadataId = (), string? prefer = ()) returns CreatedOrderDetails|error {
        string resourcePath = string `/v2/checkout/orders`;
        map<any> headerValues = {"PayPal-Request-Id": paypalRequestId, "PayPal-Partner-Attribution-Id": paypalPartnerAttributionId, "PayPal-Client-Metadata-Id": paypalClientMetadataId, "Prefer": prefer};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedOrderDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Shows details for an order, by ID.
    #
    # + id - The ID of the order for which to show details." 
    # + fields - A comma-separated list of fields that should be returned for the order. Valid filter field is payment_source. 
    # + return - Order details. 
    remote isolated function getOrder(string id, string? fields = ()) returns OrderDetails|error {
        string resourcePath = string `/v2/checkout/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrderDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an order with a CREATED or APPROVED status. You cannot update an order with the COMPLETED status. To make an update, you must provide a reference_id. If you omit this value with an order that contains only one purchase unit, PayPal sets the value to default which enables you to use the path: /purchase_units/@reference_id=='default'/{attribute-or-object}.
    #
    # + id - The ID of the order to update. 
    # + payload - The update order request 
    # + return - An empty object in the JSON response body. 
    remote isolated function updateOrder(string id, UpdateOrderRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/checkout/orders/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Authorizes payment for an order. To successfully authorize payment for an order, the buyer must first approve the order or a valid payment_source must be provided in the request. A buyer can approve the order upon being redirected to the rel:approve URL that was returned in the HATEOAS links in the create order response.
    #
    # + id - The ID of the order for which to authorize. 
    # + paypalRequestId - The server stores keys for 6 hours. The API callers can request the times to up to 72 hours by speaking to their Account Manager. 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + paypalClientMetadataId - PayPal client metadata ID 
    # + paypalAuthAssertion - PayPal auth assertion 
    # + payload - The authorize order request 
    # + return - Authorized order details 
    remote isolated function authorizeOrder(string id, AuthorizeOrderRequest payload, string? paypalRequestId = (), string? prefer = (), string? paypalClientMetadataId = (), string? paypalAuthAssertion = ()) returns AuthorizedOrderDetails|error {
        string resourcePath = string `/v2/checkout/orders/${getEncodedUri(id)}/authorize`;
        map<any> headerValues = {"PayPal-Request-Id": paypalRequestId, "Prefer": prefer, "PayPal-Client-Metadata-Id": paypalClientMetadataId, "PayPal-Auth-Assertion": paypalAuthAssertion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AuthorizedOrderDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Captures payment for an order. To successfully capture payment for an order, the buyer must first approve the order or a valid payment_source must be provided in the request. A buyer can approve the order upon being redirected to the rel:approve URL that was returned in the HATEOAS links in the create order response.
    #
    # + id - The ID of the order for which to capture a payment. 
    # + paypalRequestId - The server stores keys for 6 hours. The API callers can request the times to up to 72 hours by speaking to their Account Manager. 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + paypalClientMetadataId - PayPal client metadata ID 
    # + paypalAuthAssertion - PayPal auth assertion 
    # + payload - The capture order request 
    # + return - Captured payment details 
    remote isolated function captureOrder(string id, CaptureOrderRequest payload, string? paypalRequestId = (), string? prefer = (), string? paypalClientMetadataId = (), string? paypalAuthAssertion = ()) returns CapturedPaymentDetails|error {
        string resourcePath = string `/v2/checkout/orders/${getEncodedUri(id)}/capture`;
        map<any> headerValues = {"PayPal-Request-Id": paypalRequestId, "Prefer": prefer, "PayPal-Client-Metadata-Id": paypalClientMetadataId, "PayPal-Auth-Assertion": paypalAuthAssertion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CapturedPaymentDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
