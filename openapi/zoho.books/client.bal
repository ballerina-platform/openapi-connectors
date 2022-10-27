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

# This is a generated connector for [Zoho Books API] OpenAPI specification.
# Zoho Books is online accounting software that manages your finances, automates business workflows, and helps you work collectively across departments.
@display {label: "Zoho Books", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Zoho account](https://www.zoho.com/books/signup/) and obtain tokens following [this guide](https://www.zoho.com/books/api/v3/#oauth).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://books.zoho.com") returns error? {
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
    # List contacts.
    #
    # + organizationId - Unique identifier for an organization 
    # + return - Returns list of contacts available 
    remote isolated function listContacts(int organizationId) returns ContactList|error {
        string resourcePath = string `/api/v3/contacts`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add a contact.
    #
    # + organizationId - Unique identifier for an organization 
    # + payload - Input contact data in JSON format 
    # + return - Success 
    remote isolated function addContact(int organizationId, Contact payload) returns Contact|error {
        string resourcePath = string `/api/v3/contacts`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Contact response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Contact.
    #
    # + contactsId - Unique identifier for an contact 
    # + organizationId - Unique identifier for an organization 
    # + return - Returns information of a contact 
    remote isolated function getContact(int contactsId, int organizationId) returns Contact|error {
        string resourcePath = string `/api/v3/contacts/${getEncodedUri(contactsId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact.
    #
    # + contactsId - Unique identifier for an contact 
    # + organizationId - Unique identifier for an organization 
    # + payload - Update contact data in JSON format 
    # + return - Success 
    remote isolated function updateContact(int contactsId, int organizationId, Contact payload) returns Contact|error {
        string resourcePath = string `/api/v3/contacts/${getEncodedUri(contactsId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Contact response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact.
    #
    # + contactsId - Unique identifier for an contact 
    # + organizationId - Unique identifier for an organization 
    # + return - Successful response 
    remote isolated function deleteContact(int contactsId, int organizationId) returns SuccessOperation|error {
        string resourcePath = string `/api/v3/contacts/${getEncodedUri(contactsId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuccessOperation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Invoices.
    #
    # + organizationId - Unique identifier for an organization 
    # + return - Returns list of invoices available 
    remote isolated function listInvoices(int organizationId) returns InvoiceList|error {
        string resourcePath = string `/api/v3/invoices`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InvoiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add an invoice.
    #
    # + organizationId - Unique identifier for an organization 
    # + payload - Input invoice data in JSON format 
    # + return - Success 
    remote isolated function addInvoice(int organizationId, Invoice payload) returns Invoice|error {
        string resourcePath = string `/api/v3/invoices`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Invoice.
    #
    # + invoiceId - Unique identifier for an invoice 
    # + organizationId - Unique identifier for an organization 
    # + return - Returns information of a invoice 
    remote isolated function getInvoice(int invoiceId, int organizationId) returns Invoice|error {
        string resourcePath = string `/api/v3/invoices/${getEncodedUri(invoiceId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Invoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an invoice.
    #
    # + invoiceId - Unique identifier for an invoice 
    # + organizationId - Unique identifier for an organization 
    # + payload - Update invoice data in JSON format 
    # + return - Success 
    remote isolated function updateInvoice(int invoiceId, int organizationId, Invoice payload) returns Invoice|error {
        string resourcePath = string `/api/v3/invoices/${getEncodedUri(invoiceId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Invoice response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an invoice.
    #
    # + invoiceId - Unique identifier for an invoice 
    # + organizationId - Unique identifier for an organization 
    # + return - Successful response 
    remote isolated function deleteInvoice(int invoiceId, int organizationId) returns SuccessOperation|error {
        string resourcePath = string `/api/v3/invoices/${getEncodedUri(invoiceId)}`;
        map<anydata> queryParam = {"organization_id": organizationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuccessOperation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
