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

# This is a generated connector for [Paypal Payments API v2](https://developer.paypal.com/docs/api/payments/v2/) OpenAPI specification.
# Call the Payments API to authorize payments, capture authorized payments, refund payments that have already been captured, and show payment information. 
# Use the Payments API in conjunction with the Orders API.
@display {label: "Paypal Payments", iconPath: "icon.png"}
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
    # Shows details for an authorized payment, by ID.
    #
    # + authorizationId - The ID of the authorized payment for which to show details. 
    # + count - The number of items to list in the response. 
    # + endTime - The end date and time for the range to show in the response, in Internet date and time format. For example, end_time=2016-03-06T11:00:00Z. 
    # + page - The page number indicating which set of items will be returned in the response. So, the combination of page=1 and page_size=20 returns the first 20 items. The combination of page=2 and page_size=20 returns items 21 through 40. 
    # + pageSize - The number of items to return in the response. 
    # + totalCountRequired - Indicates whether to show the total count in the response. 
    # + sortBy - Sorts the payments in the response by a specified value, such as the create time or update time. 
    # + sortOrder - Sorts the items in the response in ascending or descending order. 
    # + startId - The ID of the starting resource in the response. When results are paged, you can use the next_id value as the start_id to continue with the next set of results. 
    # + startIndex - The start index of the payments to list. Typically, you use the start_index to jump to a specific position in the resource history based on its cart. For example, to start at the second item in a list of results, specify ?start_index=2. 
    # + startTime - The start date and time for the range to show in the response, in Internet date and time format. For example, start_time=2016-03-06T11:00:00Z. 
    # + return - Authorization details. 
    remote isolated function getAuthorization(string authorizationId, int? count = (), int? endTime = (), int? page = (), int? pageSize = (), boolean? totalCountRequired = (), string? sortBy = (), string? sortOrder = (), string? startId = (), int? startIndex = (), string? startTime = ()) returns AuthorizationDetails|error {
        string resourcePath = string `/v2/payments/authorizations/${getEncodedUri(authorizationId)}`;
        map<anydata> queryParam = {"count": count, "end_time": endTime, "page": page, "page_size": pageSize, "total_count_required": totalCountRequired, "sort_by": sortBy, "sort_order": sortOrder, "start_id": startId, "start_index": startIndex, "start_time": startTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AuthorizationDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Captures an authorized payment, by ID.
    #
    # + authorizationId - The PayPal-generated ID for the authorized payment to capture. 
    # + paypalRequestId - The server stores keys for 45 days. 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + payload - The capture authorization request 
    # + return - Captured payment details 
    remote isolated function captureAuthorization(string authorizationId, CaptureAuthorizationRequest payload, string? paypalRequestId = (), string? prefer = ()) returns CapturedPaymentDetails|error {
        string resourcePath = string `/v2/payments/authorizations/${getEncodedUri(authorizationId)}/capture`;
        map<any> headerValues = {"PayPal-Request-Id": paypalRequestId, "Prefer": prefer};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CapturedPaymentDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reauthorizes an authorized PayPal account payment, by ID. To ensure that funds are still available, reauthorize a payment after its initial three-day honor period expires. Within the 29-day authorization period, you can issue multiple re-authorizations after the honor period expires. If 30 days have transpired since the date of the original authorization, you must create an authorized payment instead of reauthorizing the original authorized payment. A reauthorized payment itself has a new honor period of three days. You can reauthorize an authorized payment once for up to 115% of the original authorized amount, not to exceed an increase of $75 USD.
    #
    # + authorizationId - The PayPal-generated ID for the authorized payment to capture. 
    # + paypalRequestId - The server stores keys for 45 days. 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + payload - The reauthorize authorization request 
    # + return - Reauthorized payment details 
    remote isolated function reauthorizeAuthorization(string authorizationId, ReauthorizeAuthorizationRequest payload, string? paypalRequestId = (), string? prefer = ()) returns ReauthorizedPaymentDetails|error {
        string resourcePath = string `/v2/payments/authorizations/${getEncodedUri(authorizationId)}/reauthorize`;
        map<any> headerValues = {"PayPal-Request-Id": paypalRequestId, "Prefer": prefer};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReauthorizedPaymentDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Voids, or cancels, an authorized payment, by ID. You cannot void an authorized payment that has been fully captured.
    #
    # + authorizationId - The PayPal-generated ID for the authorized payment to capture. 
    # + paypalAuthAssertion - An API-caller-provided JSON Web Token (JWT) assertion that identifies the merchant. For details, see PayPal-Auth-Assertion. For three party transactions in which a partner is managing the API calls on behalf of a merchant, the partner must identify the merchant using either a PayPal-Auth-Assertion header or an access token with target_subject. 
    # + return - No JSON response body 
    remote isolated function voidAuthorization(string authorizationId, string? paypalAuthAssertion = ()) returns http:Response|error {
        string resourcePath = string `/v2/payments/authorizations/${getEncodedUri(authorizationId)}/void`;
        map<any> headerValues = {"PayPal-Auth-Assertion": paypalAuthAssertion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Shows details for a captured payment, by ID.
    #
    # + captureId - The PayPal-generated ID for the captured payment for which to show details. 
    # + return - Captured payment details. 
    remote isolated function getCaptures(string captureId) returns CapturedPaymentDetails|error {
        string resourcePath = string `/v2/payments/captures/${getEncodedUri(captureId)}`;
        CapturedPaymentDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Refunds a captured payment, by ID. For a full refund, include an empty payload in the JSON request body. For a partial refund, include an amount object in the JSON request body.
    #
    # + captureId - The PayPal-generated ID for the captured payment for which to show details. 
    # + paypalAuthAssertion - An API-caller-provided JSON Web Token (JWT) assertion that identifies the merchant. For details, see PayPal-Auth-Assertion. For three party transactions in which a partner is managing the API calls on behalf of a merchant, the partner must identify the merchant using either a PayPal-Auth-Assertion header or an access token with target_subject. 
    # + paypalRequestId - The server stores keys for 45 days. 
    # + prefer - The preferred server response upon successful completion of the request. Value is return=minimal or return=representation. 
    # + payload - The refund capture request 
    # + return - Refund details 
    remote isolated function refundCaptures(string captureId, RefundCaptureRequest payload, string? paypalAuthAssertion = (), string? paypalRequestId = (), string? prefer = ()) returns RefundDetails|error {
        string resourcePath = string `/v2/payments/captures/${getEncodedUri(captureId)}/refund`;
        map<any> headerValues = {"PayPal-Auth-Assertion": paypalAuthAssertion, "PayPal-Request-Id": paypalRequestId, "Prefer": prefer};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RefundDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Shows details for a refund, by ID.
    #
    # + refundId - The PayPal-generated ID for the refund for which to show details. 
    # + return - Refund details. 
    remote isolated function getRefunds(string refundId) returns RefundDetails|error {
        string resourcePath = string `/v2/payments/refunds/${getEncodedUri(refundId)}`;
        RefundDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
}
