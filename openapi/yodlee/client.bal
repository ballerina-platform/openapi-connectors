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

# This is a generated connector for [Yodlee Core API v1.1.0](https://www.yodlee.com/) OpenAPI specification
# Envestnet | Yodlee API (“Yodlee API”) is a flexible RESTful API that allows developers to access personal financial data from the Envestnet | Yodlee financial data platform that can be used to develop various financial management applications.
# Yodlee API 1.1 is designed to work with FastLink 3.0.
@display {label: "Yodlee", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Yodlee account](https://www.yodlee.com/) and obtain OAuth tokens following [this guide](https://developer.yodlee.com/docs/api/1.1/getting-started-with-cc).
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
    # Get Accounts
    #
    # + accountId - Comma separated accountIds. 
    # + container - bank/creditCard/investment/insurance/loan/reward/realEstate/otherAssets/otherLiabilities 
    # + include - profile, holder, fullAccountNumber, fullAccountNumberList, paymentProfile, autoRefresh<br><b>Note:</b>fullAccountNumber is deprecated and is replaced with fullAccountNumberList in include parameter and response. 
    # + providerAccountId - Comma separated providerAccountIds. 
    # + requestId - The unique identifier that returns contextual data 
    # + status - ACTIVE,INACTIVE,TO_BE_CLOSED,CLOSED 
    # + return - OK 
    remote isolated function getAllAccounts(string? accountId = (), string? container = (), string? include = (), string? providerAccountId = (), string? requestId = (), string? status = ()) returns AccountResponse|error {
        string resourcePath = string `/accounts`;
        map<anydata> queryParam = {"accountId": accountId, "container": container, "include": include, "providerAccountId": providerAccountId, "requestId": requestId, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add Manual Account
    #
    # + payload - accountParam 
    # + return - OK 
    remote isolated function createManualAccount(CreateAccountRequest payload) returns CreatedAccountResponse|error {
        string resourcePath = string `/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedAccountResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Evaluate Address
    #
    # + payload - addressParam 
    # + return - OK 
    remote isolated function evaluateAddress(EvaluateAddressRequest payload) returns EvaluateAddressResponse|error {
        string resourcePath = string `/accounts/evaluateAddress`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EvaluateAddressResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Historical Balances
    #
    # + accountId - accountId 
    # + fromDate - from date for balance retrieval (YYYY-MM-DD) 
    # + includeCF - Consider carry forward logic for missing balances 
    # + interval - D-daily, W-weekly or M-monthly 
    # + skip - skip (Min 0) 
    # + toDate - toDate for balance retrieval (YYYY-MM-DD) 
    # + top - top (Max 500) 
    # + return - OK 
    remote isolated function getHistoricalBalances(string? accountId = (), string? fromDate = (), boolean? includeCF = (), string? interval = (), int? skip = (), string? toDate = (), int? top = ()) returns AccountHistoricalBalancesResponse|error {
        string resourcePath = string `/accounts/historicalBalances`;
        map<anydata> queryParam = {"accountId": accountId, "fromDate": fromDate, "includeCF": includeCF, "interval": interval, "skip": skip, "toDate": toDate, "top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountHistoricalBalancesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Account Details
    #
    # + accountId - accountId 
    # + include - profile, holder, fullAccountNumber, fullAccountNumberList, paymentProfile, autoRefresh<br><b>Note:</b>fullAccountNumber is deprecated and is replaced with fullAccountNumberList in include parameter and response. 
    # + return - OK 
    remote isolated function getAccount(int accountId, string? include = ()) returns AccountResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Account
    #
    # + accountId - accountId 
    # + payload - accountRequest 
    # + return - OK 
    remote isolated function updateAccount(int accountId, UpdateAccountRequest payload) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete Account
    #
    # + accountId - accountId 
    # + return - OK 
    remote isolated function deleteAccount(int accountId) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get API Keys
    #
    # + return - OK 
    remote isolated function getApiKeys() returns ApiKeyResponse|error {
        string resourcePath = string `/auth/apiKey`;
        ApiKeyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generate API Key
    #
    # + payload - apiKeyRequest 
    # + return - OK 
    remote isolated function generateApiKey(ApiKeyRequest payload) returns ApiKeyResponse|error {
        string resourcePath = string `/auth/apiKey`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete API Key
    #
    # + 'key - key 
    # + return - OK 
    remote isolated function deleteApiKey(string 'key) returns http:Response|error {
        string resourcePath = string `/auth/apiKey/${getEncodedUri('key)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Generate Access Token
    #
    # + return - OK 
    remote isolated function generateAccessToken() returns ClientCredentialTokenResponse|error {
        string resourcePath = string `/auth/token`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClientCredentialTokenResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete Token
    #
    # + return - No Content 
    remote isolated function deleteToken() returns http:Response|error {
        string resourcePath = string `/auth/token`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Subscribed Events
    #
    # + eventName - eventName 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getSubscribedEvents(string? eventName = ()) returns CobrandNotificationResponse|error {
        string resourcePath = string `/cobrand/config/notifications/events`;
        map<anydata> queryParam = {"eventName": eventName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CobrandNotificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Subscription
    #
    # + eventName - eventName 
    # + payload - eventRequest 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function updateSubscribedEvent(string eventName, UpdateCobrandNotificationEventRequest payload) returns http:Response|error {
        string resourcePath = string `/cobrand/config/notifications/events/${getEncodedUri(eventName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Subscribe Event
    #
    # + eventName - eventName 
    # + payload - eventRequest 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function createSubscriptionEvent(string eventName, CreateCobrandNotificationEventRequest payload) returns http:Response|error {
        string resourcePath = string `/cobrand/config/notifications/events/${getEncodedUri(eventName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Subscription
    #
    # + eventName - eventName 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteSubscribedEvent(string eventName) returns http:Response|error {
        string resourcePath = string `/cobrand/config/notifications/events/${getEncodedUri(eventName)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Cobrand Login
    #
    # + payload - cobrandLoginRequest 
    # + return - OK 
    remote isolated function cobrandLogin(CobrandLoginRequest payload) returns CobrandLoginResponse|error {
        string resourcePath = string `/cobrand/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CobrandLoginResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Cobrand Logout
    #
    # + return - Logout successful 
    remote isolated function cobrandLogout() returns http:Response|error {
        string resourcePath = string `/cobrand/logout`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get Public Key
    #
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getPublicKey() returns CobrandPublicKeyResponse|error {
        string resourcePath = string `/cobrand/publicKey`;
        CobrandPublicKeyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Subscribed Notification Events
    #
    # + eventName - eventName 
    # + return - OK 
    remote isolated function getSubscribedNotificationEvents(string? eventName = ()) returns ConfigsNotificationResponse|error {
        string resourcePath = string `/configs/notifications/events`;
        map<anydata> queryParam = {"eventName": eventName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConfigsNotificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Notification Subscription
    #
    # + eventName - eventName 
    # + payload - eventRequest 
    # + return - OK 
    remote isolated function updateSubscribedNotificationEvent(string eventName, UpdateConfigsNotificationEventRequest payload) returns http:Response|error {
        string resourcePath = string `/configs/notifications/events/${getEncodedUri(eventName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Subscribe For Notification Event
    #
    # + eventName - eventName 
    # + payload - eventRequest 
    # + return - OK 
    remote isolated function createSubscriptionNotificationEvent(string eventName, CreateConfigsNotificationEventRequest payload) returns http:Response|error {
        string resourcePath = string `/configs/notifications/events/${getEncodedUri(eventName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete Notification Subscription
    #
    # + eventName - eventName 
    # + return - OK 
    remote isolated function deleteSubscribedNotificationEvent(string eventName) returns http:Response|error {
        string resourcePath = string `/configs/notifications/events/${getEncodedUri(eventName)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Public Key
    #
    # + return - OK 
    remote isolated function getPublicEncryptionKey() returns ConfigsPublicKeyResponse|error {
        string resourcePath = string `/configs/publicKey`;
        ConfigsPublicKeyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Events
    #
    # + eventName - Event Name 
    # + fromDate - From DateTime (YYYY-MM-DDThh:mm:ssZ) 
    # + toDate - To DateTime (YYYY-MM-DDThh:mm:ssZ) 
    # + return - OK 
    remote isolated function getDataExtractsEvents(string eventName, string fromDate, string toDate) returns DataExtractsEventResponse|error {
        string resourcePath = string `/dataExtracts/events`;
        map<anydata> queryParam = {"eventName": eventName, "fromDate": fromDate, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataExtractsEventResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get userData
    #
    # + fromDate - From DateTime (YYYY-MM-DDThh:mm:ssZ) 
    # + loginName - Login Name 
    # + toDate - To DateTime (YYYY-MM-DDThh:mm:ssZ) 
    # + return - OK 
    remote isolated function getDataExtractsUserData(string fromDate, string loginName, string toDate) returns DataExtractsUserDataResponse|error {
        string resourcePath = string `/dataExtracts/userData`;
        map<anydata> queryParam = {"fromDate": fromDate, "loginName": loginName, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataExtractsUserDataResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Holding Summary
    #
    # + accountIds - Comma separated accountIds 
    # + classificationType - e.g. Country, Sector, etc. 
    # + include - details 
    # + return - OK 
    remote isolated function getHoldingSummary(string? accountIds = (), string? classificationType = (), string? include = ()) returns DerivedHoldingSummaryResponse|error {
        string resourcePath = string `/derived/holdingSummary`;
        map<anydata> queryParam = {"accountIds": accountIds, "classificationType": classificationType, "include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DerivedHoldingSummaryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Networth Summary
    #
    # + accountIds - comma separated accountIds 
    # + container - bank/creditCard/investment/insurance/loan/realEstate/otherAssets/otherLiabilities 
    # + fromDate - from date for balance retrieval (YYYY-MM-DD) 
    # + include - details 
    # + interval - D-daily, W-weekly or M-monthly 
    # + skip - skip (Min 0) 
    # + toDate - toDate for balance retrieval (YYYY-MM-DD) 
    # + top - top (Max 500) 
    # + return - OK 
    remote isolated function getNetworth(string? accountIds = (), string? container = (), string? fromDate = (), string? include = (), string? interval = (), int? skip = (), string? toDate = (), int? top = ()) returns DerivedNetworthResponse|error {
        string resourcePath = string `/derived/networth`;
        map<anydata> queryParam = {"accountIds": accountIds, "container": container, "fromDate": fromDate, "include": include, "interval": interval, "skip": skip, "toDate": toDate, "top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DerivedNetworthResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Transaction Summary
    #
    # + accountId - comma separated account Ids 
    # + categoryId - comma separated categoryIds 
    # + categoryType - INCOME, EXPENSE, TRANSFER, UNCATEGORIZE or DEFERRED_COMPENSATION 
    # + fromDate - YYYY-MM-DD format 
    # + groupBy - CATEGORY_TYPE, HIGH_LEVEL_CATEGORY or CATEGORY 
    # + include - details 
    # + includeUserCategory - TRUE/FALSE 
    # + interval - D-daily, W-weekly, M-mothly or Y-yearly 
    # + toDate - YYYY-MM-DD format 
    # + return - OK 
    remote isolated function getTransactionSummary(string groupBy, string? accountId = (), string? categoryId = (), string? categoryType = (), string? fromDate = (), string? include = (), boolean? includeUserCategory = (), string? interval = (), string? toDate = ()) returns DerivedTransactionSummaryResponse|error {
        string resourcePath = string `/derived/transactionSummary`;
        map<anydata> queryParam = {"accountId": accountId, "categoryId": categoryId, "categoryType": categoryType, "fromDate": fromDate, "groupBy": groupBy, "include": include, "includeUserCategory": includeUserCategory, "interval": interval, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DerivedTransactionSummaryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Documents
    #
    # + keyword - The string used to search a document by its name. 
    # + accountId - The unique identifier of an account. Retrieve documents for a given accountId. 
    # + docType - Accepts only one of the following valid document types: STMT, TAX, and EBILL. 
    # + fromDate - The date from which documents have to be retrieved. 
    # + toDate - The date to which documents have to be retrieved. 
    # + return - OK 
    remote isolated function getDocuments(string? keyword = (), string? accountId = (), string? docType = (), string? fromDate = (), string? toDate = ()) returns DocumentResponse|error {
        string resourcePath = string `/documents`;
        map<anydata> queryParam = {"Keyword": keyword, "accountId": accountId, "docType": docType, "fromDate": fromDate, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DocumentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Download a Document
    #
    # + documentId - documentId 
    # + return - OK 
    remote isolated function downloadDocument(string documentId) returns DocumentDownloadResponse|error {
        string resourcePath = string `/documents/${getEncodedUri(documentId)}`;
        DocumentDownloadResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Document
    #
    # + documentId - documentId 
    # + return - OK 
    remote isolated function deleteDocument(string documentId) returns http:Response|error {
        string resourcePath = string `/documents/${getEncodedUri(documentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Holdings
    #
    # + accountId - Comma separated accountId 
    # + assetclassificationClassificationtype - e.g. Country, Sector, etc. 
    # + classificationValue - e.g. US 
    # + include - assetClassification 
    # + providerAccountId - providerAccountId 
    # + return - OK 
    remote isolated function getHoldings(string? accountId = (), string? assetclassificationClassificationtype = (), string? classificationValue = (), string? include = (), string? providerAccountId = ()) returns HoldingResponse|error {
        string resourcePath = string `/holdings`;
        map<anydata> queryParam = {"accountId": accountId, "assetClassification.classificationType": assetclassificationClassificationtype, "classificationValue": classificationValue, "include": include, "providerAccountId": providerAccountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HoldingResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Asset Classification List
    #
    # + return - OK 
    remote isolated function getAssetClassificationList() returns HoldingAssetClassificationListResponse|error {
        string resourcePath = string `/holdings/assetClassificationList`;
        HoldingAssetClassificationListResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Holding Type List
    #
    # + return - OK 
    remote isolated function getHoldingTypeList() returns HoldingTypeListResponse|error {
        string resourcePath = string `/holdings/holdingTypeList`;
        HoldingTypeListResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Security Details
    #
    # + holdingId - Comma separated holdingId 
    # + return - OK 
    remote isolated function getSecurities(string? holdingId = ()) returns HoldingSecuritiesResponse|error {
        string resourcePath = string `/holdings/securities`;
        map<anydata> queryParam = {"holdingId": holdingId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HoldingSecuritiesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Provider Accounts
    #
    # + include - include 
    # + providerIds - Comma separated providerIds. 
    # + return - OK 
    remote isolated function getAllProviderAccounts(string? include = (), string? providerIds = ()) returns ProviderAccountResponse|error {
        string resourcePath = string `/providerAccounts`;
        map<anydata> queryParam = {"include": include, "providerIds": providerIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProviderAccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Account
    #
    # + providerAccountIds - comma separated providerAccountIds 
    # + payload - loginForm or field entity 
    # + return - OK 
    remote isolated function editCredentialsOrRefreshProviderAccount(string providerAccountIds, ProviderAccountRequest payload) returns UpdatedProviderAccountResponse|error {
        string resourcePath = string `/providerAccounts`;
        map<anydata> queryParam = {"providerAccountIds": providerAccountIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdatedProviderAccountResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get User Profile Details
    #
    # + providerAccountId - Comma separated providerAccountIds. 
    # + return - OK 
    remote isolated function getProviderAccountProfiles(string? providerAccountId = ()) returns ProviderAccountUserProfileResponse|error {
        string resourcePath = string `/providerAccounts/profile`;
        map<anydata> queryParam = {"providerAccountId": providerAccountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProviderAccountUserProfileResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Provider Account Details
    #
    # + include - include credentials,questions 
    # + providerAccountId - providerAccountId 
    # + requestId - The unique identifier for the request that returns contextual data 
    # + return - OK 
    remote isolated function getProviderAccount(int providerAccountId, string? include = (), string? requestId = ()) returns ProviderAccountDetailResponse|error {
        string resourcePath = string `/providerAccounts/${getEncodedUri(providerAccountId)}`;
        map<anydata> queryParam = {"include": include, "requestId": requestId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProviderAccountDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Provider Account
    #
    # + providerAccountId - providerAccountId 
    # + return - OK 
    remote isolated function deleteProviderAccount(int providerAccountId) returns http:Response|error {
        string resourcePath = string `/providerAccounts/${getEncodedUri(providerAccountId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update Preferences
    #
    # + providerAccountId - providerAccountId 
    # + payload - preferences 
    # + return - OK 
    remote isolated function updatePreferences(int providerAccountId, ProviderAccountPreferencesRequest payload) returns http:Response|error {
        string resourcePath = string `/providerAccounts/${getEncodedUri(providerAccountId)}/preferences`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Providers
    #
    # + capability - CHALLENGE_DEPOSIT_VERIFICATION - capability search is deprecated 
    # + datasetFilter - Expression to filter the providers by dataset(s) or dataset attribute(s). The default value will be the dataset or dataset attributes configured as default for the customer. 
    # + fullAccountNumberFields - Specify to filter the providers with values paymentAccountNumber,unmaskedAccountNumber. 
    # + institutionId - Institution Id for Single site selection 
    # + name - Name in minimum 1 character or routing number. 
    # + priority - Search priority 
    # + providerId - Max 5 Comma seperated Provider Ids 
    # + skip - skip (Min 0) - This is not applicable along with 'name' parameter. 
    # + top - top (Max 500) - This is not applicable along with 'name' parameter. 
    # + return - OK 
    remote isolated function getAllProviders(string? capability = (), string? datasetFilter = (), string? fullAccountNumberFields = (), int? institutionId = (), string? name = (), string? priority = (), string? providerId = (), int? skip = (), int? top = ()) returns ProviderResponse|error {
        string resourcePath = string `/providers`;
        map<anydata> queryParam = {"capability": capability, "dataset$filter": datasetFilter, "fullAccountNumberFields": fullAccountNumberFields, "institutionId": institutionId, "name": name, "priority": priority, "providerId": providerId, "skip": skip, "top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProviderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Providers Count
    #
    # + capability - CHALLENGE_DEPOSIT_VERIFICATION - capability search is deprecated 
    # + datasetFilter - Expression to filter the providers by dataset(s) or dataset attribute(s). The default value will be the dataset or dataset attributes configured as default for the customer. 
    # + fullAccountNumberFields - Specify to filter the providers with values paymentAccountNumber,unmaskedAccountNumber. 
    # + name - Name in minimum 1 character or routing number. 
    # + priority - Search priority 
    # + return - OK 
    remote isolated function getProvidersCount(string? capability = (), string? datasetFilter = (), string? fullAccountNumberFields = (), string? name = (), string? priority = ()) returns ProvidersCountResponse|error {
        string resourcePath = string `/providers/count`;
        map<anydata> queryParam = {"capability": capability, "dataset$filter": datasetFilter, "fullAccountNumberFields": fullAccountNumberFields, "name": name, "priority": priority};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProvidersCountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Provider Details
    #
    # + providerId - providerId 
    # + return - OK 
    remote isolated function getProvider(int providerId) returns ProviderDetailResponse|error {
        string resourcePath = string `/providers/${getEncodedUri(providerId)}`;
        ProviderDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Statements
    #
    # + accountId - accountId 
    # + container - creditCard/loan/insurance 
    # + fromDate - from date for statement retrieval (YYYY-MM-DD) 
    # + isLatest - isLatest (true/false) 
    # + status - ACTIVE,TO_BE_CLOSED,CLOSED 
    # + return - OK 
    remote isolated function getStatements(string? accountId = (), string? container = (), string? fromDate = (), string? isLatest = (), string? status = ()) returns StatementResponse|error {
        string resourcePath = string `/statements`;
        map<anydata> queryParam = {"accountId": accountId, "container": container, "fromDate": fromDate, "isLatest": isLatest, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StatementResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Transactions
    #
    # + accountId - Comma separated accountIds 
    # + baseType - DEBIT/CREDIT 
    # + categoryId - Comma separated categoryIds 
    # + categoryType - Transaction Category Type(UNCATEGORIZE, INCOME, TRANSFER, EXPENSE or DEFERRED_COMPENSATION) 
    # + container - bank/creditCard/investment/insurance/loan 
    # + detailCategoryId - Comma separated detailCategoryIds 
    # + fromDate - Transaction from date(YYYY-MM-DD) 
    # + highLevelCategoryId - Comma separated highLevelCategoryIds 
    # + keyword - Transaction search text 
    # + skip - skip (Min 0) 
    # + toDate - Transaction end date (YYYY-MM-DD) 
    # + top - top (Max 500) 
    # + 'type - Transaction Type(SELL,SWEEP, etc.) for bank/creditCard/investment 
    # + return - OK 
    remote isolated function getTransactions(string? accountId = (), string? baseType = (), string? categoryId = (), string? categoryType = (), string? container = (), string? detailCategoryId = (), string? fromDate = (), string? highLevelCategoryId = (), string? keyword = (), int? skip = (), string? toDate = (), int? top = (), string? 'type = ()) returns TransactionResponse|error {
        string resourcePath = string `/transactions`;
        map<anydata> queryParam = {"accountId": accountId, "baseType": baseType, "categoryId": categoryId, "categoryType": categoryType, "container": container, "detailCategoryId": detailCategoryId, "fromDate": fromDate, "highLevelCategoryId": highLevelCategoryId, "keyword": keyword, "skip": skip, "toDate": toDate, "top": top, "type": 'type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Transaction Category List
    #
    # + return - OK 
    remote isolated function getTransactionCategories() returns TransactionCategoryResponse|error {
        string resourcePath = string `/transactions/categories`;
        TransactionCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Category
    #
    # + payload - updateCategoryRequest 
    # + return - Updated Successfully 
    remote isolated function updateTransactionCategory(UpdateCategoryRequest payload) returns http:Response|error {
        string resourcePath = string `/transactions/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create Category
    #
    # + payload - User Transaction Category in JSON format 
    # + return - Created Successfully 
    remote isolated function createTransactionCategory(TransactionCategoryRequest payload) returns http:Response|error {
        string resourcePath = string `/transactions/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Transaction Categorization Rules
    #
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getTransactionCategorizationRulesDeprecated() returns TransactionCategorizationRule[]|error {
        string resourcePath = string `/transactions/categories/rules`;
        TransactionCategorizationRule[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create or Run Transaction Categorization Rule
    #
    # + action - To run rules, pass action=run. Only value run is supported 
    # + ruleParam - rules(JSON format) to categorize the transactions 
    # + return - Created Successfully 
    remote isolated function createOrRunTransactionCategorizationRules(string? action = (), string? ruleParam = ()) returns http:Response|error {
        string resourcePath = string `/transactions/categories/rules`;
        map<anydata> queryParam = {"action": action, "ruleParam": ruleParam};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Update Transaction Categorization Rule
    #
    # + ruleId - ruleId 
    # + payload - transactionCategoriesRuleRequest 
    # + return - Updated Successfully 
    remote isolated function updateTransactionCategorizationRule(int ruleId, TransactionCategorizationRuleRequest payload) returns http:Response|error {
        string resourcePath = string `/transactions/categories/rules/${getEncodedUri(ruleId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Run Transaction Categorization Rule
    #
    # + action - The action type 
    # + ruleId - Unique id of the categorization rule 
    # + return - Run Successfully 
    remote isolated function runTransactionCategorizationRule(string action, int ruleId) returns http:Response|error {
        string resourcePath = string `/transactions/categories/rules/${getEncodedUri(ruleId)}`;
        map<anydata> queryParam = {"action": action};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete Transaction Categorization Rule
    #
    # + ruleId - ruleId 
    # + return - Deleted Successfully 
    remote isolated function deleteTransactionCategorizationRule(int ruleId) returns http:Response|error {
        string resourcePath = string `/transactions/categories/rules/${getEncodedUri(ruleId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Transaction Categorization Rules
    #
    # + return - OK 
    remote isolated function getTransactionCategorizationRules() returns TransactionCategorizationRuleResponse|error {
        string resourcePath = string `/transactions/categories/txnRules`;
        TransactionCategorizationRuleResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Category
    #
    # + categoryId - categoryId 
    # + return - Deleted Successfully 
    remote isolated function deleteTransactionCategory(int categoryId) returns http:Response|error {
        string resourcePath = string `/transactions/categories/${getEncodedUri(categoryId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Transactions Count
    #
    # + accountId - Comma separated accountIds	 
    # + baseType - DEBIT/CREDIT 
    # + categoryId - Comma separated categoryIds 
    # + categoryType - Transaction Category Type(UNCATEGORIZE, INCOME, TRANSFER, EXPENSE or DEFERRED_COMPENSATION) 
    # + container - bank/creditCard/investment/insurance/loan 
    # + detailCategoryId - Comma separated detailCategoryIds 
    # + fromDate - Transaction from date(YYYY-MM-DD) 
    # + highLevelCategoryId - Comma separated highLevelCategoryIds 
    # + keyword - Transaction search text	 
    # + toDate - Transaction end date (YYYY-MM-DD) 
    # + 'type - Transaction Type(SELL,SWEEP, etc.) 
    # + return - OK 
    remote isolated function getTransactionsCount(string? accountId = (), string? baseType = (), string? categoryId = (), string? categoryType = (), string? container = (), string? detailCategoryId = (), string? fromDate = (), string? highLevelCategoryId = (), string? keyword = (), string? toDate = (), string? 'type = ()) returns TransactionCountResponse|error {
        string resourcePath = string `/transactions/count`;
        map<anydata> queryParam = {"accountId": accountId, "baseType": baseType, "categoryId": categoryId, "categoryType": categoryType, "container": container, "detailCategoryId": detailCategoryId, "fromDate": fromDate, "highLevelCategoryId": highLevelCategoryId, "keyword": keyword, "toDate": toDate, "type": 'type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionCountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Transaction
    #
    # + transactionId - transactionId 
    # + payload - transactionRequest 
    # + return - Updated Successfully 
    remote isolated function updateTransaction(int transactionId, TransactionRequest payload) returns http:Response|error {
        string resourcePath = string `/transactions/${getEncodedUri(transactionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get User Details
    #
    # + return - OK 
    remote isolated function getUser() returns UserDetailResponse|error {
        string resourcePath = string `/user`;
        UserDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update User Details
    #
    # + payload - userRequest 
    # + return - No Content 
    remote isolated function updateUser(UpdateUserRequest payload) returns http:Response|error {
        string resourcePath = string `/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Access Tokens
    #
    # + appIds - appIds 
    # + return - OK 
    remote isolated function getAccessTokens(string appIds) returns UserAccessTokensResponse|error {
        string resourcePath = string `/user/accessTokens`;
        map<anydata> queryParam = {"appIds": appIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserAccessTokensResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # User Logout
    #
    # + return - Logout successful 
    remote isolated function userLogout() returns http:Response|error {
        string resourcePath = string `/user/logout`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Register User
    #
    # + payload - userRequest 
    # + return - Login Successful 
    remote isolated function registerUser(UserRequest payload) returns UserResponse|error {
        string resourcePath = string `/user/register`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Saml Login
    #
    # + issuer - issuer 
    # + samlResponse - samlResponse 
    # + 'source - source 
    # + return - OK 
    remote isolated function samlLogin(string issuer, string samlResponse, string? 'source = ()) returns UserResponse|error {
        string resourcePath = string `/user/samlLogin`;
        map<anydata> queryParam = {"issuer": issuer, "samlResponse": samlResponse, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        UserResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete User
    #
    # + return - No Content 
    remote isolated function unregister() returns http:Response|error {
        string resourcePath = string `/user/unregister`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Verification Status
    #
    # + accountId - Comma separated accountId 
    # + providerAccountId - Comma separated providerAccountId 
    # + verificationType - verificationType 
    # + return - OK 
    remote isolated function getVerificationStatus(string? accountId = (), string? providerAccountId = (), string? verificationType = ()) returns VerificationStatusResponse|error {
        string resourcePath = string `/verification`;
        map<anydata> queryParam = {"accountId": accountId, "providerAccountId": providerAccountId, "verificationType": verificationType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        VerificationStatusResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verify Challenge Deposit
    #
    # + payload - verification information 
    # + return - OK 
    remote isolated function verifyChallengeDeposit(UpdateVerificationRequest payload) returns VerificationResponse|error {
        string resourcePath = string `/verification`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Initiaite Matching Service and Challenge Deposit
    #
    # + payload - verification information 
    # + return - OK 
    remote isolated function initiateMatchingOrChallengeDepositeVerification(VerificationRequest payload) returns VerificationResponse|error {
        string resourcePath = string `/verification`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Verify Accounts Using Transactions
    #
    # + providerAccountId - providerAccountId 
    # + payload - verificationParam 
    # + return - OK 
    remote isolated function initiateAccountVerification(string providerAccountId, VerifyAccountRequest payload) returns VerifyAccountResponse|error {
        string resourcePath = string `/verifyAccount/${getEncodedUri(providerAccountId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifyAccountResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
