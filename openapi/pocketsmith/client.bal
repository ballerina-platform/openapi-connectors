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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [PocketSmith API v2.0](https://www.pocketsmith.com/) OpenAPI specification.
# The public PocketSmith API. It's a powerful interface for online money management with cash flow forecasts as well as superb historical tracking.
@display {label: "PocketSmith", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [PocketSmith account](https://www.pocketsmith.com/) and obtain OAuth tokens following [this guide](https://developers.pocketsmith.com/docs/oauth).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.pocketsmith.com/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get the authorised user
    #
    # + return - Success 
    remote isolated function getAuthorizedUser() returns User|error {
        string resourcePath = string `/me`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function getUserById(int id) returns User|error {
        string resourcePath = string `/users/${id}`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function updateUserById(int id, UsersIdBody payload) returns User|error {
        string resourcePath = string `/users/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get institution
    #
    # + id - The unique identifier of the institution. 
    # + return - Success 
    remote isolated function getInstitution(int id) returns Institution|error {
        string resourcePath = string `/institutions/${id}`;
        Institution response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update institution
    #
    # + id - The unique identifier of the institution. 
    # + return - Success 
    remote isolated function updateInstitution(int id, InstitutionsIdBody payload) returns Institution|error {
        string resourcePath = string `/institutions/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Institution response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete institution
    #
    # + id - The unique identifier of the institution. 
    # + return - Success 
    remote isolated function deleteInstitution(int id) returns http:Response|error {
        string resourcePath = string `/institutions/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List institutions in user
    #
    # + id - The unique identifier of the user 
    # + return - Success 
    remote isolated function listInstitutions(int id) returns Institution[]|error {
        string resourcePath = string `/users/${id}/institutions`;
        Institution[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create institution in user
    #
    # + id - The unique identifier of the user 
    # + return - Success 
    remote isolated function createInstitutionForUser(int id, IdInstitutionsBody payload) returns Institution|error {
        string resourcePath = string `/users/${id}/institutions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Institution response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get account
    #
    # + id - The unique identifier of the account. 
    # + return - Success 
    remote isolated function getAccountById(int id) returns Account|error {
        string resourcePath = string `/accounts/${id}`;
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update account
    #
    # + id - The unique identifier of the account. 
    # + return - Success 
    remote isolated function updateAccountById(int id, AccountsIdBody payload) returns Account|error {
        string resourcePath = string `/accounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete account
    #
    # + id - The unique identifier of the account. 
    # + return - Success 
    remote isolated function deleteAccountById(int id) returns http:Response|error {
        string resourcePath = string `/accounts/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List accounts in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function listAccounts(int id) returns Account[]|error {
        string resourcePath = string `/users/${id}/accounts`;
        Account[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the display order of accounts in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function updateAccountDisplayOrder(int id, IdAccountsBody payload) returns Account[]|error {
        string resourcePath = string `/users/${id}/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account[] response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create an account in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function createUserAccount(int id, IdAccountsBody1 payload) returns Account|error {
        string resourcePath = string `/users/${id}/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List accounts in institution
    #
    # + id - The unique identifier of the institution. 
    # + return - Success 
    remote isolated function listAccountsByInstitution(int id) returns Account[]|error {
        string resourcePath = string `/institutions/${id}/accounts`;
        Account[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get transaction account
    #
    # + id - The unique identifier of the transaction account. 
    # + return - Success 
    remote isolated function getTransactionAccount(int id) returns TransactionAccount|error {
        string resourcePath = string `/transaction_accounts/${id}`;
        TransactionAccount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update transaction account
    #
    # + id - The unique identifier of the transaction account. 
    # + return - Success 
    remote isolated function updateTransactionAccount(int id, TransactionAccountsIdBody payload) returns TransactionAccount|error {
        string resourcePath = string `/transaction_accounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransactionAccount response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List transaction accounts in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function listTransactionAccountsByUserId(int id) returns TransactionAccount[]|error {
        string resourcePath = string `/users/${id}/transaction_accounts`;
        TransactionAccount[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a transaction
    #
    # + id - The unique identifier of the transaction. 
    # + return - Success 
    remote isolated function getTransaction(int id) returns Transaction|error {
        string resourcePath = string `/transactions/${id}`;
        Transaction response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a transaction
    #
    # + labels - A new set of labels for the transaction. 
    # + id - The unique identifier of the transaction. 
    # + return - Success 
    remote isolated function updateTransaction(int id, TransactionsIdBody payload, string? labels = ()) returns Transaction|error {
        string resourcePath = string `/transactions/${id}`;
        map<anydata> queryParam = {"labels": labels};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Transaction response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List transactions in user
    #
    # + id - The unique identifier of the account. 
    # + startDate - Return only transactions on or after this date. Required if end_date is provided. If not provided, defaults to the furtherest date allowed by the user's subscription. 
    # + endDate - Return transactions that fall on or before this date. Required if start_date is provided. If not provided, defaults to today's date. 
    # + onlyUncategorised - If set, will return only uncategorised results. 
    # + 'type - Only return transactions of this type. 
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format. 
    # + page - Choose a particular page of the results. 
    # + return - Success 
    remote isolated function listTransactionsUser(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string resourcePath = string `/users/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List transactions in account
    #
    # + id - The unique identifier of the account. 
    # + startDate - Return only transactions on or after this date. Required if end_date is provided. If not provided, defaults to the furtherest date allowed by the user's subscription. 
    # + endDate - Return transactions that fall on or before this date. Required if start_date is provided. If not provided, defaults to today's date. 
    # + onlyUncategorised - If set, will return only uncategorised results. 
    # + 'type - Only return transactions of this type. 
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format. 
    # + page - Choose a particular page of the results. 
    # + return - Success 
    remote isolated function listTransactionsAccount(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string resourcePath = string `/accounts/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List transactions in transaction account
    #
    # + id - The unique identifier of the transaction account. 
    # + startDate - Return only transactions on or after this date. Required if `end_date` is provided. If not provided, defaults to the furtherest date allowed by the user's subscription. 
    # + endDate - Return transactions that fall on or before this date. Required if `start_date` is provided. If not provided, defaults to today's date. 
    # + onlyUncategorised - If set, will return only uncategorised results. 
    # + 'type - Only return transactions of this type. 
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format. 
    # + page - Choose a particular page of the results. 
    # + return - Success 
    remote isolated function listTransactionsByTransactionAccount(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string resourcePath = string `/transaction_accounts/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a transaction in transaction account
    #
    # + id - The unique identifier of the transaction account. 
    # + return - Success 
    remote isolated function createTransactionForTransactionAccount(int id, IdTransactionsBody payload) returns Transaction|error {
        string resourcePath = string `/transaction_accounts/${id}/transactions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Transaction response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get category
    #
    # + id - The unique identifier of the category. 
    # + return - Success 
    remote isolated function getCategoryById(int id) returns Category|error {
        string resourcePath = string `/categories/${id}`;
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update category
    #
    # + id - The unique identifier of the category. 
    # + return - Success 
    remote isolated function updateCategory(int id, CategoriesIdBody payload) returns Category|error {
        string resourcePath = string `/categories/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete category
    #
    # + id - The unique identifier of the category. 
    # + return - Success 
    remote isolated function deleteCategory(int id) returns http:Response|error {
        string resourcePath = string `/categories/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # List categories in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function listCategoriesByUserId(int id) returns Category[]|error {
        string resourcePath = string `/users/${id}/categories`;
        Category[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create category in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function createCategoryForUser(int id, IdCategoriesBody payload) returns Category|error {
        string resourcePath = string `/users/${id}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List category rules in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function createCategoryRuleInUser(int id) returns CategoryRule[]|error {
        string resourcePath = string `/users/${id}/category_rules`;
        CategoryRule[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create category rule in category
    #
    # + id - The unique identifier of the category. 
    # + return - Success 
    remote isolated function createCategoryRuleInCategory(int id, IdCategoryRulesBody payload) returns CategoryRule|error {
        string resourcePath = string `/categories/${id}/category_rules`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CategoryRule response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List budget for user
    #
    # + id - The unique identifier of the account. 
    # + rollUp - Whether parent categories should have their children rolled up into them. When used, the children will still appear in the collection on their own, but their actual and forecast figures will be rolled up to the root parent. 
    # + return - Success 
    remote isolated function listBudgetForUser(int id, boolean? rollUp = ()) returns BudgetAnalysisPackage[]|error {
        string resourcePath = string `/users/${id}/budget`;
        map<anydata> queryParam = {"roll_up": rollUp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get budget summary for user
    #
    # + id - The unique identifier of the user. 
    # + period - The period to analyse in, one of `weeks`, `months` or `years`. Also supported is `event`, although event period analysis is only possible when the budget events gathered align, so in this case where all categories are analysed together, it's highly unlikely that event period analysis will be possible. 
    # + interval - The period interval, e.g. if the interval is 2 and the period is weeks, the budget will be analysed fortnightly. 
    # + startDate - The date to start analysing the budget from. This will be bumped out to make full periods as necessary. 
    # + endDate - The date to stop analysing the budget from. This will be bumped out to make full periods as necessary. 
    # + return - Success 
    remote isolated function getBudgetSummaryForUser(int id, string period, int interval, string startDate, string endDate) returns BudgetAnalysisPackage[]|error {
        string resourcePath = string `/users/${id}/budget_summary`;
        map<anydata> queryParam = {"period": period, "interval": interval, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get trend analysis for user
    #
    # + id - The unique identifier of the user. 
    # + period - The period to analyse in, one of `weeks`, `months` or `years`. Also supported is `event`, although event period analysis is only possible when the budget events gathered align, so in this case where all categories are analysed together, it's highly unlikely that event period analysis will be possible. 
    # + interval - The period interval, e.g. if the interval is 2 and the period is weeks, the budget will be analysed fortnightly. 
    # + startDate - The date to start analysing the budget from. This will be bumped out to make full periods as necessary. 
    # + endDate - The date to stop analysing the budget from. This will be bumped out to make full periods as necessary. 
    # + categories - A comma-separated list of category IDs to analyse. 
    # + scenarios - A comma-separated list of scenario IDs to analyse. You're likely going to want to include all a user's scenarios here, unless you have reason to only analyse for a subset of scenarios. Regardless of what scenarios are analysed, all actuals (transactions) across all accounts will be included. 
    # + return - Success 
    remote isolated function getTrendAnalysisForUser(int id, string period, int interval, string startDate, string endDate, string categories, string scenarios) returns BudgetAnalysisPackage[]|error {
        string resourcePath = string `/users/${id}/trend_analysis`;
        map<anydata> queryParam = {"period": period, "interval": interval, "start_date": startDate, "end_date": endDate, "categories": categories, "scenarios": scenarios};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get attachment
    #
    # + id - The unique identifier of the attachment. 
    # + return - Success 
    remote isolated function getAttachment(int id) returns Attachment|error {
        string resourcePath = string `/attachments/${id}`;
        Attachment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update attachment
    #
    # + id - The unique identifier of the attachment. 
    # + return - Success 
    remote isolated function updateAttachment(int id, AttachmentsIdBody payload) returns Attachment|error {
        string resourcePath = string `/attachments/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachment response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete attachment
    #
    # + id - The unique identifier of the attachment. 
    # + return - Success 
    remote isolated function deleteAttachment(int id) returns http:Response|error {
        string resourcePath = string `/attachments/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Lists attachments in user
    #
    # + id - The unique identifier of the user. 
    # + unassigned - If set, returns unassigned attachments, that are available for assigning to a transaction. 
    # + return - Success 
    remote isolated function listAttachmentUser(int id, int? unassigned = ()) returns Attachment[]|error {
        string resourcePath = string `/users/${id}/attachments`;
        map<anydata> queryParam = {"unassigned": unassigned};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Attachment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create attachment in user
    #
    # + id - The unique identifier of the user. 
    # + return - Success 
    remote isolated function createAttachmentUser(int id, IdAttachmentsBody payload) returns Attachment|error {
        string resourcePath = string `/users/${id}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List attachments in transaction
    #
    # + id - The unique identifier of the transaction. 
    # + return - Success 
    remote isolated function listAttachmentTransaction(int id) returns Attachment[]|error {
        string resourcePath = string `/transactions/${id}/attachments`;
        Attachment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns attachment to transaction
    #
    # + id - The unique identifier of the transaction. 
    # + return - Success 
    remote isolated function assignsAttachmentToTransaction(int id, IdAttachmentsBody1 payload) returns Attachment|error {
        string resourcePath = string `/transactions/${id}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unassigns attachment in transaction
    #
    # + transactionId - The unique identifier of the transaction. 
    # + attachmentId - The unique identifier of the attachment. 
    # + return - Success 
    remote isolated function unassignAttachment(int transactionId, int attachmentId) returns http:Response|error {
        string resourcePath = string `/transactions/${transactionId}/attachments/${attachmentId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
