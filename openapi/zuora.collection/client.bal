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
    http:CredentialsConfig auth;
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

# This is a generated connector for [Zuora Collections API V1](https://www.zuora.com/developer/collect-api/#) OpenAPI specification.
# This reference provides detailed descriptions about functions, requests, and responses of the APIs for the following two component apps. Rest APIs for other component apps will  be included in this reference when they are released.
# - Advanced Payment Manager
# - Collections Window
# - Configurable Payment Retry
# - Statement Generator
@display {label: "Zuora Collection", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Zuora account](https://www.zuora.com/) and obtain tokens by following [this guide](https://www.zuora.com/developer/collect-api/#section/Authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get a payment run
    #
    # + paymentRunId - The payment run ID. A payment run id in Advanced Payment Manager is different from a payment run id in Zuora. 
    remote isolated function getPaymentRun(int paymentRunId) returns GETPaymentRunResponse|error {
        string resourcePath = string `/api/v1/subscription_payment_runs/${getEncodedUri(paymentRunId)}`;
        GETPaymentRunResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a payment run
    #
    remote isolated function createPaymentRun(POSTPaymentRun payload) returns POSTPaymentRunResponse|error {
        string resourcePath = string `/api/v1/subscription_payment_runs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        POSTPaymentRunResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get all payment run schedules
    #
    remote isolated function getPaymentRunSchedules() returns GETPaymentRunSchedulesResponse|error {
        string resourcePath = string `/api/v1/payment_run_schedules`;
        GETPaymentRunSchedulesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a payment run schedule
    #
    remote isolated function createPaymentRunSchedule(POSTPaymentRunSchedule payload) returns POSTPaymentRunScheduleResponse|error {
        string resourcePath = string `/api/v1/payment_run_schedules`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        POSTPaymentRunScheduleResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a payment run schedule
    #
    # + scheduleId - The schedule ID 
    remote isolated function getPaymentRunSchedule(int scheduleId) returns GETPaymentRunScheduleResponse|error {
        string resourcePath = string `/api/v1/payment_run_schedules/${getEncodedUri(scheduleId)}`;
        GETPaymentRunScheduleResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a payment run schedule
    #
    # + scheduleId - The schedule ID 
    remote isolated function updatePaymentRunSchedule(int scheduleId, PUTPaymentRunSchedule payload) returns POSTPaymentRunScheduleResponse|error {
        string resourcePath = string `/api/v1/payment_run_schedules/${getEncodedUri(scheduleId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        POSTPaymentRunScheduleResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Cancel a payment run schedule
    #
    # + scheduleId - The schedule ID 
    remote isolated function deletePaymentRunSchedule(int scheduleId) returns DELETEPaymentRunScheduleResponse|error {
        string resourcePath = string `/api/v1/payment_run_schedules/${getEncodedUri(scheduleId)}`;
        DELETEPaymentRunScheduleResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a statement
    #
    # + statementNumber - The statement number 
    remote isolated function getStatement(int statementNumber) returns http:Response|error {
        string resourcePath = string `/api/v1/fetch_statement?statement_number=${getEncodedUri(statementNumber)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple statements
    #
    # + accountId - The ID of the account 
    # + count - The number of statements you want to retrieve. 
    remote isolated function getStatements(int accountId, int count) returns GETStatementsResponse|error {
        string resourcePath = string `/api/v1/fetch_statements?account_id=${getEncodedUri(accountId)}&count=${getEncodedUri(count)}`;
        GETStatementsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Statement Generator settings
    #
    remote isolated function getSettings() returns GETStatementSettingsResponse|error {
        string resourcePath = string `/api/v1/fetch_settings`;
        GETStatementSettingsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an ad hoc statement run
    #
    remote isolated function createAdhocStatementRun(POSTAdhocStatementRun payload) returns POSTAdhocStatementRunResponse|error {
        string resourcePath = string `/api/v1/run`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        POSTAdhocStatementRunResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a custom statement run
    #
    remote isolated function createCustomStatementRun(POSTCustomStatementRun payload) returns POSTCustomStatementRunResponse|error {
        string resourcePath = string `/api/v1/execute`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        POSTCustomStatementRunResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get an account
    #
    # + accountId - The account ID. 
    remote isolated function getAccount(string accountId) returns CollectionAccount|error {
        string resourcePath = string `/api/v1/accounts/${getEncodedUri(accountId)}`;
        CollectionAccount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all accounts
    #
    remote isolated function getAccounts() returns GETCollectionAccountsResponse|error {
        string resourcePath = string `/api/v1/accounts`;
        GETCollectionAccountsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a collections agent by email
    #
    # + email - The email of the collections agent. 
    remote isolated function getCollectionsAgent(string email) returns CollectionAgent|error {
        string resourcePath = string `/api/v1/users/${getEncodedUri(email)}`;
        CollectionAgent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all collections agents
    #
    remote isolated function getCollectionsAgents() returns GETCollectionAgentsResponse|error {
        string resourcePath = string `/api/v1/users`;
        GETCollectionAgentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get an overview of collections
    #
    remote isolated function getCollectionsInfo() returns CollectionsInfo|error {
        string resourcePath = string `/api/v1/collections_info`;
        CollectionsInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update account status
    #
    # + accountId - The account ID. 
    # + status - The status that you want to update for the specified account. 
    # + value - The new value of the status. 0 indicates false, while 1 indicates true. 
    remote isolated function updateAccount(string accountId, string status, boolean? value = ()) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/accounts/${getEncodedUri(accountId)}/update_status`;
        map<anydata> queryParam = {"status": status, "value": value};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Update account agent
    #
    # + accountId - The account ID. 
    # + agentEmail - The email of the agent. 
    remote isolated function updateAccountAgent(string accountId, string agentEmail) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/accounts/${getEncodedUri(accountId)}/update_agent`;
        map<anydata> queryParam = {"agent_email": agentEmail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get active retry cycles for an invoice
    #
    # + invoiceId - ID of an invoice. 
    remote isolated function getActiveInvoiceCycle(string invoiceId) returns GETActiveInvoiceCycleResponse|error {
        string resourcePath = string `/api/v1/payments/active_invoice_cycle_information/<invoice_id>`;
        GETActiveInvoiceCycleResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get active retry cycles for a debit memo
    #
    # + debitMemoId - ID of a debit memo. 
    remote isolated function getActiveDebitMemoCycle(string debitMemoId) returns GETActiveDebitMemoCycleResponse|error {
        string resourcePath = string `/api/v1/payments/active_debit_memo_cycle_information/<debit_memo_id>`;
        GETActiveDebitMemoCycleResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get active retry cycles for an account
    #
    # + accountId - ID of an account. 
    remote isolated function getActiveAccountCycle(string accountId) returns GETActiveAccountCycleResponse|error {
        string resourcePath = string `/api/v1/payments/active_account_cycle_information/<account_id>`;
        GETActiveAccountCycleResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get retry cycle history for an invoice
    #
    # + invoiceId - ID of an invoice. 
    remote isolated function getInvoiceCycleHistory(string invoiceId) returns GETInvoiceCycleHistoryResponse|error {
        string resourcePath = string `/api/v1/payments/invoice_cycle_history/<invoice_id>`;
        GETInvoiceCycleHistoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get retry cycle history for a debit memo
    #
    # + debitMemoId - ID of a debit memo. 
    remote isolated function getDebitMemoCycleHistory(string debitMemoId) returns GETDebitMemoCycleHistoryResponse|error {
        string resourcePath = string `/api/v1/payments/debit_memo_cycle_history/<debit_memo_id>`;
        GETDebitMemoCycleHistoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get retry cycle history for an account
    #
    # + accountId - ID of an account. 
    remote isolated function getAccountCycleHistory(string accountId) returns GETAccountCycleHistoryResponse|error {
        string resourcePath = string `/api/v1/payments/account_cycle_history/<account_id>`;
        GETAccountCycleHistoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Execute invoice payment
    #
    # + invoiceId - ID of an invoice. 
    remote isolated function executeExecuteInvoicePayment(string invoiceId) returns InlineResponse2001|error {
        string resourcePath = string `/api/v1/payments/execute_invoice_payment/<invoice_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Execute debit memo payment
    #
    # + debitMemoId - ID of a debit memo. 
    remote isolated function executeExecuteDebitMemoPayment(string debitMemoId) returns InlineResponse2002|error {
        string resourcePath = string `/api/v1/payments/execute_debit_memo_payment/<debit_memo_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2002 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Execute account payments
    #
    # + accountId - ID of an account. 
    remote isolated function executeExecuteAccountPayments(string accountId) returns InlineResponse2003|error {
        string resourcePath = string `/api/v1/payments/execute_account_payments/<account_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2003 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Execute payments
    #
    remote isolated function updateExecutePayments(PaymentsExecutePaymentsBody payload) returns InlineResponse2004|error {
        string resourcePath = string `/api/v1/payments/execute_payments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2004 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove an invoice from retry cycle
    #
    # + invoiceId - ID of an invoice. 
    remote isolated function removeRemoveInoviceFromCycle(string invoiceId) returns InlineResponse2005|error {
        string resourcePath = string `/api/v1/payments/remove_invoice_from_retry_cycle/<invoice_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2005 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Remove a debit memo from retry cycle
    #
    # + debitMemoId - ID of a debit memo. 
    remote isolated function removeDebitMemoFromCycle(string debitMemoId) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/payments/remove_debit_memo_from_retry_cycle/<debit_memo_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Remove an account from retry cycle
    #
    # + accountId - ID of an account. 
    remote isolated function removeAccountFromCycle(string accountId) returns InlineResponse2007|error {
        string resourcePath = string `/api/v1/payments/remove_account_from_retry_cycle/<account_id>`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2007 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Submit a payment to retry cycle
    #
    remote isolated function updateSubmitPaymentToCycle(PaymentsSubmitFailedPaymentBody payload) returns InlineResponse2008|error {
        string resourcePath = string `/api/v1/payments/submit_failed_payment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2008 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get baseline metrics
    #
    remote isolated function getBaselineMetrics() returns GETBaselineMetricsResponse|error {
        string resourcePath = string `/api/v1/metrics/baseline`;
        GETBaselineMetricsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the Amount Recovered metrics
    #
    remote isolated function getAmountRecovered() returns GETAmountRecoveredResponse|error {
        string resourcePath = string `/api/v1/metrics/amount_recovered`;
        GETAmountRecoveredResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the Document Success Rate metrics by customer group
    #
    remote isolated function getDocumentSuccessRateByCustomerGroup() returns GETDocumentSuccessRateByCustomerGroupResponse|error {
        string resourcePath = string `/api/v1/metrics/customer_group_over_time`;
        GETDocumentSuccessRateByCustomerGroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the Customer Group metrics
    #
    remote isolated function getCustomerGroupMetrics() returns GETCustomerGroupMetricsResponse|error {
        string resourcePath = string `/api/v1/metrics/customer_group`;
        GETCustomerGroupMetricsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
