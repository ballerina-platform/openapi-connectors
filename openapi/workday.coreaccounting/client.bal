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

# This is a generated connector for [WorkDay Connect Service REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The Core Accounting service enables applications to access and configure common financial components that you use to manage your financial accounting.
@display {label: "Workday coreAccounting", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Retrieves the details on all currencies in your tenant.
    #
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAllCurrencies() returns InlineResponse200|error {
        string resourcePath = string `/currencies`;
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the details of a specified currency.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCurrencyByID(string id) returns CurrencySummary|error {
        string resourcePath = string `/currencies/${getEncodedUri(id)}`;
        CurrencySummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the ledger account and resulting worktags of a specified account posting rule.
    #
    # + accountPostingRuleSet - (Required) The Workday ID or reference ID for the account posting rule set. The reference ID uses the accountPostingRuleSet=sampleRefIdType=value format. Example: accountPostingRuleSet=Account_Posting_Rule_Set_ID=ACCOUNT_POSTING_RULE_SET-1 
    # + accountPostingRuleType - (Required) The Workday ID or reference ID for the account posting rule type. The reference ID uses the accountPostingRuleType=sampleRefIdType=value format. Example: accountPostingRuleType=Account_Posting_Rule_Type_ID=CASH 
    # + dimensionValue - The Workday IDs or reference IDs for the dimension value of the account posting rule condition. The reference ID uses the dimensionValue=sampleRefIdType=value format format. Example: dimensionValue=Fund_ID=F03.1.3. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getLedgerAccountByPostingRule(string? accountPostingRuleSet = (), string? accountPostingRuleType = (), string[]? dimensionValue = ()) returns InlineResponse2001|error {
        string resourcePath = string `/evaluateAccountPostingRules`;
        map<anydata> queryParam = {"accountPostingRuleSet": accountPostingRuleSet, "accountPostingRuleType": accountPostingRuleType, "dimensionValue": dimensionValue};
        map<Encoding> queryParamEncoding = {"dimensionValue": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
