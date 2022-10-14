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
    # Represents API Key `token`
    string token;
|};

# This is a generated connector for [Zuora Revenue API V2021-08-12](https://www.zuora.com/developer/revpro-api/) OpenAPI specification.
# The Revenue API provides access to Zuroa revenue related operations on BI views, reports, revenue Jobs etc.
@display {label: "Zuora Revenue", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Zuora account](https://www.zuora.com/) and obtain tokens by following [this guide](https://www.zuora.com/developer/revpro-api/#tag/Authentication).
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
    # Get file upload status
    #
    # + fileRequestId - The request ID of the file upload to be queried. 
    # + return - The status information is returned for the requested file upload. 
    remote isolated function getFileuploadstatus(int fileRequestId) returns json|error? {
        string resourcePath = string `/api/integration/v1/fileupload/status/${getEncodedUri(fileRequestId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get upload status
    #
    # + id - The request ID of the uploaded file for which the status information is being queried. 
    # + return - The status information is returned for the requested upload. 
    remote isolated function getUploadstatus(int id) returns json|error {
        string resourcePath = string `/api/integration/v1/csv/upload/status`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create upload
    #
    # + templatename - The name of the upload template that you want to use. 
    # + filename - The unique file name to populate the data in the Zuora Revenue UI. 
    # + return - Data is uploaded to the staging tables in Zuora Revenue. 
    remote isolated function postUpload(string templatename, string filename, string[] payload) returns json|error {
        string resourcePath = string `/api/integration/v1/csv/upload`;
        map<any> headerValues = {"templatename": templatename, "filename": filename, "token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "text/plain");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update transfer batch status
    #
    # + batchId - The batch ID of the transfer accounting batch. 
    # + return - The status of the transfer batch is changed to `Transferred`. 
    remote isolated function putTransferbatchstatus(int batchId) returns json|error {
        string resourcePath = string `/api/integration/v1/journal/batch/status/${getEncodedUri(batchId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get transfer batch
    #
    # + batchid - The batch ID of the transfer accounting batch. 
    # + pagenum - The number of page to be downloaded. 
    # + pagesize - The number of records to be downloaded per request. The default is 1000 and the maximum is 10000. 
    # + return - Operation is successful. 
    remote isolated function getTransferbatch(int batchid, int pagenum, int? pagesize = ()) returns json|error {
        string resourcePath = string `/api/integration/v1/journal/batch/${getEncodedUri(batchid)}/${getEncodedUri(pagenum)}`;
        map<any> headerValues = {"pagesize": pagesize, "token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get BI Views
    #
    # + tmplName - Name of the BI view. 
    # + clientId - The ID of the Zuora Revenue application user. 
    # + fromDate - The date from which the data query begins. 
    # + toDate - The date on which the data query ends. 
    # + pagenum - The number of page to download. 
    # + pagesize - The number of records to be downloaded per request. The default is 1000 and the maximum is 10000. 
    # + count - Set to `true` to get the row count of the BI view for the specified time period.  **Note:** Setting this parameter to `true` might cause timeout errors for large volume scenarios. 
    # + return - BI view data is returned in CSV format. 
    remote isolated function getBiviews(string tmplName, int clientId, string fromDate, string toDate, int pagenum, int? pagesize = (), boolean count = false) returns http:Response|error {
        string resourcePath = string `/api/integration/v1/biviews/${getEncodedUri(tmplName)}`;
        map<anydata> queryParam = {"clientId": clientId, "fromDate": fromDate, "toDate": toDate, "pagenum": pagenum, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"pagesize": pagesize, "token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get BI View data for selected fields
    #
    # + tmplName - Name of the BI view. 
    # + clientId - The ID of the Zuora Revenue application user. 
    # + fromDate - The date from which the data query begins. 
    # + toDate - The date on which the data query ends. 
    # + pagenum - The number of page to download. 
    # + count - Set to `true` to get the row count of the BI view for the specified time period.  **Note:** Setting this parameter to `true` might cause timeout errors for large volume scenarios. 
    # + return - BI view data is returned in CSV format. 
    remote isolated function postBiviews(string tmplName, int clientId, string fromDate, string toDate, int pagenum, string[] payload, boolean count = false) returns http:Response|error {
        string resourcePath = string `/api/integration/v1/biviews/${getEncodedUri(tmplName)}`;
        map<anydata> queryParam = {"clientId": clientId, "fromDate": fromDate, "toDate": toDate, "pagenum": pagenum, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get transfer batch list
    #
    # + return - Operation is successful. 
    remote isolated function getTransferbatchlist() returns json|error? {
        string resourcePath = string `/api/integration/v1/journal/list`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get transfer batch file
    #
    # + batchId - The batch ID of the transfer accounting batch. 
    # + return - Operation is successful. 
    remote isolated function getTransferbatchfile(int batchId) returns json|error? {
        string resourcePath = string `/api/integration/v1/download/transferbatchfile/${getEncodedUri(batchId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get report list
    #
    # + createddate - The date when reports are created. 
    # + return - Operation is successful. 
    remote isolated function getReportlist(string? createddate = ()) returns json|error {
        string resourcePath = string `/api/integration/v1/reports/list`;
        map<anydata> queryParam = {"createddate": createddate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a report
    #
    # + filename - The name of the report file to be downloaded. 
    # + return - Operation is successful. Report is downloaded. 
    remote isolated function getDownloadreports(string filename) returns http:Response|error {
        string resourcePath = string `/api/integration/v1/reports/download/${getEncodedUri(filename)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get report data
    #
    # + reportId - The ID of the report to be downloaded. You can get the report ID in the <a href="https://www.zuora.com/developer/revpro-api/#operation/GET_ReportList">Get report list</a> response. 
    # + return - The URL to download the report file. The signed URL will be valid for 30 minutes from the time when it is generated. 
    remote isolated function getReportsurl(int reportId) returns json|error {
        string resourcePath = string `/api/integration/v2/reports/signedurl/${getEncodedUri(reportId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get staging error
    #
    # + errortype - The type of errors that you want to retrieve. 
    # + return - Staging errors of the specified type are returned. 
    remote isolated function getStaggingerror(string errortype) returns json|error? {
        string resourcePath = string `/api/integration/v1/stage/error/${getEncodedUri(errortype)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get field mapping
    #
    # + templatename - Name of the upload template that contains the field mapping information. 
    # + return - Field mapping data is returned. 
    remote isolated function getFileuploadmapping(string? templatename = ()) returns json|error {
        string resourcePath = string `/api/integration/v1/upload/mapping`;
        map<anydata> queryParam = {"templatename": templatename};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get all task status
    #
    # + return - The task details are returned. 
    remote isolated function getAlltaskstatus() returns json|error? {
        string resourcePath = string `/api/integration/v2/biviews-status`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get active task details
    #
    # + taskId - The continuation token that was returned in the initial request. 
    # + return - The details of active tasks that are associated with the continuation token are returned. 
    remote isolated function getTaskdetails(string taskId) returns json|error? {
        string resourcePath = string `/api/integration/v2/biviews-status/${getEncodedUri(taskId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel task
    #
    # + taskId - The continuation token that is associated with the tasks to be canceled. 
    # + return - The tasks associated with the specified continuation token are canceled. 
    remote isolated function deleteTask(string taskId) returns http:Response|error {
        string resourcePath = string `/api/integration/v2/biviews-status/${getEncodedUri(taskId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get row count
    #
    # + tmplName - Name of the BI view. 
    # + clientId - The ID of the Zuora Revenue application user. 
    # + fromDate - The date from which the data query begins. 
    # + toDate - The date on which the data query ends. 
    # + return - The row count of the specified BI view is returned. 
    remote isolated function getRowcount(string tmplName, int clientId, string fromDate = "2016-07-26T00:00:00.000Z", string toDate = "2018-07-26T00:00:00.000Z") returns http:Response|error {
        string resourcePath = string `/api/integration/v2/biviews/count/${getEncodedUri(tmplName)}`;
        map<anydata> queryParam = {"clientId": clientId, "fromDate": fromDate, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download BI view
    #
    # + continuationToken - The continuation token that was returned in the initial query for Page 1.  **Note:** The continuation token is returned after Page 1 of the BI view is downloaded.  To download the subsequent pages, you must specify the continuation token in this operation for Page 2 onwards. 
    # + tmpleName - Name of the BI view. 
    # + clientId - The ID of the Zuora Revenue application user. 
    # + fromDate - The date from which the data query begins. 
    # + toDate - The date on which the data query ends. 
    # + pagenum - The number of page to be downloaded. 
    # + pageSize - The number of rows on each page to be downloaded. * For CSV format, the valid range is 1 - 10,000 with default 10,000. * For gzip format, the valid range is 1 - 20,000 with default 20,000. **Note:** Any value that is greater than 20,000 is invalid. 
    # + outputType - The output format of the download. 
    # + return - The queried BI view data is returned in the desired format. 
    remote isolated function getBiview(string tmpleName, int clientId, string fromDate, string toDate, string? continuationToken = (), int pagenum = 1, int? pageSize = (), string outputType = "gzip") returns http:Response|error {
        string resourcePath = string `/api/integration/v2/biviews/${getEncodedUri(tmpleName)}`;
        map<anydata> queryParam = {"clientId": clientId, "fromDate": fromDate, "toDate": toDate, "pagenum": pagenum, "pageSize": pageSize, "outputType": outputType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"continuation-token": continuationToken, "token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get column list
    #
    # + tmpleName - Name of the BI view. 
    # + return - The list of columns is returned for the requested BI view. 
    remote isolated function getColumnlist(string tmpleName) returns http:Response|error {
        string resourcePath = string `/api/integration/v2/biviews/${getEncodedUri(tmpleName)}/describe-columns`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Submit data collection job
    #
    # + return - The request is submitted successfully and the job ID is returned. You can use the returned ID to query the job status later. 
    remote isolated function postCollection(RevenueJobRequest payload) returns RevenueJobResponse|error {
        string resourcePath = string `/api/integration/v1/job/collection/template`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        RevenueJobResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get data collection job details
    #
    # + jobId - The ID of the data collection job that you want to query. This is the ID that is returned when you submitted the data collection job. 
    # + return - The request is submitted successfully. 
    remote isolated function getCollectiondetails(int jobId) returns RevenueJobDetail|error {
        string resourcePath = string `/api/integration/v1/job/collection/template/${getEncodedUri(jobId)}`;
        map<any> headerValues = {"token": self.apiKeyConfig.token};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RevenueJobDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
