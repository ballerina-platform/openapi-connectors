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

# This is a generated connector for [YNAB API v1.0.0](https://api.youneedabudget.com) OpenAPI specification.
# YNAB API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. 
# We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body. 
# API Documentation is at https://api.youneedabudget.com
@display {label: "YNAB", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [YNAB account](https://app.youneedabudget.com) and obtain tokens by following [this guide](https://api.youneedabudget.com/#quick-start).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.youneedabudget.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # User info
    #
    # + return - The user info 
    remote isolated function getUser() returns UserResponse|error {
        string resourcePath = string `/user`;
        UserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List budgets
    #
    # + includeAccounts - Whether to include the list of budget accounts 
    # + return - The list of budgets 
    remote isolated function getBudgets(boolean? includeAccounts = ()) returns BudgetSummaryResponse|error {
        string resourcePath = string `/budgets`;
        map<anydata> queryParam = {"include_accounts": includeAccounts};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BudgetSummaryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single budget
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The requested budget 
    remote isolated function getBudgetById(string budgetId, int? lastKnowledgeOfServer = ()) returns BudgetDetailResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BudgetDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Budget Settings
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + return - The requested budget settings 
    remote isolated function getBudgetSettingsById(string budgetId) returns BudgetSettingsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/settings`;
        BudgetSettingsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Account list
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested accounts 
    remote isolated function getAccounts(string budgetId, int? lastKnowledgeOfServer = ()) returns AccountsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/accounts`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new account
    #
    # + budgetId - The id of the budget ("last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget) 
    # + payload - The account to create. 
    # + return - The account was successfully created 
    remote isolated function createAccount(string budgetId, byte[] payload) returns AccountResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/accounts`;
        http:Request request = new;
        request.setPayload(payload);
        AccountResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Single account
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + accountId - The id of the account 
    # + return - The requested account 
    remote isolated function getAccountById(string budgetId, string accountId) returns AccountResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/accounts/${getEncodedUri(accountId)}`;
        AccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List categories
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The categories grouped by category group 
    remote isolated function getCategories(string budgetId, int? lastKnowledgeOfServer = ()) returns CategoriesResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/categories`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CategoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single category
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + categoryId - The id of the category 
    # + return - The requested category 
    remote isolated function getCategoryById(string budgetId, string categoryId) returns CategoryResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/categories/${getEncodedUri(categoryId)}`;
        CategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single category for a specific budget month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC)) 
    # + categoryId - The id of the category 
    # + return - The requested month category 
    remote isolated function getMonthCategoryById(string budgetId, string month, string categoryId) returns CategoryResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/months/${getEncodedUri(month)}/categories/${getEncodedUri(categoryId)}`;
        CategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a category for a specific month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC)) 
    # + categoryId - The id of the category 
    # + payload - The category to update.  Only `budgeted` amount can be updated and any other fields specified will be ignored. 
    # + return - The month category was successfully updated 
    remote isolated function updateMonthCategory(string budgetId, string month, string categoryId, byte[] payload) returns SaveCategoryResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/months/${getEncodedUri(month)}/categories/${getEncodedUri(categoryId)}`;
        http:Request request = new;
        request.setPayload(payload);
        SaveCategoryResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List payees
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The requested list of payees 
    remote isolated function getPayees(string budgetId, int? lastKnowledgeOfServer = ()) returns PayeesResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payees`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PayeesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single payee
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payeeId - The id of the payee 
    # + return - The requested payee 
    remote isolated function getPayeeById(string budgetId, string payeeId) returns PayeeResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payees/${getEncodedUri(payeeId)}`;
        PayeeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List payee locations
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + return - The list of payee locations 
    remote isolated function getPayeeLocations(string budgetId) returns PayeeLocationsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payee_locations`;
        PayeeLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single payee location
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payeeLocationId - id of payee location 
    # + return - The payee location 
    remote isolated function getPayeeLocationById(string budgetId, string payeeLocationId) returns PayeeLocationResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payee_locations/${getEncodedUri(payeeLocationId)}`;
        PayeeLocationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List locations for a payee
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payeeId - id of payee 
    # + return - The list of requested payee locations 
    remote isolated function getPayeeLocationsByPayee(string budgetId, string payeeId) returns PayeeLocationsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payees/${getEncodedUri(payeeId)}/payee_locations`;
        PayeeLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List budget months
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of budget months 
    remote isolated function getBudgetMonths(string budgetId, int? lastKnowledgeOfServer = ()) returns MonthSummariesResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/months`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MonthSummariesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single budget month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC)) 
    # + return - The budget month detail 
    remote isolated function getBudgetMonth(string budgetId, string month) returns MonthDetailResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/months/${getEncodedUri(month)}`;
        MonthDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + sinceDate - If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30). 
    # + 'type - If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported. 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested transactions 
    remote isolated function getTransactions(string budgetId, string? sinceDate = (), string? 'type = (), int? lastKnowledgeOfServer = ()) returns TransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a single transaction or multiple transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payload - The transaction or transactions to create.  To create a single transaction you can specify a value for the `transaction` object and to create multiple transactions you can specify an array of `transactions`.  It is expected that you will only provide a value for one of these objects. 
    # + return - The transaction or transactions were successfully created 
    remote isolated function createTransaction(string budgetId, byte[] payload) returns SaveTransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions`;
        http:Request request = new;
        request.setPayload(payload);
        SaveTransactionsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update multiple transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payload - The transactions to update. Each transaction must have either an `id` or `import_id` specified. If `id` is specified as null an `import_id` value can be provided which will allow transaction(s) to be updated by their `import_id`. If an `id` is specified, it will always be used for lookup. 
    # + return - The transactions were successfully updated 
    remote isolated function updateTransactions(string budgetId, byte[] payload) returns SaveTransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions`;
        http:Request request = new;
        request.setPayload(payload);
        SaveTransactionsResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Import transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + return - The request was successful but there were no transactions to import 
    remote isolated function importTransactions(string budgetId) returns TransactionsImportResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions/import`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TransactionsImportResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Single transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + transactionId - The id of the transaction 
    # + return - The requested transaction 
    remote isolated function getTransactionById(string budgetId, string transactionId) returns TransactionResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions/${getEncodedUri(transactionId)}`;
        TransactionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + transactionId - The id of the transaction 
    # + payload - The transaction to update 
    # + return - The transaction was successfully updated 
    remote isolated function updateTransaction(string budgetId, string transactionId, byte[] payload) returns TransactionResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions/${getEncodedUri(transactionId)}`;
        http:Request request = new;
        request.setPayload(payload);
        TransactionResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Bulk create transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payload - The list of transactions to create 
    # + return - The bulk request was processed successfully 
    remote isolated function bulkCreateTransactions(string budgetId, byte[] payload) returns BulkResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/transactions/bulk`;
        http:Request request = new;
        request.setPayload(payload);
        BulkResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List account transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + accountId - The id of the account 
    # + sinceDate - If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30). 
    # + 'type - If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported. 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested transactions 
    remote isolated function getTransactionsByAccount(string budgetId, string accountId, string? sinceDate = (), string? 'type = (), int? lastKnowledgeOfServer = ()) returns TransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/accounts/${getEncodedUri(accountId)}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List category transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + categoryId - The id of the category 
    # + sinceDate - If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30). 
    # + 'type - If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported. 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested transactions 
    remote isolated function getTransactionsByCategory(string budgetId, string categoryId, string? sinceDate = (), string? 'type = (), int? lastKnowledgeOfServer = ()) returns HybridTransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/categories/${getEncodedUri(categoryId)}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HybridTransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List payee transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + payeeId - The id of the payee 
    # + sinceDate - If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30). 
    # + 'type - If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported. 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested transactions 
    remote isolated function getTransactionsByPayee(string budgetId, string payeeId, string? sinceDate = (), string? 'type = (), int? lastKnowledgeOfServer = ()) returns HybridTransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/payees/${getEncodedUri(payeeId)}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HybridTransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List scheduled transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included. 
    # + return - The list of requested scheduled transactions 
    remote isolated function getScheduledTransactions(string budgetId, int? lastKnowledgeOfServer = ()) returns ScheduledTransactionsResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/scheduled_transactions`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScheduledTransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Single scheduled transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget). 
    # + scheduledTransactionId - The id of the scheduled transaction 
    # + return - The requested Scheduled Transaction 
    remote isolated function getScheduledTransactionById(string budgetId, string scheduledTransactionId) returns ScheduledTransactionResponse|error {
        string resourcePath = string `/budgets/${getEncodedUri(budgetId)}/scheduled_transactions/${getEncodedUri(scheduledTransactionId)}`;
        ScheduledTransactionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
