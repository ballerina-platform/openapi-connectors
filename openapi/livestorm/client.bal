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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://app.livestorm.co) and obtain an `API Key` in the settings.
#
# + apiKeys - Provide your API Key as `Authorization`. Eg: `{"Authorization" : "<Your API Key>"}`  
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Fetch List
public type ListEventsResponse record {
    # Event Data
    Event[] data;
    # Metadata
    Meta meta?;
};

# Request payload to create event
public type CreateEventRequest record {
    # Event post data
    EventData data?;
};

# Create event response
public type CreateEventResponse record {
    # Event response
    Event data?;
};

# Get detail
public type GetEventByIDResponse record {
    # Event response
    Event data?;
};

# Fetch List
public type ListSessionByEventResponse record {
    # Data
    anydata[] data;
    # Metadata
    Meta meta?;
};

# Request payload to add event session
public type CreateEventSessionRequest record {
    # Add Session data
    SessionData data?;
};

# Create event session response
public type CreateEventSessionResponse record {
    # Event session
    Session data?;
};

# Fetch List
public type ListSessionPeopleResponse record {
    # Data
    anydata[] data;
    # Metadata
    Meta meta?;
};

# Request payload to add participant to session
public type RegisterPeopleForSessionRequest record {
    # Add People data
    PeopleData data?;
};

# Register participant response
public type RegisterPeopleForSessionResponse record {
    # Event session
    People data?;
};

# Client endpoint for Livestorm Public API
#
# + clientEp - Connector http endpoint
@display {label: "Livestorm Public API Client"}
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Initializes the Livestorm client endpoint.
    #
    # + apiKeyConfig - API key configurations required to initialize the `Client` endpoint
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return -  Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.livestorm.co/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # List Events
    #
    # + pageNumber - Page index to be returned
    # + pageSize - Number of record to be returned by page
    # + filterTitle - Filter events by title
    # + filterEveryoneCanSpeak - Filter events by everyone can speak
    # + return - Fetch List
    @display {label: "Get List Of Events"}
    remote isolated function listEvents(@display {label: "Page Number"} string? pageNumber = (), @display {label: "Page Size"} string? pageSize = (), @display {label: "Title Filter"} string? filterTitle = (), @display {label: "Filter By Everyone Can Speak Or Not"} string? filterEveryoneCanSpeak = ()) returns ListEventsResponse|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterTitle": filterTitle, "filterEveryoneCanSpeak": filterEveryoneCanSpeak};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ListEventsResponse response = check self.clientEp-> get(path, accHeaders, targetType = ListEventsResponse);
        return response;
    }
    # Create a new event
    #
    # + payload - Request payload to create event
    # + return - Create event response
    @display {label: "Create Event"}
    remote isolated function createEvent(CreateEventRequest payload) returns CreateEventResponse|error {
        string  path = string `/events`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateEventResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateEventResponse);
        return response;
    }
    # Retrieve an Event
    #
    # + id - Event ID
    # + return - Get detail
    @display {label: "Get Event By Event ID"}
    remote isolated function getEventByID(@display {label: "Event ID"} string id) returns GetEventByIDResponse|error {
        string  path = string `/events/${id}`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetEventByIDResponse response = check self.clientEp-> get(path, accHeaders, targetType = GetEventByIDResponse);
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
    remote isolated function listSessionByEvent(string id, string? pageNumber = (), string? pageSize = (), string? filterStatus = (), string? filterDateFrom = (), string? filterDateTo = (), string[]? include = ()) returns ListSessionByEventResponse|error {
        string  path = string `/events/${id}/sessions`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterStatus": filterStatus, "filterDateFrom": filterDateFrom, "filterDateTo": filterDateTo, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ListSessionByEventResponse response = check self.clientEp-> get(path, accHeaders, targetType = ListSessionByEventResponse);
        return response;
    }
    # Create a new event session
    #
    # + id - Event ID
    # + payload - Request payload to add event session
    # + return - Create event session response
    remote isolated function createEventSession(string id, CreateEventSessionRequest payload) returns CreateEventSessionResponse|error {
        string  path = string `/events/${id}/sessions`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateEventSessionResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateEventSessionResponse);
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
    remote isolated function listSessionPeople(string id, string? pageNumber = (), string? pageSize = (), string? filterRole = (), boolean? filterAttended = (), string? filterEmail = (), string[]? include = ()) returns ListSessionPeopleResponse|error {
        string  path = string `/sessions/${id}/people`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "filterRole": filterRole, "filterAttended": filterAttended, "filterEmail": filterEmail, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ListSessionPeopleResponse response = check self.clientEp-> get(path, accHeaders, targetType = ListSessionPeopleResponse);
        return response;
    }
    # Register a participant to a Session
    #
    # + id - Session ID
    # + payload - Request payload to add participant to session
    # + return - Register participant response
    remote isolated function registerPeopleForSession(string id, RegisterPeopleForSessionRequest payload) returns RegisterPeopleForSessionResponse|error {
        string  path = string `/sessions/${id}/people`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RegisterPeopleForSessionResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=RegisterPeopleForSessionResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
