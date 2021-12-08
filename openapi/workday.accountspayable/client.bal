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

# This is a generated connector for [WorkDay Accounts Payable REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The WorkDay accounts payable service enables applications to access information related to accounts payable.
@display {label: "Workday Accounts Payable", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Submits a single supplier invoice instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function submitInvoiceInstance(string id, SubmitSupplierInvoiceRequest payload) returns SubmitSupplierInvoiceRequest|error {
        string path = string `/supplierInvoiceRequests/${id}/submit`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubmitSupplierInvoiceRequest response = check self.clientEp->post(path, request, targetType = SubmitSupplierInvoiceRequest);
        return response;
    }
    # Secured by: View: Supplier Invoice Request, Process: Supplier Invoice - Request
    # 
    # Scope: Supplier Accounts
    # 
    # Contains attachment(s) only
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function viewSupplierInvoiceRequests(string id, string subresourceID) returns string|error {
        string path = string `/supplierInvoiceRequests/${id}/attachments/${subresourceID}?type=viewContent`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Retrieves a collection of supplier invoices.
    #
    # + company - The company for the Common Financial Dimensions. This is for internal use only on a REST API. 
    # + fromDueDate - The  beginning date of the payment due period for this supplier invoice request. Use the MM/DD/YYYY format. Example: When the payment term is Net 30, the due date value is the day from this invoice date. 
    # + fromInvoiceDate - The date on or after which the supplier invoice is created using the MM/DD/YYYY format. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + requester - The ID of the worker generating the supplier invoice request. 
    # + status - The status of the supplier invoice request. This is for internal use only on a REST API. 
    # + supplier - The supplier on the business documents. 
    # + toDueDate - The end date of the payment due period for this supplier invoice request. Use the MM/DD/YYYY format. Example: When the payment term is Net 30, the due date value is 30 days from the invoice date. 
    # + toInvoiceDate - The date on or before which the supplier invoice is created using the MM/DD/YYYY format. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupplierInvoiceRequests(string[]? company = (), string? fromDueDate = (), string? fromInvoiceDate = (), int? 'limit = (), int? offset = (), string[]? requester = (), string[]? status = (), string[]? supplier = (), string? toDueDate = (), string? toInvoiceDate = ()) returns InlineResponse200|error {
        string path = string `/supplierInvoiceRequests`;
        map<anydata> queryParam = {"company": company, "fromDueDate": fromDueDate, "fromInvoiceDate": fromInvoiceDate, "limit": 'limit, "offset": offset, "requester": requester, "status": status, "supplier": supplier, "toDueDate": toDueDate, "toInvoiceDate": toInvoiceDate};
        map<Encoding> queryParamEncoding = {"company": {style: FORM, explode: true}, "requester": {style: FORM, explode: true}, "status": {style: FORM, explode: true}, "supplier": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(path, targetType = InlineResponse200);
        return response;
    }
    # Creates the supplier invoice as specified in the request.
    #
    # + company - The company for the Common Financial Dimensions. This is for internal use only on a REST API. 
    # + fromDueDate - The  beginning date of the payment due period for this supplier invoice request. Use the MM/DD/YYYY format. Example: When the payment term is Net 30, the due date value is the day from this invoice date. 
    # + fromInvoiceDate - The date on or after which the supplier invoice is created using the MM/DD/YYYY format. 
    # + requester - The ID of the worker generating the supplier invoice request. 
    # + status - The status of the supplier invoice request. This is for internal use only on a REST API. 
    # + supplier - The supplier on the business documents. 
    # + toDueDate - The end date of the payment due period for this supplier invoice request. Use the MM/DD/YYYY format. Example: When the payment term is Net 30, the due date value is 30 days from the invoice date. 
    # + toInvoiceDate - The date on or before which the supplier invoice is created using the MM/DD/YYYY format. 
    # + return - Resource created. 
    remote isolated function createSupplierInvoice(CreateInvoiceRequestSummary payload, string[]? company = (), string? fromDueDate = (), string? fromInvoiceDate = (), string[]? requester = (), string[]? status = (), string[]? supplier = (), string? toDueDate = (), string? toInvoiceDate = ()) returns CreateInvoiceRequestSummary|error {
        string path = string `/supplierInvoiceRequests`;
        map<anydata> queryParam = {"company": company, "fromDueDate": fromDueDate, "fromInvoiceDate": fromInvoiceDate, "requester": requester, "status": status, "supplier": supplier, "toDueDate": toDueDate, "toInvoiceDate": toInvoiceDate};
        map<Encoding> queryParamEncoding = {"company": {style: FORM, explode: true}, "requester": {style: FORM, explode: true}, "status": {style: FORM, explode: true}, "supplier": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateInvoiceRequestSummary response = check self.clientEp->post(path, request, targetType = CreateInvoiceRequestSummary);
        return response;
    }
    # Retrieves a single attachment instance.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupplierInvoiceRequestAttachment(string id, string subresourceID) returns AttachmentSummary|error {
        string path = string `/supplierInvoiceRequests/${id}/attachments/${subresourceID}`;
        AttachmentSummary response = check self.clientEp->get(path, targetType = AttachmentSummary);
        return response;
    }
    # Secured by: View: Supplier Invoice Request, Process: Supplier Invoice - Request
    # 
    # Scope: Supplier Accounts
    # 
    # Contains attachment(s) only
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoiceRequestAttachmentByID(string id, int? 'limit = (), int? offset = ()) returns string|error {
        string path = string `/supplierInvoiceRequests/${id}/attachmentst`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Retrieves a collection of supplier invoice lines.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupplierInvoiceLines(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2001|error {
        string path = string `/supplierInvoiceRequests/${id}/lines`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(path, targetType = InlineResponse2001);
        return response;
    }
    # Retrieves a single supplier invoice instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupplierInvoiceInstance(string id) returns InvoiceRequestSummary|error {
        string path = string `/supplierInvoiceRequests/${id}`;
        InvoiceRequestSummary response = check self.clientEp->get(path, targetType = InvoiceRequestSummary);
        return response;
    }
    # Retrieves a collection of attachments for the specified supplier invoice.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInvoiceAttachments(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2002|error {
        string path = string `/supplierInvoiceRequests/${id}/attachments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(path, targetType = InlineResponse2002);
        return response;
    }
    # Creates a new attachment for the supplier invoice.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createsNewAttachmentSupplierInvoice(string id, CreateAttachmentSummary payload) returns CreateAttachmentSummary|error {
        string path = string `/supplierInvoiceRequests/${id}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateAttachmentSummary response = check self.clientEp->post(path, request, targetType = CreateAttachmentSummary);
        return response;
    }
    # Retrieves a single supplier invoice line instance.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupplierInvoiceLineInstance(string id, string subresourceID) returns ViewLineSummary|error {
        string path = string `/supplierInvoiceRequests/${id}/lines/${subresourceID}`;
        ViewLineSummary response = check self.clientEp->get(path, targetType = ViewLineSummary);
        return response;
    }
}
