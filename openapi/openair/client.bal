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

# This is a generated connector for [OpenAir API v1.0](https://www.openair.com/download/OpenAirRESTAPIGuide.pdf) OpenAPI specification.
# The OpenAir REST API provides an interface for integration applications to exchange information with [OpenAir](https://docs.oracle.com/cloud/openair/index.html). 
# OpenAir REST API currently supports the following resources: Expense reports, Receipts, Attachments, Job codes, Contacts
@display {label: "openair", iconPath: "resources/openair.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [OpenAir account](https://www.openair.com/) and obtain tokens by following [this guide](https://www.openair.com/download/OpenAirRESTAPIGuide.pdf).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves the list of contacts.
    #
    # + return - An OpenAir type record or an error 
    remote isolated function getContacts() returns OpenAirResponse|error {
        string  path = string `/contacts/`;
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Creates a new contact record
    #
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the contact returned 
    # + returnObject - If set to 1, the response will return the contact created. Otherwise, the response will include only the internal ID of the contact created 
    # + payload - A contact is a person working for, or associated with a customer 
    # + return - An OpenAir type record or an error 
    remote isolated function addContact(Contact payload, string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/contacts/`;
        map<anydata> queryParam = {"fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Discover the methods available
    #
    # + return - Includes the OpenAPI 3.0 endpoint reference for the resource endpoint 
    remote isolated function discoverMethods() returns http:Response|error {
        string  path = string `/contacts/`;
        http:Response response = check self.clientEp-> options(path, targetType = http:Response);
        return response;
    }
    # Retrieves the contact record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the contact returned 
    # + return - An OpenAir type record or an error 
    remote isolated function getContactByID(int id, string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/contacts/${id}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Updates the contact record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the contact returned 
    # + returnObject - If set to any value other than 0 (zero), the response will include the contact updated. Otherwise, the response will include only the internal ID of the contact updated 
    # + payload - If set to any value other than 0 (zero), the response will include the contact updated. Otherwise, the response will include only the internal ID of the contact updated 
    # + return - An OpenAir type record or an error 
    remote isolated function updateContact(int id, Contact payload, string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/contacts/${id}`;
        map<anydata> queryParam = {"fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->put(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Deletes the contact record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + return - An OpenAir type record or an error 
    remote isolated function deleteContact(int id) returns OpenAirResponse|error {
        string  path = string `/contacts/${id}`;
        OpenAirResponse response = check self.clientEp-> delete(path, targetType = OpenAirResponse);
        return response;
    }
    # Get the list of Expense Report
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + 'limit - A limit on the length of the page 
    # + offset - A cursor for use in pagination 
    # + q - A URL-encoded query expression used to filter the resource collection and return the objects matching the specified search criteria 
    # + return - An OpenAir type record or an error 
    remote isolated function getListOfExpenseReports(string? expand = (), string? fields = (), int? 'limit = (), int? offset = (), string? q = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "limit": 'limit, "offset": offset, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Retrieves the expense report with the specified internal
    #
    # + id - The internal id of the expense report 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned 
    # + return - An OpenAir type record or an error 
    remote isolated function getExpenseReport(int id, string? expand = (), string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}`;
        map<anydata> queryParam = {"expand": expand, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Updates an Expense Report
    #
    # + id - The internal id of the expense report 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string)      
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned 
    # + returnObject - If set to any value other than 0 (zero), the response will include the expense report updated. Otherwise, the response will include only the internal ID of the expense report updated 
    # + payload - An object including valid key-value pairs for the fields to be updated 
    # + return - An OpenAir type record or an error 
    remote isolated function updateExpneseReport(int id, string fields, boolean returnObject, ExpenseReport payload, string? expand = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->put(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Deletes e the expense report record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + return - An OpenAir type record or an error with ID and a message 
    remote isolated function deleteExpenseReports(int id) returns InlineResponse200|error {
        string  path = string `/expense-reports/${id}`;
        InlineResponse200 response = check self.clientEp-> delete(path, targetType = InlineResponse200);
        return response;
    }
    # Inserts an Overlapping Expense Report
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned         
    # + returnObject - If set to any value other than 0 (zero), the response will return the expense report created. Otherwise, the response will include only the internal ID of the expense report created 
    # + payload - An expense report is a collection of expense items (receipts) that employees can use in OpenAir to claim reimbursement 
    # + return - An OpenAir type record or an error 
    remote isolated function insertOverlappingExpenseReport(ExpenseReport payload, string? expand = (), string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/overlapping/`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # retrieve the collection of receipts in the expense report with the specified internal ID
    #
    # + id - The internal id of the expense report 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + 'limit - A limit on the length of the page 
    # + offset - A cursor for use in pagination 
    # + q - A URL-encoded query expression used to filter the resource collection and return the objects matching the specified search criteria 
    # + return - An OpenAir type record or an error 
    remote isolated function getListOfReceiptsInExpenseReport(int id, string? expand = (), string? fields = (), int? 'limit = (), int? offset = (), string? q = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}/receipts/`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "limit": 'limit, "offset": offset, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Gets a Receipt associated with an Expense Report
    #
    # + id - The internal id of the expense report 
    # + ticketId - The internal id of the receipt 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + return - An OpenAir type record or an error 
    remote isolated function getReceiptForExpenseReport(int id, int ticketId, string? expand = (), string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}/receipts/${ticketId}`;
        map<anydata> queryParam = {"expand": expand, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Get the List of Attachments Associated with an Expense Report
    #
    # + id - The internal id of the expense report 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + 'limit - A limit on the length of the page 
    # + offset - A cursor for use in pagination 
    # + q - A URL-encoded query expression used to filter the resource collection and return the objects matching the specified search criteria 
    # + return - An OpenAir type record or an error 
    remote isolated function getAttachmentListWithExpenseReport(int id, string? expand = (), string? fields = (), int? 'limit = (), int? offset = (), string? q = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}/attachments`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "limit": 'limit, "offset": offset, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Add an Attachment to an Expense Report
    #
    # + id - The internal id of the expense report 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned 
    # + payload - This method accepts application/json content types 
    # + return - An OpenAir type record or an error 
    remote isolated function addAttachmentToExpenseReport(int id, AttachmentTypeJson payload, string? expand = (), string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}/attachments`;
        map<anydata> queryParam = {"expand": expand, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Retrieves the attachment record with the specified attachment ID associated with the expense report with the specified internal ID
    #
    # + id - The internal id of the expense report 
    # + attachmentId - The internal id of the attachment 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + return - An OpenAir type record or an error 
    remote isolated function getAttachmentByIDWithExpenseReport(int id, int attachmentId, string? expand = (), string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/expense-reports/${id}/attachments/${attachmentId}`;
        map<anydata> queryParam = {"expand": expand, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # delete the attachment with the specified attachment ID associated with the expense report with the specified internal ID, or clear the association between the workspace document with the specified attachment ID and the expense report with the specified internal ID
    #
    # + id - The internal id of the expense report 
    # + attachmentId - The internal id of the attachment 
    # + return - A successful or failed request returns a JSON object 
    remote isolated function deleteAttachmentOfExpenseReport(int id, int attachmentId) returns InlineResponse2001|error {
        string  path = string `/expense-reports/${id}/attachments/${attachmentId}`;
        InlineResponse2001 response = check self.clientEp-> delete(path, targetType = InlineResponse2001);
        return response;
    }
    # Retrieves the list of job codes
    #
    # + return - An OpenAir type record or an error 
    remote isolated function getJobs() returns OpenAirResponse|error {
        string  path = string `/job-codes/`;
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Creates a new job code record
    #
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all  attributes for the expense report returned 
    # + returnObject - If set to any value other than 0 (zero), the response will return the job code created. Otherwise, the response  will include only the internal ID of the job code created 
    # + payload - The JobCode object to be created 
    # + return - An OpenAir type record or an error 
    remote isolated function addJob(JobCode payload, string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/job-codes/`;
        map<anydata> queryParam = {"fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Retrieves the job code record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the job code returned 
    # + return - An OpenAir type record or an error 
    remote isolated function getJobById(int id, string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/job-codes/${id}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Update the job code record with the specified internal ID
    #
    # + id - The internal id of the contact 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the job code returned 
    # + returnObject - If set to any value other than 0 (zero), the response will include the job code updated. Otherwise, the response will include only the internal ID of the job code updated. 
    # + payload - An object including valid key-value pairs for the fields to be updated 
    # + return - An OpenAir type record or an error 
    remote isolated function updateJobCodeById(int id, JobCode payload, string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/job-codes/${id}`;
        map<anydata> queryParam = {"fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->put(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Deletes the job code record with the specified internal ID
    #
    # + id - The internal id of the job code 
    # + return - An OpenAir type record or an error 
    remote isolated function deleteJob(int id) returns OpenAirResponse|error {
        string  path = string `/job-codes/${id}`;
        OpenAirResponse response = check self.clientEp-> delete(path, targetType = OpenAirResponse);
        return response;
    }
    # Retrieves a list of receipts
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + 'limit - A limit on the length of the page 
    # + offset - A cursor for use in pagination 
    # + q - A URL-encoded query expression used to filter the resource collection and return the objects matching the specified search criteria 
    # + return - An OpenAir type record or an error 
    remote isolated function getReceipts(string? expand = (), string? fields = (), int? 'limit = (), int? offset = (), string? q = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "limit": 'limit, "offset": offset, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Create a new receipt
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned         
    # + returnObject - If set to any value other than 0 (zero), the response will return the expense report created. Otherwise, the response will include only the internal ID of the expense report created 
    # + payload - An expense report is a collection of expense items (receipts) that employees can use in OpenAir to claim reimbursement 
    # + return - An OpenAir type record or an error with ID and a message 
    remote isolated function insertReceipt(Receipts payload, string? expand = (), string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Retrieves a receipt with the specified internal ID.
    #
    # + id - The internal id of the receipt 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string)      
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned   
    # + return - An OpenAir type record or an error 
    remote isolated function getReceiptById(int id, string fields, string? expand = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Updates the receipt with the specified internal ID
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string)  
    # + id - The internal id of the receipt 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the job code returned 
    # + returnObject - If set to any value other than 0 (zero), the response will include the job code updated. Otherwise, the response will include only the internal ID of the job code updated. 
    # + payload - An object including valid key-value pairs for the fields to be updated 
    # + return - An OpenAir type record or an error 
    remote isolated function updateReceipt(int id, Receipts payload, string? expand = (), string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->put(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Gets the List of Attachments Associated with a Receipt
    #
    # + id - The internal id of the expense receipts 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned  
    # + 'limit - A limit on the length of the page 
    # + offset - A cursor for use in pagination 
    # + q - A URL-encoded query expression used to filter the resource collection and return the objects matching the specified search criteria                   
    # + return - An OpenAir type record or an error 
    remote isolated function getListOfAttachmentsOfReceipt(int id, string? expand = (), string? fields = (), int? 'limit = (), int? offset = (), string? q = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}/attachments`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "limit": 'limit, "offset": offset, "q": q};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Add an attachment to the receipt with the specified internal ID
    #
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string)  
    # + id - The internal id of the receipt 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the job code returned 
    # + returnObject - If set to any value other than 0 (zero), the response will include the job code updated. Otherwise, the response will include only the internal ID of the job code updated. 
    # + payload - This method accepts application/json content types 
    # + return - An OpenAir type record or an error 
    remote isolated function addAttachmentReceipt(int id, AttachmentTypeJson payload, string? expand = (), string? fields = (), boolean? returnObject = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}/attachments`;
        map<anydata> queryParam = {"expand": expand, "fields": fields, "return_object": returnObject};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OpenAirResponse response = check self.clientEp->post(path, request, targetType=OpenAirResponse);
        return response;
    }
    # Gets an Attachment Associated with a Receipt
    #
    # + id - The internal id of the expense receipts 
    # + attachmentId - The internal id of the attachment 
    # + expand - A comma-separated list of attributes available for expansion. The comma-separated list may include spaces (or %20 in the URL encoded string) 
    # + fields - A comma-separated list of attributes to include in the response. If not specified, the response includes all attributes for the expense report returned                       
    # + return - An OpenAir type record or an error 
    remote isolated function getAttachmentOfReceipt(int id, int attachmentId, string? expand = (), string? fields = ()) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}/attachments/${attachmentId}`;
        map<anydata> queryParam = {"expand": expand, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        OpenAirResponse response = check self.clientEp-> get(path, targetType = OpenAirResponse);
        return response;
    }
    # Deletes an Attachment Associated with a Receipt
    #
    # + id - The internal id of the expense receipts 
    # + attachmentId - The internal id of the attachment 
    # + return - An OpenAir type record or an error 
    remote isolated function deleteAttachmentOfReceipt(int id, int attachmentId) returns OpenAirResponse|error {
        string  path = string `/receipts/${id}/attachments/${attachmentId}`;
        OpenAirResponse response = check self.clientEp-> delete(path, targetType = OpenAirResponse);
        return response;
    }
}
