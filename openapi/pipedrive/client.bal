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
    # Represents API Key `api_token`
    string apiToken;
|};

# This is a generated connector for [Pipedrive API v1](https://developers.pipedrive.com/docs/api/v1) OpenAPI specification.
# Pipedrive is a sales CRM and pipeline management solution that enables businesses to plan their sales activities and monitor deals. 
# Built using activity-based selling methodology, Pipedrive streamlines every action involved in converting a potential deal into a successful sale.
@display {label: "Pipedrive", iconPath: "resources/pipedrive.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Pipedrive account](https://www.pipedrive.com) and obtain tokens by following [this guide](https://pipedrive.readme.io/docs/core-api-concepts-authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.pipedrive.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get all Activities assigned to a particular User
    #
    # + userId - The ID of the User whose Activities will be fetched. If omitted, the User associated with the API token will be used. If 0, Activities for all company Users will be fetched based on the permission sets. 
    # + filterId - The ID of the Filter to use (will narrow down results if used together with `user_id` parameter) 
    # + 'type - Type of the Activity, can be one type or multiple types separated by a comma. This is in correlation with the `key_string` parameter of ActivityTypes. 
    # + 'limit - For pagination, the limit of entries to be returned. If not provided, 100 items will be returned. 
    # + 'start - For pagination, the position that represents the first result for the page 
    # + startDate - Use the Activity due date where you wish to begin fetching Activities from. Insert due date in YYYY-MM-DD format. 
    # + endDate - Use the Activity due date where you wish to stop fetching Activities from. Insert due date in YYYY-MM-DD format. 
    # + done - Whether the Activity is done or not. 0 = Not done, 1 = Done. If omitted returns both Done and Not done activities. 
    # + return - A list of Activities 
    remote isolated function getActivities(int? userId = (), int? filterId = (), string? 'type = (), int? 'limit = (), int? 'start = (), string? startDate = (), string? endDate = (), decimal? done = ()) returns GetActivitiesResponse200|error {
        string  path = string `/activities`;
        map<anydata> queryParam = {"user_id": userId, "filter_id": filterId, "type": 'type, "limit": 'limit, "start": 'start, "start_date": startDate, "end_date": endDate, "done": done, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetActivitiesResponse200 response = check self.clientEp-> get(path, targetType = GetActivitiesResponse200);
        return response;
    }
    # Add an Activity
    #
    # + payload - AddActivity request 
    # + return - The Activity was successfully added 
    remote isolated function addActivity(AddActivityRequest payload) returns AddActivityResponse200|error {
        string  path = string `/activities`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddActivityResponse200 response = check self.clientEp->post(path, request, targetType=AddActivityResponse200);
        return response;
    }
    # Delete multiple Activities in bulk
    #
    # + ids - Comma-separated IDs of Activities that will be deleted 
    # + return - The Activities were successfully deleted 
    remote isolated function deleteActivities(string ids) returns DeleteActivitiesResponse200|error {
        string  path = string `/activities`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteActivitiesResponse200 response = check self.clientEp-> delete(path, targetType = DeleteActivitiesResponse200);
        return response;
    }
    # Get details of an Activity
    #
    # + id - The ID of the Activity 
    # + return - The request was successful 
    remote isolated function getActivity(int id) returns GetActivityResponse200|error {
        string  path = string `/activities/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetActivityResponse200 response = check self.clientEp-> get(path, targetType = GetActivityResponse200);
        return response;
    }
    # Edit an Activity
    #
    # + id - The ID of the Activity 
    # + payload - UpdateActivity request 
    # + return - The request was successful 
    remote isolated function updateActivity(int id, UpdateActivityRequest payload) returns UpdateActivityResponse200|error {
        string  path = string `/activities/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateActivityResponse200 response = check self.clientEp->put(path, request, targetType=UpdateActivityResponse200);
        return response;
    }
    # Delete an Activity
    #
    # + id - The ID of the Activity 
    # + return - The Activity was successfully deleted 
    remote isolated function deleteActivity(int id) returns DeleteActivityResponse200|error {
        string  path = string `/activities/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteActivityResponse200 response = check self.clientEp-> delete(path, targetType = DeleteActivityResponse200);
        return response;
    }
    # Get all activity fields
    #
    # + return - success 
    remote isolated function getActivityFields() returns FieldsResponse200|error {
        string  path = string `/activityFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldsResponse200 response = check self.clientEp-> get(path, targetType = FieldsResponse200);
        return response;
    }
    # Get all ActivityTypes
    #
    # + return - A list of ActivityTypes 
    remote isolated function getActivityTypes() returns GetActivityTypesResponse200|error {
        string  path = string `/activityTypes`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetActivityTypesResponse200 response = check self.clientEp-> get(path, targetType = GetActivityTypesResponse200);
        return response;
    }
    # Add new ActivityType
    #
    # + payload - AddActivityType request 
    # + return - The ActivityType was successfully created 
    remote isolated function addActivityType(AddActivityTypeRequest payload) returns CreateUpdateDeleteActivityTypeResponse200|error {
        string  path = string `/activityTypes`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        CreateUpdateDeleteActivityTypeResponse200 response = check self.clientEp->post(path, request, targetType=CreateUpdateDeleteActivityTypeResponse200);
        return response;
    }
    # Delete multiple ActivityTypes in bulk
    #
    # + ids - Comma-separated ActivityType IDs 
    # + return - The ActivityTypes were successfully deleted 
    remote isolated function deleteActivityTypes(string ids) returns DeleteActivityTypesResponse200|error {
        string  path = string `/activityTypes`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteActivityTypesResponse200 response = check self.clientEp-> delete(path, targetType = DeleteActivityTypesResponse200);
        return response;
    }
    # Edit an ActivityType
    #
    # + id - The ID of the ActivityType 
    # + payload - UpdateActivityType request 
    # + return - The ActivityType was successfully updated 
    remote isolated function updateActivityType(int id, UpdateActivityTypeRequest payload) returns CreateUpdateDeleteActivityTypeResponse200|error {
        string  path = string `/activityTypes/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        CreateUpdateDeleteActivityTypeResponse200 response = check self.clientEp->put(path, request, targetType=CreateUpdateDeleteActivityTypeResponse200);
        return response;
    }
    # Delete an ActivityType
    #
    # + id - The ID of the ActivityType 
    # + return - The ActivityType was successfully deleted 
    remote isolated function deleteActivityType(int id) returns CreateUpdateDeleteActivityTypeResponse200|error {
        string  path = string `/activityTypes/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        CreateUpdateDeleteActivityTypeResponse200 response = check self.clientEp-> delete(path, targetType = CreateUpdateDeleteActivityTypeResponse200);
        return response;
    }
    # Get all call logs assigned to a particular user
    #
    # + 'limit - For pagination, the limit of entries to be returned 
    # + 'start - For pagination, the position that represents the first result for the page 
    # + return - A list of call logs. 
    remote isolated function getUserCallLogs(decimal? 'limit = (), decimal? 'start = ()) returns GetUserCallLogsResponse200|error {
        string  path = string `/callLogs`;
        map<anydata> queryParam = {"limit": 'limit, "start": 'start, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetUserCallLogsResponse200 response = check self.clientEp-> get(path, targetType = GetUserCallLogsResponse200);
        return response;
    }
    # Add a call log
    #
    # + payload - AddCallLog request 
    # + return - The call log was successfully created. 
    remote isolated function addCallLog(AddCallLogRequest payload) returns AddCallLogResponse200|error {
        string  path = string `/callLogs`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddCallLogResponse200 response = check self.clientEp->post(path, request, targetType=AddCallLogResponse200);
        return response;
    }
    # Get details of a call log
    #
    # + id - The ID received when you create the call log 
    # + return - The requested call log object. 
    remote isolated function getCallLog(string id) returns InlineResponse200|error {
        string  path = string `/callLogs/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Delete a call log
    #
    # + id - The ID received when you create the call log 
    # + return - The call log was successfully deleted. 
    remote isolated function deleteCallLog(string id) returns DeleteCallLogResponse200|error {
        string  path = string `/callLogs/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteCallLogResponse200 response = check self.clientEp-> delete(path, targetType = DeleteCallLogResponse200);
        return response;
    }
    # Get all supported currencies
    #
    # + term - Optional search term that is searched for from currency's name and/or code. 
    # + return - The list of supported currencies 
    remote isolated function getCurrencies(string? term = ()) returns GetCurrenciesResponse200|error {
        string  path = string `/currencies`;
        map<anydata> queryParam = {"term": term, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetCurrenciesResponse200 response = check self.clientEp-> get(path, targetType = GetCurrenciesResponse200);
        return response;
    }
    # Get all deals
    #
    # + userId - If supplied, only deals matching the given user will be returned. However, `filter_id` and `owned_by_you` takes precedence over `user_id` when supplied. 
    # + filterId - ID of the filter to use 
    # + stageId - If supplied, only deals within the given stage will be returned. 
    # + status - Only fetch deals with specific status. If omitted, all not deleted deals are fetched. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). 
    # + ownedByYou - When supplied, only deals owned by you are returned. However, `filter_id` takes precedence over `owned_by_you` when both are supplied. 
    # + return - Get all Deals 
    remote isolated function getDeals(int? userId = (), int? filterId = (), int? stageId = (), string status = "all_not_deleted", int 'start = 0, int? 'limit = (), string? sort = (), decimal? ownedByYou = ()) returns GetDealsResponse200|error {
        string  path = string `/deals`;
        map<anydata> queryParam = {"user_id": userId, "filter_id": filterId, "stage_id": stageId, "status": status, "start": 'start, "limit": 'limit, "sort": sort, "owned_by_you": ownedByYou, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealsResponse200 response = check self.clientEp-> get(path, targetType = GetDealsResponse200);
        return response;
    }
    # Add a deal
    #
    # + payload - AddDeal request 
    # + return - Add a Deal 
    remote isolated function addDeal(AddDealRequest payload) returns DealResponse200|error {
        string  path = string `/deals`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        DealResponse200 response = check self.clientEp->post(path, request, targetType=DealResponse200);
        return response;
    }
    # Delete multiple deals in bulk
    #
    # + ids - Comma-separated IDs that will be deleted 
    # + return - Delete multiple deals in bulk 
    remote isolated function deleteDeals(string ids) returns DeleteDealsResponse200|error {
        string  path = string `/deals`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteDealsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteDealsResponse200);
        return response;
    }
    # Search deals
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + fields - A comma-separated string array. The fields to perform the search from. Defaults to all of them. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. It is <b>not</b> case sensitive. 
    # + personId - Will filter Deals by the provided Person ID. The upper limit of found Deals associated with the Person is 2000. 
    # + organizationId - Will filter Deals by the provided Organization ID. The upper limit of found Deals associated with the Organization is 2000. 
    # + status - Will filter Deals by the provided specific status. open = Open, won = Won, lost = Lost. The upper limit of found Deals associated with the status is 2000. 
    # + includeFields - Supports including optional fields in the results which are not provided by default. 
    # + 'start - Pagination start. Note that the pagination is based on main results and does not include related items when using `search_for_related_items` parameter. 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchDeals(string term, string? fields = (), boolean? exactMatch = (), int? personId = (), int? organizationId = (), string? status = (), string? includeFields = (), int 'start = 0, int? 'limit = ()) returns SearchDealsResponse200|error {
        string  path = string `/deals/search`;
        map<anydata> queryParam = {"term": term, "fields": fields, "exact_match": exactMatch, "person_id": personId, "organization_id": organizationId, "status": status, "include_fields": includeFields, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchDealsResponse200 response = check self.clientEp-> get(path, targetType = SearchDealsResponse200);
        return response;
    }
    # Find deals by name
    #
    # + term - Search term to look for 
    # + personId - ID of the person the Deal is associated with. 
    # + orgId - ID of the organization the Deal is associated with. 
    # + return - Get Deals by name 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getDealsByName(string term, int? personId = (), int? orgId = ()) returns GetDealsByNameResponse200|error {
        string  path = string `/deals/find`;
        map<anydata> queryParam = {"term": term, "person_id": personId, "org_id": orgId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealsByNameResponse200 response = check self.clientEp-> get(path, targetType = GetDealsByNameResponse200);
        return response;
    }
    # Get deals summary
    #
    # + status - Only fetch deals with specific status. open = Open, won = Won, lost = Lost 
    # + filterId - <code>user_id</code> will not be considered. Only deals matching the given filter will be returned. 
    # + userId - Only deals matching the given user will be returned. `user_id` will not be considered if you use `filter_id`. 
    # + stageId - Only deals within the given stage will be returned. 
    # + return - Get the summary of the Deals 
    remote isolated function getDealsSummary(string? status = (), int? filterId = (), int? userId = (), int? stageId = ()) returns GetDealsSummaryResponse200|error {
        string  path = string `/deals/summary`;
        map<anydata> queryParam = {"status": status, "filter_id": filterId, "user_id": userId, "stage_id": stageId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealsSummaryResponse200 response = check self.clientEp-> get(path, targetType = GetDealsSummaryResponse200);
        return response;
    }
    # Get deals timeline
    #
    # + startDate - Date where the first interval starts. Format: YYYY-MM-DD 
    # + interval - The type of interval<table><tr><th>Value</th><th>Description</th></tr><tr><td>`day`</td><td>Day</td></tr><tr><td>`week`</td><td>A full week (7 days) starting from `start_date`</td></tr><tr><td>`month`</td><td>A full month (depending on the number of days in given month) starting from `start_date`</td></tr><tr><td>`quarter`</td><td>A full quarter (3 months) starting from `start_date`</td></tr></table> 
    # + amount - The number of given intervals, starting from `start_date`, to fetch. E.g. 3 (months). 
    # + fieldKey - The date field key which deals will be retrieved from 
    # + userId - If supplied, only deals matching the given user will be returned. 
    # + pipelineId - If supplied, only deals matching the given pipeline will be returned 
    # + filterId - If supplied, only deals matching the given filter will be returned 
    # + excludeDeals - Whether to exclude deals list (1) or not (0). Note that when deals are excluded, the timeline summary (counts and values) is still returned. 
    # + totalsConvertCurrency - 3-letter currency code of any of the supported currencies. When supplied, `totals_converted` is returned per each interval which contains the currency-converted total amounts in the given currency. You may also set this parameter to `default_currency` in which case users default currency is used. 
    # + return - Get open and won Deals, grouped by the defined interval of time 
    remote isolated function getDealsTimeline(string startDate, string interval, int amount, string fieldKey, int? userId = (), int? pipelineId = (), int? filterId = (), decimal? excludeDeals = (), string? totalsConvertCurrency = ()) returns GetDealsTimelineResponse200|error {
        string  path = string `/deals/timeline`;
        map<anydata> queryParam = {"start_date": startDate, "interval": interval, "amount": amount, "field_key": fieldKey, "user_id": userId, "pipeline_id": pipelineId, "filter_id": filterId, "exclude_deals": excludeDeals, "totals_convert_currency": totalsConvertCurrency, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealsTimelineResponse200 response = check self.clientEp-> get(path, targetType = GetDealsTimelineResponse200);
        return response;
    }
    # Get details of a deal
    #
    # + id - ID of the deal 
    # + return - Get a Deal by its ID 
    remote isolated function getDeal(int id) returns GetDealResponse200|error {
        string  path = string `/deals/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealResponse200 response = check self.clientEp-> get(path, targetType = GetDealResponse200);
        return response;
    }
    # Update a deal
    #
    # + id - ID of the deal 
    # + payload - BasicDeal request 
    # + return - Add a Deal 
    remote isolated function updateDeal(int id, BasicDeal payload) returns DealResponse200|error {
        string  path = string `/deals/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        DealResponse200 response = check self.clientEp->put(path, request, targetType=DealResponse200);
        return response;
    }
    # Delete a deal
    #
    # + id - ID of the deal 
    # + return - Delete a Deal 
    remote isolated function deleteDeal(int id) returns DeleteDealResponse200|error {
        string  path = string `/deals/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteDealResponse200 response = check self.clientEp-> delete(path, targetType = DeleteDealResponse200);
        return response;
    }
    # List activities associated with a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + done - Whether the activity is done or not. 0 = Not done, 1 = Done. If omitted returns both Done and Not done activities. 
    # + exclude - A comma-separated string of activity IDs to exclude from result 
    # + return - success 
    remote isolated function getDealActivities(int id, int 'start = 0, int? 'limit = (), decimal? done = (), string? exclude = ()) returns GetDealActivitiesResponse200|error {
        string  path = string `/deals/${id}/activities`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "done": done, "exclude": exclude, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealActivitiesResponse200 response = check self.clientEp-> get(path, targetType = GetDealActivitiesResponse200);
        return response;
    }
    # Duplicate deal
    #
    # + id - ID of the deal 
    # + return - Duplicate a Deal 
    remote isolated function duplicateDeal(int id) returns DuplicateDealResponse200|error {
        string  path = string `/deals/${id}/duplicate`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DuplicateDealResponse200 response = check self.clientEp-> post(path, request, targetType = DuplicateDealResponse200);
        return response;
    }
    # List files attached to a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeDeletedFiles - When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment. 
    # + return - success 
    remote isolated function getDealFiles(int id, int 'start = 0, int? 'limit = (), decimal? includeDeletedFiles = (), string? sort = ()) returns GetAssociatedFilesResponse200|error {
        string  path = string `/deals/${id}/files`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_deleted_files": includeDeletedFiles, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFilesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFilesResponse200);
        return response;
    }
    # List updates about a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + allChanges - Whether to show custom field updates or not. 1 = Include custom field changes. If omitted returns changes without custom field updates. 
    # + items - A comma-separated string for filtering out item specific updates. (Possible values - activity, plannedActivity, note, file, change, deal, follower, participant, mailMessage, mailMessageWithAttachment, invoice, activityFile, document) 
    # + return - Get the Deal Updates 
    remote isolated function getDealUpdates(int id, int 'start = 0, int? 'limit = (), string? allChanges = (), string? items = ()) returns GetDealUpdatesResponse200|error {
        string  path = string `/deals/${id}/flow`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "all_changes": allChanges, "items": items, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealUpdatesResponse200 response = check self.clientEp-> get(path, targetType = GetDealUpdatesResponse200);
        return response;
    }
    # List followers of a deal
    #
    # + id - ID of the deal 
    # + return - success 
    remote isolated function getDealFollowers(int id) returns GetAssociatedFollowersResponse200|error {
        string  path = string `/deals/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFollowersResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFollowersResponse200);
        return response;
    }
    # Add a follower to a deal
    #
    # + id - ID of the deal 
    # + payload - addDealFollower request 
    # + return - Add a Follower to a Deal 
    remote isolated function addDealFollower(int id, AddDealFollowerRequest payload) returns AddDealFollowerResponse200|error {
        string  path = string `/deals/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddDealFollowerResponse200 response = check self.clientEp->post(path, request, targetType=AddDealFollowerResponse200);
        return response;
    }
    # Delete a follower from a deal
    #
    # + id - ID of the deal 
    # + followerId - ID of the follower 
    # + return - Delete a Follower from a Deal 
    remote isolated function deleteDealFollower(int id, int followerId) returns DeleteDealFollowerResponse200|error {
        string  path = string `/deals/${id}/followers/${followerId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteDealFollowerResponse200 response = check self.clientEp-> delete(path, targetType = DeleteDealFollowerResponse200);
        return response;
    }
    # List mail messages associated with a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getDealMailMessages(int id, int 'start = 0, int? 'limit = ()) returns GetAssociatedMailMessagesResponse200|error {
        string  path = string `/deals/${id}/mailMessages`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedMailMessagesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedMailMessagesResponse200);
        return response;
    }
    # Merge two deals
    #
    # + id - ID of the deal 
    # + payload - MergeDeals request 
    # + return - Merges a Deal with another Deal. 
    remote isolated function mergeDeals(int id, MergeDealsRequest payload) returns MergeDealsResponse200|error {
        string  path = string `/deals/${id}/merge`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        MergeDealsResponse200 response = check self.clientEp->put(path, request, targetType=MergeDealsResponse200);
        return response;
    }
    # List participants of a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Get all Deal participants by the DealID 
    remote isolated function getDealParticipants(int id, int 'start = 0, int? 'limit = ()) returns GetDealParticipantsResponse200|error {
        string  path = string `/deals/${id}/participants`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetDealParticipantsResponse200 response = check self.clientEp-> get(path, targetType = GetDealParticipantsResponse200);
        return response;
    }
    # Add a participant to a deal
    #
    # + id - ID of the deal 
    # + payload - AddDealParticipant request 
    # + return - Add new participant to the Deal 
    remote isolated function addDealParticipant(int id, AddDealParticipantRequest payload) returns AddDealParticipantResponse200|error {
        string  path = string `/deals/${id}/participants`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddDealParticipantResponse200 response = check self.clientEp->post(path, request, targetType=AddDealParticipantResponse200);
        return response;
    }
    # Delete a participant from a deal
    #
    # + id - ID of the deal 
    # + dealParticipantId - ID of the deal participant 
    # + return - Delete a Participant from a Deal 
    remote isolated function deleteDealParticipant(int id, int dealParticipantId) returns DeleteDealParticipantResponse200|error {
        string  path = string `/deals/${id}/participants/${dealParticipantId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteDealParticipantResponse200 response = check self.clientEp-> delete(path, targetType = DeleteDealParticipantResponse200);
        return response;
    }
    # List permitted users
    #
    # + id - ID of the deal 
    # + return - success 
    remote isolated function getDealUsers(int id) returns ListPermittedUsersResponse200|error {
        string  path = string `/deals/${id}/permittedUsers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        ListPermittedUsersResponse200 response = check self.clientEp-> get(path, targetType = ListPermittedUsersResponse200);
        return response;
    }
    # List all persons associated with a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getDealPersons(int id, int 'start = 0, int? 'limit = ()) returns ListPersonsResponse200|error {
        string  path = string `/deals/${id}/persons`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        ListPersonsResponse200 response = check self.clientEp-> get(path, targetType = ListPersonsResponse200);
        return response;
    }
    # List products attached to a deal
    #
    # + id - ID of the deal 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeProductData - Whether to fetch product data along with each attached product (1) or not (0, default). 
    # + return - success 
    remote isolated function getDealProducts(int id, int 'start = 0, int? 'limit = (), decimal? includeProductData = ()) returns ListProductsResponse200|error {
        string  path = string `/deals/${id}/products`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_product_data": includeProductData, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        ListProductsResponse200 response = check self.clientEp-> get(path, targetType = ListProductsResponse200);
        return response;
    }
    # Add a product to the deal, eventually creating a new item called a deal-product
    #
    # + id - ID of the deal 
    # + payload - AddDealProduct request 
    # + return - Add a Product to the Deal 
    remote isolated function addDealProduct(int id, AddDealProductRequest payload) returns GetAddProductAttachementResponse200|error {
        string  path = string `/deals/${id}/products`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetAddProductAttachementResponse200 response = check self.clientEp->post(path, request, targetType=GetAddProductAttachementResponse200);
        return response;
    }
    # Update product attachment details of the deal-product (a product already attached to a deal)
    #
    # + id - ID of the deal 
    # + productAttachmentId - ID of the deal-product (the ID of the product attached to the deal) 
    # + payload - BasicDealProduct request 
    # + return - Update Product attachment details 
    remote isolated function updateDealProduct(int id, int productAttachmentId, BasicDealProductRequest payload) returns GetProductAttachementResponse200|error {
        string  path = string `/deals/${id}/products/${productAttachmentId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetProductAttachementResponse200 response = check self.clientEp->put(path, request, targetType=GetProductAttachementResponse200);
        return response;
    }
    # Delete an attached product from a deal
    #
    # + id - ID of the deal 
    # + productAttachmentId - Product attachment ID. This is returned as `product_attachment_id` after attaching a product to a deal or as id when listing the products attached to a deal. 
    # + return - Delete an attached Product from a Deal 
    remote isolated function deleteDealProduct(int id, int productAttachmentId) returns DeleteDealProductResponse200|error {
        string  path = string `/deals/${id}/products/${productAttachmentId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteDealProductResponse200 response = check self.clientEp-> delete(path, targetType = DeleteDealProductResponse200);
        return response;
    }
    # Get all deal fields
    #
    # + return - success 
    remote isolated function getDealFields() returns FieldsResponse200|error {
        string  path = string `/dealFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldsResponse200 response = check self.clientEp-> get(path, targetType = FieldsResponse200);
        return response;
    }
    # Add a new deal field
    #
    # + payload - CreateField request 
    # + return - success 
    remote isolated function addDealField(CreateFieldRequest payload) returns FieldResponse200|error {
        string  path = string `/dealFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->post(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete multiple deal fields in bulk
    #
    # + ids - Comma-separated field IDs to delete 
    # + return - success 
    remote isolated function deleteDealFields(string ids) returns DeleteFieldsResponse200|error {
        string  path = string `/dealFields`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldsResponse200);
        return response;
    }
    # Get one deal field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function getDealField(int id) returns FieldResponse200|error {
        string  path = string `/dealFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldResponse200 response = check self.clientEp-> get(path, targetType = FieldResponse200);
        return response;
    }
    # Update a deal field
    #
    # + id - ID of the field 
    # + payload - UpdateField request 
    # + return - success 
    remote isolated function updateDealField(int id, UpdateFieldRequest payload) returns FieldResponse200|error {
        string  path = string `/dealFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->put(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete a deal field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function deleteDealField(int id) returns DeleteFieldResponse200|error {
        string  path = string `/dealFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldResponse200);
        return response;
    }
    # Get all files
    #
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeDeletedFiles - When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment. 
    # + return - Get data about all uploaded to Pipedrive files. 
    remote isolated function getFiles(int 'start = 0, int? 'limit = (), decimal? includeDeletedFiles = (), string? sort = ()) returns GetFilesResponse200|error {
        string  path = string `/files`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_deleted_files": includeDeletedFiles, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetFilesResponse200 response = check self.clientEp-> get(path, targetType = GetFilesResponse200);
        return response;
    }
    # Create a remote file and link it to an item
    #
    # + payload - AddFileAndLinkIt request 
    # + return - Creates a new empty file in the remote location (googledrive) that will be linked to the item you supply - deal, person or organization 
    remote isolated function addFileAndLinkIt(AddFileAndLinkItRequest payload) returns AddFileAndLinkItResponse200|error {
        string  path = string `/files/remote`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddFileAndLinkItResponse200 response = check self.clientEp->post(path, request, targetType=AddFileAndLinkItResponse200);
        return response;
    }
    # Link a remote file to an item
    #
    # + payload - LinkFileToItem request 
    # + return - Links an existing remote file (googledrive) to the item you supply - deal, person, organization 
    remote isolated function linkFileToItem(LinkFileToItemRequest payload) returns LinkFileToItemResponse200|error {
        string  path = string `/files/remoteLink`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        LinkFileToItemResponse200 response = check self.clientEp->post(path, request, targetType=LinkFileToItemResponse200);
        return response;
    }
    # Get one file
    #
    # + id - ID of the file 
    # + return - Get data about one specific uploaded to Pipedrive file 
    remote isolated function getFile(int id) returns GetFileResponse200|error {
        string  path = string `/files/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetFileResponse200 response = check self.clientEp-> get(path, targetType = GetFileResponse200);
        return response;
    }
    # Update file details
    #
    # + id - ID of the file 
    # + payload - UpdateFile request 
    # + return - Update file name and description. 
    remote isolated function updateFile(int id, UpdateFileRequest payload) returns UpdateFileResponse200|error {
        string  path = string `/files/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdateFileResponse200 response = check self.clientEp->put(path, request, targetType=UpdateFileResponse200);
        return response;
    }
    # Delete a file
    #
    # + id - ID of the file 
    # + return - Delete a file from Pipedrive 
    remote isolated function deleteFile(int id) returns DeleteFileResponse200|error {
        string  path = string `/files/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFileResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFileResponse200);
        return response;
    }
    # Download one file
    #
    # + id - ID of the file 
    # + return - success 
    remote isolated function downloadFile(int id) returns string|error {
        string  path = string `/files/${id}/download`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Get all filters
    #
    # + 'type - The types of filters to fetch 
    # + return - success 
    remote isolated function getFilters(string? 'type = ()) returns GetFiltersResponse200|error {
        string  path = string `/filters`;
        map<anydata> queryParam = {"type": 'type, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetFiltersResponse200 response = check self.clientEp-> get(path, targetType = GetFiltersResponse200);
        return response;
    }
    # Add a new filter
    #
    # + payload - AddFilter request 
    # + return - success 
    remote isolated function addFilter(AddFilterRequest payload) returns PostFilterResponse200|error {
        string  path = string `/filters`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostFilterResponse200 response = check self.clientEp->post(path, request, targetType=PostFilterResponse200);
        return response;
    }
    # Delete multiple filters in bulk
    #
    # + ids - Comma-separated filter IDs to delete 
    # + return - success 
    remote isolated function deleteFilters(string ids) returns DeleteFiltersResponse200|error {
        string  path = string `/filters`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFiltersResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFiltersResponse200);
        return response;
    }
    # Get all filter helpers
    #
    # + return - success 
    remote isolated function getFilterHelpers() returns json|error {
        string  path = string `/filters/helpers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get one filter
    #
    # + id - The ID of the filter 
    # + return - success 
    remote isolated function getFilter(int id) returns GetFilterResponse200|error {
        string  path = string `/filters/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetFilterResponse200 response = check self.clientEp-> get(path, targetType = GetFilterResponse200);
        return response;
    }
    # Update filter
    #
    # + id - The ID of the filter 
    # + payload - UpdateFilter request 
    # + return - success 
    remote isolated function updateFilter(int id, UpdateFilterRequest payload) returns PostFilterResponse200|error {
        string  path = string `/filters/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostFilterResponse200 response = check self.clientEp->put(path, request, targetType=PostFilterResponse200);
        return response;
    }
    # Delete a filter
    #
    # + id - The ID of the filter 
    # + return - success 
    remote isolated function deleteFilter(int id) returns DeleteFilterResponse200|error {
        string  path = string `/filters/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFilterResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFilterResponse200);
        return response;
    }
    # Get global messages
    #
    # + 'limit - Number of messages to get from 1 to 100. The message number 1 is returned by default. 
    # + return - Get all Global Messages 
    remote isolated function getGlobalMessages(int 'limit = 1) returns GetGlobalMessagesResponse200|error {
        string  path = string `/globalMessages`;
        map<anydata> queryParam = {"limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetGlobalMessagesResponse200 response = check self.clientEp-> get(path, targetType = GetGlobalMessagesResponse200);
        return response;
    }
    # Dismiss a global message
    #
    # + id - ID of global message to be dismissed. 
    # + return - Removes a Global Message by ID 
    remote isolated function deleteGlobalMessage(int id) returns DeleteGlobalMessageResponse200|error {
        string  path = string `/globalMessages/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteGlobalMessageResponse200 response = check self.clientEp-> delete(path, targetType = DeleteGlobalMessageResponse200);
        return response;
    }
    # Add a new goal
    #
    # + payload - AddGoal request 
    # + return - Successful response containing payload in the `data.goal` object. 
    remote isolated function addGoal(AddGoalRequest payload) returns AddOrUpdateGoalResponse200|error {
        string  path = string `/goals`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddOrUpdateGoalResponse200 response = check self.clientEp->post(path, request, targetType=AddOrUpdateGoalResponse200);
        return response;
    }
    # Find goals
    #
    # + typeName - Type of the goal. If provided, everyone's goals will be returned. 
    # + title - Title of the goal. 
    # + isActive - Whether goal is active or not. 
    # + assigneeId - ID of the user who's goal to fetch. When omitted, only your goals will be returned. 
    # + assigneeType - Type of the goal's assignee. If provided, everyone's goals will be returned. 
    # + expectedOutcomeTarget - Numeric value of the outcome. If provided, everyone's goals will be returned. 
    # + expectedOutcomeTrackingMetric - Tracking metric of the expected outcome of the goal. If provided, everyone's goals will be returned. 
    # + expectedOutcomeCurrencyId - Numeric ID of the goal's currency. Only applicable to goals with `expected_outcome.tracking_metric` with value `sum`. If provided, everyone's goals will be returned. 
    # + typeParamsPipelineId - ID of the pipeline or `null` for all pipelines. If provided, everyone's goals will be returned. 
    # + typeParamsStageId - ID of the stage. Applicable to only `deals_progressed` type of goals. If provided, everyone's goals will be returned. 
    # + typeParamsActivityTypeId - ID of the activity type. Applicable to only `activities_completed` or `activities_added` types of goals. If provided, everyone's goals will be returned. 
    # + periodStart - Start date of the period for which to find goals. Date in format of YYYY-MM-DD. When `period.start` is provided, `period.end` must be provided too. 
    # + periodEnd - End date of the period for which to find goals. Date in format of YYYY-MM-DD. 
    # + return - Successful response containing payload in the `data.goal` object. 
    remote isolated function getGoals(string? typeName = (), string? title = (), boolean isActive = true, int? assigneeId = (), string? assigneeType = (), decimal? expectedOutcomeTarget = (), string? expectedOutcomeTrackingMetric = (), int? expectedOutcomeCurrencyId = (), int? typeParamsPipelineId = (), int? typeParamsStageId = (), int? typeParamsActivityTypeId = (), string? periodStart = (), string? periodEnd = ()) returns GetGoalsResponse200|error {
        string  path = string `/goals/find`;
        map<anydata> queryParam = {"type.name": typeName, "title": title, "is_active": isActive, "assignee.id": assigneeId, "assignee.type": assigneeType, "expected_outcome.target": expectedOutcomeTarget, "expected_outcome.tracking_metric": expectedOutcomeTrackingMetric, "expected_outcome.currency_id": expectedOutcomeCurrencyId, "type.params.pipeline_id": typeParamsPipelineId, "type.params.stage_id": typeParamsStageId, "type.params.activity_type_id": typeParamsActivityTypeId, "period.start": periodStart, "period.end": periodEnd, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetGoalsResponse200 response = check self.clientEp-> get(path, targetType = GetGoalsResponse200);
        return response;
    }
    # Update existing goal
    #
    # + id - ID of the goal to be updated. 
    # + payload - BasicGoal request 
    # + return - Successful response containing payload in the `data.goal` object. 
    remote isolated function updateGoal(string id, BasicGoalRequest payload) returns AddOrUpdateGoalResponse200|error {
        string  path = string `/goals/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddOrUpdateGoalResponse200 response = check self.clientEp->put(path, request, targetType=AddOrUpdateGoalResponse200);
        return response;
    }
    # Delete existing goal
    #
    # + id - ID of the goal to be deleted. 
    # + return - Successful response with id 'success' field only 
    remote isolated function deleteGoal(string id) returns DeleteGoalResponse200|error {
        string  path = string `/goals/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteGoalResponse200 response = check self.clientEp-> delete(path, targetType = DeleteGoalResponse200);
        return response;
    }
    # Get result of a goal
    #
    # + id - ID of the goal that the results are looked for. 
    # + periodStart - Start date of the period for which to find progress of a goal. Date in format of YYYY-MM-DD. 
    # + periodEnd - End date of the period for which to find progress of a goal. Date in format of YYYY-MM-DD. 
    # + return - Successful response containing payload in the `data.goal` object. 
    remote isolated function getGoalResult(string id, string periodStart, string periodEnd) returns GetGoalResultResponse200|error {
        string  path = string `/goals/${id}/results`;
        map<anydata> queryParam = {"period.start": periodStart, "period.end": periodEnd, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetGoalResultResponse200 response = check self.clientEp-> get(path, targetType = GetGoalResultResponse200);
        return response;
    }
    # Perform a search from multiple item types
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + itemTypes - A comma-separated string array. The type of items to perform the search from. Defaults to all. 
    # + fields - A comma-separated string array. The fields to perform the search from. Defaults to all. Relevant for each item type are:<br> <table> <tr><th><b>Item type</b></th><th><b>Field</b></th></tr> <tr><td>Deal</td><td>`custom_fields`, `notes`, `title`</td></tr> <tr><td>Person</td><td>`custom_fields`, `email`, `name`, `notes`, `phone`</td></tr> <tr><td>Organization</td><td>`address`, `custom_fields`, `name`, `notes`</td></tr> <tr><td>Product</td><td>`code`, `custom_fields`, `name`</td></tr> <tr><td>Lead</td><td>`email`, `organization_name`, `person_name`, `phone`, `title`</td></tr> <tr><td>File</td><td>`name`</td></tr> <tr><td>Mail attachment</td><td>`name`</td></tr> </table> <br> When searching for Leads, the email, organization_name, person_name, and phone fields will return results only for Leads not linked to contacts. For searching Leads by Person or Organization values, please use `search_for_related_items`. 
    # + searchForRelatedItems - When enabled, the response will include up to 100 newest related Leads and 100 newest related Deals for each found Person and Organization and up to 100 newest related Persons for each found Organization. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. It is <b>not</b> case sensitive. 
    # + includeFields - A comma-separated string array. Supports including optional fields in the results which are not provided by default. 
    # + 'start - Pagination start. Note that the pagination is based on main results and does not include related items when using `search_for_related_items` parameter. 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchItem(string term, string? itemTypes = (), string? fields = (), boolean? searchForRelatedItems = (), boolean? exactMatch = (), string? includeFields = (), int 'start = 0, int? 'limit = ()) returns SearchItemResponse200|error {
        string  path = string `/itemSearch`;
        map<anydata> queryParam = {"term": term, "item_types": itemTypes, "fields": fields, "search_for_related_items": searchForRelatedItems, "exact_match": exactMatch, "include_fields": includeFields, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchItemResponse200 response = check self.clientEp-> get(path, targetType = SearchItemResponse200);
        return response;
    }
    # Perform a search using a specific field from an item type
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + fieldType - The type of the field to perform the search from 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. The search <b>is</b> case sensitive. 
    # + fieldKey - The key of the field to search from. The field key can be obtained by fetching the list of the fields using any of the fields' API GET methods (dealFields, personFields, etc.). 
    # + returnItemIds - Whether to return the IDs of the matching items or not. When not set or set to `0` or `false`, only distinct values of the searched field are returned. When set to `1` or `true`, the ID of each found item is returned. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchItemByField(string term, string fieldType, string fieldKey, boolean exactMatch = false, boolean? returnItemIds = (), int? 'start = (), int? 'limit = ()) returns SearchItemByFieldResponse200|error {
        string  path = string `/itemSearch/field`;
        map<anydata> queryParam = {"term": term, "field_type": fieldType, "exact_match": exactMatch, "field_key": fieldKey, "return_item_ids": returnItemIds, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchItemByFieldResponse200 response = check self.clientEp-> get(path, targetType = SearchItemByFieldResponse200);
        return response;
    }
    # Get all leads
    #
    # + 'limit - For pagination, the limit of entries to be returned. If not provided, 100 items will be returned. 
    # + 'start - For pagination, the position that represents the first result for the page 
    # + archivedStatus - Filtering based on archived status of a Lead. If not provided, `All` is used. 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function getLeads(int? 'limit = (), int? 'start = (), string? archivedStatus = ()) returns GetLeadsResponse200|error {
        string  path = string `/leads`;
        map<anydata> queryParam = {"limit": 'limit, "start": 'start, "archived_status": archivedStatus, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetLeadsResponse200 response = check self.clientEp-> get(path, targetType = GetLeadsResponse200);
        return response;
    }
    # Add a lead
    #
    # + payload - AddLead request 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function addLead(AddLeadRequest payload) returns OneLeadResponse200|error {
        string  path = string `/leads`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OneLeadResponse200 response = check self.clientEp->post(path, request, targetType=OneLeadResponse200);
        return response;
    }
    # Get one lead
    #
    # + id - The ID of the Lead 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function getLead(string id) returns OneLeadResponse200|error {
        string  path = string `/leads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        OneLeadResponse200 response = check self.clientEp-> get(path, targetType = OneLeadResponse200);
        return response;
    }
    # Delete a lead
    #
    # + id - The ID of the Lead 
    # + return - Successful response with id value only. Used in DELETE calls. 
    remote isolated function deleteLead(string id) returns LeadIdResponse200|error {
        string  path = string `/leads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        LeadIdResponse200 response = check self.clientEp-> delete(path, targetType = LeadIdResponse200);
        return response;
    }
    # Update a lead
    #
    # + id - The ID of the Lead 
    # + payload - UpdateLead request 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function updateLead(string id, UpdateLeadRequest payload) returns OneLeadResponse200|error {
        string  path = string `/leads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OneLeadResponse200 response = check self.clientEp->patch(path, request, targetType=OneLeadResponse200);
        return response;
    }
    # Get all lead labels
    #
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function getLeadLabels() returns GetLeadLabelsResponse200|error {
        string  path = string `/leadLabels`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetLeadLabelsResponse200 response = check self.clientEp-> get(path, targetType = GetLeadLabelsResponse200);
        return response;
    }
    # Add a lead label
    #
    # + payload - AddLeadLabel request 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function addLeadLabel(AddLeadLabelRequest payload) returns AddOrUpdateLeadLabelResponse200|error {
        string  path = string `/leadLabels`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddOrUpdateLeadLabelResponse200 response = check self.clientEp->post(path, request, targetType=AddOrUpdateLeadLabelResponse200);
        return response;
    }
    # Delete a lead label
    #
    # + id - The ID of the Lead Label 
    # + return - Successful response with id value only. Used in DELETE calls. 
    remote isolated function deleteLeadLabel(string id) returns LeadIdResponse200|error {
        string  path = string `/leadLabels/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        LeadIdResponse200 response = check self.clientEp-> delete(path, targetType = LeadIdResponse200);
        return response;
    }
    # Update a lead label
    #
    # + id - The ID of the Lead Label 
    # + payload - UpdateLeadLabel request 
    # + return - Successful response containing payload in the `data` field. 
    remote isolated function updateLeadLabel(string id, UpdateLeadLabelRequest payload) returns AddOrUpdateLeadLabelResponse200|error {
        string  path = string `/leadLabels/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddOrUpdateLeadLabelResponse200 response = check self.clientEp->patch(path, request, targetType=AddOrUpdateLeadLabelResponse200);
        return response;
    }
    # Get all lead sources
    #
    # + return - The successful response containing payload in the `data` field. 
    remote isolated function getLeadSources() returns GetLeadSourcesResponse200|error {
        string  path = string `/leadSources`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetLeadSourcesResponse200 response = check self.clientEp-> get(path, targetType = GetLeadSourcesResponse200);
        return response;
    }
    # Get one mail message
    #
    # + id - ID of the mail message to fetch. 
    # + includeBody - Whether to include full message body or not. `0` = Don't include, `1` = Include 
    # + return - The mail messages that are being synced with Pipedrive 
    remote isolated function getMailMessage(int id, decimal includeBody = 1) returns MailMessageResponse200|error {
        string  path = string `/mailbox/mailMessages/${id}`;
        map<anydata> queryParam = {"include_body": includeBody, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        MailMessageResponse200 response = check self.clientEp-> get(path, targetType = MailMessageResponse200);
        return response;
    }
    # Get mail threads
    #
    # + folder - Type of folder to fetch. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Get mail threads 
    remote isolated function getMailThreads(string folder, int 'start = 0, int? 'limit = ()) returns GetMailThreadsResponse200|error {
        string  path = string `/mailbox/mailThreads`;
        map<anydata> queryParam = {"folder": folder, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetMailThreadsResponse200 response = check self.clientEp-> get(path, targetType = GetMailThreadsResponse200);
        return response;
    }
    # Get one mail thread
    #
    # + id - ID of the mail thread 
    # + return - Get mail threads 
    remote isolated function getMailThread(int id) returns GetOneMailThreadResponse200|error {
        string  path = string `/mailbox/mailThreads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetOneMailThreadResponse200 response = check self.clientEp-> get(path, targetType = GetOneMailThreadResponse200);
        return response;
    }
    # Update mail thread details
    #
    # + id - ID of the mail thread 
    # + payload - UpdateMailThreadDetails request 
    # + return - Updates the properties of a mail thread. 
    remote isolated function updateMailThreadDetails(int id, UpdateMailThreadDetailsRequest payload) returns UpdateMailThreadDetailsResponse200|error {
        string  path = string `/mailbox/mailThreads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdateMailThreadDetailsResponse200 response = check self.clientEp->put(path, request, targetType=UpdateMailThreadDetailsResponse200);
        return response;
    }
    # Delete mail thread
    #
    # + id - ID of the mail thread 
    # + return - Marks mail thread as deleted. 
    remote isolated function deleteMailThread(int id) returns DeleteMailThreadResponse200|error {
        string  path = string `/mailbox/mailThreads/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteMailThreadResponse200 response = check self.clientEp-> delete(path, targetType = DeleteMailThreadResponse200);
        return response;
    }
    # Get all mail messages of mail thread
    #
    # + id - ID of the mail thread 
    # + return - Get mail messages from thread 
    remote isolated function getMailThreadMessages(int id) returns GetAllMailMessagesOfMailThreadResponse200|error {
        string  path = string `/mailbox/mailThreads/${id}/mailMessages`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAllMailMessagesOfMailThreadResponse200 response = check self.clientEp-> get(path, targetType = GetAllMailMessagesOfMailThreadResponse200);
        return response;
    }
    # Get all notes
    #
    # + userId - The ID of the user whose notes to fetch. If omitted, notes by all users will be returned. 
    # + leadId - The ID of the lead which notes to fetch. If omitted, notes about all leads will be returned. 
    # + dealId - The ID of the deal which notes to fetch. If omitted, notes about all deals will be returned. 
    # + personId - The ID of the person whose notes to fetch. If omitted, notes about all persons will be returned. 
    # + orgId - The ID of the organization which notes to fetch. If omitted, notes about all organizations will be returned 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). Supported fields: `id`, `user_id`, `deal_id`, `person_id`, `org_id`, `content`, `add_time`, `update_time`. 
    # + startDate - Date in format of YYYY-MM-DD from which notes to fetch. 
    # + endDate - Date in format of YYYY-MM-DD until which notes to fetch to. 
    # + pinnedToLeadFlag - If set, then results are filtered by note to lead pinning state 
    # + pinnedToDealFlag - If set, then results are filtered by note to deal pinning state 
    # + pinnedToOrganizationFlag - If set, then results are filtered by note to organization pinning state 
    # + pinnedToPersonFlag - If set, then results are filtered by note to person pinning state 
    # + return - Get all Notes 
    remote isolated function getNotes(int? userId = (), string? leadId = (), int? dealId = (), int? personId = (), int? orgId = (), int 'start = 0, int? 'limit = (), string? sort = (), string? startDate = (), string? endDate = (), decimal? pinnedToLeadFlag = (), decimal? pinnedToDealFlag = (), decimal? pinnedToOrganizationFlag = (), decimal? pinnedToPersonFlag = ()) returns GetNotesResponse200|error {
        string  path = string `/notes`;
        map<anydata> queryParam = {"user_id": userId, "lead_id": leadId, "deal_id": dealId, "person_id": personId, "org_id": orgId, "start": 'start, "limit": 'limit, "sort": sort, "start_date": startDate, "end_date": endDate, "pinned_to_lead_flag": pinnedToLeadFlag, "pinned_to_deal_flag": pinnedToDealFlag, "pinned_to_organization_flag": pinnedToOrganizationFlag, "pinned_to_person_flag": pinnedToPersonFlag, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetNotesResponse200 response = check self.clientEp-> get(path, targetType = GetNotesResponse200);
        return response;
    }
    # Add a note
    #
    # + payload - Note request 
    # + return - Add, update or get a Note 
    remote isolated function addNote(NoteRequest payload) returns OneNoteResponse200|error {
        string  path = string `/notes`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        OneNoteResponse200 response = check self.clientEp->post(path, request, targetType=OneNoteResponse200);
        return response;
    }
    # Get one note
    #
    # + id - ID of the note 
    # + return - Add, update or get a Note 
    remote isolated function getNote(int id) returns OneNoteResponse200|error {
        string  path = string `/notes/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        OneNoteResponse200 response = check self.clientEp-> get(path, targetType = OneNoteResponse200);
        return response;
    }
    # Update a note
    #
    # + id - ID of the note 
    # + payload - Note request 
    # + return - Add, update or get a Note 
    remote isolated function updateNote(int id, Noterequest1 payload) returns OneNoteResponse200|error {
        string  path = string `/notes/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        OneNoteResponse200 response = check self.clientEp->put(path, request, targetType=OneNoteResponse200);
        return response;
    }
    # Delete a note
    #
    # + id - ID of the note 
    # + return - Delete a Note 
    remote isolated function deleteNote(int id) returns DeleteNoteResponse200|error {
        string  path = string `/notes/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteNoteResponse200 response = check self.clientEp-> delete(path, targetType = DeleteNoteResponse200);
        return response;
    }
    # Get all comments for a note
    #
    # + id - ID of the note 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Get all Comments 
    remote isolated function getNoteComments(int id, int 'start = 0, int? 'limit = ()) returns GetCommentsResponse200|error {
        string  path = string `/notes/${id}/comments`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetCommentsResponse200 response = check self.clientEp-> get(path, targetType = GetCommentsResponse200);
        return response;
    }
    # Add a comment to a note
    #
    # + id - ID of the note 
    # + payload - CommentPostPutObject request 
    # + return - Add, update or get a comment 
    remote isolated function addNoteComment(int id, CommentPostPutObject payload) returns OneCommentResponse200|error {
        string  path = string `/notes/${id}/comments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        OneCommentResponse200 response = check self.clientEp->post(path, request, targetType=OneCommentResponse200);
        return response;
    }
    # Get one comment
    #
    # + id - ID of the note 
    # + commentId - ID of the comment 
    # + return - Add, update or get a comment 
    remote isolated function getComment(int id, string commentId) returns OneCommentResponse200|error {
        string  path = string `/notes/${id}/comments/${commentId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        OneCommentResponse200 response = check self.clientEp-> get(path, targetType = OneCommentResponse200);
        return response;
    }
    # Update a comment related to a note
    #
    # + id - ID of the note 
    # + commentId - ID of the comment 
    # + payload - CommentPostPutObject request 
    # + return - Add, update or get a comment 
    remote isolated function updateCommentForNote(int id, string commentId, Commentpostputobject1 payload) returns OneCommentResponse200|error {
        string  path = string `/notes/${id}/comments/${commentId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        OneCommentResponse200 response = check self.clientEp->put(path, request, targetType=OneCommentResponse200);
        return response;
    }
    # Delete a comment related to a note
    #
    # + id - ID of the note 
    # + commentId - ID of the comment 
    # + return - Delete a Comment 
    remote isolated function deleteComment(int id, string commentId) returns DeleteCommentResponse200|error {
        string  path = string `/notes/${id}/comments/${commentId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteCommentResponse200 response = check self.clientEp-> delete(path, targetType = DeleteCommentResponse200);
        return response;
    }
    # Get all note fields
    #
    # + return - success 
    remote isolated function getNoteFields() returns GetNoteFieldsResponse200|error {
        string  path = string `/noteFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetNoteFieldsResponse200 response = check self.clientEp-> get(path, targetType = GetNoteFieldsResponse200);
        return response;
    }
    # Get all organizations
    #
    # + userId - If supplied, only organizations owned by the given user will be returned. However, `filter_id` takes precedence over `user_id` when both are supplied. 
    # + filterId - ID of the filter to use 
    # + firstChar - If supplied, only organizations whose name starts with the specified letter will be returned (case insensitive). 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). 
    # + return - success 
    remote isolated function getOrganizations(int? userId = (), int? filterId = (), string? firstChar = (), int 'start = 0, int? 'limit = (), string? sort = ()) returns GetOrganizationsResponse200|error {
        string  path = string `/organizations`;
        map<anydata> queryParam = {"user_id": userId, "filter_id": filterId, "first_char": firstChar, "start": 'start, "limit": 'limit, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetOrganizationsResponse200 response = check self.clientEp-> get(path, targetType = GetOrganizationsResponse200);
        return response;
    }
    # Add an organization
    #
    # + payload - AddOrganization request 
    # + return - success 
    remote isolated function addOrganization(AddOrganizationRequest payload) returns AddOrganizationResponse200|error {
        string  path = string `/organizations`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddOrganizationResponse200 response = check self.clientEp->post(path, request, targetType=AddOrganizationResponse200);
        return response;
    }
    # Delete multiple organizations in bulk
    #
    # + ids - Comma-separated IDs that will be deleted 
    # + return - success 
    remote isolated function deleteOrganizations(string ids) returns DeleteOrganizationsResponse200|error {
        string  path = string `/organizations`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteOrganizationsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteOrganizationsResponse200);
        return response;
    }
    # Search organizations
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + fields - A comma-separated string array. The fields to perform the search from. Defaults to all of them. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. It is <b>not</b> case sensitive. 
    # + 'start - Pagination start. Note that the pagination is based on main results and does not include related items when using `search_for_related_items` parameter. 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchOrganization(string term, string? fields = (), boolean? exactMatch = (), int 'start = 0, int? 'limit = ()) returns SearchOrganizationResponse200|error {
        string  path = string `/organizations/search`;
        map<anydata> queryParam = {"term": term, "fields": fields, "exact_match": exactMatch, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchOrganizationResponse200 response = check self.clientEp-> get(path, targetType = SearchOrganizationResponse200);
        return response;
    }
    # Find organizations by name
    #
    # + term - Search term to look for 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrganizationByName(string term, int 'start = 0, int? 'limit = ()) returns json|error {
        string  path = string `/organizations/find`;
        map<anydata> queryParam = {"term": term, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get details of an organization
    #
    # + id - The ID of the Organization 
    # + return - success 
    remote isolated function getOrganization(int id) returns GetOrganizationResponse200|error {
        string  path = string `/organizations/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetOrganizationResponse200 response = check self.clientEp-> get(path, targetType = GetOrganizationResponse200);
        return response;
    }
    # Update an organization
    #
    # + id - The ID of the Organization 
    # + payload - BasicOrganization request 
    # + return - success 
    remote isolated function updateOrganization(int id, BasicOrganization payload) returns UpdateOrganizationResponse200|error {
        string  path = string `/organizations/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdateOrganizationResponse200 response = check self.clientEp->put(path, request, targetType=UpdateOrganizationResponse200);
        return response;
    }
    # Delete an organization
    #
    # + id - The ID of the Organization 
    # + return - success 
    remote isolated function deleteOrganization(int id) returns DeleteOrganizationResponse200|error {
        string  path = string `/organizations/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteOrganizationResponse200 response = check self.clientEp-> delete(path, targetType = DeleteOrganizationResponse200);
        return response;
    }
    # List activities associated with an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + done - Whether the activity is done or not. 0 = Not done, 1 = Done. If omitted returns both Done and Not done activities. 
    # + exclude - A comma-separated string of activity IDs to exclude from result 
    # + return - success 
    remote isolated function getOrganizationActivities(int id, int 'start = 0, int? 'limit = (), decimal? done = (), string? exclude = ()) returns GetAssociatedActivitiesResponse200|error {
        string  path = string `/organizations/${id}/activities`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "done": done, "exclude": exclude, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedActivitiesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedActivitiesResponse200);
        return response;
    }
    # List deals associated with an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + status - Only fetch deals with specific status. If omitted, all not deleted deals are fetched. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). 
    # + onlyPrimaryAssociation - If set, only deals that are directly associated to the organization are fetched. If not set (default), all deals are fetched that are either directly or indirectly related to the organization. Indirect relations include relations through custom, organization-type fields and through persons of the given organization. 
    # + return - success 
    remote isolated function getOrganizationDeals(int id, int 'start = 0, int? 'limit = (), string status = "all_not_deleted", string? sort = (), decimal? onlyPrimaryAssociation = ()) returns GetAssociatedDealsResponse200|error {
        string  path = string `/organizations/${id}/deals`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "status": status, "sort": sort, "only_primary_association": onlyPrimaryAssociation, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedDealsResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedDealsResponse200);
        return response;
    }
    # List files attached to an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeDeletedFiles - When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. 
    # + sort - Field names and sorting mode separated by a comma (field_name_1 ASC, field_name_2 DESC). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment. 
    # + return - success 
    remote isolated function getOrganizationFiles(int id, int 'start = 0, int? 'limit = (), decimal? includeDeletedFiles = (), string? sort = ()) returns GetAssociatedFilesResponse200|error {
        string  path = string `/organizations/${id}/files`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_deleted_files": includeDeletedFiles, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFilesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFilesResponse200);
        return response;
    }
    # List updates about an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + allChanges - Whether to show custom field updates or not. 1 = Include custom field changes. If omitted returns changes without custom field updates. 
    # + items - A comma-separated string for filtering out item specific updates. (Possible values - activity, plannedActivity, note, file, change, deal, follower, participant, mailMessage, mailMessageWithAttachment, invoice, activityFile, document) 
    # + return - Get the Organization Updates 
    remote isolated function getOrganizationUpdates(int id, int 'start = 0, int? 'limit = (), string? allChanges = (), string? items = ()) returns GetAssociatedUpdatesResponse200|error {
        string  path = string `/organizations/${id}/flow`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "all_changes": allChanges, "items": items, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedUpdatesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedUpdatesResponse200);
        return response;
    }
    # List followers of an organization
    #
    # + id - The ID of the Organization 
    # + return - success 
    remote isolated function getOrganizationFollowers(int id) returns Getassociatedfollowersresponse2001|error {
        string  path = string `/organizations/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        Getassociatedfollowersresponse2001 response = check self.clientEp-> get(path, targetType = Getassociatedfollowersresponse2001);
        return response;
    }
    # Add a follower to an organization
    #
    # + id - The ID of the Organization 
    # + payload - AddOrganizationFollower request 
    # + return - success 
    remote isolated function addOrganizationFollower(int id, AddOrganizationFollowerRequest payload) returns AddOrganizationFollowerResponse200|error {
        string  path = string `/organizations/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddOrganizationFollowerResponse200 response = check self.clientEp->post(path, request, targetType=AddOrganizationFollowerResponse200);
        return response;
    }
    # Delete a follower from an organization
    #
    # + id - The ID of the Organization 
    # + followerId - The ID of the follower 
    # + return - success 
    remote isolated function deleteOrganizationFollower(int id, int followerId) returns DeleteOrganizationFollowerResponse200|error {
        string  path = string `/organizations/${id}/followers/${followerId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteOrganizationFollowerResponse200 response = check self.clientEp-> delete(path, targetType = DeleteOrganizationFollowerResponse200);
        return response;
    }
    # List mail messages associated with an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getOrganizationMailMessages(int id, int 'start = 0, int? 'limit = ()) returns GetAssociatedMailMessagesResponse200|error {
        string  path = string `/organizations/${id}/mailMessages`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedMailMessagesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedMailMessagesResponse200);
        return response;
    }
    # Merge two organizations
    #
    # + id - The ID of the Organization 
    # + payload - MergeOrganizations request 
    # + return - success 
    remote isolated function mergeOrganizations(int id, MergeOrganizationsRequest payload) returns MergeOrganizationsResponse200|error {
        string  path = string `/organizations/${id}/merge`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        MergeOrganizationsResponse200 response = check self.clientEp->put(path, request, targetType=MergeOrganizationsResponse200);
        return response;
    }
    # List permitted users
    #
    # + id - The ID of the Organization 
    # + return - success 
    remote isolated function getOrganizationUsers(int id) returns Listpermittedusersresponse2001|error {
        string  path = string `/organizations/${id}/permittedUsers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        Listpermittedusersresponse2001 response = check self.clientEp-> get(path, targetType = Listpermittedusersresponse2001);
        return response;
    }
    # List persons of an organization
    #
    # + id - The ID of the Organization 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getOrganizationPersons(int id, int 'start = 0, int? 'limit = ()) returns ListPersonsResponse200|error {
        string  path = string `/organizations/${id}/persons`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        ListPersonsResponse200 response = check self.clientEp-> get(path, targetType = ListPersonsResponse200);
        return response;
    }
    # Get all organization fields
    #
    # + return - success 
    remote isolated function getOrganizationFields() returns FieldsResponse200|error {
        string  path = string `/organizationFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldsResponse200 response = check self.clientEp-> get(path, targetType = FieldsResponse200);
        return response;
    }
    # Add a new organization field
    #
    # + payload - CreateField request 
    # + return - success 
    remote isolated function addOrganizationField(Createfieldrequest1 payload) returns FieldResponse200|error {
        string  path = string `/organizationFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->post(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete multiple organization fields in bulk
    #
    # + ids - Comma-separated field IDs to delete 
    # + return - success 
    remote isolated function deleteOrganizationFields(string ids) returns DeleteFieldsResponse200|error {
        string  path = string `/organizationFields`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldsResponse200);
        return response;
    }
    # Get one organization field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function getOrganizationField(int id) returns FieldResponse200|error {
        string  path = string `/organizationFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldResponse200 response = check self.clientEp-> get(path, targetType = FieldResponse200);
        return response;
    }
    # Update an organization field
    #
    # + id - ID of the field 
    # + payload - UpdateField request 
    # + return - success 
    remote isolated function updateOrganizationField(int id, Updatefieldrequest1 payload) returns FieldResponse200|error {
        string  path = string `/organizationFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->put(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete an organization field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function deleteOrganizationField(int id) returns DeleteFieldResponse200|error {
        string  path = string `/organizationFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldResponse200);
        return response;
    }
    # Get all relationships for organization
    #
    # + orgId - ID of the organization to get relationships for 
    # + return - success 
    remote isolated function getOrganizationRelationships(int orgId) returns GetOrganizationRelationshipsResponse200|error {
        string  path = string `/organizationRelationships`;
        map<anydata> queryParam = {"org_id": orgId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetOrganizationRelationshipsResponse200 response = check self.clientEp-> get(path, targetType = GetOrganizationRelationshipsResponse200);
        return response;
    }
    # Create an organization relationship
    #
    # + payload - AddOrganizationRelationship request 
    # + return - success 
    remote isolated function addOrganizationRelationship(AddOrganizationRelationshipRequest payload) returns AddOrganizationRelationshipResponse200|error {
        string  path = string `/organizationRelationships`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddOrganizationRelationshipResponse200 response = check self.clientEp->post(path, request, targetType=AddOrganizationRelationshipResponse200);
        return response;
    }
    # Get one organization relationship
    #
    # + id - ID of the organization relationship 
    # + orgId - ID of the base organization for the returned calculated values 
    # + return - success 
    remote isolated function getOrganizationRelationship(int id, int? orgId = ()) returns GetOrganizationRelationshipResponse200|error {
        string  path = string `/organizationRelationships/${id}`;
        map<anydata> queryParam = {"org_id": orgId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetOrganizationRelationshipResponse200 response = check self.clientEp-> get(path, targetType = GetOrganizationRelationshipResponse200);
        return response;
    }
    # Update an organization relationship
    #
    # + id - ID of the organization relationship 
    # + payload - OrganizationRelationship request 
    # + return - success 
    remote isolated function updateOrganizationRelationship(int id, OrganizationRelationshipRequest payload) returns UpdateOrganizationRelationshipResponse200|error {
        string  path = string `/organizationRelationships/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdateOrganizationRelationshipResponse200 response = check self.clientEp->put(path, request, targetType=UpdateOrganizationRelationshipResponse200);
        return response;
    }
    # Delete an organization relationship
    #
    # + id - ID of the organization relationship 
    # + return - success 
    remote isolated function deleteOrganizationRelationship(int id) returns DeleteOrganizationRelationshipResponse200|error {
        string  path = string `/organizationRelationships/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteOrganizationRelationshipResponse200 response = check self.clientEp-> delete(path, targetType = DeleteOrganizationRelationshipResponse200);
        return response;
    }
    # Get all Permission Sets
    #
    # + return - Get all permissions 
    remote isolated function getPermissionSets() returns GetPermissionSetsResponse200|error {
        string  path = string `/permissionSets`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPermissionSetsResponse200 response = check self.clientEp-> get(path, targetType = GetPermissionSetsResponse200);
        return response;
    }
    # Get one Permission Set
    #
    # + id - ID of the permission set 
    # + return - The Permission Set of a specific User ID 
    remote isolated function getPermissionSet(int id) returns SinglePermissionSetResponse200|error {
        string  path = string `/permissionSets/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SinglePermissionSetResponse200 response = check self.clientEp-> get(path, targetType = SinglePermissionSetResponse200);
        return response;
    }
    # List Permission Set assignments
    #
    # + id - ID of the permission set 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - The Assignments of a specific User ID 
    remote isolated function getPermissionSetAssignments(int id, int 'start = 0, int? 'limit = ()) returns UserAssignmentsToPermissionSetResponse200|error {
        string  path = string `/permissionSets/${id}/assignments`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserAssignmentsToPermissionSetResponse200 response = check self.clientEp-> get(path, targetType = UserAssignmentsToPermissionSetResponse200);
        return response;
    }
    # Get all persons
    #
    # + userId - If supplied, only persons owned by the given user will be returned. However, `filter_id` takes precedence over `user_id` when both are supplied. 
    # + filterId - ID of the filter to use. 
    # + firstChar - If supplied, only persons whose name starts with the specified letter will be returned (case insensitive). 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). 
    # + return - success 
    remote isolated function getPersons(int? userId = (), int? filterId = (), string? firstChar = (), int 'start = 0, int? 'limit = (), string? sort = ()) returns GetPersonsResponse200|error {
        string  path = string `/persons`;
        map<anydata> queryParam = {"user_id": userId, "filter_id": filterId, "first_char": firstChar, "start": 'start, "limit": 'limit, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPersonsResponse200 response = check self.clientEp-> get(path, targetType = GetPersonsResponse200);
        return response;
    }
    # Add a person
    #
    # + payload - AddPerson request 
    # + return - success 
    remote isolated function addPerson(AddPersonRequest payload) returns AddPersonResponse200|error {
        string  path = string `/persons`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddPersonResponse200 response = check self.clientEp->post(path, request, targetType=AddPersonResponse200);
        return response;
    }
    # Delete multiple persons in bulk
    #
    # + ids - Comma-separated IDs that will be deleted 
    # + return - success 
    remote isolated function deletePersons(string? ids = ()) returns DeletePersonsResponse200|error {
        string  path = string `/persons`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeletePersonsResponse200 response = check self.clientEp-> delete(path, targetType = DeletePersonsResponse200);
        return response;
    }
    # Search persons
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + fields - A comma-separated string array. The fields to perform the search from. Defaults to all of them. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. It is <b>not</b> case sensitive. 
    # + organizationId - Will filter Deals by the provided Organization ID. The upper limit of found Deals associated with the Organization is 2000. 
    # + includeFields - Supports including optional fields in the results which are not provided by default. 
    # + 'start - Pagination start. Note that the pagination is based on main results and does not include related items when using `search_for_related_items` parameter. 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchPersons(string term, string? fields = (), boolean? exactMatch = (), int? organizationId = (), string? includeFields = (), int 'start = 0, int? 'limit = ()) returns SearchPersonsResponse200|error {
        string  path = string `/persons/search`;
        map<anydata> queryParam = {"term": term, "fields": fields, "exact_match": exactMatch, "organization_id": organizationId, "include_fields": includeFields, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchPersonsResponse200 response = check self.clientEp-> get(path, targetType = SearchPersonsResponse200);
        return response;
    }
    # Find persons by name
    #
    # + term - Search term to look for 
    # + orgId - ID of the organization person is associated with. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + searchByEmail - When enabled, term will only be matched against email addresses of people. Default: false 
    # + return - success 
    # 
    # # Deprecated
    @deprecated
    remote isolated function findPersonByName(string term, int? orgId = (), int 'start = 0, int? 'limit = (), decimal? searchByEmail = ()) returns json|error {
        string  path = string `/persons/find`;
        map<anydata> queryParam = {"term": term, "org_id": orgId, "start": 'start, "limit": 'limit, "search_by_email": searchByEmail, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get details of a person
    #
    # + id - ID of a person 
    # + return - success 
    remote isolated function getPerson(int id) returns GetPersonResponse200|error {
        string  path = string `/persons/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPersonResponse200 response = check self.clientEp-> get(path, targetType = GetPersonResponse200);
        return response;
    }
    # Update a person
    #
    # + id - ID of a person 
    # + payload - BasicPerson request 
    # + return - success 
    remote isolated function updatePerson(int id, BasicPersonRequest payload) returns UpdatePersonResponse200|error {
        string  path = string `/persons/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdatePersonResponse200 response = check self.clientEp->put(path, request, targetType=UpdatePersonResponse200);
        return response;
    }
    # Delete a person
    #
    # + id - ID of a person 
    # + return - success 
    remote isolated function deletePerson(int id) returns DeletePersonResponse200|error {
        string  path = string `/persons/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeletePersonResponse200 response = check self.clientEp-> delete(path, targetType = DeletePersonResponse200);
        return response;
    }
    # List activities associated with a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + done - Whether the activity is done or not. 0 = Not done, 1 = Done. If omitted returns both Done and Not done activities. 
    # + exclude - A comma-separated string of activity IDs to exclude from result 
    # + return - success 
    remote isolated function getPersonActivities(int id, int 'start = 0, int? 'limit = (), decimal? done = (), string? exclude = ()) returns GetAssociatedActivitiesResponse200|error {
        string  path = string `/persons/${id}/activities`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "done": done, "exclude": exclude, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedActivitiesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedActivitiesResponse200);
        return response;
    }
    # List deals associated with a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + status - Only fetch deals with specific status. If omitted, all not deleted deals are fetched. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). 
    # + return - success 
    remote isolated function getPersonDeals(int id, int 'start = 0, int? 'limit = (), string status = "all_not_deleted", string? sort = ()) returns GetAssociatedDealsResponse200|error {
        string  path = string `/persons/${id}/deals`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "status": status, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedDealsResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedDealsResponse200);
        return response;
    }
    # List files attached to a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeDeletedFiles - When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment. 
    # + return - success 
    remote isolated function getPersonFiles(int id, int 'start = 0, int? 'limit = (), decimal? includeDeletedFiles = (), string? sort = ()) returns GetAssociatedFilesResponse200|error {
        string  path = string `/persons/${id}/files`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_deleted_files": includeDeletedFiles, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFilesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFilesResponse200);
        return response;
    }
    # List updates about a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + allChanges - Whether to show custom field updates or not. 1 = Include custom field changes. If omitted returns changes without custom field updates. 
    # + items - A comma-separated string for filtering out item specific updates. (Possible values - activity, plannedActivity, note, file, change, deal, follower, participant, mailMessage, mailMessageWithAttachment, invoice, activityFile, document) 
    # + return - Get the Person Updates 
    remote isolated function getPersonUpdates(int id, int 'start = 0, int? 'limit = (), string? allChanges = (), string? items = ()) returns GetAssociatedPersonUpdatesResponse200|error {
        string  path = string `/persons/${id}/flow`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "all_changes": allChanges, "items": items, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedPersonUpdatesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedPersonUpdatesResponse200);
        return response;
    }
    # List followers of a person
    #
    # + id - ID of a person 
    # + return - success 
    remote isolated function getPersonFollowers(int id) returns GetAssociatedFollowersResponse200|error {
        string  path = string `/persons/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFollowersResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFollowersResponse200);
        return response;
    }
    # Add a follower to a person
    #
    # + id - ID of a person 
    # + payload - AddPersonFollower request 
    # + return - success 
    remote isolated function addPersonFollower(int id, AddPersonFollowerRequest payload) returns AddPersonFollowerResponse200|error {
        string  path = string `/persons/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddPersonFollowerResponse200 response = check self.clientEp->post(path, request, targetType=AddPersonFollowerResponse200);
        return response;
    }
    # Deletes a follower from a person.
    #
    # + id - ID of a person 
    # + followerId - ID of the follower 
    # + return - success 
    remote isolated function deletePersonFollower(int id, int followerId) returns DeletePersonResponse200|error {
        string  path = string `/persons/${id}/followers/${followerId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeletePersonResponse200 response = check self.clientEp-> delete(path, targetType = DeletePersonResponse200);
        return response;
    }
    # List mail messages associated with a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getPersonMailMessages(int id, int 'start = 0, int? 'limit = ()) returns GetAssociatedMailMessagesResponse200|error {
        string  path = string `/persons/${id}/mailMessages`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedMailMessagesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedMailMessagesResponse200);
        return response;
    }
    # Merge two persons
    #
    # + id - ID of a person 
    # + payload - MergePersons request 
    # + return - success 
    remote isolated function mergePersons(int id, MergePersonsRequest payload) returns MergePersonsResponse200|error {
        string  path = string `/persons/${id}/merge`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        MergePersonsResponse200 response = check self.clientEp->put(path, request, targetType=MergePersonsResponse200);
        return response;
    }
    # List permitted users
    #
    # + id - ID of a person 
    # + return - success 
    remote isolated function getPersonUsers(int id) returns Listpermittedusersresponse2001|error {
        string  path = string `/persons/${id}/permittedUsers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        Listpermittedusersresponse2001 response = check self.clientEp-> get(path, targetType = Listpermittedusersresponse2001);
        return response;
    }
    # Delete person picture
    #
    # + id - ID of a person 
    # + return - success 
    remote isolated function deletePersonPicture(int id) returns DeletePersonResponse200|error {
        string  path = string `/persons/${id}/picture`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeletePersonResponse200 response = check self.clientEp-> delete(path, targetType = DeletePersonResponse200);
        return response;
    }
    # List products associated with a person
    #
    # + id - ID of a person 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function getPersonProducts(int id, int 'start = 0, int? 'limit = ()) returns GetPersonProductsResponse200|error {
        string  path = string `/persons/${id}/products`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPersonProductsResponse200 response = check self.clientEp-> get(path, targetType = GetPersonProductsResponse200);
        return response;
    }
    # Get all person fields
    #
    # + return - success 
    remote isolated function getPersonFields() returns FieldsResponse200|error {
        string  path = string `/personFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldsResponse200 response = check self.clientEp-> get(path, targetType = FieldsResponse200);
        return response;
    }
    # Add a new person field
    #
    # + payload - CreateField request 
    # + return - success 
    remote isolated function addPersonField(Createfieldrequest2 payload) returns FieldResponse200|error {
        string  path = string `/personFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->post(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete multiple person fields in bulk
    #
    # + ids - Comma-separated field IDs to delete 
    # + return - success 
    remote isolated function deletePersonFields(string ids) returns DeleteFieldsResponse200|error {
        string  path = string `/personFields`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldsResponse200);
        return response;
    }
    # Get one person field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function getPersonField(int id) returns FieldResponse200|error {
        string  path = string `/personFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FieldResponse200 response = check self.clientEp-> get(path, targetType = FieldResponse200);
        return response;
    }
    # Update a person field
    #
    # + id - ID of the field 
    # + payload - UpdateField request 
    # + return - success 
    remote isolated function updatePersonField(int id, Updatefieldrequest2 payload) returns FieldResponse200|error {
        string  path = string `/personFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        FieldResponse200 response = check self.clientEp->put(path, request, targetType=FieldResponse200);
        return response;
    }
    # Delete a person field
    #
    # + id - ID of the field 
    # + return - success 
    remote isolated function deletePersonField(int id) returns DeleteFieldResponse200|error {
        string  path = string `/personFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteFieldResponse200 response = check self.clientEp-> delete(path, targetType = DeleteFieldResponse200);
        return response;
    }
    # Get all pipelines
    #
    # + return - Get all Pipelines 
    remote isolated function getPipelines() returns GetPipelinesResponse200|error {
        string  path = string `/pipelines`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPipelinesResponse200 response = check self.clientEp-> get(path, targetType = GetPipelinesResponse200);
        return response;
    }
    # Add a new pipeline
    #
    # + payload - Pipeline request 
    # + return - Add Pipeline 
    remote isolated function addPipeline(PipelineRequest payload) returns AddPipelineResponse200|error {
        string  path = string `/pipelines`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddPipelineResponse200 response = check self.clientEp->post(path, request, targetType=AddPipelineResponse200);
        return response;
    }
    # Get one pipeline
    #
    # + id - ID of the pipeline 
    # + totalsConvertCurrency - 3-letter currency code of any of the supported currencies. When supplied, `per_stages_converted` is returned in `deals_summary` which contains the currency-converted total amounts in the given currency per each stage. You may also set this parameter to `default_currency` in which case users default currency is used. 
    # + return - Get Pipeline 
    remote isolated function getPipeline(int id, string? totalsConvertCurrency = ()) returns GetPipelineResponse200|error {
        string  path = string `/pipelines/${id}`;
        map<anydata> queryParam = {"totals_convert_currency": totalsConvertCurrency, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPipelineResponse200 response = check self.clientEp-> get(path, targetType = GetPipelineResponse200);
        return response;
    }
    # Edit a pipeline
    #
    # + id - ID of the pipeline 
    # + payload - Pipeline request 
    # + return - Edit Pipeline 
    remote isolated function updatePipeline(int id, Pipelinerequest1 payload) returns UpdatePipelineResponse200|error {
        string  path = string `/pipelines/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdatePipelineResponse200 response = check self.clientEp->put(path, request, targetType=UpdatePipelineResponse200);
        return response;
    }
    # Delete a pipeline
    #
    # + id - ID of the pipeline 
    # + return - Delete Pipeline 
    remote isolated function deletePipeline(int id) returns DeletePipelineResponse200|error {
        string  path = string `/pipelines/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeletePipelineResponse200 response = check self.clientEp-> delete(path, targetType = DeletePipelineResponse200);
        return response;
    }
    # Get deals conversion rates in pipeline
    #
    # + id - ID of the pipeline 
    # + startDate - Start of the period. Date in format of YYYY-MM-DD. 
    # + endDate - End of the period. Date in format of YYYY-MM-DD. 
    # + userId - ID of the user who's pipeline metrics statistics to fetch. If omitted, the authorized user will be used. 
    # + return - Get Pipeline Deals conversion rates 
    remote isolated function getPipelineConversionStatistics(int id, string startDate, string endDate, int? userId = ()) returns GetPipelineConversionStatisticsResponse200|error {
        string  path = string `/pipelines/${id}/conversion_statistics`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "user_id": userId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPipelineConversionStatisticsResponse200 response = check self.clientEp-> get(path, targetType = GetPipelineConversionStatisticsResponse200);
        return response;
    }
    # Get deals in a pipeline
    #
    # + id - ID of the pipeline 
    # + filterId - If supplied, only deals matching the given filter will be returned. 
    # + userId - If supplied, `filter_id` will not be considered and only deals owned by the given user will be returned. If omitted, deals owned by the authorized user will be returned. 
    # + everyone - If supplied, `filter_id` and `user_id` will not be considered – instead, deals owned by everyone will be returned. 
    # + stageId - If supplied, only deals within the given stage will be returned. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + getSummary - Whether to include summary of the pipeline in the `additional_data` or not. 
    # + totalsConvertCurrency - 3-letter currency code of any of the supported currencies. When supplied, `per_stages_converted` is returned inside `deals_summary` inside `additional_data` which contains the currency-converted total amounts in the given currency per each stage. You may also set this parameter to `default_currency` in which case users default currency is used. Only works when `get_summary` parameter flag is enabled. 
    # + return - Get Deals in a Stage 
    remote isolated function getPipelineDeals(int id, int? filterId = (), int? userId = (), decimal? everyone = (), int? stageId = (), int 'start = 0, int? 'limit = (), decimal? getSummary = (), string? totalsConvertCurrency = ()) returns GetStageDealsResponse200|error {
        string  path = string `/pipelines/${id}/deals`;
        map<anydata> queryParam = {"filter_id": filterId, "user_id": userId, "everyone": everyone, "stage_id": stageId, "start": 'start, "limit": 'limit, "get_summary": getSummary, "totals_convert_currency": totalsConvertCurrency, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetStageDealsResponse200 response = check self.clientEp-> get(path, targetType = GetStageDealsResponse200);
        return response;
    }
    # Get deals movements in pipeline
    #
    # + id - ID of the pipeline 
    # + startDate - Start of the period. Date in format of YYYY-MM-DD. 
    # + endDate - End of the period. Date in format of YYYY-MM-DD. 
    # + userId - ID of the user who's pipeline statistics to fetch. If omitted, the authorized user will be used. 
    # + return - Get Pipeline Deals conversion rates 
    remote isolated function getPipelineMovementStatistics(int id, string startDate, string endDate, int? userId = ()) returns GetPipelineMovementStatisticsResponse200|error {
        string  path = string `/pipelines/${id}/movement_statistics`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "user_id": userId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetPipelineMovementStatisticsResponse200 response = check self.clientEp-> get(path, targetType = GetPipelineMovementStatisticsResponse200);
        return response;
    }
    # Get all products
    #
    # + userId - If supplied, only Products owned by the given user will be returned 
    # + ids - An array of integers with the IDs of the Products that sould be returned in the response 
    # + firstChar - If supplied, only Products whose name starts with the specified letter will be returned (case insensitive) 
    # + getSummary - If supplied, response will return the total numbers of Products in the `additional_data.summary.total_count` property 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - List of products 
    remote isolated function getProducts(int? userId = (), int[]? ids = (), string? firstChar = (), boolean? getSummary = (), int 'start = 0, int? 'limit = ()) returns GetProductsResponse200|error {
        string  path = string `/products`;
        map<anydata> queryParam = {"user_id": userId, "ids": ids, "first_char": firstChar, "get_summary": getSummary, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        GetProductsResponse200 response = check self.clientEp-> get(path, targetType = GetProductsResponse200);
        return response;
    }
    # Add a product
    #
    # + payload - AddProduct request 
    # + return - Add Product data 
    remote isolated function addProduct(AddProductRequest payload) returns GetproductResponse200|error {
        string  path = string `/products`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetproductResponse200 response = check self.clientEp->post(path, request, targetType=GetproductResponse200);
        return response;
    }
    # Search products
    #
    # + term - The search term to look for. Minimum 2 characters (or 1 if using `exact_match`). 
    # + fields - A comma-separated string array. The fields to perform the search from. Defaults to all of them. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. It is <b>not</b> case sensitive. 
    # + includeFields - Supports including optional fields in the results which are not provided by default. 
    # + 'start - Pagination start. Note that the pagination is based on main results and does not include related items when using `search_for_related_items` parameter. 
    # + 'limit - Items shown per page 
    # + return - success 
    remote isolated function searchProducts(string term, string? fields = (), boolean? exactMatch = (), string? includeFields = (), int 'start = 0, int? 'limit = ()) returns SearchProductsResponse200|error {
        string  path = string `/products/search`;
        map<anydata> queryParam = {"term": term, "fields": fields, "exact_match": exactMatch, "include_fields": includeFields, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SearchProductsResponse200 response = check self.clientEp-> get(path, targetType = SearchProductsResponse200);
        return response;
    }
    # Find products by name
    #
    # + term - Search term to look for, minimum 3 characters. 
    # + currency - Currency code in which prices should be returned in. If omitted, prices in user's default currency will be returned. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Returns data about the Products that were found 
    # 
    # # Deprecated
    @deprecated
    remote isolated function findProductsByName(string term, string? currency = (), int 'start = 0, int? 'limit = ()) returns FindProductsByNameResponse200|error {
        string  path = string `/products/find`;
        map<anydata> queryParam = {"term": term, "currency": currency, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        FindProductsByNameResponse200 response = check self.clientEp-> get(path, targetType = FindProductsByNameResponse200);
        return response;
    }
    # Get one product
    #
    # + id - ID of the product 
    # + return - Get product information by id 
    remote isolated function getProduct(int id) returns GetproductResponse200|error {
        string  path = string `/products/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetproductResponse200 response = check self.clientEp-> get(path, targetType = GetproductResponse200);
        return response;
    }
    # Update a product
    #
    # + id - ID of the product 
    # + payload - Product request 
    # + return - Updates Product data 
    remote isolated function updateProduct(int id, ProductRequest payload) returns UpdateProductResponse200|error {
        string  path = string `/products/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateProductResponse200 response = check self.clientEp->put(path, request, targetType=UpdateProductResponse200);
        return response;
    }
    # Delete a product
    #
    # + id - ID of the product 
    # + return - Deletes a product 
    remote isolated function deleteProduct(int id) returns DeleteProductResponse200|error {
        string  path = string `/products/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteProductResponse200 response = check self.clientEp-> delete(path, targetType = DeleteProductResponse200);
        return response;
    }
    # Get deals where a product is attached to
    #
    # + id - ID of the product 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + status - Only fetch deals with specific status. If omitted, all not deleted deals are fetched. 
    # + return - The data of deals that have a Product attached 
    remote isolated function getProductDeals(int id, int 'start = 0, int? 'limit = (), string status = "all_not_deleted") returns BasicDeal|error {
        string  path = string `/products/${id}/deals`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "status": status, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        BasicDeal response = check self.clientEp-> get(path, targetType = BasicDeal);
        return response;
    }
    # List files attached to a product
    #
    # + id - ID of the product 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + includeDeletedFiles - When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. 
    # + sort - Field names and sorting mode separated by a comma (`field_name_1 ASC`, `field_name_2 DESC`). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment. 
    # + return - success 
    remote isolated function getProductFiles(int id, int 'start = 0, int? 'limit = (), decimal? includeDeletedFiles = (), string? sort = ()) returns GetAssociatedFilesResponse200|error {
        string  path = string `/products/${id}/files`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "include_deleted_files": includeDeletedFiles, "sort": sort, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetAssociatedFilesResponse200 response = check self.clientEp-> get(path, targetType = GetAssociatedFilesResponse200);
        return response;
    }
    # List followers of a product
    #
    # + id - ID of the product 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Lists the followers of a Product 
    remote isolated function getProductFollowers(int id, int 'start = 0, int? 'limit = ()) returns GetProductFollowersResponseSuccess|error {
        string  path = string `/products/${id}/followers`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetProductFollowersResponseSuccess response = check self.clientEp-> get(path, targetType = GetProductFollowersResponseSuccess);
        return response;
    }
    # Add a follower to a product
    #
    # + id - ID of the product 
    # + payload - AddProductFollower request 
    # + return - Adds a follower to a Product 
    remote isolated function addProductFollower(int id, AddProductFollowerRequest payload) returns NewFollowerResponse200|error {
        string  path = string `/products/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NewFollowerResponse200 response = check self.clientEp->post(path, request, targetType=NewFollowerResponse200);
        return response;
    }
    # Delete a follower from a product
    #
    # + id - ID of the product 
    # + followerId - ID of the follower 
    # + return - Deletes a follower from a Product 
    remote isolated function deleteProductFollower(int id, int followerId) returns DeleteProductFollowerResponse200|error {
        string  path = string `/products/${id}/followers/${followerId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteProductFollowerResponse200 response = check self.clientEp-> delete(path, targetType = DeleteProductFollowerResponse200);
        return response;
    }
    # List permitted users
    #
    # + id - ID of the product 
    # + return - Lists users permitted to access a Product 
    remote isolated function getProductUsers(int id) returns UserIds|error {
        string  path = string `/products/${id}/permittedUsers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserIds response = check self.clientEp-> get(path, targetType = UserIds);
        return response;
    }
    # Get all product fields
    #
    # + return - Get data about all Product Fields 
    remote isolated function getProductFields() returns GetProductFieldsResponse200|error {
        string  path = string `/productFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetProductFieldsResponse200 response = check self.clientEp-> get(path, targetType = GetProductFieldsResponse200);
        return response;
    }
    # Add a new product field
    #
    # + payload - ProductField request 
    # + return - Get the data for a single Product Field 
    remote isolated function addProductField(ProductfieldsBody payload) returns GetProductFieldResponse200|error {
        string  path = string `/productFields`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetProductFieldResponse200 response = check self.clientEp->post(path, request, targetType=GetProductFieldResponse200);
        return response;
    }
    # Delete multiple product fields in bulk
    #
    # + ids - Comma-separated field IDs to delete 
    # + return - Mark multiple Product Fields as deleted 
    remote isolated function deleteProductFields(string ids) returns DeleteProductFieldsResponse200|error {
        string  path = string `/productFields`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteProductFieldsResponse200 response = check self.clientEp-> delete(path, targetType = DeleteProductFieldsResponse200);
        return response;
    }
    # Get one product field
    #
    # + id - ID of the Product Field 
    # + return - Get the data for a single Product Field 
    remote isolated function getProductField(int id) returns GetProductFieldResponse200|error {
        string  path = string `/productFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetProductFieldResponse200 response = check self.clientEp-> get(path, targetType = GetProductFieldResponse200);
        return response;
    }
    # Update a product field
    #
    # + id - ID of the Product Field 
    # + payload - AddOrUpdateProductField request 
    # + return - Get the data for a single Product Field 
    remote isolated function updateProductField(int id, AddOrUpdateProductFieldResponse200 payload) returns GetProductFieldResponse200|error {
        string  path = string `/productFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetProductFieldResponse200 response = check self.clientEp->put(path, request, targetType=GetProductFieldResponse200);
        return response;
    }
    # Delete a product field
    #
    # + id - ID of the Product Field 
    # + return - Delete a Product Field 
    remote isolated function deleteProductField(int id) returns DeleteProductFieldResponse200|error {
        string  path = string `/productFields/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteProductFieldResponse200 response = check self.clientEp-> delete(path, targetType = DeleteProductFieldResponse200);
        return response;
    }
    # Get recents
    #
    # + sinceTimestamp - Timestamp in UTC. Format: YYYY-MM-DD HH:MM:SS 
    # + items - Multiple selection of item types to include in query (optional) 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - List of items changed since "since_timestamp" 
    remote isolated function getRecents(string sinceTimestamp, string? items = (), int 'start = 0, int? 'limit = ()) returns GetRecentsResponse200|error {
        string  path = string `/recents`;
        map<anydata> queryParam = {"since_timestamp": sinceTimestamp, "items": items, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRecentsResponse200 response = check self.clientEp-> get(path, targetType = GetRecentsResponse200);
        return response;
    }
    # Get all roles
    #
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Get all roles 
    remote isolated function getRoles(int 'start = 0, int? 'limit = ()) returns GetRolesResponse200|error {
        string  path = string `/roles`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRolesResponse200 response = check self.clientEp-> get(path, targetType = GetRolesResponse200);
        return response;
    }
    # Add a role
    #
    # + payload - AddRole request 
    # + return - Add a role 
    remote isolated function addRole(AddRoleRequest payload) returns AddRoleResponse200|error {
        string  path = string `/roles`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddRoleResponse200 response = check self.clientEp->post(path, request, targetType=AddRoleResponse200);
        return response;
    }
    # Get one role
    #
    # + id - ID of the role 
    # + return - Get one role 
    remote isolated function getRole(int id) returns GetRoleResponse200|error {
        string  path = string `/roles/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRoleResponse200 response = check self.clientEp-> get(path, targetType = GetRoleResponse200);
        return response;
    }
    # Update role details
    #
    # + id - ID of the role 
    # + payload - BaseRole request 
    # + return - Update role details 
    remote isolated function updateRole(int id, BaseRoleRequest payload) returns UpdateRoleResponse200|error {
        string  path = string `/roles/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UpdateRoleResponse200 response = check self.clientEp->put(path, request, targetType=UpdateRoleResponse200);
        return response;
    }
    # Delete a role
    #
    # + id - ID of the role 
    # + return - Delete a role 
    remote isolated function deleteRole(int id) returns DeleteRoleResponse200|error {
        string  path = string `/roles/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteRoleResponse200 response = check self.clientEp-> delete(path, targetType = DeleteRoleResponse200);
        return response;
    }
    # List role assignments
    #
    # + id - ID of the role 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - List assignments for a role 
    remote isolated function getRoleAssignments(int id, int 'start = 0, int? 'limit = ()) returns GetUserRoleAssignmentsResponse200|error {
        string  path = string `/roles/${id}/assignments`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetUserRoleAssignmentsResponse200 response = check self.clientEp-> get(path, targetType = GetUserRoleAssignmentsResponse200);
        return response;
    }
    # Add role assignment
    #
    # + id - ID of the role 
    # + payload - AddRoleAssignment request 
    # + return - Add assignment for a role 
    remote isolated function addRoleAssignment(int id, AddRoleAssignmentRequest payload) returns AddRoleAssignmentResponse200|error {
        string  path = string `/roles/${id}/assignments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddRoleAssignmentResponse200 response = check self.clientEp->post(path, request, targetType=AddRoleAssignmentResponse200);
        return response;
    }
    # Delete a role assignment
    #
    # + id - ID of the role 
    # + payload - DeleteRoleAssignment request 
    # + return - Delete assignment from a role 
    remote isolated function deleteRoleAssignment(int id, DeleteRoleAssignment payload) returns DeleteRoleAssignmentResponse200|error {
        string  path = string `/roles/${id}/assignments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        DeleteRoleAssignmentResponse200 response = check self.clientEp->delete(path, request, targetType=DeleteRoleAssignmentResponse200);
        return response;
    }
    # List role sub-roles
    #
    # + id - ID of the role 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - List role sub-roles 
    remote isolated function getRoleSubRoles(int id, int 'start = 0, int? 'limit = ()) returns GetRoleSubrolesResponse200|error {
        string  path = string `/roles/${id}/roles`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRoleSubrolesResponse200 response = check self.clientEp-> get(path, targetType = GetRoleSubrolesResponse200);
        return response;
    }
    # List role settings
    #
    # + id - ID of the role 
    # + return - List role settings 
    remote isolated function getRoleSettings(int id) returns GetRoleSettingsResponse200|error {
        string  path = string `/roles/${id}/settings`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRoleSettingsResponse200 response = check self.clientEp-> get(path, targetType = GetRoleSettingsResponse200);
        return response;
    }
    # Add or update role setting
    #
    # + id - ID of the role 
    # + payload - AddOrUpdateRoleSetting request 
    # + return - List role settings 
    remote isolated function addOrUpdateRoleSetting(int id, AddOrUpdateRoleSettingRequest payload) returns AddOrUpdateRoleSettingResponse200|error {
        string  path = string `/roles/${id}/settings`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddOrUpdateRoleSettingResponse200 response = check self.clientEp->post(path, request, targetType=AddOrUpdateRoleSettingResponse200);
        return response;
    }
    # Perform a search
    #
    # + term - Search term to look for, minimum 2 characters. 
    # + itemType - Search for items of exact type. If omitted, all types of items are searched. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. The minimum 2 character limit for the term is discarded when exact_match is enabled. It will only work if search term is 30 characters or less. 
    # + return - success 
    # 
    # # Deprecated
    @deprecated
    remote isolated function search(string term, string? itemType = (), int 'start = 0, int? 'limit = (), decimal? exactMatch = ()) returns json|error {
        string  path = string `/searchResults`;
        map<anydata> queryParam = {"term": term, "item_type": itemType, "start": 'start, "limit": 'limit, "exact_match": exactMatch, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Perform a search using a specific field value
    #
    # + term - Search term to look for, minimum 2 characters. 
    # + exactMatch - When enabled, only full exact matches against the given term are returned. By default, term can be present anywhere in the resulting field values to be considered a match. The minimum 2 character limit for the term is discarded when exact_match is enabled. 
    # + fieldType - Type of the field to perform the search from. 
    # + fieldKey - Key of the field to search from. Field key can be obtained by fetching the list of fields using any of fields API GET methods (dealFields, personFields, ..). 
    # + returnFieldKey - Name of the field in search results from which the search was performed. When omitted, 'value' will be used. You may want to set this parameter to match the field_key. 
    # + returnItemIds - Whether to return matching items IDs in search results. When omitted or set to 0, only distinct values of the searched field are returned. When enabled, the return_field_key parameter is ignored and the results include the searched field as its own key. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - success 
    # 
    # # Deprecated
    @deprecated
    remote isolated function searchByField(string term, string fieldType, string fieldKey, decimal? exactMatch = (), string? returnFieldKey = (), decimal? returnItemIds = (), int 'start = 0, int? 'limit = ()) returns json|error {
        string  path = string `/searchResults/field`;
        map<anydata> queryParam = {"term": term, "exact_match": exactMatch, "field_type": fieldType, "field_key": fieldKey, "return_field_key": returnFieldKey, "return_item_ids": returnItemIds, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get all stages
    #
    # + pipelineId - The ID of the pipeline to fetch stages for. If omitted, stages for all pipelines will be fetched. 
    # + return - Get all Stages 
    remote isolated function getStages(int? pipelineId = ()) returns GetStagesResponse200|error {
        string  path = string `/stages`;
        map<anydata> queryParam = {"pipeline_id": pipelineId, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetStagesResponse200 response = check self.clientEp-> get(path, targetType = GetStagesResponse200);
        return response;
    }
    # Add a new stage
    #
    # + payload - AddStage request 
    # + return - Get all Stages 
    remote isolated function addStage(AddStageRequest payload) returns StageResponse200|error {
        string  path = string `/stages`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        StageResponse200 response = check self.clientEp->post(path, request, targetType=StageResponse200);
        return response;
    }
    # Delete multiple stages in bulk
    #
    # + ids - Comma-separated stage IDs to delete 
    # + return - Delete multiple Stages 
    remote isolated function deleteStages(string ids) returns DeleteStagesResponse200|error {
        string  path = string `/stages`;
        map<anydata> queryParam = {"ids": ids, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteStagesResponse200 response = check self.clientEp-> delete(path, targetType = DeleteStagesResponse200);
        return response;
    }
    # Get one stage
    #
    # + id - ID of the stage 
    # + return - Get Stage 
    remote isolated function getStage(int id) returns GetStageResponse200|error {
        string  path = string `/stages/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetStageResponse200 response = check self.clientEp-> get(path, targetType = GetStageResponse200);
        return response;
    }
    # Update stage details
    #
    # + id - ID of the stage 
    # + payload - UpdateStage request 
    # + return - Get all Stages 
    remote isolated function updateStage(int id, UpdateStageRequest payload) returns StageResponse200|error {
        string  path = string `/stages/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        StageResponse200 response = check self.clientEp->put(path, request, targetType=StageResponse200);
        return response;
    }
    # Delete a stage
    #
    # + id - ID of the stage 
    # + return - Delete Stage 
    remote isolated function deleteStage(int id) returns DeleteStageResponse200|error {
        string  path = string `/stages/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        DeleteStageResponse200 response = check self.clientEp-> delete(path, targetType = DeleteStageResponse200);
        return response;
    }
    # Get deals in a stage
    #
    # + id - ID of the stage 
    # + filterId - If supplied, only deals matching the given filter will be returned. 
    # + userId - If supplied, `filter_id` will not be considered and only deals owned by the given user will be returned. If omitted, deals owned by the authorized user will be returned. 
    # + everyone - If supplied, `filter_id` and `user_id` will not be considered – instead, deals owned by everyone will be returned. 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - Get Deals in a Stage 
    remote isolated function getStageDeals(int id, int? filterId = (), int? userId = (), decimal? everyone = (), int 'start = 0, int? 'limit = ()) returns GetStageDealsResponse200|error {
        string  path = string `/stages/${id}/deals`;
        map<anydata> queryParam = {"filter_id": filterId, "user_id": userId, "everyone": everyone, "start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetStageDealsResponse200 response = check self.clientEp-> get(path, targetType = GetStageDealsResponse200);
        return response;
    }
    # Get details of a subscription
    #
    # + id - ID of the Subscription 
    # + return - success 
    remote isolated function getSubscription(int id) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SubscriptionsIdResponse200 response = check self.clientEp-> get(path, targetType = SubscriptionsIdResponse200);
        return response;
    }
    # Delete a subscription
    #
    # + id - ID of the Subscription 
    # + return - success 
    remote isolated function deleteSubscription(int id) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SubscriptionsIdResponse200 response = check self.clientEp-> delete(path, targetType = SubscriptionsIdResponse200);
        return response;
    }
    # Find subscription by deal
    #
    # + dealId - ID of the Deal 
    # + return - success 
    remote isolated function findSubscriptionByDeal(int dealId) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/find/${dealId}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        SubscriptionsIdResponse200 response = check self.clientEp-> get(path, targetType = SubscriptionsIdResponse200);
        return response;
    }
    # Get all payments of a Subscription
    #
    # + id - ID of the Subscription 
    # + return - success 
    remote isolated function getSubscriptionPayments(int id) returns PaymentResponse200|error {
        string  path = string `/subscriptions/${id}/payments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        PaymentResponse200 response = check self.clientEp-> get(path, targetType = PaymentResponse200);
        return response;
    }
    # Add a recurring subscription
    #
    # + payload - AddRecurringSubscription request 
    # + return - success 
    remote isolated function addRecurringSubscription(AddRecurringSubscriptionRequest payload) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/recurring`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriptionsIdResponse200 response = check self.clientEp->post(path, request, targetType=SubscriptionsIdResponse200);
        return response;
    }
    # Add an installment subscription
    #
    # + payload - AddSubscriptionInstallment request 
    # + return - success 
    remote isolated function addSubscriptionInstallment(AddSubscriptionInstallmentRequest payload) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/installment`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriptionsIdResponse200 response = check self.clientEp->post(path, request, targetType=SubscriptionsIdResponse200);
        return response;
    }
    # Update a recurring subscription
    #
    # + id - ID of the Subscription 
    # + payload - UpdateRecurringSubscription request 
    # + return - success 
    remote isolated function updateRecurringSubscription(int id, UpdateRecurringSubscriptionRequest payload) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/recurring/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriptionsIdResponse200 response = check self.clientEp->put(path, request, targetType=SubscriptionsIdResponse200);
        return response;
    }
    # Update an installment subscription
    #
    # + id - ID of the Subscription 
    # + payload - UpdateSubscriptionInstallment request 
    # + return - success 
    remote isolated function updateSubscriptionInstallment(int id, UpdateSubscriptionInstallmentRequest payload) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/installment/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriptionsIdResponse200 response = check self.clientEp->put(path, request, targetType=SubscriptionsIdResponse200);
        return response;
    }
    # Cancel a recurring subscription
    #
    # + id - ID of the Subscription 
    # + payload - CancelRecurringSubscription request 
    # + return - success 
    remote isolated function cancelRecurringSubscription(int id, CancelRecurringSubscriptionRequest payload) returns SubscriptionsIdResponse200|error {
        string  path = string `/subscriptions/recurring/${id}/cancel`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriptionsIdResponse200 response = check self.clientEp->put(path, request, targetType=SubscriptionsIdResponse200);
        return response;
    }
    # Get all teams
    #
    # + orderBy - Field name to sort returned teams by 
    # + skipUsers - When enabled, the teams will not include IDs of member users 
    # + return - The list of team objects 
    remote isolated function getTeams(string orderBy = "id", decimal skipUsers = 1) returns TeamsResponse200|error {
        string  path = string `/teams`;
        map<anydata> queryParam = {"order_by": orderBy, "skip_users": skipUsers, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        TeamsResponse200 response = check self.clientEp-> get(path, targetType = TeamsResponse200);
        return response;
    }
    # Add a new team
    #
    # + payload - AddTeam request 
    # + return - The team data 
    remote isolated function addTeam(AddTeamRequest payload) returns TeamResponse200|error {
        string  path = string `/teams`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TeamResponse200 response = check self.clientEp->post(path, request, targetType=TeamResponse200);
        return response;
    }
    # Get a single team
    #
    # + id - ID of the team 
    # + skipUsers - When enabled, the teams will not include IDs of member users 
    # + return - The team data 
    remote isolated function getTeam(int id, decimal skipUsers = 1) returns TeamResponse200|error {
        string  path = string `/teams/${id}`;
        map<anydata> queryParam = {"skip_users": skipUsers, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        TeamResponse200 response = check self.clientEp-> get(path, targetType = TeamResponse200);
        return response;
    }
    # Update a team
    #
    # + id - ID of the team 
    # + payload - UpdateTeam request 
    # + return - The team data 
    remote isolated function updateTeam(int id, UpdateTeamRequest payload) returns TeamResponse200|error {
        string  path = string `/teams/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TeamResponse200 response = check self.clientEp->put(path, request, targetType=TeamResponse200);
        return response;
    }
    # Get all users in a team
    #
    # + id - ID of the team 
    # + return - A list of user IDs within a team 
    remote isolated function getTeamUsers(int id) returns UserIds|error {
        string  path = string `/teams/${id}/users`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserIds response = check self.clientEp-> get(path, targetType = UserIds);
        return response;
    }
    # Add users to a team
    #
    # + id - ID of the team 
    # + payload - AddTeamUser request 
    # + return - A list of user IDs within a team 
    remote isolated function addTeamUser(int id, AddTeamUserRequest payload) returns UserIds|error {
        string  path = string `/teams/${id}/users`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserIds response = check self.clientEp->post(path, request, targetType=UserIds);
        return response;
    }
    # Delete users from a team
    #
    # + id - ID of the team 
    # + payload - DeleteTeamUser request 
    # + return - A list of user IDs within a team 
    remote isolated function deleteTeamUser(int id, DeleteTeamUserRequest payload) returns UserIds|error {
        string  path = string `/teams/${id}/users`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserIds response = check self.clientEp->delete(path, request, targetType=UserIds);
        return response;
    }
    # Get all teams of a user
    #
    # + id - ID of the user 
    # + orderBy - Field name to sort returned teams by 
    # + skipUsers - When enabled, the teams will not include IDs of member users 
    # + return - The list of team objects 
    remote isolated function getUserTeams(int id, string orderBy = "id", decimal skipUsers = 1) returns TeamsResponse200|error {
        string  path = string `/teams/user/${id}`;
        map<anydata> queryParam = {"order_by": orderBy, "skip_users": skipUsers, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        TeamsResponse200 response = check self.clientEp-> get(path, targetType = TeamsResponse200);
        return response;
    }
    # Get all users
    #
    # + return - The list of user objects 
    remote isolated function getUsers() returns UsersResponse200|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UsersResponse200 response = check self.clientEp-> get(path, targetType = UsersResponse200);
        return response;
    }
    # Add a new user
    #
    # + payload - AddUser request 
    # + return - The data of the User 
    remote isolated function addUser(AddUserRequest payload) returns UserResponse200|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UserResponse200 response = check self.clientEp->post(path, request, targetType=UserResponse200);
        return response;
    }
    # Find users by name
    #
    # + term - Search term to look for 
    # + searchByEmail - When enabled, term will only be matched against email addresses of users. Default: `false` 
    # + return - The list of user objects 
    remote isolated function findUsersByName(string term, decimal searchByEmail = 1) returns UsersResponse200|error {
        string  path = string `/users/find`;
        map<anydata> queryParam = {"term": term, "search_by_email": searchByEmail, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UsersResponse200 response = check self.clientEp-> get(path, targetType = UsersResponse200);
        return response;
    }
    # Get current user data
    #
    # + return - The data of the logged in user 
    remote isolated function getCurrentUser() returns GetCurrentUserResponse200|error {
        string  path = string `/users/me`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetCurrentUserResponse200 response = check self.clientEp-> get(path, targetType = GetCurrentUserResponse200);
        return response;
    }
    # Get one user
    #
    # + id - ID of the user 
    # + return - The data of the User 
    remote isolated function getUser(int id) returns UserResponse200|error {
        string  path = string `/users/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserResponse200 response = check self.clientEp-> get(path, targetType = UserResponse200);
        return response;
    }
    # Update user details
    #
    # + id - ID of the user 
    # + payload - UpdateUser request 
    # + return - The data of the User 
    remote isolated function updateUser(int id, UpdateUserRequest payload) returns UserResponse200|error {
        string  path = string `/users/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        UserResponse200 response = check self.clientEp->put(path, request, targetType=UserResponse200);
        return response;
    }
    # List followers of a user
    #
    # + id - ID of the user 
    # + return - The list of user IDs 
    remote isolated function getUserFollowers(int id) returns UserIds|error {
        string  path = string `/users/${id}/followers`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserIds response = check self.clientEp-> get(path, targetType = UserIds);
        return response;
    }
    # List user permissions
    #
    # + id - ID of the user 
    # + return - The list of User permissions 
    remote isolated function getUserPermissions(int id) returns GetUserPermissionsResponse200|error {
        string  path = string `/users/${id}/permissions`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetUserPermissionsResponse200 response = check self.clientEp-> get(path, targetType = GetUserPermissionsResponse200);
        return response;
    }
    # List role assignments
    #
    # + id - ID of the user 
    # + 'start - Pagination start 
    # + 'limit - Items shown per page 
    # + return - List assignments for a role 
    remote isolated function getUserRoleAssignments(int id, int 'start = 0, int? 'limit = ()) returns GetUserRoleAssignmentsResponse200|error {
        string  path = string `/users/${id}/roleAssignments`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetUserRoleAssignmentsResponse200 response = check self.clientEp-> get(path, targetType = GetUserRoleAssignmentsResponse200);
        return response;
    }
    # Add role assignment
    #
    # + id - ID of the user 
    # + payload - AddUserRoleAssignment request 
    # + return - Add assignment for a role 
    remote isolated function addUserRoleAssignment(int id, AddUserRoleAssignmentRequest payload) returns AddRoleAssignmentResponse200|error {
        string  path = string `/users/${id}/roleAssignments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        AddRoleAssignmentResponse200 response = check self.clientEp->post(path, request, targetType=AddRoleAssignmentResponse200);
        return response;
    }
    # Delete a role assignment
    #
    # + id - ID of the user 
    # + payload - DeleteUserRoleAssignment request 
    # + return - Delete assignment from a role 
    remote isolated function deleteUserRoleAssignment(int id, DeleteUserRoleAssignmentRequest payload) returns DeleteRoleAssignmentResponse200|error {
        string  path = string `/users/${id}/roleAssignments`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        DeleteRoleAssignmentResponse200 response = check self.clientEp->delete(path, request, targetType=DeleteRoleAssignmentResponse200);
        return response;
    }
    # List user role settings
    #
    # + id - ID of the user 
    # + return - List role settings 
    remote isolated function getUserRoleSettings(int id) returns GetRoleSettingsResponse200|error {
        string  path = string `/users/${id}/roleSettings`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetRoleSettingsResponse200 response = check self.clientEp-> get(path, targetType = GetRoleSettingsResponse200);
        return response;
    }
    # Get all user connections
    #
    # + return - The data of user connections 
    remote isolated function getUserConnections() returns UserConnectionsResponse200|error {
        string  path = string `/userConnections`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        UserConnectionsResponse200 response = check self.clientEp-> get(path, targetType = UserConnectionsResponse200);
        return response;
    }
    # List settings of an authorized user
    #
    # + return - The list of user settings 
    remote isolated function getUserSettings() returns GetUserSettingsResponse200|error {
        string  path = string `/userSettings`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetUserSettingsResponse200 response = check self.clientEp-> get(path, targetType = GetUserSettingsResponse200);
        return response;
    }
    # Get all webhooks
    #
    # + return - The list of webhooks objects from the logged in company and user 
    remote isolated function getWebhooks() returns GetWebhooksResponse200|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        GetWebhooksResponse200 response = check self.clientEp-> get(path, targetType = GetWebhooksResponse200);
        return response;
    }
    # Create a new webhook
    #
    # + payload - AddWebhook request 
    # + return - The created webhook object 
    remote isolated function addWebhook(AddWebhookRequest payload) returns WebhookResponse200|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        WebhookResponse200 response = check self.clientEp->post(path, request, targetType=WebhookResponse200);
        return response;
    }
    # Delete existing webhook
    #
    # + id - The ID of the webhook to delete 
    # + return - The webhook deletion success response 
    remote isolated function deleteWebhook(int id) returns BaseResponse200|error {
        string  path = string `/webhooks/${id}`;
        map<anydata> queryParam = {"api_token": self.apiKeyConfig.apiToken};
        path = path + check getPathForQueryParam(queryParam);
        BaseResponse200 response = check self.clientEp-> delete(path, targetType = BaseResponse200);
        return response;
    }
}
