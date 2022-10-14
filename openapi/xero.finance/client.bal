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
    string refreshUrl = "https://identity.xero.com/connect/token";
|};

# This is a generated connector for [Xero Finance API v2.16.0](https://developer.xero.com/documentation/api/finance/overview) OpenAPI specification.
# The Finance API is a collection of endpoints which customers can use in the course of a loan application, which may assist lenders to gain the confidence they need to provide capital.
@display {label: "Xero Finance", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/finance.xro/1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get cash validation
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + balanceDate - Date, yyyy-MM-dd. If no parameter is provided, the current date will be used. The ‘balance date’ will return transactions based on the accounting date entered by the user.  Transactions before the balanceDate will be included. The user has discretion as to which accounting period the transaction relates to. The ‘balance date’  will control the latest maximum date of transactions included in the aggregate numbers.  Balance date does not affect the CurrentStatement object, as this will always return the most recent statement before asAtSystemDate (if specified) 
    # + asAtSystemDate - Date, yyyy-MM-dd. If no parameter is provided, the current date will be used. The ‘as at’ date will return transactions based on the  creation date.  It reflects the date the transactions were entered into Xero, not the accounting date. The ‘as at’ date can not be overridden by the user.  This can be used to estimate a ‘historical frequency of reconciliation’. The ‘as at’ date will affect the current statement in the response, as any candidate statements created after this date will be filtered out.  Thus the current statement returned will be the most recent statement prior to the specified ‘as at’ date.  Be aware that neither the begin date, nor the balance date, will affect the current statement. Note;  information is only presented when system architecture allows, meaning historical cash validation information will be an estimate. In addition, delete events are not aware of the ‘as at’ functionality in this endpoint, meaning that transactions deleted at the time the API is accessed will be considered to always have been deleted. 
    # + beginDate - Date, yyyy-MM-dd. If no parameter is provided, the aggregate results will be drawn from the user’s total history. The ‘begin date’ will return transactions based on the accounting date entered by the user. Transactions after the beginDate will be included. The user has discretion as to which accounting period the transaction relates to. 
    # + return - Success 
    remote isolated function getCashValidation(string xeroTenantId, string? balanceDate = (), string? asAtSystemDate = (), string? beginDate = ()) returns CashValidationResponse[]|error {
        string resourcePath = string `/CashValidation`;
        map<anydata> queryParam = {"balanceDate": balanceDate, "asAtSystemDate": asAtSystemDate, "beginDate": beginDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CashValidationResponse[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get account usage
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + startMonth - Date, yyyy-MM. If no parameter is provided, the month 12 months prior to the end month will be used. Account usage for up to 12 months from this date will be returned. 
    # + endMonth - Date, yyyy-MM. If no parameter is provided, the current month will be used. Account usage for up to 12 months prior to this date will be returned. 
    # + return - Success 
    remote isolated function getAccountUsage(string xeroTenantId, string? startMonth = (), string? endMonth = ()) returns AccountUsageResponse|error {
        string resourcePath = string `/AccountingActivities/AccountUsage`;
        map<anydata> queryParam = {"startMonth": startMonth, "endMonth": endMonth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountUsageResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get lock history
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + endDate - Date, yyyy-MM-dd. If no parameter is provided, the current date will be used. Lock History for up to 12 months before this date will be returned. 
    # + return - Success 
    remote isolated function getLockHistory(string xeroTenantId, string? endDate = ()) returns LockHistoryResponse|error {
        string resourcePath = string `/AccountingActivities/LockHistory`;
        map<anydata> queryParam = {"endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LockHistoryResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get report history
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + endDate - Date, yyyy-MM-dd. If no parameter is provided, the current date will be used. Reports published up to 12 months before this date will be returned. 
    # + return - Success 
    remote isolated function getReportHistory(string xeroTenantId, string? endDate = ()) returns ReportHistoryResponse|error {
        string resourcePath = string `/AccountingActivities/ReportHistory`;
        map<anydata> queryParam = {"endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportHistoryResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get user activities
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + dataMonth - Date, yyyy-MM. If no parameter is provided, the month immediately previous to the current month will be used. The user activities for the specified month will be returned. 
    # + return - Success 
    remote isolated function getUserActivities(string xeroTenantId, string? dataMonth = ()) returns UserActivitiesResponse|error {
        string resourcePath = string `/AccountingActivities/UserActivities`;
        map<anydata> queryParam = {"dataMonth": dataMonth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserActivitiesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Balance Sheet report
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + balanceDate - Specifies the date for balance sheet report. Format yyyy-MM-dd. If no parameter is provided, the current date will be used. 
    # + return - Success 
    remote isolated function getFinancialStatementBalanceSheet(string xeroTenantId, string? balanceDate = ()) returns BalanceSheetResponse|error {
        string resourcePath = string `/FinancialStatements/BalanceSheet`;
        map<anydata> queryParam = {"balanceDate": balanceDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BalanceSheetResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Cash flow report
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + startDate - Date e.g. yyyy-MM-dd. Specifies the start date for cash flow report. If no parameter is provided, the date of 12 months before the end date will be used. 
    # + endDate - Date e.g. yyyy-MM-dd. Specifies the end date for cash flow report. If no parameter is provided, the current date will be used. 
    # + return - Success 
    remote isolated function getFinancialStatementCashflow(string xeroTenantId, string? startDate = (), string? endDate = ()) returns CashflowResponse|error {
        string resourcePath = string `/FinancialStatements/Cashflow`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CashflowResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Profit & Loss report
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + startDate - Date e.g. yyyy-MM-dd. Specifies the start date for profit and loss report. If no parameter is provided, the date of 12 months before the end date will be used. 
    # + endDate - Date e.g. yyyy-MM-dd. Specifies the end date for profit and loss report. If no parameter is provided, the current date will be used. 
    # + return - Success 
    remote isolated function getFinancialStatementProfitAndLoss(string xeroTenantId, string? startDate = (), string? endDate = ()) returns ProfitAndLossResponse|error {
        string resourcePath = string `/FinancialStatements/ProfitAndLoss`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProfitAndLossResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Trial Balance report
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + endDate - Date e.g. yyyy-MM-dd. Specifies the end date for trial balance report. If no parameter is provided, the current date will be used. 
    # + return - Success 
    remote isolated function getFinancialStatementTrialBalance(string xeroTenantId, string? endDate = ()) returns TrialBalanceResponse|error {
        string resourcePath = string `/FinancialStatements/TrialBalance`;
        map<anydata> queryParam = {"endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrialBalanceResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
