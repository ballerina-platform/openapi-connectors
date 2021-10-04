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
    # To use API you have to sign up and get your own API key. Unify API accounts have sandbox mode and live mode API keys. 
    # To change modes just use the appropriate key to get a live or test object. You can find your API keys on the unify settings of your Apideck app.
    # Your Apideck application_id can also be found on the same page.
    # 
    # Authenticate your API requests by including your test or live secret API key in the request header. 
    # 
    # - Bearer authorization header: `Authorization: Bearer <your-apideck-api-key>`
    # - Application id header: `x-apideck-app-id: <your-apideck-app-id>`
    # 
    # You should use the public keys on the SDKs and the secret keys to authenticate API requests.
    # 
    # **Do not share or include your secret API keys on client side code.** Your API keys carry significant privileges. Please ensure to keep them 100% secure and be sure to not share your secret API keys in areas that are publicly accessible like GitHub.
    # 
    # Learn how to set the Authorization header inside Postman https://learning.postman.com/docs/postman/sending-api-requests/authorization/#api-key
    # 
    # Go to Unify to grab your API KEY https://app.apideck.com/unify/api-keys
    string authorization;
|};

# This is a generated connector from [Apideck Accounting API v5.3.0](https://docs.apideck.com/apis/accounting/reference) OpenAPI specification.
# You can use this API to access all Accounting API endpoints.
@display {label: "Apideck Accounting", iconPath: "resources/apideck.accounting.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Unify API accounts have sandbox mode and live mode API keys. To change modes just use the appropriate key to get a live or test object. 
    # You can find your API keys on the unify settings of your Apideck app.Your Apideck application_id can also be found on the same page.
    # Obtain API keys following [this guide](https://developers.apideck.com/apis/accounting/reference#section/Authorization).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://unify.apideck.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # List Companies
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + cursor - Cursor to start from. You can find cursors for next/previous pages in the meta.cursors property of the response. 
    # + 'limit - Number of records to return 
    # + return - Company 
    remote isolated function companiesAll(string xApideckConsumerId, string xApideckAppId, boolean raw = true, string? xApideckServiceId = (), string? cursor = (), int 'limit = 20) returns GetCompaniesResponse|error {
        string  path = string `/accounting/companies`;
        map<anydata> queryParam = {"raw": raw, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetCompaniesResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetCompaniesResponse);
        return response;
    }
    # Create Company
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + payload - A record of type `Company` which contains details to create company. 
    # + return - Companies 
    remote isolated function companiesAdd(string xApideckConsumerId, string xApideckAppId, Company payload, boolean raw = true, string? xApideckServiceId = ()) returns CreateCompanyResponse|error {
        string  path = string `/accounting/companies`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateCompanyResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateCompanyResponse);
        return response;
    }
    # Get Company
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Companies 
    remote isolated function companiesOne(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns GetCompanyResponse|error {
        string  path = string `/accounting/companies/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetCompanyResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetCompanyResponse);
        return response;
    }
    # Delete Company
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Companies 
    remote isolated function companiesDelete(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns DeleteCompanyResponse|error {
        string  path = string `/accounting/companies/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteCompanyResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteCompanyResponse);
        return response;
    }
    # Update Company
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + payload - A record of type `Company` which contains details to update company. 
    # + return - Companies 
    remote isolated function companiesUpdate(string id, string xApideckConsumerId, string xApideckAppId, Company payload, string? xApideckServiceId = (), boolean raw = true) returns UpdateCompanyResponse|error {
        string  path = string `/accounting/companies/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateCompanyResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateCompanyResponse);
        return response;
    }
    # List Contacts
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + cursor - Cursor to start from. You can find cursors for next/previous pages in the meta.cursors property of the response. 
    # + 'limit - Number of records to return 
    # + return - Contacts 
    remote isolated function contactsAll(string xApideckConsumerId, string xApideckAppId, boolean raw = true, string? xApideckServiceId = (), string? cursor = (), int 'limit = 20) returns GetContactsResponse|error {
        string  path = string `/accounting/contacts`;
        map<anydata> queryParam = {"raw": raw, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetContactsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetContactsResponse);
        return response;
    }
    # Create Contact
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + payload - A record of type `Contact` which contains details to create contact. 
    # + return - Contacts 
    remote isolated function contactsAdd(string xApideckConsumerId, string xApideckAppId, Contact payload, boolean raw = true, string? xApideckServiceId = ()) returns CreateContactResponse|error {
        string  path = string `/accounting/contacts`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateContactResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateContactResponse);
        return response;
    }
    # Get Contact
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Contacts 
    remote isolated function contactsOne(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns GetContactResponse|error {
        string  path = string `/accounting/contacts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetContactResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetContactResponse);
        return response;
    }
    # Delete Contact
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Contacts 
    remote isolated function contactsDelete(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns DeleteContactResponse|error {
        string  path = string `/accounting/contacts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteContactResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteContactResponse);
        return response;
    }
    # Update Contact
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + payload - A record of type `Contact` which contains details to update contact. 
    # + return - Contacts 
    remote isolated function contactsUpdate(string id, string xApideckConsumerId, string xApideckAppId, Contact payload, string? xApideckServiceId = (), boolean raw = true) returns UpdateContactResponse|error {
        string  path = string `/accounting/contacts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateContactResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateContactResponse);
        return response;
    }
    # List Invoices
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + cursor - Cursor to start from. You can find cursors for next/previous pages in the meta.cursors property of the response. 
    # + 'limit - Number of records to return 
    # + return - Invoices 
    remote isolated function invoicesAll(string xApideckConsumerId, string xApideckAppId, boolean raw = true, string? xApideckServiceId = (), string? cursor = (), int 'limit = 20) returns GetInvoicesResponse|error {
        string  path = string `/accounting/invoices`;
        map<anydata> queryParam = {"raw": raw, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetInvoicesResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetInvoicesResponse);
        return response;
    }
    # Create Invoice
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + payload - A record of type `Invoice` which contains details to create invoice. 
    # + return - Invoices 
    remote isolated function invoicesAdd(string xApideckConsumerId, string xApideckAppId, Invoice payload, boolean raw = true, string? xApideckServiceId = ()) returns CreateInvoiceResponse|error {
        string  path = string `/accounting/invoices`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateInvoiceResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateInvoiceResponse);
        return response;
    }
    # Get Invoice
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Invoices 
    remote isolated function invoicesOne(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns GetInvoiceResponse|error {
        string  path = string `/accounting/invoices/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetInvoiceResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetInvoiceResponse);
        return response;
    }
    # Delete Invoice
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - Invoices 
    remote isolated function invoicesDelete(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns DeleteInvoiceResponse|error {
        string  path = string `/accounting/invoices/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteInvoiceResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteInvoiceResponse);
        return response;
    }
    # Update Invoice
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + payload - A record of type `Invoice` which contains details to update invoice. 
    # + return - Invoices 
    remote isolated function invoicesUpdate(string id, string xApideckConsumerId, string xApideckAppId, Invoice payload, string? xApideckServiceId = (), boolean raw = true) returns UpdateInvoiceResponse|error {
        string  path = string `/accounting/invoices/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateInvoiceResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateInvoiceResponse);
        return response;
    }
    # List Ledger Accounts
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + cursor - Cursor to start from. You can find cursors for next/previous pages in the meta.cursors property of the response. 
    # + 'limit - Number of records to return 
    # + return - LedgerAccounts 
    remote isolated function ledgerAccountsAll(string xApideckConsumerId, string xApideckAppId, boolean raw = true, string? xApideckServiceId = (), string? cursor = (), int 'limit = 20) returns GetLedgerAccountsResponse|error {
        string  path = string `/accounting/ledger-accounts`;
        map<anydata> queryParam = {"raw": raw, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLedgerAccountsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLedgerAccountsResponse);
        return response;
    }
    # Create Ledger Account
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + payload - A record of type `LedgerAccount` which contains details to create ledger account. 
    # + return - LedgerAccounts 
    remote isolated function ledgerAccountsAdd(string xApideckConsumerId, string xApideckAppId, LedgerAccount payload, boolean raw = true, string? xApideckServiceId = ()) returns CreateLedgerAccountResponse|error {
        string  path = string `/accounting/ledger-accounts`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateLedgerAccountResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateLedgerAccountResponse);
        return response;
    }
    # Get Ledger Account
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - LedgerAccounts 
    remote isolated function ledgerAccountsOne(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns GetLedgerAccountResponse|error {
        string  path = string `/accounting/ledger-accounts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLedgerAccountResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLedgerAccountResponse);
        return response;
    }
    # Delete Ledger Account
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - LedgerAccounts 
    remote isolated function ledgerAccountsDelete(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns DeleteLedgerAccountResponse|error {
        string  path = string `/accounting/ledger-accounts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteLedgerAccountResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteLedgerAccountResponse);
        return response;
    }
    # Update Ledger Account
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + payload - A record of type `LedgerAccount` which contains details to update ledger account. 
    # + return - LedgerAccounts 
    remote isolated function ledgerAccountsUpdate(string id, string xApideckConsumerId, string xApideckAppId, LedgerAccount payload, string? xApideckServiceId = (), boolean raw = true) returns UpdateLedgerAccountResponse|error {
        string  path = string `/accounting/ledger-accounts/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateLedgerAccountResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateLedgerAccountResponse);
        return response;
    }
    # List Tax Rates
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + cursor - Cursor to start from. You can find cursors for next/previous pages in the meta.cursors property of the response. 
    # + 'limit - Number of records to return 
    # + return - TaxRates 
    remote isolated function taxRatesAll(string xApideckConsumerId, string xApideckAppId, boolean raw = true, string? xApideckServiceId = (), string? cursor = (), int 'limit = 20) returns GetTaxRatesResponse|error {
        string  path = string `/accounting/tax-rates`;
        map<anydata> queryParam = {"raw": raw, "cursor": cursor, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetTaxRatesResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetTaxRatesResponse);
        return response;
    }
    # Create Tax Rate
    #
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + payload - A record of type `TaxRate` which contains details to create tax rate. 
    # + return - TaxRates 
    remote isolated function taxRatesAdd(string xApideckConsumerId, string xApideckAppId, TaxRate payload, boolean raw = true, string? xApideckServiceId = ()) returns CreateTaxRateResponse|error {
        string  path = string `/accounting/tax-rates`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateTaxRateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateTaxRateResponse);
        return response;
    }
    # Get Tax Rate
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - TaxRates 
    remote isolated function taxRatesOne(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns GetTaxRateResponse|error {
        string  path = string `/accounting/tax-rates/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetTaxRateResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetTaxRateResponse);
        return response;
    }
    # Delete Tax Rate
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + return - TaxRates 
    remote isolated function taxRatesDelete(string id, string xApideckConsumerId, string xApideckAppId, string? xApideckServiceId = (), boolean raw = true) returns DeleteTaxRateResponse|error {
        string  path = string `/accounting/tax-rates/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteTaxRateResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteTaxRateResponse);
        return response;
    }
    # Update Tax Rate
    #
    # + id - ID of the record you are acting upon. 
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + raw - Include raw response. Mostly used for debugging purposes 
    # + payload - A record of type `TaxRate` which contains details to update tax rate. 
    # + return - TaxRates 
    remote isolated function taxRatesUpdate(string id, string xApideckConsumerId, string xApideckAppId, TaxRate payload, string? xApideckServiceId = (), boolean raw = true) returns UpdateTaxRateResponse|error {
        string  path = string `/accounting/tax-rates/${id}`;
        map<anydata> queryParam = {"raw": raw};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateTaxRateResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateTaxRateResponse);
        return response;
    }
}
