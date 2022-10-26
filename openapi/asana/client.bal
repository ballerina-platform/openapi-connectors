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
import ballerina/mime;

# This is a generated connector for [Asana API v1.0](https://developers.asana.com/docs) OpenAPI specification.
# This API enables you to help teams organize, track and manage their work.
# For additional help getting started with the API, visit [Asana API](https://developers.asana.com).
@display {label: "Asana", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Asana API Account](https://asana.com/create-account) and obtain tokens following [this guide](https://developers.asana.com/docs/authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://app.asana.com/api/1.0") returns error? {
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
    # Get an attachment
    #
    # + attachmentGid - Globally unique identifier for the attachment. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the record for a single attachment. 
    remote isolated function getAttachment(string attachmentGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse200|error {
        string resourcePath = string `/attachments/${getEncodedUri(attachmentGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an attachment
    #
    # + attachmentGid - Globally unique identifier for the attachment. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified attachment. 
    remote isolated function deleteAttachment(string attachmentGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/attachments/${getEncodedUri(attachmentGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Submit parallel requests
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The requests to batch together via the Batch API. 
    # + return - Successfully completed the requested batch API operations. 
    remote isolated function createBatchRequest(BatchBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2002|error {
        string resourcePath = string `/batch`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2002 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a custom field
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + payload - The custom field object to create. 
    # + return - Custom field successfully created. 
    remote isolated function createCustomField(CustomFieldsBody payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse201|error {
        string resourcePath = string `/custom_fields`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the complete definition of a custom field’s metadata. 
    remote isolated function getCustomField(string customFieldGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse201|error {
        string resourcePath = string `/custom_fields/${getEncodedUri(customFieldGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse201 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The custom field object with all updated properties. 
    # + return - The custom field was successfully updated. 
    remote isolated function updateCustomField(string customFieldGid, CustomFieldsCustomFieldGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse201|error {
        string resourcePath = string `/custom_fields/${getEncodedUri(customFieldGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - The custom field was successfully deleted. 
    remote isolated function deleteCustomField(string customFieldGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/custom_fields/${getEncodedUri(customFieldGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create an enum option
    #
    # + customFieldGid - Globally unique identifier for the custom field. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + payload - The enum option object to create. 
    # + return - Custom field enum option successfully created. 
    remote isolated function createEnumOptionForCustomField(string customFieldGid, CustomFieldGidEnumOptionsBody payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2011|error {
        string resourcePath = string `/custom_fields/${getEncodedUri(customFieldGid)}/enum_options`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reorder a custom field's enum
    #
    # + customFieldGid - Globally unique identifier for the custom field. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The enum option object to create. 
    # + return - Custom field enum option successfully reordered. 
    remote isolated function insertEnumOptionForCustomField(string customFieldGid, EnumOptionsInsertBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2011|error {
        string resourcePath = string `/custom_fields/${getEncodedUri(customFieldGid)}/enum_options/insert`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update an enum option
    #
    # + enumOptionGid - Globally unique identifier for the enum option. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The enum option object to update 
    # + return - Successfully updated the specified custom field enum. 
    remote isolated function updateEnumOption(string enumOptionGid, EnumOptionsEnumOptionGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2011|error {
        string resourcePath = string `/enum_options/${getEncodedUri(enumOptionGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get events on a resource
    #
    # + 'resource - A resource ID to subscribe to. The resource can be a task or project. 
    # + sync - A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated. *Note: On your first request, omit the sync token. The response will be the same as for an expired sync token, and will include a new valid sync token.If the sync token is too old (which may happen from time to time) the API will return a `412 Precondition Failed` error, and include a fresh sync token in the response.* 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved events. 
    remote isolated function getEvents(string 'resource, string? sync = (), boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2003|error {
        string resourcePath = string `/events`;
        map<anydata> queryParam = {"resource": 'resource, "sync": sync, "opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a job by id
    #
    # + jobGid - Globally unique identifier for the job. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved Job. 
    remote isolated function getJob(string jobGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string resourcePath = string `/jobs/${getEncodedUri(jobGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an organization export request
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + payload - The organization to export. 
    # + return - Successfully created organization export request. 
    remote isolated function createOrganizationExport(OrganizationExportsBody payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2012|error {
        string resourcePath = string `/organization_exports`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2012 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get details on an org export request
    #
    # + organizationExportGid - Globally unique identifier for the organization export. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved organization export object. 
    remote isolated function getOrganizationExport(string organizationExportGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2012|error {
        string resourcePath = string `/organization_exports/${getEncodedUri(organizationExportGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get teams in an organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Returns the team records for all teams in the organization or workspace accessible to the authenticated user. 
    remote isolated function getTeamsForOrganization(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2005|error {
        string resourcePath = string `/organizations/${getEncodedUri(workspaceGid)}/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple portfolio memberships
    #
    # + portfolio - The portfolio to filter results on. 
    # + workspace - The workspace to filter results on. 
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved portfolio memberships. 
    remote isolated function getPortfolioMemberships(string? portfolio = (), string? workspace = (), string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2006|error {
        string resourcePath = string `/portfolio_memberships`;
        map<anydata> queryParam = {"portfolio": portfolio, "workspace": workspace, "user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a portfolio membership
    #
    # + portfolioMembershipGid - Globally unique identifier for the portfolio membership 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested portfolio membership. 
    remote isolated function getPortfolioMembership(string portfolioMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2007|error {
        string resourcePath = string `/portfolio_memberships/${getEncodedUri(portfolioMembershipGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple portfolios
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + workspace - The workspace or organization to filter portfolios on. 
    # + owner - The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own. 
    # + return - Successfully retrieved portfolios. 
    remote isolated function getPortfolios(string workspace, string owner, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2008|error {
        string resourcePath = string `/portfolios`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "owner": owner};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2008 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a portfolio
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The portfolio to create. 
    # + return - Successfully created portfolio. 
    remote isolated function createPortfolio(PortfoliosBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string resourcePath = string `/portfolios`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2013 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested portfolio. 
    remote isolated function getPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2013 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The updated fields for the portfolio. 
    # + return - Successfully updated the portfolio. 
    remote isolated function updatePortfolio(string portfolioGid, PortfoliosPortfolioGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2013 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified portfolio. 
    remote isolated function deletePortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add a custom field to a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + payload - Information about the custom field setting. 
    # + return - Successfully added the custom field to the portfolio. 
    remote isolated function addCustomFieldSettingForPortfolio(string portfolioGid, PortfolioGidAddcustomfieldsettingBody payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/addCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add a portfolio item
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the item being inserted. 
    # + return - Successfully added the item to the portfolio. 
    remote isolated function addItemForPortfolio(string portfolioGid, PortfolioGidAdditemBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/addItem`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add users to a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the members being added. 
    # + return - Successfully added members to the portfolio. 
    remote isolated function addMembersForPortfolio(string portfolioGid, PortfolioGidAddmembersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/addMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a portfolio's custom fields
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved custom field settings objects for a portfolio. 
    remote isolated function getCustomFieldSettingsForPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2009|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/custom_field_settings`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get portfolio items
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested portfolio's items. 
    remote isolated function getItemsForPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20010|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/items`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get memberships from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested portfolio's memberships. 
    remote isolated function getPortfolioMembershipsForPortfolio(string portfolioGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2006|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/portfolio_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove a custom field from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + payload - Information about the custom field setting being removed. 
    # + return - Successfully removed the custom field from the portfolio. 
    remote isolated function removeCustomFieldSettingForPortfolio(string portfolioGid, PortfolioGidRemovecustomfieldsettingBody payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/removeCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a portfolio item
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the item being removed. 
    # + return - Successfully removed the item from the portfolio. 
    remote isolated function removeItemForPortfolio(string portfolioGid, PortfolioGidRemoveitemBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/removeItem`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove users from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the members being removed. 
    # + return - Successfully removed the members from the portfolio. 
    remote isolated function removeMembersForPortfolio(string portfolioGid, PortfolioGidRemovemembersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/portfolios/${getEncodedUri(portfolioGid)}/removeMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a project membership
    #
    # + projectMembershipGid - Globally unique identifier for the project membership. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested project membership. 
    remote isolated function getProjectMembership(string projectMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20011|error {
        string resourcePath = string `/project_memberships/${getEncodedUri(projectMembershipGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20011 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a project status
    #
    # + projectStatusGid - The project status update to get. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the specified project's status updates. 
    remote isolated function getProjectStatus(string projectStatusGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20012|error {
        string resourcePath = string `/project_statuses/${getEncodedUri(projectStatusGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a project status
    #
    # + projectStatusGid - The project status update to get. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified project status. 
    remote isolated function deleteProjectStatus(string projectStatusGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/project_statuses/${getEncodedUri(projectStatusGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get multiple projects
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + workspace - The workspace or organization to filter projects on. 
    # + team - The team to filter projects on. 
    # + archived - Only return projects whose `archived` field takes on the value of this parameter. 
    # + return - Successfully retrieved projects. 
    remote isolated function getProjects(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? workspace = (), string? team = (), boolean? archived = ()) returns InlineResponse20010|error {
        string resourcePath = string `/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "team": team, "archived": archived};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a project
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The project to create. 
    # + return - Successfully retrieved projects. 
    remote isolated function createProject(ProjectsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string resourcePath = string `/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested project. 
    remote isolated function getProject(string projectGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2014 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The updated fields for the project. 
    # + return - Successfully updated the project. 
    remote isolated function updateProject(string projectGid, ProjectsProjectGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified project. 
    remote isolated function deleteProject(string projectGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add a custom field to a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + payload - Information about the custom field setting. 
    # + return - Successfully added the custom field to the project. 
    remote isolated function addCustomFieldSettingForProject(string projectGid, ProjectGidAddcustomfieldsettingBody payload, boolean? optPretty = ()) returns InlineResponse20013|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/addCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20013 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add followers to a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the followers being added. 
    # + return - Successfully added followers to the project. 
    remote isolated function addFollowersForProject(string projectGid, ProjectGidAddfollowersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/addFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add users to a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the members being added. 
    # + return - Successfully added members to the project. 
    remote isolated function addMembersForProject(string projectGid, ProjectGidAddmembersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/addMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a project's custom fields
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved custom field settings objects for a project. 
    remote isolated function getCustomFieldSettingsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2009|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/custom_field_settings`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Duplicate a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Describes the duplicate's name and the elements that will be duplicated. 
    # + return - Successfully created the job to handle duplication. 
    remote isolated function duplicateProject(string projectGid, ProjectGidDuplicateBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/duplicate`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2004 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get memberships from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested project's memberships. 
    remote isolated function getProjectMembershipsForProject(string projectGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20014|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/project_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20014 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get statuses from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified project's status updates. 
    remote isolated function getProjectStatusesForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20015|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/project_statuses`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20015 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a project status
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The project status to create. 
    # + return - Successfully created a new story. 
    remote isolated function createProjectStatusForProject(string projectGid, ProjectGidProjectStatusesBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20012|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/project_statuses`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20012 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a custom field from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + payload - Information about the custom field setting being removed. 
    # + return - Successfully removed the custom field from the project. 
    remote isolated function removeCustomFieldSettingForProject(string projectGid, ProjectGidRemovecustomfieldsettingBody payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/removeCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove followers from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the followers being removed. 
    # + return - Successfully removed followers from the project. 
    remote isolated function removeFollowersForProject(string projectGid, ProjectGidRemovefollowersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/removeFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove users from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Information about the members being removed. 
    # + return - Successfully removed the members from the project. 
    remote isolated function removeMembersForProject(string projectGid, ProjectGidRemovemembersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/removeMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get sections in a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved sections in project. 
    remote isolated function getSectionsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20016|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/sections`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20016 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a section in a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The section to create. 
    # + return - Successfully created the specified section. 
    remote isolated function createSectionForProject(string projectGid, ProjectGidSectionsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/sections`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2015 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Move or Insert sections
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The section's move action. 
    # + return - Successfully moved the specified section. 
    remote isolated function insertSectionForProject(string projectGid, SectionsInsertBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/sections/insert`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get task count of a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested project's task counts. 
    remote isolated function getTaskCountsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20017|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/task_counts`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20017 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get tasks from a project
    #
    # + projectGid - Globally unique identifier for the project. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested project's tasks. 
    remote isolated function getTasksForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/projects/${getEncodedUri(projectGid)}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a section
    #
    # + sectionGid - The globally unique identifier for the section. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved section. 
    remote isolated function getSection(string sectionGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string resourcePath = string `/sections/${getEncodedUri(sectionGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2015 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a section
    #
    # + sectionGid - The globally unique identifier for the section. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The section to create. 
    # + return - Successfully updated the specified section. 
    remote isolated function updateSection(string sectionGid, SectionsSectionGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string resourcePath = string `/sections/${getEncodedUri(sectionGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2015 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a section
    #
    # + sectionGid - The globally unique identifier for the section. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified section. 
    remote isolated function deleteSection(string sectionGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/sections/${getEncodedUri(sectionGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add task to section
    #
    # + sectionGid - The globally unique identifier for the section. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The task and optionally the insert location. 
    # + return - Successfully added the task. 
    remote isolated function addTaskForSection(string sectionGid, SectionGidAddtaskBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/sections/${getEncodedUri(sectionGid)}/addTask`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get tasks from a section
    #
    # + sectionGid - The globally unique identifier for the section. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the section's tasks. 
    remote isolated function getTasksForSection(string sectionGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/sections/${getEncodedUri(sectionGid)}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a story
    #
    # + storyGid - Globally unique identifier for the story. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified story. 
    remote isolated function getStory(string storyGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20019|error {
        string resourcePath = string `/stories/${getEncodedUri(storyGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20019 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a story
    #
    # + storyGid - Globally unique identifier for the story. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The comment story to update. 
    # + return - Successfully retrieved the specified story. 
    remote isolated function updateStory(string storyGid, StoriesStoryGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20019|error {
        string resourcePath = string `/stories/${getEncodedUri(storyGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20019 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a story
    #
    # + storyGid - Globally unique identifier for the story. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified story. 
    remote isolated function deleteStory(string storyGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/stories/${getEncodedUri(storyGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get multiple tags
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + workspace - The workspace to filter tags on. 
    # + return - Successfully retrieved the specified set of tags. 
    remote isolated function getTags(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? workspace = ()) returns InlineResponse20020|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20020 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a tag
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The tag to create. 
    # + return - Successfully created the newly specified tag. 
    remote isolated function createTag(TagsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2016|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2016 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a tag
    #
    # + tagGid - Globally unique identifier for the tag. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified tag. 
    remote isolated function getTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2016|error {
        string resourcePath = string `/tags/${getEncodedUri(tagGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2016 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a tag
    #
    # + tagGid - Globally unique identifier for the tag. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully updated the specified tag. 
    remote isolated function updateTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2016|error {
        string resourcePath = string `/tags/${getEncodedUri(tagGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2016 response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Delete a tag
    #
    # + tagGid - Globally unique identifier for the tag. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully deleted the specified tag. 
    remote isolated function deleteTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tags/${getEncodedUri(tagGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get tasks from a tag
    #
    # + tagGid - Globally unique identifier for the tag. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the tasks associated with the specified tag. 
    remote isolated function getTasksForTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tags/${getEncodedUri(tagGid)}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple tasks
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + assignee - The assignee to filter tasks on. *Note: If you specify `assignee`, you must also specify the `workspace` to filter on.* 
    # + project - The project to filter tasks on. 
    # + section - The section to filter tasks on. *Note: Currently, this is only supported in board views.* 
    # + workspace - The workspace to filter tasks on. *Note: If you specify `workspace`, you must also specify the `assignee` to filter on.* 
    # + completedSince - Only return tasks that are either incomplete or that have been completed since this time. 
    # + modifiedSince - Only return tasks that have been modified since the given time. *Note: A task is considered “modified” if any of its properties change, or associations between it and other objects are modified (e.g.  a task being added to a project). A task is not considered modified just because another object it is associated with (e.g. a subtask) is modified. Actions that count as modifying the task include assigning, renaming, completing, and adding stories.* 
    # + return - Successfully retrieved requested tasks. 
    remote isolated function getTasks(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? assignee = (), string? project = (), string? section = (), string? workspace = (), string? completedSince = (), string? modifiedSince = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "assignee": assignee, "project": project, "section": section, "workspace": workspace, "completed_since": completedSince, "modified_since": modifiedSince};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a task
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Create Task Request 
    # + return - Successfully created a new task. 
    remote isolated function createTask(TasksBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string resourcePath = string `/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the specified task. 
    remote isolated function getTask(string taskGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2017 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The task to update. 
    # + return - Successfully updated the specified task. 
    remote isolated function updateTask(string taskGid, TasksTaskGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully deleted the specified task. 
    remote isolated function deleteTask(string taskGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Set dependencies for a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The list of tasks to set as dependencies. 
    # + return - Successfully set the specified dependencies on the task. 
    remote isolated function addDependenciesForTask(string taskGid, TaskGidAdddependenciesBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/addDependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set dependents for a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The list of tasks to add as dependents. 
    # + return - Successfully set the specified dependents on the given task. 
    remote isolated function addDependentsForTask(string taskGid, TaskGidAdddependentsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/addDependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20018 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add followers to a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The followers to add to the task. 
    # + return - Successfully added the specified followers to the task. 
    remote isolated function addFollowersForTask(string taskGid, TaskGidAddfollowersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/addFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add a project to a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The project to add the task to. 
    # + return - Successfully added the specified project to the task. 
    remote isolated function addProjectForTask(string taskGid, TaskGidAddprojectBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/addProject`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add a tag to a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The tag to add to the task. 
    # + return - Successfully added the specified tag to the task. 
    remote isolated function addTagForTask(string taskGid, TaskGidAddtagBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/addTag`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get attachments for a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the compact records for all attachments on the task. 
    remote isolated function getAttachmentsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20021|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/attachments`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20021 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Upload an attachment
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + payload - The file you want to upload. 
    # + return - Successfully uploaded the attachment to the task. 
    remote isolated function createAttachmentForTask(string taskGid, AttachmentRequest payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/attachments`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        InlineResponse200 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get dependencies from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified task's dependencies. 
    remote isolated function getDependenciesForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/dependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get dependents from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified dependents of the task. 
    remote isolated function getDependentsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/dependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Duplicate a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - Describes the duplicate's name and the fields that will be duplicated. 
    # + return - Successfully created the job to handle duplication. 
    remote isolated function duplicateTask(string taskGid, TaskGidDuplicateBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/duplicate`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2004 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get projects a task is in
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the projects for the given task. 
    remote isolated function getProjectsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20010|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Unlink dependencies from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The list of tasks to unlink as dependencies. 
    # + return - Successfully unlinked the dependencies from the specified task. 
    remote isolated function removeDependenciesForTask(string taskGid, TaskGidRemovedependenciesBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20022|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/removeDependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20022 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlink dependents from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The list of tasks to remove as dependents. 
    # + return - Successfully unlinked the specified tasks as dependents. 
    remote isolated function removeDependentsForTask(string taskGid, TaskGidRemovedependentsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20022|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/removeDependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20022 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove followers from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The followers to remove from the task. 
    # + return - Successfully removed the specified followers from the task. 
    remote isolated function removeFollowerForTask(string taskGid, TaskGidRemovefollowersBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/removeFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a project from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The project to remove the task from. 
    # + return - Successfully removed the specified project from the task. 
    remote isolated function removeProjectForTask(string taskGid, TaskGidRemoveprojectBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/removeProject`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a tag from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The tag to remove from the task. 
    # + return - Successfully removed the specified tag from the task. 
    remote isolated function removeTagForTask(string taskGid, TaskGidRemovetagBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/removeTag`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set the parent of a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The new parent of the subtask. 
    # + return - Successfully changed the parent of the specified subtask. 
    remote isolated function setParentForTask(string taskGid, TaskGidSetparentBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/setParent`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get stories from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified task's stories. 
    remote isolated function getStoriesForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20023|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/stories`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20023 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a story on a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The story to create. 
    # + return - Successfully created a new story. 
    remote isolated function createStoryForTask(string taskGid, TaskGidStoriesBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20019|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/stories`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20019 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get subtasks from a task
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified task's subtasks. 
    remote isolated function getSubtasksForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/subtasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a subtask
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The new subtask to create. 
    # + return - Successfully created the specified subtask. 
    remote isolated function createSubtaskForTask(string taskGid, TaskGidSubtasksBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/subtasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a task's tags
    #
    # + taskGid - Globally unique identifier for the task. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the tags for the given task. 
    remote isolated function getTagsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20020|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskGid)}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20020 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get team memberships
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + team - Globally unique identifier for the team. 
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. This parameter must be used with the workspace parameter. 
    # + workspace - Globally unique identifier for the workspace. This parameter must be used with the user parameter. 
    # + return - Successfully retrieved the requested team memberships. 
    remote isolated function getTeamMemberships(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? team = (), string? user = (), string? workspace = ()) returns InlineResponse20024|error {
        string resourcePath = string `/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "team": team, "user": user, "workspace": workspace};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20024 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a team membership
    #
    # + teamMembershipGid - Globally unique identifier for the team membership. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested team membership. 
    remote isolated function getTeamMembership(string teamMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20025|error {
        string resourcePath = string `/team_memberships/${getEncodedUri(teamMembershipGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20025 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a team
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + payload - The team to create. 
    # + return - Successfully created a new team. 
    remote isolated function createTeam(TeamsBody payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2018|error {
        string resourcePath = string `/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2018 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successsfully retrieved the record for a single team. 
    remote isolated function getTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2018|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add a user to a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The user to add to the team. 
    # + return - Returns the full user record for the added user. 
    remote isolated function addUserForTeam(string teamGid, TeamGidAdduserBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/addUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20026 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a team's projects
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + archived - Only return projects whose `archived` field takes on the value of this parameter. 
    # + return - Successfully retrieved the requested team's projects. 
    remote isolated function getProjectsForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), boolean? archived = ()) returns InlineResponse20010|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "archived": archived};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a project in a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The new project to create. 
    # + return - Successfully created the specified project. 
    remote isolated function createProjectForTeam(string teamGid, TeamGidProjectsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a user from a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The user to remove from the team. 
    # + return - Returns an empty data record 
    remote isolated function removeUserForTeam(string teamGid, TeamGidRemoveuserBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/removeUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get memberships from a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested team's memberships. 
    remote isolated function getTeamMembershipsForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20024|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20024 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get users in a team
    #
    # + teamGid - Globally unique identifier for the team. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Returns the user records for all the members of the team, including guests and limited access users 
    remote isolated function getUsersForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), string? offset = ()) returns InlineResponse20027|error {
        string resourcePath = string `/teams/${getEncodedUri(teamGid)}/users`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20027 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a user task list
    #
    # + userTaskListGid - Globally unique identifier for the user task list. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the user task list. 
    remote isolated function getUserTaskList(string userTaskListGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20028|error {
        string resourcePath = string `/user_task_lists/${getEncodedUri(userTaskListGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20028 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get tasks from a user task list
    #
    # + completedSince - Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*. 
    # + userTaskListGid - Globally unique identifier for the user task list. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the user task list's tasks. 
    remote isolated function getTasksForUserTaskList(string userTaskListGid, string? completedSince = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string resourcePath = string `/user_task_lists/${getEncodedUri(userTaskListGid)}/tasks`;
        map<anydata> queryParam = {"completed_since": completedSince, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple users
    #
    # + workspace - The workspace or organization ID to filter users on. 
    # + team - The team ID to filter users on. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested user records. 
    remote isolated function getUsers(string? workspace = (), string? team = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20027|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"workspace": workspace, "team": team, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20027 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Returns the user specified. 
    remote isolated function getUser(string userGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20026 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a user's favorites
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + resourceType - The resource type of favorites to be returned. 
    # + workspace - The workspace in which to get favorites. 
    # + return - Returns the specified user's favorites. 
    remote isolated function getFavoritesForUser(string userGid, string resourceType, string workspace, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20029|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}/favorites`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "resource_type": resourceType, "workspace": workspace};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20029 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get memberships from a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + workspace - Globally unique identifier for the workspace. 
    # + return - Successfully retrieved the requested users's memberships. 
    remote isolated function getTeamMembershipsForUser(string userGid, string workspace, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20024|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20024 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get teams for a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + organization - The workspace or organization to filter teams on. 
    # + return - Returns the team records for all teams in the organization or workspace to which the given user is assigned. 
    remote isolated function getTeamsForUser(string userGid, string organization, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2005|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "organization": organization};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a user's task list
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + workspace - The workspace in which to get the user task list. 
    # + return - Successfully retrieved the user's task list. 
    remote isolated function getUserTaskListForUser(string userGid, string workspace, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20028|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}/user_task_list`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "workspace": workspace};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20028 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get workspace memberships for a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested user's workspace memberships. 
    remote isolated function getWorkspaceMembershipsForUser(string userGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20030|error {
        string resourcePath = string `/users/${getEncodedUri(userGid)}/workspace_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20030 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple webhooks
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + workspace - The workspace to query for webhooks in. 
    # + 'resource - Only return webhooks for the given resource. 
    # + return - Successfully retrieved the requested webhooks. 
    remote isolated function getWebhooks(string workspace, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? 'resource = ()) returns InlineResponse20031|error {
        string resourcePath = string `/webhooks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "resource": 'resource};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20031 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Establish a webhook
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The webhook workspace and target. 
    # + return - Successfully created the requested webhook. 
    remote isolated function createWebhook(WebhooksBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2019|error {
        string resourcePath = string `/webhooks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2019 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a webhook
    #
    # + webhookGid - Globally unique identifier for the webhook. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested webhook. 
    remote isolated function getWebhook(string webhookGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2019|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2019 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a webhook
    #
    # + webhookGid - Globally unique identifier for the webhook. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested webhook. 
    remote isolated function deleteWebhook(string webhookGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a workspace membership
    #
    # + workspaceMembershipGid - Globally unique identifier for the workspace membership 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved the requested workspace membership. 
    remote isolated function getWorkspaceMembership(string workspaceMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20032|error {
        string resourcePath = string `/workspace_memberships/${getEncodedUri(workspaceMembershipGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20032 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get multiple workspaces
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Return all workspaces visible to the authorized user. 
    remote isolated function getWorkspaces(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20033|error {
        string resourcePath = string `/workspaces`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20033 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Return the full workspace record. 
    remote isolated function getWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20034|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20034 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The workspace object with all updated properties. 
    # + return - Update for the workspace was successful. 
    remote isolated function updateWorkspace(string workspaceGid, WorkspacesWorkspaceGidBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20034|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20034 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Add a user to a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The user to add to the workspace. 
    # + return - The user was added successfully to the workspace or organization. 
    remote isolated function addUserForWorkspace(string workspaceGid, WorkspaceGidAdduserBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/addUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20026 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a workspace's custom fields
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved all custom fields for the given workspace. 
    remote isolated function getCustomFieldsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20035|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/custom_fields`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20035 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all projects in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + archived - Only return projects whose `archived` field takes on the value of this parameter. 
    # + return - Successfully retrieved the requested workspace's projects. 
    remote isolated function getProjectsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), boolean? archived = ()) returns InlineResponse20010|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "archived": archived};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a project in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The new project to create. 
    # + return - Successfully created a new project in the specified workspace. 
    remote isolated function createProjectForWorkspace(string workspaceGid, WorkspaceGidProjectsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove a user from a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The user to remove from the workspace. 
    # + return - The user was removed successfully to the workspace or organization. 
    remote isolated function removeUserForWorkspace(string workspaceGid, WorkspaceGidRemoveuserBody payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/removeUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get tags in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the specified set of tags. 
    remote isolated function getTagsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20020|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20020 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a tag in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + payload - The tag to create. 
    # + return - Successfully created the newly specified tag. 
    remote isolated function createTagForWorkspace(string workspaceGid, WorkspaceGidTagsBody payload, boolean? optPretty = (), string[]? optFields = ()) returns WorkspaceGidTagsBody|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkspaceGidTagsBody response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search tasks in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + text - Performs full-text search on both task name and description 
    # + resourceSubtype - Filters results by the task's resource_subtype 
    # + assigneeAny - Comma-separated list of user identifiers 
    # + assigneeNot - Comma-separated list of user identifiers 
    # + portfoliosAny - Comma-separated list of portfolio IDs 
    # + projectsAny - Comma-separated list of project IDs 
    # + projectsNot - Comma-separated list of project IDs 
    # + projectsAll - Comma-separated list of project IDs 
    # + sectionsAny - Comma-separated list of section or column IDs 
    # + sectionsNot - Comma-separated list of section or column IDs 
    # + sectionsAll - Comma-separated list of section or column IDs 
    # + tagsAny - Comma-separated list of tag IDs 
    # + tagsNot - Comma-separated list of tag IDs 
    # + tagsAll - Comma-separated list of tag IDs 
    # + teamsAny - Comma-separated list of team IDs 
    # + followersAny - Comma-separated list of user identifiers 
    # + followersNot - Comma-separated list of user identifiers 
    # + createdByAny - Comma-separated list of user identifiers 
    # + createdByNot - Comma-separated list of user identifiers 
    # + assignedByAny - Comma-separated list of user identifiers 
    # + assignedByNot - Comma-separated list of user identifiers 
    # + likedByAny - Comma-separated list of user identifiers 
    # + likedByNot - Comma-separated list of user identifiers 
    # + commentedOnByAny - Comma-separated list of user identifiers 
    # + commentedOnByNot - Comma-separated list of user identifiers 
    # + dueOnBefore - ISO 8601 date string 
    # + dueOnAfter - ISO 8601 date string 
    # + dueOn - ISO 8601 date string or `null` 
    # + dueAtBefore - ISO 8601 datetime string 
    # + dueAtAfter - ISO 8601 datetime string 
    # + startOnBefore - ISO 8601 date string 
    # + startOnAfter - ISO 8601 date string 
    # + startOn - ISO 8601 date string or `null` 
    # + createdOnBefore - ISO 8601 date string 
    # + createdOnAfter - ISO 8601 date string 
    # + createdOn - ISO 8601 date string or `null` 
    # + createdAtBefore - ISO 8601 datetime string 
    # + createdAtAfter - ISO 8601 datetime string 
    # + completedOnBefore - ISO 8601 date string 
    # + completedOnAfter - ISO 8601 date string 
    # + completedOn - ISO 8601 date string or `null` 
    # + completedAtBefore - ISO 8601 datetime string 
    # + completedAtAfter - ISO 8601 datetime string 
    # + modifiedOnBefore - ISO 8601 date string 
    # + modifiedOnAfter - ISO 8601 date string 
    # + modifiedOn - ISO 8601 date string or `null` 
    # + modifiedAtBefore - ISO 8601 datetime string 
    # + modifiedAtAfter - ISO 8601 datetime string 
    # + isBlocking - Filter to incomplete tasks with dependents 
    # + isBlocked - Filter to tasks with incomplete dependencies 
    # + hasAttachment - Filter to tasks with attachments 
    # + completed - Filter to completed tasks 
    # + isSubtask - Filter to subtasks 
    # + sortBy - One of `due_date`, `created_at`, `completed_at`, `likes`, or `modified_at`, defaults to `modified_at` 
    # + sortAscending - Default `false` 
    # + return - Successfully retrieved the section's tasks. 
    remote isolated function searchTasksForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), string? text = (), string resourceSubtype = "milestone", string? assigneeAny = (), string? assigneeNot = (), string? portfoliosAny = (), string? projectsAny = (), string? projectsNot = (), string? projectsAll = (), string? sectionsAny = (), string? sectionsNot = (), string? sectionsAll = (), string? tagsAny = (), string? tagsNot = (), string? tagsAll = (), string? teamsAny = (), string? followersAny = (), string? followersNot = (), string? createdByAny = (), string? createdByNot = (), string? assignedByAny = (), string? assignedByNot = (), string? likedByAny = (), string? likedByNot = (), string? commentedOnByAny = (), string? commentedOnByNot = (), string? dueOnBefore = (), string? dueOnAfter = (), string? dueOn = (), string? dueAtBefore = (), string? dueAtAfter = (), string? startOnBefore = (), string? startOnAfter = (), string? startOn = (), string? createdOnBefore = (), string? createdOnAfter = (), string? createdOn = (), string? createdAtBefore = (), string? createdAtAfter = (), string? completedOnBefore = (), string? completedOnAfter = (), string? completedOn = (), string? completedAtBefore = (), string? completedAtAfter = (), string? modifiedOnBefore = (), string? modifiedOnAfter = (), string? modifiedOn = (), string? modifiedAtBefore = (), string? modifiedAtAfter = (), boolean? isBlocking = (), boolean? isBlocked = (), boolean? hasAttachment = (), boolean? completed = (), boolean? isSubtask = (), string sortBy = "modified_at", boolean sortAscending = false) returns InlineResponse20018|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/tasks/search`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "text": text, "resource_subtype": resourceSubtype, "assignee.any": assigneeAny, "assignee.not": assigneeNot, "portfolios.any": portfoliosAny, "projects.any": projectsAny, "projects.not": projectsNot, "projects.all": projectsAll, "sections.any": sectionsAny, "sections.not": sectionsNot, "sections.all": sectionsAll, "tags.any": tagsAny, "tags.not": tagsNot, "tags.all": tagsAll, "teams.any": teamsAny, "followers.any": followersAny, "followers.not": followersNot, "created_by.any": createdByAny, "created_by.not": createdByNot, "assigned_by.any": assignedByAny, "assigned_by.not": assignedByNot, "liked_by.any": likedByAny, "liked_by.not": likedByNot, "commented_on_by.any": commentedOnByAny, "commented_on_by.not": commentedOnByNot, "due_on.before": dueOnBefore, "due_on.after": dueOnAfter, "due_on": dueOn, "due_at.before": dueAtBefore, "due_at.after": dueAtAfter, "start_on.before": startOnBefore, "start_on.after": startOnAfter, "start_on": startOn, "created_on.before": createdOnBefore, "created_on.after": createdOnAfter, "created_on": createdOn, "created_at.before": createdAtBefore, "created_at.after": createdAtAfter, "completed_on.before": completedOnBefore, "completed_on.after": completedOnAfter, "completed_on": completedOn, "completed_at.before": completedAtBefore, "completed_at.after": completedAtAfter, "modified_on.before": modifiedOnBefore, "modified_on.after": modifiedOnAfter, "modified_on": modifiedOn, "modified_at.before": modifiedAtBefore, "modified_at.after": modifiedAtAfter, "is_blocking": isBlocking, "is_blocked": isBlocked, "has_attachment": hasAttachment, "completed": completed, "is_subtask": isSubtask, "sort_by": sortBy, "sort_ascending": sortAscending};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get objects via typeahead
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + resourceType - The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `project`, `portfolio`, `tag`, `task`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported. 
    # + 'type - *Deprecated: new integrations should prefer the resource_type field.* 
    # + query - The string that will be used to search for relevant objects. If an empty string is passed in, the API will currently return an empty result set. 
    # + count - The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + return - Successfully retrieved objects via a typeahead search algorithm. 
    remote isolated function typeaheadForWorkspace(string workspaceGid, string resourceType, string 'type = "user", string? query = (), int? count = (), boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20036|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/typeahead`;
        map<anydata> queryParam = {"resource_type": resourceType, "type": 'type, "query": query, "count": count, "opt_pretty": optPretty, "opt_fields": optFields};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20036 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get users in a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Return the users in the specified workspace or org. 
    remote isolated function getUsersForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), string? offset = ()) returns InlineResponse20027|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/users`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20027 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the workspace memberships for a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization. 
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. 
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. 
    # + optFields - Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options. 
    # + 'limit - Results per page. The number of objects to return per page. The value must be between 1 and 100. 
    # + offset - Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.' 
    # + return - Successfully retrieved the requested workspace's memberships. 
    remote isolated function getWorkspaceMembershipsForWorkspace(string workspaceGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20030|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspaceGid)}/workspace_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"opt_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20030 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
