// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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

# OAuth2 Client Credintials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://accounts.zoho.com/oauth/v2/token";
|};

# This is a generated connector for [Zoho CRM](https://www.zoho.com/crm/developer/docs/api/v2/modules-api.html) OpenAPI specification.
# Zoho CRM REST API provides the capability to unify customer data from across different applications and databases.
@display {label: "Zoho CRM REST", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Zoho account](https://www.zoho.com/crm/signup.html) and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.zohoapis.com/crm/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get the list of available records from a module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + return - Records 
    remote isolated function listRecords(string moduleApiName) returns RecordsData|error {
        string resourcePath = string `/${moduleApiName}`;
        RecordsData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update existing record in the module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + payload - Record 
    # + return - Success 
    remote isolated function updateRecord(string moduleApiName, json payload) returns Response|error {
        string resourcePath = string `/${moduleApiName}`;
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
        string resourcePath = string `/${moduleApiName}`;
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
        string resourcePath = string `/${moduleApiName}/${recordId}`;
        RecordsData? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete existing record in the module.
    #
    # + moduleApiName - Module name. Leads, Accounts, Contacts, Deals, Campaigns, Tasks, Cases, Events, Calls, Solutions, Products, Vendors, Price Books, Quotes, Sales Orders, Purchase Orders, Invoices, Activities, and custom modules. 
    # + recordId - Record ID 
    # + return - Success 
    remote isolated function deleteRecord(string moduleApiName, string recordId) returns Response|error {
        string resourcePath = string `/${moduleApiName}/${recordId}`;
        Response response = check self.clientEp->delete(resourcePath);
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
        string resourcePath = string `/${moduleApiName}/search`;
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
        string resourcePath = string `/Leads/${recordId}/actions/convert`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConvertLeadResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
