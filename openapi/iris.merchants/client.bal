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
    # Represents API Key `X-API-KEY`
    string xApiKey;
|};

# This is a generated connector for [IRIS Merchants API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Populate your data warehouse programmatically through this Merchants API and interact with your merchant services portfolio.  
# Data points include merchant demographics, deposits, transactions, retrievals, chargebacks, and statements across supported processors.
# Each merchant account is accessible by users through a set of permissions controlled on the User Class level.
# Segment your portfolio of merchants by filters such as processor, data source, and processing status.
@display {label: "IRIS Merchants", iconPath: "icon.png"}
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
    # + 'group - Filter merchants by a group name 
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
    remote isolated function getMerchants(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? 'group = (), string? processor = (), string? datasource = (), string? mid = (), string? name = (), string? vim = (), string? active = (), string? status = (), string? dateFilter = (), string? startDate = (), string? endDate = ()) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/merchants`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "group": 'group, "processor": processor, "datasource": datasource, "mid": mid, "name": name, "vim": vim, "active": active, "status": status, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate};
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2002 response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/deposits/${year}/${month}/${day}`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/transactions`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks/${caseNumber}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackReplyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalsReplyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of statements
    #
    # + merchantNumber - Merchant number 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of statements 
    remote isolated function getStatements(int merchantNumber, int? page = (), int? perPage = ()) returns InlineResponse2008|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/statements`;
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
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/statements/${statementId}`;
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
        string resourcePath = string `/api/v1/merchants/files`;
        map<anydata> queryParam = {"filename": filename};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Download chargeback case files
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + fileId - File Id (leave empty to get all case files) 
    # + return - Files 
    remote isolated function downloadChargebackCaseFiles(int merchantNumber, int caseNumber, int fileId) returns DisputeFile[]|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks/${caseNumber}/files/${fileId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DisputeFile[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
