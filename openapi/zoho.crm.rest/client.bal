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

# This is a generated connector for [Zoho CRM](https://www.zoho.com/crm/developer/docs/api/v2/modules-api.html) OpenAPI specification.
# Zoho CRM REST API provides the capability to unify customer data from across different applications and databases.
@display {label: "Zoho CRM REST", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Zoho account](https://www.zoho.com/crm/signup.html) and obtain tokens.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://www.zohoapis.com/crm/v2") returns error? {
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
    # Get the list of available records from a module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + return - Records 
    remote isolated function listRecords(string moduleApiName) returns RecordsData|error {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}`;
        RecordsData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update existing record in the module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + payload - Record 
    # + return - Success 
    remote isolated function updateRecord(string moduleApiName, json payload) returns Response|error {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Add new records to a module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + payload - Record 
    # + return - Success 
    remote isolated function addRecord(string moduleApiName, json payload) returns Response|error {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a record from a module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + recordId - Record ID 
    # + return - Record 
    remote isolated function getRecord(string moduleApiName, string recordId) returns RecordsData|error? {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}/${getEncodedUri(recordId)}`;
        RecordsData? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete existing record in the module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + recordId - Record ID 
    # + return - Success 
    remote isolated function deleteRecord(string moduleApiName, string recordId) returns Response|error {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}/${getEncodedUri(recordId)}`;
        Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve the records that match your search criteria.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + criteria - Performs search by following the shown criteria 
    # + email - Performs module search by email. All the email fields of a particular module will be searched and listed. 
    # + phone - Performs module search by phone number. All the phone fields of a particular module will be searched and listed. 
    # + word - Performs global search by word. 
    # + converted - To get the list of converted records. Default value is false. 
    # + approved - To get the list of approved records. Default value is true. 
    # + page - To get the list of records from the respective pages. Default value for page is 1. 
    # + perPage - To get the list of records available per page. The default and the maximum possible value is 200. 
    # + return - Records 
    remote isolated function searchRecords(string moduleApiName, string? criteria = (), string? email = (), string? phone = (), string? word = (), string? converted = (), string? approved = (), int? page = (), int? perPage = ()) returns RecordsData|error? {
        string resourcePath = string `/${getEncodedUri(moduleApiName)}/search`;
        map<anydata> queryParam = {"criteria": criteria, "email": email, "phone": phone, "word": word, "converted": converted, "approved": approved, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RecordsData? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Convert a lead into a contact or an account.
    #
    # + recordId - Record ID 
    # + payload - New contact, account and deal properties 
    # + return - Connections 
    remote isolated function convertLead(string recordId, LeadData payload) returns ConvertLeadResponse|error {
        string resourcePath = string `/Leads/${getEncodedUri(recordId)}/actions/convert`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConvertLeadResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
