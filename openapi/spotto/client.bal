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
    # To authenticate API requests, Spotto uses a header based API key scheme. To gain access to the Spotto REST API,
    # simply set the `x-api-key` header to an API Key associated with your account. If you don't have an API key,
    # [follow this guide](https://www.spotto.io/developers/using-the-spotto-api) to get one.
    # Include the header in all API calls, otherwise you will receive a `403 Forbidden` response.
    string xApiKey;
|};

# This is a generated connector for [Spotto API v1.0.0](https://api-reference.spotto.io) OpenAPI specification.
# The Spotto API provides a broad set of operations and resources that allow you to:
# - Access and manage the Spotto registry of assets, locations and readers
# - Control levels of access to Spotto applications and APIs across your account
# - Query the Spotto event log to gain valuable insights into your historical data
# - Setup event based hooks when something significant changes in Spotto.
@display {label: "Spotto", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Spotto account](https://www.spotto.io/developers) and obtain tokens by following [this guide](https://www.spotto.io/developers/using-the-spotto-api).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.spotto.cloud") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get the list of assets that belong to your account. This request will only return the first 20 assets,
    # unless otherwise specified using the `pagination` parameters below. To enrich the response with
    # additional data such as tag identifiers, location state and created/updated timestamps, check out
    # the `embed` parameter.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + ids - Lookup specific assets by passing an array of valid Spotto IDs. 
    # + tagIds - Lookup assets with specific tag IDs e.g. Beacon MAC addresses and RFID EPC codes. 
    # + hasTags - Only return assets that have tags registered. 
    # + archived - Return deleted assets, the default is false. 
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with `sortOrder`, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + search - Search query string, for lucene based full text search. 
    # + searchFuzzy - Whether or not to run the search in *fuzzy* mode. The level of fuzziness depends on the character length of search terms: - 1-2: Must match exactly. - 3-5: Off by at most 1 character. - 6+: Off by at most 2 characters. 
    # + searchFields - Reduce the scope of fields to perform the search on. When left blank it will search all of these fields. 
    # + embed - Attach additional asset information: - **meta** includes basic CRUD status information. - **tags** includes the tag IDs connected to this asset. - **lastLocation** includes the last known time and location the asset was seen. 
    # + return - 200 response 
    remote isolated function getAssets(float? page = (), float? 'limit = (), string[]? ids = (), string[]? tagIds = (), boolean? hasTags = (), boolean? archived = (), SearchableSortFields? sort = (), SortOrders? sortOrder = (), string? search = (), boolean? searchFuzzy = (), AssetSearchField[]? searchFields = (), AssetEmbedField[]? embed = ()) returns GetAssetsResponse|error {
        string  path = string `/assets`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "ids": ids, "tagIds": tagIds, "hasTags": hasTags, "archived": archived, "sort": sort, "sortOrder": sortOrder, "search": search, "searchFuzzy": searchFuzzy, "searchFields": searchFields, "embed": embed};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}, "tagIds": {style: FORM, explode: false}, "searchFields": {style: FORM, explode: false}, "embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetAssetsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetAssetsResponse);
        return response;
    }
    # Add one or more assets into the Spotto Asset registry. You can pass either a single object,
    # or an array of objects. If you already know the ID of one or more tags that will be used
    # to identify this asset, you can add them to the `tagIds` array.
    #
    # + payload - PostAssets request 
    # + return - 200 response 
    remote isolated function postAssets(PostAssetsRequest payload) returns PostAssetsResponse|error {
        string  path = string `/assets`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostAssetsResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostAssetsResponse);
        return response;
    }
    # Get the detailed information of a particular asset. Unlike the [GetAssets](/#operation/GetAssets) request,
    # this automatically attaches location state information, tag identifiers and created/updated timestamps.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getAsset(string id) returns GetAssetResponse|error {
        string  path = string `/assets/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetAssetResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetAssetResponse);
        return response;
    }
    # To update asset information, we utilise a PATCH request to support partial updates.
    # This enables any number of fields to be updated in a single request.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + payload - UpdateAsset request 
    # + return - 200 response 
    remote isolated function updateAsset(string id, UpdateAssetRequest payload) returns GetAssetResponse|error {
        string  path = string `/assets/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetAssetResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GetAssetResponse);
        return response;
    }
    # Fetch the last location of a given asset. This is essentially the same as the [GetAsset](/#operation/GetAsset) request,
    # however is optimised to return faster without resolving the additional information.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getAssetLastLocation(string id) returns GetAssetLastLocationResponse|error {
        string  path = string `/assets/${id}/location`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetAssetLastLocationResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetAssetLastLocationResponse);
        return response;
    }
    # Get the list of all events for your organisations. This request will only
    # return the first 20 events, unless otherwise specified using the pagination
    # parameters below. To enrich the response with the names of any connected entities,
    # check out the `embed` parameter.
    # 
    # ⚠️ **Warning**: Embedding the names of entities significantly impacts query time if the
    # `limit` is adjusted to return large quantities of events.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + readers - Lookup events for specific readers by passing an array of valid Spotto IDs. 
    # + locations - Lookup events for specific locations by passing an array of valid Spotto IDs. 
    # + assets - Lookup events for specific assets by passing an array of valid Spotto IDs. 
    # + 'type - Lookup events for specific event types, e.g. only show Reader Online/Offline events. 
    # + timeFrom - Filter events from a given timestamp. It will yield events up until the current server time, unless otherwise specified by `timeTo`. 
    # + timeTo - Filter events until a given timestamp. It will yield all events prior to the specified time, unless otherwise specified by `timeFrom`. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + return - 200 response 
    remote isolated function getEvents(float? page = (), float? 'limit = (), string[]? readers = (), string[]? locations = (), string[]? assets = (), EventType[]? 'type = (), float? timeFrom = (), float? timeTo = (), SortOrders? sortOrder = ()) returns GetEventsResponse|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "readers": readers, "locations": locations, "assets": assets, "type": 'type, "timeFrom": timeFrom, "timeTo": timeTo, "sortOrder": sortOrder};
        map<Encoding> queryParamEncoding = {"readers": {style: FORM, explode: false}, "locations": {style: FORM, explode: false}, "assets": {style: FORM, explode: false}, "type": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetEventsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetEventsResponse);
        return response;
    }
    # Get the credentials required to connect to the Spotto MQTT broker.
    # There is only a single set of credentials for your account, however you may connect
    # many MQTT clients by using the same username/password.
    # 
    # Your MQTT credentials should be enabled by default, but if for any reason the request
    # returns without credentials, [get in touch](https://www.spotto.io/contact) and we'll get you online.
    #
    # + return - 200 response 
    remote isolated function getMQTTSettings() returns MQTTSettings|error {
        string  path = string `/integrations/mqtt`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MQTTSettings response = check self.clientEp-> get(path, accHeaders, targetType = MQTTSettings);
        return response;
    }
    # Gets the list of levels connected to your organisation.
    # Levels allow locations to be categorised and helps Readers better assign locations to assets,
    # especially when readers between floors are competing for the best signal.
    #
    # + return - 200 response 
    remote isolated function getLevels() returns GetLevelsResponse|error {
        string  path = string `/organisations/levels`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLevelsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLevelsResponse);
        return response;
    }
    # Updates the entire list of levels in your account. Levels allow locations to be categorised and helps
    # Readers better assign locations to assets, especially when readers between floors are
    # competing for the best signal.
    # 
    # ⚠️ **Warning**: This will overwrite the existing list of Levels, so make sure that you're starting with
    # the current list of Levels, using the [GetLevels](/#operation/GetLevels) request.
    #
    # + payload - PutLevels request 
    # + return - 200 response 
    remote isolated function putLevels(PutLevelsRequest payload) returns PutLevelsResponse|error {
        string  path = string `/organisations/levels`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PutLevelsResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=PutLevelsResponse);
        return response;
    }
    # Adds a single level to your account. Levels allow locations to be categorised and helps
    # Readers better assign locations to assets, especially when readers between floors are
    # competing for the best signal.
    #
    # + payload - PostLevel request 
    # + return - 201 response 
    remote isolated function postLevel(PostLevelRequest payload) returns PostLevelResponse|error {
        string  path = string `/organisations/levels`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostLevelResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostLevelResponse);
        return response;
    }
    # Get the list of locations that belong to your account. This request will only return the first 20 locations,
    # unless otherwise specified using the `pagination` parameters below. To enrich the response with
    # additional data such as tag identifiers, connected readers and created/updated timestamps, check out
    # the `embed` parameter.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + ids - Lookup specific locations by passing an array of valid Spotto IDs. 
    # + tagIds - Lookup locations with specific tag IDs e.g. Beacon MAC addresses and RFID EPC codes. 
    # + levels - Lookup locations at specific floor levels, e.g. Ground and Level 1 ONLY. 
    # + hasTags - Only return locations that have tags registered. 
    # + hasReaders - Only return locations that have readers attached. 
    # + setupComplete - Only return locations that either have tags OR readers attached 
    # + archived - Return deleted locations, the default is false. 
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with `sortOrder`, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + search - Search query string, for lucene based full text search. 
    # + searchFuzzy - Whether or not to run the search in *fuzzy* mode. The level of fuzziness depends on the character length of search terms: - 1-2: Must match exactly. - 3-5: Off by at most 1 character. - 6+: Off by at most 2 characters. 
    # + searchFields - Reduce the scope of fields to perform the search on. When left blank it will search all of these fields. 
    # + embed - Attach additional location information: - **meta** includes basic CRUD status information. - **tags** includes the tag IDs connected to this location. - **readers** includes any readers configured at the given location. 
    # + return - 200 response 
    remote isolated function getLocations(float? page = (), float? 'limit = (), string[]? ids = (), string[]? tagIds = (), string[]? levels = (), boolean? hasTags = (), boolean? hasReaders = (), boolean? setupComplete = (), boolean? archived = (), SearchableSortFields? sort = (), SortOrders? sortOrder = (), string? search = (), boolean? searchFuzzy = (), LocationSearchField[]? searchFields = (), LocationEmbedField[]? embed = ()) returns GetLocationsResponse|error {
        string  path = string `/locations`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "ids": ids, "tagIds": tagIds, "levels": levels, "hasTags": hasTags, "hasReaders": hasReaders, "setupComplete": setupComplete, "archived": archived, "sort": sort, "sortOrder": sortOrder, "search": search, "searchFuzzy": searchFuzzy, "searchFields": searchFields, "embed": embed};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}, "tagIds": {style: FORM, explode: false}, "levels": {style: FORM, explode: false}, "searchFields": {style: FORM, explode: false}, "embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLocationsResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLocationsResponse);
        return response;
    }
    # Add one or more locations into the Spotto Location registry. You can pass either a single object,
    # or an array of objects. If you already know the ID of one or more tags that will be used
    # to identify this location, you can add them to the `tagIds` array.
    #
    # + payload - PostLocations request 
    # + return - 200 response 
    remote isolated function postLocations(PostLocationsRequest payload) returns PostLocationsResponse|error {
        string  path = string `/locations`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostLocationsResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostLocationsResponse);
        return response;
    }
    # Get the detailed information of a particular location. Unlike the [GetLocations](/#operation/GetLocations) request,
    # this automatically attaches tag identifiers, any connected readers and created/updated timestamps.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getLocation(string id) returns GetLocationResponse|error {
        string  path = string `/locations/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLocationResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLocationResponse);
        return response;
    }
    # To update location information, we utilise a PATCH request to support partial updates.
    # This enables any number of fields to be updated in a single request.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + payload - UpdateLocation request 
    # + return - 200 response 
    remote isolated function updateLocation(string id, UpdateLocationRequest payload) returns GetLocationResponse|error {
        string  path = string `/locations/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetLocationResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GetLocationResponse);
        return response;
    }
    # Fetches the list of assets that were last seen at this location. Use the timestamps against each item
    # in the response to determine if the asset is still being seen at this location.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getLocationInventory(string id) returns GetLocationInventoryResponse|error {
        string  path = string `/locations/${id}/inventory`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetLocationInventoryResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetLocationInventoryResponse);
        return response;
    }
    # Get the list of readers that belong to your account. This request will only return the first 20 readers,
    # unless otherwise specified using the `pagination` parameters below. To enrich the response with
    # additional data such as reader state information and created/updated timestamps, check out
    # the `embed` parameter.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + ids - Lookup specific readers by passing an array of valid Spotto IDs. 
    # + locationIds - Lookup readers that are positioned at specific location IDs 
    # + deviceIds - Lookup specific readers by passing an array of device IDs. These are typically the MAC address of the reader. 
    # + types - Filter based on the reader behavioural type. 
    # + deviceTypes - Lookup readers belonging to specific device types. 
    # + archived - Return deleted readers, the default is false. 
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with `sortOrder`, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + search - Search query string, for Lucene based full text search. 
    # + searchFuzzy - Whether or not to run the search in *fuzzy* mode. The level of fuzziness depends on the character length of search terms: - 1-2: Must match exactly. - 3-5: Off by at most 1 character. - 6+: Off by at most 2 characters. 
    # + searchFields - Reduce the scope of fields to perform the search on. When left blank it will search all of these fields. 
    # + embed - Attach additional reader information: - **meta** includes basic CRUD status information. - **status** includes dynamic status information about the reader such as the time it came online and when we last heard from it. 
    # + return - 200 response 
    remote isolated function getReaders(float? page = (), float? 'limit = (), string[]? ids = (), string[]? locationIds = (), string[]? deviceIds = (), ReaderType[]? types = (), DeviceType[]? deviceTypes = (), boolean? archived = (), SearchableSortFields? sort = (), SortOrders? sortOrder = (), string? search = (), boolean? searchFuzzy = (), ReaderSearchField[]? searchFields = (), ReaderEmbedField[]? embed = ()) returns GetReadersResponse|error {
        string  path = string `/readers`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "ids": ids, "locationIds": locationIds, "deviceIds": deviceIds, "types": types, "deviceTypes": deviceTypes, "archived": archived, "sort": sort, "sortOrder": sortOrder, "search": search, "searchFuzzy": searchFuzzy, "searchFields": searchFields, "embed": embed};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}, "locationIds": {style: FORM, explode: false}, "deviceIds": {style: FORM, explode: false}, "types": {style: FORM, explode: false}, "deviceTypes": {style: FORM, explode: false}, "searchFields": {style: FORM, explode: false}, "embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetReadersResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetReadersResponse);
        return response;
    }
    # Add one or more readers into the Spotto Reader registry. You can pass either a single object,
    # or an array of objects. Adding readers into the system requires a bit more information than
    # Assets or Locations. See below for more details.
    #
    # + payload - PostReaders request 
    # + return - 200 response 
    remote isolated function postReaders(PostReadersRequest payload) returns PostReadersResponse|error {
        string  path = string `/readers`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostReadersResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostReadersResponse);
        return response;
    }
    # Get the detailed information of a particular reader. Unlike the [GetReaders](/#operation/GetReaders) request,
    # this automatically attaches reader state information and created/updated timestamps.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getReader(string id) returns GetReaderResponse|error {
        string  path = string `/readers/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetReaderResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetReaderResponse);
        return response;
    }
    # To update reader information, we utilise a PATCH request to support partial updates.
    # This enables any number of fields to be updated in a single request.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + payload - UpdateReader request 
    # + return - 200 response 
    remote isolated function updateReader(string id, UpdateReaderRequest payload) returns GetReaderResponse|error {
        string  path = string `/readers/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetReaderResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GetReaderResponse);
        return response;
    }
    # Fetches the list of assets that were last seen by this reader. Use the timestamps against each item
    # in the response to determine if the asset is still being seen by this reader. You can pass in an optional
    # query to set the threshold for how recent assets must be seen to be included in the inventory.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + windowSize - Time in seconds to consider assets to be within the readers inventory 
    # + return - 200 response 
    remote isolated function getReaderInventory(string id, float? windowSize = ()) returns GetReaderInventoryResponse|error {
        string  path = string `/readers/${id}/inventory`;
        map<anydata> queryParam = {"windowSize": windowSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetReaderInventoryResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetReaderInventoryResponse);
        return response;
    }
    # Fetch the status of a given reader. This is essentially the same as the [GetReader](/#operation/GetReader) request,
    # however is optimised to return faster without resolving the additional information.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getReaderStatus(string id) returns GetReaderStatusResponse|error {
        string  path = string `/readers/${id}/status`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetReaderStatusResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetReaderStatusResponse);
        return response;
    }
    # Get the list of roles that belong to your account. This request will return all roles, without pagination.
    # It will typically only return the default roles that your account has access e.g. if you are 'Admin' it will
    # return 'Admin', 'Power User' and 'User'. If your account has custom roles it will return these instead.
    # [Get in touch](https://spotto.io/contact) if you need custom fine grained access control for your account.
    # To enrich the response with additional data such as created/updated timestamps, check out the `embed` parameter.
    #
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with *sortOrder*, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with *sort* to determine the field this is acting on. 
    # + embed - Attach additional user information: **meta** includes basic CRUD status information. 
    # + return - 200 response 
    remote isolated function getRoles(StandardSortFields? sort = (), SortOrders? sortOrder = (), RoleEmbedField[]? embed = ()) returns GetRolesResponse|error {
        string  path = string `/roles`;
        map<anydata> queryParam = {"sort": sort, "sortOrder": sortOrder, "embed": embed};
        map<Encoding> queryParamEncoding = {"embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetRolesResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetRolesResponse);
        return response;
    }
    # Get the list of triggers that belong to your account. This request will only return the first 20 triggers,
    # unless otherwise specified using the `pagination` parameters below. To enrich the response with
    # additional data such as the created/updated timestamps, check out the `embed` parameter.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + ids - Lookup specific triggers by passing an array of valid Spotto IDs. 
    # + enabled - Lookup triggers that are only enabled or disabled. 
    # + 'type - Filter based on the trigger type. 
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with `sortOrder`, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + embed - Attach additional trigger information: - **meta** includes basic CRUD status information. 
    # + return - 200 response 
    remote isolated function getTriggers(float? page = (), float? 'limit = (), string[]? ids = (), boolean? enabled = (), TriggerType? 'type = (), StandardSortFields? sort = (), SortOrders? sortOrder = (), TriggerEmbedField[]? embed = ()) returns GetTriggersResponse|error {
        string  path = string `/triggers`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "ids": ids, "enabled": enabled, "type": 'type, "sort": sort, "sortOrder": sortOrder, "embed": embed};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}, "embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetTriggersResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetTriggersResponse);
        return response;
    }
    # Add one or more triggers into the Spotto Trigger registry. You can pass either a single object,
    # or an array of objects. Triggers allow people and systems outside of Spotto to be notified when
    # something significant occurs in Spotto. We call these significant state changes **Events**
    # (see [GetEvents](/#operation/GetEvents)) that we can hook into using Triggers. Adding a trigger
    # requires us to choose which Event type we want to respond to. Each event type will have a different
    # set of rules we can apply. These are explained below:
    # 
    # - **WentOffline**: Spotto hasn't heard from a reader in a while so is transitioned to offline.
    # - **WentOnline**: Spotto heard from a reader that hadn't reported in a while so was transitioned to online.
    # - **ArrivedAt**: An asset moved to a specific location or group of locations.
    # - **Moved**: An asset moved to any location.
    # 
    # Each trigger will have `subjectRules` which allow us to filter the subject of the event either by name or ID.
    # Matching on name uses a case insensitive regular expression so we can match on multiple objects that share
    # similar names e.g. 'chair' could match names 'Wheelchair', 'M1 Shower Chair'.
    # The subject of **WentOffline** and **WentOnline** events are always the Reader (that's turning online/offline).
    # The subject of **ArrivedAt** and **Moved** can either be an Asset, or a ROVING reader moving locations.
    # 
    # **ArrivedAt** triggers also call for `locationRules` which allow us to specify either the name or ID of locations.
    # These operate in the same way as `subjectRules` and allow us to filter the range of locations that cause the trigger to fire.
    # 
    # We must also specify `actions` that fire when all the conditions are satisfied. We can add multiple actions to a trigger.
    #
    # + payload - PostTriggers request 
    # + return - 200 response 
    remote isolated function postTriggers(PostTriggersRequest payload) returns PostTriggersResponse|error {
        string  path = string `/triggers`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostTriggersResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostTriggersResponse);
        return response;
    }
    # Get the detailed information of a particular trigger. Unlike the [GetTriggers](/#operation/GetTriggers)
    # request, this automatically attaches the created/updated timestamps.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getTrigger(string id) returns GetTriggerResponse|error {
        string  path = string `/triggers/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetTriggerResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetTriggerResponse);
        return response;
    }
    # Unlike a number of the other requests, triggers does not have an impact on the
    # event log so we allow the permanent deletion of triggers. It takes no query parameters
    # or body, and returns with the standard REST deletion response of an empty object.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function deleteTrigger(string id) returns DeleteResponse|error {
        string  path = string `/triggers/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteResponse);
        return response;
    }
    # To update trigger information, we utilise a PATCH request to support partial updates.
    # This enables any number of fields to be updated in a single request.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + payload - UpdateTrigger request 
    # + return - 200 response 
    remote isolated function updateTrigger(string id, UpdateTriggerRequest payload) returns GetTriggerResponse|error {
        string  path = string `/triggers/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTriggerResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GetTriggerResponse);
        return response;
    }
    # Get the list of users that belong to your account. This request will only return the first 20 users,
    # unless otherwise specified using the `pagination` parameters below. To enrich the response with
    # additional data such as the created/updated timestamps, check out the `embed` parameter.
    #
    # + page - **Pagination:** What page of results, assuming the limit (defaulting to 20) to start from. The default is page 0 (the first page of results). e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing). 
    # + 'limit - **Pagination:** Max number of results to return in the request. The default is 20. 
    # + ids - Lookup specific users by passing an array of valid Spotto IDs. 
    # + role - Lookup users belonging to specific roles by passing an array of valid Spotto IDs. 
    # + 'type - Lookup only internal or external API users. 
    # + sort - **Sorting:** Which field the results are to be sorted by. Use in combination with `sortOrder`, the default is ascending. 
    # + sortOrder - **Sorting:** Whether to sort the results in ascending or descending order. Use in combination with `sort` to determine the field this is acting on. 
    # + embed - Attach additional user information: - **meta** includes basic CRUD status information. 
    # + return - 200 response 
    remote isolated function getUsers(float? page = (), float? 'limit = (), string[]? ids = (), string[]? role = (), UserType? 'type = (), StandardSortFields? sort = (), SortOrders? sortOrder = (), UserEmbedField[]? embed = ()) returns GetUsersResponse|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "ids": ids, "role": role, "type": 'type, "sort": sort, "sortOrder": sortOrder, "embed": embed};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: false}, "role": {style: FORM, explode: false}, "embed": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetUsersResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetUsersResponse);
        return response;
    }
    # Add one or more users into the Spotto User registry. You can only send a single object at a time
    # as there a number of provisioning steps that must occur per user.
    # 
    # You can add **EXTERNAL** users to create additional API users of varying access levels by setting the `role`.
    # **EXTERNAL** users cannot access Spotto applications and only have access to the Spotto REST API.
    # 
    # **INTERNAL** users have access to Spotto applications and require an email address for logging in.
    # A random password will be generated and sent to the elected address, unless a custom password is specified.
    # **INTERNAL** users cannot access the Spotto API, instead an **EXTERNAL** user must be created.
    #
    # + payload - PostUser request 
    # + return - 200 response 
    remote isolated function postUser(PostUserRequest payload) returns GetUserResponse|error {
        string  path = string `/users`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetUserResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetUserResponse);
        return response;
    }
    # Get the detailed information of a particular user. Unlike the [GetUsers](/#operation/GetUsers) request,
    # this automatically attaches the created/updated timestamps.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + withKey - If you have the API admin permissions you can view the API key of external users. 
    # + return - 200 response 
    remote isolated function getUser(string id, boolean? withKey = ()) returns GetUserResponse|error {
        string  path = string `/users/${id}`;
        map<anydata> queryParam = {"withKey": withKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetUserResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetUserResponse);
        return response;
    }
    # Unlike a number of the other requests, users do not have an impact on the
    # event log so we allow the permanent deletion of users. It takes no query parameters
    # or body, and returns with the standard REST deletion response of an empty object.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function deleteUser(string id) returns DeleteResponse|error {
        string  path = string `/users/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeleteResponse response = check self.clientEp-> delete(path, accHeaders, targetType = DeleteResponse);
        return response;
    }
    # To update user information, we utilise a PATCH request to support partial updates.
    # This enables any number of fields to be updated in a single request.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + payload - UpdateUser request 
    # + return - 200 response 
    remote isolated function updateUser(string id, UpdateUserRequest payload) returns GetUserResponse|error {
        string  path = string `/users/${id}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetUserResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GetUserResponse);
        return response;
    }
    # Access the API key for a specific **EXTERNAL** user. This request takes no query parameters.
    #
    # + id - Spotto ID for this object, should look something like this: `6161acddc5a257c8c7d6b60e` 
    # + return - 200 response 
    remote isolated function getKey(string id) returns GetKeyResponse|error {
        string  path = string `/users/${id}/key`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetKeyResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetKeyResponse);
        return response;
    }
}
