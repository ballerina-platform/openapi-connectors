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

# This is a generated connector for [WorkDay Customer Accounts REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The customer accounts service enables applications to access  customer accounts information including customers, invoices, adjustments, and payments.
@display {label: "Workday Customer Accounts", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves a single customer invoice payment remittance line instance.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoicePaymentRemittanceLine(string id, string subresourceID) returns ViewRemittanceDetails|error {
        string path = string `/payments/${id}/remittanceDetails/${subresourceID}`;
        ViewRemittanceDetails response = check self.clientEp->get(path, targetType = ViewRemittanceDetails);
        return response;
    }
    # Retrieves a single customer invoice payment instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoicePaymentInstance(string id) returns ViewCustomerPayment|error {
        string path = string `/payments/${id}`;
        ViewCustomerPayment response = check self.clientEp->get(path, targetType = ViewCustomerPayment);
        return response;
    }
    # Retrieves a single customer instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSingleCustomerInstance(string id) returns CustomerView|error {
        string path = string `/customers/${id}`;
        CustomerView response = check self.clientEp->get(path, targetType = CustomerView);
        return response;
    }
    # Retrieves a single customer invoice or adjustment instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoiceOrAdjustmentInstance(string id) returns CustomerInvoice|error {
        string path = string `/invoices/${id}`;
        CustomerInvoice response = check self.clientEp->get(path, targetType = CustomerInvoice);
        return response;
    }
    # Retrieves a single customer invoice PDF instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoicePDFInstance(string id) returns string|error {
        string path = string `/invoicePDFs/${id}`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Creates customer invoice payments.
    #
    # + return - Resource created. 
    remote isolated function createInvoicePayment(CreateCustomerPayment payload) returns CreateCustomerPayment|error {
        string path = string `/payments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateCustomerPayment response = check self.clientEp->post(path, request, targetType = CreateCustomerPayment);
        return response;
    }
    # Retrieves a collection of customer invoices and adjustments.
    #
    # + billToCustomer - The customer on the invoice. 
    # + company - The company used for Common Financial Dimensions. This is for internal use only on a REST API. 
    # + fromDueDate - The due date of the customer invoice or invoice adjustment as of the defined reporting date, formatted as YYYY-MM-DD. 
    # + fromInvoiceDate - The date of the customer invoice, formatted as YYYY-MM-DD. 
    # + invoiceStatus - The current status of an invoice document. Include invoices with these invoice statuses: Approved (91b0d382d50848e898733757caa9f84a),  Canceled (dc76c9b6446c11de98360015c5e6daf6),  Denied (dc76c7cc446c11de98360015c5e6daf6),  Draft (dc76c4fc446c11de98360015c5e6daf6),  Incomplete(e264bc68581342baa70ab61bf71032fe),  In Progress (dc76c8bc446c11de98360015c5e6daf6). 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + paymentStatus - The payment status of an invoice document.  Include invoices with these payments statuses: Paid (d9e4362a446c11de98360015c5e6daf6),  Unpaid (d9e43940446c11de98360015c5e6daf6),  Partially Paid (d9e43706446c11de98360015c5e6daf6). 
    # + toDueDate - The due date of the customer invoice or invoice adjustment as of the defined reporting date, formatted as YYYY-MM-DD. 
    # + toInvoiceDate - The date of the customer invoice, formatted as YYYY-MM-DD. 
    # + transactionType - The transaction type of this customer transaction. Use the string "invoice" or "adjustment" to filter to retrieve either only invoices or adjustments. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfInvoices(string[]? billToCustomer = (), string[]? company = (), string? fromDueDate = (), string? fromInvoiceDate = (), string[]? invoiceStatus = (), int? 'limit = (), int? offset = (), string[]? paymentStatus = (), string? toDueDate = (), string? toInvoiceDate = (), string? transactionType = ()) returns InlineResponse200|error {
        string path = string `/invoices`;
        map<anydata> queryParam = {"billToCustomer": billToCustomer, "company": company, "fromDueDate": fromDueDate, "fromInvoiceDate": fromInvoiceDate, "invoiceStatus": invoiceStatus, "limit": 'limit, "offset": offset, "paymentStatus": paymentStatus, "toDueDate": toDueDate, "toInvoiceDate": toInvoiceDate, "transactionType": transactionType};
        map<Encoding> queryParamEncoding = {"billToCustomer": {style: FORM, explode: true}, "company": {style: FORM, explode: true}, "invoiceStatus": {style: FORM, explode: true}, "paymentStatus": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(path, targetType = InlineResponse200);
        return response;
    }
    # Retrieves a single customer invoice print run.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoicePrintRun(string id, string subresourceID) returns PrintRun|error {
        string path = string `/invoices/${id}/printRuns/${subresourceID}`;
        PrintRun response = check self.clientEp->get(path, targetType = PrintRun);
        return response;
    }
    # Retrieves a collection of customer invoice print runs for the specified customer invoice or adjustment.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoicePrintRunForSpecifiedInvoice(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2001|error {
        string path = string `/invoices/${id}/printRuns`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(path, targetType = InlineResponse2001);
        return response;
    }
    # Retrieves a collection of customers.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + name - The name of the customer. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCustomerCollection(int? 'limit = (), string? name = (), int? offset = ()) returns InlineResponse2002|error {
        string path = string `/customers`;
        map<anydata> queryParam = {"limit": 'limit, "name": name, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(path, targetType = InlineResponse2002);
        return response;
    }
    # Creates customer invoice payment remittance lines.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createCustomerInvoice(string id, CreateRemittanceDetails payload) returns CreateRemittanceDetails|error {
        string path = string `/payments/${id}/remittanceDetails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateRemittanceDetails response = check self.clientEp->post(path, request, targetType = CreateRemittanceDetails);
        return response;
    }
}
