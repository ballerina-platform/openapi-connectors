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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-API-KEY`
    string xApiKey;
|};

# This is a generated connector for [IRIS Residuals API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Populate your data warehouse programmatically through this Residuals API and interact with your monthly residuals income calculations, line items, and user compensation data.
# Line items give you control with the ability to add income or expense calculations that are outside of any residual reports.
# Receive instant notifications when new residual reports are published or when line items are added.
@display {label: "IRIS Residuals", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get a list of merchants
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of merchants by the field value 
    # + sortDir - Direction of sorting 
    # + group - Filter merchants by a group name 
    # + processor - Filter merchants by a processor name 
    # + datasource - Filter merchants by a data source name 
    # + mid - Filter merchants by a partial merchant number 
    # + name - Filter merchants by a partial merchant name 
    # + vim - Filter merchants by a merchant vim field 
    # + active - Filter merchants by a merchant active field 
    # + status - Filter merchants by a merchant status field 
    # + dateFilter - Filter merchants by a merchant specific date field 
    # + startDate - Start date for date_filter filter in format ISO 8601 for created and modified properties (**Please note that `+` sign should be encoded to `%2B`**), for others properties you should use simple date format (Y-m-d). 
    # + endDate - End date for date_filter filter in format ISO 8601 for created and modified properties (**Please note that `+` sign should be encoded to `%2B`**), for others properties you should use simple date format (Y-m-d) 
    # + return - A JSON array of merchants 
    remote isolated function getMerchants(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? group = (), string? processor = (), string? datasource = (), string? mid = (), string? name = (), string? vim = (), string? active = (), string? status = (), string? dateFilter = (), string? startDate = (), string? endDate = ()) returns InlineResponse200|error {
        string resourcePath = string `/merchants`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "group": group, "processor": processor, "datasource": datasource, "mid": mid, "name": name, "vim": vim, "active": active, "status": status, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get detailed merchant information
    #
    # + merchantNumber - Merchant number 
    # + return - Detailed merchant account information 
    remote isolated function getMerchantInformation(int merchantNumber) returns InlineResponse2001|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an existing merchant
    #
    # + merchantNumber - Merchant number 
    # + payload - Merchant changes (send only fields you want to change) 
    # + return - Merchant has been updated successfully 
    remote isolated function updateMerchantInformation(int merchantNumber, MerchantsMerchantnumberBody payload) returns InlineResponse2002|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2002 response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of deposits records and totals
    #
    # + merchantNumber - Merchant number 
    # + year - Start deposits year 
    # + month - Start deposits month 
    # + day - Start deposits day. 
    # + endDate - Filter deposits by a date in format Y-m-d. Should be no more than 90 days from the start date. 
    # + return - A list of deposits 
    remote isolated function getDepositRecords(int merchantNumber, int year, int month, int day, string? endDate = ()) returns InlineResponse2003|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/deposits/${getEncodedUri(year)}/${getEncodedUri(month)}/${getEncodedUri(day)}`;
        map<anydata> queryParam = {"end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of batches and transactions
    #
    # + merchantNumber - Merchant number 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + startDate - Filter batches by a date (Y-m-d) 
    # + endDate - Filter batches by a date (Y-m-d) 
    # + return - A list of batches and transactions 
    remote isolated function getBatches(int merchantNumber, int? page = (), int? perPage = (), string? startDate = (), string? endDate = ()) returns InlineResponse2004|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/transactions`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of chargeback cases
    #
    # + merchantNumber - Merchant number 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + startDate - Filter batches by a date (Y-m-d) 
    # + endDate - Filter batches by a date (Y-m-d) 
    # + return - A list of chargeback cases 
    remote isolated function getChargebacks(int merchantNumber, int? page = (), int? perPage = (), string? startDate = (), string? endDate = ()) returns InlineResponse2005|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get detailed chargeback case information
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Chargeback detail information 
    remote isolated function getChargebackCaseInformation(int merchantNumber, string caseNumber) returns ChargebackReplyResponse|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks/${getEncodedUri(caseNumber)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackReplyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reply To Chargeback Case - Dispute Chargeback Case
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case ID 
    # + return - Reply was successfully processed 
    remote isolated function disputeChargeback(int merchantNumber, string caseNumber, ChargebackReplyDisputeRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks/${getEncodedUri(caseNumber)}/dispute_reverse`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Chargeback Case - Credit Issued
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToChargebackCaseCreditIssued(int merchantNumber, string caseNumber, ChargebackReplyCreditIssuedRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks/${getEncodedUri(caseNumber)}/credit_issued`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Chargeback Case - Accept Chargeback
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToChargebackCaseAcceptChargeback(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks/${getEncodedUri(caseNumber)}/accept`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of retrieval cases
    #
    # + merchantNumber - Merchant number 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + startDate - Filter batches by a date (Y-m-d) 
    # + endDate - Filter batches by a date (Y-m-d) 
    # + return - A list of retrieval cases 
    remote isolated function getRetrievalCases(int merchantNumber, int? page = (), int? perPage = (), string? startDate = (), string? endDate = ()) returns InlineResponse2007|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get detailed retrieval case information
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - A list of retrieval cases 
    remote isolated function getDetailedRetrievalCaseInformation(int merchantNumber, string caseNumber) returns RetrievalsReplyResponse|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalsReplyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Retrieval Response
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Merchant has been updated successfully 
    remote isolated function replyToRetrievalCaseRetrievalResponse(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/response`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Retrieval Response with Signature
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseRetrievalResponseWithSignature(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/response_with_signature`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Unable to Fulfill Retrieval Case Request
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseUnableToFulfillRetrievalCaseRequest(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/unable_to_fulfill_request`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Unable to Locate Retrieval Case
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseUnableToLocateRetrievalCase(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/unable_to_locate_retrieval`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval - Credit Issued
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCreditIssued(int merchantNumber, string caseNumber, RetrievalReplyCreditIssuedRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/credit_issued`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Imprint and Signature
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseImprintAndSignature(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/imprint_and_signature`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Responding by Other Means
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseRespondingByOtherMeans(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/responding_by_other_means`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Add User Notes/Images
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseAddUserNotesImages(int merchantNumber, int caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/retrievals/${getEncodedUri(caseNumber)}/add_notes_images`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of statements
    #
    # + merchantNumber - Merchant number 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of statements 
    remote isolated function getStatements(int merchantNumber, int? page = (), int? perPage = ()) returns InlineResponse2008|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/statements`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2008 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a statement
    #
    # + merchantNumber - Merchant number 
    # + statementId - Statement Id 
    # + return - Statement file 
    remote isolated function downloadStatement(int merchantNumber, int statementId) returns string|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/statements/${getEncodedUri(statementId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload an attachment to a chargeback or retrieval dispute case
    #
    # + filename - File name for validation 
    # + return - Document 
    remote isolated function uploadAttachment(string filename) returns InlineResponse2009|error {
        string resourcePath = string `/merchants/files`;
        map<anydata> queryParam = {"filename": filename};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download chargeback case files
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + fileId - File Id (leave empty to get all case files) 
    # + return - Files 
    remote isolated function downloadChargebackCaseFiles(int merchantNumber, int caseNumber, int fileId) returns DisputeFile[]|error {
        string resourcePath = string `/merchants/${getEncodedUri(merchantNumber)}/chargebacks/${getEncodedUri(caseNumber)}/files/${getEncodedUri(fileId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DisputeFile[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get residuals summary data
    #
    # + year - Residuals year 
    # + month - Residuals month 
    # + processor - Get residuals summary only for specific processor 
    # + group - Get residuals summary only for specific group 
    # + agent - Get residuals summary only for specific user agent 
    # + search - Search query 
    # + hideNullMerchants - Flag for hiding inactive merchants (true by default) 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of totals 
    remote isolated function getResidualsSummaryData(int year, int month, int? processor = (), int? group = (), int? agent = (), string? search = (), boolean? hideNullMerchants = (), int? page = (), int? perPage = ()) returns InlineResponse20010|error {
        string resourcePath = string `/api/v1/residuals/reports/summary/${getEncodedUri(year)}/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"processor": processor, "group": group, "agent": agent, "search": search, "hide_null_merchants": hideNullMerchants, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get residuals summary with merchant rows
    #
    # + processorId - Processor ID 
    # + year - Residuals year 
    # + month - Residuals month 
    # + group - Get residuals summary only for specific group 
    # + agent - Get residuals summary only for specific user agent 
    # + search - Search query 
    # + hideNullMerchants - Flag for hiding inactive merchants (true by default) 
    # + template - Flag for applying user templates (true by default) 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of rows 
    remote isolated function getResiduals(int processorId, int year, int month, int? group = (), int? agent = (), string? search = (), boolean? hideNullMerchants = (), boolean? template = (), int? page = (), int? perPage = ()) returns InlineResponse20011|error {
        string resourcePath = string `/api/v1/residuals/reports/summary/rows/${getEncodedUri(processorId)}/${getEncodedUri(year)}/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"group": group, "agent": agent, "search": search, "hide_null_merchants": hideNullMerchants, "template": template, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20011 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get residuals details with merchant rows
    #
    # + processorId - Processor ID 
    # + year - Residuals year 
    # + month - Residuals month 
    # + group - Get residuals summary only for specific group 
    # + agent - Get residuals summary only for specific user agent 
    # + search - Search query 
    # + hideNullMerchants - Flag for hiding inactive merchants (true by default) 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of rows 
    remote isolated function getResidualsDetailsWithMerchantRows(int processorId, int year, int month, int? group = (), int? agent = (), string? search = (), boolean? hideNullMerchants = (), int? page = (), int? perPage = ()) returns InlineResponse20012|error {
        string resourcePath = string `/api/v1/residuals/reports/details/${getEncodedUri(processorId)}/${getEncodedUri(year)}/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"group": group, "agent": agent, "search": search, "hide_null_merchants": hideNullMerchants, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20012 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get residuals line items
    #
    # + year - Line Item year 
    # + month - Line Item month 
    # + created - Filter line items by a date (Y-m-d) 
    # + dba - DBA 
    # + username - Username 
    # + userId - User ID 
    # + description - Description 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of rows 
    remote isolated function getResidualsLineItems(int year, int month, string? created = (), string? dba = (), string? username = (), int? userId = (), string? description = (), int? page = (), int? perPage = ()) returns InlineResponse20013|error {
        string resourcePath = string `/api/v1/residuals/lineitems/${getEncodedUri(year)}/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"created": created, "dba": dba, "username": username, "user_id": userId, "description": description, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20013 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get residuals templates
    #
    # + name - Filter templates by name 
    # + revision - Filter templates by revision 
    # + creator - Filter templates by creator 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of rows 
    remote isolated function getResidualsTemplates(string? name = (), string? revision = (), int? creator = (), int? page = (), int? perPage = ()) returns InlineResponse20014|error {
        string resourcePath = string `/api/v1/residuals/templates/`;
        map<anydata> queryParam = {"name": name, "revision": revision, "creator": creator, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20014 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of users with assigned residuals templates
    #
    # + year - Residuals year 
    # + month - Residuals month 
    # + user - Filter templates by user 
    # + processor - Filter templates by processor 
    # + group - Filter templates by group 
    # + 'class - Filter templates by user class 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A JSON array of rows 
    remote isolated function getUsersWithAssignedResidualsTemplates(int year, int month, int? user = (), int? processor = (), int? group = (), int? 'class = (), int? page = (), int? perPage = ()) returns InlineResponse20015|error {
        string resourcePath = string `/api/v1/residuals/templates/assigned/${getEncodedUri(year)}/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"user": user, "processor": processor, "group": group, "class": 'class, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20015 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of leads
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of leads by the field value 
    # + sortDir - Direction of sorting 
    # + group - Filter leads by a group id 
    # + mid - Filter leads by a merchant id 
    # + campaign - Filter leads by a campaign id 
    # + 'source - Filter leads by a source id 
    # + status - Filter leads by a status id 
    # + category - Filter leads by a status category id 
    # + user - Filter leads by a user id 
    # + dateFilter - Filtering leads by a date range depends on this filter 
    # + startDate - Filter leads by a date in ISO 8601 format (Y-m-d\TH:i:sP) (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - Filter leads by a date in ISO 8601 format (Y-m-d\TH:i:sP) (**Please note that `+` sign should be encoded to `%2B`**) 
    # + email - Filter leads by a email 
    # + return - A JSON array of leads 
    remote isolated function getLeads(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", int? group = (), int? mid = (), int? campaign = (), int? 'source = (), int? status = (), int? category = (), int? user = (), string? dateFilter = (), string? startDate = (), string? endDate = (), string? email = ()) returns InlineResponse20016|error {
        string resourcePath = string `/leads`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "group": group, "mid": mid, "campaign": campaign, "source": 'source, "status": status, "category": category, "user": user, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead
    #
    # + payload - Lead details 
    # + return - Lead has been created successfully 
    remote isolated function createLead(LeadsBody payload) returns InlineResponse20017|error {
        string resourcePath = string `/leads`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20017 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get detailed lead information
    #
    # + leadId - Lead Id 
    # + return - Detailed lead information 
    remote isolated function getDetailedLeadInformation(int leadId) returns InlineResponse20018|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20018 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead
    #
    # + leadId - Lead Id 
    # + payload - Lead changes (send only fields you want to change) 
    # + return - Lead has been updated successfully 
    remote isolated function updateLead(int leadId, LeadsLeadidBody payload) returns InlineResponse20019|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20019 response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete record from a lead record set
    #
    # + leadId - Lead Id 
    # + catId - Record category ID 
    # + recordId - Record ID 
    # + return - The record has been deleted successfully 
    remote isolated function deleteRecordFromALeadRecordSet(int leadId, int catId, int recordId) returns InlineResponse20020|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/records/${getEncodedUri(catId)}/${getEncodedUri(recordId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a list of available lead fields
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available fields 
    remote isolated function getAvailableLeadFields(int? page = (), int? perPage = ()) returns InlineResponse20021|error {
        string resourcePath = string `/leads/fields`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20021 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new lead field
    #
    # + payload - LeadField data 
    # + return - Created field 
    remote isolated function createNewLeadField(LeadsFieldsBody payload) returns LeadField|error {
        string resourcePath = string `/leads/fields`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadField response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a lead field
    #
    # + fieldId - Field Id 
    # + return - Get a lead field 
    remote isolated function getLeadField(int fieldId) returns LeadField|error {
        string resourcePath = string `/leads/fields/${getEncodedUri(fieldId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadField response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead field
    #
    # + fieldId - Field Id 
    # + payload - LeadField data 
    # + return - Updated field attributes 
    remote isolated function updateLeadField(int fieldId, FieldsFieldidBody payload) returns LeadField|error {
        string resourcePath = string `/leads/fields/${getEncodedUri(fieldId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadField response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Update a lead field order position
    #
    # + fieldId - Field Id 
    # + payload - LeadFieldOrder data 
    # + return - Updated Lead field order position 
    remote isolated function updateLeadFieldOrderPosition(int fieldId, LeadFieldOrder payload) returns InlineResponse20022|error {
        string resourcePath = string `/leads/fields/${getEncodedUri(fieldId)}/order`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20022 response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of all lead field tabs
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of all lead field tabs 
    remote isolated function getAllLeadFieldTabs(int? page = (), int? perPage = ()) returns InlineResponse20023|error {
        string resourcePath = string `/leads/fields/tabs`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20023 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead field tab
    #
    # + payload - LeadFieldTab data 
    # + return - Create a lead field tab 
    remote isolated function createLeadFieldTab(LeadFieldTab payload) returns LeadFieldTab|error {
        string resourcePath = string `/leads/fields/tabs`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadFieldTab response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + return - Lead field tab 
    remote isolated function getLeadFieldTab(int tabId) returns LeadFieldTab|error {
        string resourcePath = string `/leads/fields/tabs/${getEncodedUri(tabId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadFieldTab response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + payload - LeadFieldTab data 
    # + return - Updated lead field tab 
    remote isolated function updateLeadFieldTab(int tabId, LeadFieldTab payload) returns LeadFieldTab|error {
        string resourcePath = string `/leads/fields/tabs/${getEncodedUri(tabId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadFieldTab response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get pricing templates
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of pricing templates 
    remote isolated function getPricingTemplates(int? page = (), int? perPage = ()) returns InlineResponse20024|error {
        string resourcePath = string `/leads/pricing_templates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20024 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get lead notes
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead notes 
    remote isolated function getLeadNotes(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20025|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/notes`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20025 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead note
    #
    # + leadId - Lead Id 
    # + payload - Create a lead note 
    # + return - Note has been added successfully 
    remote isolated function createLeadNote(int leadId, LeadidNotesBody payload) returns InlineResponse20026|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/notes`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20026 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get lead appointments
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + setFor - Filter by the user for who appointment was created 
    # + setBy - Filter by the user for who have created an appointment 
    # + modifiedBy - Filter by the user for who have modified an appointment 
    # + confirmedBy - Filter by the user for who have confirmed an appointment 
    # + rescheduledBy - Filter by the user for who have rescheduled an appointment 
    # + seenBy - Filter by the user for who have mark an appointment as seen 
    # + rescheduledCount - Filter by the count of rescheduling 
    # + done - Filter by the done flag 
    # + perPage - Count of records per page 
    # + sortBy - Sort appointments by columns 
    # + sortDir - Sort direction 
    # + dateFilter - Filtering appointments by a date range depends on this filter 
    # + startDate - Filter appointments by a date in format Y-m-d 
    # + endDate - Filter leads by a date in format Y-m-d 
    # + return - A list of lead appointments 
    remote isolated function getLeadAppointments(int leadId, int? page = (), int? setFor = (), int? setBy = (), int? modifiedBy = (), int? confirmedBy = (), int? rescheduledBy = (), int? seenBy = (), int? rescheduledCount = (), boolean? done = (), int? perPage = (), string? sortBy = (), string? sortDir = (), string? dateFilter = (), string? startDate = (), string? endDate = ()) returns InlineResponse20027|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/appointments`;
        map<anydata> queryParam = {"page": page, "set_for": setFor, "set_by": setBy, "modified_by": modifiedBy, "confirmed_by": confirmedBy, "rescheduled_by": rescheduledBy, "seen_by": seenBy, "rescheduled_count": rescheduledCount, "done": done, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead appointment
    #
    # + leadId - Lead Id 
    # + payload - Create a lead appointment 
    # + return - Appointment has been created successfully 
    remote isolated function createLeadAppointment(int leadId, LeadidAppointmentsBody payload) returns InlineResponse20028|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/appointments`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20028 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Populate PDF Document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + return - Document populated successfully. 
    remote isolated function populatePdfDocument(int leadId, int applicationId) returns InlineResponse20029|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/applications/${getEncodedUri(applicationId)}/populate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse20029 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get lead tasks
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead tasks 
    remote isolated function getLeadTasks(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20030|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/tasks`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20030 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead task
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - Task has been created successfully 
    remote isolated function createLeadTask(int leadId, LeadidTasksBody payload) returns InlineResponse20031|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/tasks`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20031 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of assigned users
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of assigned users 
    remote isolated function getAssignedUsers(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20032|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign a user
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - User has been assigned successfully 
    remote isolated function assignUser(int leadId, LeadidUsersBody payload) returns InlineResponse20033|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/users`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20033 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign a user from a lead
    #
    # + leadId - Lead Id 
    # + userId - User Id 
    # + return - User has been unassigned successfully 
    remote isolated function unassignUserFromLead(int leadId, int userId) returns InlineResponse20034|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20034 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a list of available documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available documents 
    remote isolated function getAvailableDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20035|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/documents`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20035 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload a document
    #
    # + leadId - Lead Id 
    # + tab - Tab Id 
    # + label - Label Id 
    # + filename - File name 
    # + payload - Payload data 
    # + return - Document has been uploaded successfully 
    remote isolated function uploadDocument(int leadId, int tab, int label, string filename, byte[] payload) returns string|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/documents`;
        map<anydata> queryParam = {"tab": tab, "label": label, "filename": filename};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of available document labels
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available labels 
    remote isolated function getAvailableDocumentLabels(int? page = (), int? perPage = ()) returns InlineResponse20036|error {
        string resourcePath = string `/leads/file_labels`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20036 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a document
    #
    # + leadId - Lead Id 
    # + documentId - Document Id 
    # + return - Document 
    remote isolated function downoladDocument(int leadId, int documentId) returns string|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/documents/${getEncodedUri(documentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function generateEsignatureDocument(int leadId, int applicationId, ApplicationidGenerateBody payload) returns InlineResponse20037|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/signatures/${getEncodedUri(applicationId)}/generate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20037 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send an e-signature document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + return - New E-Sign application hash and link to signature 
    remote isolated function sendEsignatureDocument(int leadId, int applicationId, ApplicationidSendBody payload) returns InlineResponse20038|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/signatures/${getEncodedUri(applicationId)}/send`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20038 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download an e-signature document
    #
    # + applicationId - Application Id 
    # + return - E-Sign document 
    remote isolated function downloadEsignatureDocument(int applicationId) returns string|error {
        string resourcePath = string `/leads/signatures/${getEncodedUri(applicationId)}/download`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead e-signatures documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list with all lead e-signatures 
    remote isolated function getAllLeadEsignaturesDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20039|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/signatures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20039 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send an email to lead with template
    #
    # + leadId - Lead Id 
    # + templateId - Template Id 
    # + payload - Payload data 
    # + return - Result of proccess 
    remote isolated function sendEmailToLeadWithTemplate(int leadId, int templateId, EmailsTemplateidBody payload) returns InlineResponse20040|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/emails/${getEncodedUri(templateId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20040 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of email templates
    #
    # + return - A list of available email templates 
    remote isolated function getEmailTemplates() returns InlineResponse20041|error {
        string resourcePath = string `/leads/emails/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20041 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a mailbox email attachment
    #
    # + leadId - Lead Id 
    # + emailId - Email Id 
    # + attachmentId - Attachment Id 
    # + return - Document 
    remote isolated function downloadMailboxEmailAttachment(int leadId, int emailId, int attachmentId) returns string|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/mailbox/${getEncodedUri(emailId)}/attachment/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send an SMS to lead with selected SMS template
    #
    # + leadId - Lead Id 
    # + templateId - Template Id 
    # + payload - Payload data 
    # + return - Result of proccess 
    remote isolated function sendSmsToLeadWithSelectedSmsTemplate(int leadId, int templateId, SmsTemplateidBody payload) returns InlineResponse20042|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/sms/${getEncodedUri(templateId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20042 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get list of SMS templates
    #
    # + return - A list of available SMS templates 
    remote isolated function getSmsTemplates() returns InlineResponse20043|error {
        string resourcePath = string `/leads/sms/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20043 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead campaign activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadCampaignActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20044|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/campaign`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20044 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead deletion activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDeletionActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20045|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/deletion`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20045 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead duplicate activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDuplicateActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20046|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/duplicates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20046 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead links activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadLinksActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20047|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/links`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20047 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead source activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadSourceActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20048|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/source`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20048 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead status activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadStatusActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20049|error {
        string resourcePath = string `/leads/${getEncodedUri(leadId)}/activity/status`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20049 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available applications
    #
    # + return - A list of available applications 
    remote isolated function getAvailableApplications() returns BriefApplicationInfo[]|error {
        string resourcePath = string `/leads/applications`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BriefApplicationInfo[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available application field mappings
    #
    # + appId - Application Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available application field mappings 
    remote isolated function getAvailableApplicationFieldMappings(int appId, int? page = (), int? perPage = ()) returns InlineResponse20050|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20050 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new application field mapping
    #
    # + appId - Application Id 
    # + return - Created new application field mapping 
    remote isolated function createNewApplicationFieldMapping(int appId, ApplicationField payload) returns ApplicationField|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationField response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get an application field mapping list
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Application field mapping 
    remote isolated function getApplicationFieldMappingList(int appId, int mapId) returns ApplicationField|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApplicationField response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Updated application field mapping 
    remote isolated function deleteApplicationFieldMapping(int appId, int mapId) returns InlineResponse20051|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20051 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update an application field mapping
    #
    # + appId - Application Id 
    # + mapId - Mapping Id 
    # + return - Updated application field mapping 
    remote isolated function updateApplicationFieldMapping(int appId, int mapId, ApplicationField payload) returns ApplicationField|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings/${getEncodedUri(mapId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationField response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of available campaigns
    #
    # + return - A list of available campaigns 
    remote isolated function getAvailableCampaigns() returns InlineResponse20052|error {
        string resourcePath = string `/leads/campaigns`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20052 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available groups
    #
    # + status - Status Id 
    # + return - A list of available groups 
    remote isolated function getAvailableGroups(int? status = ()) returns InlineResponse20053|error {
        string resourcePath = string `/leads/groups`;
        map<anydata> queryParam = {"status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20053 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available sources
    #
    # + return - A list of available sources 
    remote isolated function getAvailableSources() returns InlineResponse20054|error {
        string resourcePath = string `/leads/sources`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20054 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available statuses
    #
    # + group - Group Id 
    # + return - A list of available statuses 
    remote isolated function getAvailableStatuses(int? group = ()) returns InlineResponse20055|error {
        string resourcePath = string `/leads/statuses`;
        map<anydata> queryParam = {"group": group};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20055 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available users
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available users 
    remote isolated function getAvailableUsers(int? page = (), int? perPage = ()) returns InlineResponse20032|error {
        string resourcePath = string `/leads/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return a list of subscriptions
    #
    # + page - Page Number 
    # + perPage - Count of records per page 
    # + return - A JSON array of subscriptions 
    remote isolated function getSubscriptions(int? page = (), int? perPage = ()) returns InlineResponse20056|error {
        string resourcePath = string `/subscriptions`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20056 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a subscription
    #
    # + payload - Subscription details 
    # + return - Subscription has been created successfully 
    remote isolated function createSubscription(BriefSubscriptionInfo payload) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/subscriptions`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefSubscriptionInfo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Return a subscription by its id
    #
    # + subscriptionId - Subscription Id 
    # + return - Subscription 
    remote isolated function getSubscriptionsById(int subscriptionId) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BriefSubscriptionInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a subscription
    #
    # + subscriptionId - Subscription Id 
    # + return - Subscription (1) has been deleted successfully 
    remote isolated function deleteSubscription(int subscriptionId) returns InlineResponse20057|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20057 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a subscription
    #
    # + subscriptionId - Subscription Id 
    # + payload - Subscription details 
    # + return - Subscription has been updated successfully 
    remote isolated function updateSubscription(int subscriptionId, BriefSubscriptionInfo payload) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefSubscriptionInfo response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Test payload for checking server response
    #
    # + return - Response 
    remote isolated function testPayloadForCheckingServerResponse() returns TestSubscription|error {
        string resourcePath = string `/subscriptions/sample/subscription.test`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TestSubscription response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when this API is updated
    #
    # + return - API details 
    remote isolated function receiveNotificationWhenApiUpdated() returns ApiUpdated|error {
        string resourcePath = string `/subscriptions/sample/api.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead is created in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadCreated() returns LeadCreatedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.created`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadCreatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's campaign, status, group, or field values are updated in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadUpdated() returns LeadUpdatedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadUpdatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead in this CRM is deleted
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadDeleted() returns LeadDeletedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.deleted`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadDeletedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a deleted lead is restored in this CRM
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadRestored() returns LeadRestoredEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.restored`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadRestoredEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's status is updated in this CRM, with the option to only receive a notification when a lead is moved to or from the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadStatusUpdated() returns LeadStatusUpdatedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.status.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadStatusUpdatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is generated
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureGenerated() returns SignatureGenerated|error {
        string resourcePath = string `/subscriptions/sample/lead.signature.generated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureGenerated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is opened by the recipient
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureOpened() returns SignatureOpened|error {
        string resourcePath = string `/subscriptions/sample/lead.signature.opened`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureOpened response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is signed by the recipient
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureSigned() returns SignatureSigned|error {
        string resourcePath = string `/subscriptions/sample/lead.signature.signed`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureSigned response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead in this CRM has a note posted, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadNoteAdded() returns LeadNoteAddedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.note.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadNoteAddedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead document is uploaded
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadDocumentUploaded() returns LeadDocumentUploadedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.document.uploaded`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadDocumentUploadedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when an email message is received on a lead in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEmailReceived() returns LeadEmailReceivedEventInfo|error {
        string resourcePath = string `/subscriptions/sample/lead.email.received`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadEmailReceivedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a TurboApp is submitted to a processor
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppSubmitted() returns TurboAppSubmited|error {
        string resourcePath = string `/subscriptions/sample/turboapp.submitted`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppSubmited response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when the underwriting status is updated
    #
    # + return - Application account details 
    remote isolated function receiveNotificationWhenTurboAppUpdated() returns TurboAppUpdated|error {
        string resourcePath = string `/subscriptions/sample/turboapp.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a merchant is approved
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppApproved() returns TurboAppApproved|error {
        string resourcePath = string `/subscriptions/sample/turboapp.approved`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppApproved response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a merchant is declined
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppDeclined() returns TurboAppDeclined|error {
        string resourcePath = string `/subscriptions/sample/turboapp.declined`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppDeclined response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is created
    #
    # + return - Ticket created 
    remote isolated function receiveNotificationWhenTurboAppCreated() returns TicketCreated|error {
        string resourcePath = string `/subscriptions/sample/ticket.created`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketCreated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is updated
    #
    # + return - Ticket updated 
    remote isolated function receiveNotificationWhenTicketUpdated() returns TicketUpdated|error {
        string resourcePath = string `/subscriptions/sample/ticket.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is resolved
    #
    # + return - Ticket resolved 
    remote isolated function receiveNotificationWhenTicketResolved() returns TicketResolved|error {
        string resourcePath = string `/subscriptions/sample/ticket.resolved`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketResolved response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket comment is added
    #
    # + return - Ticket commented 
    remote isolated function receiveNotificationWhenTicketCommented() returns TicketCommented|error {
        string resourcePath = string `/subscriptions/sample/ticket.commented`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketCommented response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket comment is edited
    #
    # + return - Ticket comment edited 
    remote isolated function receiveNotificationWhenTicketCommentEdited() returns SubscriptionCommentEdited|error {
        string resourcePath = string `/subscriptions/sample/ticket.comment.edited`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionCommentEdited response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a residuals report is published
    #
    # + return - Report details 
    remote isolated function receiveNotificationWhenReportPublished() returns ReportPublished|error {
        string resourcePath = string `/subscriptions/sample/residuals.report.published`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportPublished response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a residuals line item is added
    #
    # + return - Line item details 
    remote isolated function receiveNotificationWhenLineItemAdded() returns LineItemAdded|error {
        string resourcePath = string `/subscriptions/sample/residuals.lineitem.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LineItemAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a new chargeback case created
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationWhenChargebackAdded() returns ChargebackAdded|error {
        string resourcePath = string `/subscriptions/sample/chargeback.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when chargeback case status changed
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationWhenChargebackUpdated() returns ChargebackUpdated|error {
        string resourcePath = string `/subscriptions/sample/chargeback.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification in 7/3/1 days before the chargeback case due date
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationForChargebackReminder() returns ChargebackReminder|error {
        string resourcePath = string `/subscriptions/sample/chargeback.reminder`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackReminder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a new retrieval case created
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationWhenRetrievalAdded() returns RetrievalAdded|error {
        string resourcePath = string `/subscriptions/sample/retrieval.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when retrieval case status changed
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationWhenRetrievalUpdated() returns RetrievalUpdated|error {
        string resourcePath = string `/subscriptions/sample/retrieval.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification in 7/3/1 days before the retrieval case due date
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationForRetrievalReminder() returns RetrievalReminder|error {
        string resourcePath = string `/subscriptions/sample/retrieval.reminder`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalReminder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of helpdesk tickets
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of helpdesk tickets by the field value 
    # + sortDir - Direction of sorting 
    # + dateFilter - Filter tickets by the specific date field 
    # + startDate - Start date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - End date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + group - Filter tickets by the specific ticket groups 
    # + 'type - Filter tickets by the specific ticket types 
    # + creator - Filter tickets by the ticket creator 
    # + modifier - Filter tickets by the ticket modifier 
    # + search - Search tickets by some criteria 
    # + searchBy - Search tickets by some specific field 
    # + resolver - Filter tickets by the ticket resolver 
    # + lid - Filter tickets by the Lead ID 
    # + mid - Filter tickets by the Merchant ID 
    # + hideResolved - Hide resolved ticket 
    # + assignedTo - Filter tickets by the assigned users. For sending multiple users please send them in comma seperated format. Please use an empty string to select all assigned tickets. 
    # + unassigned - Set this parameter to 1 if you need unassigned tickets also. For select only unassigned tickets exclude `assigned_to` from the request 
    # + return - A JSON array of tickets 
    remote isolated function getHelpdeskTickets(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? dateFilter = (), string? startDate = (), string? endDate = (), string? group = (), string? 'type = (), decimal? creator = (), decimal? modifier = (), string? search = (), string? searchBy = (), decimal? resolver = (), decimal? lid = (), string? mid = (), boolean? hideResolved = (), string? assignedTo = (), boolean? unassigned = ()) returns InlineResponse20058|error {
        string resourcePath = string `/helpdesk`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "group": group, "type": 'type, "creator": creator, "modifier": modifier, "search": search, "search_by": searchBy, "resolver": resolver, "lid": lid, "mid": mid, "hide_resolved": hideResolved, "assigned_to": assignedTo, "unassigned": unassigned};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20058 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new ticket
    #
    # + payload - Ticket details 
    # + return - Ticket has been created successfully 
    remote isolated function createNewTicket(HelpdeskBody payload) returns TicketDetail|error {
        string resourcePath = string `/helpdesk`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TicketDetail response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Add a ticket comment
    #
    # + ticketId - Ticket Id 
    # + payload - Comment details 
    # + return - Comment was added successfully 
    remote isolated function addTicketComment(int ticketId, TicketidCommentBody payload) returns BriefTicketComments|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}/comment`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefTicketComments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get detailed ticked information
    #
    # + ticketId - Ticket Id 
    # + return - A JSON array of tickets 
    remote isolated function getDetailedTicketInformation(int ticketId) returns TicketDetail|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a ticket
    #
    # + ticketId - Ticket Id 
    # + return - Ticket has been deleted successfully 
    remote isolated function deleteTicket(int ticketId) returns InlineResponse20059|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20059 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a ticket
    #
    # + ticketId - Ticket Id 
    # + payload - Ticket details 
    # + return - Ticket has been updated successfully 
    remote isolated function updateTicket(int ticketId, HelpdeskTicketidBody payload) returns TicketDetail|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TicketDetail response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get ticked assignment logs
    #
    # + ticketId - Ticket Id 
    # + return - A JSON array of assignments 
    remote isolated function getTicketAssignmentLogs(int ticketId) returns InlineResponse20060[]|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}/assignments`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20060[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload an attachment to a ticket, comment, checklist, or ticket type
    #
    # + extension - File extension for validation 
    # + name - File name for validation 
    # + payload - Payload data 
    # + return - Document 
    remote isolated function uploadAttachementToTicket(string extension, string name, byte[] payload) returns InlineResponse20061|error {
        string resourcePath = string `/helpdesk/file`;
        map<anydata> queryParam = {"extension": extension, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        InlineResponse20061 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download an attachment from a ticket
    #
    # + ticketId - Ticket Id 
    # + attachmentId - Attachment Id 
    # + return - Document 
    remote isolated function downloadAttachmentFromTicket(int ticketId, int attachmentId) returns string|error {
        string resourcePath = string `/helpdesk/${getEncodedUri(ticketId)}/download/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of helpdesk ticket types
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of helpdesk ticket types by the field value 
    # + sortDir - Direction of sorting 
    # + dateFilter - Filter ticket types by the specific date field 
    # + startDate - Start date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - End date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + status - Status 
    # + priority - 0 - Normal, 1 - Medium, 2 - Rush 
    # + daysToResolve - Days to resolve 
    # + creator - Creator 
    # + modifier - Filter ticket types by the ticket modifier 
    # + return - A JSON array of ticket types 
    remote isolated function getHelpdeskTicketTypes(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? dateFilter = (), string? startDate = (), string? endDate = (), string? status = (), int? priority = (), decimal? daysToResolve = (), decimal? creator = (), decimal? modifier = ()) returns InlineResponse20062|error {
        string resourcePath = string `/helpdesk/types`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "status": status, "priority": priority, "daysToResolve": daysToResolve, "creator": creator, "modifier": modifier};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20062 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new helpdesk ticket type
    #
    # + payload - Comment details 
    # + return - A JSON array of ticket types 
    remote isolated function createHelpdeskTicketType(HelpdeskTypesBody payload) returns TypeDetail|error {
        string resourcePath = string `/helpdesk/types`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeDetail response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get details for a helpdesk ticket type
    #
    # + typeId - Ticket Type Id 
    # + return - A JSON array of ticket types 
    remote isolated function getHelpdeskTicketType(int typeId) returns TypeDetail|error {
        string resourcePath = string `/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TypeDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a ticket type
    #
    # + typeId - Ticket Type Id 
    # + return - Result message 
    remote isolated function deleteTicketType(int typeId) returns InlineResponse20063|error {
        string resourcePath = string `/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20063 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a helpdesk ticket type
    #
    # + typeId - Ticket Type Id 
    # + payload - Ticket data 
    # + return - A JSON array of ticket types 
    remote isolated function updateHelpdeskTicketType(int typeId, TypesTypeidBody payload) returns TypeDetail|error {
        string resourcePath = string `/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeDetail response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Download an attachment from a ticket type
    #
    # + typeId - Ticket Type Id 
    # + attachmentId - Attachment Id 
    # + return - Document 
    remote isolated function downloadAttachmentFromTicketType(int typeId, int attachmentId) returns string|error {
        string resourcePath = string `/helpdesk/types/${getEncodedUri(typeId)}/download/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available users to notify and assign
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + role - ID of user class 
    # + return - A JSON array of users 
    remote isolated function getAvailableUsersToNotify(int? page = (), int? perPage = (), string? role = ()) returns InlineResponse20032|error {
        string resourcePath = string `/helpdesk/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "role": role};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
