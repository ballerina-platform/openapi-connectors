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
    # All requests on the Livestorm API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`.
    string authorization;
|};

# This is a generated connector for [Livestorm API v1](https://developers.livestorm.co/docs) OpenAPI specification.
# Client endpoint for Livestorm Public API.
# Livestorm is a browser based online web conferencing software used to share real-time live streams. 
# It can be used to power remote live meetings, product demos, sales webinars, online lessons, onboarding sessions, more.
# In addition, all request and response bodies, including errors, are encoded in JSON format.
@display {label: "Livestorm", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Livestorm Account](https://app.livestorm.co/#/signup) and obtain tokens following [this guide](https://support.livestorm.co/category/4-getting-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.livestorm.co/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Create a new event
    #
    # + payload - Request payload to create event 
    # + return - Create event response 
    @display {label: "Create Event"}
    remote isolated function createEvent(EventsBody payload) returns InlineResponse201|error {
        string  path = string `/events`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Create a new event session
    #
    # + id - Event ID 
    # + payload - Request payload to add event session 
    # + return - Create event session response 
    remote isolated function createEventSession(string id, IdSessionsBody payload) returns InlineResponse2011|error {
        string  path = string `/events/${id}/sessions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Register a participant to a Session
    #
    # + id - Session ID 
    # + payload - Request payload to add participant to session 
    # + return - Register participant response 
    remote isolated function registerPeopleForSession(string id, IdPeopleBody payload) returns InlineResponse2012|error {
        string  path = string `/sessions/${id}/people`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2012 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2012);
        return response;
    }
}
