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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2PasswordGrantConfig|http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [GoToMeeting API v1.0](https://developer.goto.com/GoToMeetingV1) OpenAPI specification.  
# The GoToMeeting API provides the capability to organize meetings.
@display {label: "GoTo Meeting", iconPath: "resources/gotomeeting.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [LogMeIn account](https://accounts.logme.in/registration.aspx) and obtain tokens by following [this guide](https://developer.goto.com/guides/HowTos/02_HOW_createClient/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.getgo.com/G2M/rest") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get organizer by email / Get all organizers
    #
    # + email - The email address of the organizer 
    # + return - OK 
    remote isolated function getOrganizersAllOrByEmail(string? email = ()) returns Organizer[]|error {
        string  path = string `/organizers`;
        map<anydata> queryParam = {"email": email};
        path = path + check getPathForQueryParam(queryParam);
        Organizer[] response = check self.clientEp-> get(path, targetType = OrganizerArr);
        return response;
    }
    # Create organizer
    #
    # + payload - The details of the organizer to be created 
    # + return - Created 
    remote isolated function createOrganizer(OrganizerReq payload) returns OrganizerShort[]|error {
        string  path = string `/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrganizerShort[] response = check self.clientEp->post(path, request, targetType=OrganizerShortArr);
        return response;
    }
    # Delete organizer by email
    #
    # + email - The email address of the organizer 
    # + return - No Content 
    remote isolated function deleteOrganizerByEmail(string email) returns http:Response|error {
        string  path = string `/organizers`;
        map<anydata> queryParam = {"email": email};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - OK 
    remote isolated function getOrganizer(int organizerKey) returns Organizer[]|error {
        string  path = string `/organizers/${organizerKey}`;
        Organizer[] response = check self.clientEp-> get(path, targetType = OrganizerArr);
        return response;
    }
    # Update organizer
    #
    # + organizerKey - The key of the organizer 
    # + payload - The organizer's status 
    # + return - No Content 
    remote isolated function updateOrganizer(int organizerKey, OrganizerStatus payload) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - No Content 
    remote isolated function deleteOrganizer(int organizerKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get attendees by organizer
    #
    # + organizerKey - The key of the organizer 
    # + startDate - A required start of date range in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - A required end of date range in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getAttendeesByOrganizer(int organizerKey, string startDate, string endDate) returns AttendeeByOrganizer[]|error {
        string  path = string `/organizers/${organizerKey}/attendees`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        AttendeeByOrganizer[] response = check self.clientEp-> get(path, targetType = AttendeeByOrganizerArr);
        return response;
    }
    # Get historical meetings by organizer
    #
    # + organizerKey - The key of the organizer 
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetingsByOrganizer(int organizerKey, string startDate, string endDate) returns HistoricalMeeting[]|error {
        string  path = string `/organizers/${organizerKey}/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        HistoricalMeeting[] response = check self.clientEp-> get(path, targetType = HistoricalMeetingArr);
        return response;
    }
    # Get upcoming meetings by organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - OK 
    remote isolated function getUpcomingMeetingsByOrganizer(int organizerKey) returns UpcomingMeeting[]|error {
        string  path = string `/organizers/${organizerKey}/upcomingMeetings`;
        UpcomingMeeting[] response = check self.clientEp-> get(path, targetType = UpcomingMeetingArr);
        return response;
    }
    # Get meetings by organizer
    #
    # + organizerKey - The key of the organizer 
    # + scheduled - When 'true', returns all future meetings. Date range is ignored. Mutually exclusive to 'history'. 
    # + history - When 'true', returns all past meetings within date range. Mutually exclusive to 'scheduled'. 
    # + startDate - If history is 'true', required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - If history is 'true', required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getMeetingsByOrganizer(int organizerKey, boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns MeetingByOrganizer[]|error {
        string  path = string `/organizers/${organizerKey}/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        MeetingByOrganizer[] response = check self.clientEp-> get(path, targetType = MeetingByOrganizerArr);
        return response;
    }
    # Delete meeting session by session id
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionById(int organizerKey, int sessionId) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/sessions/${sessionId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Remove attendee list of a meeting session
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionAttendeesById(int organizerKey, int sessionId) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/sessions/${sessionId}/attendees`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Delete recordings of a meeting session
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionRecordingsById(int organizerKey, int sessionId) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/sessions/${sessionId}/recordings`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get groups
    #
    # + return - OK 
    remote isolated function getGroups() returns Group[]|error {
        string  path = string `/groups`;
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Get attendees by group
    #
    # + groupKey - The key of the group 
    # + startDate - Start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - End of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getAttendeesByGroup(int groupKey, string? startDate = (), string? endDate = ()) returns AttendeeByGroup[]|error {
        string  path = string `/groups/${groupKey}/attendees`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        AttendeeByGroup[] response = check self.clientEp-> get(path, targetType = AttendeeByGroupArr);
        return response;
    }
    # Get historical meetings by group
    #
    # + groupKey - The key of the group 
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetingsByGroup(int groupKey, string startDate, string endDate) returns HistoricalMeetingByGroup[]|error {
        string  path = string `/groups/${groupKey}/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        HistoricalMeetingByGroup[] response = check self.clientEp-> get(path, targetType = HistoricalMeetingByGroupArr);
        return response;
    }
    # Get upcoming meetings by group
    #
    # + groupKey - The key of the group 
    # + return - OK 
    remote isolated function getUpcomingMeetingsByGroup(int groupKey) returns UpcomingMeetingByGroup[]|error {
        string  path = string `/groups/${groupKey}/upcomingMeetings`;
        UpcomingMeetingByGroup[] response = check self.clientEp-> get(path, targetType = UpcomingMeetingByGroupArr);
        return response;
    }
    # Get meetings by group
    #
    # + groupKey - The key of the group 
    # + scheduled - When 'true', returns all future meetings. Date range is ignored. Mutually exclusive to 'history'. 
    # + history - When 'true', returns all past meetings within date range. Mutually exclusive to 'scheduled'. 
    # + startDate - If history=true, required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - If history=true, required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getMeetingsByGroup(int groupKey, boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns HistoryMeetingByGroup[]|error {
        string  path = string `/groups/${groupKey}/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        HistoryMeetingByGroup[] response = check self.clientEp-> get(path, targetType = HistoryMeetingByGroupArr);
        return response;
    }
    # Get organizers by group
    #
    # + groupKey - The key of the group 
    # + return - OK 
    remote isolated function getOrganizersByGroup(int groupKey) returns OrganizerByGroup[]|error {
        string  path = string `/groups/${groupKey}/organizers`;
        OrganizerByGroup[] response = check self.clientEp-> get(path, targetType = OrganizerByGroupArr);
        return response;
    }
    # Create organizer in group
    #
    # + groupKey - The key of the group 
    # + payload - The details of the organizer to be created 
    # + return - Created 
    remote isolated function createOrganizerInGroup(int groupKey, OrganizerReq payload) returns OrganizerShort[]|error {
        string  path = string `/groups/${groupKey}/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrganizerShort[] response = check self.clientEp->post(path, request, targetType=OrganizerShortArr);
        return response;
    }
    # Get historical meetings
    #
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetings(string startDate, string endDate) returns HistoricalMeeting[]|error {
        string  path = string `/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        HistoricalMeeting[] response = check self.clientEp-> get(path, targetType = HistoricalMeetingArr);
        return response;
    }
    # Get upcoming meetings
    #
    # + return - OK 
    remote isolated function getUpcomingMeetings() returns UpcomingMeeting[]|error {
        string  path = string `/upcomingMeetings`;
        UpcomingMeeting[] response = check self.clientEp-> get(path, targetType = UpcomingMeetingArr);
        return response;
    }
    # Get meetings
    #
    # + scheduled - When 'true', returns all future meetings. Date range is ignored. Mutually exclusive to 'history'. 
    # + history - When 'true', returns all past meetings within date range. Mutually exclusive to 'scheduled'. 
    # + startDate - If history=true, required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - If history=true, required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getMeetings(boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns MeetingHistory[]|error {
        string  path = string `/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        path = path + check getPathForQueryParam(queryParam);
        MeetingHistory[] response = check self.clientEp-> get(path, targetType = MeetingHistoryArr);
        return response;
    }
    # Create meeting
    #
    # + payload - The meeting details 
    # + return - Created 
    remote isolated function createMeeting(MeetingReqCreate payload) returns MeetingCreated[]|error {
        string  path = string `/meetings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MeetingCreated[] response = check self.clientEp->post(path, request, targetType=MeetingCreatedArr);
        return response;
    }
    # Get meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function getMeeting(int meetingId) returns MeetingById[]|error {
        string  path = string `/meetings/${meetingId}`;
        MeetingById[] response = check self.clientEp-> get(path, targetType = MeetingByIdArr);
        return response;
    }
    # Update meeting
    #
    # + meetingId - The meeting ID 
    # + payload - The meeting details 
    # + return - No Content 
    remote isolated function updateMeeting(int meetingId, MeetingReqUpdate payload) returns http:Response|error {
        string  path = string `/meetings/${meetingId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete meeting
    #
    # + meetingId - The meeting ID 
    # + return - No Content 
    remote isolated function deleteMeeting(int meetingId) returns http:Response|error {
        string  path = string `/meetings/${meetingId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Start meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function startMeeting(int meetingId) returns StartUrl|error {
        string  path = string `/meetings/${meetingId}/start`;
        StartUrl response = check self.clientEp-> get(path, targetType = StartUrl);
        return response;
    }
    # Get attendees by meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function getAttendeesByMeetings(int meetingId) returns AttendeeByMeeting[]|error {
        string  path = string `/meetings/${meetingId}/attendees`;
        AttendeeByMeeting[] response = check self.clientEp-> get(path, targetType = AttendeeByMeetingArr);
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
