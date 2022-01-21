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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `PLAID-CLIENT-ID`
    string plaidClientId;
    # Respresents API Key `PLAID-SECRET`
    string plaidSecret;
    # Respresents API Key `Plaid-Version`
    string plaidVersion;
|};

# This is a generated connector for [Plaid API 2020-09-14 version](https://plaid.com/docs/api/) OpenAPI specification. 
# The Plaid REST API. Plaid provides a way for you to seamlessly link your bank accounts for over 3,000 different financial services.
@display {label: "Plaid", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Plaid account](https://plaid.com/) and obtain tokens by following [this guide](https://plaid.com/docs/api/#api-access).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://production.plaid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # List a user’s connected applications
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemApplicationList(ItemApplicationListRequest payload) returns ItemApplicationListResponse|error {
        string resourcePath = string `/item/application/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemApplicationListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Update the scopes of access for a particular application
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemApplicationScopesUpdate(ItemApplicationScopesUpdateRequest payload) returns ItemApplicationScopesUpdateResponse|error {
        string resourcePath = string `/item/application/scopes/update`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemApplicationScopesUpdateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve information about a Plaid application
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function applicationGet(ApplicationGetRequest payload) returns ApplicationGetResponse|error {
        string resourcePath = string `/application/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve an Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemGet(ItemGetRequest payload) returns ItemGetResponse|error {
        string resourcePath = string `/item/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve auth data
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function authGet(AuthGetRequest payload) returns AuthGetResponse|error {
        string resourcePath = string `/auth/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AuthGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get transaction data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transactionsGet(TransactionsGetRequest payload) returns TransactionsGetResponse|error {
        string resourcePath = string `/transactions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransactionsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Refresh transaction data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transactionsRefresh(TransactionsRefreshRequest payload) returns TransactionsRefreshResponse|error {
        string resourcePath = string `/transactions/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransactionsRefreshResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get details of all supported institutions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsGet(InstitutionsGetRequest payload) returns InstitutionsGetResponse|error {
        string resourcePath = string `/institutions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstitutionsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Search institutions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsSearch(InstitutionsSearchRequest payload) returns InstitutionsSearchResponse|error {
        string resourcePath = string `/institutions/search`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstitutionsSearchResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get details of an institution
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsGetById(InstitutionsGetByIdRequest payload) returns InstitutionsGetByIdResponse|error {
        string resourcePath = string `/institutions/get_by_id`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstitutionsGetByIdResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove an Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemRemove(ItemRemoveRequest payload) returns ItemRemoveResponse|error {
        string resourcePath = string `/item/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemRemoveResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve accounts
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function accountsGet(AccountsGetRequest payload) returns AccountsGetResponse|error {
        string resourcePath = string `/accounts/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Categories
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function categoriesGet(CategoriesGetRequest payload) returns CategoriesGetResponse|error {
        string resourcePath = string `/categories/get`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CategoriesGetResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a test Item and processor token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxProcessorTokenCreate(SandboxProcessorTokenCreateRequest payload) returns SandboxProcessorTokenCreateResponse|error {
        string resourcePath = string `/sandbox/processor_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxProcessorTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a test Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function sandboxPublicTokenCreate(SandboxPublicTokenCreateRequest payload) returns SandboxPublicTokenCreateResponse|error {
        string resourcePath = string `/sandbox/public_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxPublicTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Fire a test webhook
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function sandboxItemFireWebhook(SandboxItemFireWebhookRequest payload) returns SandboxItemFireWebhookResponse|error {
        string resourcePath = string `/sandbox/item/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxItemFireWebhookResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve real-time balance data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function accountsBalanceGet(AccountsBalanceGetRequest payload) returns AccountsGetResponse|error {
        string resourcePath = string `/accounts/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve identity data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function identityGet(IdentityGetRequest payload) returns IdentityGetResponse|error {
        string resourcePath = string `/identity/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdentityGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve Auth data
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function processorAuthGet(ProcessorAuthGetRequest payload) returns ProcessorAuthGetResponse|error {
        string resourcePath = string `/processor/auth/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorAuthGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a bank transfer as a processor
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorBankTransferCreate(ProcessorBankTransferCreateRequest payload) returns ProcessorBankTransferCreateResponse|error {
        string resourcePath = string `/processor/bank_transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorBankTransferCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve Identity data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorIdentityGet(ProcessorIdentityGetRequest payload) returns ProcessorIdentityGetResponse|error {
        string resourcePath = string `/processor/identity/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorIdentityGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve Balance data
    #
    # + payload - The real-time balance for the account associated with a given `processor_token`. 
    # + return - OK 
    remote isolated function processorBalanceGet(ProcessorBalanceGetRequest payload) returns ProcessorBalanceGetResponse|error {
        string resourcePath = string `/processor/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorBalanceGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Update Webhook URL
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemWebhookUpdate(ItemWebhookUpdateRequest payload) returns ItemWebhookUpdateResponse|error {
        string resourcePath = string `/item/webhook/update`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemWebhookUpdateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Invalidate access_token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemAccessTokenInvalidate(ItemAccessTokenInvalidateRequest payload) returns ItemAccessTokenInvalidateResponse|error {
        string resourcePath = string `/item/access_token/invalidate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemAccessTokenInvalidateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get webhook verification key
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function webhookVerificationKeyGet(WebhookVerificationKeyGetRequest payload) returns WebhookVerificationKeyGetResponse|error {
        string resourcePath = string `/webhook_verification_key/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhookVerificationKeyGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve Liabilities data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function liabilitiesGet(LiabilitiesGetRequest payload) returns LiabilitiesGetResponse|error {
        string resourcePath = string `/liabilities/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LiabilitiesGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create payment recipient
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientCreate(PaymentInitiationRecipientCreateRequest payload) returns PaymentInitiationRecipientCreateResponse|error {
        string resourcePath = string `/payment_initiation/recipient/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationRecipientCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get payment recipient
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientGet(PaymentInitiationRecipientGetRequest payload) returns PaymentInitiationRecipientGetResponse|error {
        string resourcePath = string `/payment_initiation/recipient/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationRecipientGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List payment recipients
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientList(PaymentInitiationRecipientListRequest payload) returns PaymentInitiationRecipientListResponse|error {
        string resourcePath = string `/payment_initiation/recipient/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationRecipientListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a payment
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentCreate(PaymentInitiationPaymentCreateRequest payload) returns PaymentInitiationPaymentCreateResponse|error {
        string resourcePath = string `/payment_initiation/payment/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationPaymentCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create payment token
    #
    # + payload - Request payload 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function createPaymentToken(PaymentInitiationPaymentTokenCreateRequest payload) returns PaymentInitiationPaymentTokenCreateResponse|error {
        string resourcePath = string `/payment_initiation/payment/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationPaymentTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Force a Sandbox Item into an error state
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxItemResetLogin(SandboxItemResetLoginRequest payload) returns SandboxItemResetLoginResponse|error {
        string resourcePath = string `/sandbox/item/reset_login`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxItemResetLoginResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Set verification status for Sandbox account
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxItemSetVerificationStatus(SandboxItemSetVerificationStatusRequest payload) returns SandboxItemSetVerificationStatusResponse|error {
        string resourcePath = string `/sandbox/item/set_verification_status`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxItemSetVerificationStatusResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Exchange public token for an access token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemPublicTokenExchange(ItemPublicTokenExchangeRequest payload) returns ItemPublicTokenExchangeResponse|error {
        string resourcePath = string `/item/public_token/exchange`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemPublicTokenExchangeResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create public token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemCreatePublicToken(ItemPublicTokenCreateRequest payload) returns ItemPublicTokenCreateResponse|error {
        string resourcePath = string `/item/public_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemPublicTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get payment details
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentGet(PaymentInitiationPaymentGetRequest payload) returns PaymentInitiationPaymentGetResponse|error {
        string resourcePath = string `/payment_initiation/payment/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationPaymentGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List payments
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentList(PaymentInitiationPaymentListRequest payload) returns PaymentInitiationPaymentListResponse|error {
        string resourcePath = string `/payment_initiation/payment/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentInitiationPaymentListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportCreate(AssetReportCreateRequest payload) returns AssetReportCreateResponse|error {
        string resourcePath = string `/asset_report/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Refresh an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportRefresh(AssetReportRefreshRequest payload) returns AssetReportRefreshResponse|error {
        string resourcePath = string `/asset_report/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportRefreshResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportRemove(AssetReportRemoveRequest payload) returns AssetReportRemoveResponse|error {
        string resourcePath = string `/asset_report/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportRemoveResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Filter Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportFilter(AssetReportFilterRequest payload) returns AssetReportFilterResponse|error {
        string resourcePath = string `/asset_report/filter`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportFilterResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportGet(AssetReportGetRequest payload) returns AssetReportGetResponse|error {
        string resourcePath = string `/asset_report/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a PDF Asset Report
    #
    # + payload - Request payload 
    # + return - A PDF of the Asset Report 
    remote isolated function assetReportPdfGet(AssetReportPDFGetRequest payload) returns AssetReportPDFGetResponse|error {
        string resourcePath = string `/asset_report/pdf/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportPDFGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyCreate(AssetReportAuditCopyCreateRequest payload) returns AssetReportAuditCopyCreateResponse|error {
        string resourcePath = string `/asset_report/audit_copy/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportAuditCopyCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyRemove(AssetReportAuditCopyRemoveRequest payload) returns AssetReportAuditCopyRemoveResponse|error {
        string resourcePath = string `/asset_report/audit_copy/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportAuditCopyRemoveResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Investment holdings
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function investmentsHoldingsGet(InvestmentsHoldingsGetRequest payload) returns InvestmentsHoldingsGetResponse|error {
        string resourcePath = string `/investments/holdings/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvestmentsHoldingsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get investment transactions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function investmentsTransactionsGet(InvestmentsTransactionsGetRequest payload) returns InvestmentsTransactionsGetResponse|error {
        string resourcePath = string `/investments/transactions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvestmentsTransactionsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create processor token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorTokenCreate(ProcessorTokenCreateRequest payload) returns ProcessorTokenCreateResponse|error {
        string resourcePath = string `/processor/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create Stripe bank account token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorStripeBankAccountTokenCreate(ProcessorStripeBankAccountTokenCreateRequest payload) returns ProcessorStripeBankAccountTokenCreateResponse|error {
        string resourcePath = string `/processor/stripe/bank_account_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorStripeBankAccountTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create Apex bank account token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorApexProcessorTokenCreate(ProcessorApexProcessorTokenCreateRequest payload) returns ProcessorTokenCreateResponse|error {
        string resourcePath = string `/processor/apex/processor_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProcessorTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a deposit switch
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchCreate(DepositSwitchCreateRequest payload) returns DepositSwitchCreateResponse|error {
        string resourcePath = string `/deposit_switch/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DepositSwitchCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Import Item
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemImport(ItemImportRequest payload) returns ItemImportResponse|error {
        string resourcePath = string `/item/import`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemImportResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a deposit switch token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchTokenCreate(DepositSwitchTokenCreateRequest payload) returns DepositSwitchTokenCreateResponse|error {
        string resourcePath = string `/deposit_switch/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DepositSwitchTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create Link Token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function linkTokenCreate(LinkTokenCreateRequest payload) returns LinkTokenCreateResponse|error {
        string resourcePath = string `/link/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkTokenCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Link Token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function linkTokenGet(LinkTokenGetRequest payload) returns LinkTokenGetResponse|error {
        string resourcePath = string `/link/token/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkTokenGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve an Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyGet(AssetReportAuditCopyGetRequest payload) returns AssetReportGetResponse|error {
        string resourcePath = string `/asset_report/audit_copy/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetReportGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a deposit switch
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchGet(DepositSwitchGetRequest payload) returns DepositSwitchGetResponse|error {
        string resourcePath = string `/deposit_switch/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DepositSwitchGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferGet(TransferGetRequest payload) returns TransferGetResponse|error {
        string resourcePath = string `/transfer/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferGet(BankTransferGetRequest payload) returns BankTransferGetResponse|error {
        string resourcePath = string `/bank_transfer/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a transfer authorization
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferAuthorizationCreate(TransferAuthorizationCreateRequest payload) returns TransferAuthorizationCreateResponse|error {
        string resourcePath = string `/transfer/authorization/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferAuthorizationCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferCreate(TransferCreateRequest payload) returns TransferCreateResponse|error {
        string resourcePath = string `/transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferCreate(BankTransferCreateRequest payload) returns BankTransferCreateResponse|error {
        string resourcePath = string `/bank_transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferList(TransferListRequest payload) returns TransferListResponse|error {
        string resourcePath = string `/transfer/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List bank transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferList(BankTransferListRequest payload) returns BankTransferListResponse|error {
        string resourcePath = string `/bank_transfer/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Cancel a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferCancel(TransferCancelRequest payload) returns TransferCancelResponse|error {
        string resourcePath = string `/transfer/cancel`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferCancelResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Cancel a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferCancel(BankTransferCancelRequest payload) returns BankTransferCancelResponse|error {
        string resourcePath = string `/bank_transfer/cancel`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferCancelResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferEventList(TransferEventListRequest payload) returns TransferEventListResponse|error {
        string resourcePath = string `/transfer/event/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferEventListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List bank transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferEventList(BankTransferEventListRequest payload) returns BankTransferEventListResponse|error {
        string resourcePath = string `/bank_transfer/event/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferEventListResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Sync transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferEventSync(TransferEventSyncRequest payload) returns TransferEventSyncResponse|error {
        string resourcePath = string `/transfer/event/sync`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferEventSyncResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Sync bank transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferEventSync(BankTransferEventSyncRequest payload) returns BankTransferEventSyncResponse|error {
        string resourcePath = string `/bank_transfer/event/sync`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferEventSyncResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a sweep
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferSweepGet(BankTransferSweepGetRequest payload) returns BankTransferSweepGetResponse|error {
        string resourcePath = string `/bank_transfer/sweep/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferSweepGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get balance of your Bank Transfer account
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferBalanceGet(BankTransferBalanceGetRequest payload) returns BankTransferBalanceGetResponse|error {
        string resourcePath = string `/bank_transfer/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferBalanceGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Migrate account into Bank Transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferMigrateAccount(BankTransferMigrateAccountRequest payload) returns BankTransferMigrateAccountResponse|error {
        string resourcePath = string `/bank_transfer/migrate_account`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankTransferMigrateAccountResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Simulate a bank transfer event in Sandbox
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxBankTransferSimulate(SandboxBankTransferSimulateRequest payload) returns SandboxBankTransferSimulateResponse|error {
        string resourcePath = string `/sandbox/bank_transfer/simulate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxBankTransferSimulateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Simulate a transfer event in Sandbox
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxTransferSimulate(SandboxTransferSimulateRequest payload) returns SandboxTransferSimulateResponse|error {
        string resourcePath = string `/sandbox/transfer/simulate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxTransferSimulateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Search employer database
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function employersSearch(EmployersSearchRequest payload) returns EmployersSearchResponse|error {
        string resourcePath = string `/employers/search`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmployersSearchResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create an income verification instance
    #
    # + payload - Request payload 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function incomeVerificationCreate(IncomeVerificationCreateRequest payload) returns IncomeVerificationCreateResponse|error {
        string resourcePath = string `/income/verification/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IncomeVerificationCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve a summary of information derived from income verification
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationSummaryGet(IncomeVerificationSummaryGetRequest payload) returns IncomeVerificationSummaryGetResponse|error {
        string resourcePath = string `/income/verification/summary/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IncomeVerificationSummaryGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # (Deprecated) Retrieve information from a single paystub used for income verification
    #
    # + payload - Request payload 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function incomeVerificationPaystubGet(IncomeVerificationPaystubGetRequest payload) returns json|error {
        string resourcePath = string `/income/verification/paystub/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve information from the paystubs used for income verification
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationPaystubsGet(IncomeVerificationPaystubsGetRequest payload) returns IncomeVerificationPaystubsGetResponse|error {
        string resourcePath = string `/income/verification/paystubs/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IncomeVerificationPaystubsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Download the original documents used for income verification
    #
    # + payload - Request payload 
    # + return - A ZIP file containing the source paystub(s) used as the basis for income verification. 
    remote isolated function incomeVerificationDocumentsDownload(IncomeVerificationDocumentsDownloadRequest payload) returns string|error {
        string resourcePath = string `/income/verification/documents/download`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Refresh an income verification
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function incomeVerificationRefresh(IncomeVerificationRefreshRequest payload) returns IncomeVerificationRefreshResponse|error {
        string resourcePath = string `/income/verification/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IncomeVerificationRefreshResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve information from the tax documents used for income verification
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function incomeVerificationTaxformsGet(IncomeVerificationTaxformsGetRequest payload) returns IncomeVerificationTaxformsGetResponse|error {
        string resourcePath = string `/income/verification/taxforms/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IncomeVerificationTaxformsGetResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a deposit switch without using Plaid Exchange
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchAltCreate(DepositSwitchAltCreateRequest payload) returns DepositSwitchAltCreateResponse|error {
        string resourcePath = string `/deposit_switch/alt/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DepositSwitchAltCreateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Manually fire a Bank Transfer webhook
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxBankTransferFireWebhook(SandboxBankTransferFireWebhookRequest payload) returns SandboxBankTransferFireWebhookResponse|error {
        string resourcePath = string `/sandbox/bank_transfer/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxBankTransferFireWebhookResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Manually fire an Income webhook
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxIncomeFireWebhook(SandboxIncomeFireWebhookRequest payload) returns SandboxIncomeFireWebhookResponse|error {
        string resourcePath = string `/sandbox/income/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxIncomeFireWebhookResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Save the selected accounts when connecting to the Platypus Oauth institution
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxOauthSelectAccounts(SandboxOauthSelectAccountsRequest payload) returns SandboxOauthSelectAccountsResponse|error {
        string resourcePath = string `/sandbox/oauth/select_accounts`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SandboxOauthSelectAccountsResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Evaluate a planned ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalEvaluate(SignalEvaluateRequest payload) returns SignalEvaluateResponse|error {
        string resourcePath = string `/signal/evaluate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SignalEvaluateResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Report whether you initiated an ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalDecisionReport(SignalDecisionReportRequest payload) returns SignalDecisionReportResponse|error {
        string resourcePath = string `/signal/decision/report`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SignalDecisionReportResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Report a return for an ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalReturnReport(SignalReturnReportRequest payload) returns SignalReturnReportResponse|error {
        string resourcePath = string `/signal/return/report`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeyConfig.plaidClientId, "PLAID-SECRET": self.apiKeyConfig.plaidSecret, "Plaid-Version": self.apiKeyConfig.plaidVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SignalReturnReportResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
