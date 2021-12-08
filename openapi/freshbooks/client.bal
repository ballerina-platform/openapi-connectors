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

# This is a generated connector for [FreshBooks API v1](https://www.freshbooks.com/api/start) OpenAPI specification.
# FreshBooks lets you create professional looking invoices in seconds, automatically record expenses with ease and track your time quickly and efficiently so you can focus on what matters most - serving the needs of your clients. The FreshBooks API is an interface for accessing your FreshBooks data using JSON. 
@display {label: "FreshBooks", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [FreshBooks account](https://www.freshbooks.com/) and obtain tokens by following [this guide](https://www.freshbooks.com/api/start).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.freshbooks.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List all clients
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listClients(string accountId) returns ClientListResponse|error {
        string path = string `/accounting/account/${accountId}/users/clients`;
        ClientListResponse response = check self.clientEp->get(path, targetType = ClientListResponse);
        return response;
    }
    # Create a new client
    #
    # + accountId - Account ID. 
    # + payload - New client data 
    # + return - Success 
    remote isolated function createClient(string accountId, ClientCreateObject payload) returns ClientObjectResponse|error {
        string path = string `/accounting/account/${accountId}/users/clients`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClientObjectResponse response = check self.clientEp->post(path, request, targetType = ClientObjectResponse);
        return response;
    }
    # Get a single client with the parameter associated with clientId.
    #
    # + accountId - Account ID. 
    # + clientId - Client ID. 
    # + return - Success 
    remote isolated function getClient(string accountId, string clientId) returns ClientObjectResponse|error {
        string path = string `/accounting/account/${accountId}/users/clients/${clientId}`;
        ClientObjectResponse response = check self.clientEp->get(path, targetType = ClientObjectResponse);
        return response;
    }
    # Upadate a client
    #
    # + accountId - Account ID. 
    # + clientId - Client ID. 
    # + payload - Updated client data 
    # + return - Success 
    remote isolated function updateClient(string accountId, string clientId, ClientCreateObject payload) returns ClientObjectResponse|error {
        string path = string `/accounting/account/${accountId}/users/clients/${clientId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClientObjectResponse response = check self.clientEp->put(path, request, targetType = ClientObjectResponse);
        return response;
    }
    # Get an entire list of estimates that exist within your account.
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listEstimates(string accountId) returns EstimateListResponse|error {
        string path = string `/accounting/account/${accountId}/estimates/estimates`;
        EstimateListResponse response = check self.clientEp->get(path, targetType = EstimateListResponse);
        return response;
    }
    # Get a single estimate
    #
    # + accountId - Account ID. 
    # + estimateId - Estimate ID. 
    # + return - Success 
    remote isolated function getEstimate(string accountId, string estimateId) returns EstimateObjectResponse|error {
        string path = string `/accounting/account/${accountId}/estimates/estimates/${estimateId}`;
        EstimateObjectResponse response = check self.clientEp->get(path, targetType = EstimateObjectResponse);
        return response;
    }
    # Update an estimate
    #
    # + accountId - Account ID. 
    # + estimateId - Estimate ID. 
    # + payload - Updated estimate data 
    # + return - Success 
    remote isolated function updateEstimate(string accountId, string estimateId, EstimateUpdateObject payload) returns EstimateObjectResponse|error {
        string path = string `/accounting/account/${accountId}/estimates/estimates/${estimateId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EstimateObjectResponse response = check self.clientEp->put(path, request, targetType = EstimateObjectResponse);
        return response;
    }
    # Get all expenses
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listExpenses(string accountId) returns ExpenseListResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/expenses`;
        ExpenseListResponse response = check self.clientEp->get(path, targetType = ExpenseListResponse);
        return response;
    }
    # Create a new expense
    #
    # + accountId - Account ID. 
    # + payload - New expense data 
    # + return - Success 
    remote isolated function createExpense(string accountId, ExpenseCreateObject payload) returns ExpenseObjectResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/expenses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExpenseObjectResponse response = check self.clientEp->post(path, request, targetType = ExpenseObjectResponse);
        return response;
    }
    # Get a single expense
    #
    # + accountId - Account ID. 
    # + expenseId - Expense ID. 
    # + return - Success 
    remote isolated function getExpense(string accountId, string expenseId) returns ExpenseObjectResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/expenses/${expenseId}`;
        ExpenseObjectResponse response = check self.clientEp->get(path, targetType = ExpenseObjectResponse);
        return response;
    }
    # Update an expense
    #
    # + accountId - Account ID. 
    # + expenseId - Expense ID. 
    # + payload - Updated expense data 
    # + return - Success 
    remote isolated function updateExpense(string accountId, string expenseId, ExpenseUpdateObject payload) returns ExpenseObjectResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/expenses/${expenseId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExpenseObjectResponse response = check self.clientEp->put(path, request, targetType = ExpenseObjectResponse);
        return response;
    }
    # Get all invoices
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listInvoices(string accountId) returns InvoiceListResponse|error {
        string path = string `/accounting/account/${accountId}/invoices/invoices`;
        InvoiceListResponse response = check self.clientEp->get(path, targetType = InvoiceListResponse);
        return response;
    }
    # Create a new invoice
    #
    # + accountId - Account ID. 
    # + payload - New invoice data 
    # + return - Success 
    remote isolated function createInvoice(string accountId, InvoiceCreateObject payload) returns InvoiceObjectResponse|error {
        string path = string `/accounting/account/${accountId}/invoices/invoices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InvoiceObjectResponse response = check self.clientEp->post(path, request, targetType = InvoiceObjectResponse);
        return response;
    }
    # Get a single invoice
    #
    # + accountId - Account ID. 
    # + invoiceId - Invoice ID. 
    # + return - Success 
    remote isolated function getInvoice(string accountId, string invoiceId) returns InvoiceObjectResponse|error {
        string path = string `/accounting/account/${accountId}/invoices/invoices/${invoiceId}`;
        InvoiceObjectResponse response = check self.clientEp->get(path, targetType = InvoiceObjectResponse);
        return response;
    }
    # Update an invoice
    #
    # + accountId - Account ID. 
    # + invoiceId - Invoice ID. 
    # + payload - Updated invoice data 
    # + return - Success 
    remote isolated function updateInvoice(string accountId, string invoiceId, InvoiceUpdateObject payload) returns InvoiceObjectResponse|error {
        string path = string `/accounting/account/${accountId}/invoices/invoices/${invoiceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InvoiceObjectResponse response = check self.clientEp->put(path, request, targetType = InvoiceObjectResponse);
        return response;
    }
    # Get time entries
    #
    # + businessId - Bussiness ID. 
    # + billable - True returns entries that can be automatically added to an invoice 
    # + billed - True returns entries that have already been added to an invoice 
    # + clientId - Matches exact client ID 
    # + includeDeleted - True returns deleted time entries 
    # + team - True returns entries logged by all members of the business 
    # + includeUnlogged - True returns entries currently in progress for a running timer 
    # + startedFrom - matches entries that take place at or after the specified UTC date/time 
    # + startedTo - matches entries that take place before or at the specified UTC date/time 
    # + updatedSince - matches entries that have been updated at or after the specified UTC date/time 
    # + identityId - Matches entries logged against a specific teammate or user 
    # + return - Success 
    remote isolated function listTimeEntries(string businessId, boolean? billable = (), boolean? billed = (), int? clientId = (), boolean? includeDeleted = (), boolean? team = (), boolean? includeUnlogged = (), boolean? startedFrom = (), boolean? startedTo = (), boolean? updatedSince = (), boolean? identityId = ()) returns TimeEntryListResponse|error {
        string path = string `/timetracking/business/${businessId}/time_entries`;
        map<anydata> queryParam = {"billable": billable, "billed": billed, "client_id": clientId, "include_deleted": includeDeleted, "team": team, "include_unlogged": includeUnlogged, "started_from": startedFrom, "started_to": startedTo, "updated_since": updatedSince, "identity_id": identityId};
        path = path + check getPathForQueryParam(queryParam);
        TimeEntryListResponse response = check self.clientEp->get(path, targetType = TimeEntryListResponse);
        return response;
    }
    # Create a new time entry
    #
    # + businessId - Bussiness ID. 
    # + payload - New time entries data 
    # + return - Success 
    remote isolated function createTimeEntry(string businessId, TimeEntryCreateObject payload) returns TimeEntryObjectResponse|error {
        string path = string `/timetracking/business/${businessId}/time_entries`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeEntryObjectResponse response = check self.clientEp->post(path, request, targetType = TimeEntryObjectResponse);
        return response;
    }
    # Update a time entry
    #
    # + businessId - Bussiness ID. 
    # + timeEntryId - Time entry ID. 
    # + payload - Updated time entry data 
    # + return - Success 
    remote isolated function updateTimeEntry(string businessId, string timeEntryId, TimeEntryUpdateObject payload) returns TimeEntryObjectResponse|error {
        string path = string `/timetracking/business/${businessId}/time_entries/${timeEntryId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeEntryObjectResponse response = check self.clientEp->put(path, request, targetType = TimeEntryObjectResponse);
        return response;
    }
    # Delete a time entry
    #
    # + businessId - Bussiness ID. 
    # + timeEntryId - Time entry ID. 
    # + return - Success 
    remote isolated function deleteTimeEntry(string businessId, string timeEntryId) returns http:Response|error {
        string path = string `/timetracking/business/${businessId}/time_entries/${timeEntryId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Create a new project
    #
    # + businessId - Bussiness ID. 
    # + payload - New project data 
    # + return - Success 
    remote isolated function createProject(string businessId, ProjectCreateObject payload) returns ProjectObjectResponse|error {
        string path = string `/projects/business/${businessId}/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectObjectResponse response = check self.clientEp->post(path, request, targetType = ProjectObjectResponse);
        return response;
    }
    # Get details of all taxes
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listTaxes(string accountId) returns TaxListResponse|error {
        string path = string `/accounting/account/${accountId}/taxes/taxes`;
        TaxListResponse response = check self.clientEp->get(path, targetType = TaxListResponse);
        return response;
    }
    # Create a new tax
    #
    # + accountId - Account ID. 
    # + payload - New tax data 
    # + return - Success 
    remote isolated function createTax(string accountId, TaxCreateObject payload) returns TaxObjectResponse|error {
        string path = string `/accounting/account/${accountId}/taxes/taxes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaxObjectResponse response = check self.clientEp->post(path, request, targetType = TaxObjectResponse);
        return response;
    }
    # Get a single tax details
    #
    # + accountId - Account ID. 
    # + taxId - Tax ID. 
    # + return - Success 
    remote isolated function getTax(string accountId, string taxId) returns TaxObjectResponse|error {
        string path = string `/accounting/account/${accountId}/taxes/taxes/${taxId}`;
        TaxObjectResponse response = check self.clientEp->get(path, targetType = TaxObjectResponse);
        return response;
    }
    # Update a tax
    #
    # + accountId - Account ID. 
    # + taxId - Tax ID. 
    # + payload - Updated tax entry data 
    # + return - Success 
    remote isolated function updateTax(string accountId, string taxId, TaxUpdateObject payload) returns TaxObjectResponse|error {
        string path = string `/accounting/account/${accountId}/taxes/taxes/${taxId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaxObjectResponse response = check self.clientEp->put(path, request, targetType = TaxObjectResponse);
        return response;
    }
    # Delete a tax
    #
    # + accountId - Account ID. 
    # + taxId - Tax ID. 
    # + return - Success 
    remote isolated function deleteTax(string accountId, string taxId) returns http:Response|error {
        string path = string `/accounting/account/${accountId}/taxes/taxes/${taxId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Get details of all expense categories
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listExpenseCategories(string accountId) returns ExpenseCategoryListResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/categories`;
        ExpenseCategoryListResponse response = check self.clientEp->get(path, targetType = ExpenseCategoryListResponse);
        return response;
    }
    # Get a single expense category details
    #
    # + accountId - Account ID. 
    # + categoryId - Category ID. 
    # + return - Success 
    remote isolated function getExpenseCategory(string accountId, string categoryId) returns ExpenseCategoryObjectResponse|error {
        string path = string `/accounting/account/${accountId}/expenses/categories/${categoryId}`;
        ExpenseCategoryObjectResponse response = check self.clientEp->get(path, targetType = ExpenseCategoryObjectResponse);
        return response;
    }
    # Get details of all payments
    #
    # + accountId - Account ID. 
    # + return - Success 
    remote isolated function listPayments(string accountId) returns PaymemtListResponse|error {
        string path = string `/accounting/account/${accountId}/payments/payments`;
        PaymemtListResponse response = check self.clientEp->get(path, targetType = PaymemtListResponse);
        return response;
    }
    # Add a payment to a specific invoice
    #
    # + accountId - Account ID. 
    # + payload - New payment data 
    # + return - Success 
    remote isolated function makePayment(string accountId, PaymemtCreateObject payload) returns PaymemtObjectResponse|error {
        string path = string `/accounting/account/${accountId}/payments/payments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymemtObjectResponse response = check self.clientEp->post(path, request, targetType = PaymemtObjectResponse);
        return response;
    }
    # Get a single payment details
    #
    # + accountId - Account ID. 
    # + paymentId - Payment ID. 
    # + return - Success 
    remote isolated function getPayment(string accountId, string paymentId) returns PaymemtObjectResponse|error {
        string path = string `/accounting/account/${accountId}/payments/payments/${paymentId}`;
        PaymemtObjectResponse response = check self.clientEp->get(path, targetType = PaymemtObjectResponse);
        return response;
    }
    # Update a payment
    #
    # + accountId - Account ID. 
    # + paymentId - Payment ID. 
    # + payload - Updated tax entry data 
    # + return - Success 
    remote isolated function updatePayment(string accountId, string paymentId, PaymemtCreateObject payload) returns PaymemtObjectResponse|error {
        string path = string `/accounting/account/${accountId}/payments/payments/${paymentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymemtObjectResponse response = check self.clientEp->put(path, request, targetType = PaymemtObjectResponse);
        return response;
    }
}
