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
}
