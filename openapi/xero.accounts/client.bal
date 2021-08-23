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

# Configuration for Xero Accounts connector
#
# + authConfig - Bearer token configuration or OAuth2 refresh token grant configuration
# + secureSocketConfig - Secure socket configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Xero Accounts API v2.14.4](https://developer.xero.com/documentation/api/accounting/overview) OpenAPI specification.
# The Xero Accounting API exposes accounting and related functions of the main Xero application and can be used for a  variety of purposes such as creating transactions like invoices and credit notes, right through to extracting accounting data via our reports endpoint.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/api.xro/2.0") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Retrieves the full chart of accounts
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Accounts array with 0 to n Account
    remote isolated function getAccounts(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns Accounts|error {
        string  path = string `/Accounts`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Accounts response = check self.clientEp-> get(path, accHeaders, targetType = Accounts);
        return response;
    }
    # Creates a new chart of accounts
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Account object in body of request
    # + return - Success - created new Account and return response of type Accounts array with new Account
    remote isolated function createAccount(string xeroTenantId, Account payload) returns Accounts|error {
        string  path = string `/Accounts`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Accounts response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Accounts);
        return response;
    }
    # Retrieves a single chart of accounts by using a unique account Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + return - Success - return response of type Accounts array with one Account
    remote isolated function getAccount(string xeroTenantId, string accountID) returns Accounts|error {
        string  path = string `/Accounts/${accountID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Accounts response = check self.clientEp-> get(path, accHeaders, targetType = Accounts);
        return response;
    }
    # Updates a chart of accounts
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + payload - Request of type Accounts array with one Account
    # + return - Success - update existing Account and return response of type Accounts array with updated Account
    remote isolated function updateAccount(string xeroTenantId, string accountID, Accounts payload) returns Accounts|error {
        string  path = string `/Accounts/${accountID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Accounts response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Accounts);
        return response;
    }
    # Deletes a chart of accounts
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + return - Success - delete existing Account and return response of type Accounts array with deleted Account
    remote isolated function deleteAccount(string xeroTenantId, string accountID) returns Accounts|error {
        string  path = string `/Accounts/${accountID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Accounts response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = Accounts);
        return response;
    }
    # Retrieves attachments for a specific accounts by using a unique account Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function getAccountAttachments(string xeroTenantId, string accountID) returns Attachments|error {
        string  path = string `/Accounts/${accountID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific account using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Account as binary data
    remote isolated function getAccountAttachmentById(string xeroTenantId, string accountID, string attachmentID, string contentType) returns string|error {
        string  path = string `/Accounts/${accountID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves an attachment for a specific account by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Account as binary data
    remote isolated function getAccountAttachmentByFileName(string xeroTenantId, string accountID, string fileName, string contentType) returns string|error {
        string  path = string `/Accounts/${accountID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment on a specific account
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function createAccountAttachmentByFileName(string xeroTenantId, string accountID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Accounts/${accountID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates attachment on a specific account by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + accountID - Unique identifier for Account object
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function updateAccountAttachmentByFileName(string xeroTenantId, string accountID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Accounts/${accountID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves either one or many batch payments for invoices
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type BatchPayments array of BatchPayment objects
    remote isolated function getBatchPayments(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns BatchPayments|error {
        string  path = string `/BatchPayments`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BatchPayments response = check self.clientEp-> get(path, accHeaders, targetType = BatchPayments);
        return response;
    }
    # Creates one or many batch payments for invoices
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - BatchPayments with an array of Payments in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type BatchPayments array of BatchPayment objects
    remote isolated function createBatchPayment(string xeroTenantId, BatchPayments payload, boolean summarizeErrors = false) returns BatchPayments|error {
        string  path = string `/BatchPayments`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchPayments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BatchPayments);
        return response;
    }
    # Retrieves history from a specific batch payment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + batchPaymentID - Unique identifier for BatchPayment
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getBatchPaymentHistory(string xeroTenantId, string batchPaymentID) returns HistoryRecords|error {
        string  path = string `/BatchPayments/${batchPaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific batch payment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + batchPaymentID - Unique identifier for BatchPayment
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createBatchPaymentHistoryRecord(string xeroTenantId, string batchPaymentID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/BatchPayments/${batchPaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves any spent or received money transactions
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - Up to 100 bank transactions will be returned in a single API call with line items details
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type BankTransactions array with 0 to n BankTransaction
    remote isolated function getBankTransactions(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = (), int? unitdp = ()) returns BankTransactions|error {
        string  path = string `/BankTransactions`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BankTransactions response = check self.clientEp-> get(path, accHeaders, targetType = BankTransactions);
        return response;
    }
    # Creates one or more spent or received money transaction
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - BankTransactions with an array of BankTransaction objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type BankTransactions array with new BankTransaction
    remote isolated function createBankTransactions(string xeroTenantId, BankTransactions payload, boolean summarizeErrors = false, int? unitdp = ()) returns BankTransactions|error {
        string  path = string `/BankTransactions`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransactions response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BankTransactions);
        return response;
    }
    # Updates or creates one or more spent or received money transaction
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - BankTransactions with an array of BankTransaction objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type BankTransactions array with new BankTransaction
    remote isolated function updateOrCreateBankTransactions(string xeroTenantId, BankTransactions payload, boolean summarizeErrors = false, int? unitdp = ()) returns BankTransactions|error {
        string  path = string `/BankTransactions`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransactions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransactions);
        return response;
    }
    # Retrieves a single spent or received money transaction by using a unique bank transaction Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type BankTransactions array with a specific BankTransaction
    remote isolated function getBankTransaction(string xeroTenantId, string bankTransactionID, int? unitdp = ()) returns BankTransactions|error {
        string  path = string `/BankTransactions/${bankTransactionID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BankTransactions response = check self.clientEp-> get(path, accHeaders, targetType = BankTransactions);
        return response;
    }
    # Updates a single spent or received money transaction
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + payload - BankTransactions with an array of BankTransaction objects
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type BankTransactions array with updated BankTransaction
    remote isolated function updateBankTransaction(string xeroTenantId, string bankTransactionID, BankTransactions payload, int? unitdp = ()) returns BankTransactions|error {
        string  path = string `/BankTransactions/${bankTransactionID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransactions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BankTransactions);
        return response;
    }
    # Retrieves any attachments from a specific bank transactions
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + return - Success - return response of type Attachments array with 0 to n Attachment
    remote isolated function getBankTransactionAttachments(string xeroTenantId, string bankTransactionID) returns Attachments|error {
        string  path = string `/BankTransactions/${bankTransactionID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves specific attachments from a specific BankTransaction using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for BankTransaction as binary data
    remote isolated function getBankTransactionAttachmentById(string xeroTenantId, string bankTransactionID, string attachmentID, string contentType) returns string|error {
        string  path = string `/BankTransactions/${bankTransactionID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific bank transaction by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for BankTransaction as binary data
    remote isolated function getBankTransactionAttachmentByFileName(string xeroTenantId, string bankTransactionID, string fileName, string contentType) returns string|error {
        string  path = string `/BankTransactions/${bankTransactionID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment for a specific bank transaction by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of Attachments array of Attachment
    remote isolated function createBankTransactionAttachmentByFileName(string xeroTenantId, string bankTransactionID, string fileName, string payload) returns Attachments|error {
        string  path = string `/BankTransactions/${bankTransactionID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment from a specific bank transaction by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of Attachments array of Attachment
    remote isolated function updateBankTransactionAttachmentByFileName(string xeroTenantId, string bankTransactionID, string fileName, string payload) returns Attachments|error {
        string  path = string `/BankTransactions/${bankTransactionID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves history from a specific bank transaction using a unique bank transaction Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getBankTransactionsHistory(string xeroTenantId, string bankTransactionID) returns HistoryRecords|error {
        string  path = string `/BankTransactions/${bankTransactionID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific bank transactions
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransactionID - Xero generated unique identifier for a bank transaction
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createBankTransactionHistoryRecord(string xeroTenantId, string bankTransactionID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/BankTransactions/${bankTransactionID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves all bank transfers
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of BankTransfers array of 0 to N BankTransfer
    remote isolated function getBankTransfers(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns BankTransfers|error {
        string  path = string `/BankTransfers`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BankTransfers response = check self.clientEp-> get(path, accHeaders, targetType = BankTransfers);
        return response;
    }
    # Creates a bank transfer
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - BankTransfers with array of BankTransfer objects in request body
    # + return - Success - return response of BankTransfers array of one BankTransfer
    remote isolated function createBankTransfer(string xeroTenantId, BankTransfers payload) returns BankTransfers|error {
        string  path = string `/BankTransfers`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BankTransfers response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BankTransfers);
        return response;
    }
    # Retrieves specific bank transfers by using a unique bank transfer Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + return - Success - return response of BankTransfers array with one BankTransfer
    remote isolated function getBankTransfer(string xeroTenantId, string bankTransferID) returns BankTransfers|error {
        string  path = string `/BankTransfers/${bankTransferID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BankTransfers response = check self.clientEp-> get(path, accHeaders, targetType = BankTransfers);
        return response;
    }
    # Retrieves attachments from a specific bank transfer
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + return - Success - return response of Attachments array of 0 to N Attachment for a Bank Transfer
    remote isolated function getBankTransferAttachments(string xeroTenantId, string bankTransferID) returns Attachments|error {
        string  path = string `/BankTransfers/${bankTransferID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific bank transfer using a unique attachment ID
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of binary data from the Attachment to a Bank Transfer
    remote isolated function getBankTransferAttachmentById(string xeroTenantId, string bankTransferID, string attachmentID, string contentType) returns string|error {
        string  path = string `/BankTransfers/${bankTransferID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment on a specific bank transfer by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of binary data from the Attachment to a Bank Transfer
    remote isolated function getBankTransferAttachmentByFileName(string xeroTenantId, string bankTransferID, string fileName, string contentType) returns string|error {
        string  path = string `/BankTransfers/${bankTransferID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of Attachments array of 0 to N Attachment for a Bank Transfer
    remote isolated function createBankTransferAttachmentByFileName(string xeroTenantId, string bankTransferID, string fileName, string payload) returns Attachments|error {
        string  path = string `/BankTransfers/${bankTransferID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of Attachments array of 0 to N Attachment for a Bank Transfer
    remote isolated function updateBankTransferAttachmentByFileName(string xeroTenantId, string bankTransferID, string fileName, string payload) returns Attachments|error {
        string  path = string `/BankTransfers/${bankTransferID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves history from a specific bank transfer using a unique bank transfer Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getBankTransferHistory(string xeroTenantId, string bankTransferID) returns HistoryRecords|error {
        string  path = string `/BankTransfers/${bankTransferID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific bank transfer
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + bankTransferID - Xero generated unique identifier for a bank transfer
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createBankTransferHistoryRecord(string xeroTenantId, string bankTransferID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/BankTransfers/${bankTransferID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves all the branding themes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of type BrandingThemes
    remote isolated function getBrandingThemes(string xeroTenantId) returns BrandingThemes|error {
        string  path = string `/BrandingThemes`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BrandingThemes response = check self.clientEp-> get(path, accHeaders, targetType = BrandingThemes);
        return response;
    }
    # Retrieves a specific branding theme using a unique branding theme Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + brandingThemeID - Unique identifier for a Branding Theme
    # + return - Success - return response of type BrandingThemes with one BrandingTheme
    remote isolated function getBrandingTheme(string xeroTenantId, string brandingThemeID) returns BrandingThemes|error {
        string  path = string `/BrandingThemes/${brandingThemeID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BrandingThemes response = check self.clientEp-> get(path, accHeaders, targetType = BrandingThemes);
        return response;
    }
    # Retrieves the payment services for a specific branding theme
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + brandingThemeID - Unique identifier for a Branding Theme
    # + return - Success - return response of type PaymentServices array with 0 to N PaymentService
    remote isolated function getBrandingThemePaymentServices(string xeroTenantId, string brandingThemeID) returns PaymentServices|error {
        string  path = string `/BrandingThemes/${brandingThemeID}/PaymentServices`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PaymentServices response = check self.clientEp-> get(path, accHeaders, targetType = PaymentServices);
        return response;
    }
    # Creates a new custom payment service for a specific branding theme
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + brandingThemeID - Unique identifier for a Branding Theme
    # + payload - PaymentService object in body of request
    # + return - Success - return response of type PaymentServices array with newly created PaymentService
    remote isolated function createBrandingThemePaymentServices(string xeroTenantId, string brandingThemeID, PaymentService payload) returns PaymentServices|error {
        string  path = string `/BrandingThemes/${brandingThemeID}/PaymentServices`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentServices response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PaymentServices);
        return response;
    }
    # Retrieve a list of budgets
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + iDs - Filter by BudgetID. Allows you to retrieve a specific individual budget.
    # + dateTo - Filter by start date
    # + dateFrom - Filter by end date
    # + return - Success - return response of type Budgets array with 0 to N Budgets
    remote isolated function getBudgets(string xeroTenantId, string[]? iDs = (), string? dateTo = (), string? dateFrom = ()) returns Budgets|error {
        string  path = string `/Budgets`;
        map<anydata> queryParam = {"IDs": iDs, "DateTo": dateTo, "DateFrom": dateFrom};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Budgets response = check self.clientEp-> get(path, accHeaders, targetType = Budgets);
        return response;
    }
    # Retrieves a specific budgets, which includes budget lines
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + budgetID - Unique identifier for Budgets
    # + return - Success - return response of type Invoices array with specified Invoices
    remote isolated function getBudget(string xeroTenantId, string budgetID) returns Budgets|error {
        string  path = string `/Budgets/${budgetID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Budgets response = check self.clientEp-> get(path, accHeaders, targetType = Budgets);
        return response;
    }
    # Retrieves all contacts in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + iDs - Filter by a comma separated list of ContactIDs. Allows you to retrieve a specific set of contacts in a single call.
    # + page - e.g. page=1 - Up to 100 contacts will be returned in a single API call.
    # + includeArchived - e.g. includeArchived=true - Contacts with a status of ARCHIVED will be included in the response
    # + summaryOnly - Use summaryOnly=true in GET Contacts and Invoices endpoint to retrieve a smaller version of the response object. This returns only lightweight fields, excluding computation-heavy fields from the response, making the API calls quick and efficient.
    # + return - Success - return response of type Contacts array with 0 to N Contact
    remote isolated function getContacts(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), string[]? iDs = (), int? page = (), boolean? includeArchived = (), boolean summaryOnly = false) returns Contacts|error {
        string  path = string `/Contacts`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "IDs": iDs, "page": page, "includeArchived": includeArchived, "summaryOnly": summaryOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Contacts response = check self.clientEp-> get(path, accHeaders, targetType = Contacts);
        return response;
    }
    # Creates multiple contacts (bulk) in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Contacts with an array of Contact objects to create in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Contacts array with newly created Contact
    remote isolated function createContacts(string xeroTenantId, Contacts payload, boolean summarizeErrors = false) returns Contacts|error {
        string  path = string `/Contacts`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contacts response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Contacts);
        return response;
    }
    # Updates or creates one or more contacts in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Contacts with an array of Contact objects in body
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Contacts array with newly created Contact
    remote isolated function updateOrCreateContacts(string xeroTenantId, Contacts payload, boolean summarizeErrors = false) returns Contacts|error {
        string  path = string `/Contacts`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contacts response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Contacts);
        return response;
    }
    # Retrieves a specific contact by contact number in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactNumber - This field is read only on the Xero contact screen, used to identify contacts in external systems (max length = 50).
    # + return - Success - return response of type Contacts array with a unique Contact
    remote isolated function getContactByContactNumber(string xeroTenantId, string contactNumber) returns Contacts|error {
        string  path = string `/Contacts/${contactNumber}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Contacts response = check self.clientEp-> get(path, accHeaders, targetType = Contacts);
        return response;
    }
    # Retrieves a specific contacts in a Xero organisation using a unique contact Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + return - Success - return response of type Contacts array with a unique Contact
    remote isolated function getContact(string xeroTenantId, string contactID) returns Contacts|error {
        string  path = string `/Contacts/${contactID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Contacts response = check self.clientEp-> get(path, accHeaders, targetType = Contacts);
        return response;
    }
    # Updates a specific contact in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + payload - an array of Contacts containing single Contact object with properties to update
    # + return - Success - return response of type Contacts array with an updated Contact
    remote isolated function updateContact(string xeroTenantId, string contactID, Contacts payload) returns Contacts|error {
        string  path = string `/Contacts/${contactID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contacts response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Contacts);
        return response;
    }
    # Retrieves attachments for a specific contact in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + return - Success - return response of type Attachments array with 0 to N Attachment
    remote isolated function getContactAttachments(string xeroTenantId, string contactID) returns Attachments|error {
        string  path = string `/Contacts/${contactID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific contact using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Contact as binary data
    remote isolated function getContactAttachmentById(string xeroTenantId, string contactID, string attachmentID, string contentType) returns string|error {
        string  path = string `/Contacts/${contactID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific contact by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Contact as binary data
    remote isolated function getContactAttachmentByFileName(string xeroTenantId, string contactID, string fileName, string contentType) returns string|error {
        string  path = string `/Contacts/${contactID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with an newly created Attachment
    remote isolated function createContactAttachmentByFileName(string xeroTenantId, string contactID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Contacts/${contactID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with an updated Attachment
    remote isolated function updateContactAttachmentByFileName(string xeroTenantId, string contactID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Contacts/${contactID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves CIS settings for a specific contact in a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + return - Success - return response of type CISSettings for a specific Contact
    remote isolated function getContactCISSettings(string xeroTenantId, string contactID) returns CISSettings|error {
        string  path = string `/Contacts/${contactID}/CISSettings`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CISSettings response = check self.clientEp-> get(path, accHeaders, targetType = CISSettings);
        return response;
    }
    # Retrieves history records for a specific contact
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getContactHistory(string xeroTenantId, string contactID) returns HistoryRecords|error {
        string  path = string `/Contacts/${contactID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a new history record for a specific contact
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactID - Unique identifier for a Contact
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createContactHistory(string xeroTenantId, string contactID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Contacts/${contactID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves the contact Id and name of each contact group
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Contact Groups array of Contact Group
    remote isolated function getContactGroups(string xeroTenantId, string? 'where = (), string? 'order = ()) returns ContactGroups|error {
        string  path = string `/ContactGroups`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ContactGroups response = check self.clientEp-> get(path, accHeaders, targetType = ContactGroups);
        return response;
    }
    # Creates a contact group
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - ContactGroups with an array of names in request body
    # + return - Success - return response of type Contact Groups array of newly created Contact Group
    remote isolated function createContactGroup(string xeroTenantId, ContactGroups payload) returns ContactGroups|error {
        string  path = string `/ContactGroups`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactGroups response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ContactGroups);
        return response;
    }
    # Retrieves a specific contact group by using a unique contact group Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactGroupID - Unique identifier for a Contact Group
    # + return - Success - return response of type Contact Groups array with a specific Contact Group
    remote isolated function getContactGroup(string xeroTenantId, string contactGroupID) returns ContactGroups|error {
        string  path = string `/ContactGroups/${contactGroupID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ContactGroups response = check self.clientEp-> get(path, accHeaders, targetType = ContactGroups);
        return response;
    }
    # Updates a specific contact group
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactGroupID - Unique identifier for a Contact Group
    # + payload - an array of Contact groups with Name of specific group to update
    # + return - Success - return response of type Contact Groups array of updated Contact Group
    remote isolated function updateContactGroup(string xeroTenantId, string contactGroupID, ContactGroups payload) returns ContactGroups|error {
        string  path = string `/ContactGroups/${contactGroupID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactGroups response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ContactGroups);
        return response;
    }
    # Creates contacts to a specific contact group
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactGroupID - Unique identifier for a Contact Group
    # + payload - Contacts with array of contacts specifying the ContactID to be added to ContactGroup in body of request
    # + return - Success - return response of type Contacts array of added Contacts
    remote isolated function createContactGroupContacts(string xeroTenantId, string contactGroupID, Contacts payload) returns Contacts|error {
        string  path = string `/ContactGroups/${contactGroupID}/Contacts`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contacts response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Contacts);
        return response;
    }
    # Deletes all contacts from a specific contact group
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactGroupID - Unique identifier for a Contact Group
    # + return - Success - return response 204 no content
    remote isolated function deleteContactGroupContacts(string xeroTenantId, string contactGroupID) returns http:Response|error {
        string  path = string `/ContactGroups/${contactGroupID}/Contacts`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Deletes a specific contact from a contact group using a unique contact Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactGroupID - Unique identifier for a Contact Group
    # + contactID - Unique identifier for a Contact
    # + return - Success - return response 204 no content
    remote isolated function deleteContactGroupContact(string xeroTenantId, string contactGroupID, string contactID) returns http:Response|error {
        string  path = string `/ContactGroups/${contactGroupID}/Contacts/${contactID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieves any credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - e.g. page=1 – Up to 100 credit notes will be returned in a single API call with line items shown for each credit note
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Credit Notes array of CreditNote
    remote isolated function getCreditNotes(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = (), int? unitdp = ()) returns CreditNotes|error {
        string  path = string `/CreditNotes`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CreditNotes response = check self.clientEp-> get(path, accHeaders, targetType = CreditNotes);
        return response;
    }
    # Creates a new credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Credit Notes with array of CreditNote object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Credit Notes array of newly created CreditNote
    remote isolated function createCreditNotes(string xeroTenantId, CreditNotes payload, boolean summarizeErrors = false, int? unitdp = ()) returns CreditNotes|error {
        string  path = string `/CreditNotes`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreditNotes response = check self.clientEp->put(path, request, headers = accHeaders, targetType=CreditNotes);
        return response;
    }
    # Updates or creates one or more credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - an array of Credit Notes with a single CreditNote object.
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Credit Notes array of newly created CreditNote
    remote isolated function updateOrCreateCreditNotes(string xeroTenantId, CreditNotes payload, boolean summarizeErrors = false, int? unitdp = ()) returns CreditNotes|error {
        string  path = string `/CreditNotes`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreditNotes response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreditNotes);
        return response;
    }
    # Retrieves a specific credit note using a unique credit note Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Credit Notes array with a unique CreditNote
    remote isolated function getCreditNote(string xeroTenantId, string creditNoteID, int? unitdp = ()) returns CreditNotes|error {
        string  path = string `/CreditNotes/${creditNoteID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CreditNotes response = check self.clientEp-> get(path, accHeaders, targetType = CreditNotes);
        return response;
    }
    # Updates a specific credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + payload - an array of Credit Notes containing credit note details to update
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Credit Notes array with updated CreditNote
    remote isolated function updateCreditNote(string xeroTenantId, string creditNoteID, CreditNotes payload, int? unitdp = ()) returns CreditNotes|error {
        string  path = string `/CreditNotes/${creditNoteID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreditNotes response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreditNotes);
        return response;
    }
    # Retrieves attachments for a specific credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + return - Success - return response of type Attachments array with all Attachment for specific Credit Note
    remote isolated function getCreditNoteAttachments(string xeroTenantId, string creditNoteID) returns Attachments|error {
        string  path = string `/CreditNotes/${creditNoteID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific credit note using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Credit Note as binary data
    remote isolated function getCreditNoteAttachmentById(string xeroTenantId, string creditNoteID, string attachmentID, string contentType) returns string|error {
        string  path = string `/CreditNotes/${creditNoteID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment on a specific credit note by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Credit Note as binary data
    remote isolated function getCreditNoteAttachmentByFileName(string xeroTenantId, string creditNoteID, string fileName, string contentType) returns string|error {
        string  path = string `/CreditNotes/${creditNoteID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment for a specific credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + includeOnline - Allows an attachment to be seen by the end customer within their online invoice
    # + return - Success - return response of type Attachments array with newly created Attachment for specific Credit Note
    remote isolated function createCreditNoteAttachmentByFileName(string xeroTenantId, string creditNoteID, string fileName, string payload, boolean includeOnline = false) returns Attachments|error {
        string  path = string `/CreditNotes/${creditNoteID}/Attachments/${fileName}`;
        map<anydata> queryParam = {"IncludeOnline": includeOnline};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates attachments on a specific credit note by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with updated Attachment for specific Credit Note
    remote isolated function updateCreditNoteAttachmentByFileName(string xeroTenantId, string creditNoteID, string fileName, string payload) returns Attachments|error {
        string  path = string `/CreditNotes/${creditNoteID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves credit notes as PDF files
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + return - Success - return response of binary data from the Attachment to a Credit Note
    remote isolated function getCreditNoteAsPdf(string xeroTenantId, string creditNoteID) returns string|error {
        string  path = string `/CreditNotes/${creditNoteID}/pdf`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates allocation for a specific credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + payload - Allocations with array of Allocation object in body of request.
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Allocations array with newly created Allocation for specific Credit Note
    remote isolated function createCreditNoteAllocation(string xeroTenantId, string creditNoteID, Allocations payload, boolean summarizeErrors = false) returns Allocations|error {
        string  path = string `/CreditNotes/${creditNoteID}/Allocations`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Allocations response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Allocations);
        return response;
    }
    # Retrieves history records of a specific credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getCreditNoteHistory(string xeroTenantId, string creditNoteID) returns HistoryRecords|error {
        string  path = string `/CreditNotes/${creditNoteID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Retrieves history records of a specific credit note
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + creditNoteID - Unique identifier for a Credit Note
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createCreditNoteHistory(string xeroTenantId, string creditNoteID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/CreditNotes/${creditNoteID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves currencies for your Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Currencies array with all Currencies
    remote isolated function getCurrencies(string xeroTenantId, string? 'where = (), string? 'order = ()) returns Currencies|error {
        string  path = string `/Currencies`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Currencies response = check self.clientEp-> get(path, accHeaders, targetType = Currencies);
        return response;
    }
    # Create a new currency for a Xero organisation
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Currency object in the body of request
    # + return - Unsupported - return response incorrect exception, API is not able to create new Currency
    remote isolated function createCurrency(string xeroTenantId, Currency payload) returns Currencies|error {
        string  path = string `/Currencies`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Currencies response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Currencies);
        return response;
    }
    # Retrieves employees used in Xero payrun
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Employees array with all Employee
    remote isolated function getEmployees(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns Employees|error {
        string  path = string `/Employees`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Employees response = check self.clientEp-> get(path, accHeaders, targetType = Employees);
        return response;
    }
    # Creates new employees used in Xero payrun
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Employees with array of Employee object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Employees array with new Employee
    remote isolated function createEmployees(string xeroTenantId, Employees payload, boolean summarizeErrors = false) returns Employees|error {
        string  path = string `/Employees`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Employees response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Employees);
        return response;
    }
    # Creates a single new employees used in Xero payrun
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Employees with array of Employee object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Employees array with new Employee
    remote isolated function updateOrCreateEmployees(string xeroTenantId, Employees payload, boolean summarizeErrors = false) returns Employees|error {
        string  path = string `/Employees`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Employees response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Employees);
        return response;
    }
    # Retrieves a specific employee used in Xero payrun using a unique employee Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + employeeID - Unique identifier for a Employee
    # + return - Success - return response of type Employees array with specified Employee
    remote isolated function getEmployee(string xeroTenantId, string employeeID) returns Employees|error {
        string  path = string `/Employees/${employeeID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Employees response = check self.clientEp-> get(path, accHeaders, targetType = Employees);
        return response;
    }
    # Retrieves expense claims
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type ExpenseClaims array with all ExpenseClaims
    remote isolated function getExpenseClaims(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns ExpenseClaims|error {
        string  path = string `/ExpenseClaims`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExpenseClaims response = check self.clientEp-> get(path, accHeaders, targetType = ExpenseClaims);
        return response;
    }
    # Creates expense claims
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - ExpenseClaims with array of ExpenseClaim object in body of request
    # + return - Success - return response of type ExpenseClaims array with newly created ExpenseClaim
    remote isolated function createExpenseClaims(string xeroTenantId, ExpenseClaims payload) returns ExpenseClaims|error {
        string  path = string `/ExpenseClaims`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExpenseClaims response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ExpenseClaims);
        return response;
    }
    # Retrieves a specific expense claim using a unique expense claim Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + expenseClaimID - Unique identifier for a ExpenseClaim
    # + return - Success - return response of type ExpenseClaims array with specified ExpenseClaim
    remote isolated function getExpenseClaim(string xeroTenantId, string expenseClaimID) returns ExpenseClaims|error {
        string  path = string `/ExpenseClaims/${expenseClaimID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExpenseClaims response = check self.clientEp-> get(path, accHeaders, targetType = ExpenseClaims);
        return response;
    }
    # Updates a specific expense claims
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + expenseClaimID - Unique identifier for a ExpenseClaim
    # + payload - ExpenseClaims with an array of ExpenseClaim objects
    # + return - Success - return response of type ExpenseClaims array with updated ExpenseClaim
    remote isolated function updateExpenseClaim(string xeroTenantId, string expenseClaimID, ExpenseClaims payload) returns ExpenseClaims|error {
        string  path = string `/ExpenseClaims/${expenseClaimID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExpenseClaims response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ExpenseClaims);
        return response;
    }
    # Retrieves history records of a specific expense claim
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + expenseClaimID - Unique identifier for a ExpenseClaim
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getExpenseClaimHistory(string xeroTenantId, string expenseClaimID) returns HistoryRecords|error {
        string  path = string `/ExpenseClaims/${expenseClaimID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific expense claim
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + expenseClaimID - Unique identifier for a ExpenseClaim
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createExpenseClaimHistory(string xeroTenantId, string expenseClaimID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/ExpenseClaims/${expenseClaimID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves sales invoices or purchase bills
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + iDs - Filter by a comma-separated list of InvoicesIDs.
    # + invoiceNumbers - Filter by a comma-separated list of InvoiceNumbers.
    # + contactIDs - Filter by a comma-separated list of ContactIDs.
    # + statuses - Filter by a comma-separated list Statuses. For faster response times we recommend using these explicit parameters instead of passing OR conditions into the Where filter.
    # + page - e.g. page=1 – Up to 100 invoices will be returned in a single API call with line items shown for each invoice
    # + includeArchived - e.g. includeArchived=true - Invoices with a status of ARCHIVED will be included in the response
    # + createdByMyApp - When set to true you'll only retrieve Invoices created by your app
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + summaryOnly - Use summaryOnly=true in GET Contacts and Invoices endpoint to retrieve a smaller version of the response object. This returns only lightweight fields, excluding computation-heavy fields from the response, making the API calls quick and efficient.
    # + return - Success - return response of type Invoices array with all Invoices
    remote isolated function getInvoices(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), string[]? iDs = (), string[]? invoiceNumbers = (), string[]? contactIDs = (), string[]? statuses = (), int? page = (), boolean? includeArchived = (), boolean? createdByMyApp = (), int? unitdp = (), boolean summaryOnly = false) returns Invoices|error {
        string  path = string `/Invoices`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "IDs": iDs, "InvoiceNumbers": invoiceNumbers, "ContactIDs": contactIDs, "Statuses": statuses, "page": page, "includeArchived": includeArchived, "createdByMyApp": createdByMyApp, "unitdp": unitdp, "summaryOnly": summaryOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Invoices response = check self.clientEp-> get(path, accHeaders, targetType = Invoices);
        return response;
    }
    # Creates one or more sales invoices or purchase bills
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Invoices with an array of invoice objects in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Invoices array with newly created Invoice
    remote isolated function createInvoices(string xeroTenantId, Invoices payload, boolean summarizeErrors = false, int? unitdp = ()) returns Invoices|error {
        string  path = string `/Invoices`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Invoices response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Invoices);
        return response;
    }
    # Updates or creates one or more sales invoices or purchase bills
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Invoices with an array of Invoice objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Invoices array with newly created Invoice
    remote isolated function updateOrCreateInvoices(string xeroTenantId, Invoices payload, boolean summarizeErrors = false, int? unitdp = ()) returns Invoices|error {
        string  path = string `/Invoices`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Invoices response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Invoices);
        return response;
    }
    # Retrieves a specific sales invoice or purchase bill using a unique invoice Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Invoices array with specified Invoices
    remote isolated function getInvoice(string xeroTenantId, string invoiceID, int? unitdp = ()) returns Invoices|error {
        string  path = string `/Invoices/${invoiceID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Invoices response = check self.clientEp-> get(path, accHeaders, targetType = Invoices);
        return response;
    }
    # Updates a specific sales invoices or purchase bills
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + payload - Invoices with an array of Invoice objects
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Invoices array with updated Invoice
    remote isolated function updateInvoice(string xeroTenantId, string invoiceID, Invoices payload, int? unitdp = ()) returns Invoices|error {
        string  path = string `/Invoices/${invoiceID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Invoices response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Invoices);
        return response;
    }
    # Retrieves invoices or purchase bills as PDF files
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + return - Success - return response of byte array pdf version of specified Invoices
    remote isolated function getInvoiceAsPdf(string xeroTenantId, string invoiceID) returns string|error {
        string  path = string `/Invoices/${invoiceID}/pdf`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves attachments for a specific invoice or purchase bill
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + return - Success - return response of type Attachments array of Attachments for specified Invoices
    remote isolated function getInvoiceAttachments(string xeroTenantId, string invoiceID) returns Attachments|error {
        string  path = string `/Invoices/${invoiceID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific invoices or purchase bills by using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Invoice as binary data
    remote isolated function getInvoiceAttachmentById(string xeroTenantId, string invoiceID, string attachmentID, string contentType) returns string|error {
        string  path = string `/Invoices/${invoiceID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves an attachment from a specific invoice or purchase bill by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Invoice as binary data
    remote isolated function getInvoiceAttachmentByFileName(string xeroTenantId, string invoiceID, string fileName, string contentType) returns string|error {
        string  path = string `/Invoices/${invoiceID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment for a specific invoice or purchase bill by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + includeOnline - Allows an attachment to be seen by the end customer within their online invoice
    # + return - Success - return response of type Attachments array with newly created Attachment
    remote isolated function createInvoiceAttachmentByFileName(string xeroTenantId, string invoiceID, string fileName, string payload, boolean includeOnline = false) returns Attachments|error {
        string  path = string `/Invoices/${invoiceID}/Attachments/${fileName}`;
        map<anydata> queryParam = {"IncludeOnline": includeOnline};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates an attachment from a specific invoices or purchase bill by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with updated Attachment
    remote isolated function updateInvoiceAttachmentByFileName(string xeroTenantId, string invoiceID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Invoices/${invoiceID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves a URL to an online invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + return - Success - return response of type OnlineInvoice array with one OnlineInvoice
    remote isolated function getOnlineInvoice(string xeroTenantId, string invoiceID) returns OnlineInvoices|error {
        string  path = string `/Invoices/${invoiceID}/OnlineInvoice`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OnlineInvoices response = check self.clientEp-> get(path, accHeaders, targetType = OnlineInvoices);
        return response;
    }
    # Sends a copy of a specific invoice to related contact via email
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + payload - Invoices with an array of Invoice objects
    # + return - Success - return response 204 no content
    remote isolated function emailInvoice(string xeroTenantId, string invoiceID, RequestEmpty payload) returns http:Response|error {
        string  path = string `/Invoices/${invoiceID}/Email`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Retrieves history records for a specific invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getInvoiceHistory(string xeroTenantId, string invoiceID) returns HistoryRecords|error {
        string  path = string `/Invoices/${invoiceID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + invoiceID - Unique identifier for an Invoice
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createInvoiceHistory(string xeroTenantId, string invoiceID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Invoices/${invoiceID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves invoice reminder settings
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of Invoice Reminders
    remote isolated function getInvoiceReminders(string xeroTenantId) returns InvoiceReminders|error {
        string  path = string `/InvoiceReminders/Settings`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InvoiceReminders response = check self.clientEp-> get(path, accHeaders, targetType = InvoiceReminders);
        return response;
    }
    # Retrieves items
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Items array with all Item
    remote isolated function getItems(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? unitdp = ()) returns Items|error {
        string  path = string `/Items`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Items response = check self.clientEp-> get(path, accHeaders, targetType = Items);
        return response;
    }
    # Creates one or more items
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Items with an array of Item objects in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Items array with newly created Item
    remote isolated function createItems(string xeroTenantId, Items payload, boolean summarizeErrors = false, int? unitdp = ()) returns Items|error {
        string  path = string `/Items`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Items response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Items);
        return response;
    }
    # Updates or creates one or more items
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Items with an array of Item objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Items array with newly created Item
    remote isolated function updateOrCreateItems(string xeroTenantId, Items payload, boolean summarizeErrors = false, int? unitdp = ()) returns Items|error {
        string  path = string `/Items`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Items response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Items);
        return response;
    }
    # Retrieves a specific item using a unique item Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + itemID - Unique identifier for an Item
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Items array with specified Item
    remote isolated function getItem(string xeroTenantId, string itemID, int? unitdp = ()) returns Items|error {
        string  path = string `/Items/${itemID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Items response = check self.clientEp-> get(path, accHeaders, targetType = Items);
        return response;
    }
    # Updates a specific item
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + itemID - Unique identifier for an Item
    # + payload - Items with an array of Item objects
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Items array with updated Item
    remote isolated function updateItem(string xeroTenantId, string itemID, Items payload, int? unitdp = ()) returns Items|error {
        string  path = string `/Items/${itemID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Items response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Items);
        return response;
    }
    # Deletes a specific item
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + itemID - Unique identifier for an Item
    # + return - Success - return response 204 no content
    remote isolated function deleteItem(string xeroTenantId, string itemID) returns http:Response|error {
        string  path = string `/Items/${itemID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieves history for a specific item
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + itemID - Unique identifier for an Item
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getItemHistory(string xeroTenantId, string itemID) returns HistoryRecords|error {
        string  path = string `/Items/${itemID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific item
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + itemID - Unique identifier for an Item
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createItemHistory(string xeroTenantId, string itemID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Items/${itemID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves journals
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + offset - Offset by a specified journal number. e.g. journals with a JournalNumber greater than the offset will be returned
    # + paymentsOnly - Filter to retrieve journals on a cash basis. Journals are returned on an accrual basis by default.
    # + return - Success - return response of type Journals array with all Journals
    remote isolated function getJournals(string xeroTenantId, string? ifModifiedSince = (), int? offset = (), boolean? paymentsOnly = ()) returns Journals|error {
        string  path = string `/Journals`;
        map<anydata> queryParam = {"offset": offset, "paymentsOnly": paymentsOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Journals response = check self.clientEp-> get(path, accHeaders, targetType = Journals);
        return response;
    }
    # Retrieves a specific journal using a unique journal Id.
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + journalID - Unique identifier for a Journal
    # + return - Success - return response of type Journals array with specified Journal
    remote isolated function getJournal(string xeroTenantId, string journalID) returns Journals|error {
        string  path = string `/Journals/${journalID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Journals response = check self.clientEp-> get(path, accHeaders, targetType = Journals);
        return response;
    }
    # Retrieves linked transactions (billable expenses)
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + page - Up to 100 linked transactions will be returned in a single API call. Use the page parameter to specify the page to be returned e.g. page=1.
    # + linkedTransactionID - The Xero identifier for an Linked Transaction
    # + sourceTransactionID - Filter by the SourceTransactionID. Get the linked transactions created from a particular ACCPAY invoice
    # + contactID - Filter by the ContactID. Get all the linked transactions that have been assigned to a particular customer.
    # + status - Filter by the combination of ContactID and Status. Get  the linked transactions associated to a  customer and with a status
    # + targetTransactionID - Filter by the TargetTransactionID. Get all the linked transactions allocated to a particular ACCREC invoice
    # + return - Success - return response of type LinkedTransactions array with all LinkedTransaction
    remote isolated function getLinkedTransactions(string xeroTenantId, int? page = (), string? linkedTransactionID = (), string? sourceTransactionID = (), string? contactID = (), string? status = (), string? targetTransactionID = ()) returns LinkedTransactions|error {
        string  path = string `/LinkedTransactions`;
        map<anydata> queryParam = {"page": page, "LinkedTransactionID": linkedTransactionID, "SourceTransactionID": sourceTransactionID, "ContactID": contactID, "Status": status, "TargetTransactionID": targetTransactionID};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinkedTransactions response = check self.clientEp-> get(path, accHeaders, targetType = LinkedTransactions);
        return response;
    }
    # Creates linked transactions (billable expenses)
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - LinkedTransaction object in body of request
    # + return - Success - return response of type LinkedTransactions array with newly created LinkedTransaction
    remote isolated function createLinkedTransaction(string xeroTenantId, LinkedTransaction payload) returns LinkedTransactions|error {
        string  path = string `/LinkedTransactions`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkedTransactions response = check self.clientEp->put(path, request, headers = accHeaders, targetType=LinkedTransactions);
        return response;
    }
    # Retrieves a specific linked transaction (billable expenses) using a unique linked transaction Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + linkedTransactionID - Unique identifier for a LinkedTransaction
    # + return - Success - return response of type LinkedTransactions array with a specified LinkedTransaction
    remote isolated function getLinkedTransaction(string xeroTenantId, string linkedTransactionID) returns LinkedTransactions|error {
        string  path = string `/LinkedTransactions/${linkedTransactionID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinkedTransactions response = check self.clientEp-> get(path, accHeaders, targetType = LinkedTransactions);
        return response;
    }
    # Updates a specific linked transactions (billable expenses)
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + linkedTransactionID - Unique identifier for a LinkedTransaction
    # + payload - LinkedTransactions with an array of LinkedTransaction objects
    # + return - Success - return response of type LinkedTransactions array with updated LinkedTransaction
    remote isolated function updateLinkedTransaction(string xeroTenantId, string linkedTransactionID, LinkedTransactions payload) returns LinkedTransactions|error {
        string  path = string `/LinkedTransactions/${linkedTransactionID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinkedTransactions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LinkedTransactions);
        return response;
    }
    # Deletes a specific linked transactions (billable expenses)
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + linkedTransactionID - Unique identifier for a LinkedTransaction
    # + return - Success - return response 204 no content
    remote isolated function deleteLinkedTransaction(string xeroTenantId, string linkedTransactionID) returns http:Response|error {
        string  path = string `/LinkedTransactions/${linkedTransactionID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieves manual journals
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - e.g. page=1 – Up to 100 manual journals will be returned in a single API call with line items shown for each overpayment
    # + return - Success - return response of type ManualJournals array with a all ManualJournals
    remote isolated function getManualJournals(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = ()) returns ManualJournals|error {
        string  path = string `/ManualJournals`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ManualJournals response = check self.clientEp-> get(path, accHeaders, targetType = ManualJournals);
        return response;
    }
    # Creates one or more manual journals
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - ManualJournals array with ManualJournal object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type ManualJournals array with newly created ManualJournal
    remote isolated function createManualJournals(string xeroTenantId, ManualJournals payload, boolean summarizeErrors = false) returns ManualJournals|error {
        string  path = string `/ManualJournals`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ManualJournals response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ManualJournals);
        return response;
    }
    # Updates or creates a single manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - ManualJournals array with ManualJournal object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type ManualJournals array with newly created ManualJournal
    remote isolated function updateOrCreateManualJournals(string xeroTenantId, ManualJournals payload, boolean summarizeErrors = false) returns ManualJournals|error {
        string  path = string `/ManualJournals`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ManualJournals response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ManualJournals);
        return response;
    }
    # Retrieves a specific manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + return - Success - return response of type ManualJournals array with a specified ManualJournals
    remote isolated function getManualJournal(string xeroTenantId, string manualJournalID) returns ManualJournals|error {
        string  path = string `/ManualJournals/${manualJournalID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ManualJournals response = check self.clientEp-> get(path, accHeaders, targetType = ManualJournals);
        return response;
    }
    # Updates a specific manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + payload - ManualJournals with an array of ManualJournal objects
    # + return - Success - return response of type ManualJournals array with an updated ManualJournal
    remote isolated function updateManualJournal(string xeroTenantId, string manualJournalID, ManualJournals payload) returns ManualJournals|error {
        string  path = string `/ManualJournals/${manualJournalID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ManualJournals response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ManualJournals);
        return response;
    }
    # Retrieves attachment for a specific manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + return - Success - return response of type Attachments array with all Attachments for a ManualJournals
    remote isolated function getManualJournalAttachments(string xeroTenantId, string manualJournalID) returns Attachments|error {
        string  path = string `/ManualJournals/${manualJournalID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Allows you to retrieve a specific attachment from a specific manual journal using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Manual Journal as binary data
    remote isolated function getManualJournalAttachmentById(string xeroTenantId, string manualJournalID, string attachmentID, string contentType) returns string|error {
        string  path = string `/ManualJournals/${manualJournalID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific manual journal by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Manual Journal as binary data
    remote isolated function getManualJournalAttachmentByFileName(string xeroTenantId, string manualJournalID, string fileName, string contentType) returns string|error {
        string  path = string `/ManualJournals/${manualJournalID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates a specific attachment for a specific manual journal by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with a newly created Attachment for a ManualJournals
    remote isolated function createManualJournalAttachmentByFileName(string xeroTenantId, string manualJournalID, string fileName, string payload) returns Attachments|error {
        string  path = string `/ManualJournals/${manualJournalID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment from a specific manual journal by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with an update Attachment for a ManualJournals
    remote isolated function updateManualJournalAttachmentByFileName(string xeroTenantId, string manualJournalID, string fileName, string payload) returns Attachments|error {
        string  path = string `/ManualJournals/${manualJournalID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves history for a specific manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getManualJournalsHistory(string xeroTenantId, string manualJournalID) returns HistoryRecords|error {
        string  path = string `/ManualJournals/${manualJournalID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific manual journal
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + manualJournalID - Unique identifier for a ManualJournal
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createManualJournalHistoryRecord(string xeroTenantId, string manualJournalID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/ManualJournals/${manualJournalID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves Xero organisation details
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of type Organisation array with all Organisation
    remote isolated function getOrganisations(string xeroTenantId) returns Organisations|error {
        string  path = string `/Organisation`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Organisations response = check self.clientEp-> get(path, accHeaders, targetType = Organisations);
        return response;
    }
    # Retrieves a list of the key actions your app has permission to perform in the connected Xero organisation.
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of type Actions array with all key actions
    remote isolated function getOrganisationActions(string xeroTenantId) returns Actions|error {
        string  path = string `/Organisation/Actions`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Actions response = check self.clientEp-> get(path, accHeaders, targetType = Actions);
        return response;
    }
    # Retrieves the CIS settings for the Xero organistaion.
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + organisationID - The unique Xero identifier for an organisation
    # + return - Success - return response of type Organisation array with specified Organisation
    remote isolated function getOrganisationCISSettings(string xeroTenantId, string organisationID) returns CISOrgSettings|error {
        string  path = string `/Organisation/${organisationID}/CISSettings`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CISOrgSettings response = check self.clientEp-> get(path, accHeaders, targetType = CISOrgSettings);
        return response;
    }
    # Retrieves overpayments
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - e.g. page=1 – Up to 100 overpayments will be returned in a single API call with line items shown for each overpayment
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Overpayments array with all Overpayments
    remote isolated function getOverpayments(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = (), int? unitdp = ()) returns Overpayments|error {
        string  path = string `/Overpayments`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Overpayments response = check self.clientEp-> get(path, accHeaders, targetType = Overpayments);
        return response;
    }
    # Retrieves a specific overpayment using a unique overpayment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + overpaymentID - Unique identifier for a Overpayment
    # + return - Success - return response of type Overpayments array with specified Overpayments
    remote isolated function getOverpayment(string xeroTenantId, string overpaymentID) returns Overpayments|error {
        string  path = string `/Overpayments/${overpaymentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Overpayments response = check self.clientEp-> get(path, accHeaders, targetType = Overpayments);
        return response;
    }
    # Creates a single allocation for a specific overpayment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + overpaymentID - Unique identifier for a Overpayment
    # + payload - Allocations array with Allocation object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Allocations array with all Allocation for Overpayments
    remote isolated function createOverpaymentAllocations(string xeroTenantId, string overpaymentID, Allocations payload, boolean summarizeErrors = false) returns Allocations|error {
        string  path = string `/Overpayments/${overpaymentID}/Allocations`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Allocations response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Allocations);
        return response;
    }
    # Retrieves history records of a specific overpayment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + overpaymentID - Unique identifier for a Overpayment
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getOverpaymentHistory(string xeroTenantId, string overpaymentID) returns HistoryRecords|error {
        string  path = string `/Overpayments/${overpaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific overpayment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + overpaymentID - Unique identifier for a Overpayment
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createOverpaymentHistory(string xeroTenantId, string overpaymentID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Overpayments/${overpaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves payments for invoices and credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - Up to 100 payments will be returned in a single API call
    # + return - Success - return response of type Payments array for all Payments
    remote isolated function getPayments(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = ()) returns Payments|error {
        string  path = string `/Payments`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Payments response = check self.clientEp-> get(path, accHeaders, targetType = Payments);
        return response;
    }
    # Creates multiple payments for invoices or credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Payments array with Payment object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Payments array for newly created Payment
    remote isolated function createPayments(string xeroTenantId, Payments payload, boolean summarizeErrors = false) returns Payments|error {
        string  path = string `/Payments`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Payments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Payments);
        return response;
    }
    # Creates a single payment for invoice or credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Request body with a single Payment object
    # + return - Success - return response of type Payments array for newly created Payment
    remote isolated function createPayment(string xeroTenantId, Payment payload) returns Payments|error {
        string  path = string `/Payments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Payments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Payments);
        return response;
    }
    # Retrieves a specific payment for invoices and credit notes using a unique payment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + paymentID - Unique identifier for a Payment
    # + return - Success - return response of type Payments array for specified Payment
    remote isolated function getPayment(string xeroTenantId, string paymentID) returns Payments|error {
        string  path = string `/Payments/${paymentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Payments response = check self.clientEp-> get(path, accHeaders, targetType = Payments);
        return response;
    }
    # Updates a specific payment for invoices and credit notes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + paymentID - Unique identifier for a Payment
    # + payload - Payment detete status
    # + return - Success - return response of type Payments array for updated Payment
    remote isolated function deletePayment(string xeroTenantId, string paymentID, PaymentDelete payload) returns Payments|error {
        string  path = string `/Payments/${paymentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Payments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Payments);
        return response;
    }
    # Retrieves history records of a specific payment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + paymentID - Unique identifier for a Payment
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getPaymentHistory(string xeroTenantId, string paymentID) returns HistoryRecords|error {
        string  path = string `/Payments/${paymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific payment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + paymentID - Unique identifier for a Payment
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createPaymentHistory(string xeroTenantId, string paymentID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Payments/${paymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves payment services
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of type PaymentServices array for all PaymentService
    remote isolated function getPaymentServices(string xeroTenantId) returns PaymentServices|error {
        string  path = string `/PaymentServices`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PaymentServices response = check self.clientEp-> get(path, accHeaders, targetType = PaymentServices);
        return response;
    }
    # Creates a payment service
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - PaymentServices array with PaymentService object in body of request
    # + return - Success - return response of type PaymentServices array for newly created PaymentService
    remote isolated function createPaymentService(string xeroTenantId, PaymentServices payload) returns PaymentServices|error {
        string  path = string `/PaymentServices`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PaymentServices response = check self.clientEp->put(path, request, headers = accHeaders, targetType=PaymentServices);
        return response;
    }
    # Retrieves prepayments
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + page - e.g. page=1 – Up to 100 prepayments will be returned in a single API call with line items shown for each overpayment
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Prepayments array for all Prepayment
    remote isolated function getPrepayments(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? page = (), int? unitdp = ()) returns Prepayments|error {
        string  path = string `/Prepayments`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "page": page, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Prepayments response = check self.clientEp-> get(path, accHeaders, targetType = Prepayments);
        return response;
    }
    # Allows you to retrieve a specified prepayments
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + prepaymentID - Unique identifier for a PrePayment
    # + return - Success - return response of type Prepayments array for a specified Prepayment
    remote isolated function getPrepayment(string xeroTenantId, string prepaymentID) returns Prepayments|error {
        string  path = string `/Prepayments/${prepaymentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Prepayments response = check self.clientEp-> get(path, accHeaders, targetType = Prepayments);
        return response;
    }
    # Allows you to create an Allocation for prepayments
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + prepaymentID - Unique identifier for a PrePayment
    # + payload - Allocations with an array of Allocation object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Allocations array of Allocation for all Prepayment
    remote isolated function createPrepaymentAllocations(string xeroTenantId, string prepaymentID, Allocations payload, boolean summarizeErrors = false) returns Allocations|error {
        string  path = string `/Prepayments/${prepaymentID}/Allocations`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Allocations response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Allocations);
        return response;
    }
    # Retrieves history record for a specific prepayment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + prepaymentID - Unique identifier for a PrePayment
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getPrepaymentHistory(string xeroTenantId, string prepaymentID) returns HistoryRecords|error {
        string  path = string `/Prepayments/${prepaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific prepayment
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + prepaymentID - Unique identifier for a PrePayment
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createPrepaymentHistory(string xeroTenantId, string prepaymentID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Prepayments/${prepaymentID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves purchase orders
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + status - Filter by purchase order status
    # + dateFrom - Filter by purchase order date (e.g. GET https://.../PurchaseOrders?DateFrom=2015-12-01&DateTo=2015-12-31
    # + dateTo - Filter by purchase order date (e.g. GET https://.../PurchaseOrders?DateFrom=2015-12-01&DateTo=2015-12-31
    # + 'order - Order by an any element
    # + page - To specify a page, append the page parameter to the URL e.g. ?page=1. If there are 100 records in the response you will need to check if there is any more data by fetching the next page e.g ?page=2 and continuing this process until no more results are returned.
    # + return - Success - return response of type PurchaseOrder array of all PurchaseOrder
    remote isolated function getPurchaseOrders(string xeroTenantId, string? ifModifiedSince = (), string? status = (), string? dateFrom = (), string? dateTo = (), string? 'order = (), int? page = ()) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders`;
        map<anydata> queryParam = {"Status": status, "DateFrom": dateFrom, "DateTo": dateTo, "order": 'order, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PurchaseOrders response = check self.clientEp-> get(path, accHeaders, targetType = PurchaseOrders);
        return response;
    }
    # Creates one or more purchase orders
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - PurchaseOrders with an array of PurchaseOrder object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type PurchaseOrder array for specified PurchaseOrder
    remote isolated function createPurchaseOrders(string xeroTenantId, PurchaseOrders payload, boolean summarizeErrors = false) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PurchaseOrders response = check self.clientEp->put(path, request, headers = accHeaders, targetType=PurchaseOrders);
        return response;
    }
    # Updates or creates one or more purchase orders
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - PurchaseOrders with an array of PurchaseOrder objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type PurchaseOrder array for specified PurchaseOrder
    remote isolated function updateOrCreatePurchaseOrders(string xeroTenantId, PurchaseOrders payload, boolean summarizeErrors = false) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PurchaseOrders response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PurchaseOrders);
        return response;
    }
    # Retrieves specific purchase order as PDF files using a unique purchase order Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + return - Success - return response of byte array pdf version of specified Purchase Orders
    remote isolated function getPurchaseOrderAsPdf(string xeroTenantId, string purchaseOrderID) returns string|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/pdf`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific purchase order using a unique purchase order Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + return - Success - return response of type PurchaseOrder array for specified PurchaseOrder
    remote isolated function getPurchaseOrder(string xeroTenantId, string purchaseOrderID) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PurchaseOrders response = check self.clientEp-> get(path, accHeaders, targetType = PurchaseOrders);
        return response;
    }
    # Updates a specific purchase order
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + payload - PurchaseOrders with an array of PurchaseOrder objects
    # + return - Success - return response of type PurchaseOrder array for updated PurchaseOrder
    remote isolated function updatePurchaseOrder(string xeroTenantId, string purchaseOrderID, PurchaseOrders payload) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PurchaseOrders response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PurchaseOrders);
        return response;
    }
    # Retrieves a specific purchase order using purchase order number
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderNumber - Unique identifier for a PurchaseOrder
    # + return - Success - return response of type PurchaseOrder array for specified PurchaseOrder
    remote isolated function getPurchaseOrderByNumber(string xeroTenantId, string purchaseOrderNumber) returns PurchaseOrders|error {
        string  path = string `/PurchaseOrders/${purchaseOrderNumber}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PurchaseOrders response = check self.clientEp-> get(path, accHeaders, targetType = PurchaseOrders);
        return response;
    }
    # Retrieves history for a specific purchase order
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getPurchaseOrderHistory(string xeroTenantId, string purchaseOrderID) returns HistoryRecords|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific purchase orders
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createPurchaseOrderHistory(string xeroTenantId, string purchaseOrderID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves attachments for a specific purchase order
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + return - Success - return response of type Attachments array of Purchase Orders
    remote isolated function getPurchaseOrderAttachments(string xeroTenantId, string purchaseOrderID) returns Attachments|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves specific attachment for a specific purchase order using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Account as binary data
    remote isolated function getPurchaseOrderAttachmentById(string xeroTenantId, string purchaseOrderID, string attachmentID, string contentType) returns string|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment for a specific purchase order by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Purchase Order as binary data
    remote isolated function getPurchaseOrderAttachmentByFileName(string xeroTenantId, string purchaseOrderID, string fileName, string contentType) returns string|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates attachment for a specific purchase order
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function createPurchaseOrderAttachmentByFileName(string xeroTenantId, string purchaseOrderID, string fileName, string payload) returns Attachments|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment for a specific purchase order by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + purchaseOrderID - Unique identifier for an Purchase Order
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function updatePurchaseOrderAttachmentByFileName(string xeroTenantId, string purchaseOrderID, string fileName, string payload) returns Attachments|error {
        string  path = string `/PurchaseOrders/${purchaseOrderID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves sales quotes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + dateFrom - Filter for quotes after a particular date
    # + dateTo - Filter for quotes before a particular date
    # + expiryDateFrom - Filter for quotes expiring after a particular date
    # + expiryDateTo - Filter for quotes before a particular date
    # + contactID - Filter for quotes belonging to a particular contact
    # + status - Filter for quotes of a particular Status
    # + page - e.g. page=1 – Up to 100 Quotes will be returned in a single API call with line items shown for each quote
    # + 'order - Order by an any element
    # + quoteNumber - Filter by quote number (e.g. GET https://.../Quotes?QuoteNumber=QU-0001)
    # + return - Success - return response of type quotes array with all quotes
    remote isolated function getQuotes(string xeroTenantId, string? ifModifiedSince = (), string? dateFrom = (), string? dateTo = (), string? expiryDateFrom = (), string? expiryDateTo = (), string? contactID = (), string? status = (), int? page = (), string? 'order = (), string? quoteNumber = ()) returns Quotes|error {
        string  path = string `/Quotes`;
        map<anydata> queryParam = {"DateFrom": dateFrom, "DateTo": dateTo, "ExpiryDateFrom": expiryDateFrom, "ExpiryDateTo": expiryDateTo, "ContactID": contactID, "Status": status, "page": page, "order": 'order, "QuoteNumber": quoteNumber};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Quotes response = check self.clientEp-> get(path, accHeaders, targetType = Quotes);
        return response;
    }
    # Create one or more quotes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Quotes with an array of Quote object in body of request
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Quotes with array with newly created Quote
    remote isolated function createQuotes(string xeroTenantId, Quotes payload, boolean summarizeErrors = false) returns Quotes|error {
        string  path = string `/Quotes`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Quotes response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Quotes);
        return response;
    }
    # Updates or creates one or more quotes
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Quotes with an array of Quote objects
    # + summarizeErrors - If false return 200 OK and mix of successfully created objects and any with validation errors
    # + return - Success - return response of type Quotes array with updated or created Quote
    remote isolated function updateOrCreateQuotes(string xeroTenantId, Quotes payload, boolean summarizeErrors = false) returns Quotes|error {
        string  path = string `/Quotes`;
        map<anydata> queryParam = {"summarizeErrors": summarizeErrors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Quotes response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Quotes);
        return response;
    }
    # Retrieves a specific quote using a unique quote Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + return - Success - return response of type Quotes array with specified Quote
    remote isolated function getQuote(string xeroTenantId, string quoteID) returns Quotes|error {
        string  path = string `/Quotes/${quoteID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Quotes response = check self.clientEp-> get(path, accHeaders, targetType = Quotes);
        return response;
    }
    # Updates a specific quote
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + payload - Quotes with an array of Quote objects
    # + return - Success - return response of type Quotes array with updated Quote
    remote isolated function updateQuote(string xeroTenantId, string quoteID, Quotes payload) returns Quotes|error {
        string  path = string `/Quotes/${quoteID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Quotes response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Quotes);
        return response;
    }
    # Retrieves history records of a specific quote
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getQuoteHistory(string xeroTenantId, string quoteID) returns HistoryRecords|error {
        string  path = string `/Quotes/${quoteID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific quote
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createQuoteHistory(string xeroTenantId, string quoteID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Quotes/${quoteID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves a specific quote as a PDF file using a unique quote Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + return - Success - return response of byte array pdf version of specified Quotes
    remote isolated function getQuoteAsPdf(string xeroTenantId, string quoteID) returns string|error {
        string  path = string `/Quotes/${quoteID}/pdf`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves attachments for a specific quote
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function getQuoteAttachments(string xeroTenantId, string quoteID) returns Attachments|error {
        string  path = string `/Quotes/${quoteID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific quote using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Quote as binary data
    remote isolated function getQuoteAttachmentById(string xeroTenantId, string quoteID, string attachmentID, string contentType) returns string|error {
        string  path = string `/Quotes/${quoteID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific quote by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Quote as binary data
    remote isolated function getQuoteAttachmentByFileName(string xeroTenantId, string quoteID, string fileName, string contentType) returns string|error {
        string  path = string `/Quotes/${quoteID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates attachment for a specific quote
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function createQuoteAttachmentByFileName(string xeroTenantId, string quoteID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Quotes/${quoteID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment from a specific quote by filename
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + quoteID - Unique identifier for an Quote
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array of Attachment
    remote isolated function updateQuoteAttachmentByFileName(string xeroTenantId, string quoteID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Quotes/${quoteID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves draft expense claim receipts for any user
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Receipts array for all Receipt
    remote isolated function getReceipts(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = (), int? unitdp = ()) returns Receipts|error {
        string  path = string `/Receipts`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Receipts response = check self.clientEp-> get(path, accHeaders, targetType = Receipts);
        return response;
    }
    # Creates draft expense claim receipts for any user
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Receipts with an array of Receipt object in body of request
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Receipts array for newly created Receipt
    remote isolated function createReceipt(string xeroTenantId, Receipts payload, int? unitdp = ()) returns Receipts|error {
        string  path = string `/Receipts`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Receipts response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Receipts);
        return response;
    }
    # Retrieves a specific draft expense claim receipt by using a unique receipt Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Receipts array for a specified Receipt
    remote isolated function getReceipt(string xeroTenantId, string receiptID, int? unitdp = ()) returns Receipts|error {
        string  path = string `/Receipts/${receiptID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Receipts response = check self.clientEp-> get(path, accHeaders, targetType = Receipts);
        return response;
    }
    # Updates a specific draft expense claim receipts
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + payload - Receipts with an array of Receipt objects
    # + unitdp - e.g. unitdp=4 – (Unit Decimal Places) You can opt in to use four decimal places for unit amounts
    # + return - Success - return response of type Receipts array for updated Receipt
    remote isolated function updateReceipt(string xeroTenantId, string receiptID, Receipts payload, int? unitdp = ()) returns Receipts|error {
        string  path = string `/Receipts/${receiptID}`;
        map<anydata> queryParam = {"unitdp": unitdp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Receipts response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Receipts);
        return response;
    }
    # Retrieves attachments for a specific expense claim receipt
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + return - Success - return response of type Attachments array of Attachments for a specified Receipt
    remote isolated function getReceiptAttachments(string xeroTenantId, string receiptID) returns Attachments|error {
        string  path = string `/Receipts/${receiptID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachments from a specific expense claim receipts by using a unique attachment Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Receipt as binary data
    remote isolated function getReceiptAttachmentById(string xeroTenantId, string receiptID, string attachmentID, string contentType) returns string|error {
        string  path = string `/Receipts/${receiptID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific expense claim receipts by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Receipt as binary data
    remote isolated function getReceiptAttachmentByFileName(string xeroTenantId, string receiptID, string fileName, string contentType) returns string|error {
        string  path = string `/Receipts/${receiptID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment on a specific expense claim receipts by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with newly created Attachment for a specified Receipt
    remote isolated function createReceiptAttachmentByFileName(string xeroTenantId, string receiptID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Receipts/${receiptID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment on a specific expense claim receipts by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with updated Attachment for a specified Receipt
    remote isolated function updateReceiptAttachmentByFileName(string xeroTenantId, string receiptID, string fileName, string payload) returns Attachments|error {
        string  path = string `/Receipts/${receiptID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves a history record for a specific receipt
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getReceiptHistory(string xeroTenantId, string receiptID) returns HistoryRecords|error {
        string  path = string `/Receipts/${receiptID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a history record for a specific receipt
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + receiptID - Unique identifier for a Receipt
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createReceiptHistory(string xeroTenantId, string receiptID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/Receipts/${receiptID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieves repeating invoices
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Repeating Invoices array for all Repeating Invoice
    remote isolated function getRepeatingInvoices(string xeroTenantId, string? 'where = (), string? 'order = ()) returns RepeatingInvoices|error {
        string  path = string `/RepeatingInvoices`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RepeatingInvoices response = check self.clientEp-> get(path, accHeaders, targetType = RepeatingInvoices);
        return response;
    }
    # Retrieves a specific repeating invoice by using a unique repeating invoice Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + return - Success - return response of type Repeating Invoices array with a specified Repeating Invoice
    remote isolated function getRepeatingInvoice(string xeroTenantId, string repeatingInvoiceID) returns RepeatingInvoices|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RepeatingInvoices response = check self.clientEp-> get(path, accHeaders, targetType = RepeatingInvoices);
        return response;
    }
    # Retrieves attachments from a specific repeating invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + return - Success - return response of type Attachments array with all Attachments for a specified Repeating Invoice
    remote isolated function getRepeatingInvoiceAttachments(string xeroTenantId, string repeatingInvoiceID) returns Attachments|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/Attachments`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Attachments response = check self.clientEp-> get(path, accHeaders, targetType = Attachments);
        return response;
    }
    # Retrieves a specific attachment from a specific repeating invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + attachmentID - Unique identifier for Attachment object
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Repeating Invoice as binary data
    remote isolated function getRepeatingInvoiceAttachmentById(string xeroTenantId, string repeatingInvoiceID, string attachmentID, string contentType) returns string|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/Attachments/${attachmentID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Retrieves a specific attachment from a specific repeating invoices by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + fileName - Name of the attachment
    # + contentType - The mime type of the attachment file you are retrieving i.e image/jpg, application/pdf
    # + return - Success - return response of attachment for Repeating Invoice as binary data
    remote isolated function getRepeatingInvoiceAttachmentByFileName(string xeroTenantId, string repeatingInvoiceID, string fileName, string contentType) returns string|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "contentType": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Creates an attachment from a specific repeating invoices by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with updated Attachment for a specified Repeating Invoice
    remote isolated function createRepeatingInvoiceAttachmentByFileName(string xeroTenantId, string repeatingInvoiceID, string fileName, string payload) returns Attachments|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Updates a specific attachment from a specific repeating invoices by file name
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + fileName - Name of the attachment
    # + payload - Byte array of file in body of request
    # + return - Success - return response of type Attachments array with specified Attachment for a specified Repeating Invoice
    remote isolated function updateRepeatingInvoiceAttachmentByFileName(string xeroTenantId, string repeatingInvoiceID, string fileName, string payload) returns Attachments|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/Attachments/${fileName}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Attachments response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Attachments);
        return response;
    }
    # Retrieves history record for a specific repeating invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + return - Success - return response of HistoryRecords array of 0 to N HistoryRecord
    remote isolated function getRepeatingInvoiceHistory(string xeroTenantId, string repeatingInvoiceID) returns HistoryRecords|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryRecords response = check self.clientEp-> get(path, accHeaders, targetType = HistoryRecords);
        return response;
    }
    # Creates a  history record for a specific repeating invoice
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + repeatingInvoiceID - Unique identifier for a Repeating Invoice
    # + payload - HistoryRecords containing an array of HistoryRecord objects in body of request
    # + return - Success - return response of type HistoryRecords array of HistoryRecord objects
    remote isolated function createRepeatingInvoiceHistory(string xeroTenantId, string repeatingInvoiceID, HistoryRecords payload) returns HistoryRecords|error {
        string  path = string `/RepeatingInvoices/${repeatingInvoiceID}/History`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryRecords response = check self.clientEp->put(path, request, headers = accHeaders, targetType=HistoryRecords);
        return response;
    }
    # Retrieve reports for 1099
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + reportYear - The year of the 1099 report
    # + return - Success - return response of type Reports
    remote isolated function getReportTenNinetyNine(string xeroTenantId, string? reportYear = ()) returns Reports|error {
        string  path = string `/Reports/TenNinetyNine`;
        map<anydata> queryParam = {"reportYear": reportYear};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Reports response = check self.clientEp-> get(path, accHeaders, targetType = Reports);
        return response;
    }
    # Retrieves report for aged payables by contact
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactId - Unique identifier for a Contact
    # + date - The date of the Aged Payables By Contact report
    # + fromDate - filter by the from date of the report e.g. 2021-02-01
    # + toDate - filter by the to date of the report e.g. 2021-02-28
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportAgedPayablesByContact(string xeroTenantId, string contactId, string? date = (), string? fromDate = (), string? toDate = ()) returns ReportWithRows|error {
        string  path = string `/Reports/AgedPayablesByContact`;
        map<anydata> queryParam = {"contactId": contactId, "date": date, "fromDate": fromDate, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for aged receivables by contact
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + contactId - Unique identifier for a Contact
    # + date - The date of the Aged Receivables By Contact report
    # + fromDate - filter by the from date of the report e.g. 2021-02-01
    # + toDate - filter by the to date of the report e.g. 2021-02-28
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportAgedReceivablesByContact(string xeroTenantId, string contactId, string? date = (), string? fromDate = (), string? toDate = ()) returns ReportWithRows|error {
        string  path = string `/Reports/AgedReceivablesByContact`;
        map<anydata> queryParam = {"contactId": contactId, "date": date, "fromDate": fromDate, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for balancesheet
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + date - The date of the Balance Sheet report
    # + periods - The number of periods for the Balance Sheet report
    # + timeframe - The period size to compare to (MONTH, QUARTER, YEAR)
    # + trackingOptionID1 - The tracking option 1 for the Balance Sheet report
    # + trackingOptionID2 - The tracking option 2 for the Balance Sheet report
    # + standardLayout - The standard layout boolean for the Balance Sheet report
    # + paymentsOnly - return a cash basis for the Balance Sheet report
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportBalanceSheet(string xeroTenantId, string? date = (), int? periods = (), string? timeframe = (), string? trackingOptionID1 = (), string? trackingOptionID2 = (), boolean? standardLayout = (), boolean? paymentsOnly = ()) returns ReportWithRows|error {
        string  path = string `/Reports/BalanceSheet`;
        map<anydata> queryParam = {"date": date, "periods": periods, "timeframe": timeframe, "trackingOptionID1": trackingOptionID1, "trackingOptionID2": trackingOptionID2, "standardLayout": standardLayout, "paymentsOnly": paymentsOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for bank summary
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + fromDate - filter by the from date of the report e.g. 2021-02-01
    # + toDate - filter by the to date of the report e.g. 2021-02-28
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportBankSummary(string xeroTenantId, string? fromDate = (), string? toDate = ()) returns ReportWithRows|error {
        string  path = string `/Reports/BankSummary`;
        map<anydata> queryParam = {"fromDate": fromDate, "toDate": toDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves a specific report using a unique ReportID
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + reportID - Unique identifier for a Report
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportFromId(string xeroTenantId, string reportID) returns ReportWithRows|error {
        string  path = string `/Reports/${reportID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for budget summary
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + date - The date for the Bank Summary report e.g. 2018-03-31
    # + periods - The number of periods to compare (integer between 1 and 12)
    # + timeframe - The period size to compare to (1=month, 3=quarter, 12=year)
    # + return - success- return a Report with Rows object
    remote isolated function getReportBudgetSummary(string xeroTenantId, string? date = (), int? periods = (), int? timeframe = ()) returns ReportWithRows|error {
        string  path = string `/Reports/BudgetSummary`;
        map<anydata> queryParam = {"date": date, "periods": periods, "timeframe": timeframe};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for executive summary
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + date - The date for the Bank Summary report e.g. 2018-03-31
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportExecutiveSummary(string xeroTenantId, string? date = ()) returns ReportWithRows|error {
        string  path = string `/Reports/ExecutiveSummary`;
        map<anydata> queryParam = {"date": date};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves a list of the organistaions unique reports that require a uuid to fetch
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportsList(string xeroTenantId) returns ReportWithRows|error {
        string  path = string `/Reports`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for profit and loss
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + fromDate - filter by the from date of the report e.g. 2021-02-01
    # + toDate - filter by the to date of the report e.g. 2021-02-28
    # + periods - The number of periods to compare (integer between 1 and 12)
    # + timeframe - The period size to compare to (MONTH, QUARTER, YEAR)
    # + trackingCategoryID - The trackingCategory 1 for the ProfitAndLoss report
    # + trackingCategoryID2 - The trackingCategory 2 for the ProfitAndLoss report
    # + trackingOptionID - The tracking option 1 for the ProfitAndLoss report
    # + trackingOptionID2 - The tracking option 2 for the ProfitAndLoss report
    # + standardLayout - Return the standard layout for the ProfitAndLoss report
    # + paymentsOnly - Return cash only basis for the ProfitAndLoss report
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportProfitAndLoss(string xeroTenantId, string? fromDate = (), string? toDate = (), int? periods = (), string? timeframe = (), string? trackingCategoryID = (), string? trackingCategoryID2 = (), string? trackingOptionID = (), string? trackingOptionID2 = (), boolean? standardLayout = (), boolean? paymentsOnly = ()) returns ReportWithRows|error {
        string  path = string `/Reports/ProfitAndLoss`;
        map<anydata> queryParam = {"fromDate": fromDate, "toDate": toDate, "periods": periods, "timeframe": timeframe, "trackingCategoryID": trackingCategoryID, "trackingCategoryID2": trackingCategoryID2, "trackingOptionID": trackingOptionID, "trackingOptionID2": trackingOptionID2, "standardLayout": standardLayout, "paymentsOnly": paymentsOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Retrieves report for trial balance
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + date - The date for the Trial Balance report e.g. 2018-03-31
    # + paymentsOnly - Return cash only basis for the Trial Balance report
    # + return - Success - return response of type ReportWithRows
    remote isolated function getReportTrialBalance(string xeroTenantId, string? date = (), boolean? paymentsOnly = ()) returns ReportWithRows|error {
        string  path = string `/Reports/TrialBalance`;
        map<anydata> queryParam = {"date": date, "paymentsOnly": paymentsOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportWithRows response = check self.clientEp-> get(path, accHeaders, targetType = ReportWithRows);
        return response;
    }
    # Sets the chart of accounts, the conversion date and conversion balances
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Object including an accounts array, a conversion balances array and a conversion date object in body of request
    # + return - Success - returns a summary of the chart of accounts updates
    remote isolated function postSetup(string xeroTenantId, Setup payload) returns ImportSummaryObject|error {
        string  path = string `/Setup`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ImportSummaryObject response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ImportSummaryObject);
        return response;
    }
    # Retrieves tax rates
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + taxType - Filter by tax type
    # + return - Success - return response of type TaxRates array with TaxRates
    remote isolated function getTaxRates(string xeroTenantId, string? 'where = (), string? 'order = (), string? taxType = ()) returns TaxRates|error {
        string  path = string `/TaxRates`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "TaxType": taxType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TaxRates response = check self.clientEp-> get(path, accHeaders, targetType = TaxRates);
        return response;
    }
    # Creates one or more tax rates
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - TaxRates array with TaxRate object in body of request
    # + return - Success - return response of type TaxRates array newly created TaxRate
    remote isolated function createTaxRates(string xeroTenantId, TaxRates payload) returns TaxRates|error {
        string  path = string `/TaxRates`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaxRates response = check self.clientEp->put(path, request, headers = accHeaders, targetType=TaxRates);
        return response;
    }
    # Updates tax rates
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - TaxRates with an array of TaxRate objects
    # + return - Success - return response of type TaxRates array updated TaxRate
    remote isolated function updateTaxRate(string xeroTenantId, TaxRates payload) returns TaxRates|error {
        string  path = string `/TaxRates`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaxRates response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TaxRates);
        return response;
    }
    # Retrieves tracking categories and options
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + includeArchived - e.g. includeArchived=true - Categories and options with a status of ARCHIVED will be included in the response
    # + return - Success - return response of type TrackingCategories array of TrackingCategory
    remote isolated function getTrackingCategories(string xeroTenantId, string? 'where = (), string? 'order = (), boolean? includeArchived = ()) returns TrackingCategories|error {
        string  path = string `/TrackingCategories`;
        map<anydata> queryParam = {"where": 'where, "order": 'order, "includeArchived": includeArchived};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackingCategories response = check self.clientEp-> get(path, accHeaders, targetType = TrackingCategories);
        return response;
    }
    # Create tracking categories
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - TrackingCategory object in body of request
    # + return - Success - return response of type TrackingCategories array of newly created TrackingCategory
    remote isolated function createTrackingCategory(string xeroTenantId, TrackingCategory payload) returns TrackingCategories|error {
        string  path = string `/TrackingCategories`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrackingCategories response = check self.clientEp->put(path, request, headers = accHeaders, targetType=TrackingCategories);
        return response;
    }
    # Retrieves specific tracking categories and options using a unique tracking category Id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + return - Success - return response of type TrackingCategories array of specified TrackingCategory
    remote isolated function getTrackingCategory(string xeroTenantId, string trackingCategoryID) returns TrackingCategories|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackingCategories response = check self.clientEp-> get(path, accHeaders, targetType = TrackingCategories);
        return response;
    }
    # Updates a specific tracking category
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + payload - TrackingCategories with an array of TrackingCategory objects
    # + return - Success - return response of type TrackingCategories array of updated TrackingCategory
    remote isolated function updateTrackingCategory(string xeroTenantId, string trackingCategoryID, TrackingCategory payload) returns TrackingCategories|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrackingCategories response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TrackingCategories);
        return response;
    }
    # Deletes a specific tracking category
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + return - Success - return response of type TrackingCategories array of deleted TrackingCategory
    remote isolated function deleteTrackingCategory(string xeroTenantId, string trackingCategoryID) returns TrackingCategories|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        TrackingCategories response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = TrackingCategories);
        return response;
    }
    # Creates options for a specific tracking category
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + payload - TrackingOption object in body of request
    # + return - Success - return response of type TrackingOptions array of options for a specified category
    remote isolated function createTrackingOptions(string xeroTenantId, string trackingCategoryID, TrackingOption payload) returns TrackingOptions|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}/Options`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrackingOptions response = check self.clientEp->put(path, request, headers = accHeaders, targetType=TrackingOptions);
        return response;
    }
    # Updates a specific option for a specific tracking category
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + trackingOptionID - Unique identifier for a Tracking Option
    # + payload - TrackingOptios with an array of TrackingOption objects
    # + return - Success - return response of type TrackingOptions array of options for a specified category
    remote isolated function updateTrackingOptions(string xeroTenantId, string trackingCategoryID, string trackingOptionID, TrackingOption payload) returns TrackingOptions|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}/Options/${trackingOptionID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrackingOptions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TrackingOptions);
        return response;
    }
    # Deletes a specific option for a specific tracking category
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + trackingCategoryID - Unique identifier for a TrackingCategory
    # + trackingOptionID - Unique identifier for a Tracking Option
    # + return - Success - return response of type TrackingOptions array of remaining options for a specified category
    remote isolated function deleteTrackingOptions(string xeroTenantId, string trackingCategoryID, string trackingOptionID) returns TrackingOptions|error {
        string  path = string `/TrackingCategories/${trackingCategoryID}/Options/${trackingOptionID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        TrackingOptions response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = TrackingOptions);
        return response;
    }
    # Retrieves users
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + ifModifiedSince - Only records created or modified since this timestamp will be returned
    # + 'where - Filter by an any element
    # + 'order - Order by an any element
    # + return - Success - return response of type Users array of all User
    remote isolated function getUsers(string xeroTenantId, string? ifModifiedSince = (), string? 'where = (), string? 'order = ()) returns Users|error {
        string  path = string `/Users`;
        map<anydata> queryParam = {"where": 'where, "order": 'order};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId, "If-Modified-Since": ifModifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Users response = check self.clientEp-> get(path, accHeaders, targetType = Users);
        return response;
    }
    # Retrieves a specific user
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + userID - Unique identifier for a User
    # + return - Success - return response of type Users array of specified User
    remote isolated function getUser(string xeroTenantId, string userID) returns Users|error {
        string  path = string `/Users/${userID}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Users response = check self.clientEp-> get(path, accHeaders, targetType = Users);
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
