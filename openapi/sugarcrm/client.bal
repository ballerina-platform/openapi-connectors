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

# This is a generated connector for [SugarCRM REST API v12.0](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_12.0/Integration/Web_Services/REST_API/) OpenAPI Specification.
# SugarCRM REST API provides capabilities to effectively manage the customer lifecycle with a set of modules that support each stage of the funnel.
@display {label: "SugarCRM", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [SugarCRM account](https://www.sugarcrm.com/au/?utm_source=google.com&utm_medium=organic) and obtain tokens by following [this guide](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_12.0/Integration/Web_Services/REST_API/#Authentication).
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
    # Return a set of records filtered by an expression.
    #
    # + module - The name of the module. 
    # + filter - The [filter expression](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_11.3/Integration/Web_Services/REST_API/End 
    # + filterId - Identifier for a preexisting filter. If filter is also set, the two filters are joined with an AND. 
    # + q - A search expression, will search on this module. Cannot be used at the same time as a filter expression or id. 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + fields - Comma delimited list of fields to return. The field date_modified will always be returned. `name,account_type,description` 
    # + orderBy - How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon.  `name:DESC,account_type:DESC,date_modified:ASC` 
    # + deleted - Boolean to show deleted records in the result set. 
    # + view - Instead of defining the fields argument, the view argument can be used instead. The field list is constructed at the server side based on the view definition which is requested. This argument can be used in combination with the fields argument. 
    # + nullsLast - Boolean to return records with null values in order_by fields last in the result set. 
    # + return - ok 
    remote isolated function listRecords(string module, string[]? filter = (), string? filterId = (), string? q = (), string? maxNum = (), string? offset = (), string? fields = (), string? orderBy = (), boolean? deleted = (), string? view = (), boolean? nullsLast = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/${getEncodedUri(module)}`;
        map<anydata> queryParam = {"filter": filter, "filter_id": filterId, "q": q, "max_num": maxNum, "offset": offset, "fields": fields, "order_by": orderBy, "deleted": deleted, "view": view, "nulls_last": nullsLast};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new record of the specified type
    #
    # + module - The name of the module. 
    # + payload - Filter options 
    # + return - ok 
    remote isolated function createRecord(string module, json payload) returns json|error {
        string resourcePath = string `/${getEncodedUri(module)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Return a set of records filtered by an expression. The filter can be applied to multiple fields and have multiple and/or conditions in it.
    #
    # + module - The name of the module. 
    # + payload - Filter options 
    # + return - ok 
    remote isolated function listFilteredRecords(string module, FilterOptions payload) returns FilteredRecordDetails|error {
        string resourcePath = string `/${getEncodedUri(module)}/filter`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FilteredRecordDetails response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a single record
    #
    # + module - The name of the module. 
    # + 'record - The record id. 
    # + return - ok 
    remote isolated function retrieveRecord(string module, string 'record) returns json|error {
        string resourcePath = string `/${getEncodedUri(module)}/${getEncodedUri('record)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a record of the specified type
    #
    # + module - The name of the module. 
    # + 'record - The record id. 
    # + payload - Record Details 
    # + return - ok 
    remote isolated function updateRecord(string module, string 'record, json payload) returns json|error {
        string resourcePath = string `/${getEncodedUri(module)}/${getEncodedUri('record)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a record of the specified type
    #
    # + module - The name of the module. 
    # + 'record - The record id. 
    # + return - ok 
    remote isolated function deleteRecord(string module, string 'record) returns SuccessResponseID|error {
        string resourcePath = string `/${getEncodedUri(module)}/${getEncodedUri('record)}`;
        SuccessResponseID response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # View audit log in record view
    #
    # + module - The name of the module. 
    # + 'record - The record id. 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + return - ok 
    remote isolated function viewChangeLog(string module, string 'record, string? maxNum = (), string? offset = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/${getEncodedUri(module)}/${getEncodedUri('record)}/audit`;
        map<anydata> queryParam = {"max_num": maxNum, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Expose the global search capability using solely the Elasticsearch backend as an alternative to the /search endpoint.
    #
    # + payload - Filter options 
    # + return - ok 
    remote isolated function globalSearchElasticsearch(SearchOptions payload) returns FilteredRecordDetails|error {
        string resourcePath = string `/globalsearch`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FilteredRecordDetails response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Globally search records
    #
    # + q - A search expression, will search on this module. Cannot be used at the same time as a filter expression or id. 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + fields - Comma delimited list of fields to return. The field date_modified will always be returned. `name,account_type,description` 
    # + orderBy - How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon.  `name:DESC,account_type:DESC,date_modified:ASC` 
    # + favorites - Only fetch the current users favorited records. 
    # + myItems - Only fetch items assigned to the current user. 
    # + return - ok 
    remote isolated function globalSearch(string? q = (), string? maxNum = (), string? offset = (), string? fields = (), string? orderBy = (), boolean? favorites = (), boolean? myItems = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/search`;
        map<anydata> queryParam = {"q": q, "max_num": maxNum, "offset": offset, "fields": fields, "order_by": orderBy, "favorites": favorites, "my_items": myItems};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a single event or a series of event records of the specified type
    #
    # + payload - The name value list of fields to populate. 
    # + return - ok 
    remote isolated function createCallEvent(json payload) returns json|error {
        string resourcePath = string `/Calls`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a calendar event record of the specified type.
    #
    # + 'record - The record id. 
    # + allRecurrences - Flag to update all events in a series. 
    # + return - ok 
    remote isolated function updateCallEvent(string 'record, boolean? allRecurrences = ()) returns json|error {
        string resourcePath = string `/Calls/${getEncodedUri('record)}`;
        map<anydata> queryParam = {"all_recurrences": allRecurrences};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Deletes either a single event record or a series of event records.
    #
    # + 'record - The record id. 
    # + allRecurrences - Flag to delete all events in a series. 
    # + return - ok 
    remote isolated function deleteCallEvent(string 'record, boolean? allRecurrences = ()) returns SuccessResponseID|error {
        string resourcePath = string `/Calls/${getEncodedUri('record)}`;
        map<anydata> queryParam = {"all_recurrences": allRecurrences};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuccessResponseID response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a single parent record of the given commentlog
    #
    # + 'record - CommentLog ID 
    # + return - ok 
    remote isolated function retrieveCommentlogParent(string 'record) returns json|error {
        string resourcePath = string `/CommentLog/${getEncodedUri('record)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Saves configuration changes in the database.
    #
    # + payload - Update account payload 
    # + return - ok 
    remote isolated function configSave(json payload) returns json|error {
        string resourcePath = string `/ConsoleConfiguration/config`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Return the original metadata for the module.
    #
    # + modules - Comma-separated module names 
    # + 'type - The type of the desired metadata. The following types are supported- 'filter', 'layout', 'menu', 'view'. 
    # + name - The name of the metadata. Examples- 'list', 'record', or 'multi-line-list'. 
    # + return - ok 
    remote isolated function getDefaultMetadata(string modules, string 'type, string name) returns json|error {
        string resourcePath = string `/ConsoleConfiguration/default-metadata`;
        map<anydata> queryParam = {"modules": modules, "type": 'type, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a contact's related cases, filtered by an expression, which are accessible to a contact with portal visibility.
    #
    # + 'record - Contact ID 
    # + filter - The [filter expression](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_11.3/Integration/Web_Services/REST_API/End 
    # + filterId - Identifier for a preexisting filter. If filter is also set, the two filters are joined with an AND. 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + fields - Comma delimited list of fields to return. The field date_modified will always be returned. `name,account_type,description` 
    # + orderBy - How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon.  `name:DESC,account_type:DESC,date_modified:ASC` 
    # + deleted - Boolean to show deleted records in the result set. 
    # + return - ok 
    remote isolated function getContactCases(string 'record, string[]? filter = (), string? filterId = (), string? maxNum = (), string? offset = (), string? fields = (), string? orderBy = (), boolean? deleted = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/Contact/${getEncodedUri('record)}/Cases`;
        map<anydata> queryParam = {"filter": filter, "filter_id": filterId, "max_num": maxNum, "offset": offset, "fields": fields, "order_by": orderBy, "deleted": deleted};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of time slots for which the specified person is busy.
    #
    # + 'record - Contact ID 
    # + return - ok 
    remote isolated function getFreeBusySchedule(string 'record) returns FreeBusyData|error {
        string resourcePath = string `/Contacts/${getEncodedUri('record)}/freebusy`;
        FreeBusyData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return the Currencies defined in the application
    #
    # + return - ok 
    remote isolated function getCurrencies() returns FilteredRecordDetails|error {
        string resourcePath = string `/Currencies`;
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return a set of User records filtered by an expression.
    #
    # + filter - The [filter expression](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_11.3/Integration/Web_Services/REST_API/End 
    # + filterId - Identifier for a preexisting filter. If filter is also set, the two filters are joined with an AND. 
    # + q - A search expression, will search on this module. Cannot be used at the same time as a filter expression or id. 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + fields - Comma delimited list of fields to return. The field date_modified will always be returned. `name,account_type,description` 
    # + orderBy - How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon.  `name:DESC,account_type:DESC,date_modified:ASC` 
    # + deleted - Boolean to show deleted records in the result set. 
    # + view - Instead of defining the fields argument, the view argument can be used instead. The field list is constructed at the server side based on the view definition which is requested. This argument can be used in combination with the fields argument. 
    # + nullsLast - Boolean to return records with null values in order_by fields last in the result set. 
    # + return - ok 
    remote isolated function getUsers(string[]? filter = (), string? filterId = (), string? q = (), string? maxNum = (), string? offset = (), string? fields = (), string? orderBy = (), boolean? deleted = (), string? view = (), boolean? nullsLast = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/Users`;
        map<anydata> queryParam = {"filter": filter, "filter_id": filterId, "q": q, "max_num": maxNum, "offset": offset, "fields": fields, "order_by": orderBy, "deleted": deleted, "view": view, "nulls_last": nullsLast};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a User record
    #
    # + 'record - User ID 
    # + return - ok 
    remote isolated function deleteUser(string 'record) returns SuccessResponseID|error {
        string resourcePath = string `/Users/${getEncodedUri('record)}`;
        SuccessResponseID response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve a list of calendar event start and end times for specified person
    #
    # + 'record - User ID 
    # + return - ok 
    remote isolated function getUserFreeBusySchedule(string 'record) returns FreeBusyData|error {
        string resourcePath = string `/Users/${getEncodedUri('record)}/freebusy`;
        FreeBusyData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a single event record or a series of event records
    #
    # + return - ok 
    remote isolated function createCalendarEvent() returns json|error {
        string resourcePath = string `/Meetings`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Update a single event record or a series of event records
    #
    # + 'record - Meeting ID 
    # + allRecurrences - Flag to update all events in a series. 
    # + return - ok 
    remote isolated function updateCalendarEvent(string 'record, boolean? allRecurrences = ()) returns json|error {
        string resourcePath = string `/Meetings/${getEncodedUri('record)}`;
        map<anydata> queryParam = {"all_recurrences": allRecurrences};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Delete a single event record or a series of event records
    #
    # + 'record - Meeting ID 
    # + allRecurrences - Flag to delete all events in a series. 
    # + return - ok 
    remote isolated function deleteCalendarEvent(string 'record, boolean? allRecurrences = ()) returns SuccessResponseID|error {
        string resourcePath = string `/Meetings/${getEncodedUri('record)}`;
        map<anydata> queryParam = {"all_recurrences": allRecurrences};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuccessResponseID response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve info about launching an external meeting
    #
    # + 'record - Meeting ID 
    # + return - ok 
    remote isolated function getExternalMeetingInfo(string 'record) returns json|error {
        string resourcePath = string `/Meetings/${getEncodedUri('record)}/external`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a record of the specified type
    #
    # + 'record - Opportunity ID 
    # + return - ok 
    remote isolated function updateOpportunity(string 'record) returns json|error {
        string resourcePath = string `/Opportunities/${getEncodedUri('record)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Create a Lead with the optional post-save actions for Convert Target/Prospect and Create Lead from Email operations
    #
    # + prospectId - Pass a prospect id if Lead is being created as part of a Convert Target/Prospect process 
    # + inboundEmailId - Pass an inbound email id if Lead is being created from an Email 
    # + return - ok 
    remote isolated function createLead(string prospectId, string inboundEmailId) returns json|error {
        string resourcePath = string `/Leads`;
        map<anydata> queryParam = {"prospect_id": prospectId, "inbound_email_id": inboundEmailId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Convert Lead to a Contact and optionally link it to a new or existing module such as an Account or Opportunity
    #
    # + leadId - Lead ID 
    # + payload - An object containing the Contacts module to be created as part of the conversion, along with (optionally) any modules that this new Contact record is to be related to. 
    # + return - ok 
    remote isolated function convertLead(string leadId, json payload) returns json|error {
        string resourcePath = string `/Leads/${getEncodedUri(leadId)}/convert`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a list of calendar event start and end times for specified person
    #
    # + 'record - Lead ID 
    # + return - ok 
    remote isolated function getLeadFreeBusySchedule(string 'record) returns FreeBusyData|error {
        string resourcePath = string `/Leads/${getEncodedUri('record)}/freebusy`;
        FreeBusyData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create lead
    #
    # + return - ok 
    remote isolated function createLeadRecord() returns InlineResponse200|error {
        string resourcePath = string `/Leads/register`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Lists related filtered records.
    #
    # + linkName - a link name 
    # + 'record - a record name 
    # + filter - The [filter expression](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_11.3/Integration/Web_Services/REST_API/End 
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + fields - Comma delimited list of fields to return. The field date_modified will always be returned. `name,account_type,description` 
    # + orderBy - How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon.  `name:DESC,account_type:DESC,date_modified:ASC` 
    # + view - Instead of defining the fields argument, the view argument can be used instead. The field list is constructed at the server side based on the view definition which is requested. This argument can be used in combination with the fields argument. 
    # + return - ok 
    remote isolated function listFilteredRelatedRecords(string linkName, string 'record, string[]? filter = (), string? maxNum = (), string? offset = (), string? fields = (), string? orderBy = (), string? view = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/Accounts/${getEncodedUri('record)}/link/${getEncodedUri(linkName)}/filter`;
        map<anydata> queryParam = {"filter": filter, "max_num": maxNum, "offset": offset, "fields": fields, "order_by": orderBy, "view": view};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a filtered list of homepage activities for a user
    #
    # + maxNum - A maximum number of records to return. The default is all records. 
    # + offset - The number of records to skip over before records are returned. The default is 0. The parameter will be ignored if the max_num parameter is missing. 
    # + return - ok 
    remote isolated function getHomeActivities(string? maxNum = (), string? offset = ()) returns FilteredRecordDetails|error {
        string resourcePath = string `/Activities/filter`;
        map<anydata> queryParam = {"max_num": maxNum, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FilteredRecordDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get configuration values for Amazon Web Services. This is only available to administrators of Sugar Serve.
    #
    # + return - ok 
    remote isolated function getAwsConfig() returns AWSConfig|error {
        string resourcePath = string `/Administration/aws`;
        AWSConfig response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set configuration values for Amazon Web Services. This is only available to administrators of Sugar Serve.
    #
    # + payload - Amazon Web Services configs 
    # + return - ok 
    remote isolated function setAwsConfig(AWSConfig payload) returns AWSConfig|error {
        string resourcePath = string `/Administration/aws`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AWSConfig response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get configuration values for a given category. This is only available to administrators.
    #
    # + category - The category 
    # + return - ok 
    remote isolated function getConfig(string category) returns json|error {
        string resourcePath = string `/Administration/config/${getEncodedUri(category)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set configuration values for a given category. This is only available to administrators.
    #
    # + category - The category 
    # + return - ok 
    remote isolated function setConfig(string category) returns json|error {
        string resourcePath = string `/Administration/config/${getEncodedUri(category)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
