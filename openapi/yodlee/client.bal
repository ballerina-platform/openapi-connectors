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

# This is a generated connector for [Yodlee Core API v1.1.0](https://www.yodlee.com/) OpenAPI specification
# Envestnet | Yodlee API (“Yodlee API”) is a flexible RESTful API that allows developers to access personal financial data from the Envestnet | Yodlee financial data platform that can be used to develop various financial management applications.
# Yodlee API 1.1 is designed to work with FastLink 3.0.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Yodlee account](https://www.dracoon.com/en/home) and obtain OAuth tokens following [this guide](https://developer.yodlee.com/docs/api/1.1/getting-started-with-cc).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
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
        string  path = string `/accounts`;
        map<anydata> queryParam = {"accountId": accountId, "container": container, "include": include, "providerAccountId": providerAccountId, "requestId": requestId, "status": status};
        path = path + check getPathForQueryParam(queryParam);
        AccountResponse response = check self.clientEp-> get(path, targetType = AccountResponse);
        return response;
    }
    # Add Manual Account
    #
    # + payload - accountParam
    # + return - OK
    remote isolated function createManualAccount(CreateAccountRequest payload) returns CreatedAccountResponse|error {
        string  path = string `/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedAccountResponse response = check self.clientEp->post(path, request, targetType=CreatedAccountResponse);
        return response;
    }
    # Evaluate Address
    #
    # + payload - addressParam
    # + return - OK
    remote isolated function evaluateAddress(EvaluateAddressRequest payload) returns EvaluateAddressResponse|error {
        string  path = string `/accounts/evaluateAddress`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EvaluateAddressResponse response = check self.clientEp->post(path, request, targetType=EvaluateAddressResponse);
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
        string  path = string `/accounts/historicalBalances`;
        map<anydata> queryParam = {"accountId": accountId, "fromDate": fromDate, "includeCF": includeCF, "interval": interval, "skip": skip, "toDate": toDate, "top": top};
        path = path + check getPathForQueryParam(queryParam);
        AccountHistoricalBalancesResponse response = check self.clientEp-> get(path, targetType = AccountHistoricalBalancesResponse);
        return response;
    }
    # Get Account Details
    #
    # + accountId - accountId
    # + include - profile, holder, fullAccountNumber, fullAccountNumberList, paymentProfile, autoRefresh<br><b>Note:</b>fullAccountNumber is deprecated and is replaced with fullAccountNumberList in include parameter and response.
    # + return - OK
    remote isolated function getAccount(int accountId, string? include = ()) returns AccountResponse|error {
        string  path = string `/accounts/${accountId}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        AccountResponse response = check self.clientEp-> get(path, targetType = AccountResponse);
        return response;
    }
    # Update Account
    #
    # + accountId - accountId
    # + payload - accountRequest
    # + return - OK
    remote isolated function updateAccount(int accountId, UpdateAccountRequest payload) returns http:Response|error {
        string  path = string `/accounts/${accountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete Account
    #
    # + accountId - accountId
    # + return - OK
    remote isolated function deleteAccount(int accountId) returns http:Response|error {
        string  path = string `/accounts/${accountId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get API Keys
    #
    # + return - OK
    remote isolated function getApiKeys() returns ApiKeyResponse|error {
        string  path = string `/auth/apiKey`;
        ApiKeyResponse response = check self.clientEp-> get(path, targetType = ApiKeyResponse);
        return response;
    }
    # Generate API Key
    #
    # + payload - apiKeyRequest
    # + return - OK
    remote isolated function generateApiKey(ApiKeyRequest payload) returns ApiKeyResponse|error {
        string  path = string `/auth/apiKey`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyResponse response = check self.clientEp->post(path, request, targetType=ApiKeyResponse);
        return response;
    }
    # Delete API Key
    #
    # + 'key - key
    # + return - OK
    remote isolated function deleteApiKey(string 'key) returns http:Response|error {
        string  path = string `/auth/apiKey/${'key}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Generate Access Token
    #
    # + return - OK
    remote isolated function generateAccessToken() returns ClientCredentialTokenResponse|error {
        string  path = string `/auth/token`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClientCredentialTokenResponse response = check self.clientEp-> post(path, request, targetType = ClientCredentialTokenResponse);
        return response;
    }
    # Delete Token
    #
    # + return - No Content
    remote isolated function deleteToken() returns http:Response|error {
        string  path = string `/auth/token`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get Subscribed Events
    #
    # + eventName - eventName
    # + return - OK
    remote isolated function getSubscribedEvents(string? eventName = ()) returns CobrandNotificationResponse|error {
        string  path = string `/cobrand/config/notifications/events`;
        map<anydata> queryParam = {"eventName": eventName};
        path = path + check getPathForQueryParam(queryParam);
        CobrandNotificationResponse response = check self.clientEp-> get(path, targetType = CobrandNotificationResponse);
        return response;
    }
    # Update Subscription
    #
    # + eventName - eventName
    # + payload - eventRequest
    # + return - OK
    remote isolated function updateSubscribedEvent(string eventName, UpdateCobrandNotificationEventRequest payload) returns http:Response|error {
        string  path = string `/cobrand/config/notifications/events/${eventName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Subscribe Event
    #
    # + eventName - eventName
    # + payload - eventRequest
    # + return - OK
    remote isolated function createSubscriptionEvent(string eventName, CreateCobrandNotificationEventRequest payload) returns http:Response|error {
        string  path = string `/cobrand/config/notifications/events/${eventName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete Subscription
    #
    # + eventName - eventName
    # + return - OK
    remote isolated function deleteSubscribedEvent(string eventName) returns http:Response|error {
        string  path = string `/cobrand/config/notifications/events/${eventName}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Cobrand Login
    #
    # + payload - cobrandLoginRequest
    # + return - OK
    remote isolated function cobrandLogin(CobrandLoginRequest payload) returns CobrandLoginResponse|error {
        string  path = string `/cobrand/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CobrandLoginResponse response = check self.clientEp->post(path, request, targetType=CobrandLoginResponse);
        return response;
    }
    # Cobrand Logout
    #
    # + return - Logout successful
    remote isolated function cobrandLogout() returns http:Response|error {
        string  path = string `/cobrand/logout`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Get Public Key
    #
    # + return - OK
    remote isolated function getPublicKey() returns CobrandPublicKeyResponse|error {
        string  path = string `/cobrand/publicKey`;
        CobrandPublicKeyResponse response = check self.clientEp-> get(path, targetType = CobrandPublicKeyResponse);
        return response;
    }
    # Get Subscribed Notification Events
    #
    # + eventName - eventName
    # + return - OK
    remote isolated function getSubscribedNotificationEvents(string? eventName = ()) returns ConfigsNotificationResponse|error {
        string  path = string `/configs/notifications/events`;
        map<anydata> queryParam = {"eventName": eventName};
        path = path + check getPathForQueryParam(queryParam);
        ConfigsNotificationResponse response = check self.clientEp-> get(path, targetType = ConfigsNotificationResponse);
        return response;
    }
    # Update Notification Subscription
    #
    # + eventName - eventName
    # + payload - eventRequest
    # + return - OK
    remote isolated function updateSubscribedNotificationEvent(string eventName, UpdateConfigsNotificationEventRequest payload) returns http:Response|error {
        string  path = string `/configs/notifications/events/${eventName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Subscribe For Notification Event
    #
    # + eventName - eventName
    # + payload - eventRequest
    # + return - OK
    remote isolated function createSubscriptionNotificationEvent(string eventName, CreateConfigsNotificationEventRequest payload) returns http:Response|error {
        string  path = string `/configs/notifications/events/${eventName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete Notification Subscription
    #
    # + eventName - eventName
    # + return - OK
    remote isolated function deleteSubscribedNotificationEvent(string eventName) returns http:Response|error {
        string  path = string `/configs/notifications/events/${eventName}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get Public Key
    #
    # + return - OK
    remote isolated function getPublicEncryptionKey() returns ConfigsPublicKeyResponse|error {
        string  path = string `/configs/publicKey`;
        ConfigsPublicKeyResponse response = check self.clientEp-> get(path, targetType = ConfigsPublicKeyResponse);
        return response;
    }
    # Get Events
    #
    # + eventName - Event Name
    # + fromDate - From DateTime (YYYY-MM-DDThh:mm:ssZ)
    # + toDate - To DateTime (YYYY-MM-DDThh:mm:ssZ)
    # + return - OK
    remote isolated function getDataExtractsEvents(string eventName, string fromDate, string toDate) returns DataExtractsEventResponse|error {
        string  path = string `/dataExtracts/events`;
        map<anydata> queryParam = {"eventName": eventName, "fromDate": fromDate, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        DataExtractsEventResponse response = check self.clientEp-> get(path, targetType = DataExtractsEventResponse);
        return response;
    }
    # Get userData
    #
    # + fromDate - From DateTime (YYYY-MM-DDThh:mm:ssZ)
    # + loginName - Login Name
    # + toDate - To DateTime (YYYY-MM-DDThh:mm:ssZ)
    # + return - OK
    remote isolated function getDataExtractsUserData(string fromDate, string loginName, string toDate) returns DataExtractsUserDataResponse|error {
        string  path = string `/dataExtracts/userData`;
        map<anydata> queryParam = {"fromDate": fromDate, "loginName": loginName, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        DataExtractsUserDataResponse response = check self.clientEp-> get(path, targetType = DataExtractsUserDataResponse);
        return response;
    }
    # Get Holding Summary
    #
    # + accountIds - Comma separated accountIds
    # + classificationType - e.g. Country, Sector, etc.
    # + include - details
    # + return - OK
    remote isolated function getHoldingSummary(string? accountIds = (), string? classificationType = (), string? include = ()) returns DerivedHoldingSummaryResponse|error {
        string  path = string `/derived/holdingSummary`;
        map<anydata> queryParam = {"accountIds": accountIds, "classificationType": classificationType, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        DerivedHoldingSummaryResponse response = check self.clientEp-> get(path, targetType = DerivedHoldingSummaryResponse);
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
        string  path = string `/derived/networth`;
        map<anydata> queryParam = {"accountIds": accountIds, "container": container, "fromDate": fromDate, "include": include, "interval": interval, "skip": skip, "toDate": toDate, "top": top};
        path = path + check getPathForQueryParam(queryParam);
        DerivedNetworthResponse response = check self.clientEp-> get(path, targetType = DerivedNetworthResponse);
        return response;
    }
    # Get Transaction Summary
    #
    # + groupBy - CATEGORY_TYPE, HIGH_LEVEL_CATEGORY or CATEGORY
    # + accountId - comma separated account Ids
    # + categoryId - comma separated categoryIds
    # + categoryType - INCOME, EXPENSE, TRANSFER, UNCATEGORIZE or DEFERRED_COMPENSATION
    # + fromDate - YYYY-MM-DD format
    # + include - details
    # + includeUserCategory - TRUE/FALSE
    # + interval - D-daily, W-weekly, M-mothly or Y-yearly
    # + toDate - YYYY-MM-DD format
    # + return - OK
    remote isolated function getTransactionSummary(string groupBy, string? accountId = (), string? categoryId = (), string? categoryType = (), string? fromDate = (), string? include = (), boolean? includeUserCategory = (), string? interval = (), string? toDate = ()) returns DerivedTransactionSummaryResponse|error {
        string  path = string `/derived/transactionSummary`;
        map<anydata> queryParam = {"accountId": accountId, "categoryId": categoryId, "categoryType": categoryType, "fromDate": fromDate, "groupBy": groupBy, "include": include, "includeUserCategory": includeUserCategory, "interval": interval, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        DerivedTransactionSummaryResponse response = check self.clientEp-> get(path, targetType = DerivedTransactionSummaryResponse);
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
        string  path = string `/documents`;
        map<anydata> queryParam = {"Keyword": keyword, "accountId": accountId, "docType": docType, "fromDate": fromDate, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        DocumentResponse response = check self.clientEp-> get(path, targetType = DocumentResponse);
        return response;
    }
    # Download a Document
    #
    # + documentId - documentId
    # + return - OK
    remote isolated function downloadDocument(string documentId) returns DocumentDownloadResponse|error {
        string  path = string `/documents/${documentId}`;
        DocumentDownloadResponse response = check self.clientEp-> get(path, targetType = DocumentDownloadResponse);
        return response;
    }
    # Delete Document
    #
    # + documentId - documentId
    # + return - OK
    remote isolated function deleteDocument(string documentId) returns http:Response|error {
        string  path = string `/documents/${documentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
        string  path = string `/holdings`;
        map<anydata> queryParam = {"accountId": accountId, "assetClassification.classificationType": assetclassificationClassificationtype, "classificationValue": classificationValue, "include": include, "providerAccountId": providerAccountId};
        path = path + check getPathForQueryParam(queryParam);
        HoldingResponse response = check self.clientEp-> get(path, targetType = HoldingResponse);
        return response;
    }
    # Get Asset Classification List
    #
    # + return - OK
    remote isolated function getAssetClassificationList() returns HoldingAssetClassificationListResponse|error {
        string  path = string `/holdings/assetClassificationList`;
        HoldingAssetClassificationListResponse response = check self.clientEp-> get(path, targetType = HoldingAssetClassificationListResponse);
        return response;
    }
    # Get Holding Type List
    #
    # + return - OK
    remote isolated function getHoldingTypeList() returns HoldingTypeListResponse|error {
        string  path = string `/holdings/holdingTypeList`;
        HoldingTypeListResponse response = check self.clientEp-> get(path, targetType = HoldingTypeListResponse);
        return response;
    }
    # Get Security Details
    #
    # + holdingId - Comma separated holdingId
    # + return - OK
    remote isolated function getSecurities(string? holdingId = ()) returns HoldingSecuritiesResponse|error {
        string  path = string `/holdings/securities`;
        map<anydata> queryParam = {"holdingId": holdingId};
        path = path + check getPathForQueryParam(queryParam);
        HoldingSecuritiesResponse response = check self.clientEp-> get(path, targetType = HoldingSecuritiesResponse);
        return response;
    }
    # Get Provider Accounts
    #
    # + include - include
    # + providerIds - Comma separated providerIds.
    # + return - OK
    remote isolated function getAllProviderAccounts(string? include = (), string? providerIds = ()) returns ProviderAccountResponse|error {
        string  path = string `/providerAccounts`;
        map<anydata> queryParam = {"include": include, "providerIds": providerIds};
        path = path + check getPathForQueryParam(queryParam);
        ProviderAccountResponse response = check self.clientEp-> get(path, targetType = ProviderAccountResponse);
        return response;
    }
    # Update Account
    #
    # + providerAccountIds - comma separated providerAccountIds
    # + payload - loginForm or field entity
    # + return - OK
    remote isolated function editCredentialsOrRefreshProviderAccount(string providerAccountIds, ProviderAccountRequest payload) returns UpdatedProviderAccountResponse|error {
        string  path = string `/providerAccounts`;
        map<anydata> queryParam = {"providerAccountIds": providerAccountIds};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdatedProviderAccountResponse response = check self.clientEp->put(path, request, targetType=UpdatedProviderAccountResponse);
        return response;
    }
    # Get User Profile Details
    #
    # + providerAccountId - Comma separated providerAccountIds.
    # + return - OK
    remote isolated function getProviderAccountProfiles(string? providerAccountId = ()) returns ProviderAccountUserProfileResponse|error {
        string  path = string `/providerAccounts/profile`;
        map<anydata> queryParam = {"providerAccountId": providerAccountId};
        path = path + check getPathForQueryParam(queryParam);
        ProviderAccountUserProfileResponse response = check self.clientEp-> get(path, targetType = ProviderAccountUserProfileResponse);
        return response;
    }
    # Get Provider Account Details
    #
    # + providerAccountId - providerAccountId
    # + include - include credentials,questions
    # + requestId - The unique identifier for the request that returns contextual data
    # + return - OK
    remote isolated function getProviderAccount(int providerAccountId, string? include = (), string? requestId = ()) returns ProviderAccountDetailResponse|error {
        string  path = string `/providerAccounts/${providerAccountId}`;
        map<anydata> queryParam = {"include": include, "requestId": requestId};
        path = path + check getPathForQueryParam(queryParam);
        ProviderAccountDetailResponse response = check self.clientEp-> get(path, targetType = ProviderAccountDetailResponse);
        return response;
    }
    # Delete Provider Account
    #
    # + providerAccountId - providerAccountId
    # + return - OK
    remote isolated function deleteProviderAccount(int providerAccountId) returns http:Response|error {
        string  path = string `/providerAccounts/${providerAccountId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update Preferences
    #
    # + providerAccountId - providerAccountId
    # + payload - preferences
    # + return - OK
    remote isolated function updatePreferences(int providerAccountId, ProviderAccountPreferencesRequest payload) returns http:Response|error {
        string  path = string `/providerAccounts/${providerAccountId}/preferences`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
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
        string  path = string `/providers`;
        map<anydata> queryParam = {"capability": capability, "dataset$filter": datasetFilter, "fullAccountNumberFields": fullAccountNumberFields, "institutionId": institutionId, "name": name, "priority": priority, "providerId": providerId, "skip": skip, "top": top};
        path = path + check getPathForQueryParam(queryParam);
        ProviderResponse response = check self.clientEp-> get(path, targetType = ProviderResponse);
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
        string  path = string `/providers/count`;
        map<anydata> queryParam = {"capability": capability, "dataset$filter": datasetFilter, "fullAccountNumberFields": fullAccountNumberFields, "name": name, "priority": priority};
        path = path + check getPathForQueryParam(queryParam);
        ProvidersCountResponse response = check self.clientEp-> get(path, targetType = ProvidersCountResponse);
        return response;
    }
    # Get Provider Details
    #
    # + providerId - providerId
    # + return - OK
    remote isolated function getProvider(int providerId) returns ProviderDetailResponse|error {
        string  path = string `/providers/${providerId}`;
        ProviderDetailResponse response = check self.clientEp-> get(path, targetType = ProviderDetailResponse);
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
        string  path = string `/statements`;
        map<anydata> queryParam = {"accountId": accountId, "container": container, "fromDate": fromDate, "isLatest": isLatest, "status": status};
        path = path + check getPathForQueryParam(queryParam);
        StatementResponse response = check self.clientEp-> get(path, targetType = StatementResponse);
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
        string  path = string `/transactions`;
        map<anydata> queryParam = {"accountId": accountId, "baseType": baseType, "categoryId": categoryId, "categoryType": categoryType, "container": container, "detailCategoryId": detailCategoryId, "fromDate": fromDate, "highLevelCategoryId": highLevelCategoryId, "keyword": keyword, "skip": skip, "toDate": toDate, "top": top, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        TransactionResponse response = check self.clientEp-> get(path, targetType = TransactionResponse);
        return response;
    }
    # Get Transaction Category List
    #
    # + return - OK
    remote isolated function getTransactionCategories() returns TransactionCategoryResponse|error {
        string  path = string `/transactions/categories`;
        TransactionCategoryResponse response = check self.clientEp-> get(path, targetType = TransactionCategoryResponse);
        return response;
    }
    # Update Category
    #
    # + payload - updateCategoryRequest
    # + return - Updated Successfully
    remote isolated function updateTransactionCategory(UpdateCategoryRequest payload) returns http:Response|error {
        string  path = string `/transactions/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Create Category
    #
    # + payload - User Transaction Category in JSON format
    # + return - Created Successfully
    remote isolated function createTransactionCategory(TransactionCategoryRequest payload) returns http:Response|error {
        string  path = string `/transactions/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get Transaction Categorization Rules
    #
    # + return - OK
    remote isolated function getTransactionCategorizationRulesDeprecated() returns TransactionCategorizationRule[]|error {
        string  path = string `/transactions/categories/rules`;
        TransactionCategorizationRule[] response = check self.clientEp-> get(path, targetType = TransactionCategorizationRuleArr);
        return response;
    }
    # Create or Run Transaction Categorization Rule
    #
    # + action - To run rules, pass action=run. Only value run is supported
    # + ruleParam - rules(JSON format) to categorize the transactions
    # + return - Created Successfully
    remote isolated function createOrRunTransactionCategorizationRules(string? action = (), string? ruleParam = ()) returns http:Response|error {
        string  path = string `/transactions/categories/rules`;
        map<anydata> queryParam = {"action": action, "ruleParam": ruleParam};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Update Transaction Categorization Rule
    #
    # + ruleId - ruleId
    # + payload - transactionCategoriesRuleRequest
    # + return - Updated Successfully
    remote isolated function updateTransactionCategorizationRule(int ruleId, TransactionCategorizationRuleRequest payload) returns http:Response|error {
        string  path = string `/transactions/categories/rules/${ruleId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Run Transaction Categorization Rule
    #
    # + action - The action type
    # + ruleId - Unique id of the categorization rule
    # + return - Run Successfully
    remote isolated function runTransactionCategorizationRule(string action, int ruleId) returns http:Response|error {
        string  path = string `/transactions/categories/rules/${ruleId}`;
        map<anydata> queryParam = {"action": action};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Delete Transaction Categorization Rule
    #
    # + ruleId - ruleId
    # + return - Deleted Successfully
    remote isolated function deleteTransactionCategorizationRule(int ruleId) returns http:Response|error {
        string  path = string `/transactions/categories/rules/${ruleId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get Transaction Categorization Rules
    #
    # + return - OK
    remote isolated function getTransactionCategorizationRules() returns TransactionCategorizationRuleResponse|error {
        string  path = string `/transactions/categories/txnRules`;
        TransactionCategorizationRuleResponse response = check self.clientEp-> get(path, targetType = TransactionCategorizationRuleResponse);
        return response;
    }
    # Delete Category
    #
    # + categoryId - categoryId
    # + return - Deleted Successfully
    remote isolated function deleteTransactionCategory(int categoryId) returns http:Response|error {
        string  path = string `/transactions/categories/${categoryId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
        string  path = string `/transactions/count`;
        map<anydata> queryParam = {"accountId": accountId, "baseType": baseType, "categoryId": categoryId, "categoryType": categoryType, "container": container, "detailCategoryId": detailCategoryId, "fromDate": fromDate, "highLevelCategoryId": highLevelCategoryId, "keyword": keyword, "toDate": toDate, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        TransactionCountResponse response = check self.clientEp-> get(path, targetType = TransactionCountResponse);
        return response;
    }
    # Update Transaction
    #
    # + transactionId - transactionId
    # + payload - transactionRequest
    # + return - Updated Successfully
    remote isolated function updateTransaction(int transactionId, TransactionRequest payload) returns http:Response|error {
        string  path = string `/transactions/${transactionId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get User Details
    #
    # + return - OK
    remote isolated function getUser() returns UserDetailResponse|error {
        string  path = string `/user`;
        UserDetailResponse response = check self.clientEp-> get(path, targetType = UserDetailResponse);
        return response;
    }
    # Update User Details
    #
    # + payload - userRequest
    # + return - No Content
    remote isolated function updateUser(UpdateUserRequest payload) returns http:Response|error {
        string  path = string `/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Access Tokens
    #
    # + appIds - appIds
    # + return - OK
    remote isolated function getAccessTokens(string appIds) returns UserAccessTokensResponse|error {
        string  path = string `/user/accessTokens`;
        map<anydata> queryParam = {"appIds": appIds};
        path = path + check getPathForQueryParam(queryParam);
        UserAccessTokensResponse response = check self.clientEp-> get(path, targetType = UserAccessTokensResponse);
        return response;
    }
    # User Logout
    #
    # + return - Logout successful
    remote isolated function userLogout() returns http:Response|error {
        string  path = string `/user/logout`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Register User
    #
    # + payload - userRequest
    # + return - Login Successful
    remote isolated function registerUser(UserRequest payload) returns UserResponse|error {
        string  path = string `/user/register`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->post(path, request, targetType=UserResponse);
        return response;
    }
    # Saml Login
    #
    # + issuer - issuer
    # + samlResponse - samlResponse
    # + 'source - source
    # + return - OK
    remote isolated function samlLogin(string issuer, string samlResponse, string? 'source = ()) returns UserResponse|error {
        string  path = string `/user/samlLogin`;
        map<anydata> queryParam = {"issuer": issuer, "samlResponse": samlResponse, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        UserResponse response = check self.clientEp-> post(path, request, targetType = UserResponse);
        return response;
    }
    # Delete User
    #
    # + return - No Content
    remote isolated function unregister() returns http:Response|error {
        string  path = string `/user/unregister`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get Verification Status
    #
    # + accountId - Comma separated accountId
    # + providerAccountId - Comma separated providerAccountId
    # + verificationType - verificationType
    # + return - OK
    remote isolated function getVerificationStatus(string? accountId = (), string? providerAccountId = (), string? verificationType = ()) returns VerificationStatusResponse|error {
        string  path = string `/verification`;
        map<anydata> queryParam = {"accountId": accountId, "providerAccountId": providerAccountId, "verificationType": verificationType};
        path = path + check getPathForQueryParam(queryParam);
        VerificationStatusResponse response = check self.clientEp-> get(path, targetType = VerificationStatusResponse);
        return response;
    }
    # Verify Challenge Deposit
    #
    # + payload - verification information
    # + return - OK
    remote isolated function verifyChallengeDeposit(UpdateVerificationRequest payload) returns VerificationResponse|error {
        string  path = string `/verification`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VerificationResponse response = check self.clientEp->put(path, request, targetType=VerificationResponse);
        return response;
    }
    # Initiaite Matching Service and Challenge Deposit
    #
    # + payload - verification information
    # + return - OK
    remote isolated function initiateMatchingOrChallengeDepositeVerification(VerificationRequest payload) returns VerificationResponse|error {
        string  path = string `/verification`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VerificationResponse response = check self.clientEp->post(path, request, targetType=VerificationResponse);
        return response;
    }
    # Verify Accounts Using Transactions
    #
    # + providerAccountId - providerAccountId
    # + payload - verificationParam
    # + return - OK
    remote isolated function initiateAccountVerification(string providerAccountId, VerifyAccountRequest payload) returns VerifyAccountResponse|error {
        string  path = string `/verifyAccount/${providerAccountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VerifyAccountResponse response = check self.clientEp->post(path, request, targetType=VerifyAccountResponse);
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
