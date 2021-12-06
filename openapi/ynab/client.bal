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
import ballerina/url;
import ballerina/lang.'string;

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
    }
    # User info
    #
    # + return - The user info
    remote isolated function getUser() returns UserResponse|error {
        string  path = string `/user`;
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    # List budgets
    #
    # + includeAccounts - Whether to include the list of budget accounts
    # + return - The list of budgets
    remote isolated function getBudgets(boolean? includeAccounts = ()) returns BudgetSummaryResponse|error {
        string  path = string `/budgets`;
        map<anydata> queryParam = {"include_accounts": includeAccounts};
        path = path + check getPathForQueryParam(queryParam);
        BudgetSummaryResponse response = check self.clientEp-> get(path, targetType = BudgetSummaryResponse);
        return response;
    }
    # Single budget
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The requested budget
    remote isolated function getBudgetById(string budgetId, int? lastKnowledgeOfServer = ()) returns BudgetDetailResponse|error {
        string  path = string `/budgets/${budgetId}`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        BudgetDetailResponse response = check self.clientEp-> get(path, targetType = BudgetDetailResponse);
        return response;
    }
    # Budget Settings
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + return - The requested budget settings
    remote isolated function getBudgetSettingsById(string budgetId) returns BudgetSettingsResponse|error {
        string  path = string `/budgets/${budgetId}/settings`;
        BudgetSettingsResponse response = check self.clientEp-> get(path, targetType = BudgetSettingsResponse);
        return response;
    }
    # Account list
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The list of requested accounts
    remote isolated function getAccounts(string budgetId, int? lastKnowledgeOfServer = ()) returns AccountsResponse|error {
        string  path = string `/budgets/${budgetId}/accounts`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        AccountsResponse response = check self.clientEp-> get(path, targetType = AccountsResponse);
        return response;
    }
    # Create a new account
    #
    # + budgetId - The id of the budget ("last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # + payload - The account to create.
    # + return - The account was successfully created
    remote isolated function createAccount(string budgetId, SaveAccountWrapper payload) returns AccountResponse|error {
        string  path = string `/budgets/${budgetId}/accounts`;
        http:Request request = new;
        AccountResponse response = check self.clientEp->post(path, request, targetType=AccountResponse);
        return response;
    }
    # Single account
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + accountId - The id of the account
    # + return - The requested account
    remote isolated function getAccountById(string budgetId, string accountId) returns AccountResponse|error {
        string  path = string `/budgets/${budgetId}/accounts/${accountId}`;
        AccountResponse response = check self.clientEp-> get(path, targetType = AccountResponse);
        return response;
    }
    # List categories
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The categories grouped by category group
    remote isolated function getCategories(string budgetId, int? lastKnowledgeOfServer = ()) returns CategoriesResponse|error {
        string  path = string `/budgets/${budgetId}/categories`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        CategoriesResponse response = check self.clientEp-> get(path, targetType = CategoriesResponse);
        return response;
    }
    # Single category
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + categoryId - The id of the category
    # + return - The requested category
    remote isolated function getCategoryById(string budgetId, string categoryId) returns CategoryResponse|error {
        string  path = string `/budgets/${budgetId}/categories/${categoryId}`;
        CategoryResponse response = check self.clientEp-> get(path, targetType = CategoryResponse);
        return response;
    }
    # Single category for a specific budget month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))
    # + categoryId - The id of the category
    # + return - The requested month category
    remote isolated function getMonthCategoryById(string budgetId, string month, string categoryId) returns CategoryResponse|error {
        string  path = string `/budgets/${budgetId}/months/${month}/categories/${categoryId}`;
        CategoryResponse response = check self.clientEp-> get(path, targetType = CategoryResponse);
        return response;
    }
    # Update a category for a specific month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))
    # + categoryId - The id of the category
    # + payload - The category to update.  Only `budgeted` amount can be updated and any other fields specified will be ignored.
    # + return - The month category was successfully updated
    remote isolated function updateMonthCategory(string budgetId, string month, string categoryId, SaveMonthCategoryWrapper payload) returns SaveCategoryResponse|error {
        string  path = string `/budgets/${budgetId}/months/${month}/categories/${categoryId}`;
        http:Request request = new;
        SaveCategoryResponse response = check self.clientEp->patch(path, request, targetType=SaveCategoryResponse);
        return response;
    }
    # List payees
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The requested list of payees
    remote isolated function getPayees(string budgetId, int? lastKnowledgeOfServer = ()) returns PayeesResponse|error {
        string  path = string `/budgets/${budgetId}/payees`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        PayeesResponse response = check self.clientEp-> get(path, targetType = PayeesResponse);
        return response;
    }
    # Single payee
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payeeId - The id of the payee
    # + return - The requested payee
    remote isolated function getPayeeById(string budgetId, string payeeId) returns PayeeResponse|error {
        string  path = string `/budgets/${budgetId}/payees/${payeeId}`;
        PayeeResponse response = check self.clientEp-> get(path, targetType = PayeeResponse);
        return response;
    }
    # List payee locations
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + return - The list of payee locations
    remote isolated function getPayeeLocations(string budgetId) returns PayeeLocationsResponse|error {
        string  path = string `/budgets/${budgetId}/payee_locations`;
        PayeeLocationsResponse response = check self.clientEp-> get(path, targetType = PayeeLocationsResponse);
        return response;
    }
    # Single payee location
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payeeLocationId - id of payee location
    # + return - The payee location
    remote isolated function getPayeeLocationById(string budgetId, string payeeLocationId) returns PayeeLocationResponse|error {
        string  path = string `/budgets/${budgetId}/payee_locations/${payeeLocationId}`;
        PayeeLocationResponse response = check self.clientEp-> get(path, targetType = PayeeLocationResponse);
        return response;
    }
    # List locations for a payee
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payeeId - id of payee
    # + return - The list of requested payee locations
    remote isolated function getPayeeLocationsByPayee(string budgetId, string payeeId) returns PayeeLocationsResponse|error {
        string  path = string `/budgets/${budgetId}/payees/${payeeId}/payee_locations`;
        PayeeLocationsResponse response = check self.clientEp-> get(path, targetType = PayeeLocationsResponse);
        return response;
    }
    # List budget months
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The list of budget months
    remote isolated function getBudgetMonths(string budgetId, int? lastKnowledgeOfServer = ()) returns MonthSummariesResponse|error {
        string  path = string `/budgets/${budgetId}/months`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        MonthSummariesResponse response = check self.clientEp-> get(path, targetType = MonthSummariesResponse);
        return response;
    }
    # Single budget month
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + month - The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))
    # + return - The budget month detail
    remote isolated function getBudgetMonth(string budgetId, string month) returns MonthDetailResponse|error {
        string  path = string `/budgets/${budgetId}/months/${month}`;
        MonthDetailResponse response = check self.clientEp-> get(path, targetType = MonthDetailResponse);
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
        string  path = string `/budgets/${budgetId}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        TransactionsResponse response = check self.clientEp-> get(path, targetType = TransactionsResponse);
        return response;
    }
    # Create a single transaction or multiple transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payload - The transaction or transactions to create.  To create a single transaction you can specify a value for the `transaction` object and to create multiple transactions you can specify an array of `transactions`.  It is expected that you will only provide a value for one of these objects.
    # + return - The transaction or transactions were successfully created
    remote isolated function createTransaction(string budgetId, SaveTransactionsWrapper payload) returns SaveTransactionsResponse|error {
        string  path = string `/budgets/${budgetId}/transactions`;
        http:Request request = new;
        SaveTransactionsResponse response = check self.clientEp->post(path, request, targetType=SaveTransactionsResponse);
        return response;
    }
    # Update multiple transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payload - The transactions to update. Each transaction must have either an `id` or `import_id` specified. If `id` is specified as null an `import_id` value can be provided which will allow transaction(s) to be updated by their `import_id`. If an `id` is specified, it will always be used for lookup.
    # + return - The transactions were successfully updated
    remote isolated function updateTransactions(string budgetId, UpdateTransactionsWrapper payload) returns SaveTransactionsResponse|error {
        string  path = string `/budgets/${budgetId}/transactions`;
        http:Request request = new;
        SaveTransactionsResponse response = check self.clientEp->patch(path, request, targetType=SaveTransactionsResponse);
        return response;
    }
    # Import transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + return - The request was successful but there were no transactions to import
    remote isolated function importTransactions(string budgetId) returns TransactionsImportResponse|error {
        string  path = string `/budgets/${budgetId}/transactions/import`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TransactionsImportResponse response = check self.clientEp-> post(path, request, targetType = TransactionsImportResponse);
        return response;
    }
    # Single transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + transactionId - The id of the transaction
    # + return - The requested transaction
    remote isolated function getTransactionById(string budgetId, string transactionId) returns TransactionResponse|error {
        string  path = string `/budgets/${budgetId}/transactions/${transactionId}`;
        TransactionResponse response = check self.clientEp-> get(path, targetType = TransactionResponse);
        return response;
    }
    # Updates an existing transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + transactionId - The id of the transaction
    # + payload - The transaction to update
    # + return - The transaction was successfully updated
    remote isolated function updateTransaction(string budgetId, string transactionId, SaveTransactionWrapper payload) returns TransactionResponse|error {
        string  path = string `/budgets/${budgetId}/transactions/${transactionId}`;
        http:Request request = new;
        TransactionResponse response = check self.clientEp->put(path, request, targetType=TransactionResponse);
        return response;
    }
    # Bulk create transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + payload - The list of transactions to create
    # + return - The bulk request was processed successfully
    remote isolated function bulkCreateTransactions(string budgetId, BulkTransactions payload) returns BulkResponse|error {
        string  path = string `/budgets/${budgetId}/transactions/bulk`;
        http:Request request = new;
        BulkResponse response = check self.clientEp->post(path, request, targetType=BulkResponse);
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
        string  path = string `/budgets/${budgetId}/accounts/${accountId}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        TransactionsResponse response = check self.clientEp-> get(path, targetType = TransactionsResponse);
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
        string  path = string `/budgets/${budgetId}/categories/${categoryId}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        HybridTransactionsResponse response = check self.clientEp-> get(path, targetType = HybridTransactionsResponse);
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
        string  path = string `/budgets/${budgetId}/payees/${payeeId}/transactions`;
        map<anydata> queryParam = {"since_date": sinceDate, "type": 'type, "last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        HybridTransactionsResponse response = check self.clientEp-> get(path, targetType = HybridTransactionsResponse);
        return response;
    }
    # List scheduled transactions
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + lastKnowledgeOfServer - The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.
    # + return - The list of requested scheduled transactions
    remote isolated function getScheduledTransactions(string budgetId, int? lastKnowledgeOfServer = ()) returns ScheduledTransactionsResponse|error {
        string  path = string `/budgets/${budgetId}/scheduled_transactions`;
        map<anydata> queryParam = {"last_knowledge_of_server": lastKnowledgeOfServer};
        path = path + check getPathForQueryParam(queryParam);
        ScheduledTransactionsResponse response = check self.clientEp-> get(path, targetType = ScheduledTransactionsResponse);
        return response;
    }
    # Single scheduled transaction
    #
    # + budgetId - The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
    # + scheduledTransactionId - The id of the scheduled transaction
    # + return - The requested Scheduled Transaction
    remote isolated function getScheduledTransactionById(string budgetId, string scheduledTransactionId) returns ScheduledTransactionResponse|error {
        string  path = string `/budgets/${budgetId}/scheduled_transactions/${scheduledTransactionId}`;
        ScheduledTransactionResponse response = check self.clientEp-> get(path, targetType = ScheduledTransactionResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
