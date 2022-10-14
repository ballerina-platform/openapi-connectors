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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [WorkDay Expense REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# This API enables applications to access operations to extend the functionality of Workday Expenses.
@display {label: "Workday Expense", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Follow [this guide](https://credentials.workday.com/docs/authentication/) and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieves a single instance of an expense item.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getExpenseItemInstance(string id) returns ExpenseItemsServiceRepresentation|error {
        string resourcePath = string `/expenseItems/${getEncodedUri(id)}`;
        ExpenseItemsServiceRepresentation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single instance of an Expense Report.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getExpenseReportInstance(string id) returns ReportServiceRepresentation|error {
        string resourcePath = string `/reports/${getEncodedUri(id)}`;
        ReportServiceRepresentation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single instance of a Quick Expense.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getQuickExpenseInstance(string id) returns ExpenseEntryServiceRepresentation|error {
        string resourcePath = string `/entries/${getEncodedUri(id)}`;
        ExpenseEntryServiceRepresentation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing Quick Expense instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating file. 
    remote isolated function updateQuickExpenseInstance(string id, EntryServicePUTRepresentation payload) returns EntryServicePUTRepresentation|error {
        string resourcePath = string `/entries/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntryServicePUTRepresentation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a Quick Expense with the specified WID.
    # 
    # Secured by: Self-Service: Expense Report
    # 
    # Scope: Expenses
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Deleting resource. 
    remote isolated function deleteQuickExpenseByID(string id) returns http:Response|error {
        string resourcePath = string `/entries/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Partially updates an existing Quick Expense with the specified WID for the fields provided in the request body.
    # 
    # Secured by: Self-Service: Expense Report
    # 
    # Scope: Expenses
    # 
    # Contains attachment(s)
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating file. 
    remote isolated function updateQuickExpenseByID(string id, EntryServicePUTRepresentation payload) returns EntryServicePUTRepresentation|error {
        string resourcePath = string `/entries/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntryServicePUTRepresentation response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieves a collection of expense reports.
    #
    # + expenseReportMemo - Memo label to be used for REST API 
    # + expenseReportStatus - Status label to be used for REST API 
    # + fromDate - Creation Date label to be used for REST API 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + toDate - Creation Date label to be used for REST API 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfExpenseReports(string? expenseReportMemo = (), string[]? expenseReportStatus = (), string? fromDate = (), int? 'limit = (), int? offset = (), string? toDate = ()) returns InlineResponse200|error {
        string resourcePath = string `/reports`;
        map<anydata> queryParam = {"expenseReportMemo": expenseReportMemo, "expenseReportStatus": expenseReportStatus, "fromDate": fromDate, "limit": 'limit, "offset": offset, "toDate": toDate};
        map<Encoding> queryParamEncoding = {"expenseReportStatus": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an expense report.
    # 
    # Secured by: Self-Service: Expense Report
    # 
    # Scope: Expenses
    #
    # + expenseReportMemo - Memo label to be used for REST API 
    # + expenseReportStatus - Status label to be used for REST API 
    # + fromDate - Creation Date label to be used for REST API 
    # + toDate - Creation Date label to be used for REST API 
    # + return - Resource created. 
    remote isolated function createExpenseReport(ReportPostServiceRepresentation payload, string? expenseReportMemo = (), string[]? expenseReportStatus = (), string? fromDate = (), string? toDate = ()) returns ReportPostServiceRepresentation|error {
        string resourcePath = string `/reports`;
        map<anydata> queryParam = {"expenseReportMemo": expenseReportMemo, "expenseReportStatus": expenseReportStatus, "fromDate": fromDate, "toDate": toDate};
        map<Encoding> queryParamEncoding = {"expenseReportStatus": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportPostServiceRepresentation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a collection of expense report lines.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createCollectionExpenseReportLines(string id, PostExpenseReportLineRepresentation payload) returns PostExpenseReportLineRepresentation|error {
        string resourcePath = string `/reports/${getEncodedUri(id)}/lines`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PostExpenseReportLineRepresentation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Submit the Expense Report for approval.
    # 
    # Secured by: Submit Expense Report (REST API)
    # 
    # Scope: Expenses
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function submitExpenseReportApproval(string id, SubmitExpenseReportRepresentation payload) returns SubmitExpenseReportRepresentation|error {
        string resourcePath = string `/reports/${getEncodedUri(id)}/submit`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubmitExpenseReportRepresentation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a collection of Quick Expenses.
    #
    # + entryType - Identifies the class type of the expense instance. 
    # + expenseEntryStatus - Expense Status 
    # + fromDate - Date of Expense Entry 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + toDate - Date of Expense Entry 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfQuickExpenses(string? entryType = (), string? expenseEntryStatus = (), string? fromDate = (), int? 'limit = (), int? offset = (), string? toDate = ()) returns InlineResponse2001|error {
        string resourcePath = string `/entries`;
        map<anydata> queryParam = {"entryType": entryType, "expenseEntryStatus": expenseEntryStatus, "fromDate": fromDate, "limit": 'limit, "offset": offset, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a Quick Expense instance. In the request body, you must specify the required TransactionDate field.
    # 
    # Secured by: Self-Service: Expense Report
    # 
    # Scope: Expenses
    # 
    # Contains attachment(s)
    #
    # + entryType - Identifies the class type of the expense instance. 
    # + expenseEntryStatus - Expense Status 
    # + fromDate - Date of Expense Entry 
    # + toDate - Date of Expense Entry 
    # + return - Resource created. 
    remote isolated function createQuickExpenseInstance(EntryServiceRepresentation payload, string? entryType = (), string? expenseEntryStatus = (), string? fromDate = (), string? toDate = ()) returns EntryServiceRepresentation|error {
        string resourcePath = string `/entries`;
        map<anydata> queryParam = {"entryType": entryType, "expenseEntryStatus": expenseEntryStatus, "fromDate": fromDate, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntryServiceRepresentation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates new attachments for the existing expense entry.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createsNewAttachmentsForExpenseEntry(string id, ExpenseEntryImage payload) returns ExpenseEntryImage|error {
        string resourcePath = string `/entries/${getEncodedUri(id)}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExpenseEntryImage response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a collection of expense items.
    #
    # + disallowFixedItems - Is this expense item validated for a fixed amount? 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + searchString - Request string used to retrieve the Expense Items 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfItems(boolean? disallowFixedItems = (), int? 'limit = (), int? offset = (), string? searchString = ()) returns InlineResponse2002|error {
        string resourcePath = string `/expenseItems`;
        map<anydata> queryParam = {"disallowFixedItems": disallowFixedItems, "limit": 'limit, "offset": offset, "searchString": searchString};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
