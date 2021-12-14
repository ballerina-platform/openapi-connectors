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
    # The API Key with format `Token token=<API_KEY>`
    string authorization;
|};

# This is a generated connector for [Pagerduty REST API v2](https://developer.pagerduty.com/api-reference/) OpenAPI specification.
# The Pagerduty REST API provides capability to programmatically interact with a PagerDuty account.
# This document describes the PagerDuty REST APIs.
# For guides and examples please visit our [Documentation.](https://developer.pagerduty.com/docs/get-started/getting-started/)
# Our REST APIs are defined in OpenAPI v3.x. You can view the schema at [github.com/PagerDuty/api-schema](https://github.com/PagerDuty/api-schema).
# Note that properties in some schemas have fields not shown by default such as `readOnly`, `format`, and `default`. Hover your cursor over the right column that looks like `optional+1` to see the full list of fields.
@display {label: "PagerDuty", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Pagerduty account](https://developer.pagerduty.com/sign-up/) and obtain tokens by following [this guide](https://support.pagerduty.com/docs/generating-api-keys#section-generating-a-general-access-rest-api-key).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.pagerduty.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Assign tags
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + entityType - Type of entity related with the tag 
    # + id - The ID of the resource. 
    # + return - The tags were added and/or removed. 
    remote isolated function createEntityTypeByIdChangeTags(string accept, string contentType, string entityType, string id, IdChangeTagsBody payload) returns json|error {
        string resourcePath = string `/${entityType}/${id}/change_tags`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get tags for entities
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + entityType - Type of entity related with the tag 
    # + id - The ID of the resource. 
    # + return - An array of tags. 
    remote isolated function getEntityTypeByIdTags(string accept, string contentType, string entityType, string id, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse200|error {
        string resourcePath = string `/${entityType}/${id}/tags`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List abilities
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - An array of ability names. 
    remote isolated function listAbilities(string accept, string contentType) returns InlineResponse2001|error {
        string resourcePath = string `/abilities`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Test an ability
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The account has the requested ability. 
    remote isolated function getAbility(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/abilities/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List installed Add-ons
    #
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + include - Array of additional Models to include in response. 
    # + serviceIds - Filters the results, showing only Add-ons for the given services 
    # + filter - Filters the results, showing only Add-ons of the given type 
    # + return - A paginated array of installed Add-ons. 
    remote isolated function listAddon(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string[]? include = (), string[]? serviceIds = (), string? filter = ()) returns InlineResponse2002|error {
        string resourcePath = string `/addons`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "include[]": include, "service_ids[]": serviceIds, "filter": filter};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}, "service_ids[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Install an Add-on
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The Add-on to be installed. 
    # + return - The Add-on that was installed. 
    remote isolated function createAddon(string accept, string contentType, AddonsBody payload) returns InlineResponse201|error {
        string resourcePath = string `/addons`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an Add-on
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The requested Add-on. 
    remote isolated function getAddon(string accept, string contentType, string id) returns AddonsBody|error {
        string resourcePath = string `/addons/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AddonsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an Add-on
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The Add-on to be updated. 
    # + return - The Add-on that was updated. 
    remote isolated function updateAddon(string accept, string contentType, string id, AddonsIdBody payload) returns AddonsIdBody|error {
        string resourcePath = string `/addons/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddonsIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an Add-on
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Add-on was deleted successfully. 
    remote isolated function deleteAddon(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/addons/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Get aggregated incident data
    #
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time.  You __MUST__ pass in this header and the above value.  Do not use this endpoint in production, as it may change! 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - Parameters and filters to apply to the dataset. 
    # + return - OK 
    remote isolated function getAnalyticsMetricsIncidentsAll(string xEarlyAccess, string accept, string contentType, AnalyticsModel payload) returns InlineResponse2003|error {
        string resourcePath = string `/analytics/metrics/incidents/all`;
        map<any> headerValues = {"X-EARLY-ACCESS": xEarlyAccess, "Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2003 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get aggregated service data
    #
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time.  You __MUST__ pass in this header and the above value.  Do not use this endpoint in production, as it may change! 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - Parameters and filters to apply to the dataset. 
    # + return - Currently the response only returns data for services that match the filters and have data. 
    remote isolated function getAnalyticsMetricsIncidentsService(string xEarlyAccess, string accept, string contentType, AnalyticsModel payload) returns InlineResponse2003|error {
        string resourcePath = string `/analytics/metrics/incidents/services`;
        map<any> headerValues = {"X-EARLY-ACCESS": xEarlyAccess, "Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2003 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get aggregated team data
    #
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time.  You __MUST__ pass in this header and the above value.  Do not use this endpoint in production, as it may change! 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - Parameters and filters to apply to the dataset. 
    # + return - Currently the response only returns data for teams that match the filters and have data. 
    remote isolated function getAnalyticsMetricsIncidentsTeam(string xEarlyAccess, string accept, string contentType, AnalyticsModel payload) returns InlineResponse2003|error {
        string resourcePath = string `/analytics/metrics/incidents/teams`;
        map<any> headerValues = {"X-EARLY-ACCESS": xEarlyAccess, "Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2003 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get raw data - multiple incidents
    #
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time.  You __MUST__ pass in this header and the above value.  Do not use this endpoint in production, as it may change! 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - Parameters and filters to apply to the dataset. 
    # + return - OK 
    remote isolated function getAnalyticsIncidents(string xEarlyAccess, string accept, string contentType, RawIncidentsBody payload) returns InlineResponse2004|error {
        string resourcePath = string `/analytics/raw/incidents`;
        map<any> headerValues = {"X-EARLY-ACCESS": xEarlyAccess, "Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2004 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get raw data - single incident
    #
    # + id - The ID of the resource. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time.  You __MUST__ pass in this header and the above value.  Do not use this endpoint in production, as it may change! 
    remote isolated function getAnalyticsIncidentsById(string id, string accept, string contentType, string xEarlyAccess) returns AnalyticsRawIncident|error {
        string resourcePath = string `/analytics/raw/incidents/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AnalyticsRawIncident response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List audit records
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + rootResourceTypes - Resource type filter for the root_resource. 
    # + actorType - Actor type filter. 
    # + actorId - Actor Id filter. Must be qualified by providing the `actor_type` param. 
    # + methodType - Method type filter. 
    # + methodTruncatedToken - Method truncated_token filter. Must be qualified by providing the `method_type` param. 
    # + actions - Action filter 
    # + return - Records matching the query criteria. 
    remote isolated function listAuditRecords(string accept, string contentType, int? 'limit = (), string? cursor = (), string? since = (), string? until = (), string[]? rootResourceTypes = (), string? actorType = (), string? actorId = (), string? methodType = (), string? methodTruncatedToken = (), string[]? actions = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until, "root_resource_types[]": rootResourceTypes, "actor_type": actorType, "actor_id": actorId, "method_type": methodType, "method_truncated_token": methodTruncatedToken, "actions[]": actions};
        map<Encoding> queryParamEncoding = {"root_resource_types[]": {style: FORM, explode: true}, "actions[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Business Services
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + return - A paginated array of services. 
    remote isolated function listBusinessServices(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse2005|error {
        string resourcePath = string `/business_services`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Business Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The Business Service that was created. 
    remote isolated function createBusinessService(string accept, string contentType, BusinessServicesBody payload) returns InlineResponse2006|error {
        string resourcePath = string `/business_services`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a Business Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The service business requested. 
    remote isolated function getBusinessService(string accept, string contentType, string id) returns InlineResponse2006|error {
        string resourcePath = string `/business_services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Business Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Business Service that was updated. 
    remote isolated function updateBusinessService(string accept, string contentType, string id, BusinessServicesIdBody payload) returns InlineResponse2006|error {
        string resourcePath = string `/business_services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a Business Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Business Service was deleted successfully. 
    remote isolated function deleteBusinessService(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/business_services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Create Business Service Account Subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - OK 
    remote isolated function createBusinessServiceAccountSubscription(string accept, string id) returns InlineResponse2007|error {
        string resourcePath = string `/business_services/${id}/account_subscription`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2007 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete Business Service Account Subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - The account was unsubscribed successfully. 
    remote isolated function removeBusinessServiceAccountSubscription(string accept, string id) returns http:Response|error {
        string resourcePath = string `/business_services/${id}/account_subscription`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Business Service Subscribers
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - OK 
    remote isolated function getBusinessServiceSubscribers(string accept, string id) returns InlineResponse2008|error {
        string resourcePath = string `/business_services/${id}/subscribers`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2008 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Business Service Subscribers
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to subscribe. 
    # + return - OK 
    remote isolated function createBusinessServiceNotificationSubscribers(string accept, string id, IdSubscribersBody payload) returns InlineResponse2009|error {
        string resourcePath = string `/business_services/${id}/subscribers`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List the supporting Business Services for the given Business Service Id, sorted by impacted status.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + additionalFields - Provides access to additional fields such as highest priority per business service and total impacted count 
    # + ids - The IDs of the resources. 
    # + return - OK 
    remote isolated function getBusinessServiceSupportingServiceImpacts(string accept, string id, string xEarlyAccess, string? additionalFields = (), string? ids = ()) returns InlineResponse20010|error {
        string resourcePath = string `/business_services/${id}/supporting_services/impacts`;
        map<anydata> queryParam = {"additional_fields[]": additionalFields, "ids[]": ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove Business Service Subscribers
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to unsubscribe. 
    # + return - OK 
    remote isolated function removeBusinessServiceNotificationSubscriber(string accept, string id, IdUnsubscribeBody payload) returns InlineResponse20011|error {
        string resourcePath = string `/business_services/${id}/unsubscribe`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Impactors affecting Business Services
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + ids - The IDs of the resources. 
    # + return - OK 
    remote isolated function getBusinessServiceTopLevelImpactors(string accept, string xEarlyAccess, string? ids = ()) returns InlineResponse20012|error {
        string resourcePath = string `/business_services/impactors`;
        map<anydata> queryParam = {"ids[]": ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20012 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Business Services sorted by impacted status
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + additionalFields - Provides access to additional fields such as highest priority per business service and total impacted count 
    # + ids - The IDs of the resources. 
    # + return - OK 
    remote isolated function getBusinessServiceImpacts(string accept, string xEarlyAccess, string? additionalFields = (), string? ids = ()) returns InlineResponse20010|error {
        string resourcePath = string `/business_services/impacts`;
        map<anydata> queryParam = {"additional_fields[]": additionalFields, "ids[]": ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the global priority threshold for a Business Service to be considered impacted by an Incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getBusinessServicePriorityThresholds(string accept, string xEarlyAccess) returns InlineResponse20013|error {
        string resourcePath = string `/business_services/priority_thresholds`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20013 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set the Account-level priority threshold for Business Service impact.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + payload - Set the `id` and `order` of the global Priority Threshold. These values can be obtained by calling the `/priorities` endpoint. 
    # + return - OK 
    remote isolated function putBusinessServicePriorityThresholds(string accept, string xEarlyAccess, BusinessServicesPriorityThresholdsBody payload) returns InlineResponse20014|error {
        string resourcePath = string `/business_services/priority_thresholds`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20014 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Deletes the account-level priority threshold for Business Service impact
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + return - The Priority Threshold for the account was successfully cleared. 
    remote isolated function deleteBusinessServicePriorityThresholds(string accept, string xEarlyAccess) returns http:Response|error {
        string resourcePath = string `/business_services/priority_thresholds`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Change Events
    #
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + integrationIds - An array of integration IDs. Only results related to these integrations will be returned. 
    # + since - The start of the date range over which you want to search, as a UTC ISO 8601 datetime string. Will return an HTTP 400 for non-UTC datetimes. 
    # + until - The end of the date range over which you want to search, as a UTC ISO 8601 datetime string. Will return an HTTP 400 for non-UTC datetimes. 
    # + return - The array of Change Events returned by the query. 
    remote isolated function listChangeEvents(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string[]? teamIds = (), string[]? integrationIds = (), string? since = (), string? until = ()) returns InlineResponse20015|error {
        string resourcePath = string `/change_events`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "team_ids[]": teamIds, "integration_ids[]": integrationIds, "since": since, "until": until};
        map<Encoding> queryParamEncoding = {"team_ids[]": {style: FORM, explode: true}, "integration_ids[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20015 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Change Event
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - See [`Send Change Event`](https://developer.pagerduty.com/api-reference/reference/events-v2/openapiv3.json/paths/~1change~1enqueue/post) in the V2 Events API reference. 
    remote isolated function createChangeEvent(string accept, string contentType) returns http:Response|error {
        string resourcePath = string `/change_events`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a Change Event
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Change Event requested. 
    remote isolated function getChangeEvent(string accept, string contentType, string id) returns InlineResponse20016|error {
        string resourcePath = string `/change_events/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Change Event
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The Change Event to be updated. 
    # + return - The Change Event that was updated. 
    remote isolated function updateChangeEvent(string accept, string contentType, string id, ChangeEventsIdBody payload) returns InlineResponse20016|error {
        string resourcePath = string `/change_events/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20016 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List escalation policies
    #
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + userIds - Filters the results, showing only escalation policies on which any of the users is a target. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + include - Array of additional Models to include in response. 
    # + sortBy - Used to specify the field you wish to sort the results on. 
    # + return - A paginated array of escalation policy objects. 
    remote isolated function listEscalationPolicies(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? query = (), string[]? userIds = (), string[]? teamIds = (), string[]? include = (), string sortBy = "name") returns InlineResponse20017|error {
        string resourcePath = string `/escalation_policies`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "query": query, "user_ids[]": userIds, "team_ids[]": teamIds, "include[]": include, "sort_by": sortBy};
        map<Encoding> queryParamEncoding = {"user_ids[]": {style: FORM, explode: true}, "team_ids[]": {style: FORM, explode: true}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20017 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an escalation policy
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. This is optional, and is only used for change tracking. 
    # + payload - The escalation policy to be created. 
    # + return - The escalation policy that was created. 
    remote isolated function createEscalationPolicy(string accept, string contentType, EscalationPoliciesBody payload, string? 'from = ()) returns EscalationPoliciesBody|error {
        string resourcePath = string `/escalation_policies`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EscalationPoliciesBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an escalation policy
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - The escalation policy object. 
    remote isolated function getEscalationPolicy(string accept, string contentType, string id, string[]? include = ()) returns EscalationPoliciesBody|error {
        string resourcePath = string `/escalation_policies/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EscalationPoliciesBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an escalation policy
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The escalation policy to be updated. 
    # + return - The escalation policy that was updated. 
    remote isolated function updateEscalationPolicy(string accept, string contentType, string id, EscalationPoliciesIdBody payload) returns EscalationPoliciesIdBody|error {
        string resourcePath = string `/escalation_policies/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EscalationPoliciesIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an escalation policy
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The escalation policy was deleted successfully. 
    remote isolated function deleteEscalationPolicy(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/escalation_policies/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List audit records for an escalation policy
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + return - Records matching the query criteria. 
    remote isolated function listEscalationPolicyAuditRecords(string accept, string contentType, string id, int? 'limit = (), string? cursor = (), string? since = (), string? until = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/escalation_policies/${id}/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List extension schemas
    #
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - A paginated array of extension schemas. 
    remote isolated function listExtensionSchemas(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20018|error {
        string resourcePath = string `/extension_schemas`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20018 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get an extension vendor
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The extension vendor requested 
    remote isolated function getExtensionSchema(string accept, string contentType, string id) returns InlineResponse20019|error {
        string resourcePath = string `/extension_schemas/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20019 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List extensions
    #
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + extensionObjectId - The id of the extension object you want to filter by. 
    # + extensionSchemaId - Filter the extensions by extension vendor id. 
    # + include - Array of additional details to include. 
    # + return - A paginated array of extensions. 
    remote isolated function listExtensions(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? query = (), string? extensionObjectId = (), string? extensionSchemaId = (), string[]? include = ()) returns InlineResponse20020|error {
        string resourcePath = string `/extensions`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "query": query, "extension_object_id": extensionObjectId, "extension_schema_id": extensionSchemaId, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an extension
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The extension to be created 
    # + return - The extension that was created 
    remote isolated function createExtension(string accept, string contentType, ExtensionsBody payload) returns ExtensionsBody|error {
        string resourcePath = string `/extensions`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExtensionsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an extension
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional details to include. 
    # + return - The extension that was requested. 
    remote isolated function getExtension(string accept, string contentType, string id, string[]? include = ()) returns ExtensionsBody|error {
        string resourcePath = string `/extensions/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExtensionsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an extension
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The extension to be updated. 
    # + return - The extension that was updated. 
    remote isolated function updateExtension(string accept, string contentType, string id, ExtensionsIdBody payload) returns ExtensionsIdBody|error {
        string resourcePath = string `/extensions/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExtensionsIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an extension
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The extension was deleted successfully. 
    remote isolated function deleteExtension(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/extensions/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Enable an extension
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The extension that was successfully enabled. 
    remote isolated function enableExtension(string accept, string contentType, string id) returns ExtensionsIdBody|error {
        string resourcePath = string `/extensions/${id}/enable`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ExtensionsIdBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List incidents
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + dateRange - When set to all, the since and until parameters and defaults are ignored. 
    # + incidentKey - Incident de-duplication key. Incidents with child alerts do not have an incident key; querying by incident key will return incidents whose alerts have alert_key matching the given incident key. 
    # + serviceIds - Returns only the incidents associated with the passed service(s). This expects one or more service IDs. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + userIds - Returns only the incidents currently assigned to the passed user(s). This expects one or more user IDs. Note: When using the assigned_to_user filter, you will only receive incidents with statuses of triggered or acknowledged. This is because resolved incidents are not assigned to any user. 
    # + urgencies - Array of the urgencies of the incidents to be returned. Defaults to all urgencies. Account must have the `urgencies` ability to do this. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + statuses - Return only incidents with the given statuses. (More status codes may be introduced in the future.) 
    # + sortBy - Used to specify both the field you wish to sort the results on (incident_number/created_at/resolved_at/urgency), as well as the direction (asc/desc) of the results. The sort_by field and direction should be separated by a colon. A maximum of two fields can be included, separated by a comma. Sort direction defaults to ascending. The account must have the `urgencies` ability to sort by the urgency. 
    # + include - Array of additional details to include. 
    # + since - The start of the date range over which you want to search. Maximum range is 6 months and default is 1 month. 
    # + until - The end of the date range over which you want to search. Maximum range is 6 months and default is 1 month. 
    # + return - A paginated array of incidents. 
    remote isolated function listIncidents(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? dateRange = (), string? incidentKey = (), string[]? serviceIds = (), string[]? teamIds = (), string[]? userIds = (), string[]? urgencies = (), string timeZone = "UTC", string[]? statuses = (), string[]? sortBy = (), string[]? include = (), string? since = (), string? until = ()) returns InlineResponse20021|error {
        string resourcePath = string `/incidents`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "date_range": dateRange, "incident_key": incidentKey, "service_ids[]": serviceIds, "team_ids[]": teamIds, "user_ids[]": userIds, "urgencies[]": urgencies, "time_zone": timeZone, "statuses[]": statuses, "sort_by": sortBy, "include[]": include, "since": since, "until": until};
        map<Encoding> queryParamEncoding = {"service_ids[]": {style: FORM, explode: true}, "team_ids[]": {style: FORM, explode: true}, "user_ids[]": {style: FORM, explode: true}, "urgencies[]": {style: FORM, explode: true}, "statuses[]": {style: FORM, explode: true}, "sort_by": {style: FORM, explode: false}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20021 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Manage incidents
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - All of the updates succeeded. 
    remote isolated function updateIncidents(string accept, string contentType, string 'from, IncidentsBody payload, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20021|error {
        string resourcePath = string `/incidents`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20021 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create an Incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The incident object created. 
    remote isolated function createIncident(string accept, string contentType, string 'from, IncidentsBody1 payload) returns InlineResponse2011|error {
        string resourcePath = string `/incidents`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The incident requested. 
    remote isolated function getIncident(string accept, string contentType, string id) returns InlineResponse2011|error {
        string resourcePath = string `/incidents/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2011 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The incident was updated. 
    remote isolated function updateIncident(string accept, string contentType, string id, string 'from, IncidentsIdBody payload) returns InlineResponse20022|error {
        string resourcePath = string `/incidents/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20022 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List alerts for an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + alertKey - Alert de-duplication key. 
    # + statuses - Return only alerts with the given statuses. (More status codes may be introduced in the future.) 
    # + sortBy - Used to specify both the field you wish to sort the results on (created_at/resolved_at), as well as the direction (asc/desc) of the results. The sort_by field and direction should be separated by a colon. A maximum of two fields can be included, separated by a comma. Sort direction defaults to ascending. 
    # + include - Array of additional details to include. 
    # + return - A paginated array of the incident's alerts. 
    remote isolated function listIncidentAlerts(string accept, string contentType, string id, int? 'limit = (), int? offset = (), boolean total = false, string? alertKey = (), string[]? statuses = (), string[]? sortBy = (), string[]? include = ()) returns InlineResponse20023|error {
        string resourcePath = string `/incidents/${id}/alerts`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "alert_key": alertKey, "statuses[]": statuses, "sort_by": sortBy, "include[]": include};
        map<Encoding> queryParamEncoding = {"statuses[]": {style: FORM, explode: true}, "sort_by": {style: FORM, explode: false}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20023 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Manage alerts
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - All of the updates succeeded. 
    remote isolated function updateIncidentAlerts(string accept, string contentType, string id, string 'from, IdAlertsBody payload, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20023|error {
        string resourcePath = string `/incidents/${id}/alerts`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20023 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an alert
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + alertId - The id of the alert to retrieve. 
    # + return - The alert requested. 
    remote isolated function getIncidentAlert(string accept, string contentType, string id, string alertId) returns InlineResponse20024|error {
        string resourcePath = string `/incidents/${id}/alerts/${alertId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20024 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an alert
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + alertId - The id of the alert to retrieve. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + payload - The parameters of the alert to update. 
    # + return - The alert that was updated. 
    remote isolated function updateIncidentAlert(string accept, string contentType, string id, string alertId, string 'from, AlertsAlertIdBody payload) returns AlertsAlertIdBody|error {
        string resourcePath = string `/incidents/${id}/alerts/${alertId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AlertsAlertIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Manually change an Incident's Impact on a Business Service.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + businessServiceId - The business service ID. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + payload - The `impacted` relation will cause the Business Service and any Services that it supports to become impacted by this incident. 
    # + return - OK 
    remote isolated function putIncidentManualBusinessServiceAssociation(string accept, string id, string businessServiceId, string xEarlyAccess, BusinessServiceIdImpactsBody payload) returns InlineResponse20025|error {
        string resourcePath = string `/incidents/${id}/business_services/${businessServiceId}/impacts`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20025 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Business Services impacted by the given Incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `business-impact-early-access`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getIncidentImpactedBusinessServices(string accept, string id, string xEarlyAccess) returns InlineResponse20026|error {
        string resourcePath = string `/incidents/${id}/business_services/impacts`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20026 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List log entries for an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + isOverview - If `true`, will return a subset of log entries that show only the most important changes to the incident. 
    # + include - Array of additional Models to include in response. 
    # + return - A paginated array of the incident's log entries. 
    remote isolated function listIncidentLogEntries(string accept, string contentType, string id, int? 'limit = (), int? offset = (), boolean total = false, string timeZone = "UTC", string? since = (), string? until = (), boolean isOverview = false, string[]? include = ()) returns InlineResponse20027|error {
        string resourcePath = string `/incidents/${id}/log_entries`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "time_zone": timeZone, "since": since, "until": until, "is_overview": isOverview, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Merge incidents
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The target incident, which now contains all the alerts from the source incident. 
    remote isolated function mergeIncidents(string accept, string contentType, string id, string 'from, IdMergeBody payload) returns InlineResponse20028|error {
        string resourcePath = string `/incidents/${id}/merge`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20028 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List notes for an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - An array of notes. 
    remote isolated function listIncidentNotes(string accept, string contentType, string id) returns InlineResponse20029|error {
        string resourcePath = string `/incidents/${id}/notes`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20029 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a note on an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The new note. 
    remote isolated function createIncidentNote(string accept, string contentType, string id, string 'from, IdNotesBody payload) returns InlineResponse20030|error {
        string resourcePath = string `/incidents/${id}/notes`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20030 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Outlier Incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + since - The start of the date range over which you want to search. 
    # + additionalDetails - Array of additional attributes to any of the returned incidents for related incidents. 
    # + return - Outlier Incident information calculated over the same Service as the given Incident. 
    remote isolated function getOutlierIncident(string accept, string contentType, string id, string? since = (), string[]? additionalDetails = ()) returns InlineResponse20031|error {
        string resourcePath = string `/incidents/${id}/outlier_incident`;
        map<anydata> queryParam = {"since": since, "additional_details[]": additionalDetails};
        map<Encoding> queryParamEncoding = {"additional_details[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20031 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Past Incidents
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The number of results to be returned in the response. 
    # + total - By default the `total` field in the response body is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated with the total number of Past Incidents. 
    # + return - OK 
    remote isolated function getPastIncidents(string accept, string contentType, string id, int 'limit = 5, boolean total = false) returns InlineResponse20032|error {
        string resourcePath = string `/incidents/${id}/past_incidents`;
        map<anydata> queryParam = {"limit": 'limit, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List related Change Events for an Incident
    #
    # + id - The ID of the resource. 
    # + 'limit - The number of results per page. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The array of Change Events returned by the query. 
    remote isolated function listIncidentRelatedChangeEvents(string id, string accept, string contentType, int? 'limit = ()) returns InlineResponse20033|error {
        string resourcePath = string `/incidents/${id}/related_change_events`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20033 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Related Incidents
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + additionalDetails - Array of additional attributes to any of the returned incidents for related incidents. 
    # + return - A list of Related Incidents and their relationships. 
    remote isolated function getRelatedIncidents(string accept, string contentType, string id, string[]? additionalDetails = ()) returns InlineResponse20034|error {
        string resourcePath = string `/incidents/${id}/related_incidents`;
        map<anydata> queryParam = {"additional_details[]": additionalDetails};
        map<Encoding> queryParamEncoding = {"additional_details[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20034 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a responder request for an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The new responder request for the given incident. 
    remote isolated function createIncidentResponderRequest(string accept, string contentType, string id, string 'from, IdResponderRequestsBody payload) returns InlineResponse20035|error {
        string resourcePath = string `/incidents/${id}/responder_requests`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20035 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Snooze an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The incident that was successfully snoozed. 
    remote isolated function createIncidentSnooze(string accept, string contentType, string id, string 'from, IdSnoozeBody payload) returns InlineResponse2011|error {
        string resourcePath = string `/incidents/${id}/snooze`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a status update on an incident
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - The new status update for the specified incident. 
    remote isolated function createIncidentStatusUpdate(string accept, string contentType, string id, string 'from, IdStatusUpdatesBody payload) returns InlineResponse20036|error {
        string resourcePath = string `/incidents/${id}/status_updates`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20036 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Notification Subscribers
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - OK 
    remote isolated function getIncidentNotificationSubscribers(string accept, string id) returns InlineResponse20037|error {
        string resourcePath = string `/incidents/${id}/status_updates/subscribers`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20037 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add Notification Subscribers
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to subscribe. 
    # + return - OK 
    remote isolated function createIncidentNotificationSubscribers(string accept, string id, StatusUpdatesSubscribersBody payload) returns InlineResponse2009|error {
        string resourcePath = string `/incidents/${id}/status_updates/subscribers`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove Notification Subscriber
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to unsubscribe. 
    # + return - OK 
    remote isolated function removeIncidentNotificationSubscribers(string accept, string id, StatusUpdatesUnsubscribeBody payload) returns InlineResponse20011|error {
        string resourcePath = string `/incidents/${id}/status_updates/unsubscribe`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List log entries
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + isOverview - If `true`, will return a subset of log entries that show only the most important changes to the incident. 
    # + include - Array of additional Models to include in response. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + return - A paginated array of log entries. 
    remote isolated function listLogEntries(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string timeZone = "UTC", string? since = (), string? until = (), boolean isOverview = false, string[]? include = (), string[]? teamIds = ()) returns InlineResponse20027|error {
        string resourcePath = string `/log_entries`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "time_zone": timeZone, "since": since, "until": until, "is_overview": isOverview, "include[]": include, "team_ids[]": teamIds};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}, "team_ids[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a log entry
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - A single log entry. 
    remote isolated function getLogEntry(string accept, string contentType, string id, string timeZone = "UTC", string[]? include = ()) returns InlineResponse20038|error {
        string resourcePath = string `/log_entries/${id}`;
        map<anydata> queryParam = {"time_zone": timeZone, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20038 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update log entry channel information.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + payload - The log entry channel to be updated. 
    # + return - The channel information modification was accepted. 
    remote isolated function updateLogEntryChannel(string accept, string contentType, string id, string 'from, IdChannelBody payload) returns http:Response|error {
        string resourcePath = string `/log_entries/${id}/channel`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List maintenance windows
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + serviceIds - An array of service IDs. Only results related to these services will be returned. 
    # + include - Array of additional Models to include in response. 
    # + filter - Only return maintenance windows in a given state. 
    # + return - A paginated array of maintenance windows. 
    remote isolated function listMaintenanceWindows(string accept, string contentType, string? query = (), int? 'limit = (), int? offset = (), boolean total = false, string[]? teamIds = (), string[]? serviceIds = (), string[]? include = (), string? filter = ()) returns InlineResponse20039|error {
        string resourcePath = string `/maintenance_windows`;
        map<anydata> queryParam = {"query": query, "limit": 'limit, "offset": offset, "total": total, "team_ids[]": teamIds, "service_ids[]": serviceIds, "include[]": include, "filter": filter};
        map<Encoding> queryParamEncoding = {"team_ids[]": {style: FORM, explode: true}, "service_ids[]": {style: FORM, explode: true}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20039 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a maintenance window
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + payload - The maintenance window object. 
    # + return - The maintenance window that was created. 
    remote isolated function createMaintenanceWindow(string accept, string contentType, string 'from, MaintenanceWindowsBody payload) returns MaintenanceWindowsBody|error {
        string resourcePath = string `/maintenance_windows`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MaintenanceWindowsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a maintenance window
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - The maintenance window that was updated. 
    remote isolated function getMaintenanceWindow(string accept, string contentType, string id, string[]? include = ()) returns MaintenanceWindowsBody|error {
        string resourcePath = string `/maintenance_windows/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MaintenanceWindowsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a maintenance window
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The maintenance window to be updated. 
    # + return - The maintenance window that was updated. 
    remote isolated function updateMaintenanceWindow(string accept, string contentType, string id, MaintenanceWindowsIdBody payload) returns MaintenanceWindowsIdBody|error {
        string resourcePath = string `/maintenance_windows/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MaintenanceWindowsIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete or end a maintenance window
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The maintenance window was deleted successfully. 
    remote isolated function deleteMaintenanceWindow(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/maintenance_windows/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List notifications
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + since - The start of the date range over which you want to search. The time element is optional. 
    # + until - The end of the date range over which you want to search. This should be in the same format as since. The size of the date range must be less than 3 months. 
    # + filter - Return notification of this type only. 
    # + include - Array of additional details to include. 
    # + return - A paginated array of notifications. 
    remote isolated function listNotifications(string accept, string contentType, string since, string until, int? 'limit = (), int? offset = (), boolean total = false, string timeZone = "UTC", string? filter = (), string[]? include = ()) returns InlineResponse20040|error {
        string resourcePath = string `/notifications`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "time_zone": timeZone, "since": since, "until": until, "filter": filter, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20040 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all of the on-calls
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + include - Array of additional details to include. 
    # + userIds - Filters the results, showing only on-calls for the specified user IDs. 
    # + escalationPolicyIds - Filters the results, showing only on-calls for the specified escalation policy IDs. 
    # + scheduleIds - Filters the results, showing only on-calls for the specified schedule IDs. If `null` is provided in the array, it includes permanent on-calls due to direct user escalation targets. 
    # + since - The start of the time range over which you want to search. If an on-call period overlaps with the range, it will be included in the result. Defaults to current time. The search range cannot exceed 3 months. 
    # + until - The end of the time range over which you want to search. If an on-call period overlaps with the range, it will be included in the result. Defaults to current time. The search range cannot exceed 3 months, and the `until` time cannot be before the `since` time. 
    # + earliest - This will filter on-calls such that only the earliest on-call for each combination of escalation policy, escalation level, and user is returned. This is useful for determining when the "next" on-calls are for a given set of filters. 
    # + return - A paginated array of on-call objects. 
    remote isolated function listOnCalls(string accept, string contentType, string timeZone = "UTC", int? 'limit = (), int? offset = (), boolean total = false, string[]? include = (), string[]? userIds = (), string[]? escalationPolicyIds = (), string[]? scheduleIds = (), string? since = (), string? until = (), boolean? earliest = ()) returns InlineResponse20041|error {
        string resourcePath = string `/oncalls`;
        map<anydata> queryParam = {"time_zone": timeZone, "limit": 'limit, "offset": offset, "total": total, "include[]": include, "user_ids[]": userIds, "escalation_policy_ids[]": escalationPolicyIds, "schedule_ids[]": scheduleIds, "since": since, "until": until, "earliest": earliest};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}, "user_ids[]": {style: FORM, explode: true}, "escalation_policy_ids[]": {style: FORM, explode: true}, "schedule_ids[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20041 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List priorities
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + return - A paginated array of priorities. 
    remote isolated function listPriorities(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20042|error {
        string resourcePath = string `/priorities`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20042 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Response Plays
    #
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + filterForManualRun - When this parameter is present, only those Response Plays that can be run manually will be returned. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. This is optional, and is only used for change tracking. 
    # + return - The array of Response Plays returned by the query. 
    remote isolated function listResponsePlays(string accept, string contentType, string? query = (), boolean? filterForManualRun = (), string? 'from = ()) returns InlineResponse20043|error {
        string resourcePath = string `/response_plays`;
        map<anydata> queryParam = {"query": query, "filter_for_manual_run": filterForManualRun};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20043 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Response Play
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The Response Play to be created. 
    # + return - The Response Play that was created. 
    remote isolated function createResponsePlay(string accept, string contentType, ResponsePlaysBody payload) returns InlineResponse2012|error {
        string resourcePath = string `/response_plays`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2012 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a Response Play
    #
    # + id - The ID of the resource. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. This is optional, and is only used for change tracking. 
    # + return - The Response Play requested. 
    remote isolated function getResponsePlay(string id, string accept, string contentType, string? 'from = ()) returns InlineResponse2012|error {
        string resourcePath = string `/response_plays/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2012 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Response Play
    #
    # + id - The ID of the resource. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The Response Play to be updated. 
    # + return - The Response Play that was updated. 
    remote isolated function updateResponsePlay(string id, string accept, string contentType, ResponsePlaysIdBody payload) returns InlineResponse2012|error {
        string resourcePath = string `/response_plays/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2012 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a Response Play
    #
    # + id - The ID of the resource. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The Response Play was deleted successfully. 
    remote isolated function deleteResponsePlay(string id, string accept, string contentType) returns http:Response|error {
        string resourcePath = string `/response_plays/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Run a response play
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + responsePlayId - The response play ID of the response play associated with the request. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + return - Informs the user if the response play has been run successfully. 
    remote isolated function runResponsePlay(string accept, string contentType, string responsePlayId, string 'from, ResponsePlayIdRunBody payload) returns InlineResponse20044|error {
        string resourcePath = string `/response_plays/${responsePlayId}/run`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20044 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Rulesets
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + return - A paginated array of Ruleset objects. 
    remote isolated function listRulesets(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20045|error {
        string resourcePath = string `/rulesets`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20045 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Ruleset
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The Ruleset that was created. 
    remote isolated function createRuleset(string accept, string contentType, RulesetsBody payload) returns InlineResponse2013|error {
        string resourcePath = string `/rulesets`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2013 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a Ruleset
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Ruleset object. 
    remote isolated function getRuleset(string accept, string contentType, string id) returns InlineResponse2013|error {
        string resourcePath = string `/rulesets/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2013 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Ruleset
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Ruleset that was updated. 
    remote isolated function updateRuleset(string accept, string contentType, string id, RulesetsIdBody payload) returns InlineResponse2013|error {
        string resourcePath = string `/rulesets/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2013 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a Ruleset
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Ruleset was deleted successfully. 
    remote isolated function deleteRuleset(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/rulesets/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Event Rules
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + return - A paginated array of Event Rule objects. 
    remote isolated function listRulesetEventRules(string accept, string contentType, string id, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20046|error {
        string resourcePath = string `/rulesets/${id}/rules`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20046 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an Event Rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Event Rule that was created. 
    remote isolated function createRulesetEventRule(string accept, string contentType, string id, IdRulesBody payload) returns InlineResponse2014|error {
        string resourcePath = string `/rulesets/${id}/rules`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an Event Rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule object. 
    remote isolated function getRulesetEventRule(string accept, string contentType, string id, string ruleId) returns InlineResponse2014|error {
        string resourcePath = string `/rulesets/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2014 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an Event Rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule that was updated. 
    remote isolated function updateRulesetEventRule(string accept, string contentType, string id, string ruleId, RulesRuleIdBody payload) returns InlineResponse2014|error {
        string resourcePath = string `/rulesets/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2014 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an Event Rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule was deleted successfully. 
    remote isolated function deleteRulesetEventRule(string accept, string contentType, string id, string ruleId) returns http:Response|error {
        string resourcePath = string `/rulesets/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List schedules
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + include - Array of additional details to include. 
    # + return - A paginated array of schedule objects. 
    remote isolated function listSchedules(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? query = (), string[]? include = ()) returns InlineResponse20047|error {
        string resourcePath = string `/schedules`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "query": query, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20047 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + overflow - Any on-call schedule entries that pass the date range bounds will be truncated at the bounds, unless the parameter `overflow=true` is passed. This parameter defaults to false. For instance, if your schedule is a rotation that changes daily at midnight UTC, and your date range is from `2011-06-01T10:00:00Z` to `2011-06-01T14:00:00Z`: - If you don't pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T10:00:00Z` and end of `2011-06-01T14:00:00Z`. - If you do pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T00:00:00Z` and end of `2011-06-02T00:00:00Z`. 
    # + payload - The schedule to be created. 
    # + return - The schedule object created. 
    remote isolated function createSchedule(string accept, string contentType, SchedulesBody payload, boolean overflow = false) returns SchedulesBody|error {
        string resourcePath = string `/schedules`;
        map<anydata> queryParam = {"overflow": overflow};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SchedulesBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + id - The ID of the resource. 
    # + return - The schedule object. 
    remote isolated function getSchedule(string accept, string contentType, string id, string timeZone = "UTC", string? since = (), string? until = ()) returns SchedulesBody|error {
        string resourcePath = string `/schedules/${id}`;
        map<anydata> queryParam = {"time_zone": timeZone, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SchedulesBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + overflow - Any on-call schedule entries that pass the date range bounds will be truncated at the bounds, unless the parameter `overflow=true` is passed. This parameter defaults to false. For instance, if your schedule is a rotation that changes daily at midnight UTC, and your date range is from `2011-06-01T10:00:00Z` to `2011-06-01T14:00:00Z`: - If you don't pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T10:00:00Z` and end of `2011-06-01T14:00:00Z`. - If you do pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T00:00:00Z` and end of `2011-06-02T00:00:00Z`. 
    # + payload - The schedule to be updated. 
    # + return - The updated schedule. 
    remote isolated function updateSchedule(string accept, string contentType, string id, SchedulesIdBody payload, boolean overflow = false) returns SchedulesIdBody|error {
        string resourcePath = string `/schedules/${id}`;
        map<anydata> queryParam = {"overflow": overflow};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SchedulesIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The schedule was deleted successfully. 
    remote isolated function deleteSchedule(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/schedules/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List audit records for a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + return - Records matching the query criteria. 
    remote isolated function listSchedulesAuditRecords(string accept, string contentType, string id, int? 'limit = (), string? cursor = (), string? since = (), string? until = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/schedules/${id}/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List overrides
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + editable - When this parameter is present, only editable overrides will be returned. The result will only include the id of the override if this parameter is present. Only future overrides are editable. 
    # + overflow - Any on-call schedule entries that pass the date range bounds will be truncated at the bounds, unless the parameter overflow=true is passed. This parameter defaults to false. 
    # + return - The collection of override objects returned by the query. 
    remote isolated function listScheduleOverrides(string accept, string contentType, string id, string since, string until, boolean? editable = (), boolean? overflow = ()) returns InlineResponse2015|error {
        string resourcePath = string `/schedules/${id}/overrides`;
        map<anydata> queryParam = {"since": since, "until": until, "editable": editable, "overflow": overflow};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2015 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create one or more overrides
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The overrides to be created 
    # + return - A list of overrides requested and a status code indicating whether they were created or rejected 
    remote isolated function createScheduleOverride(string accept, string contentType, string id, IdOverridesBody payload) returns InlineResponse2016[]|error {
        string resourcePath = string `/schedules/${id}/overrides`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2016[] response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an override
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + overrideId - The override ID on the schedule. 
    # + return - The override was truncated. 
    remote isolated function deleteScheduleOverride(string accept, string contentType, string id, string overrideId) returns http:Response|error {
        string resourcePath = string `/schedules/${id}/overrides/${overrideId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List users on call.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + return - The users on the given schedule. 
    remote isolated function listScheduleUsers(string accept, string contentType, string id, string? since = (), string? until = ()) returns InlineResponse20048|error {
        string resourcePath = string `/schedules/${id}/users`;
        map<anydata> queryParam = {"since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20048 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Preview a schedule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + since - The start of the date range over which you want to search. 
    # + until - The end of the date range over which you want to search. 
    # + overflow - Any on-call schedule entries that pass the date range bounds will be truncated at the bounds, unless the parameter `overflow=true` is passed. This parameter defaults to false. For instance, if your schedule is a rotation that changes daily at midnight UTC, and your date range is from `2011-06-01T10:00:00Z` to `2011-06-01T14:00:00Z`: - If you don't pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T10:00:00Z` and end of `2011-06-01T14:00:00Z`. - If you do pass the `overflow=true` parameter, you will get one schedule entry returned with a start of `2011-06-01T00:00:00Z` and end of `2011-06-02T00:00:00Z`. 
    # + payload - The schedule to be previewed. 
    # + return - What the schedule will look like if posted. 
    remote isolated function createSchedulePreview(string accept, string contentType, SchedulesPreviewBody payload, string? since = (), string? until = (), boolean overflow = false) returns SchedulesPreviewBody|error {
        string resourcePath = string `/schedules/preview`;
        map<anydata> queryParam = {"since": since, "until": until, "overflow": overflow};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SchedulesPreviewBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Associate service dependencies
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - An array of service relationships that were successfully associated. 
    remote isolated function createServiceDependency(string accept, string contentType, ServiceDependenciesAssociateBody payload) returns InlineResponse20049|error {
        string resourcePath = string `/service_dependencies/associate`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20049 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Business Service dependencies
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - An array of service relationships. 
    remote isolated function getBusinessServiceServiceDependencies(string accept, string contentType, string id) returns InlineResponse20050|error {
        string resourcePath = string `/service_dependencies/business_services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20050 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Disassociate service dependencies
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - An array of service relationships that were successfully disassociated. 
    remote isolated function deleteServiceDependency(string accept, string contentType, ServiceDependenciesDisassociateBody payload) returns InlineResponse20049|error {
        string resourcePath = string `/service_dependencies/disassociate`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20049 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get technical service dependencies
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - An array of service relationships. 
    remote isolated function getTechnicalServiceServiceDependencies(string accept, string contentType, string id) returns InlineResponse20049|error {
        string resourcePath = string `/service_dependencies/technical_services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20049 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List services
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + timeZone - Time zone in which dates in the result will be rendered. 
    # + sortBy - Used to specify the field you wish to sort the results on. 
    # + include - Array of additional details to include. 
    # + return - A paginated array of services. 
    remote isolated function listServices(string accept, string contentType, string? query = (), int? 'limit = (), int? offset = (), boolean total = false, string[]? teamIds = (), string timeZone = "UTC", string sortBy = "name", string[]? include = ()) returns InlineResponse20051|error {
        string resourcePath = string `/services`;
        map<anydata> queryParam = {"query": query, "limit": 'limit, "offset": offset, "total": total, "team_ids[]": teamIds, "time_zone": timeZone, "sort_by": sortBy, "include[]": include};
        map<Encoding> queryParamEncoding = {"team_ids[]": {style: FORM, explode: true}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20051 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The service to be created 
    # + return - The service that was created 
    remote isolated function createService(string accept, string contentType, ServicesBody payload) returns ServicesBody|error {
        string resourcePath = string `/services`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ServicesBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional details to include. 
    # + return - The service requested. 
    remote isolated function getService(string accept, string contentType, string id, string[]? include = ()) returns ServicesBody|error {
        string resourcePath = string `/services/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ServicesBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The service to be updated. 
    # + return - The service that was updated. 
    remote isolated function updateService(string accept, string contentType, string id, ServicesIdBody payload) returns ServicesIdBody|error {
        string resourcePath = string `/services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ServicesIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The service was deleted successfully. 
    remote isolated function deleteService(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/services/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List audit records for a service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + return - Records matching the query criteria. 
    remote isolated function listServiceAuditRecords(string accept, string contentType, string id, int? 'limit = (), string? cursor = (), string? since = (), string? until = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/services/${id}/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Change Events for a service
    #
    # + id - The ID of the resource. 
    # + since - The start of the date range over which you want to search, as a UTC ISO 8601 datetime string. Will return an HTTP 400 for non-UTC datetimes. 
    # + until - The end of the date range over which you want to search, as a UTC ISO 8601 datetime string. Will return an HTTP 400 for non-UTC datetimes. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + integrationIds - An array of integration IDs. Only results related to these integrations will be returned. 
    # + return - The array of Change Events returned by the query. 
    remote isolated function listServiceChangeEvents(string id, string accept, string contentType, string? since = (), string? until = (), int? 'limit = (), int? offset = (), boolean total = false, string[]? teamIds = (), string[]? integrationIds = ()) returns InlineResponse20015|error {
        string resourcePath = string `/services/${id}/change_events`;
        map<anydata> queryParam = {"since": since, "until": until, "limit": 'limit, "offset": offset, "total": total, "team_ids[]": teamIds, "integration_ids[]": integrationIds};
        map<Encoding> queryParamEncoding = {"team_ids[]": {style: FORM, explode: true}, "integration_ids[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20015 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new integration
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The integration to be created 
    # + return - The integration that was created. 
    remote isolated function createServiceIntegration(string accept, string contentType, string id, IdIntegrationsBody payload) returns IdIntegrationsBody|error {
        string resourcePath = string `/services/${id}/integrations`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdIntegrationsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # View an integration
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + integrationId - The integration ID on the service. 
    # + include - Array of additional details to include. 
    # + return - The integration that was requested. 
    remote isolated function getServiceIntegration(string accept, string contentType, string id, string integrationId, string[]? include = ()) returns IdIntegrationsBody|error {
        string resourcePath = string `/services/${id}/integrations/${integrationId}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IdIntegrationsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an existing integration
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + integrationId - The integration ID on the service. 
    # + payload - The integration to be updated 
    # + return - The integration that was updated. 
    remote isolated function updateServiceIntegration(string accept, string contentType, string id, string integrationId, IntegrationsIntegrationIdBody payload) returns IntegrationsIntegrationIdBody|error {
        string resourcePath = string `/services/${id}/integrations/${integrationId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IntegrationsIntegrationIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Service's Event Rules
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + return - A paginated array of Event Rule objects. 
    remote isolated function listServiceEventRules(string accept, string contentType, string id, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20052|error {
        string resourcePath = string `/services/${id}/rules`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20052 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an Event Rule on a Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The Event Rule that was created. 
    remote isolated function createServiceEventRule(string accept, string contentType, string id, IdRulesBody1 payload) returns InlineResponse2017|error {
        string resourcePath = string `/services/${id}/rules`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get an Event Rule from a Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule object. 
    remote isolated function getServiceEventRule(string accept, string contentType, string id, string ruleId) returns InlineResponse2017|error {
        string resourcePath = string `/services/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2017 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an Event Rule on a Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule that was updated. 
    remote isolated function updateServiceEventRule(string accept, string contentType, string id, string ruleId, RulesRuleIdBody1 payload) returns InlineResponse2017|error {
        string resourcePath = string `/services/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2017 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete an Event Rule from a Service
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + ruleId - The id of the Event Rule to retrieve. 
    # + return - The Event Rule was deleted successfully. 
    remote isolated function deleteServiceEventRule(string accept, string contentType, string id, string ruleId) returns http:Response|error {
        string resourcePath = string `/services/${id}/rules/${ruleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Status Dashboards
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `status-dashboards`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function listStatusDashboards(string accept, string xEarlyAccess) returns InlineResponse20053|error {
        string resourcePath = string `/status_dashboards`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20053 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a single Status Dashboard by `id`
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `status-dashboards`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getStatusDashboardById(string accept, string id, string xEarlyAccess) returns InlineResponse20054|error {
        string resourcePath = string `/status_dashboards/${id}`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20054 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get impacted Business Services for a Status Dashboard by `id`.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + additionalFields - Provides access to additional fields such as highest priority per business service and total impacted count 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `status-dashboards`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getStatusDashboardServiceImpactsById(string accept, string id, string xEarlyAccess, string? additionalFields = ()) returns InlineResponse20010|error {
        string resourcePath = string `/status_dashboards/${id}/service_impacts`;
        map<anydata> queryParam = {"additional_fields[]": additionalFields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a single Status Dashboard by `url_slug`
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + urlSlug - The `url_slug` for a status dashboard 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `status-dashboards`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getStatusDashboardByUrlSlug(string accept, string urlSlug, string xEarlyAccess) returns InlineResponse20054|error {
        string resourcePath = string `/status_dashboards/url_slugs/${urlSlug}`;
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20054 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get impacted Business Services for a  Status Dashboard by `url_slug`
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + urlSlug - The `url_slug` for a status dashboard 
    # + additionalFields - Provides access to additional fields such as highest priority per business service and total impacted count 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header with the value `status-dashboards`. Do not use this endpoint in production, as it may change! 
    # + return - OK 
    remote isolated function getStatusDashboardServiceImpactsByUrlSlug(string accept, string urlSlug, string xEarlyAccess, string? additionalFields = ()) returns InlineResponse20010|error {
        string resourcePath = string `/status_dashboards/url_slugs/${urlSlug}/service_impacts`;
        map<anydata> queryParam = {"additional_fields[]": additionalFields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List tags
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + return - An array of tags names. 
    remote isolated function listTags(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? query = ()) returns InlineResponse200|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "query": query};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a tag
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The tag that was created. 
    remote isolated function createTags(string accept, string contentType, TagsBody payload) returns TagsBody|error {
        string resourcePath = string `/tags`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TagsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a tag
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The tag requested. 
    remote isolated function getTag(string accept, string contentType, string id) returns TagsBody|error {
        string resourcePath = string `/tags/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TagsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a tag
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The tag was deleted successfully. 
    remote isolated function deleteTag(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/tags/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Get connected entities
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + entityType - Type of entity related with the tag 
    # + return - An array of connected entities. 
    remote isolated function getTagsByEntityType(string accept, string contentType, string id, string entityType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20055|error {
        string resourcePath = string `/tags/${id}/${entityType}`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20055 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List teams
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + return - A paginated array of teams. 
    remote isolated function listTeams(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false, string? query = ()) returns InlineResponse20056|error {
        string resourcePath = string `/teams`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "query": query};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20056 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + payload - The team to be created. 
    # + return - The team that was created. 
    remote isolated function createTeam(string accept, string contentType, TeamsBody payload) returns TeamsBody|error {
        string resourcePath = string `/teams`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TeamsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - The team requested. 
    remote isolated function getTeam(string accept, string contentType, string id, string[]? include = ()) returns TeamsBody|error {
        string resourcePath = string `/teams/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TeamsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The team to be updated. 
    # + return - The team that was updated. 
    remote isolated function updateTeam(string accept, string contentType, string id, TeamsIdBody payload) returns TeamsIdBody|error {
        string resourcePath = string `/teams/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TeamsIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + reassignmentTeam - Team to reassign unresolved incident to. If an unresolved incident exists on both the reassignment team and the team being deleted, a duplicate will not be made. If not supplied, unresolved incidents will be made account-level. 
    # + id - The ID of the resource. 
    # + return - The team was deleted successfully. 
    remote isolated function deleteTeam(string accept, string contentType, string id, string? reassignmentTeam = ()) returns http:Response|error {
        string resourcePath = string `/teams/${id}`;
        map<anydata> queryParam = {"reassignment_team": reassignmentTeam};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List audit records for a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + return - Records matching the query criteria. 
    remote isolated function listTeamsAuditRecords(string accept, string contentType, string id, int? 'limit = (), string? cursor = (), string? since = (), string? until = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/teams/${id}/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add an escalation policy to a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + escalationPolicyId - The escalation policy ID on the team. 
    # + return - The escalation policy was added to the team. 
    remote isolated function updateTeamEscalationPolicy(string accept, string contentType, string id, string escalationPolicyId) returns http:Response|error {
        string resourcePath = string `/teams/${id}/escalation_policies/${escalationPolicyId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove an escalation policy from a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + escalationPolicyId - The escalation policy ID on the team. 
    # + return - The escalation policy was removed from the team. 
    remote isolated function deleteTeamEscalationPolicy(string accept, string contentType, string id, string escalationPolicyId) returns http:Response|error {
        string resourcePath = string `/teams/${id}/escalation_policies/${escalationPolicyId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List members of a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - A paginated array of users within the requested team. 
    remote isolated function listTeamUsers(string accept, string contentType, string id, int? 'limit = (), int? offset = (), boolean total = false, string[]? include = ()) returns InlineResponse20057|error {
        string resourcePath = string `/teams/${id}/members`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20057 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Team Notification Subscriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - OK 
    remote isolated function getTeamNotificationSubscriptions(string accept, string id) returns InlineResponse20058|error {
        string resourcePath = string `/teams/${id}/notification_subscriptions`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20058 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Team Notification Subscriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to subscribe to. 
    # + return - OK 
    remote isolated function createTeamNotificationSubscriptions(string accept, string id, IdNotificationSubscriptionsBody payload) returns InlineResponse2009|error {
        string resourcePath = string `/teams/${id}/notification_subscriptions`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Unsubscribe the given Team from Notifications on the matching Subscribable entities.
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to unsubscribe from. 
    # + return - OK 
    remote isolated function removeTeamNotificationSubscriptions(string accept, string id, NotificationSubscriptionsUnsubscribeBody payload) returns InlineResponse20011|error {
        string resourcePath = string `/teams/${id}/notification_subscriptions/unsubscribe`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Add a user to a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + userId - The user ID on the team. 
    # + payload - The role of the user on the team. 
    # + return - The user was added to the team. 
    remote isolated function updateTeamUser(string accept, string contentType, string id, string userId, UsersUserIdBody payload) returns http:Response|error {
        string resourcePath = string `/teams/${id}/users/${userId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove a user from a team
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + userId - The user ID on the team. 
    # + return - The user was removed to the team. 
    remote isolated function deleteTeamUser(string accept, string contentType, string id, string userId) returns http:Response|error {
        string resourcePath = string `/teams/${id}/users/${userId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List users
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + query - Filters the result, showing only the tags whose labels match the query. 
    # + teamIds - An array of team IDs. Only results related to these teams will be returned. Account must have the `teams` ability to use this parameter. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + include - Array of additional Models to include in response. 
    # + return - A paginated array of users. 
    remote isolated function listUsers(string accept, string contentType, string? query = (), string[]? teamIds = (), int? 'limit = (), int? offset = (), boolean total = false, string[]? include = ()) returns InlineResponse20059|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"query": query, "team_ids[]": teamIds, "limit": 'limit, "offset": offset, "total": total, "include[]": include};
        map<Encoding> queryParamEncoding = {"team_ids[]": {style: FORM, explode: true}, "include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20059 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'from - The email address of a valid user associated with the account making the request. 
    # + payload - The user to be created. 
    # + return - The user that was created. 
    remote isolated function createUser(string accept, string contentType, string 'from, UsersBody payload) returns UsersBody|error {
        string resourcePath = string `/users`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "From": 'from, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UsersBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional Models to include in response. 
    # + return - The user requested. 
    remote isolated function getUser(string accept, string contentType, string id, string[]? include = ()) returns UsersBody|error {
        string resourcePath = string `/users/${id}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsersBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The user to be updated. 
    # + return - The user that was updated. 
    remote isolated function updateUser(string accept, string contentType, string id, UsersIdBody payload) returns UsersIdBody|error {
        string resourcePath = string `/users/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UsersIdBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The user was deleted successfully. 
    remote isolated function deleteUser(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/users/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List audit records for a user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'limit - The minimum of the `limit` parameter used in the request or the maximum request size of the API. 
    # + cursor - Optional parameter used to request the "next" set of results from an API.  The value provided here is most commonly obtained from the `next_cursor` field of the previous request.  When no value is provided, the request starts at the beginning of the result set. 
    # + since - The start of the date range over which you want to search. If not specified, defaults to `now() - 24 hours` (past 24 hours) 
    # + until - The end of the date range over which you want to search. If not specified, defaults to `now()` 
    # + return - Records matching the query criteria. 
    remote isolated function listUsersAuditRecords(string accept, string contentType, string id, int? 'limit = (), string? cursor = (), string? since = (), string? until = ()) returns AuditRecordResponseSchema|error {
        string resourcePath = string `/users/${id}/audit/records`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor, "since": since, "until": until};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditRecordResponseSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List a user's contact methods
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - A list of contact methods. 
    remote isolated function getUserContactMethods(string accept, string contentType, string id) returns InlineResponse20060|error {
        string resourcePath = string `/users/${id}/contact_methods`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20060 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a user contact method
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The contact method to be created. 
    # + return - The contact method that was created. 
    remote isolated function createUserContactMethod(string accept, string contentType, string id, IdContactMethodsBody payload) returns InlineResponse2018|error {
        string resourcePath = string `/users/${id}/contact_methods`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2018 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a user's contact method
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + contactMethodId - The contact method ID on the user. 
    # + return - The user's contact method requested. 
    remote isolated function getUserContactMethod(string accept, string contentType, string id, string contactMethodId) returns InlineResponse2018|error {
        string resourcePath = string `/users/${id}/contact_methods/${contactMethodId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2018 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a user's contact method
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + contactMethodId - The contact method ID on the user. 
    # + payload - The user's contact method to be updated. 
    # + return - The user's contact method that was updated. 
    remote isolated function updateUserContactMethod(string accept, string contentType, string id, string contactMethodId, ContactMethodsContactMethodIdBody payload) returns InlineResponse2018|error {
        string resourcePath = string `/users/${id}/contact_methods/${contactMethodId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2018 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a user's contact method
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + contactMethodId - The contact method ID on the user. 
    # + return - The contact method was deleted successfully. 
    remote isolated function deleteUserContactMethod(string accept, string contentType, string id, string contactMethodId) returns http:Response|error {
        string resourcePath = string `/users/${id}/contact_methods/${contactMethodId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List a user's notification rules
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + include - Array of additional details to include. 
    # + return - A list of notification rules. 
    remote isolated function getUserNotificationRules(string accept, string contentType, string id, string[]? include = ()) returns InlineResponse20061|error {
        string resourcePath = string `/users/${id}/notification_rules`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20061 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a user notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + payload - The notification rule to be created. 
    # + return - The notification rule that was created. 
    remote isolated function createUserNotificationRule(string accept, string contentType, string id, IdNotificationRulesBody payload) returns IdNotificationRulesBody|error {
        string resourcePath = string `/users/${id}/notification_rules`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdNotificationRulesBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a user's notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + notificationRuleId - The notification rule ID on the user. 
    # + include - Array of additional details to include. 
    # + return - The user's notification rule requested. 
    remote isolated function getUserNotificationRule(string accept, string contentType, string id, string notificationRuleId, string[]? include = ()) returns IdNotificationRulesBody|error {
        string resourcePath = string `/users/${id}/notification_rules/${notificationRuleId}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IdNotificationRulesBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a user's notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + notificationRuleId - The notification rule ID on the user. 
    # + payload - The user's notification rule to be updated. 
    # + return - The user's notification rule that was updated. 
    remote isolated function updateUserNotificationRule(string accept, string contentType, string id, string notificationRuleId, NotificationRulesNotificationRuleIdBody payload) returns InlineResponse20062|error {
        string resourcePath = string `/users/${id}/notification_rules/${notificationRuleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20062 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a user's notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + notificationRuleId - The notification rule ID on the user. 
    # + return - The notification rule was deleted successfully. 
    remote isolated function deleteUserNotificationRule(string accept, string contentType, string id, string notificationRuleId) returns http:Response|error {
        string resourcePath = string `/users/${id}/notification_rules/${notificationRuleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Notification Subscriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - OK 
    remote isolated function getUserNotificationSubscriptions(string accept, string id) returns InlineResponse20058|error {
        string resourcePath = string `/users/${id}/notification_subscriptions`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20058 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Notification Subcriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to subscribe to. 
    # + return - OK 
    remote isolated function createUserNotificationSubscriptions(string accept, string id, IdNotificationSubscriptionsBody1 payload) returns InlineResponse2009|error {
        string resourcePath = string `/users/${id}/notification_subscriptions`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2009 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Remove Notification Subscriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + payload - The entities to unsubscribe from. 
    # + return - OK 
    remote isolated function unsubscribeUserNotificationSubscriptions(string accept, string id, NotificationSubscriptionsUnsubscribeBody1 payload) returns InlineResponse20011|error {
        string resourcePath = string `/users/${id}/notification_subscriptions/unsubscribe`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20011 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List a user's active sessions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - A list of the user's active sessions. 
    remote isolated function getUserSessions(string accept, string contentType, string id) returns InlineResponse20063|error {
        string resourcePath = string `/users/${id}/sessions`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20063 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete all user sessions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The user sessions were all deleted successfully. 
    remote isolated function deleteUserSessions(string accept, string contentType, string id) returns http:Response|error {
        string resourcePath = string `/users/${id}/sessions`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Get a user's session
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'type - The session type for the user session ID. 
    # + sessionId - The session ID for the user. 
    # + return - The user's session requested. 
    remote isolated function getUserSession(string accept, string contentType, string id, string 'type, string sessionId) returns InlineResponse20064|error {
        string resourcePath = string `/users/${id}/sessions/${'type}/${sessionId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20064 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a user's session
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + 'type - The session type for the user session ID. 
    # + sessionId - The session ID for the user. 
    # + return - The user session was deleted successfully. 
    remote isolated function deleteUserSession(string accept, string contentType, string id, string 'type, string sessionId) returns http:Response|error {
        string resourcePath = string `/users/${id}/sessions/${'type}/${sessionId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List a user's status update notification rules
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header and the above value. Do not use this endpoint in production, as it may change! 
    # + include - Array of additional details to include. 
    # + return - A list of status update notification rules. 
    remote isolated function getUserStatusUpdateNotificationRules(string accept, string contentType, string id, string xEarlyAccess, string[]? include = ()) returns InlineResponse20065|error {
        string resourcePath = string `/users/${id}/status_update_notification_rules`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20065 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a user status update notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header and the above value. Do not use this endpoint in production, as it may change! 
    # + id - The ID of the resource. 
    # + payload - The status update notification rule to be created. 
    # + return - The status update notification rule that was created. 
    remote isolated function createUserStatusUpdateNotificationRule(string accept, string contentType, string xEarlyAccess, string id, IdStatusUpdateNotificationRulesBody payload) returns InlineResponse2019|error {
        string resourcePath = string `/users/${id}/status_update_notification_rules`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2019 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a user's status update notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header and the above value. Do not use this endpoint in production, as it may change! 
    # + id - The ID of the resource. 
    # + statusUpdateNotificationRuleId - The status update notification rule ID on the user. 
    # + include - Array of additional details to include. 
    # + return - The user's status update notification rule requested. 
    remote isolated function getUserStatusUpdateNotificationRule(string accept, string contentType, string xEarlyAccess, string id, string statusUpdateNotificationRuleId, string[]? include = ()) returns InlineResponse20066|error {
        string resourcePath = string `/users/${id}/status_update_notification_rules/${statusUpdateNotificationRuleId}`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20066 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a user's status update notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header and the above value. Do not use this endpoint in production, as it may change! 
    # + id - The ID of the resource. 
    # + statusUpdateNotificationRuleId - The status update notification rule ID on the user. 
    # + payload - The user's status update notification rule to be updated. 
    # + return - The user's status update notification rule that was updated. 
    remote isolated function updateUserStatusUpdateNotificationRule(string accept, string contentType, string xEarlyAccess, string id, string statusUpdateNotificationRuleId, StatusUpdateNotificationRulesStatusUpdateNotificationRuleIdBody payload) returns InlineResponse20067|error {
        string resourcePath = string `/users/${id}/status_update_notification_rules/${statusUpdateNotificationRuleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20067 response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a user's status update notification rule
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + xEarlyAccess - This header indicates that this API endpoint is __UNDER CONSTRUCTION__ and may change at any time. You __MUST__ pass in this header and the above value. Do not use this endpoint in production, as it may change! 
    # + id - The ID of the resource. 
    # + statusUpdateNotificationRuleId - The status update notification rule ID on the user. 
    # + return - The status update notification rule was deleted successfully. 
    remote isolated function deleteUserStatusUpdateNotificationRule(string accept, string contentType, string xEarlyAccess, string id, string statusUpdateNotificationRuleId) returns http:Response|error {
        string resourcePath = string `/users/${id}/status_update_notification_rules/${statusUpdateNotificationRuleId}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-EARLY-ACCESS": xEarlyAccess, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Get the current user
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + include - Array of additional Models to include in response. 
    # + return - The requesting user. 
    remote isolated function getCurrentUser(string accept, string contentType, string[]? include = ()) returns UsersIdBody|error {
        string resourcePath = string `/users/me`;
        map<anydata> queryParam = {"include[]": include};
        map<Encoding> queryParamEncoding = {"include[]": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsersIdBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List vendors
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + return - A paginated array of vendors. 
    remote isolated function listVendors(string accept, string contentType, int? 'limit = (), int? offset = (), boolean total = false) returns InlineResponse20068|error {
        string resourcePath = string `/vendors`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20068 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a vendor
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The vendor requested 
    remote isolated function getVendor(string accept, string contentType, string id) returns InlineResponse20069|error {
        string resourcePath = string `/vendors/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20069 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List webhook subscriptions
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + 'limit - The number of results per page. 
    # + offset - Offset to start pagination search results. 
    # + total - By default the `total` field in pagination responses is set to `null` to provide the fastest possible response times. Set `total` to `true` for this field to be populated. See our [Pagination Docs](https://developer.pagerduty.com/docs/rest-api-v2/pagination/) for more information. 
    # + filterType - The type of resource to filter upon. 
    # + filterId - The id of the resource to filter upon. 
    # + return - A set of webhook subscriptions matching the request. 
    remote isolated function listWebhookSubscriptions(string accept, int? 'limit = (), int? offset = (), boolean total = false, string? filterType = (), string? filterId = ()) returns InlineResponse20070|error {
        string resourcePath = string `/webhook_subscriptions`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "total": total, "filter_type": filterType, "filter_id": filterId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20070 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + return - The webhook subscription that was created. 
    remote isolated function createWebhookSubscription(string accept, string contentType, WebhookSubscriptionsBody payload) returns WebhookSubscriptionsBody|error {
        string resourcePath = string `/webhook_subscriptions`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhookSubscriptionsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - The webhook subscription that was requested. 
    remote isolated function getWebhookSubscription(string accept, string id) returns WebhookSubscriptionsBody|error {
        string resourcePath = string `/webhook_subscriptions/${id}`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WebhookSubscriptionsBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + contentType - Header Content type. 
    # + id - The ID of the resource. 
    # + return - The updated webhook subscription. 
    remote isolated function updateWebhookSubscription(string accept, string contentType, string id, WebhookSubscriptionUpdate payload) returns WebhookSubscriptionsBody|error {
        string resourcePath = string `/webhook_subscriptions/${id}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhookSubscriptionsBody response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - The webhook subscription was deleted successfully. 
    remote isolated function deleteWebhookSubscription(string accept, string id) returns http:Response|error {
        string resourcePath = string `/webhook_subscriptions/${id}`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Enable a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - The webhook subscription that was successfully enabled. 
    remote isolated function enableWebhookSubscription(string accept, string id) returns WebhookSubscriptionsBody|error {
        string resourcePath = string `/webhook_subscriptions/${id}/enable`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        WebhookSubscriptionsBody response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Test a webhook subscription
    #
    # + accept - The `Accept` header is used as a versioning header. 
    # + id - The ID of the resource. 
    # + return - Accepted 
    remote isolated function testWebhookSubscription(string accept, string id) returns http:Response|error {
        string resourcePath = string `/webhook_subscriptions/${id}/ping`;
        map<any> headerValues = {"Accept": accept, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
