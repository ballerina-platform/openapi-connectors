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

# This is a generated connector for [Recurly API V3](https://developers.recurly.com/api/v2021-02-25/index.html) OpenAPI specification.
# Recurly is a subscription management platform delivering a competitive advantage for leading brands worldwide. 
# Trusted by Sling TV, BarkBox, Asana, and thousands more to drive recurring revenue.
# Onboard and manage customers through Recurly API.
@display {label: "Recurly", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Recurly account](https://recurly.com) and obtain tokens by following [this guide](https://developers.recurly.com/api/v2021-02-25/index.html#section/Authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://v3.recurly.com") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List sites
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + state - Filter by state. 
    # + return - A list of sites. 
    remote isolated function listSites(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? state = ()) returns SiteList|error {
        string resourcePath = string `/sites`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a site
    #
    # + siteId - Site ID or subdomain. For ID no prefix is used e.g. `e28zov4fw0v2`. For subdomain use prefix `subdomain-`, e.g. `subdomain-recurly`. 
    # + return - A site. 
    remote isolated function getSite(string siteId) returns Site|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}`;
        Site response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's accounts
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + email - Filter for accounts with this exact email address. A blank value will return accounts with both `null` and `""` email addresses. Note that multiple accounts can share one email address. 
    # + subscriber - Filter for accounts with or without a subscription in the `active`, `canceled`, or `future` state. 
    # + pastDue - Filter for accounts with an invoice in the `past_due` state. 
    # + return - A list of the site's accounts. 
    remote isolated function listAccounts(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? email = (), boolean? subscriber = (), string? pastDue = ()) returns AccountList|error {
        string resourcePath = string `/accounts`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "email": email, "subscriber": subscriber, "past_due": pastDue};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AccountList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account
    #
    # + return - An account. 
    remote isolated function createAccount(AccountCreate payload) returns Account|error {
        string resourcePath = string `/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account. 
    remote isolated function getAccount(string accountId) returns Account|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account. 
    remote isolated function updateAccount(string accountId, AccountUpdate payload) returns Account|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deactivate an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account. 
    remote isolated function deactivateAccount(string accountId) returns Account|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        Account response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Fetch an account's acquisition data
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account's acquisition data. 
    remote isolated function getAccountAcquisition(string accountId) returns AccountAcquisition|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/acquisition`;
        AccountAcquisition response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account's acquisition data
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account's updated acquisition data. 
    remote isolated function updateAccountAcquisition(string accountId, AccountAcquisitionUpdate payload) returns AccountAcquisition|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/acquisition`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountAcquisition response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an account's acquisition data
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Acquisition data was succesfully deleted. 
    remote isolated function removeAccountAcquisition(string accountId) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/acquisition`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Reactivate an inactive account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account. 
    remote isolated function reactivateAccount(string accountId) returns Account|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/reactivate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Account response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Fetch an account's balance and past due status
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account's balance. 
    remote isolated function getAccountBalance(string accountId) returns AccountBalance|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/balance`;
        AccountBalance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch an account's billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - An account's billing information. 
    remote isolated function getBillingInfo(string accountId) returns BillingInfo|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_info`;
        BillingInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set an account's billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Updated billing information. 
    remote isolated function updateBillingInfo(string accountId, BillingInfoCreate payload) returns BillingInfo|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_info`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BillingInfo response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an account's billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Billing information deleted 
    remote isolated function removeBillingInfo(string accountId) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_info`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Verify an account's credit card billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Transaction information from verify. 
    remote isolated function verifyBillingInfo(string accountId, BillingInfoVerify payload) returns Transaction|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_info/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Transaction response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the list of billing information associated with an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the the billing information for an account's 
    remote isolated function listBillingInfos(string accountId, string[]? ids = (), string sort = "created_at", string? beginTime = (), string? endTime = ()) returns BillingInfoList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_infos`;
        map<anydata> queryParam = {"ids": ids, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BillingInfoList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add new billing information on an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Updated billing information. 
    remote isolated function createBillingInfo(string accountId, BillingInfoCreate payload) returns BillingInfo|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_infos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BillingInfo response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a billing info
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + billingInfoId - Billing Info ID. 
    # + return - A billing info. 
    remote isolated function getABillingInfo(string accountId, string billingInfoId) returns BillingInfo|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_infos/${getEncodedUri(billingInfoId)}`;
        BillingInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account's billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + billingInfoId - Billing Info ID. 
    # + return - Updated billing information. 
    remote isolated function updateABillingInfo(string accountId, string billingInfoId, BillingInfoCreate payload) returns BillingInfo|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_infos/${getEncodedUri(billingInfoId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BillingInfo response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an account's billing information
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + billingInfoId - Billing Info ID. 
    # + return - Billing information deleted 
    remote isolated function removeABillingInfo(string accountId, string billingInfoId) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/billing_infos/${getEncodedUri(billingInfoId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Show the coupon redemptions for an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of the the coupon redemptions on an account. 
    remote isolated function listAccountCouponRedemptions(string accountId, string[]? ids = (), string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns CouponRedemptionList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/coupon_redemptions`;
        map<anydata> queryParam = {"ids": ids, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CouponRedemptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Show the coupon redemptions that are active on an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Active coupon redemptions on an account. 
    remote isolated function listActiveCouponRedemptions(string accountId) returns CouponRedemptionList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/coupon_redemptions/active`;
        CouponRedemptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generate an active coupon redemption on an account or subscription
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Returns the new coupon redemption. 
    remote isolated function createCouponRedemption(string accountId, CouponRedemptionCreate payload) returns CouponRedemption|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/coupon_redemptions/active`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CouponRedemption response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the active coupon redemption from an account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Coupon redemption deleted. 
    remote isolated function removeCouponRedemption(string accountId) returns CouponRedemption|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/coupon_redemptions/active`;
        CouponRedemption response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List an account's credit payments
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the account's credit payments. 
    remote isolated function listAccountCreditPayments(string accountId, int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns CreditPaymentList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/credit_payments`;
        map<anydata> queryParam = {"limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CreditPaymentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List an account's invoices
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + 'type - Filter by type when: - `type=charge`, only charge invoices will be returned. - `type=credit`, only credit invoices will be returned. - `type=non-legacy`, only charge and credit invoices will be returned. - `type=legacy`, only legacy invoices will be returned. 
    # + return - A list of the account's invoices. 
    remote isolated function listAccountInvoices(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? 'type = ()) returns InvoiceList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/invoices`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an invoice for pending line items
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Returns the new invoices. 
    remote isolated function createInvoice(string accountId, InvoiceCreate payload) returns InvoiceCollection|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/invoices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceCollection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Preview new invoice for pending line items
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Returns the invoice previews. 
    remote isolated function previewInvoice(string accountId, InvoiceCreate payload) returns InvoiceCollection|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/invoices/preview`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceCollection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List an account's line items
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + original - Filter by original field. 
    # + state - Filter by state field. 
    # + 'type - Filter by type field. 
    # + return - A list of the account's line items. 
    remote isolated function listAccountLineItems(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? original = (), string? state = (), string? 'type = ()) returns LineItemList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/line_items`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "original": original, "state": state, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LineItemList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new line item for the account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Returns the new line item. 
    remote isolated function createLineItem(string accountId, LineItemCreate payload) returns LineItem|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/line_items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LineItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a list of an account's notes
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + return - A list of an account's notes. 
    remote isolated function listAccountNotes(string accountId, string[]? ids = ()) returns AccountNoteList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/notes`;
        map<anydata> queryParam = {"ids": ids};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AccountNoteList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch an account note
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + accountNoteId - Account Note ID. 
    # + return - An account note. 
    remote isolated function getAccountNote(string accountId, string accountNoteId) returns AccountNote|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/notes/${getEncodedUri(accountNoteId)}`;
        AccountNote response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a list of an account's shipping addresses
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of an account's shipping addresses. 
    remote isolated function listShippingAddresses(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns ShippingAddressList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/shipping_addresses`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingAddressList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new shipping address for the account
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + return - Returns the new shipping address. 
    remote isolated function createShippingAddress(string accountId, ShippingAddressCreate payload) returns ShippingAddress|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/shipping_addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingAddress response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch an account's shipping address
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + shippingAddressId - Shipping Address ID. 
    # + return - A shipping address. 
    remote isolated function getShippingAddress(string accountId, string shippingAddressId) returns ShippingAddress|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/shipping_addresses/${getEncodedUri(shippingAddressId)}`;
        ShippingAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account's shipping address
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + shippingAddressId - Shipping Address ID. 
    # + return - The updated shipping address. 
    remote isolated function updateShippingAddress(string accountId, string shippingAddressId, ShippingAddressUpdate payload) returns ShippingAddress|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/shipping_addresses/${getEncodedUri(shippingAddressId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingAddress response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an account's shipping address
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + shippingAddressId - Shipping Address ID. 
    # + return - Shipping address deleted. 
    remote isolated function removeShippingAddress(string accountId, string shippingAddressId) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/shipping_addresses/${getEncodedUri(shippingAddressId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List an account's subscriptions
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. - When `state=active`, `state=canceled`, `state=expired`, or `state=future`, subscriptions with states that match the query and only those subscriptions will be returned. - When `state=in_trial`, only subscriptions that have a trial_started_at date earlier than now and a trial_ends_at date later than now will be returned. - When `state=live`, only subscriptions that are in an active, canceled, or future state or are in trial will be returned. 
    # + return - A list of the account's subscriptions. 
    remote isolated function listAccountSubscriptions(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns SubscriptionList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/subscriptions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List an account's transactions
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + 'type - Filter by type field. The value `payment` will return both `purchase` and `capture` transactions. 
    # + success - Filter by success field. 
    # + return - A list of the account's transactions. 
    remote isolated function listAccountTransactions(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? 'type = (), string? success = ()) returns TransactionList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/transactions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "type": 'type, "success": success};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TransactionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List an account's child accounts
    #
    # + accountId - Account ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-bob`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + email - Filter for accounts with this exact email address. A blank value will return accounts with both `null` and `""` email addresses. Note that multiple accounts can share one email address. 
    # + subscriber - Filter for accounts with or without a subscription in the `active`, `canceled`, or `future` state. 
    # + pastDue - Filter for accounts with an invoice in the `past_due` state. 
    # + return - A list of an account's child accounts. 
    remote isolated function listChildAccounts(string accountId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? email = (), boolean? subscriber = (), string? pastDue = ()) returns AccountList|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/accounts`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "email": email, "subscriber": subscriber, "past_due": pastDue};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AccountList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's account acquisition data
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the site's account acquisition data. 
    remote isolated function listAccountAcquisition(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns AccountAcquisitionList|error {
        string resourcePath = string `/acquisitions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AccountAcquisitionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's coupons
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the site's coupons. 
    remote isolated function listCoupons(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns CouponList|error {
        string resourcePath = string `/coupons`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CouponList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new coupon
    #
    # + return - A new coupon. 
    remote isolated function createCoupon(CouponCreate payload) returns Coupon|error {
        string resourcePath = string `/coupons`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Coupon response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a coupon
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + return - A coupon. 
    remote isolated function getCoupon(string couponId) returns Coupon|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}`;
        Coupon response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an active coupon
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + return - The updated coupon. 
    remote isolated function updateCoupon(string couponId, CouponUpdate payload) returns Coupon|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Coupon response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Expire a coupon
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + return - The expired Coupon 
    remote isolated function deactivateCoupon(string couponId) returns Coupon|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}`;
        Coupon response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Generate unique coupon codes
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + return - A set of parameters that can be passed to the `list_unique_coupon_codes` endpoint to obtain only the newly generated `UniqueCouponCodes`. 
    remote isolated function generateUniqueCouponCodes(string couponId, CouponBulkCreate payload) returns UniqueCouponCodeParams|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}/generate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UniqueCouponCodeParams response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Restore an inactive coupon
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + return - The restored coupon. 
    remote isolated function restoreCoupon(string couponId, CouponUpdate payload) returns Coupon|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}/restore`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Coupon response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List unique coupon codes associated with a bulk coupon
    #
    # + couponId - Coupon ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-10off`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of unique coupon codes that were generated 
    remote isolated function listUniqueCouponCodes(string couponId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns UniqueCouponCodeList|error {
        string resourcePath = string `/coupons/${getEncodedUri(couponId)}/unique_coupon_codes`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UniqueCouponCodeList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's credit payments
    #
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the site's credit payments. 
    remote isolated function listCreditPayments(int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns CreditPaymentList|error {
        string resourcePath = string `/credit_payments`;
        map<anydata> queryParam = {"limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CreditPaymentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a credit payment
    #
    # + creditPaymentId - Credit Payment ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A credit payment. 
    remote isolated function getCreditPayment(string creditPaymentId) returns CreditPayment|error {
        string resourcePath = string `/credit_payments/${getEncodedUri(creditPaymentId)}`;
        CreditPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's custom field definitions
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + relatedType - Filter by related type. 
    # + return - A list of the site's custom field definitions. 
    remote isolated function listCustomFieldDefinitions(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? relatedType = ()) returns CustomFieldDefinitionList|error {
        string resourcePath = string `/custom_field_definitions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "related_type": relatedType};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomFieldDefinitionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch an custom field definition
    #
    # + customFieldDefinitionId - Custom Field Definition ID 
    # + return - An custom field definition. 
    remote isolated function getCustomFieldDefinition(string customFieldDefinitionId) returns CustomFieldDefinition|error {
        string resourcePath = string `/custom_field_definitions/${getEncodedUri(customFieldDefinitionId)}`;
        CustomFieldDefinition response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's items
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of the site's items. 
    remote isolated function listItems(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns ItemList|error {
        string resourcePath = string `/items`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ItemList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new item
    #
    # + return - A new item. 
    remote isolated function createItem(ItemCreate payload) returns Item|error {
        string resourcePath = string `/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Item response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch an item
    #
    # + itemId - Item ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-red`. 
    # + return - An item. 
    remote isolated function getItem(string itemId) returns Item|error {
        string resourcePath = string `/items/${getEncodedUri(itemId)}`;
        Item response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an active item
    #
    # + itemId - Item ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-red`. 
    # + return - The updated item. 
    remote isolated function updateItem(string itemId, ItemUpdate payload) returns Item|error {
        string resourcePath = string `/items/${getEncodedUri(itemId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Item response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deactivate an item
    #
    # + itemId - Item ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-red`. 
    # + return - An item. 
    remote isolated function deactivateItem(string itemId) returns Item|error {
        string resourcePath = string `/items/${getEncodedUri(itemId)}`;
        Item response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Reactivate an inactive item
    #
    # + itemId - Item ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-red`. 
    # + return - An item. 
    remote isolated function reactivateItem(string itemId) returns Item|error {
        string resourcePath = string `/items/${getEncodedUri(itemId)}/reactivate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Item response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # List a site's measured units
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of the site's measured units. 
    remote isolated function listMeasuredUnit(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns MeasuredUnitList|error {
        string resourcePath = string `/measured_units`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MeasuredUnitList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new measured unit
    #
    # + return - A new measured unit. 
    remote isolated function createMeasuredUnit(MeasuredUnitCreate payload) returns MeasuredUnit|error {
        string resourcePath = string `/measured_units`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MeasuredUnit response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a measured unit
    #
    # + measuredUnitId - Measured unit ID or name. For ID no prefix is used e.g. `e28zov4fw0v2`. For name use prefix `name-`, e.g. `name-Storage`. 
    # + return - An item. 
    remote isolated function getMeasuredUnit(string measuredUnitId) returns MeasuredUnit|error {
        string resourcePath = string `/measured_units/${getEncodedUri(measuredUnitId)}`;
        MeasuredUnit response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a measured unit
    #
    # + measuredUnitId - Measured unit ID or name. For ID no prefix is used e.g. `e28zov4fw0v2`. For name use prefix `name-`, e.g. `name-Storage`. 
    # + return - The updated measured_unit. 
    remote isolated function updateMeasuredUnit(string measuredUnitId, MeasuredUnitUpdate payload) returns MeasuredUnit|error {
        string resourcePath = string `/measured_units/${getEncodedUri(measuredUnitId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MeasuredUnit response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove a measured unit
    #
    # + measuredUnitId - Measured unit ID or name. For ID no prefix is used e.g. `e28zov4fw0v2`. For name use prefix `name-`, e.g. `name-Storage`. 
    # + return - A measured unit. 
    remote isolated function removeMeasuredUnit(string measuredUnitId) returns MeasuredUnit|error {
        string resourcePath = string `/measured_units/${getEncodedUri(measuredUnitId)}`;
        MeasuredUnit response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a site's invoices
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + 'type - Filter by type when: - `type=charge`, only charge invoices will be returned. - `type=credit`, only credit invoices will be returned. - `type=non-legacy`, only charge and credit invoices will be returned. - `type=legacy`, only legacy invoices will be returned. 
    # + return - A list of the site's invoices. 
    remote isolated function listInvoices(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? 'type = ()) returns InvoiceList|error {
        string resourcePath = string `/invoices`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch an invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - An invoice. 
    remote isolated function getInvoice(string invoiceId) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}`;
        Invoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - An invoice. 
    remote isolated function updateInvoice(string invoiceId, InvoiceUpdate payload) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Invoice response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Fetch an invoice as a PDF
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - An invoice as a PDF. 
    remote isolated function getInvoicePdf(string invoiceId) returns BinaryFile|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}.pdf`;
        BinaryFile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Collect a pending or past due, automatic invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The updated invoice. 
    remote isolated function collectInvoice(string invoiceId, InvoiceCollect payload) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/collect`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Invoice response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Mark an open invoice as failed
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The updated invoice. 
    remote isolated function markInvoiceFailed(string invoiceId) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/mark_failed`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Invoice response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Mark an open invoice as successful
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The updated invoice. 
    remote isolated function markInvoiceSuccessful(string invoiceId) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/mark_successful`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Invoice response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Reopen a closed, manual invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The updated invoice. 
    remote isolated function reopenInvoice(string invoiceId) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/reopen`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Invoice response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Void a credit invoice.
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The updated invoice. 
    remote isolated function voidInvoice(string invoiceId) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/void`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Invoice response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Record an external payment for a manual invoices.
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - The recorded transaction. 
    remote isolated function recordExternalTransaction(string invoiceId, ExternalTransaction payload) returns Transaction|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/transactions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Transaction response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List an invoice's line items
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + original - Filter by original field. 
    # + state - Filter by state field. 
    # + 'type - Filter by type field. 
    # + return - A list of the invoice's line items. 
    remote isolated function listInvoiceLineItems(string invoiceId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? original = (), string? state = (), string? 'type = ()) returns LineItemList|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/line_items`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "original": original, "state": state, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LineItemList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Show the coupon redemptions applied to an invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the the coupon redemptions associated with the invoice. 
    remote isolated function listInvoiceCouponRedemptions(string invoiceId, string[]? ids = (), string sort = "created_at", string? beginTime = (), string? endTime = ()) returns CouponRedemptionList|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/coupon_redemptions`;
        map<anydata> queryParam = {"ids": ids, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CouponRedemptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List an invoice's related credit or charge invoices
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - A list of the credit or charge invoices associated with the invoice. 
    remote isolated function listRelatedInvoices(string invoiceId) returns InvoiceList|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/related_invoices`;
        InvoiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Refund an invoice
    #
    # + invoiceId - Invoice ID or number. For ID no prefix is used e.g. `e28zov4fw0v2`. For number use prefix `number-`, e.g. `number-1000`. 
    # + return - Returns the new credit invoice. 
    remote isolated function refundInvoice(string invoiceId, InvoiceRefund payload) returns Invoice|error {
        string resourcePath = string `/invoices/${getEncodedUri(invoiceId)}/refund`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List a site's line items
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + original - Filter by original field. 
    # + state - Filter by state field. 
    # + 'type - Filter by type field. 
    # + return - A list of the site's line items. 
    remote isolated function listLineItems(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? original = (), string? state = (), string? 'type = ()) returns LineItemList|error {
        string resourcePath = string `/line_items`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "original": original, "state": state, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LineItemList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a line item
    #
    # + lineItemId - Line Item ID. 
    # + return - A line item. 
    remote isolated function getLineItem(string lineItemId) returns LineItem|error {
        string resourcePath = string `/line_items/${getEncodedUri(lineItemId)}`;
        LineItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an uninvoiced line item
    #
    # + lineItemId - Line Item ID. 
    # + return - Line item deleted. 
    remote isolated function removeLineItem(string lineItemId) returns http:Response|error {
        string resourcePath = string `/line_items/${getEncodedUri(lineItemId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a site's plans
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of plans. 
    remote isolated function listPlans(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns PlanList|error {
        string resourcePath = string `/plans`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PlanList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a plan
    #
    # + return - A plan. 
    remote isolated function createPlan(PlanCreate payload) returns Plan|error {
        string resourcePath = string `/plans`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Plan response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a plan
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - A plan. 
    remote isolated function getPlan(string planId) returns Plan|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}`;
        Plan response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a plan
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - A plan. 
    remote isolated function updatePlan(string planId, PlanUpdate payload) returns Plan|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Plan response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove a plan
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - Plan deleted 
    remote isolated function removePlan(string planId) returns Plan|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}`;
        Plan response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a plan's add-ons
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of add-ons. 
    remote isolated function listPlanAddOns(string planId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns AddOnList|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}/add_ons`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AddOnList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an add-on
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - An add-on. 
    remote isolated function createPlanAddOn(string planId, AddOnCreate payload) returns AddOn|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}/add_ons`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddOn response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a plan's add-on
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - An add-on. 
    remote isolated function getPlanAddOn(string planId, string addOnId) returns AddOn|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}/add_ons/${getEncodedUri(addOnId)}`;
        AddOn response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an add-on
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - An add-on. 
    remote isolated function updatePlanAddOn(string planId, string addOnId, AddOnUpdate payload) returns AddOn|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}/add_ons/${getEncodedUri(addOnId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddOn response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an add-on
    #
    # + planId - Plan ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - Add-on deleted 
    remote isolated function removePlanAddOn(string planId, string addOnId) returns AddOn|error {
        string resourcePath = string `/plans/${getEncodedUri(planId)}/add_ons/${getEncodedUri(addOnId)}`;
        AddOn response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a site's add-ons
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. 
    # + return - A list of add-ons. 
    remote isolated function listAddOns(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns AddOnList|error {
        string resourcePath = string `/add_ons`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AddOnList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch an add-on
    #
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - An add-on. 
    remote isolated function getAddOn(string addOnId) returns AddOn|error {
        string resourcePath = string `/add_ons/${getEncodedUri(addOnId)}`;
        AddOn response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a site's shipping methods
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the site's shipping methods. 
    remote isolated function listShippingMethods(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = ()) returns ShippingMethodList|error {
        string resourcePath = string `/shipping_methods`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new shipping method
    #
    # + return - A new shipping method. 
    remote isolated function createShippingMethod(ShippingMethodCreate payload) returns ShippingMethod|error {
        string resourcePath = string `/shipping_methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a shipping method
    #
    # + shippingMethodId - Shipping Method ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-usps_2-day`. 
    # + return - A shipping method. 
    remote isolated function getShippingMethod(string shippingMethodId) returns ShippingMethod|error {
        string resourcePath = string `/shipping_methods/${getEncodedUri(shippingMethodId)}`;
        ShippingMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an active Shipping Method
    #
    # + shippingMethodId - Shipping Method ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-usps_2-day`. 
    # + return - The updated shipping method. 
    remote isolated function updateShippingMethod(string shippingMethodId, ShippingMethodUpdate payload) returns ShippingMethod|error {
        string resourcePath = string `/shipping_methods/${getEncodedUri(shippingMethodId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingMethod response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deactivate a shipping method
    #
    # + shippingMethodId - Shipping Method ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-usps_2-day`. 
    # + return - A shipping method. 
    remote isolated function deactivateShippingMethod(string shippingMethodId) returns ShippingMethod|error {
        string resourcePath = string `/shipping_methods/${getEncodedUri(shippingMethodId)}`;
        ShippingMethod response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a site's subscriptions
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + state - Filter by state. - When `state=active`, `state=canceled`, `state=expired`, or `state=future`, subscriptions with states that match the query and only those subscriptions will be returned. - When `state=in_trial`, only subscriptions that have a trial_started_at date earlier than now and a trial_ends_at date later than now will be returned. - When `state=live`, only subscriptions that are in an active, canceled, or future state or are in trial will be returned. 
    # + return - A list of the site's subscriptions. 
    remote isolated function listSubscriptions(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? state = ()) returns SubscriptionList|error {
        string resourcePath = string `/subscriptions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "state": state};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new subscription
    #
    # + return - A subscription. 
    remote isolated function createSubscription(SubscriptionCreate payload) returns Subscription|error {
        string resourcePath = string `/subscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription. 
    remote isolated function getSubscription(string subscriptionId) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription. 
    remote isolated function updateSubscription(string subscriptionId, SubscriptionUpdate payload) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Terminate a subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + refund - The type of refund to perform: * `full` - Performs a full refund of the last invoice for the current subscription term. * `partial` - Prorates a refund based on the amount of time remaining in the current bill cycle. * `none` - Terminates the subscription without a refund. In the event that the most recent invoice is a $0 invoice paid entirely by credit, Recurly will apply the credit back to the customer’s account. You may also terminate a subscription with no refund and then manually refund specific invoices. 
    # + charge - Applicable only if the subscription has usage based add-ons and unbilled usage logged for the current billing cycle. If true, current billing cycle unbilled usage is billed on the final invoice. If false, Recurly will create a negative usage record for current billing cycle usage that will zero out the final invoice line items. 
    # + return - An expired subscription. 
    remote isolated function terminateSubscription(string subscriptionId, string refund = "none", boolean charge = true) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<anydata> queryParam = {"refund": refund, "charge": charge};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Subscription response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Cancel a subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A canceled or failed subscription. 
    remote isolated function cancelSubscription(string subscriptionId, SubscriptionCancel payload) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/cancel`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Reactivate a canceled subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - An active subscription. 
    remote isolated function reactivateSubscription(string subscriptionId) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/reactivate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Subscription response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Pause subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription. 
    remote isolated function pauseSubscription(string subscriptionId, SubscriptionPause payload) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/pause`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Resume subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription. 
    remote isolated function resumeSubscription(string subscriptionId) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resume`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Subscription response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Convert trial subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription. 
    remote isolated function convertTrial(string subscriptionId) returns Subscription|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/convert_trial`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Subscription response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Fetch a preview of a subscription's renewal invoice(s)
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A preview of the subscription's renewal invoice(s). 
    remote isolated function getPreviewRenewal(string subscriptionId) returns InvoiceCollection|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/preview_renewal`;
        InvoiceCollection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a subscription's pending change
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription's pending change. 
    remote isolated function getSubscriptionChange(string subscriptionId) returns SubscriptionChange|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/change`;
        SubscriptionChange response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new subscription change
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription change. 
    remote isolated function createSubscriptionChange(string subscriptionId, SubscriptionChangeCreate payload) returns SubscriptionChange|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/change`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriptionChange response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the pending subscription change
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - Subscription change was deleted. 
    remote isolated function removeSubscriptionChange(string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/change`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Preview a new subscription change
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A subscription change. 
    remote isolated function previewSubscriptionChange(string subscriptionId, SubscriptionChangeCreate payload) returns SubscriptionChange|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/change/preview`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriptionChange response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List a subscription's invoices
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + 'type - Filter by type when: - `type=charge`, only charge invoices will be returned. - `type=credit`, only credit invoices will be returned. - `type=non-legacy`, only charge and credit invoices will be returned. - `type=legacy`, only legacy invoices will be returned. 
    # + return - A list of the subscription's invoices. 
    remote isolated function listSubscriptionInvoices(string subscriptionId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? 'type = ()) returns InvoiceList|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/invoices`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a subscription's line items
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + original - Filter by original field. 
    # + state - Filter by state field. 
    # + 'type - Filter by type field. 
    # + return - A list of the subscription's line items. 
    remote isolated function listSubscriptionLineItems(string subscriptionId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? original = (), string? state = (), string? 'type = ()) returns LineItemList|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/line_items`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "original": original, "state": state, "type": 'type};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LineItemList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Show the coupon redemptions for a subscription
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + return - A list of the the coupon redemptions on a subscription. 
    remote isolated function listSubscriptionCouponRedemptions(string subscriptionId, string[]? ids = (), string sort = "created_at", string? beginTime = (), string? endTime = ()) returns CouponRedemptionList|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/coupon_redemptions`;
        map<anydata> queryParam = {"ids": ids, "sort": sort, "begin_time": beginTime, "end_time": endTime};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CouponRedemptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a subscription add-on's usage records
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `usage_timestamp` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=usage_timestamp` or `sort=recorded_timestamp`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=usage_timestamp` or `sort=recorded_timestamp`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + billingStatus - Filter by usage record's billing status 
    # + return - A list of the subscription add-on's usage records. 
    remote isolated function listUsage(string subscriptionId, string addOnId, string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "usage_timestamp", string? beginTime = (), string? endTime = (), string billingStatus = "unbilled") returns UsageList|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/add_ons/${getEncodedUri(addOnId)}/usage`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "billing_status": billingStatus};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UsageList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Log a usage record on this subscription add-on
    #
    # + subscriptionId - Subscription ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + addOnId - Add-on ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-gold`. 
    # + return - The created usage record. 
    remote isolated function createUsage(string subscriptionId, string addOnId, UsageCreate payload) returns Usage|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/add_ons/${getEncodedUri(addOnId)}/usage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Usage response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a usage record
    #
    # + usageId - Usage Record ID. 
    # + return - The usage record. 
    remote isolated function getUsage(string usageId) returns Usage|error {
        string resourcePath = string `/usage/${getEncodedUri(usageId)}`;
        Usage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a usage record
    #
    # + usageId - Usage Record ID. 
    # + return - The updated usage record. 
    remote isolated function updateUsage(string usageId, UsageCreate payload) returns Usage|error {
        string resourcePath = string `/usage/${getEncodedUri(usageId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Usage response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a usage record.
    #
    # + usageId - Usage Record ID. 
    # + return - Usage was successfully deleted. 
    remote isolated function removeUsage(string usageId) returns http:Response|error {
        string resourcePath = string `/usage/${getEncodedUri(usageId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List a site's transactions
    #
    # + ids - Filter results by their IDs. Up to 200 IDs can be passed at once using commas as separators, e.g. `ids=h1at4d57xlmy,gyqgg0d3v9n1,jrsm5b4yefg6`. **Important notes:** * The `ids` parameter cannot be used with any other ordering or filtering   parameters (`limit`, `order`, `sort`, `begin_time`, `end_time`, etc) * Invalid or unknown IDs will be ignored, so you should check that the   results correspond to your request. * Records are returned in an arbitrary order. Since results are all   returned at once you can sort the records yourself. 
    # + 'limit - Limit number of records 1-200. 
    # + 'order - Sort order. 
    # + sort - Sort field. You *really* only want to sort by `updated_at` in ascending order. In descending order updated records will move behind the cursor and could prevent some records from being returned. 
    # + beginTime - Inclusively filter by begin_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + endTime - Inclusively filter by end_time when `sort=created_at` or `sort=updated_at`. **Note:** this value is an ISO8601 timestamp. A partial timestamp that does not include a time zone will default to UTC. 
    # + 'type - Filter by type field. The value `payment` will return both `purchase` and `capture` transactions. 
    # + success - Filter by success field. 
    # + return - A list of the site's transactions. 
    remote isolated function listTransactions(string[]? ids = (), int 'limit = 20, string 'order = "desc", string sort = "created_at", string? beginTime = (), string? endTime = (), string? 'type = (), string? success = ()) returns TransactionList|error {
        string resourcePath = string `/transactions`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "order": 'order, "sort": sort, "begin_time": beginTime, "end_time": endTime, "type": 'type, "success": success};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TransactionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a transaction
    #
    # + transactionId - Transaction ID or UUID. For ID no prefix is used e.g. `e28zov4fw0v2`. For UUID use prefix `uuid-`, e.g. `uuid-123457890`. 
    # + return - A transaction. 
    remote isolated function getTransaction(string transactionId) returns Transaction|error {
        string resourcePath = string `/transactions/${getEncodedUri(transactionId)}`;
        Transaction response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch a unique coupon code
    #
    # + uniqueCouponCodeId - Unique Coupon Code ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-abc-8dh2-def`. 
    # + return - A unique coupon code. 
    remote isolated function getUniqueCouponCode(string uniqueCouponCodeId) returns UniqueCouponCode|error {
        string resourcePath = string `/unique_coupon_codes/${getEncodedUri(uniqueCouponCodeId)}`;
        UniqueCouponCode response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deactivate a unique coupon code
    #
    # + uniqueCouponCodeId - Unique Coupon Code ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-abc-8dh2-def`. 
    # + return - A unique coupon code. 
    remote isolated function deactivateUniqueCouponCode(string uniqueCouponCodeId) returns UniqueCouponCode|error {
        string resourcePath = string `/unique_coupon_codes/${getEncodedUri(uniqueCouponCodeId)}`;
        UniqueCouponCode response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Restore a unique coupon code
    #
    # + uniqueCouponCodeId - Unique Coupon Code ID or code. For ID no prefix is used e.g. `e28zov4fw0v2`. For code use prefix `code-`, e.g. `code-abc-8dh2-def`. 
    # + return - A unique coupon code. 
    remote isolated function reactivateUniqueCouponCode(string uniqueCouponCodeId) returns UniqueCouponCode|error {
        string resourcePath = string `/unique_coupon_codes/${getEncodedUri(uniqueCouponCodeId)}/restore`;
        http:Request request = new;
        //TODO: Update the request as needed;
        UniqueCouponCode response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Create a new purchase
    #
    # + return - Returns the new invoices 
    remote isolated function createPurchase(PurchaseCreate payload) returns InvoiceCollection|error {
        string resourcePath = string `/purchases`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceCollection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Preview a new purchase
    #
    # + return - Returns preview of the new invoices 
    remote isolated function previewPurchase(PurchaseCreate payload) returns InvoiceCollection|error {
        string resourcePath = string `/purchases/preview`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceCollection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List the dates that have an available export to download.
    #
    # + return - Returns a list of dates. 
    remote isolated function getExportDates() returns ExportDates|error {
        string resourcePath = string `/export_dates`;
        ExportDates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List of the export files that are available to download.
    #
    # + exportDate - Date for which to get a list of available automated export files. Date must be in YYYY-MM-DD format. 
    # + return - Returns a list of export files to download. 
    remote isolated function getExportFiles(string exportDate) returns ExportFiles|error {
        string resourcePath = string `/export_dates/${getEncodedUri(exportDate)}/export_files`;
        ExportFiles response = check self.clientEp->get(resourcePath);
        return response;
    }
}
