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
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# This is a generated connector from [Azure Time Series Insights API 2020-07-31 version](https://azure.microsoft.com/en-us/services/time-series-insights/) OpenAPI specification.
# Time Series Insights environment data plane client for Gen2 (GA L1 SKU) environments.
@display {label: "Azure Timeseries", iconPath: "resources/azure.timeseries.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure  Time Series Insights account](https://azure.microsoft.com/en-us/services/time-series-insights/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/azure/time-series-insights/time-series-insights-authentication-and-authorization).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns the time range and distribution of event count over the event timestamp ($ts). This API can be used to provide landing experience of navigating to the environment.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + storeType - For the environments with warm store enabled, the query can be executed either on the 'WarmStore' or 'ColdStore'. This parameter in the query defines which store the query should be executed on. If not defined, the query will be executed on the cold store. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function queryGetavailability(string apiVersion, string? storeType = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns AvailabilityResponse|error {
        string  path = string `/availability`;
        map<anydata> queryParam = {"api-version": apiVersion, "storeType": storeType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AvailabilityResponse response = check self.clientEp-> get(path, accHeaders, targetType = AvailabilityResponse);
        return response;
    }
    # Returns environment event schema for a given search span. Event schema is a set of property definitions. Event schema may not be contain all persisted properties when there are too many properties.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Parameters to get event schema. 
    # + storeType - For the environments with warm store enabled, the query can be executed either on the 'WarmStore' or 'ColdStore'. This parameter in the query defines which store the query should be executed on. If not defined, the query will be executed on the cold store. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function queryGeteventschema(string apiVersion, GetEventSchemaRequest payload, string? storeType = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns EventSchema|error {
        string  path = string `/eventSchema`;
        map<anydata> queryParam = {"api-version": apiVersion, "storeType": storeType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EventSchema response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EventSchema);
        return response;
    }
    # Returns the model settings which includes model display name, Time Series ID properties and default type ID. Every Gen2 environment has a model that is automatically created.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function modelsettingsGet(string apiVersion, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns ModelSettingsResponse|error {
        string  path = string `/timeseries/modelSettings`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ModelSettingsResponse response = check self.clientEp-> get(path, accHeaders, targetType = ModelSettingsResponse);
        return response;
    }
    # Updates time series model settings - either the model name or default type ID.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Model settings update request body. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation returns new full model settings. 
    remote isolated function modelsettingsUpdate(string apiVersion, UpdateModelSettingsRequest payload, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns ModelSettingsResponse|error {
        string  path = string `/timeseries/modelSettings`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ModelSettingsResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ModelSettingsResponse);
        return response;
    }
    # Executes Time Series Query in pages of results - Get Events, Get Series or Aggregate Series.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series query request body. 
    # + storeType - For the environments with warm store enabled, the query can be executed either on the 'WarmStore' or 'ColdStore'. This parameter in the query defines which store the query should be executed on. If not defined, the query will be executed on the cold store. 
    # + xMsContinuation - Continuation token from previous page of results to retrieve the next page of the results in calls that support pagination. To get the first page results, specify null continuation token as parameter value. Returned continuation token is null if all results have been returned, and there is no next page of results. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful query. 
    remote isolated function queryExecute(string apiVersion, QueryRequest payload, string? storeType = (), string? xMsContinuation = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns QueryResultPage|error {
        string  path = string `/timeseries/query`;
        map<anydata> queryParam = {"api-version": apiVersion, "storeType": storeType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-continuation": xMsContinuation, "x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        QueryResultPage response = check self.clientEp->post(path, request, headers = accHeaders, targetType=QueryResultPage);
        return response;
    }
    # Gets time series instances in pages.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + xMsContinuation - Continuation token from previous page of results to retrieve the next page of the results in calls that support pagination. To get the first page results, specify null continuation token as parameter value. Returned continuation token is null if all results have been returned, and there is no next page of results. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeseriesinstancesList(string apiVersion, string? xMsContinuation = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns GetInstancesPage|error {
        string  path = string `/timeseries/instances`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-continuation": xMsContinuation, "x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetInstancesPage response = check self.clientEp-> get(path, accHeaders, targetType = GetInstancesPage);
        return response;
    }
    # Executes a batch get, create, update, delete operation on multiple time series instances.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series instances suggest request body. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeseriesinstancesExecutebatch(string apiVersion, InstancesBatchRequest payload, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns InstancesBatchResponse|error {
        string  path = string `/timeseries/instances/$batch`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstancesBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InstancesBatchResponse);
        return response;
    }
    # Suggests keywords based on time series instance attributes to be later used in Search Instances.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series instances suggest request body. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeseriesinstancesSuggest(string apiVersion, InstancesSuggestRequest payload, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns InstancesSuggestResponse|error {
        string  path = string `/timeseries/instances/suggest`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstancesSuggestResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InstancesSuggestResponse);
        return response;
    }
    # Partial list of hits on search for time series instances based on instance attributes.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series instances search request body. 
    # + xMsContinuation - Continuation token from previous page of results to retrieve the next page of the results in calls that support pagination. To get the first page results, specify null continuation token as parameter value. Returned continuation token is null if all results have been returned, and there is no next page of results. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful search response. 
    remote isolated function timeseriesinstancesSearch(string apiVersion, SearchInstancesRequest payload, string? xMsContinuation = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns SearchInstancesResponsePage|error {
        string  path = string `/timeseries/instances/search`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-continuation": xMsContinuation, "x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SearchInstancesResponsePage response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SearchInstancesResponsePage);
        return response;
    }
    # Gets time series types in pages.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + xMsContinuation - Continuation token from previous page of results to retrieve the next page of the results in calls that support pagination. To get the first page results, specify null continuation token as parameter value. Returned continuation token is null if all results have been returned, and there is no next page of results. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeseriestypesList(string apiVersion, string? xMsContinuation = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns GetTypesPage|error {
        string  path = string `/timeseries/types`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-continuation": xMsContinuation, "x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetTypesPage response = check self.clientEp-> get(path, accHeaders, targetType = GetTypesPage);
        return response;
    }
    # Executes a batch get, create, update, delete operation on multiple time series types.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series types batch request body. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeseriestypesExecutebatch(string apiVersion, TypesBatchRequest payload, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns TypesBatchResponse|error {
        string  path = string `/timeseries/types/$batch`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TypesBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TypesBatchResponse);
        return response;
    }
    # Returns time series hierarchies definitions in pages.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + xMsContinuation - Continuation token from previous page of results to retrieve the next page of the results in calls that support pagination. To get the first page results, specify null continuation token as parameter value. Returned continuation token is null if all results have been returned, and there is no next page of results. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeserieshierarchiesList(string apiVersion, string? xMsContinuation = (), string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns GetHierarchiesPage|error {
        string  path = string `/timeseries/hierarchies`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-continuation": xMsContinuation, "x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetHierarchiesPage response = check self.clientEp-> get(path, accHeaders, targetType = GetHierarchiesPage);
        return response;
    }
    # Executes a batch get, create, update, delete operation on multiple time series hierarchy definitions.
    #
    # + apiVersion - Version of the API to be used with the client request. Currently supported version is "2020-07-31". 
    # + payload - Time series hierarchies batch request body. 
    # + xMsClientRequestId - Optional client request ID. Service records this value. Allows the service to trace operation across services, and allows the customer to contact support regarding a particular request. 
    # + xMsClientSessionId - Optional client session ID. Service records this value. Allows the service to trace a group of related operations across services, and allows the customer to contact support regarding a particular group of requests. 
    # + return - Successful operation. 
    remote isolated function timeserieshierarchiesExecutebatch(string apiVersion, HierarchiesBatchRequest payload, string? xMsClientRequestId = (), string? xMsClientSessionId = ()) returns HierarchiesBatchResponse|error {
        string  path = string `/timeseries/hierarchies/$batch`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-client-session-id": xMsClientSessionId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HierarchiesBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=HierarchiesBatchResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
