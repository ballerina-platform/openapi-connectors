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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Livestorm API v1](https://developers.livestorm.co/docs) OpenAPI specification.
# Client endpoint for Livestorm Public API.
# Livestorm is a browser based online web conferencing software used to share real-time live streams. 
# It can be used to power remote live meetings, product demos, sales webinars, online lessons, onboarding sessions, more.
# In addition, all request and response bodies, including errors, are encoded in JSON format.
@display {label: "Livestorm", iconPath: "resources/livestorm.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Livestorm Account](https://app.livestorm.co/#/signup) and obtain tokens following [this guide](https://support.livestorm.co/category/4-getting-started).
    #
    # + apiKeyConfig - Provide your API key as `Authorization`. Eg: `{"Authorization" : "<your API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.livestorm.co/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # List Events
    #
    # + pageNumber - Page index to be returned
    # + pageSize - Number of record to be returned by page
    # + filterTitle - Filter events by title
    # + filterEveryoneCanSpeak - Filter events by everyone can speak
    # + return - Fetch List
    @display {label: "Get List Of Events"}
    remote isolated function listEvents(@display {label: "Page Number"} string? pageNumber = (), @display {label: "Page Size"} string? pageSize = (), @display {label: "Title Filter"} string? filterTitle = (), @display {label: "Filter By Everyone Can Speak Or Not"} string? filterEveryoneCanSpeak = ()) returns InlineResponse200|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterTitle": filterTitle, "filterEveryoneCanSpeak": filterEveryoneCanSpeak};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Create a new event
    #
    # + payload - Request payload to create event
    # + return - Create event response
    @display {label: "Create Event"}
    remote isolated function createEvent(Body payload) returns InlineResponse201|error {
        string  path = string `/events`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Retrieve an Event
    #
    # + id - Event ID
    # + return - Get detail
    @display {label: "Get Event By Event ID"}
    remote isolated function getEventByID(@display {label: "Event ID"} string id) returns InlineResponse2001|error {
        string  path = string `/events/${id}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # List Sessions for an Event
    #
    # + id - Event ID
    # + pageNumber - Page index to be returned
    # + pageSize - Number of record to be returned by page
    # + filterStatus - Filter Sessions by status : 'upcoming', 'live', 'on_demand', 'past', 'past_not_started', 'canceled', 'draft'
    # + filterDateFrom - Filter Sessions which â€˜estimated_started_atâ€™ attribute starts from the given date (expressed as a Unix timestamp or an ISO 8601 date).
    # + filterDateTo - Filter Sessions which â€˜estimated_started_atâ€™ attribute ends with the given date (expressed as a Unix timestamp or an ISO 8601 date).
    # + include - Include Related Data
    # + return - Fetch List
    remote isolated function listSessionByEvent(string id, string? pageNumber = (), string? pageSize = (), string? filterStatus = (), string? filterDateFrom = (), string? filterDateTo = (), string[]? include = ()) returns InlineResponse2002|error {
        string  path = string `/events/${id}/sessions`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterStatus": filterStatus, "filterDateFrom": filterDateFrom, "filterDateTo": filterDateTo, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Create a new event session
    #
    # + id - Event ID
    # + payload - Request payload to add event session
    # + return - Create event session response
    remote isolated function createEventSession(string id, Body1 payload) returns InlineResponse2011|error {
        string  path = string `/events/${id}/sessions`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2011 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2011);
        return response;
    }
    # List People for a Session
    #
    # + id - Session ID
    # + pageNumber - Page index to be returned
    # + pageSize - Number of record to be returned by page
    # + filterRole - Filter People by role : 'participant', 'team_member'
    # + filterAttended - Filter People that attend or not the Session
    # + filterEmail - Filter People by their email (exact match)
    # + include - Include Related Data
    # + return - Fetch List
    remote isolated function listSessionPeople(string id, string? pageNumber = (), string? pageSize = (), string? filterRole = (), boolean? filterAttended = (), string? filterEmail = (), string[]? include = ()) returns InlineResponse2003|error {
        string  path = string `/sessions/${id}/people`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterRole": filterRole, "filterAttended": filterAttended, "filterEmail": filterEmail, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Register a participant to a Session
    #
    # + id - Session ID
    # + payload - Request payload to add participant to session
    # + return - Register participant response
    remote isolated function registerPeopleForSession(string id, Body2 payload) returns InlineResponse2012|error {
        string  path = string `/sessions/${id}/people`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2012 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2012);
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
