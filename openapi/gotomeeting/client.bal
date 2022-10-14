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
    OAuth2PasswordGrantConfig|http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Password Grant Configs
public type OAuth2PasswordGrantConfig record {|
    *http:OAuth2PasswordGrantConfig;
    # Token URL
    string tokenUrl = "https://api.getgo.com/oauth/v2/token";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.getgo.com/oauth/v2/token";
|};

# This is a generated connector for [GoToMeeting API v1.0](https://developer.goto.com/GoToMeetingV1) OpenAPI specification.  
# The GoToMeeting API provides the capability to organize meetings.
@display {label: "GoTo Meeting", iconPath: "icon.png"}
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
        return;
    }
    # Get organizer by email / Get all organizers
    #
    # + email - The email address of the organizer 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrganizersAllOrByEmail(string? email = ()) returns Organizer[]|error {
        string resourcePath = string `/organizers`;
        map<anydata> queryParam = {"email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Organizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create organizer
    #
    # + payload - The details of the organizer to be created 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function createOrganizer(OrganizerReq payload) returns OrganizerShort[]|error {
        string resourcePath = string `/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizerShort[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete organizer by email
    #
    # + email - The email address of the organizer 
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteOrganizerByEmail(string email) returns http:Response|error {
        string resourcePath = string `/organizers`;
        map<anydata> queryParam = {"email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrganizer(int organizerKey) returns Organizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}`;
        Organizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update organizer
    #
    # + organizerKey - The key of the organizer 
    # + payload - The organizer's status 
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function updateOrganizer(int organizerKey, OrganizerStatus payload) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteOrganizer(int organizerKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get attendees by organizer
    #
    # + organizerKey - The key of the organizer 
    # + startDate - A required start of date range in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - A required end of date range in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getAttendeesByOrganizer(int organizerKey, string startDate, string endDate) returns AttendeeByOrganizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/attendees`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AttendeeByOrganizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get historical meetings by organizer
    #
    # + organizerKey - The key of the organizer 
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetingsByOrganizer(int organizerKey, string startDate, string endDate) returns HistoricalMeeting[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HistoricalMeeting[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get upcoming meetings by organizer
    #
    # + organizerKey - The key of the organizer 
    # + return - OK 
    remote isolated function getUpcomingMeetingsByOrganizer(int organizerKey) returns UpcomingMeeting[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/upcomingMeetings`;
        UpcomingMeeting[] response = check self.clientEp->get(resourcePath);
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
    # 
    # # Deprecated
    @deprecated
    remote isolated function getMeetingsByOrganizer(int organizerKey, boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns MeetingByOrganizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MeetingByOrganizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete meeting session by session id
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionById(int organizerKey, int sessionId) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/sessions/${getEncodedUri(sessionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Remove attendee list of a meeting session
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionAttendeesById(int organizerKey, int sessionId) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/sessions/${getEncodedUri(sessionId)}/attendees`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Delete recordings of a meeting session
    #
    # + organizerKey - The organizer ID 
    # + sessionId - The session ID 
    # + return - No Content 
    remote isolated function deleteSessionRecordingsById(int organizerKey, int sessionId) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/sessions/${getEncodedUri(sessionId)}/recordings`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get groups
    #
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getGroups() returns Group[]|error {
        string resourcePath = string `/groups`;
        Group[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get attendees by group
    #
    # + groupKey - The key of the group 
    # + startDate - Start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - End of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getAttendeesByGroup(int groupKey, string? startDate = (), string? endDate = ()) returns AttendeeByGroup[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/attendees`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AttendeeByGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get historical meetings by group
    #
    # + groupKey - The key of the group 
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetingsByGroup(int groupKey, string startDate, string endDate) returns HistoricalMeetingByGroup[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HistoricalMeetingByGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get upcoming meetings by group
    #
    # + groupKey - The key of the group 
    # + return - OK 
    remote isolated function getUpcomingMeetingsByGroup(int groupKey) returns UpcomingMeetingByGroup[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/upcomingMeetings`;
        UpcomingMeetingByGroup[] response = check self.clientEp->get(resourcePath);
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
    # 
    # # Deprecated
    @deprecated
    remote isolated function getMeetingsByGroup(int groupKey, boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns HistoryMeetingByGroup[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HistoryMeetingByGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get organizers by group
    #
    # + groupKey - The key of the group 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrganizersByGroup(int groupKey) returns OrganizerByGroup[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/organizers`;
        OrganizerByGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create organizer in group
    #
    # + groupKey - The key of the group 
    # + payload - The details of the organizer to be created 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function createOrganizerInGroup(int groupKey, OrganizerReq payload) returns OrganizerShort[]|error {
        string resourcePath = string `/groups/${getEncodedUri(groupKey)}/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizerShort[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get historical meetings
    #
    # + startDate - Required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - Required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    remote isolated function getHistoricalMeetings(string startDate, string endDate) returns HistoricalMeeting[]|error {
        string resourcePath = string `/historicalMeetings`;
        map<anydata> queryParam = {"startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        HistoricalMeeting[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get upcoming meetings
    #
    # + return - OK 
    remote isolated function getUpcomingMeetings() returns UpcomingMeeting[]|error {
        string resourcePath = string `/upcomingMeetings`;
        UpcomingMeeting[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get meetings
    #
    # + scheduled - When 'true', returns all future meetings. Date range is ignored. Mutually exclusive to 'history'. 
    # + history - When 'true', returns all past meetings within date range. Mutually exclusive to 'scheduled'. 
    # + startDate - If history=true, required start of date range, in ISO8601 UTC format, e.g. 2015-07-01T22:00:00Z 
    # + endDate - If history=true, required end of date range, in ISO8601 UTC format, e.g. 2015-07-01T23:00:00Z 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getMeetings(boolean? scheduled = (), boolean? history = (), string? startDate = (), string? endDate = ()) returns MeetingHistory[]|error {
        string resourcePath = string `/meetings`;
        map<anydata> queryParam = {"scheduled": scheduled, "history": history, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MeetingHistory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create meeting
    #
    # + payload - The meeting details 
    # + return - Created 
    remote isolated function createMeeting(MeetingReqCreate payload) returns MeetingCreated[]|error {
        string resourcePath = string `/meetings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MeetingCreated[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function getMeeting(int meetingId) returns MeetingById[]|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        MeetingById[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update meeting
    #
    # + meetingId - The meeting ID 
    # + payload - The meeting details 
    # + return - No Content 
    remote isolated function updateMeeting(int meetingId, MeetingReqUpdate payload) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete meeting
    #
    # + meetingId - The meeting ID 
    # + return - No Content 
    remote isolated function deleteMeeting(int meetingId) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Start meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function startMeeting(int meetingId) returns StartUrl|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/start`;
        StartUrl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get attendees by meeting
    #
    # + meetingId - The meeting ID 
    # + return - OK 
    remote isolated function getAttendeesByMeetings(int meetingId) returns AttendeeByMeeting[]|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/attendees`;
        AttendeeByMeeting[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
