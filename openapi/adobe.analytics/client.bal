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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://account-d.docusign.com/oauth/token";
|};

# The Adobe Analytics 2.0 APIs allow you to directly call Adobe's servers to perform almost any action that you can perform in the user interface. You can create reports to explore, get insights, or answer important questions about your data. You can also manage components of Adobe Analytics, such as the creation of segments or calculated metrics.
@display {label: "Adobe Analytics", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Adobe Developer account](https://developer.adobe.com) and obtain tokens by following [this guide](https://developer.adobe.com/analytics-apis/docs/2.0/guides/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://analytics.adobe.io/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieve many calculated metrics
    #
    # + rsids - Filter list to only include calculated metrics tied to specified RSID list (comma-delimited) 
    # + ownerId - Filter list to only include calculated metrics owned by the specified loginId 
    # + filterByIds - Filter list to only include calculated metrics in the specified list (comma-delimited list of IDs) (this is the same as calculatedMetricFilter, and is overwritten by calculatedMetricFilter 
    # + toBeUsedInRsid - The report suite where the calculated metric intended to be used.  This report suite will be used to determine things like compatibility and permissions.  If it is not specified then the permissions will be calculated based on the union of all metrics authorized in all groups the user belongs to.  If the compatibility expansion is specified and toBeUsedInRsid is not then the compatibility returned is based off the compatibility from the last time the calculated metric was saved. 
    # + locale - Locale 
    # + name - Filter list to only include calculated metrics that contains the Name 
    # + tagNames - Filter list to only include calculated metrics that contains one of the tags 
    # + favorite - Filter list to only include calculated metrics that are favorites 
    # + approved - Filter list to only include calculated metrics that are approved 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + sortDirection - Sort direction (ASC or DESC) 
    # + sortProperty - Property to sort by (name, modified_date, id is currently allowed) 
    # + expansion - Comma-delimited list of additional calculated metric metadata fields to include on response. 
    # + includeType - Include additional calculated metrics not owned by user. The "all" option takes precedence over "shared" 
    # + return - successful operation 
    remote isolated function findCalculatedMetrics(string? rsids = (), int? ownerId = (), string? filterByIds = (), string? toBeUsedInRsid = (), string locale = "en_US", string? name = (), string? tagNames = (), boolean? favorite = (), boolean? approved = (), int 'limit = 10, int page = 0, string sortDirection = "ASC", string sortProperty = "id", string[]? expansion = (), string[]? includeType = ()) returns AnalyticsCalculatedMetric[]|error {
        string resourcePath = string `/calculatedmetrics`;
        map<anydata> queryParam = {"rsids": rsids, "ownerId": ownerId, "filterByIds": filterByIds, "toBeUsedInRsid": toBeUsedInRsid, "locale": locale, "name": name, "tagNames": tagNames, "favorite": favorite, "approved": approved, "limit": 'limit, "page": page, "sortDirection": sortDirection, "sortProperty": sortProperty, "expansion": expansion, "includeType": includeType};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}, "includeType": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsCalculatedMetric[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new Calculated Metric
    #
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional calculated metric metadata fields to include on response. 
    # + payload - JSON-formatted Object containing key/value pairs for calculated metric creation. 
    # + return - successful operation 
    remote isolated function createCalculatedMetric(AnalyticsCalculatedMetric payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsCalculatedMetric|error {
        string resourcePath = string `/calculatedmetrics`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyticsCalculatedMetric response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve calculated metric functions
    #
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function getCalculatedMetricFunctions(string locale = "en_US") returns CalcMetricFunction[]|error {
        string resourcePath = string `/calculatedmetrics/functions`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CalcMetricFunction[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a calculated metric function by id
    #
    # + id - The function ID to retrieve 
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function getCalculatedMetricFunction(string id, string locale = "en_US") returns CalcMetricFunction|error {
        string resourcePath = string `/calculatedmetrics/functions/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CalcMetricFunction response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Validate a calculated metric definition
    #
    # + locale - Locale 
    # + migrating - Include migration functions in validation 
    # + payload - JSON-formatted Object containing key/value pairs for calculated metric validation. 
    # + return - successful operation 
    remote isolated function validateCalculatedMetric(AnalyticsCalculatedMetric payload, string locale = "en_US", boolean migrating = false) returns AnalyticsCalculatedMetric|error {
        string resourcePath = string `/calculatedmetrics/validate`;
        map<anydata> queryParam = {"locale": locale, "migrating": migrating};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyticsCalculatedMetric response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a single calculated metric by id
    #
    # + id - The calculated metric ID to retrieve 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional calculated metric metadata fields to include on response. 
    # + return - successful operation 
    remote isolated function findOneCalculatedMetric(string id, string locale = "en_US", string[]? expansion = ()) returns AnalyticsCalculatedMetric|error {
        string resourcePath = string `/calculatedmetrics/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsCalculatedMetric response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an existing calculated metric
    #
    # + id - Calculated Metric ID to be updated 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional calculated metric metadata fields to include on response. 
    # + payload - JSON-formatted Object containing key/value pairs to be updated. 
    # + return - successful operation 
    remote isolated function updateCalculatedMetric(string id, AnalyticsCalculatedMetric payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsCalculatedMetric|error {
        string resourcePath = string `/calculatedmetrics/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyticsCalculatedMetric response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletion of Calculated Metrics by Id
    #
    # + id - The calculated metric ID to be deleted 
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function deleteCalculatedMetric(string id, string locale = "en_US") returns DeleteResponse|error {
        string resourcePath = string `/calculatedmetrics/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves report suites that match the given filters.
    #
    # + rsids - Filter list to only include suites in this RSID list (comma-delimited) 
    # + rsidContains - Filter list to only include suites whose rsid contains rsidContains. 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + expansion - Comma-delimited list of additional metadata fields to include on response. 
    # + return - successful operation 
    remote isolated function listReportSuites(string? rsids = (), string? rsidContains = (), int 'limit = 10, int page = 0, string[]? expansion = ()) returns SuiteCollectionItem|error {
        string resourcePath = string `/collections/suites`;
        map<anydata> queryParam = {"rsids": rsids, "rsidContains": rsidContains, "limit": 'limit, "page": page, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SuiteCollectionItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves report suite by id
    #
    # + rsid - The rsid of the suite to return 
    # + expansion - Comma-delimited list of additional metadata fields to include on response. 
    # + return - successful operation 
    remote isolated function getReportSuite(string rsid, string[]? expansion = ()) returns SuiteCollectionItem|error {
        string resourcePath = string `/collections/suites/${getEncodedUri(rsid)}`;
        map<anydata> queryParam = {"expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SuiteCollectionItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # search for tags for several components at once
    #
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + payload - items to search for 
    # + return - successful operation 
    remote isolated function searchComponentTags(ComponentSearch payload, int 'limit = 10, int page = 0) returns TaggedComponent|error {
        string resourcePath = string `/componentmetadata/tags/component/search`;
        map<anydata> queryParam = {"limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaggedComponent response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of tags for the current user's company
    #
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + return - successful operation 
    remote isolated function findAllTagsForCompany(int 'limit = 10, int page = 0) returns Tag[]|error {
        string resourcePath = string `/componentmetadata/tags`;
        map<anydata> queryParam = {"limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tag[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Saves the given tag(s) for the current user's company
    #
    # + payload - JSON-formatted array of Tag objects containing key-value pairs 
    # + return - successful operation 
    remote isolated function saveTagListForCompany(Tag[] payload) returns Tag[]|error {
        string resourcePath = string `/componentmetadata/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Tag[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Disassociates all tags from the given components
    #
    # + componentIds - Comma-separated list of componentIds to operate on. 
    # + componentType - The component type to operate on. 
    # + return - successful operation 
    remote isolated function deleteTagItemsFromComponents(string componentIds, string componentType) returns record {}[]|error {
        string resourcePath = string `/componentmetadata/tags`;
        map<anydata> queryParam = {"componentIds": componentIds, "componentType": componentType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        record {}[] response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves a tags for a given component by componentId and componentType
    #
    # + componentId - The componentId to operate on. Currently this is just the segmentId. 
    # + componentType - The component type to operate on. 
    # + return - successful operation 
    remote isolated function getTagListByComponentIdAndComponentType(string componentId, string componentType) returns Tag[]|error {
        string resourcePath = string `/componentmetadata/tags/search`;
        map<anydata> queryParam = {"componentId": componentId, "componentType": componentType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tag[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Tag a component with one or many tags at once. WARNING: Authoritative; deletes/overwrites all pre-existing associations
    #
    # + payload - JSON-formatted object containing key-value pairs that conform to the schema 
    # + return - successful operation 
    remote isolated function saveTagComponentList(TaggedComponent[] payload) returns TaggedComponent[]|error {
        string resourcePath = string `/componentmetadata/tags/tagitems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaggedComponent[] response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Retrieves an tag by its id
    #
    # + id - Tag ID to be retrieved 
    # + return - successful operation 
    remote isolated function getTagById(int id) returns Tag|error {
        string resourcePath = string `/componentmetadata/tags/${getEncodedUri(id)}`;
        Tag response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Removes the tagId and all associations from that tag to any components
    #
    # + id - The tagId to be deleted 
    # + return - successful operation 
    remote isolated function deleteTag(int id) returns record {}[]|error {
        string resourcePath = string `/componentmetadata/tags/${getEncodedUri(id)}`;
        record {}[] response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves component ids associated with the given tag names
    #
    # + tagNames - Comma separated list of tag names. 
    # + componentType - The component type to operate on. 
    # + return - successful operation 
    remote isolated function getComponentsByTagName(string tagNames, string componentType) returns string[]|error {
        string resourcePath = string `/componentmetadata/tags/tagnames`;
        map<anydata> queryParam = {"tagNames": tagNames, "componentType": componentType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # search for shares for several components at once
    #
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + payload - items to search for 
    # + return - successful operation 
    remote isolated function searchComponentShares(ComponentSearch payload, int 'limit = 10, int page = 0) returns SharedComponent|error {
        string resourcePath = string `/componentmetadata/shares/component/search`;
        map<anydata> queryParam = {"limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SharedComponent response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # get components shared with the current user by type
    #
    # + componentType - Component type to get shared ids for 
    # + return - successful operation 
    remote isolated function getComponentsSharedToMe(string componentType) returns string[]|error {
        string resourcePath = string `/componentmetadata/shares/sharedto/me`;
        map<anydata> queryParam = {"componentType": componentType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of shares for the current user's company
    #
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + return - successful operation 
    remote isolated function findAllSharesForCompany(int 'limit = 10, int page = 0) returns Share[]|error {
        string resourcePath = string `/componentmetadata/shares`;
        map<anydata> queryParam = {"limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Share[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Share components with users. WARNING: Authoritative; deletes/overwrites all pre-existing shares for the given components
    #
    # + payload - JSON-formatted array of Share objects containing key-value pairs 
    # + return - successful operation 
    remote isolated function updateSharesForComponents(byte[] payload) returns SharedComponent|error {
        string resourcePath = string `/componentmetadata/shares`;
        http:Request request = new;
        request.setPayload(payload);
        SharedComponent response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Saves the given share for the current user's company
    #
    # + payload - JSON-formatted array of Share objects containing key-value pairs 
    # + return - successful operation 
    remote isolated function saveShareMyCompany(Share payload) returns Share|error {
        string resourcePath = string `/componentmetadata/shares`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Share response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves an share by its id
    #
    # + id - Share ID to be retrieved 
    # + return - successful operation 
    remote isolated function getShareById(int id) returns Share|error {
        string resourcePath = string `/componentmetadata/shares/${getEncodedUri(id)}`;
        Share response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Removes the shareId and all associations from that share
    #
    # + id - The shareId to be deleted 
    # + return - successful operation 
    remote isolated function deleteShare(int id) returns InlineResponse200|error {
        string resourcePath = string `/componentmetadata/shares/${getEncodedUri(id)}`;
        InlineResponse200 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of dateranges for the user
    #
    # + locale - Locale 
    # + filterByIds - Filter list to only include date ranges in the specified list (comma-delimited list of IDs) 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + expansion - Comma-delimited list of additional date range metadata fields to include on response. 
    # + includeType - Include additional date ranges not owned by user. The "all" option takes precedence over "shared" 
    # + return - successful operation 
    remote isolated function getDateRangesForUser(string locale = "en_US", string? filterByIds = (), int 'limit = 10, int page = 0, string[]? expansion = (), string[]? includeType = ()) returns AnalyticsDateRange|error {
        string resourcePath = string `/dateranges`;
        map<anydata> queryParam = {"locale": locale, "filterByIds": filterByIds, "limit": 'limit, "page": page, "expansion": expansion, "includeType": includeType};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}, "includeType": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsDateRange response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates configuration for a DateRange.
    #
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional date range metadata fields to include on response. 
    # + payload - JSON-formatted array of Date Range objects containing key-value pairs 
    # + return - successful operation 
    remote isolated function createDateRange(byte[] payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsDateRange|error {
        string resourcePath = string `/dateranges`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        request.setPayload(payload);
        AnalyticsDateRange response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves configuration for a DateRange.
    #
    # + dateRangeId - The DateRange id for which to retrieve information 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional date range metadata fields to include on response. 
    # + return - successful operation 
    remote isolated function getDateRange(string dateRangeId, string locale = "en_US", string[]? expansion = ()) returns AnalyticsDateRange|error {
        string resourcePath = string `/dateranges/${getEncodedUri(dateRangeId)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsDateRange response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates configuration for a DateRange.
    #
    # + dateRangeId - The DateRange id for which to retrieve information 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional date range metadata fields to include on response. 
    # + payload - JSON-formatted array of Date Range objects containing key-value pairs 
    # + return - successful operation 
    remote isolated function updateDateRange(string dateRangeId, byte[] payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsDateRange|error {
        string resourcePath = string `/dateranges/${getEncodedUri(dateRangeId)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        request.setPayload(payload);
        AnalyticsDateRange response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a DateRange.
    #
    # + dateRangeId - The id of the date range to delete 
    # + return - successful operation 
    remote isolated function deleteDateRange(string dateRangeId) returns InlineResponse2001|error {
        string resourcePath = string `/dateranges/${getEncodedUri(dateRangeId)}`;
        InlineResponse2001 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of dimensions for a given report suite.
    #
    # + rsid - A Report Suite ID 
    # + locale - Locale 
    # + segmentable - Only include dimensions that are valid within a segment. 
    # + reportable - Only include dimensions that are valid within a report. 
    # + classifiable - Only include classifiable dimensions. 
    # + expansion - Add extra metadata to items (comma-delimited list) 
    # + return - successful operation 
    remote isolated function getDimensionsForReportSuite(string rsid, string locale = "en_US", boolean? segmentable = (), boolean? reportable = (), boolean classifiable = false, string[]? expansion = ()) returns AnalyticsDimension[]|error {
        string resourcePath = string `/dimensions`;
        map<anydata> queryParam = {"rsid": rsid, "locale": locale, "segmentable": segmentable, "reportable": reportable, "classifiable": classifiable, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsDimension[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a dimension for the given report suite
    #
    # + dimensionId - The dimension ID. For example a valid id is a value like 'evar1' 
    # + rsid - The report suite ID. 
    # + locale - The locale to use for returning system named dimensions. 
    # + expansion - Add extra metadata to items (comma-delimited list) 
    # + return - successful operation 
    remote isolated function getDimensionForReportSuite(string dimensionId, string rsid, string locale = "en_US", string[]? expansion = ()) returns AnalyticsDimension|error {
        string resourcePath = string `/dimensions/${getEncodedUri(dimensionId)}`;
        map<anydata> queryParam = {"rsid": rsid, "locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsDimension response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of metrics for the given report suite
    #
    # + rsid - ID of desired report suite ie. myrsid 
    # + locale - Locale that system named metrics should be returned in 
    # + segmentable - Filter the metrics by if they are valid in a segment. 
    # + expansion - Add extra metadata to items (comma-delimited list) 
    # + return - successful operation 
    remote isolated function getMetricsForReportSuite(string rsid, string locale = "en_US", boolean segmentable = false, string[]? expansion = ()) returns AnalyticsMetric|error {
        string resourcePath = string `/metrics`;
        map<anydata> queryParam = {"rsid": rsid, "locale": locale, "segmentable": segmentable, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsMetric response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a metric for the given report suite
    #
    # + id - The id of the metric for which to retrieve info. Note ids are values like pageviews, not metrics/pageviews 
    # + rsid - ID of desired report suite ie. myrsid 
    # + locale - Locale that system named metrics should be returned in 
    # + expansion - Add extra metadata to items (comma-delimited list) 
    # + return - successful operation 
    remote isolated function getMetricForReportSuite(string id, string rsid, string locale = "en_US", string[]? expansion = ()) returns AnalyticsMetric|error {
        string resourcePath = string `/metrics/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"rsid": rsid, "locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsMetric response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves configuration for a Project.
    #
    # + projectId - The Project id for which to retrieve information 
    # + expansion - Comma-delimited list of additional project metadata fields to include on response. 
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function getProjectConfiguration(string projectId, string[]? expansion = (), string locale = "en_US") returns AnalyticsProject|error {
        string resourcePath = string `/projects/${getEncodedUri(projectId)}`;
        map<anydata> queryParam = {"expansion": expansion, "locale": locale};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsProject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates configuration for a project.
    #
    # + projectId - The Project id for which to retrieve information 
    # + expansion - Comma-delimited list of additional project metadata fields to include on response. 
    # + locale - Locale 
    # + payload - JSON-formatted Object containing project keys/value pairs to be updated. 
    # + return - successful operation 
    remote isolated function updateProjectConfiguration(string projectId, byte[] payload, string[]? expansion = (), string locale = "en_US") returns AnalyticsProject|error {
        string resourcePath = string `/projects/${getEncodedUri(projectId)}`;
        map<anydata> queryParam = {"expansion": expansion, "locale": locale};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        request.setPayload(payload);
        AnalyticsProject response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # deletes a project.
    #
    # + projectId - The Project id for which to retrieve information 
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function deleteProject(string projectId, string locale = "en_US") returns DeleteResponse|error {
        string resourcePath = string `/projects/${getEncodedUri(projectId)}`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Validates a Project definition
    #
    # + locale - Locale 
    # + payload - JSON-formatted Object containing key/value pairs for Project validation. 
    # + return - successful operation 
    remote isolated function validateProjectDefinition(ProjectsValidateBody payload, string locale = "en_US") returns ProjectCompatibility|error {
        string resourcePath = string `/projects/validate`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectCompatibility response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of projects for the user
    #
    # + includeType - Include additional projects not owned by user. The "all" option takes precedence over "shared". If neither guided, or project is included, both types are returned 
    # + expansion - Comma-delimited list of additional project metadata fields to include on response. 
    # + filterByIds - Filter list to only include projects in the specified list (comma-delimited list of IDs) 
    # + locale - Locale 
    # + pagination - return paginated results 
    # + ownerId - Filter list to only include projects owned by the specified loginId 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + return - successful operation 
    remote isolated function getProjectsOfUser(string[]? includeType = (), string[]? expansion = (), string? filterByIds = (), string locale = "en_US", string pagination = "false", int? ownerId = (), int 'limit = 10, int page = 0) returns AnalyticsProject[]|error {
        string resourcePath = string `/projects`;
        map<anydata> queryParam = {"includeType": includeType, "expansion": expansion, "filterByIds": filterByIds, "locale": locale, "pagination": pagination, "ownerId": ownerId, "limit": 'limit, "page": page};
        map<Encoding> queryParamEncoding = {"includeType": {style: FORM, explode: false}, "expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsProject[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a single project.
    #
    # + expansion - Comma-delimited list of additional project metadata fields to include on response. 
    # + locale - Locale 
    # + payload - JSON-formatted Object containing project keys/value pairs to be updated. 
    # + return - successful operation 
    remote isolated function createProject(byte[] payload, string[]? expansion = (), string locale = "en_US") returns AnalyticsProject|error {
        string resourcePath = string `/projects`;
        map<anydata> queryParam = {"expansion": expansion, "locale": locale};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        request.setPayload(payload);
        AnalyticsProject response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Runs a report for the request in the post body
    #
    # + payload - Ranked report request 
    # + return - Successful operation 
    remote isolated function runReport(RankedRequest payload) returns RankedReportData|error {
        string resourcePath = string `/reports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RankedReportData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Runs a top items report for the request in the post body
    #
    # + rsid - ID of desired report suite ie. myrsid 
    # + dimension - Dimension to run the report against. Example: 'variables/page' 
    # + locale - Locale that system named metrics should be returned in 
    # + dateRange - Format: YYYY-MM-DD/YYYY-MM-DD 
    # + searchClause - General search string; wrap with single quotes. Example: 'PageABC' 
    # + startDate - Format: YYYY-MM-DD 
    # + endDate - Format: YYYY-MM-DD 
    # + searchAnd - Search terms that will be AND-ed together. Space delimited. 
    # + searchOr - Search terms that will be OR-ed together. Space delimited. 
    # + searchNot - Search terms that will be treated as NOT including. Space delimited. 
    # + searchPhrase - A full search phrase that will be searched for. 
    # + lookupNoneValues - Controls None values to be included 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + return - Successful operation 
    remote isolated function runTopItemReport(string rsid, string dimension, string locale = "en_US", string? dateRange = (), string? searchClause = (), string? startDate = (), string? endDate = (), string? searchAnd = (), string? searchOr = (), string? searchNot = (), string? searchPhrase = (), boolean lookupNoneValues = true, int 'limit = 10, int page = 0) returns UnhashReportData|error {
        string resourcePath = string `/reports/topItems`;
        map<anydata> queryParam = {"rsid": rsid, "dimension": dimension, "locale": locale, "dateRange": dateRange, "search-clause": searchClause, "startDate": startDate, "endDate": endDate, "searchAnd": searchAnd, "searchOr": searchOr, "searchNot": searchNot, "searchPhrase": searchPhrase, "lookupNoneValues": lookupNoneValues, "limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UnhashReportData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve All Segments
    #
    # + rsids - Filter list to only include segments tied to specified RSID list (comma-delimited) 
    # + segmentFilter - Filter list to only include segments in the specified list (comma-delimited list of IDs) 
    # + locale - Locale 
    # + name - Filter list to only include segments that contains the Name 
    # + tagNames - Filter list to only include segments that contains one of the tags 
    # + filterByPublishedSegments - Filter list to only include segments where the published field is set to one of the allowable values (all, true, false). 
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + sortDirection - Sort direction (ASC or DESC 
    # + sortProperty - Property to sort by (name, modified_date, id is currently allowed) 
    # + expansion - Comma-delimited list of additional segment metadata fields to include on response. 
    # + includeType - Include additional segments not owned by user. The "all" option takes precedence over "shared" 
    # + return - successful operation 
    remote isolated function getAllSegments(string? rsids = (), string? segmentFilter = (), string locale = "en_US", string? name = (), string? tagNames = (), string filterByPublishedSegments = "all", int 'limit = 10, int page = 0, string sortDirection = "ASC", string sortProperty = "id", string[]? expansion = (), string[]? includeType = ()) returns AnalyticsSegmentResponseItem|error {
        string resourcePath = string `/segments`;
        map<anydata> queryParam = {"rsids": rsids, "segmentFilter": segmentFilter, "locale": locale, "name": name, "tagNames": tagNames, "filterByPublishedSegments": filterByPublishedSegments, "limit": 'limit, "page": page, "sortDirection": sortDirection, "sortProperty": sortProperty, "expansion": expansion, "includeType": includeType};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}, "includeType": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsSegmentResponseItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates Segment
    #
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional segment metadata fields to include on response. 
    # + payload - JSON-formatted Object containing key/value pairs for segment creation. 
    # + return - successful operation 
    remote isolated function createSegment(AnalyticsSegment payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsSegmentResponseItem|error {
        string resourcePath = string `/segments`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyticsSegmentResponseItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Validate a Segment
    #
    # + rsid - RSID to run the report against 
    # + payload - Segment definition 
    # + return - successful operation 
    remote isolated function validateSegment(string rsid, string payload) returns SegmentCompatibility|error {
        string resourcePath = string `/segments/validate`;
        map<anydata> queryParam = {"rsid": rsid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SegmentCompatibility response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a Single Segment
    #
    # + id - The segment ID to retrieve 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional segment metadata fields to include on response. 
    # + return - successful operation 
    remote isolated function getSegment(string id, string locale = "en_US", string[]? expansion = ()) returns AnalyticsSegmentResponseItem|error {
        string resourcePath = string `/segments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AnalyticsSegmentResponseItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Segment
    #
    # + id - Segment ID to be updated 
    # + locale - Locale 
    # + expansion - Comma-delimited list of additional segment metadata fields to include on response. 
    # + payload - JSON-formatted Object containing key/value pairs to be updated. 
    # + return - successful operation 
    remote isolated function updateSegment(string id, json payload, string locale = "en_US", string[]? expansion = ()) returns AnalyticsSegmentResponseItem|error {
        string resourcePath = string `/segments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale, "expansion": expansion};
        map<Encoding> queryParamEncoding = {"expansion": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalyticsSegmentResponseItem response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete Segment
    #
    # + id - The segment ID to be deleted 
    # + locale - Locale 
    # + return - successful operation 
    remote isolated function deleteSegment(string id, string locale = "en_US") returns string|error {
        string resourcePath = string `/segments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of users for the current user's login company
    #
    # + 'limit - Number of results per page 
    # + page - Page number (base 0 - first page is "0") 
    # + return - successful operation 
    remote isolated function listAllUsersForCompany(int 'limit = 10, int page = 0) returns AnalyticsUser[]|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AnalyticsUser[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the current user
    #
    # + return - successful operation 
    remote isolated function getCurrentUser() returns AnalyticsUser|error {
        string resourcePath = string `/users/me`;
        AnalyticsUser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves usage and access logs for the search criteria provided.
    #
    # + startDate - Start date for the maximum of a 3 month period. 
    # + endDate - End date for the maximum of a 3 month period. 
    # + login - The login value of the user you want to filter logs by. 
    # + ip - The IP address you want to filter logs by. 
    # + rsid - The report suite ID you want to filter logs by. 
    # + eventType - The numeric id for the event type you want to filter logs by. 
    # + event - The event description you want to filter logs by. No wildcards permitted. 
    # + 'limit - Number of results per page. 
    # + page - Page number (base 0 - first page is "0"). 
    # + return - Successful 
    remote isolated function getUsageAccessLogs(string startDate, string endDate, string? login = (), string? ip = (), string? rsid = (), string? eventType = (), string? event = (), int 'limit = 10, int page = 0) returns ResponsePageUsageLogDto|error {
        string resourcePath = string `/auditlogs/usage`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate, "login": login, "ip": ip, "rsid": rsid, "eventType": eventType, "event": event, "limit": 'limit, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ResponsePageUsageLogDto response = check self.clientEp->get(resourcePath);
        return response;
    }
}
