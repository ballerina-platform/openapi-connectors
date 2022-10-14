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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer";
|};

# This is a generated connector for [QuickBooks Online API v3](https://developer.intuit.com/app/developer/qbo/docs/get-started) OpenAPI specification.  
# The QuickBooks Online Accounting API utilizes the REST architecture. It lets you seamlessly integrate your app with QuickBooks Online and the Intuit Financial Ecosystem 
@display {label: "QuickBooks Online", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Gets invoked to initialize the connector. During initialization you can pass either http:BearerTokenConfig if you have a bearer  token or http:OAuth2RefreshTokenGrantConfig if you have Oauth tokens.
    # Create a [QuickBooks account](https://quickbooks.intuit.com/global/) and  obtain credentials following [this guide](https://developer.intuit.com/app/developer/qbo/docs/get-started/start-developing-your-app).
    # Tokens can be obtained by using [OAuth 2.0 Playground](https://developer.intuit.com/app/developer/playground).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://quickbooks.api.intuit.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create or Update an Account. The ID of the object to update is specified in the request body.​
    #
    # + realmId - Realm ID. 
    # + accept - Accept header 
    # + payload - Account creation data 
    # + return - Success 
    remote isolated function createOrUpdateAccount(string realmId, AccountCreateObject payload, string accept = "application/json") returns AccountResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/account`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of an Account object that has been previously created.
    #
    # + realmId - Realm ID. 
    # + accountId - Account ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readAccount(string realmId, string accountId, string accept = "application/json") returns AccountResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/account/${getEncodedUri(accountId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update a Bill. The ID of the object to update is specified in the request body.​
    #
    # + realmId - Realm ID. 
    # + operation - Opearation type 
    # + accept - Accept header 
    # + payload - Bill creation data 
    # + return - Success 
    remote isolated function createOrUpdateBill(string realmId, BillCreateObject payload, string? operation = (), string accept = "application/json") returns BillResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/bill`;
        map<anydata> queryParam = {"operation": operation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BillResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of a bill that has been previously created.
    #
    # + realmId - Realm ID. 
    # + billId - Bill ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readBill(string realmId, string billId, string accept = "application/json") returns BillResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/bill/${getEncodedUri(billId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BillResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update a Customer. The ID of the object to update is specified in the request body.​
    #
    # + realmId - Realm ID. 
    # + accept - Accept header 
    # + payload - Customer creation data 
    # + return - Success 
    remote isolated function createOrUpdateCustomer(string realmId, CustomerCreateObject payload, string accept = "application/json") returns CustomerResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/customer`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of a Customer object that has been previously created.
    #
    # + realmId - Realm ID. 
    # + customerId - Customer ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readCustomer(string realmId, string customerId, string accept = "application/json") returns CustomerResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/customer/${getEncodedUri(customerId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update a Payment.  The ID of the object to update is specifiedin the request body.​
    #
    # + realmId - Realm ID. 
    # + operation - Opearation type 
    # + accept - Accept header 
    # + payload - Payment creation data 
    # + return - Success 
    remote isolated function createOrUpdatePayment(string realmId, PaymentCreateObject payload, string? operation = (), string accept = "application/json") returns PaymentResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/payment`;
        map<anydata> queryParam = {"operation": operation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of a Payment object that has been previously created.
    #
    # + realmId - Realm ID. 
    # + paymentId - Payment ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readPayment(string realmId, string paymentId, string accept = "application/json") returns PaymentResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/payment/${getEncodedUri(paymentId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PaymentResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update an Estimate  The ID of the object to update is specifiedin the request body.​
    #
    # + realmId - Realm ID. 
    # + operation - Opearation type 
    # + accept - Accept header 
    # + payload - Estimate creation data 
    # + return - Success 
    remote isolated function createOrUpdateEstimate(string realmId, EstimateCreateObject payload, string? operation = (), string accept = "application/json") returns EstimateResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/estimate`;
        map<anydata> queryParam = {"operation": operation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EstimateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of an estimate that has been previously created.
    #
    # + realmId - Realm ID. 
    # + estimateId - Estimate ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readEstimate(string realmId, string estimateId, string accept = "application/json") returns EstimateResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/estimate/${getEncodedUri(estimateId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EstimateResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update an Invoice  The ID of the object to update is specifiedin the request body.​
    #
    # + realmId - Realm ID. 
    # + operation - Opearation type 
    # + accept - Accept header 
    # + payload - Invoice creation data 
    # + return - Success 
    remote isolated function createOrUpdateInvoice(string realmId, InvoiceCreateObject payload, string? operation = (), string accept = "application/json") returns InvoiceResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/invoice`;
        map<anydata> queryParam = {"operation": operation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of an invoice that has been previously created.
    #
    # + realmId - Realm ID. 
    # + invoiceId - Invoice ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readInvoice(string realmId, string invoiceId, string accept = "application/json") returns InvoiceResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/invoice/${getEncodedUri(invoiceId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InvoiceResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update a vendor The ID of the object to update is specified in the request body.​ Either the DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes are required during create.
    #
    # + realmId - Realm ID. 
    # + accept - Accept header 
    # + payload - Vendor creation data 
    # + return - Success 
    remote isolated function createOrUpdateVendor(string realmId, VendorCreateObject payload, string accept = "application/json") returns VendorResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/vendor`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VendorResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the details of a vendor object that has been previously created.
    #
    # + realmId - Realm ID. 
    # + vendorId - Vendor ID. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function readVendor(string realmId, string vendorId, string accept = "application/json") returns VendorResponse|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/vendor/${getEncodedUri(vendorId)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        VendorResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Query an entity
    #
    # + realmId - Realm ID. 
    # + query - Query statement. 
    # + accept - Accept header 
    # + return - Success 
    remote isolated function queryEntity(string realmId, string query, string accept = "application/json") returns json|error {
        string resourcePath = string `/v3/company/${getEncodedUri(realmId)}/query`;
        map<anydata> queryParam = {"query": query};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
