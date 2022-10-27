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

# This is a generated connector for [Eloqua Marketing Cloud Service API Version 2021.08.12](https://www.oracle.com/cx/marketing/automation/) OpenAPI Specification.
# The Oracle Eloqua Marketing Cloud Service REST APIs enable you to extend the functionality of the product, build Apps, and perform high volume data transfers.
# Oracle Eloqua is a software as a service (SaaS) platform for marketing automation offered by Oracle that aims to help B2B marketers and organizations manage marketing campaigns and sales lead generation
@display {label: "Eloqua", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Oracle devoloper account](https://developer.oracle.com/) and [obtain tokens](https://docs.oracle.com/en/cloud/saas/marketing/eloqua-rest-api/Authentication.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Retrieve a list of sync action definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getSyncActionOperationSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncActions`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of email address import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEmailAddressImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email address import definition
    #
    # + payload - The request body contains details of the email address import definition. 
    # + return - Success. 
    remote isolated function postEmailAddressImportIndividual(EmailAddressImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email address import definition
    #
    # + id - The email address import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getEmailAddressImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email address import definition
    #
    # + id - The email address import definition's resource identification number. 
    # + payload - The request body contains details of the email address import definition. 
    # + return - OK. 
    remote isolated function putEmailAddressImportIndividual(int id, Emailaddressimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email address import definition
    #
    # + id - The email address import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEmailAddressImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Submit data for an email address import
    #
    # + id - The email address import definition's resource identification number. 
    # + payload - The request body contains the list of email addresses to be unsubscribed. 
    # + return - Success. 
    remote isolated function postEmailAddressImportData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete an email address import definition's synced data
    #
    # + id - The email address import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEmailAddressImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/emailAddresses/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an email group
    #
    # + id - The unique resource identifier of the email group. 
    # + return - OK. 
    remote isolated function getEmailGroupIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailGroups/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of email groups
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEmailGroupSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/emailGroups`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of syncs
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getSyncSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an import or export sync
    #
    # + payload - The request body contains details about the synchronization definition. 
    # + return - Success. 
    remote isolated function postSyncIndividual(SyncIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a sync
    #
    # + id - Id of the sync. 
    # + return - OK. 
    remote isolated function getSyncIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an export sync's data
    #
    # + id - Id of the sync. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Total number of sync results found. 
    # + return - OK 
    remote isolated function getSyncDataQuery(int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete sync data
    #
    # + id - Id of the sync. 
    # + return - No Content. 
    remote isolated function deleteSyncDataQuery(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/syncs/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a sync's logs
    #
    # + id - Id of the sync. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - This captures the total number of records that satisfy the request. This is not the count returned in the current response, but total count on the server side. Example: ?totalResults=true. 
    # + return - OK. 
    remote isolated function getSyncLogSearch(int id, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs/${getEncodedUri(id)}/logs`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve import sync failure data
    #
    # + id - Id of the sync. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getSyncRejectSearch(int id, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/syncs/${getEncodedUri(id)}/rejects`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Discover the amount of database space your imports are using
    #
    # + return - OK. 
    remote isolated function getImportStorage() returns json|error {
        string resourcePath = string `/api/bulk/2.0/imports/data`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an import priority
    #
    # + id - The unique resource identifier. 
    # + return - OK. 
    remote isolated function getImportPriorityIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/imports/priorities/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of import priorities
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getImportPrioritySearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/imports/priorities`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of imports
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Discover the amount of database space your exports are using
    #
    # + return - OK. 
    remote isolated function getExportStorage() returns json|error {
        string resourcePath = string `/api/bulk/2.0/exports/data`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of exports
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getExportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an event
    #
    # + id - The event's resource identification number. 
    # + return - OK. 
    remote isolated function getEventIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of export definitions for an event
    #
    # + id - The event's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEventExportSearch(int id, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(id)}/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of the fields for an event
    #
    # + id - The event's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEventFieldSearch(int id, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(id)}/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of import definitions for an event
    #
    # + id - The event's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEventImportSearch(int id, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(id)}/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an export definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + payload - The request body contains details of the event export definition. 
    # + return - Success. 
    remote isolated function postEventExportIndividual(int parentId, EventExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an export definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event export definition's resource identification number. 
    # + return - OK. 
    remote isolated function getEventExportIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an export definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event export definition's resource identification number. 
    # + payload - The request body contains details of the event export definition. 
    # + return - OK. 
    remote isolated function putEventExportIndividual(int parentId, int id, Eventexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an export definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEventExportIndividual(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve the synced data for an event export definition
    #
    # + parentId - The event's resource identification number. 
    # + id - The event export definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEventExportDataQuery(int parentId, int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete the synced data for an event export definition
    #
    # + parentId - The event's resource identification number. 
    # + id - The event export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEventExportDataQuery(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an event field definition
    #
    # + parentId - The event's resource identification number. 
    # + id - The event field's resource identification number. 
    # + return - OK. 
    remote isolated function getEventFieldIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an import definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + payload - The request body contains details of the event import definition. 
    # + return - Success. 
    remote isolated function postEventImportIndividual(int parentId, EventImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an import definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getEventImportIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an import definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event import definition's resource identification number. 
    # + payload - The request body contains details of the event import definition. 
    # + return - OK. 
    remote isolated function putEventImportIndividual(int parentId, int id, Eventimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an import definition for an event
    #
    # + parentId - The event's resource identification number. 
    # + id - The event import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEventImportIndividual(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for an event import definition
    #
    # + parentId - The event's resource identification number. 
    # + id - The event import definition's resource identification number. 
    # + payload - The request body contains data to be uploaded to the event import definition. 
    # + return - Success. 
    remote isolated function postEventImportData(int parentId, int id, record {}[] payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the synced data for an event import definition
    #
    # + parentId - The event's resource identification number. 
    # + id - The event import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteEventImportData(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/events/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of events
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getEventSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/events`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of campaign response export definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCampaignResponseExportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a campaign response export definition
    #
    # + payload - The request body contains details of the campaign response export definition. 
    # + return - OK. 
    remote isolated function postCampaignResponseExportIndividual(CampaignResponseExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a campaign response export definition
    #
    # + id - The campaign response export definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCampaignResponseExportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a campaign response export definition
    #
    # + id - The campaign response export definition's resource identification number. 
    # + payload - The request body contains details of the campaign response export definition. 
    # + return - OK. 
    remote isolated function putCampaignResponseExportIndividual(int id, Campaignresponseexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a campaign response export definition
    #
    # + id - The campaign response export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCampaignResponseExportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve the synced data for a campaign response export definition
    #
    # + id - The campaign response export definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCampaignResponseExportDataQuery(int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete the synced data for a campaign response export definition
    #
    # + id - The campaign response export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCampaignResponseExportDataQuery(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a campaign response field definition
    #
    # + id - The campaign response field's resource identification number. 
    # + return - OK. 
    remote isolated function getCampaignResponseFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve all campaign response fields
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCampaignResponseFieldSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of campaign response import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCampaignResponseImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a campaign response import definition
    #
    # + payload - The request body contains details of the campaign response import definition. 
    # + return - OK. 
    remote isolated function postCampaignResponseImportIndividual(CampaignResponseImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a campaign response import definition
    #
    # + id - The campaign response import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCampaignResponseImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a campaign response import definition
    #
    # + id - The campaign response import definition's resource identification number. 
    # + payload - The request body contains details of the campaign response import definition. 
    # + return - OK. 
    remote isolated function putCampaignResponseImportIndividual(int id, Campaignresponseimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a campaign response import definition
    #
    # + id - The campaign response import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCampaignResponseImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for a campaign response import definition
    #
    # + id - The campaign response import definition's resource identification number. 
    # + payload - The request body contains details of the campaign response data. 
    # + return - OK. 
    remote isolated function postCampaignResponseImportData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the synced data for a campaign response import definition
    #
    # + id - The campaign response import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCampaignResponseImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/campaignResponses/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a campaign field definition
    #
    # + id - The campaign field definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCampaignFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaigns/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of campaign fields
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCampaignFieldSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/campaigns/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of opportunity contact linkage import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getOpportunityContactLinkageImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an opportunity contact linkage import definition
    #
    # + payload - The request body contains details of the opportunity contact linkage import definition. 
    # + return - OK. 
    remote isolated function postOpportunityContactLinkageImportIndividual(OpportunityContactLinkageImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an opportunity contact linkage import definition
    #
    # + id - The opportunity contact linkage import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getOpportunityContactLinkageImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an opportunity contact linkage import definition
    #
    # + id - The opportunity contact linkage import definition's resource identification number. 
    # + payload - The request body contains details of the opportunity contact linkage import definition. 
    # + return - OK. 
    remote isolated function putOpportunityContactLinkageImportIndividual(int id, Opportunitycontactlinkageimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an opportunity contact linkage import definition
    #
    # + id - The opportunity contact linkage import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteOpportunityContactLinkageImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for an opportunity contact linkage import definition
    #
    # + id - The opportunity contact linkage import definition's resource identification number. 
    # + payload - The request body contains details of the opportunity contact linkage import data. 
    # + return - OK. 
    remote isolated function postOpportunityContactLinkageImportData(int id, record {}[] payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the synced data for an opportunity contact linkage import definition
    #
    # + id - The opportunity contact linkage import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteOpportunityContactLinkageImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/contacts/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an opportunity field definition
    #
    # + id - The opportunity field definition's resource identification number. 
    # + return - OK. 
    remote isolated function getOpportunityFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of opportunity fields
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getOpportunityFieldSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of opportunity import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getOpportunityImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an opportunity import definition
    #
    # + payload - The request body contains details of the opportunity import definition. 
    # + return - OK. 
    remote isolated function postOpportunityImportIndividual(OpportunityImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an opportunity import definition
    #
    # + id - The opportunity import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getOpportunityImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an opportunity import definition
    #
    # + id - The opportunity import definition's resource identification number. 
    # + payload - The request body contains details of the opportunity import definition. 
    # + return - OK. 
    remote isolated function putOpportunityImportIndividual(int id, Opportunityimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an opportunity import definition
    #
    # + id - The opportunity import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteOpportunityImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for an opportunity import definition
    #
    # + id - The opportunity import definition's resource identification number. 
    # + payload - The request body contains details of the opportunity data. 
    # + return - OK. 
    remote isolated function postOpportunityImportData(int id, record {}[] payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete the synced data for an opportunity import definition
    #
    # + id - The opportunity import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteOpportunityImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/opportunities/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a user
    #
    # + id - Id of the user to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualUser(int id, string? depth = ()) returns UserRest10|error {
        string resourcePath = string `/api/REST/1.0/system/user/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a user
    #
    # + id - Id of the user to update. 
    # + payload - The request body defines the details of the user to be updated. 
    # + return - OK. 
    remote isolated function updateUser(int id, UserRest10 payload) returns UserRest10|error {
        string resourcePath = string `/api/REST/1.0/system/user/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Retrieve a list of users
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the user was last updated. This is a read-only property. 
    # + return - OK. 
    remote isolated function searchListOfUsers(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultUserRest10|error? {
        string resourcePath = string `/api/REST/1.0/system/users`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultUserRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account
    #
    # + payload - The request body defines the details of the account to be created. 
    # + return - Success 
    remote isolated function createAccounts(AccountRest10 payload) returns AccountRest10|error {
        string resourcePath = string `/api/REST/1.0/data/account`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an account
    #
    # + id - Id of the account. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + viewId - Id of the account view. 
    # + return - OK 
    remote isolated function readIndividualAccount(int id, string? depth = (), int? viewId = ()) returns AccountRest10|error {
        string resourcePath = string `/api/REST/1.0/data/account/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth, "viewId": viewId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account
    #
    # + id - Id of the account. 
    # + payload - List of account fields. 
    # + return - OK 
    remote isolated function updateAccount(int id, AccountRest10 payload) returns AccountRest10|error {
        string resourcePath = string `/api/REST/1.0/data/account/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an account
    #
    # + id - Id of the account. 
    # + return - OK. 
    remote isolated function deleteAccounts(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/data/account/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of accounts
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered 
    # + lastUpdatedAt - The date and time the account was last updated. This is a read-only property. 
    # + viewId - Id of the account view to filter results. Must be a valid account view id. Example: <code>/api/REST/1.0/data/accounts?viewId=100005</code>. 
    # + ownedByUserId - Set this query parameter to an Eloqua User ID to return all Accounts linked to that Eloqua User. You can link Users to Accounts using the Bulk API. For instructions on how to link Users to Accounts, refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a>. 
    # + return - OK 
    remote isolated function retrieveListofAccounts(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = (), int? viewId = (), int? ownedByUserId = ()) returns QueryResultAccountRest10|error? {
        string resourcePath = string `/api/REST/1.0/data/accounts`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt, "viewId": viewId, "ownedByUserId": ownedByUserId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultAccountRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve processed form data for a single form
    #
    # + id - ID of the form. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + startAt - The earliest date time for which the request will retrieve data, expressed in Unix time. 
    # + endAt - The latest date time for which the request will retrieve data, expressed in Unix time. 
    # + return - OK. 
    remote isolated function searchFormData(int id, int? count = (), int? page = (), int? startAt = (), int? endAt = ()) returns QueryResultFormSubmissionRest10|error {
        string resourcePath = string `/api/REST/1.0/data/form/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"count": count, "page": page, "startAt": startAt, "endAt": endAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFormSubmissionRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create form data for a single form
    #
    # + id - ID of the form. 
    # + payload - The request body defines the details of the form data to be created. 
    # + return - Success. 
    remote isolated function createFormData(int id, FormDataRest10 payload) returns FormDataRest10|error {
        string resourcePath = string `/api/REST/1.0/data/form/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormDataRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a single form submit job
    #
    # + formId - ID of the form. 
    # + formSubmitJobId - ID of the asynchronous form submission job. 
    # + return - Bad request. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>Status Codes</a> for information about other possible HTTP status codes. 
    remote isolated function getAsyncFormSubmissionGETRest10(string formId, string formSubmitJobId) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/data/form/${getEncodedUri(formId)}/formData/${getEncodedUri(formSubmitJobId)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve all form submit jobs for a single form
    #
    # + formId - ID of the form. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + startAt - The earliest date time for which the request will retrieve data, expressed in Unix time. 
    # + return - Bad request. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>Status Codes</a> for information about other possible HTTP status codes. 
    remote isolated function searchAsyncFormSubmissionGETRest10(string formId, string? count = (), string? page = (), string? search = (), int? startAt = ()) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/data/form/${getEncodedUri(formId)}/formData`;
        map<anydata> queryParam = {"count": count, "page": page, "search": search, "startAt": startAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a landing page
    #
    # + payload - The request body defines the details of the landing page to be created. 
    # + return - Success. 
    remote isolated function createLandingPage(LandingPageRest10 payload) returns LandingPageRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/landingPage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPageRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a landing page
    #
    # + id - Id of the landing page to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualLandingPage(int id, string? depth = ()) returns LandingPageRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/landingPage/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LandingPageRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a landing page
    #
    # + id - Id of the landing page to update. 
    # + payload - The request body defines the details of the landing page to be updated. 
    # + return - OK. 
    remote isolated function updateLandingPage(int id, LandingPageRest10 payload) returns LandingPageRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/landingPage/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPageRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a landing page
    #
    # + id - Id of the landing page to delete. 
    # + return - OK. 
    remote isolated function deleteLandingPageREST10(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/landingPage/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of landing pages
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the external asset was last updated. 
    # + return - OK. 
    remote isolated function searchListofLandingPages(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultLandingPageRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/landingPages`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultLandingPageRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email
    #
    # + payload - The request body defines the details of the email to be created. 
    # + return - Success 
    remote isolated function createEmail(EmailRest10 payload) returns EmailRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email
    #
    # + id - Id of the email. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualEmail(int id, string? depth = ()) returns EmailRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email
    #
    # + id - Id of the email. 
    # + payload - The request body defines the details of the email to be updated. 
    # + return - OK 
    remote isolated function updateEmail(int id, EmailRest10 payload) returns EmailRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email
    #
    # + id - Id of the email. 
    # + return - OK 
    remote isolated function deleteEmail(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/email/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of emails
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the email was last updated. 
    # + return - OK 
    remote isolated function searchListOfEmails(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultEmailRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/emails`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultEmailRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create custom object data
    #
    # + parentId - Id of the parent. 
    # + payload - The request body defines the details of the custom object data to be created. 
    # + return - Success. 
    remote isolated function createIndividualObjectDataPOSTRest20(int parentId, CustomObjectDataRest20 payload) returns CustomObjectDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/customObject/${getEncodedUri(parentId)}/instance`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectDataRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve custom object data
    #
    # + parentId - Id of the parent. 
    # + id - Id of the custom object data. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualCustomObjectDataGETRest20(int parentId, int id, string? depth = ()) returns CustomObjectDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/customObject/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomObjectDataRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update custom object data
    #
    # + parentId - Id of the parent. 
    # + id - Id of the custom object data. 
    # + payload - The request body defines the details of the custom object data to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualCustomObjectPUTRest20(int parentId, int id, CustomObjectDataRest20 payload) returns CustomObjectDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/customObject/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectDataRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete custom object data
    #
    # + parentId - Id of the parent. 
    # + id - Id of the custom object data. 
    # + return - OK. 
    remote isolated function deleteCustomObjectData(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/customObject/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of custom object data
    #
    # + parentId - Id of the parent. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of custom object data assets to return (the count parameter defines the number of custom object data assets per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + return - OK. 
    remote isolated function searchListOfCustomObjectDataGETRest20(int parentId, string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = ()) returns QueryResultCustomObjectDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/customObject/${getEncodedUri(parentId)}/instances`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultCustomObjectDataRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve processed form data for a single form
    #
    # + id - The ID of the form 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + startAt - The earliest date time for which the request will retrieve data, expressed in Unix time. 
    # + endAt - The latest date time for which the request will retrieve data, expressed in Unix time. 
    # + return - OK. 
    remote isolated function searchFormDataGETRest20(int id, int? count = (), int? page = (), int? startAt = (), int? endAt = ()) returns QueryResultFormSubmissionRest20|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"count": count, "page": page, "startAt": startAt, "endAt": endAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFormSubmissionRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create form data for a single form
    #
    # + id - The ID of the form 
    # + payload - The request body defines the details of the form data to be created. 
    # + return - Success. 
    remote isolated function createIndividualFormPOSTRest20(int id, FormDataRest20 payload) returns FormDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormDataRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete form data
    #
    # + id - The ID of the form 
    # + rowId - The ID of the form data 
    # + return - Success 
    remote isolated function deleteFormData(int id, int rowId) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(id)}/datarow/${getEncodedUri(rowId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a single form submit job
    #
    # + formId - The ID of the form 
    # + formSubmitJobId - The ID of the asynchronous form submission job 
    # + return - Bad request. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>Status Codes</a> for information about other possible HTTP status codes. 
    remote isolated function getAsyncFormSubmissionGETRest20(string formId, string formSubmitJobId) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(formId)}/formData/${getEncodedUri(formSubmitJobId)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve all form submit jobs for a single form
    #
    # + formId - The ID of the form 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + startAt - The earliest date time for which the request will retrieve data, expressed in Unix time. 
    # + return - Bad request. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>Status Codes</a> for information about other possible HTTP status codes. 
    remote isolated function searchAsyncFormSubmissionGETRest20(string formId, string? count = (), string? page = (), string? search = (), int? startAt = ()) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(formId)}/formData`;
        map<anydata> queryParam = {"count": count, "page": page, "search": search, "startAt": startAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve all spam form submit jobs for a single form
    #
    # + formId - ID of the form. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + startAt - The earliest date time for which the request will retrieve data, expressed in Unix time. 
    # + return - Bad request. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>Status Codes</a> for information about other possible HTTP status codes. 
    remote isolated function searchFormSpamSubmissionGETRest20(string formId, int? count = (), int? page = (), string? search = (), int? startAt = ()) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(formId)}/formSpamData`;
        map<anydata> queryParam = {"count": count, "page": page, "search": search, "startAt": startAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create form data in batch for a single form
    #
    # + id - The ID of the form 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + payload - The request body defines the details of the form data in a batch to be created. 
    # + return - Success. 
    remote isolated function createBatchRequestPOSTRest20(int id, AsyncFormSubmissionBatchRest20 payload, string? depth = ()) returns AsyncFormSubmissionBatchRest20|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(id)}/batch`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsyncFormSubmissionBatchRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve batch form submission details by batchId
    #
    # + formId - The ID of the form 
    # + batchId - The ID of the batch 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function getAsyncFormSubmissionBatchByBatchIdGETRest20(int formId, string batchId, string? depth = ()) returns AsyncFormSubmissionBatchRest20|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(formId)}/batch/formData/${getEncodedUri(batchId)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AsyncFormSubmissionBatchRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve batch form submission details by batchCorrelationId
    #
    # + formId - The ID of the form 
    # + batchCorrelationId - The Correlation ID of the batch 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function getAsyncFormSubmissionBatchByBatchCorrelationIdGETRest20(int formId, string batchCorrelationId, string? depth = ()) returns AsyncFormSubmissionBatchRest20|error {
        string resourcePath = string `/api/REST/2.0/data/form/${getEncodedUri(formId)}/batchCorrelation/formData/${getEncodedUri(batchCorrelationId)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AsyncFormSubmissionBatchRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve contact list membership information for a contact
    #
    # + id - Id of the contact to retrieve. 
    # + return - OK. 
    remote isolated function listGroupMembershipForContactGETRest20(int id) returns ContactListRest20|error {
        string resourcePath = string `/api/REST/2.0/data/contact/${getEncodedUri(id)}/membership`;
        ContactListRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve contact information
    #
    # + xHttpMethodOverride - The request header <code>X-HTTP-Method-Override</code> must be set with value <code>SEARCH</code>. 
    # + payload - The request body defines the details of the request. 
    # + return - OK. 
    remote isolated function searchContactsSEARCHRest20(string xHttpMethodOverride, EntitySearchByIdsRest20 payload) returns ContactRest20|error {
        string resourcePath = string `/api/REST/2.0/data/contacts`;
        map<any> headerValues = {"X-HTTP-Method-Override": xHttpMethodOverride};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactRest20 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a form
    #
    # + payload - The request body defines the details of the form to be created. 
    # + return - Success. 
    remote isolated function createIndividualFormsPOSTRest20(FormRest20 payload) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a form
    #
    # + id - Id of the form. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualFormGETRest20(int id, string? depth = ()) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FormRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a form
    #
    # + id - Id of the form. 
    # + payload - The request body defines the details of the form to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualFormPUTRest20(int id, FormRest20 payload) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a form
    #
    # + id - Id of the form. 
    # + return - OK. 
    remote isolated function deleteFormRest20(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Partially update a form
    #
    # + id - Id of the form. 
    # + payload - The request body defines the details of the form for which properties are to be updated. 
    # + return - OK. 
    remote isolated function patchContentPATCHRest20(int id, FormRest20 payload) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest20 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Archive a form
    #
    # + id - ID of the form to be archived. 
    # + payload - The request body defines the parameters for archiving the form. 
    # + return - Success. 
    remote isolated function archiveIndividualFormPOSTRest20(int id, ArchiveParameterRest20 payload) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unarchive a form
    #
    # + id - ID of the form to be unarchived. 
    # + payload - The request body defines the parameters for unarchiving the form. 
    # + return - Success. 
    remote isolated function unarchiveIndividualFormPOSTRest20(int id, ArchiveParameterRest20 payload) returns FormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/form/${getEncodedUri(id)}/unarchive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of forms
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the form was last updated. 
    # + includeAvailable - Specifies whether to include unarchived forms in the results, considered true if not specified. 
    # + includeArchived - Specifies whether to include archived forms in the results, considered false if not specified. 
    # + return - OK. 
    remote isolated function searchFormListGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = (), boolean? includeAvailable = (), boolean? includeArchived = ()) returns QueryResultFormRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/forms`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt, "includeAvailable": includeAvailable, "includeArchived": includeArchived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFormRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a campaign
    #
    # + payload - The request body defines the details of the campaign to be created. 
    # + return - Success 
    remote isolated function createIndividualCampaignsPOSTRest20(CampaignRest20 payload) returns CampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a campaign
    #
    # + id - Id of the campaign. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualCampaignGETRest20(int id, string? depth = ()) returns CampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CampaignRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a campaign
    #
    # + id - Id of the campaign. 
    # + payload - The request body defines the details of the campaign to be updated. 
    # + return - OK 
    remote isolated function updateIndividualCampaignPUTRest20(string id, CampaignRest20 payload) returns CampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a campaign
    #
    # + id - Id of the campaign. 
    # + return - OK 
    remote isolated function deleteCampaign(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Activate a campaign
    #
    # + scheduledFor - The date and time for the campaign to activate on expressed in Unix time. Alternatively, you can activate the campaign immediately by specifying 'now'. 
    # + id - Id of the campaign. 
    # + runAsUserId - The username to activate the campaign. 
    # + activateNow - Whether or not to activate the campaign immediately. 
    # + return - Success 
    remote isolated function activateCampaignPOSTRest20(int id, string? scheduledFor = (), int? runAsUserId = (), boolean? activateNow = ()) returns CampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign/active/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"scheduledFor": scheduledFor, "runAsUserId": runAsUserId, "activateNow": activateNow};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignRest20 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Deactivate a campaign
    #
    # + id - Id of the campaign. 
    # + return - Success 
    remote isolated function deactivateCampaignPOSTRest20(int id) returns CampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaign/draft/${getEncodedUri(id)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignRest20 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Retrieve a list of campaigns
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. The default value is <code>minimal</code>. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the campaign was last updated. 
    # + return - OK 
    remote isolated function searchListOfCampaignsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultCampaignRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/campaigns`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultCampaignRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account group
    #
    # + payload - The request body defines the details of the account group to be created. 
    # + return - Success 
    remote isolated function createIndividualAccountGroupsPOSTRest20(AccountGroupRest20 payload) returns AccountGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/account/group`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountGroupRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an account group
    #
    # + id - Id of the account group. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualAccountGroupGETRest20(int id, string? depth = ()) returns AccountGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/account/group/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountGroupRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account group
    #
    # + id - Id of the account group. 
    # + payload - The request body defines the details of the account group to be updated. 
    # + return - OK 
    remote isolated function updateIndividualAccountGroupPUTRest20(int id, AccountGroupRest20 payload) returns AccountGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/account/group/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountGroupRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an account group
    #
    # + id - Id of the account group. 
    # + return - OK 
    remote isolated function deleteAccountGroup(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/account/group/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of account groups
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which account group results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the account group was last updated. 
    # + return - OK 
    remote isolated function searchListOfAccountGroupsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultAccountGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/account/groups`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultAccountGroupRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create and send an email deployment
    #
    # + preMerge - Whether or not the email header and footer is inserted into the email body. If <code>true</code>, the email header and footer will not be inserted into the email body. If <code>false</code>, the email header and footer will be inserted into the email body.  
    # + payload - The request body defines the details of the email deployment to be created. 
    # + return - Success 
    remote isolated function createIndividualEmailDeploymentPOSTRest20(EmailDeploymentRest20 payload, boolean? preMerge = ()) returns EmailDeploymentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/deployment`;
        map<anydata> queryParam = {"preMerge": preMerge};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailDeploymentRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email deployment
    #
    # + id - Id of the email deployment. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. Any other values passed are reset to complete by default. 
    # + return - OK 
    remote isolated function readIndividualEmailDeploymentGETRest20(int id, string? depth = ()) returns EmailDeploymentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/deployment/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailDeploymentRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email
    #
    # + payload - The request body defines the details of the email to be created. 
    # + return - Success 
    remote isolated function createIndividualEmailPOSTRest20(EmailRest20 payload) returns EmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email
    #
    # + id - Id of the email. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + preMerge - This property is used by Oracle Engage. 
    # + noMergeContent - Whether email components are dynamically populated upon retrieve. If set to true, email components are populated. If set to false, the default content of the email component will be returned. The default is true. 
    # + return - OK 
    remote isolated function readIndividualEmailGETRest20(int id, string? depth = (), boolean? preMerge = (), boolean? noMergeContent = ()) returns EmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth, "preMerge": preMerge, "noMergeContent": noMergeContent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email
    #
    # + id - Id of the email. 
    # + payload - The request body defines the details of the email to be updated. 
    # + return - OK 
    remote isolated function updateIndividualEmailPUTRest20(int id, EmailRest20 payload) returns EmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email
    #
    # + id - Id of the email. 
    # + return - OK 
    remote isolated function deleteEmailRest20(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/email/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of emails
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the email was last updated. 
    # + includeAvailable - Specifies whether to include unarchived emails in the results, considered true if not specified. 
    # + includeArchived - Specifies whether to include archived emails in the results, considered false if not specified. 
    # + return - OK 
    remote isolated function searchListOfEmailsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = (), boolean? includeAvailable = (), boolean? includeArchived = ()) returns QueryResultEmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/emails`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt, "includeAvailable": includeAvailable, "includeArchived": includeArchived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultEmailRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive an email
    #
    # + id - ID of the email to be archived. 
    # + payload - The request body defines the parameters for archiving the email. 
    # + return - Success. 
    remote isolated function archiveIndividualEmailPOSTRest20(int id, ArchiveParameterRest20 payload) returns EmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/${getEncodedUri(id)}/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unarchive an email
    #
    # + id - ID of the email to be unarchived. 
    # + payload - The request body defines the parameters for unarchiving the email. 
    # + return - Success. 
    remote isolated function unarchiveIndividualEmailPOSTRest20(int id, ArchiveParameterRest20 payload) returns EmailRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/email/${getEncodedUri(id)}/unarchive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of custom object data
    #
    # + id - Id of the custom object. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the custom object was last updated. This is a read-only property. 
    # + return - OK. 
    remote isolated function searchCustomObjectData(int id, int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultCustomObjectDataRest10|error? {
        string resourcePath = string `/api/REST/1.0/data/customObject/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultCustomObjectDataRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create custom object data
    #
    # + id - Id of the custom object. 
    # + payload - The request body defines the details of the custom object data to be created. 
    # + return - Success. 
    remote isolated function createCustomObject(int id, CustomObjectDataRest10 payload) returns CustomObjectDataRest10|error {
        string resourcePath = string `/api/REST/1.0/data/customObject/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectDataRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a contact
    #
    # + payload - The request body defines the details of the contact to be created. 
    # + return - Success 
    remote isolated function createContacts(ContactRest10 payload) returns ContactRest10|error {
        string resourcePath = string `/api/REST/1.0/data/contact`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact
    #
    # + id - Id of the contact. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + viewId - Id of the contact view. 
    # + return - OK 
    remote isolated function readIndividualContact(int id, string? depth = (), int? viewId = ()) returns ContactRest10|error {
        string resourcePath = string `/api/REST/1.0/data/contact/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth, "viewId": viewId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact
    #
    # + id - Id of the contact. 
    # + payload - The request body defines the details of the contact to be updated. 
    # + return - OK 
    remote isolated function updateContact(int id, ContactRest10 payload) returns ContactRest10|error {
        string resourcePath = string `/api/REST/1.0/data/contact/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact
    #
    # + id - Id of the contact 
    # + return - No matching contacts were found in the search 
    remote isolated function deleteContact(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/data/contact/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of contacts
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the contact was last updated. This is a read-only property. 
    # + viewId - Id of the contact view to filter results. Must be a valid contact view id. Example: <code>?viewId=100006</code>. 
    # + return - OK 
    remote isolated function searchListOfContacts(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = (), int? viewId = ()) returns QueryResultContactRest10|error? {
        string resourcePath = string `/api/REST/1.0/data/contacts`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt, "viewId": viewId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultContactRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of activities
    #
    # + id - Id of the activity. 
    # + 'type - The type of activity you wish to retrieve from the specified contact: <code>emailOpen</code>, <code>emailSend</code>, <code>emailClickThrough</code>, <code>emailSubscribe</code>, <code>emailUnsubscribe</code>, <code>formSubmit</code>, <code>webVisit</code>, or <code>campaignMembership</code>. 
    # + startDate - The start date and time (10 digit integer Unix time). 
    # + endDate - The end date and time (10 digit integer Unix time). 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + return - OK 
    remote isolated function getActivitiesGETRest10(int id, string 'type, int startDate, int endDate, int? count = ()) returns ActivityRest10|error? {
        string resourcePath = string `/api/REST/1.0/data/activities/contact/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"type": 'type, "startDate": startDate, "endDate": endDate, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ActivityRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a user
    #
    # + payload - The request body defines the details of the user to be created. 
    # + return - Success 
    remote isolated function createIndividualUserPOSTRest20(UserRest20 payload) returns UserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a user
    #
    # + id - The user ID to retrieve 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualUserGETRest20(int id, string? depth = ()) returns UserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/user/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a user
    #
    # + id - The ID of the user to update 
    # + payload - The request body defines the details of the user to be updated 
    # + return - OK 
    remote isolated function updateIndividualUserPUTRest20(int id, UserRest20 payload) returns UserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/user/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a user
    #
    # + id - The user ID to delete 
    # + return - OK 
    remote isolated function deleteUser(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/system/user/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve the current user
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function getCurrentUserGETRest20(string? depth = ()) returns UserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/user/current`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a user's password
    #
    # + id - The id of the user to update the password 
    # + payload - The request body defines the details of the request 
    # + return - OK 
    remote isolated function updatePasswordPUTRest20(int id, UserPasswordRest20 payload) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/system/user/${getEncodedUri(id)}/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Enable or disable a user
    #
    # + id - The ID of the user to enable or disable 
    # + payload - The request body defines whether to enable or disable the user with the specified ID 
    # + return - OK 
    remote isolated function updateEnabledPUTRest20(int id, UserEnabledRest20 payload) returns UserEnabledRest20|error {
        string resourcePath = string `/api/REST/2.0/system/user/${getEncodedUri(id)}/enabled`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserEnabledRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Retrieve a list of users
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. The default value is <code>minimal</code>. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the user was last updated. 
    # + return - OK 
    remote isolated function searchListOfUsersGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultUserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/users`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultUserRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact segment
    #
    # + payload - The request body defines the details of the contact segment to be created. 
    # + return - Success 
    remote isolated function createContactSegments(ContactSegmentRest10 payload) returns ContactSegmentRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/segment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactSegmentRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact segment
    #
    # + id - Id of the contact segment. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualContactSegment(int id, string? depth = ()) returns ContactSegmentRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/segment/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactSegmentRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact segment
    #
    # + id - Id of the contact segment. 
    # + payload - The request body defines the details of the contact segment to be update. 
    # + return - OK 
    remote isolated function updateContactSegment(int id, ContactSegmentRest10 payload) returns ContactSegmentRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/segment/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactSegmentRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact segment
    #
    # + id - Id of the contact segment. 
    # + return - OK 
    remote isolated function deleteContactSegment(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/segment/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of contact segments
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the contact segment was last updated. 
    # + return - OK 
    remote isolated function searchListOfContactSegments(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultSegmentRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/segments`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultSegmentRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact list
    #
    # + payload - The request body defines the details of the contact list to be created. 
    # + return - Success 
    remote isolated function createContactList(ContactListRest10 payload) returns ContactListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/list`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactListRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact list
    #
    # + id - Id of the contact list. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readContactList(int id, string? depth = ()) returns ContactListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/list/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactListRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact list
    #
    # + id - Id of the contact list. 
    # + payload - The request body defines the details of the contact list to be updated. 
    # + return - OK 
    remote isolated function updateContactList(int id, ContactListRest10 payload) returns ContactListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/list/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactListRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact list
    #
    # + id - Id of the contact list. 
    # + return - OK 
    remote isolated function deleteContactList(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/list/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of contact lists
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the contact list was last updated. 
    # + return - OK 
    remote isolated function searchListOfContactList(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/lists`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultListRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an option list
    #
    # + id - Id of the option list. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readOptionList(int id, string? depth = ()) returns OptionListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/optionList/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OptionListRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an option list
    #
    # + id - Id of the option list. This is a read-only property. 
    # + payload - The request body defines the details of the option list to be updated. 
    # + return - OK. 
    remote isolated function updateOptionList(int id, OptionListRest10 payload) returns OptionListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/optionList/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OptionListRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an option list
    #
    # + id - Id of the option list 
    # + return - OK. 
    remote isolated function deleteOptionList(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/optionList/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of option lists
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the option list was last updated. 
    # + return - OK. 
    remote isolated function searchListOfOptions(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultOptionListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/optionLists`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultOptionListRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an option list
    #
    # + payload - The request body defines the details of the option list to be created. 
    # + return - Success. 
    remote isolated function createOptionLists(OptionListRest10 payload) returns OptionListRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/optionList`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OptionListRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a microsite
    #
    # + payload - The request body defines the details of the microsite to be updated. 
    # + return - Success. 
    remote isolated function createMicrosites(MicrositeRest10 payload) returns MicrositeRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/microsite`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MicrositeRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a microsite
    #
    # + id - Id of the microsite. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readMicrosite(int id, string? depth = ()) returns MicrositeRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/microsite/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MicrositeRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a microsite
    #
    # + id - Id of the microsite. 
    # + payload - The request body defines the details of the microsite to be created. 
    # + return - OK. 
    remote isolated function updateMicrosite(int id, MicrositeRest10 payload) returns MicrositeRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/microsite/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MicrositeRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a microsite
    #
    # + id - Id of the microsite. This is a read-only property. 
    # + return - OK. 
    remote isolated function deleteMicrosite(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/microsite/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of microsites
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the microsite was last updated. 
    # + return - OK. 
    remote isolated function searchListOfMicrosites(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultMicrositeRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/microsites`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultMicrositeRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an image
    #
    # + id - Id of the image. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readImage(int id, string? depth = ()) returns ImageFileRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/image/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ImageFileRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an image
    #
    # + id - Id of the image to update. 
    # + payload - The request body defines the details of the image to be created. 
    # + return - OK. 
    remote isolated function updateImage(int id, ImageFileRest10 payload) returns ImageFileRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/image/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImageFileRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an image
    #
    # + id - Id of the image to delete. 
    # + return - OK. 
    remote isolated function deleteImage(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/image/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload an image
    #
    # + return - Success. 
    remote isolated function createUploadImagePOSTRest10() returns ImageFileRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/image/content`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ImageFileRest10 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Retrieve a list of images
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the image was last updated. 
    # + return - OK. 
    remote isolated function searchListOfImages(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultImageRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/images`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultImageRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a form
    #
    # + payload - The request body defines the details of the form to be created. 
    # + return - Success. 
    remote isolated function createForms(FormRest10 payload) returns FormRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/form`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a form
    #
    # + id - Id of the form. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readForm(int id, string? depth = ()) returns FormRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/form/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FormRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a form
    #
    # + id - Id of the form. 
    # + payload - The request body defines the details of the form to be updated. 
    # + return - OK. 
    remote isolated function updateForm(int id, FormRest10 payload) returns FormRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/form/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a form
    #
    # + id - Id of the form. 
    # + return - OK. 
    remote isolated function deleteForm(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/form/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of forms
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the form was last updated. 
    # + return - OK. 
    remote isolated function searchListOfForms(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultFormRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/forms`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFormRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email folder
    #
    # + payload - The request body defines the details of the email folder to be created. 
    # + return - Success. 
    remote isolated function createEmailFolders(FolderRest10 payload) returns FolderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/folder`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FolderRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email folder
    #
    # + id - Id of the email folder to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readEmailAsset(int id, string? depth = ()) returns FolderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/folder/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FolderRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email folder
    #
    # + id - Id of the email folder to update. 
    # + payload - The request body defines the details of the email folder to be updated. 
    # + return - OK. 
    remote isolated function updateEmailFolder(int id, FolderRest10 payload) returns FolderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/folder/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FolderRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email folder
    #
    # + id - Id of the email folder to delete. 
    # + return - OK. 
    remote isolated function deleteEmailFolder(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/email/folder/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of email folders
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - When the email folder was last updated. 
    # + return - OK. 
    remote isolated function searchEmailFolders(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultFolderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/folders`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFolderRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email header
    #
    # + payload - The request body defines the details of the email header to be updated. 
    # + return - Success 
    remote isolated function createEmailHeaders(EmailHeaderRest10 payload) returns EmailHeaderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/header`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailHeaderRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email header
    #
    # + id - Id of the email header to be retrieved. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readEmailHeaders(int id, string? depth = ()) returns EmailHeaderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/header/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailHeaderRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email header
    #
    # + id - Id of the email header to update. 
    # + payload - The request body defines the details of the email header to be created. 
    # + return - OK. 
    remote isolated function updateEmailHeader(int id, EmailHeaderRest10 payload) returns EmailHeaderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/header/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailHeaderRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email header
    #
    # + id - Id of the email header to be deleted. 
    # + return - OK. 
    remote isolated function deleteEmailHeaders(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/email/header/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of email headers
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - When the email header was last updated. 
    # + return - OK. 
    remote isolated function searchEmailHeaders(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultHeaderRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/headers`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultHeaderRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email group
    #
    # + payload - The request body defines the details of the email group to be created. 
    # + return - Success. 
    remote isolated function createEmailGroups(EmailGroupRest10 payload) returns EmailGroupRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/group`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailGroupRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email group
    #
    # + id - Id of the email group. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readEmailGroup(int id, string? depth = ()) returns EmailGroupRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/group/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailGroupRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email group
    #
    # + id - Id of the email group to update. 
    # + payload - The request body defines the details of the email group to be updated. 
    # + return - OK. 
    remote isolated function updateEmailGroup(int id, EmailGroupRest10 payload) returns EmailGroupRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/group/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailGroupRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email group
    #
    # + id - Id of the email group to delete. 
    # + return - OK. 
    remote isolated function deleteEmailGroups(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/email/group/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of email groups
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the email group was last updated. 
    # + return - OK. 
    remote isolated function searchEmailGroups(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultGroupRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/groups`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultGroupRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an email footer
    #
    # + payload - The request body defines the details of the email footer to be created. 
    # + return - Success. 
    remote isolated function createEmailFooters(EmailFooterRest10 payload) returns EmailFooterRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/footer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailFooterRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an email footer
    #
    # + id - Id of the email footer. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readEmailFooter(int id, string? depth = ()) returns EmailFooterRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/footer/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailFooterRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an email footer
    #
    # + id - Id of the email footer to update. 
    # + payload - The request body defines the details of the email footer to be updated. 
    # + return - OK. 
    remote isolated function updateEmailFooter(int id, EmailFooterRest10 payload) returns EmailFooterRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/footer/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailFooterRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an email footer
    #
    # + id - Id of the email footer to delete. 
    # + return - OK. 
    remote isolated function deleteEmailFooters(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/email/footer/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of email footers
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the email footer was last updated. 
    # + return - OK. 
    remote isolated function searchListOfEmailFooters(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultFooterRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/email/footers`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultFooterRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a custom object
    #
    # + payload - The request body defines the details of the custom object to be created. 
    # + return - Success 
    remote isolated function createCustomObjects(CustomObjectRest10 payload) returns CustomObjectRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/customObject`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a custom object
    #
    # + id - Id of the custom object. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readCustomObjects(int id, string? depth = ()) returns CustomObjectRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/customObject/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomObjectRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a custom object
    #
    # + id - Id of the custom object. 
    # + payload - The request body defines the details of the custom object to be updated. 
    # + return - OK. 
    remote isolated function updateCustomObject(int id, CustomObjectRest10 payload) returns CustomObjectRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/customObject/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom object
    #
    # + id - Id of the custom object. 
    # + return - No matching custom objects were found in the search. 
    remote isolated function deleteCustomObjectSyncActionOperationData(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/customObject/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of custom objects
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the custom object was last updated. 
    # + return - OK. 
    remote isolated function searchCustomObjects(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultCustomObjectRest10|error? {
        string resourcePath = string `/api/REST/1.0/assets/customObjects`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultCustomObjectRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a content section
    #
    # + payload - The request body defines the details of the content section to be created. 
    # + return - Success 
    remote isolated function createContentSections(ContentSectionRest10 payload) returns ContentSectionRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contentSection`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContentSectionRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a content section
    #
    # + id - Id of the content section. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readContentSections(int id, string? depth = ()) returns ContentSectionRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contentSection/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContentSectionRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a content section
    #
    # + id - Id of the content section. 
    # + payload - The request body defines the details of the content section to be updated. 
    # + return - OK 
    remote isolated function updateContentSection(int id, ContentSectionRest10 payload) returns ContentSectionRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contentSection/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContentSectionRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a content section
    #
    # + id - Id of the content section. 
    # + return - OK 
    remote isolated function deleteContentSection(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/contentSection/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of content sections
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the content section was last updated. 
    # + return - OK 
    remote isolated function searchContentSections(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultContentSectionRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contentSections`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultContentSectionRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a contact field
    #
    # + id - Id of the contact field to be retrieved. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readContactFields(int id, string? depth = ()) returns ContactFieldRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/field/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactFieldRest10 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact field
    #
    # + id - Id of the contact field to be updated. 
    # + payload - List of contact fields. 
    # + return - OK 
    remote isolated function updateContactField(int id, ContactFieldRest10 payload) returns ContactFieldRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/field/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactFieldRest10 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact field
    #
    # + id - Id of the contact field to delete. 
    # + return - No matching contact fields were found in the search. 
    remote isolated function deleteContactFields(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/field/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a contact field
    #
    # + payload - The request body defines the details of the contact field to be created. 
    # + return - Success 
    remote isolated function createContactFields(ContactFieldRest10 payload) returns ContactFieldRest10|error {
        string resourcePath = string `/api/REST/1.0/assets/contact/field`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactFieldRest10 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of contact fields
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the contact field was last updated. 
    # + return - OK 
    remote isolated function searchContactFields(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultContactFieldRest10|error? {
        string resourcePath = string `/api/REST/1.0/assets/contact/fields`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultContactFieldRest10? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve security groups
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. The default value is <code>minimal</code>. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the security group was last updated. 
    # + return - OK 
    remote isolated function searchSecurityGroupsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultSecurityGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/system/security/groups`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultSecurityGroupRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of users
    #
    # + id - The security group id, from which you want to retrieve users 
    # + return - OK 
    remote isolated function getUsersGETRest20(int id) returns QueryResultSecurityGroupUserRest20|error {
        string resourcePath = string `/api/REST/2.0/system/security/group/${getEncodedUri(id)}/users`;
        QueryResultSecurityGroupUserRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve visitor data
    #
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of visitors to return (the <code>count</code> parameter defines the number of visitors per page). If the <code>page</code> parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. Possible values include:  <code>visitorId</code>, <code>contactId</code>, <code>externalId</code>, <code>customerGuid</code>, <code>v_IPAddress</code>, and <code>v_LastVisitDateAndTime</code>. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + return - OK. 
    remote isolated function searchVisitorDataGETRest20(int? count = (), int? page = (), string? search = (), string? orderBy = (), string? depth = ()) returns QueryResultVisitorViewDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/visitors`;
        map<anydata> queryParam = {"count": count, "page": page, "search": search, "orderBy": orderBy, "depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultVisitorViewDataRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve visitor data by visitor GUID
    #
    # + xHttpMethodOverride - The request header <code>X-HTTP-Method-Override</code> must be set with value <code>SEARCH</code>. 
    # + payload - The request body defines the details of the request. 
    # + return - OK. 
    remote isolated function searchPostSEARCHRest20(string xHttpMethodOverride, EntitySearchByExternalIdsRest20 payload) returns QueryResultVisitorViewDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/visitors`;
        map<any> headerValues = {"X-HTTP-Method-Override": xHttpMethodOverride};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QueryResultVisitorViewDataRest20 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Initiate an audit log export
    #
    # + payload - Audit log export request 
    # + return - Request for the audit log has been registered. An email containing a link to the exported data will be sent to the email address for export notification 
    remote isolated function queueReportExportPOSTRest20(AuditLogReportRequestRest20 payload) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/auditLog/reportExport`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve account group membership information for an account
    #
    # + id - Id of the account to retrieve. 
    # + return - OK. 
    remote isolated function listGroupMembershipForAccountGETRest20(int id) returns AccountGroupRest20|error {
        string resourcePath = string `/api/REST/2.0/data/account/${getEncodedUri(id)}/membership`;
        AccountGroupRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve account information
    #
    # + xHttpMethodOverride - The request header <code>X-HTTP-Method-Override</code> must be set with value <code>SEARCH</code>. 
    # + payload - The request body defines the details of the request. 
    # + return - OK. 
    remote isolated function searchAccountsSEARCHRest20(string xHttpMethodOverride, EntitySearchByIdsRest20 payload) returns AccountRest20|error {
        string resourcePath = string `/api/REST/2.0/data/accounts`;
        map<any> headerValues = {"X-HTTP-Method-Override": xHttpMethodOverride};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountRest20 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create an external activity
    #
    # + payload - The request body defines the details of the external activity to be created. 
    # + return - Success. 
    remote isolated function createIndividualExternalActivityPOSTRest20(ExternalActivitiesRest20 payload) returns ExternalActivitiesRest20|error {
        string resourcePath = string `/api/REST/2.0/data/activity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalActivitiesRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an external activity
    #
    # + id - Id of the external activity to retrieve. 
    # + return - OK. 
    remote isolated function readIndividualExternalActivityGETRest20(int id) returns ExternalActivitiesRest20|error {
        string resourcePath = string `/api/REST/2.0/data/activity/${getEncodedUri(id)}`;
        ExternalActivitiesRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an event registrant
    #
    # + parentId - Id of the parent event. 
    # + payload - The request body defines the details of the event registrant to be created. 
    # + return - Success. 
    remote isolated function createIndividualEventRegistrantsPOSTRest20(int parentId, EventRegistrationDataRest20 payload) returns EventRegistrationDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/eventRegistration/${getEncodedUri(parentId)}/instance`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventRegistrationDataRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an event registrant
    #
    # + parentId - Id of the parent event. 
    # + id - Id of the event registrant. 
    # + depth - This parameter is not used for this endpoint. 
    # + return - OK. 
    remote isolated function readIndividualEventRegistrantGETRest20(int parentId, int id, string? depth = ()) returns EventRegistrationDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/eventRegistration/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EventRegistrationDataRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an event registrant
    #
    # + parentId - Id of the parent event. 
    # + id - Id of the event registrant. 
    # + payload - The request body defines the details of the event registrant to be updated. Note: Only <code>fieldValues</code> and <code>contactId</code> can be updated. <code>fieldValues</code> is required, even if not updating any fields. To update <code>contactId</code>, include <code>fieldValues</code> with an empty array. 
    # + return - OK. 
    remote isolated function updateIndividualEventRegistrantPUTRest20(int parentId, int id, EventRegistrationDataRest20 payload) returns EventRegistrationDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/eventRegistration/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventRegistrationDataRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an event registrant
    #
    # + parentId - Id of the parent event. 
    # + id - Id of the event registrant. 
    # + return - OK. 
    remote isolated function deleteEvent(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/data/eventRegistration/${getEncodedUri(parentId)}/instance/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of event registrants
    #
    # + parentId - Id of the parent event. 
    # + depth - This parameter is not used for this endpoint. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of event registrant to return (the count parameter defines the number of event registrant assets per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + return - OK. 
    remote isolated function searchListOfEventRegistrantsGETRest20(int parentId, string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = ()) returns QueryResultEventRegistrationDataRest20|error {
        string resourcePath = string `/api/REST/2.0/data/eventRegistration/${getEncodedUri(parentId)}/instances`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultEventRegistrationDataRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a landing page
    #
    # + payload - The request body defines the details of the landing page to be created. 
    # + return - Success. 
    remote isolated function createIndividualLandingPagePOSTRest20(LandingPageRest20 payload) returns LandingPageRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/landingPage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPageRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a landing page
    #
    # + id - Id of the landing page to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + noMergeContent - Whether landing page components are dynamically populated upon retrieve. If set to true, landing page components are populated. If set to false, the default content of the landing page component will be returned. The default is true. 
    # + return - OK. 
    remote isolated function readIndividualLandingPageGETRest20(int id, string? depth = (), boolean? noMergeContent = ()) returns LandingPageRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/landingPage/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth, "noMergeContent": noMergeContent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LandingPageRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a landing page
    #
    # + id - Id of the landing page to update. 
    # + payload - The request body defines the details of the landing page to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualLandingPagePUTRest20(int id, LandingPageRest20 payload) returns LandingPageRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/landingPage/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPageRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a landing page
    #
    # + id - Id of the landing page to delete. 
    # + return - OK. 
    remote isolated function deleteLandingPage(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/landingPage/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of landing pages
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered, and the direction. The direction will default to ASC if not specified. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAC/APIRequests_URLParameters.html'>URL parameters</a> for information. 
    # + lastUpdatedAt - Unix timestamp for the date and time the external asset was last updated. 
    # + return - OK. 
    remote isolated function searchListOfLandingPagesGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultLandingPageRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/landingPages`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultLandingPageRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an event
    #
    # + payload - The request body defines the details of the event to be created. 
    # + return - Success. 
    remote isolated function createIndividualEventPOSTRest20(EventRegistrationRest20 payload) returns EventRegistrationRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/eventRegistration`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventRegistrationRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an event
    #
    # + id - Id of the event. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualEventGETRest20(int id, string? depth = ()) returns EventRegistrationRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/eventRegistration/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EventRegistrationRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an event
    #
    # + id - Id of the event. 
    # + payload - The request body defines the details of the event to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualEventPUTRest20(int id, EventRegistrationRest20 payload) returns EventRegistrationRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/eventRegistration/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventRegistrationRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an event
    #
    # + id - Id of the event. 
    # + return - OK. 
    remote isolated function deleteEventRest20(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/eventRegistration/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of events
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the event was last updated. 
    # + return - OK. 
    remote isolated function searchListOfEventsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultEventRegistrationRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/eventRegistrations`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultEventRegistrationRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an external asset
    #
    # + payload - The request body defines the details of the external asset to be created. 
    # + return - Success. 
    remote isolated function createIndividualExternalAssetPOSTRest20(ExternalAssetRest20 payload) returns ExternalAssetRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalAssetRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an external asset
    #
    # + id - Id of the external asset. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualExternalAssetGETRest20(int id, string? depth = ()) returns ExternalAssetRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExternalAssetRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an external asset
    #
    # + id - Id of the external asset. 
    # + payload - The request body defines the details of the external asset to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualExternalAssetPUTRest20(int id, ExternalAssetRest20 payload) returns ExternalAssetRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalAssetRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an external asset
    #
    # + id - Id of the external asset to delete. 
    # + return - OK. 
    remote isolated function deleteExternalAsset(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/external/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of external assets
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the external asset was last updated. 
    # + return - OK. 
    remote isolated function searchListOfExternalAssetsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultExternalAssetRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/externals`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultExternalAssetRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an external asset type
    #
    # + payload - The request body defines the details of the external asset type to be created. 
    # + return - Success. 
    remote isolated function createIndividualExternalAssetTypePOSTRest20(ExternalAssetTypeRest20 payload) returns ExternalAssetTypeRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/type`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalAssetTypeRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an external asset type
    #
    # + id - Id of the external asset type to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualExternalAssetTypeGETRest20(int id, string? depth = ()) returns ExternalAssetTypeRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/type/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExternalAssetTypeRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an external asset type
    #
    # + id - Id of the external asset type to update. 
    # + payload - The request body defines the details of the external asset type to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualExternalAssetTypesPUTRest20(int id, ExternalAssetTypeRest20 payload) returns ExternalAssetTypeRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/type/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalAssetTypeRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an external asset type
    #
    # + id - Id of the external asset type. 
    # + return - OK. 
    remote isolated function deleteExternalAssetType(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/external/type/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of external asset types
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the external asset was last updated. 
    # + return - OK. 
    remote isolated function searchListOfExternalAssetTypesGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultExternalAssetTypeRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/external/types`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultExternalAssetTypeRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a custom object
    #
    # + payload - The request body defines the details of the custom object to be created. 
    # + return - Success. 
    remote isolated function createIndividualCustomObjectPOSTRest20(CustomObjectRest20 payload) returns CustomObjectRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/customObject`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a custom object
    #
    # + id - Id of the custom object 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK. 
    remote isolated function readIndividualCustomObjectGETRest20(int id, string? depth = ()) returns CustomObjectRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/customObject/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomObjectRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a custom object
    #
    # + id - Id of the custom object. 
    # + payload - The request body defines the details of the custom object to be updated. 
    # + return - OK. 
    remote isolated function updateIndividualCustomObjectsPUTRest20(int id, CustomObjectRest20 payload) returns CustomObjectRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/customObject/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom object
    #
    # + id - Id of the custom object 
    # + return - OK. 
    remote isolated function deleteCustomObject(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/customObject/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of custom objects
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the custom object was last updated. 
    # + return - OK. 
    remote isolated function searchListOfCustomObjectsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultCustomObjectRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/customObjects`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultCustomObjectRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of visitor profile fields
    #
    # + page - Specifies which page of visitor profile fields to return (the count parameter defines the number of visitor profile fields per page). If the page parameter is not supplied, 1 will be used by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + return - OK 
    remote isolated function getVisitorProfileFieldsGETRest20(int? page = (), int? count = ()) returns QueryResultProfileFieldRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/visitor/fields`;
        map<anydata> queryParam = {"page": page, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultProfileFieldRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a program
    #
    # + payload - The request body defines the details of the program to be created. 
    # + return - Created 
    remote isolated function createIndividualProgramsPOSTRest20(ProgramRest20 payload) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProgramRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a program
    #
    # + id - Id of the program to retrieve. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualProgramGETRest20(int id, string? depth = ()) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProgramRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a program
    #
    # + id - Id of the program to update. 
    # + payload - The request body defines the details of the program to be updated. 
    # + return - OK 
    remote isolated function updateIndividualProgramsPUTRest20(int id, ProgramRest20 payload) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProgramRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a program
    #
    # + id - Id of the program to delete. 
    # + return - OK 
    remote isolated function deleteProgram(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/program/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Activate a program
    #
    # + scheduledFor - The date and time for the program to activate on expressed in Unix time. Alternatively, you can activate the campaign immediately by specifying <code>now</code>. 
    # + id - Id of the program. 
    # + runAsUserId - The username to activate the program 
    # + return - Created 
    remote isolated function activateProgramPOSTRest20(int id, string? scheduledFor = (), int? runAsUserId = ()) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program/active/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"scheduledFor": scheduledFor, "runAsUserId": runAsUserId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProgramRest20 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Deactivate a program
    #
    # + id - Id of the program to deactivate. 
    # + return - Created 
    remote isolated function deactivateProgramPOSTRest20(int id) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program/draft/${getEncodedUri(id)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ProgramRest20 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Pause a program
    #
    # + id - Id of the program to pause. 
    # + return - Success 
    remote isolated function pauseIndividualPOSTRest20(int id) returns ProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/program/pause/${getEncodedUri(id)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ProgramRest20 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Retrieve a list of programs
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. The default value is <code>minimal</code>. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - The date and time the program was last updated. 
    # + return - OK 
    remote isolated function searchListOfProgramsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultProgramRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/programs`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultProgramRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact segment
    #
    # + payload - The request body defines the details of the contact segment to be created. 
    # + return - Success 
    remote isolated function createIndividualContactPOSTRest20(ContactSegmentRest20 payload) returns ContactSegmentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactSegmentRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a copy of a contact segment
    #
    # + id - Id of the segment to copy. 
    # + payload - The request body defines the details of the contact segment to be created from the source contact segment. 
    # + return - Created 
    remote isolated function createCopyPOSTRest20(int id, ContactSegmentRest20 payload) returns ContactSegmentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segment/${getEncodedUri(id)}/copy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactSegmentRest20 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact segment
    #
    # + id - Id of the contact segment. 
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    # + return - OK 
    remote isolated function readIndividualContactGETRest20(int id, string? depth = ()) returns ContactSegmentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segment/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"depth": depth};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactSegmentRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact segment
    #
    # + id - Id of the contact segment. 
    # + payload - The request body defines the details of the contact segment to be update. 
    # + return - OK 
    remote isolated function updateIndividualContactSegmentsPUTRest20(int id, ContactSegmentRest20 payload) returns ContactSegmentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segment/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactSegmentRest20 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact segment
    #
    # + id - Id of the contact segment. 
    # + return - OK 
    remote isolated function deleteContactSegmentRest20(int id) returns http:Response|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segment/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of contact segments
    #
    # + depth - Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>minimal</code> by default. 
    # + count - Maximum number of entities to return. Must be less than or equal to 1000 and greater than or equal to 1. 
    # + page - Specifies which page of entities to return (the count parameter defines the number of entities per page). If the page parameter is not supplied, 1 will be used by default. 
    # + search - Specifies the search criteria used to retrieve entities. See the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SearchParam'>tutorial</a> for information about using this parameter. 
    # + orderBy - Specifies the field by which list results are ordered. 
    # + lastUpdatedAt - Unix timestamp for the date and time the contact segment was last updated. 
    # + return - OK 
    remote isolated function searchListOfContactSegmentsGETRest20(string? depth = (), int? count = (), int? page = (), string? search = (), string? orderBy = (), int? lastUpdatedAt = ()) returns QueryResultSegmentRest20|error {
        string resourcePath = string `/api/REST/2.0/assets/contact/segments`;
        map<anydata> queryParam = {"depth": depth, "count": count, "page": page, "search": search, "orderBy": orderBy, "lastUpdatedAt": lastUpdatedAt};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueryResultSegmentRest20 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact export definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactExportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact export definition
    #
    # + payload - The request body contains details of the contact export definition. 
    # + return - Success. 
    remote isolated function postContactExportIndividual(ContactExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact export definition
    #
    # + id - Part of the uri used to identify the contact export. 
    # + return - OK. 
    remote isolated function getContactExportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact export definition
    #
    # + id - Part of the uri used to identify the contact export. 
    # + payload - The request body contains details of the contact export definition. 
    # + return - OK. 
    remote isolated function putContactExportIndividual(int id, Contactexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact export definition
    #
    # + id - Part of the uri used to identify the contact export. 
    # + return - No Content. 
    remote isolated function deleteContactExportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a contact export definition's synced data
    #
    # + id - Part of the uri used to identify the contact export. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactExportDataQuery(int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a contact export definition's data
    #
    # + id - Part of the uri used to identify the contact export. 
    # + return - No Content. 
    remote isolated function deleteContactExportDataQuery(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a contact field definition
    #
    # + id - Part of the uri used to identify the contact field. 
    # + return - OK. 
    remote isolated function getContactFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact field definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactFieldSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a contact filter
    #
    # + id - Number of results returned in the request. 
    # + return - OK. 
    remote isolated function getContactFilterIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/filters/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact filters
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactFilterSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/filters`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact import definition
    #
    # + payload - The request body contains details of the contact import definition. 
    # + return - Success. 
    remote isolated function postContactImportIndividual(ContactImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact import definition
    #
    # + id - Part of the uri used to identify the contact import. 
    # + return - OK. 
    remote isolated function getContactImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact import definition
    #
    # + id - Part of the uri used to identify the contact import. 
    # + payload - The request body contains details of the contact import definition. 
    # + return - OK. 
    remote isolated function putContactImportIndividual(int id, Contactimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact import definition
    #
    # + id - Part of the uri used to identify the contact import. 
    # + return - No Content. 
    remote isolated function deleteContactImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for a contact import definition
    #
    # + id - Part of the uri used to identify the contact import. 
    # + payload - The request body contains data to be uploaded to the contact import definition. 
    # + return - Success. 
    remote isolated function postContactImportData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/contacts/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a contact import definition's data
    #
    # + id - Part of the uri used to identify the contact import. 
    # + return - No Content. 
    remote isolated function deleteContactImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a contact list
    #
    # + id - Part of the uri used to identify the contact list. 
    # + return - OK. 
    remote isolated function getContactListIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/lists/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact lists
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactListSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/lists`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a lead scoring model
    #
    # + id - Id of the lead scoring model. 
    # + return - OK. 
    remote isolated function getLeadScoreModelIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/scoring/models/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of lead scoring models
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getLeadScoreModelSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/scoring/models`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a contact segment
    #
    # + id - Part of the uri used to identify the contact segment. 
    # + return - OK. 
    remote isolated function getContactSegmentIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/segments/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact segments
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a segment of relations separated by comma ",". For example, ?links=canonical,next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactSegmentSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/segments`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of contact sync action definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getContactSyncActionOperationSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a contact sync action definition
    #
    # + payload - The request body contains details of the contact sync action definition. 
    # + return - Success. 
    remote isolated function postContactSyncActionOperationIndividual(ContactSyncActionOperationIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a contact sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - OK. 
    remote isolated function getContactSyncActionOperationIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a contact sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body contains details of the contact sync action definition. 
    # + return - OK. 
    remote isolated function putContactSyncActionOperationIndividual(int id, Contactsyncactionoperationindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a contact sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteContactSyncActionOperationIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload contact sync action data
    #
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body contains details of the contact sync action data. 
    # + return - Success. 
    remote isolated function postContactSyncActionOperationData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete sync data for a contact sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteContactSyncActionOperationData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/contacts/syncActions/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of account export definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountExportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account export definition
    #
    # + payload - The request body contains details of the account export definition. 
    # + return - Success. 
    remote isolated function postAccountExportIndividual(AccountExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an account export definition
    #
    # + id - Part of the uri used to identify the account export. 
    # + return - OK. 
    remote isolated function getAccountExportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account export definition
    #
    # + id - Part of the uri used to identify the account export. 
    # + payload - The request body contains details of the account export definition. 
    # + return - OK. 
    remote isolated function putAccountExportIndividual(int id, Accountexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an account export definition
    #
    # + id - Part of the uri used to identify the account export. 
    # + return - No Content. 
    remote isolated function deleteAccountExportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an account export definition's synced data
    #
    # + id - Part of the uri used to identify the account export. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountExportDataQuery(int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an account export definition's data
    #
    # + id - Part of the uri used to identify the account export. 
    # + return - No Content. 
    remote isolated function deleteAccountExportDataQuery(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an account field definition
    #
    # + id - Part of the uri used to identify the account field. 
    # + return - OK. 
    remote isolated function getAccountFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of account field definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountFieldSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of account import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account import definition
    #
    # + payload - The request body contains details of the account import definition. 
    # + return - Success. 
    remote isolated function postAccountImportIndividual(AccountImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an account import definition
    #
    # + id - Part of the uri used to identify the account import. 
    # + return - OK. 
    remote isolated function getAccountImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account import definition
    #
    # + id - Part of the uri used to identify the account import. 
    # + payload - The request body contains details of the account import definition. 
    # + return - OK. 
    remote isolated function putAccountImportIndividual(int id, Accountimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an account import definition
    #
    # + id - Part of the uri used to identify the account import. 
    # + return - No Content. 
    remote isolated function deleteAccountImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for a specified account import definition
    #
    # + id - Part of the uri used to identify the account import. 
    # + payload - The request body contains data to be uploaded to the account import definition. 
    # + return - Success. 
    remote isolated function postAccountImportData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/accounts/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete an account import definition's data
    #
    # + id - Part of the uri used to identify the account import. 
    # + return - No Content. 
    remote isolated function deleteAccountImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an account list definition
    #
    # + id - The account field definition's unique resource identifier. 
    # + return - OK. 
    remote isolated function getAccountListIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/lists/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of account list definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountListSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/lists`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of account sync action definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getAccountSyncActionOperationSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an account sync action definition
    #
    # + payload - The request body defines details of the account sync action definition. 
    # + return - Success. 
    remote isolated function postAccountSyncActionOperationIndividual(AccountSyncActionOperationIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an account sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - Success. 
    remote isolated function getAccountSyncActionOperationIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an account sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body defines details of the account sync action definition. 
    # + return - Success. 
    remote isolated function putAccountSyncActionOperationIndividual(int id, Accountsyncactionoperationindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an account sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteAccountSyncActionOperationIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload account sync action data
    #
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body contains details of the account sync action data. 
    # + return - Success. 
    remote isolated function postAccountSyncActionOperationData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete sync data for an account sync action definition
    #
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteAccountSyncActionOperationData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/accounts/syncActions/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of activity export definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getActivityExportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an activity export definition
    #
    # + payload - The request body contains details of the activity export definition. 
    # + return - Success. 
    remote isolated function postActivityExportIndividual(ActivityExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an activity export definition
    #
    # + id - Part of the uri used to identify the activity export. 
    # + return - OK. 
    remote isolated function getActivityExportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an activity export definition
    #
    # + id - Part of the uri used to identify the activity export. 
    # + payload - The request body contains details of the activity export definition. 
    # + return - OK. 
    remote isolated function putActivityExportIndividual(int id, Activityexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an activity export definition
    #
    # + id - Part of the uri used to identify the activity export. 
    # + return - No Content. 
    remote isolated function deleteActivityExportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an activity export's synced data
    #
    # + id - Part of the uri used to identify the activity export. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getActivityExportDataQuery(int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an activity export definition's data
    #
    # + id - Part of the uri used to identify the activity export. 
    # + return - No Content. 
    remote isolated function deleteActivityExportDataQuery(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/activities/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve an activity field definition
    #
    # + id - Part of the uri used to identify the activity field. 
    # + return - OK. 
    remote isolated function getActivityFieldIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of activity field definitions
    #
    # + activityType - The activity type to filter results. Possible values include: <code>EmailOpen</code>, <code>EmailClickthrough</code>, <code>EmailSend</code>, <code>Subscribe</code>, <code>Unsubscribe</code>, <code>Bounceback</code>, <code>WebVisit</code>, <code>PageView</code>, and <code>FormSubmit</code>. Refer to <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ActivityFields'>Activity Fields</a> for a list of activity fields for each activity type. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getActivityFieldSearch(string? activityType = (), int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/fields`;
        map<anydata> queryParam = {"activityType": activityType, "limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of activity import definitions
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getActivityImportSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an activity import definition
    #
    # + payload - The request body contains details of the activity import defintion. 
    # + return - Success. 
    remote isolated function postActivityImportIndividual(ActivityImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an activity import definition
    #
    # + id - The activity import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getActivityImportIndividual(int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an activity import definition
    #
    # + id - The activity import definition's resource identification number. 
    # + payload - The request body contains details of the activity import defintion. 
    # + return - OK. 
    remote isolated function putActivityImportIndividual(int id, Activityimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an activity import definition
    #
    # + id - The activity import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteActivityImportIndividual(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for a specified activity import definition
    #
    # + id - The activity import definition's resource identification number. 
    # + payload - The request body contains data to be uploaded to the activity import definition. 
    # + return - OK. 
    remote isolated function postActivityImportData(int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/activities/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete an activity import definition's data
    #
    # + id - The activity import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteActivityImportData(int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/activities/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a custom object
    #
    # + parentId - The sync action definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCustomObjectIndividual(int parentId) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of export definitions for a custom object
    #
    # + parentId - The sync action definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectExportSearch(int parentId, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an export definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + payload - The request body contains details of the custom object export definition. 
    # + return - Success. 
    remote isolated function postCustomObjectExportIndividual(int parentId, CustomObjectExportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of the fields for a custom object
    #
    # + parentId - The sync action definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectFieldSearch(int parentId, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/fields`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a list of import definitions for a custom object
    #
    # + parentId - The sync action definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectImportSearch(int parentId, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an import definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + payload - The request body contains details of the custom object import definition. 
    # + return - Success. 
    remote isolated function postCustomObjectImportIndividual(int parentId, CustomObjectImportIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of sync action definitions for a custom object
    #
    # + parentId - The sync action definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectSyncActionOperationSearch(int parentId, int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a custom object sync action definition
    #
    # + parentId - The custom object's resource identification number. 
    # + payload - The request body contains details of the custom object sync action definition. 
    # + return - Success. 
    remote isolated function postCustomObjectSyncActionOperationIndividual(int parentId, CustomObjectSyncActionOperationIndividual payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve the specified export definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object export definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCustomObjectExportIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an export definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object export definition's resource identification number. 
    # + payload - The request body contains details of the custom object export definition. 
    # + return - OK. 
    remote isolated function putCustomObjectExportIndividual(int parentId, int id, Customobjectexportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom object export definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCustomObjectExportIndividual(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve the synced data for a custom object export definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object export definition's resource identification number. 
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 50,000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectExportDataQuery(int parentId, int id, int? 'limit = (), string? links = (), int? offset = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}/data`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete the synced data for a custom object export definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object export definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCustomObjectExportDataQuery(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/exports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a custom object field definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The custom object's resource identification number. 
    # + return - OK. 
    remote isolated function getCustomObjectFieldIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/fields/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an import definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The import definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCustomObjectImportIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an import definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The import definition's resource identification number. 
    # + payload - The request body contains details of the custom object import definition. 
    # + return - OK. 
    remote isolated function putCustomObjectImportIndividual(int parentId, int id, Customobjectimportindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom object import definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCustomObjectImportIndividual(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload data for a custom object import definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The import definition's resource identification number. 
    # + payload - The request body contains data to be uploaded to the custom object import definition. 
    # + return - Success. 
    remote isolated function postCustomObjectImportData(int parentId, int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete synced data for a custom object import definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The import definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCustomObjectImportData(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/imports/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a custom object sync action definition for a custom object
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The sync action definition's resource identification number. 
    # + return - OK. 
    remote isolated function getCustomObjectSyncActionOperationIndividual(int parentId, int id) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions/${getEncodedUri(id)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a custom object sync action definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body contains details of the custom object sync action definition. 
    # + return - OK. 
    remote isolated function putCustomObjectSyncActionOperationIndividual(int parentId, int id, Customobjectsyncactionoperationindividual2 payload) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom object sync action definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteCustomObjectSyncActionOperationIndividual(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Upload custom object sync action data
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The sync action definition's resource identification number. 
    # + payload - The request body contains details of the custom object sync action definition. 
    # + return - Success. 
    remote isolated function postCustomObjectSyncActionOperationData(int parentId, int id, record {}[] payload) returns json|error? {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions/${getEncodedUri(id)}/data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete sync data for a custom object sync action definition
    #
    # + parentId - The custom object's resource identification number. 
    # + id - The sync action definition's resource identification number. 
    # + return - No Content. 
    remote isolated function deleteRest20CustomObjectSyncActionOperationData(int parentId, int id) returns http:Response|error {
        string resourcePath = string `/api/bulk/2.0/customObjects/${getEncodedUri(parentId)}/syncActions/${getEncodedUri(id)}/data`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of custom objects
    #
    # + 'limit - A URL parameter that specifies the maximum number of records to return. This can be any positive integer between 1 and 1000 inclusive. If not specified, the default is 1000. Example: <code>?limit=5</code>. 
    # + links - The links section in a resource return all the links by default. The client side might be only interested in a particular link. To satisfy that requirement, a "links" query parameter might be supported. The value of this query parameter is a list of relations separated by comma ",". For example, ?links=canonical, next will only return the links with "rel" property be canonical or next. 
    # + offset - Specifies an offset that allows you to retrieve the next batch of records. Any positive integer. For example, if your limit is 1000, specifying an offset of 1000 will return records 1000 through 2000. If not specified, the default is 0. Example: <code>?offset=1000</code>. 
    # + orderBy - Specifies the name of the property to order the results by. The <code>orderBy</code> format is <code>term</code> ASC | DESC. Example: <code>?orderBy=name ASC</code>. 
    # + q - A URL parameter that specifies query criteria used to filter results. The <code>q</code> format is <code>term</code><code>operator</code><code>value</code>. Use "*" for wildcard values. Example: <code>?q="name=*Test*"</code> will find all the entities where the "name" field contains the string "Test". 
    # + totalResults - Whether or not the total results are shown, and factored into the <code>hasMore</code> property in the response. When set to <code>false</code>, the <code>totalResults</code> property will not be returned, and the <code>hasMore</code> property will be determined based on returned events that match the criteria specified in the URL parameters. If not specified, the default is <code>true</code>. 
    # + return - OK. 
    remote isolated function getCustomObjectSearch(int? 'limit = (), string? links = (), int? offset = (), string? orderBy = (), string? q = (), boolean? totalResults = ()) returns json|error {
        string resourcePath = string `/api/bulk/2.0/customObjects`;
        map<anydata> queryParam = {"limit": 'limit, "links": links, "offset": offset, "orderBy": orderBy, "q": q, "totalResults": totalResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
}
