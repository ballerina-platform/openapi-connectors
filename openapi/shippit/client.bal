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

# This is a generated connector for [Shippit API v3.0.20201008](https://developer.shippit.com) OpenAPI specification.
# Shippit powers simpler delivery for e-commerce retailers of all shapes and sizes.
# It fulfil orders and track shipments anywhere you are, anytime you like. 
# It’s cloud-based multi-carrier shipping software for retailers that takes the guesswork out of shipping decisions.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shippit account](https://www.shippit.com) and obtain tokens by following [this guide](https://developer.shippit.com/#section/Authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://app.staging.shippit.com/api/3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Create an Order
    #
    # + payload - Passes an Order object under the `order` field. 
    # + return - Successful order response 
    remote isolated function createOrder(OrderRequest payload) returns OrderResponse|error {
        string  path = string `/orders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderResponse response = check self.clientEp->post(path, request, targetType=OrderResponse);
        return response;
    }
    # Cancel an Order
    #
    # + trackingNumber - The tracking number of the Order. 
    # + return - Returns the Order with state = `cancelled` 
    remote isolated function cancelOrder(string trackingNumber) returns OrderDeleteResponse|error {
        string  path = string `/orders/${trackingNumber}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        OrderDeleteResponse response = check self.clientEp-> delete(path, request, targetType = OrderDeleteResponse);
        return response;
    }
    # Get Label information for an Order
    #
    # + trackingNumber - The tracking number of the Order. 
    # + return - Returns an Order and related label information. 
    remote isolated function getOrderLabel(string trackingNumber) returns LabelResponse|error {
        string  path = string `/orders/${trackingNumber}/label`;
        LabelResponse response = check self.clientEp-> get(path, targetType = LabelResponse);
        return response;
    }
    # Track Order
    #
    # + trackingNumber - The tracking number of the Order 
    # + return - Returns tracking info related to the Order 
    remote isolated function trackOrder(string trackingNumber) returns TrackingResponse|error {
        string  path = string `/orders/${trackingNumber}/tracking`;
        TrackingResponse response = check self.clientEp-> get(path, targetType = TrackingResponse);
        return response;
    }
    # Retrieve Quote
    #
    # + payload - Quote request 
    # + return - Successful quote response 
    remote isolated function getQuote(QuoteRequest payload) returns QuoteResponse|error {
        string  path = string `/quotes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        QuoteResponse response = check self.clientEp->post(path, request, targetType=QuoteResponse);
        return response;
    }
    # Get Merchant settings
    #
    # + return - Returns an object representing your merchant account settings. 
    remote isolated function getMerchant() returns MerchantResponse|error {
        string  path = string `/merchant`;
        MerchantResponse response = check self.clientEp-> get(path, targetType = MerchantResponse);
        return response;
    }
    # Update Merchant settings
    #
    # + payload - Merchant request 
    # + return - The updated merchant account. 
    remote isolated function updateMerchant(MerchantRequest payload) returns MerchantResponse|error {
        string  path = string `/merchant`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MerchantResponse response = check self.clientEp->patch(path, request, targetType=MerchantResponse);
        return response;
    }
    # Webhook
    #
    # + payload - Updated status info about the Order sent by the webhook. 
    # + return - The response (success) the webhook expects from your application endpoint. 
    remote isolated function trackOrderHook(WebhookRequest payload) returns http:Response|error {
        string  path = string `/webhook`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Book Order
    #
    # + payload - An array of Order tracking numbers to book 
    # + return - Returns the status of the bookings at each courier. This API will validate that all of the requested orders are accurate and ready to be booked, if all of the orders sent in cannot be booked, the response will detail which orders cannot be found. If this response is received, none of the order numbers sent in will have been booked. If a manifest fails to be generated, the response will include an array of orders on each manifest which were not booked. 
    remote isolated function bookOrder(BookRequest payload) returns BookResponse|error {
        string  path = string `/book`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BookResponse response = check self.clientEp->post(path, request, targetType=BookResponse);
        return response;
    }
}
