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
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://quickbooks.api.intuit.com") returns error? {
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
        json jsonBody = payload.toJson();
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
