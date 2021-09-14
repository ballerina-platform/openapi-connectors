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
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Plaid API 2020-09-14 version](https://plaid.com/docs/api/) OpenAPI specification. 
# The Plaid REST API. Plaid provides a way for you to seamlessly link your bank accounts for over 3,000 different financial services.
@display {label: "Plaid", iconPath: "resources/plaid.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Plaid account](https://plaid.com/) and obtain tokens by following [this guide](https://plaid.com/docs/api/#api-access).
    #
    # + apiKeyConfig - API key configuration detail 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://production.plaid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # List a user’s connected applications
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemApplicationList(ItemApplicationListRequest payload) returns ItemApplicationListResponse|error {
        string  path = string `/item/application/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemApplicationListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemApplicationListResponse);
        return response;
    }
    # Update the scopes of access for a particular application
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemApplicationScopesUpdate(ItemApplicationScopesUpdateRequest payload) returns ItemApplicationScopesUpdateResponse|error {
        string  path = string `/item/application/scopes/update`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemApplicationScopesUpdateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemApplicationScopesUpdateResponse);
        return response;
    }
    # Retrieve information about a Plaid application
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function applicationGet(ApplicationGetRequest payload) returns ApplicationGetResponse|error {
        string  path = string `/application/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApplicationGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApplicationGetResponse);
        return response;
    }
    # Retrieve an Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemGet(ItemGetRequest payload) returns ItemGetResponse|error {
        string  path = string `/item/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemGetResponse);
        return response;
    }
    # Retrieve auth data
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function authGet(AuthGetRequest payload) returns AuthGetResponse|error {
        string  path = string `/auth/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AuthGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AuthGetResponse);
        return response;
    }
    # Get transaction data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transactionsGet(TransactionsGetRequest payload) returns TransactionsGetResponse|error {
        string  path = string `/transactions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransactionsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransactionsGetResponse);
        return response;
    }
    # Refresh transaction data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transactionsRefresh(TransactionsRefreshRequest payload) returns TransactionsRefreshResponse|error {
        string  path = string `/transactions/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransactionsRefreshResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransactionsRefreshResponse);
        return response;
    }
    # Get details of all supported institutions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsGet(InstitutionsGetRequest payload) returns InstitutionsGetResponse|error {
        string  path = string `/institutions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstitutionsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InstitutionsGetResponse);
        return response;
    }
    # Search institutions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsSearch(InstitutionsSearchRequest payload) returns InstitutionsSearchResponse|error {
        string  path = string `/institutions/search`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstitutionsSearchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InstitutionsSearchResponse);
        return response;
    }
    # Get details of an institution
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function institutionsGetById(InstitutionsGetByIdRequest payload) returns InstitutionsGetByIdResponse|error {
        string  path = string `/institutions/get_by_id`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstitutionsGetByIdResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InstitutionsGetByIdResponse);
        return response;
    }
    # Remove an Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function itemRemove(ItemRemoveRequest payload) returns ItemRemoveResponse|error {
        string  path = string `/item/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemRemoveResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemRemoveResponse);
        return response;
    }
    # Retrieve accounts
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function accountsGet(AccountsGetRequest payload) returns AccountsGetResponse|error {
        string  path = string `/accounts/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AccountsGetResponse);
        return response;
    }
    # Get Categories
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function categoriesGet(CategoriesGetRequest payload) returns CategoriesGetResponse|error {
        string  path = string `/categories/get`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CategoriesGetResponse response = check self.clientEp->post(path, request, targetType=CategoriesGetResponse);
        return response;
    }
    # Create a test Item and processor token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxProcessorTokenCreate(SandboxProcessorTokenCreateRequest payload) returns SandboxProcessorTokenCreateResponse|error {
        string  path = string `/sandbox/processor_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxProcessorTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxProcessorTokenCreateResponse);
        return response;
    }
    # Create a test Item
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function sandboxPublicTokenCreate(SandboxPublicTokenCreateRequest payload) returns SandboxPublicTokenCreateResponse|error {
        string  path = string `/sandbox/public_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxPublicTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxPublicTokenCreateResponse);
        return response;
    }
    # Fire a test webhook
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function sandboxItemFireWebhook(SandboxItemFireWebhookRequest payload) returns SandboxItemFireWebhookResponse|error {
        string  path = string `/sandbox/item/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxItemFireWebhookResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxItemFireWebhookResponse);
        return response;
    }
    # Retrieve real-time balance data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function accountsBalanceGet(AccountsBalanceGetRequest payload) returns AccountsGetResponse|error {
        string  path = string `/accounts/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AccountsGetResponse);
        return response;
    }
    # Retrieve identity data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function identityGet(IdentityGetRequest payload) returns IdentityGetResponse|error {
        string  path = string `/identity/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IdentityGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IdentityGetResponse);
        return response;
    }
    # Retrieve Auth data
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function processorAuthGet(ProcessorAuthGetRequest payload) returns ProcessorAuthGetResponse|error {
        string  path = string `/processor/auth/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorAuthGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorAuthGetResponse);
        return response;
    }
    # Create a bank transfer as a processor
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorBankTransferCreate(ProcessorBankTransferCreateRequest payload) returns ProcessorBankTransferCreateResponse|error {
        string  path = string `/processor/bank_transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorBankTransferCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorBankTransferCreateResponse);
        return response;
    }
    # Retrieve Identity data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorIdentityGet(ProcessorIdentityGetRequest payload) returns ProcessorIdentityGetResponse|error {
        string  path = string `/processor/identity/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorIdentityGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorIdentityGetResponse);
        return response;
    }
    # Retrieve Balance data
    #
    # + payload - The real-time balance for the account associated with a given `processor_token`. 
    # + return - OK 
    remote isolated function processorBalanceGet(ProcessorBalanceGetRequest payload) returns ProcessorBalanceGetResponse|error {
        string  path = string `/processor/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorBalanceGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorBalanceGetResponse);
        return response;
    }
    # Update Webhook URL
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemWebhookUpdate(ItemWebhookUpdateRequest payload) returns ItemWebhookUpdateResponse|error {
        string  path = string `/item/webhook/update`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemWebhookUpdateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemWebhookUpdateResponse);
        return response;
    }
    # Invalidate access_token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemAccessTokenInvalidate(ItemAccessTokenInvalidateRequest payload) returns ItemAccessTokenInvalidateResponse|error {
        string  path = string `/item/access_token/invalidate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemAccessTokenInvalidateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemAccessTokenInvalidateResponse);
        return response;
    }
    # Get webhook verification key
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function webhookVerificationKeyGet(WebhookVerificationKeyGetRequest payload) returns WebhookVerificationKeyGetResponse|error {
        string  path = string `/webhook_verification_key/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookVerificationKeyGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WebhookVerificationKeyGetResponse);
        return response;
    }
    # Retrieve Liabilities data
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function liabilitiesGet(LiabilitiesGetRequest payload) returns LiabilitiesGetResponse|error {
        string  path = string `/liabilities/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LiabilitiesGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LiabilitiesGetResponse);
        return response;
    }
    # Create payment recipient
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientCreate(PaymentInitiationRecipientCreateRequest payload) returns PaymentInitiationRecipientCreateResponse|error {
        string  path = string `/payment_initiation/recipient/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationRecipientCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationRecipientCreateResponse);
        return response;
    }
    # Get payment recipient
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientGet(PaymentInitiationRecipientGetRequest payload) returns PaymentInitiationRecipientGetResponse|error {
        string  path = string `/payment_initiation/recipient/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationRecipientGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationRecipientGetResponse);
        return response;
    }
    # List payment recipients
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationRecipientList(PaymentInitiationRecipientListRequest payload) returns PaymentInitiationRecipientListResponse|error {
        string  path = string `/payment_initiation/recipient/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationRecipientListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationRecipientListResponse);
        return response;
    }
    # Create a payment
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentCreate(PaymentInitiationPaymentCreateRequest payload) returns PaymentInitiationPaymentCreateResponse|error {
        string  path = string `/payment_initiation/payment/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationPaymentCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationPaymentCreateResponse);
        return response;
    }
    # Create payment token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function createPaymentToken(PaymentInitiationPaymentTokenCreateRequest payload) returns PaymentInitiationPaymentTokenCreateResponse|error {
        string  path = string `/payment_initiation/payment/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationPaymentTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationPaymentTokenCreateResponse);
        return response;
    }
    # Force a Sandbox Item into an error state
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxItemResetLogin(SandboxItemResetLoginRequest payload) returns SandboxItemResetLoginResponse|error {
        string  path = string `/sandbox/item/reset_login`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxItemResetLoginResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxItemResetLoginResponse);
        return response;
    }
    # Set verification status for Sandbox account
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxItemSetVerificationStatus(SandboxItemSetVerificationStatusRequest payload) returns SandboxItemSetVerificationStatusResponse|error {
        string  path = string `/sandbox/item/set_verification_status`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxItemSetVerificationStatusResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxItemSetVerificationStatusResponse);
        return response;
    }
    # Exchange public token for an access token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemPublicTokenExchange(ItemPublicTokenExchangeRequest payload) returns ItemPublicTokenExchangeResponse|error {
        string  path = string `/item/public_token/exchange`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemPublicTokenExchangeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemPublicTokenExchangeResponse);
        return response;
    }
    # Create public token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemCreatePublicToken(ItemPublicTokenCreateRequest payload) returns ItemPublicTokenCreateResponse|error {
        string  path = string `/item/public_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemPublicTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemPublicTokenCreateResponse);
        return response;
    }
    # Get payment details
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentGet(PaymentInitiationPaymentGetRequest payload) returns PaymentInitiationPaymentGetResponse|error {
        string  path = string `/payment_initiation/payment/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationPaymentGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationPaymentGetResponse);
        return response;
    }
    # List payments
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function paymentInitiationPaymentList(PaymentInitiationPaymentListRequest payload) returns PaymentInitiationPaymentListResponse|error {
        string  path = string `/payment_initiation/payment/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentInitiationPaymentListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentInitiationPaymentListResponse);
        return response;
    }
    # Create an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportCreate(AssetReportCreateRequest payload) returns AssetReportCreateResponse|error {
        string  path = string `/asset_report/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportCreateResponse);
        return response;
    }
    # Refresh an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportRefresh(AssetReportRefreshRequest payload) returns AssetReportRefreshResponse|error {
        string  path = string `/asset_report/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportRefreshResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportRefreshResponse);
        return response;
    }
    # Delete an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportRemove(AssetReportRemoveRequest payload) returns AssetReportRemoveResponse|error {
        string  path = string `/asset_report/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportRemoveResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportRemoveResponse);
        return response;
    }
    # Filter Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportFilter(AssetReportFilterRequest payload) returns AssetReportFilterResponse|error {
        string  path = string `/asset_report/filter`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportFilterResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportFilterResponse);
        return response;
    }
    # Retrieve an Asset Report
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportGet(AssetReportGetRequest payload) returns AssetReportGetResponse|error {
        string  path = string `/asset_report/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportGetResponse);
        return response;
    }
    # Retrieve a PDF Asset Report
    #
    # + payload - Request payload 
    # + return - A PDF of the Asset Report 
    remote isolated function assetReportPdfGet(AssetReportPDFGetRequest payload) returns AssetReportPDFGetResponse|error {
        string  path = string `/asset_report/pdf/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportPDFGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportPDFGetResponse);
        return response;
    }
    # Create Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyCreate(AssetReportAuditCopyCreateRequest payload) returns AssetReportAuditCopyCreateResponse|error {
        string  path = string `/asset_report/audit_copy/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportAuditCopyCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportAuditCopyCreateResponse);
        return response;
    }
    # Remove Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyRemove(AssetReportAuditCopyRemoveRequest payload) returns AssetReportAuditCopyRemoveResponse|error {
        string  path = string `/asset_report/audit_copy/remove`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportAuditCopyRemoveResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportAuditCopyRemoveResponse);
        return response;
    }
    # Get Investment holdings
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function investmentsHoldingsGet(InvestmentsHoldingsGetRequest payload) returns InvestmentsHoldingsGetResponse|error {
        string  path = string `/investments/holdings/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InvestmentsHoldingsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InvestmentsHoldingsGetResponse);
        return response;
    }
    # Get investment transactions
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function investmentsTransactionsGet(InvestmentsTransactionsGetRequest payload) returns InvestmentsTransactionsGetResponse|error {
        string  path = string `/investments/transactions/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InvestmentsTransactionsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InvestmentsTransactionsGetResponse);
        return response;
    }
    # Create processor token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorTokenCreate(ProcessorTokenCreateRequest payload) returns ProcessorTokenCreateResponse|error {
        string  path = string `/processor/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorTokenCreateResponse);
        return response;
    }
    # Create Stripe bank account token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorStripeBankAccountTokenCreate(ProcessorStripeBankAccountTokenCreateRequest payload) returns ProcessorStripeBankAccountTokenCreateResponse|error {
        string  path = string `/processor/stripe/bank_account_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorStripeBankAccountTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorStripeBankAccountTokenCreateResponse);
        return response;
    }
    # Create Apex bank account token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function processorApexProcessorTokenCreate(ProcessorApexProcessorTokenCreateRequest payload) returns ProcessorTokenCreateResponse|error {
        string  path = string `/processor/apex/processor_token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProcessorTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProcessorTokenCreateResponse);
        return response;
    }
    # Create a deposit switch
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchCreate(DepositSwitchCreateRequest payload) returns DepositSwitchCreateResponse|error {
        string  path = string `/deposit_switch/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DepositSwitchCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DepositSwitchCreateResponse);
        return response;
    }
    # Import Item
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function itemImport(ItemImportRequest payload) returns ItemImportResponse|error {
        string  path = string `/item/import`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemImportResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemImportResponse);
        return response;
    }
    # Create a deposit switch token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchTokenCreate(DepositSwitchTokenCreateRequest payload) returns DepositSwitchTokenCreateResponse|error {
        string  path = string `/deposit_switch/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DepositSwitchTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DepositSwitchTokenCreateResponse);
        return response;
    }
    # Create Link Token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function linkTokenCreate(LinkTokenCreateRequest payload) returns LinkTokenCreateResponse|error {
        string  path = string `/link/token/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkTokenCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LinkTokenCreateResponse);
        return response;
    }
    # Get Link Token
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function linkTokenGet(LinkTokenGetRequest payload) returns LinkTokenGetResponse|error {
        string  path = string `/link/token/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkTokenGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LinkTokenGetResponse);
        return response;
    }
    # Retrieve an Asset Report Audit Copy
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function assetReportAuditCopyGet(AssetReportAuditCopyGetRequest payload) returns AssetReportGetResponse|error {
        string  path = string `/asset_report/audit_copy/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetReportGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetReportGetResponse);
        return response;
    }
    # Retrieve a deposit switch
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchGet(DepositSwitchGetRequest payload) returns DepositSwitchGetResponse|error {
        string  path = string `/deposit_switch/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DepositSwitchGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DepositSwitchGetResponse);
        return response;
    }
    # Retrieve a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferGet(TransferGetRequest payload) returns TransferGetResponse|error {
        string  path = string `/transfer/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferGetResponse);
        return response;
    }
    # Retrieve a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferGet(BankTransferGetRequest payload) returns BankTransferGetResponse|error {
        string  path = string `/bank_transfer/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferGetResponse);
        return response;
    }
    # Create a transfer authorization
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferAuthorizationCreate(TransferAuthorizationCreateRequest payload) returns TransferAuthorizationCreateResponse|error {
        string  path = string `/transfer/authorization/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferAuthorizationCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferAuthorizationCreateResponse);
        return response;
    }
    # Create a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferCreate(TransferCreateRequest payload) returns TransferCreateResponse|error {
        string  path = string `/transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferCreateResponse);
        return response;
    }
    # Create a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferCreate(BankTransferCreateRequest payload) returns BankTransferCreateResponse|error {
        string  path = string `/bank_transfer/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferCreateResponse);
        return response;
    }
    # List transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferList(TransferListRequest payload) returns TransferListResponse|error {
        string  path = string `/transfer/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferListResponse);
        return response;
    }
    # List bank transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferList(BankTransferListRequest payload) returns BankTransferListResponse|error {
        string  path = string `/bank_transfer/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferListResponse);
        return response;
    }
    # Cancel a transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferCancel(TransferCancelRequest payload) returns TransferCancelResponse|error {
        string  path = string `/transfer/cancel`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferCancelResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferCancelResponse);
        return response;
    }
    # Cancel a bank transfer
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferCancel(BankTransferCancelRequest payload) returns BankTransferCancelResponse|error {
        string  path = string `/bank_transfer/cancel`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferCancelResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferCancelResponse);
        return response;
    }
    # List transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferEventList(TransferEventListRequest payload) returns TransferEventListResponse|error {
        string  path = string `/transfer/event/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferEventListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferEventListResponse);
        return response;
    }
    # List bank transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferEventList(BankTransferEventListRequest payload) returns BankTransferEventListResponse|error {
        string  path = string `/bank_transfer/event/list`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferEventListResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferEventListResponse);
        return response;
    }
    # Sync transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function transferEventSync(TransferEventSyncRequest payload) returns TransferEventSyncResponse|error {
        string  path = string `/transfer/event/sync`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransferEventSyncResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TransferEventSyncResponse);
        return response;
    }
    # Sync bank transfer events
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferEventSync(BankTransferEventSyncRequest payload) returns BankTransferEventSyncResponse|error {
        string  path = string `/bank_transfer/event/sync`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferEventSyncResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferEventSyncResponse);
        return response;
    }
    # Retrieve a sweep
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferSweepGet(BankTransferSweepGetRequest payload) returns BankTransferSweepGetResponse|error {
        string  path = string `/bank_transfer/sweep/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferSweepGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferSweepGetResponse);
        return response;
    }
    # Get balance of your Bank Transfer account
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferBalanceGet(BankTransferBalanceGetRequest payload) returns BankTransferBalanceGetResponse|error {
        string  path = string `/bank_transfer/balance/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferBalanceGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferBalanceGetResponse);
        return response;
    }
    # Migrate account into Bank Transfers
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function bankTransferMigrateAccount(BankTransferMigrateAccountRequest payload) returns BankTransferMigrateAccountResponse|error {
        string  path = string `/bank_transfer/migrate_account`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransferMigrateAccountResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransferMigrateAccountResponse);
        return response;
    }
    # Simulate a bank transfer event in Sandbox
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxBankTransferSimulate(SandboxBankTransferSimulateRequest payload) returns SandboxBankTransferSimulateResponse|error {
        string  path = string `/sandbox/bank_transfer/simulate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxBankTransferSimulateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxBankTransferSimulateResponse);
        return response;
    }
    # Simulate a transfer event in Sandbox
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxTransferSimulate(SandboxTransferSimulateRequest payload) returns SandboxTransferSimulateResponse|error {
        string  path = string `/sandbox/transfer/simulate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxTransferSimulateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxTransferSimulateResponse);
        return response;
    }
    # Search employer database
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function employersSearch(EmployersSearchRequest payload) returns EmployersSearchResponse|error {
        string  path = string `/employers/search`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmployersSearchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EmployersSearchResponse);
        return response;
    }
    # Create an income verification instance
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationCreate(IncomeVerificationCreateRequest payload) returns IncomeVerificationCreateResponse|error {
        string  path = string `/income/verification/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IncomeVerificationCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IncomeVerificationCreateResponse);
        return response;
    }
    # Retrieve a summary of information derived from income verification
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationSummaryGet(IncomeVerificationSummaryGetRequest payload) returns IncomeVerificationSummaryGetResponse|error {
        string  path = string `/income/verification/summary/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IncomeVerificationSummaryGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IncomeVerificationSummaryGetResponse);
        return response;
    }
    # (Deprecated) Retrieve information from a single paystub used for income verification
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationPaystubGet(IncomeVerificationPaystubGetRequest payload) returns json|error {
        string  path = string `/income/verification/paystub/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieve information from the paystubs used for income verification
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function incomeVerificationPaystubsGet(IncomeVerificationPaystubsGetRequest payload) returns IncomeVerificationPaystubsGetResponse|error {
        string  path = string `/income/verification/paystubs/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IncomeVerificationPaystubsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IncomeVerificationPaystubsGetResponse);
        return response;
    }
    # Download the original documents used for income verification
    #
    # + payload - Request payload 
    # + return - A ZIP file containing the source paystub(s) used as the basis for income verification. 
    remote isolated function incomeVerificationDocumentsDownload(IncomeVerificationDocumentsDownloadRequest payload) returns string|error {
        string  path = string `/income/verification/documents/download`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Refresh an income verification
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function incomeVerificationRefresh(IncomeVerificationRefreshRequest payload) returns IncomeVerificationRefreshResponse|error {
        string  path = string `/income/verification/refresh`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IncomeVerificationRefreshResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IncomeVerificationRefreshResponse);
        return response;
    }
    # Retrieve information from the tax documents used for income verification
    #
    # + payload - Request payload 
    # + return - success 
    remote isolated function incomeVerificationTaxformsGet(IncomeVerificationTaxformsGetRequest payload) returns IncomeVerificationTaxformsGetResponse|error {
        string  path = string `/income/verification/taxforms/get`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IncomeVerificationTaxformsGetResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IncomeVerificationTaxformsGetResponse);
        return response;
    }
    # Create a deposit switch without using Plaid Exchange
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function depositSwitchAltCreate(DepositSwitchAltCreateRequest payload) returns DepositSwitchAltCreateResponse|error {
        string  path = string `/deposit_switch/alt/create`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DepositSwitchAltCreateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DepositSwitchAltCreateResponse);
        return response;
    }
    # Manually fire a Bank Transfer webhook
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxBankTransferFireWebhook(SandboxBankTransferFireWebhookRequest payload) returns SandboxBankTransferFireWebhookResponse|error {
        string  path = string `/sandbox/bank_transfer/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxBankTransferFireWebhookResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxBankTransferFireWebhookResponse);
        return response;
    }
    # Manually fire an Income webhook
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxIncomeFireWebhook(SandboxIncomeFireWebhookRequest payload) returns SandboxIncomeFireWebhookResponse|error {
        string  path = string `/sandbox/income/fire_webhook`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxIncomeFireWebhookResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxIncomeFireWebhookResponse);
        return response;
    }
    # Save the selected accounts when connecting to the Platypus Oauth institution
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function sandboxOauthSelectAccounts(SandboxOauthSelectAccountsRequest payload) returns SandboxOauthSelectAccountsResponse|error {
        string  path = string `/sandbox/oauth/select_accounts`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SandboxOauthSelectAccountsResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SandboxOauthSelectAccountsResponse);
        return response;
    }
    # Evaluate a planned ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalEvaluate(SignalEvaluateRequest payload) returns SignalEvaluateResponse|error {
        string  path = string `/signal/evaluate`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SignalEvaluateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SignalEvaluateResponse);
        return response;
    }
    # Report whether you initiated an ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalDecisionReport(SignalDecisionReportRequest payload) returns SignalDecisionReportResponse|error {
        string  path = string `/signal/decision/report`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SignalDecisionReportResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SignalDecisionReportResponse);
        return response;
    }
    # Report a return for an ACH transaction
    #
    # + payload - Request payload 
    # + return - OK 
    remote isolated function signalReturnReport(SignalReturnReportRequest payload) returns SignalReturnReportResponse|error {
        string  path = string `/signal/return/report`;
        map<any> headerValues = {"PLAID-CLIENT-ID": self.apiKeys["PLAID-CLIENT-ID"], "PLAID-SECRET": self.apiKeys["PLAID-SECRET"], "Plaid-Version": self.apiKeys["Plaid-Version"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SignalReturnReportResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SignalReturnReportResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
