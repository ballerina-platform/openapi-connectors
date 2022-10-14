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
    string refreshUrl = "https://accounts.zoho.com/oauth/v2/token";
|};

# This is a generated connector for [Zoho Books API] OpenAPI specification.
# Zoho Books is online accounting software that manages your finances, automates business workflows, and helps you work collectively across departments.
@display {label: "Zoho Books", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Zoho account](https://www.zoho.com/books/signup/) and obtain tokens following [this guide](https://www.zoho.com/books/api/v3/#oauth).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://books.zoho.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
