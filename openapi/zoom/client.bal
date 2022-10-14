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
    string refreshUrl = "https://zoom.us/oauth/token";
|};

# This is a generated connector for [Zoom API Version 2.0.0](https://marketplace.zoom.us/docs/api-reference/zoom-api) OpenAPI Specification.
# The Zoom API allows developers to access information from Zoom. You can use this API to build private services or public applications on the [Zoom App Marketplace](http://marketplace.zoom.us). To learn how to get your credentials and create private/public applications, read our [Authorization Guide](https://marketplace.zoom.us/docs/guides/authorization/credentials). 
# All endpoints are available via `https` and are located at `api.zoom.us/v2/`. For instance you can list all users on an account via `https://api.zoom.us/v2/users/`.
@display {label: "Zoom", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Zoom account](https://marketplace.zoom.us/) and obtain tokens following [this guide](https://marketplace.zoom.us/docs/guides/auth/oauth). Configure required scopes when obtaining the tokens. 
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.zoom.us/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List users
    #
    # + status - The user's status. active, live or upcoming. Default is active. 
    # + pageSize - The number of records returned within a single API call. 
    # + roleId - The role's unique ID. Use this parameter to filter the response by a specific role. 
    # + pageNumber - The page number of the current page in the returned records. 
    # + includeFields - Use this parameter to display one of the following attributes in the API call's response. custom_attributes or host_key. 
    # + nextPageToken - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - HTTP Status Code:200. User list returned. 
    @display {label: "List Users"}
    remote isolated function listUsers(@display {label: "User's Status"} string status = "active", @display {label: "Page Size"} int pageSize = 30, @display {label: "Role's Unique ID"} string? roleId = (), @display {label: "Page Number"} string? pageNumber = (), @display {label: "Include Fields"} string? includeFields = (), @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListUsersResponse|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"status": status, "page_size": pageSize, "role_id": roleId, "page_number": pageNumber, "include_fields": includeFields, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListUsersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List dashboard meetings
    #
    # + 'type - Specify a value to get the response for the corresponding meeting type. The value of this field can be one of the following: `past` - Meeting that already occurred in the specified date range. `pastOne` - Past meetings that were attended by only one user. `live` - Live meetings. If you do not provide this field, the default value will be `live` and thus, the API will only query responses for live meetings. 
    # + 'from - Start date in 'yyyy-mm-dd' format. The date range defined by the 'from' and 'to' parameters should only be one month as the report includes only one month worth of data at once. 
    # + to - End date in 'yyyy-mm-dd' format. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + groupId - The group ID. The API response will only contain meetings where the host is a member of the queried group ID. 
    # + includeFields - Set the value of this field to 'tracking_fields' if you would like to include tracking fields of each meeting in the response. 
    # + return - HTTP Status Code:200. Dashboard meetings returned. Only available for paid accounts that have dashboard feature enabled. 
    @display {label: "List Dashboard Meetings"}
    remote isolated function listDashboardMeetings(@display {label: "Start Date"} string 'from, @display {label: "End date"} string to, @display {label: "Meeting Type"} string 'type = "live", @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = (), @display {label: "Group ID"} string? groupId = (), @display {label: "Include Fields"} string? includeFields = ()) returns ListDashboardMeetingsResponse|error {
        string resourcePath = string `/metrics/meetings`;
        map<anydata> queryParam = {"type": 'type, "from": 'from, "to": to, "page_size": pageSize, "next_page_token": nextPageToken, "group_id": groupId, "include_fields": includeFields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDashboardMeetingsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List dashboard meeting participants
    #
    # + meetingId - The meeting's ID or universally unique ID (UUID).  If you provide a meeting ID, the API will return a response for the latest meeting instance.  If you provide a meeting UUID that begins with a `/` character or contains the `//` characters, you **must** double-encode the meeting UUID before making an API request. 
    # + 'type - The type of meeting to query:  * `past` — All past meetings.  * `pastOne` — All past one-user meetings.  * `live` - All live meetings.  This value defaults to `live`. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + includeFields - Provide `registrant_id` as the value for this field if you would like to see the registrant ID attribute in the response of this API call. A registrant ID is a unique identifier of a [meeting registrant](/api-reference/zoom-api/methods#operation/meetingRegistrants). This is not supported for `live` meeting types. 
    # + return - HTTP Status Code:200. Meeting participants returned. Only available for paid accounts that have enabled the dashboard feature. 
    @display {label: "List Dashboard Meeting Participants"}
    remote isolated function listDashboardMeetingParticipants(MeetingId meetingId, @display {label: "Meeting Type"} string 'type = "live", @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = (), @display {label: "Include Fields"} string? includeFields = ()) returns ListDashboardMeetingParticipantsResponse|error {
        string resourcePath = string `/metrics/meetings/${getEncodedUri(meetingId)}/participants`;
        map<anydata> queryParam = {"type": 'type, "page_size": pageSize, "next_page_token": nextPageToken, "include_fields": includeFields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDashboardMeetingParticipantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List meetings
    #
    # + userId - The user ID or email address of the user. For user-level apps, pass `me` as the value for userId. 
    # + 'type - The meeting types. Scheduled, live or upcoming 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + pageNumber - The page number of the current page in the returned records. 
    # + return - HTTP Status Code:200. List of meetings returned. 
    @display {label: "List Meetings"}
    remote isolated function listMeetings(@display {label: "User Id"} string userId, @display {label: "Meeting Type"} string 'type = "live", @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = (), @display {label: "Page Number"} string? pageNumber = ()) returns ListMeetingsResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/meetings`;
        map<anydata> queryParam = {"type": 'type, "page_size": pageSize, "next_page_token": nextPageToken, "page_number": pageNumber};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListMeetingsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a meeting
    #
    # + userId - The user ID or email address of the user. For user-level apps, pass me as the value for userId. 
    # + payload - Meeting detailed. 
    # + return - HTTP Status Code:201 - Meeting created. 
    @display {label: "Create Meeting"}
    remote isolated function createMeeting(@display {label: "User Id"} string userId, @display {label: "Meeting Details"} MeetingDetails payload) returns CreateMeetingResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/meetings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateMeetingResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List meeting registrants
    #
    # + meetingId - MThe meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). 
    # + occurrenceId - The meeting occurrence ID. 
    # + status - The registrant status 
    # + pageSize - The number of records returned within a single API call. 
    # + pageNumber - Deprecated - The page number of the current page in the returned records. 
    # + nextPageToken - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - HTTP Status Code:200. Successfully listed meeting registrants. 
    @display {label: "List Meeting Registrants"}
    remote isolated function listMeetingRegistrants(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Registrant Status"} string status = "approved", @display {label: "Page Size"} int pageSize = 30, @display {label: "Page Number"} int pageNumber = 1, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListMeetingRegistrantsResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListMeetingRegistrantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add meeting registrant
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). 
    # + occurrenceIds - Occurrence IDs. You can find these with the meeting get API. Multiple values separated by comma. 
    # + payload - Meeting Registrant Details 
    # + return - Meeting registrant's details 
    @display {label: "Add Meeting Registrant"}
    remote isolated function addMeetingRegistrant(@display {label: "Meeting Id"} int meetingId, AddMeetingRegistrantRequest payload, @display {label: "Occurence Id"} string? occurrenceIds = ()) returns AddMeetingRegistrantResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants`;
        map<anydata> queryParam = {"occurrence_ids": occurrenceIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddMeetingRegistrantResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List registration questions 
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`. Meeting Registrant Question object returned 
    @display {label: "List Registrant Questions"}
    remote isolated function getMeetingRegistrantsQuestions(@display {label: "Meeting Id"} int meetingId) returns RegistrantQuestions|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants/questions`;
        RegistrantQuestions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update registration questions
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting Registrant Questions 
    # + return - **HTTP Status Code:** `204`. Meeting Registrant Questions Updated 
    @display {label: "Update Registration Questions"}
    remote isolated function updateMeetingRegistrantQuestions(@display {label: "Meeting Id"} int meetingId, RegistrantQuestions payload) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants/questions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Update registrant's status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + occurrenceId - The meeting occurrence ID. 
    # + payload - Request payload for meeting registrant status update 
    # + return - **HTTP Status Code:** `204`. Registrant status updated. 
    @display {label: "Update Meeting Registrant's Status"}
    remote isolated function updateMeetingRegistrantStatus(@display {label: "Meting Id"} int meetingId, UpdateMeetingRegistrantstatusRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants/status`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a meeting registrant
    #
    # + occurrenceId - The meeting occurence ID. 
    # + meetingId - The meeting ID. 
    # + registrantId - The meeting registrant ID. 
    # + return - **HTTP status code:** `204` OK 
    @display {label: "Delete Meeting Registrant"}
    remote isolated function deleteMeetingregistrant(@display {label: "Meeting Id"} int meetingId, @display {label: "Registrant Id"} string registrantId, @display {label: "occurence Id"} string? occurrenceId = ()) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/registrants/${getEncodedUri(registrantId)}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + occurrenceId - Meeting Occurrence ID. Provide this field to view meeting details of a particular occurrence of the [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings). 
    # + showPreviousOccurrences - Set the value of this field to `true` if you would like to view meeting details of all previous occurrences of a [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings).  
    # + return - **HTTP Status Code:** `200` Meeting object returned. 
    @display {label: "Get Meeting Details"}
    remote isolated function getMeetingById(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Show Previous Occurrences"} boolean? showPreviousOccurrences = ()) returns GetMeetingDetailsResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "show_previous_occurrences": showPreviousOccurrences};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetMeetingDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + occurrenceId - The meeting occurrence ID. 
    # + scheduleForReminder - `true`: Notify host and alternative host about the meeting cancellation via email. `false`: Do not send any email notification. 
    # + cancelMeetingReminder - `true`: Notify registrants about the meeting cancellation via email.  `false`: Do not send any email notification to meeting registrants.  The default value of this field is `false`. 
    # + return - **HTTP Status Code**: `204` Meeting deleted. 
    @display {label: "Delete Meeting"}
    remote isolated function deleteMeeting(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Schedule for Reminder"} boolean? scheduleForReminder = (), @display {label: "Meeting Cancellation Reminder"} string? cancelMeetingReminder = ()) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "schedule_for_reminder": scheduleForReminder, "cancel_meeting_reminder": cancelMeetingReminder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + occurrenceId - Meeting occurrence id. Support change of agenda, start_time, duration, settings: {host_video, participant_video, join_before_host, mute_upon_entry, waiting_room, watermark, auto_recording} 
    # + payload - Meeting 
    # + return - **HTTP Status Code:** `204`. Meeting updated. 
    @display {label: "Update Meeting"}
    remote isolated function updateMeeting(@display {label: "Meeting Id"} int meetingId, UpdateMeetingRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Update meeting status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting status update details 
    # + return - **HTTP Status Code:** `204`. Meeting updated. 
    @display {label: "Update Meeting Status"}
    remote isolated function updateMeetingStatus(@display {label: "Meeting Id"} int meetingId, UpdateMeetingstatusRequest payload) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/status`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List ended meeting instances
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`. List of ended meeting instances returned. 
    @display {label: "List Past Meetings"}
    remote isolated function listPastMeetings(@display {label: "Meeting Id"} int meetingId) returns ListPastMeetingsResponse|error {
        string resourcePath = string `/past_meetings/${getEncodedUri(meetingId)}/instances`;
        ListPastMeetingsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List past meeting's poll results
    #
    # + meetingId - The meeting ID or the meeting UUID.  If a meeting ID is provided in the request instead of a UUID, the response will be for the latest meeting instance. If a UUID starts with "/" or contains "//" (example: "/ajXp112QmuoKj4854875==\"), you must **double encode** the UUID before making an API request. 
    # + return - **HTTP Status Code:** `200` **OK**. Polls returned successfully. 
    @display {label: "List Meeting Polls"}
    remote isolated function listPastMeetingPolls(@display {label: "Meeting Id"} string meetingId) returns ListPastMeetingPollsResponse|error {
        string resourcePath = string `/past_meetings/${getEncodedUri(meetingId)}/polls`;
        ListPastMeetingPollsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get past meeting details
    #
    # + meetingUUID - The meeting UUID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for other API calls if the UUID begins with a '/'or contains '//' in it. 
    # + return - **HTTP Status Code:** `200`. Meeting details returned. 
    @display {label: "Get Past Meeting Details"}
    remote isolated function getPastMeetingDetails(@display {label: "Meeting UUID"} string meetingUUID) returns PastMeetingDetailsResponse|error {
        string resourcePath = string `/past_meetings/${getEncodedUri(meetingUUID)}`;
        PastMeetingDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List past meeting participants
    #
    # + meetingUUID - The meeting UUID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for other API calls if the UUID begins with a '/'or contains '//' in it. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - **HTTP Status Code:** `200`. Meeting participants' report returned. 
    @display {label: "List Past Meeting Participants"}
    remote isolated function listPastMeetingParticipants(@display {label: "Meeting UUID"} string meetingUUID, @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListPastMeetingParticipantsResponse|error {
        string resourcePath = string `/past_meetings/${getEncodedUri(meetingUUID)}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListPastMeetingParticipantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List meeting polls
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:**. List polls of a Meeting  returned 
    @display {label: "Get Meeting Polls"}
    remote isolated function getMeetingPolls(@display {label: "Meeting Id"} int meetingId) returns MeetingPollsResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/polls`;
        MeetingPollsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting poll object 
    # + return - **HTTP Status Code:** `201`. Meeting Poll Created 
    @display {label: "Create Meeting Poll"}
    remote isolated function createMeetingPoll(@display {label: "Meeting Id"} int meetingId, CreateMeetingPollRequest payload) returns CreateMeetingPollResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/polls`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateMeetingPollResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + pollId - The poll ID 
    # + return - **HTTP Status Code:** `200`. Meeting Poll object returned 
    @display {label: "Get Meeting Poll"}
    remote isolated function getMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns GetMeetingPollResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/polls/${getEncodedUri(pollId)}`;
        GetMeetingPollResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + pollId - The poll ID 
    # + payload - Meeting Poll 
    # + return - **HTTP Status Code:** `204`. Meeting Poll Updated 
    @display {label: "Update Meeting Poll"}
    remote isolated function updateMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId, UpdateMeetingPollRequest payload) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/polls/${getEncodedUri(pollId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + pollId - The poll ID 
    # + return - **HTTP Status Code:** `204`. Meeting Poll deleted 
    @display {label: "Delete Meeting Poll"}
    remote isolated function deleteMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/polls/${getEncodedUri(pollId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Perform batch poll creation
    #
    # + meetingId - Meeting Id 
    # + payload - Batch Meeting poll object 
    # + return - **HTTP Status Code:** `201`. Meeting Poll Created 
    @display {label: "Create Batch Polls"}
    remote isolated function createBatchPolls(@display {label: "Meeting Id"} string meetingId, CreateBatchPollsRequest payload) returns CreateBatchPollsResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/batch_polls`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateBatchPollsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get meeting invitation
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`<br> Meeting invitation returned. 
    @display {label: "Get Meeting Invitation"}
    remote isolated function getMeetingInvitation(@display {label: "Meeting Id"} int meetingId) returns GetMeetingInvitationResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/invitation`;
        GetMeetingInvitationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get live stream details
    #
    # + meetingId - Unique identifier of the meeting. 
    # + return - **HTTP Status Code:** `200` **OK**.  Live Stream details returned. 
    @display {label: "Get Live Stream Details"}
    remote isolated function getLiveStreamDetails(@display {label: "Meeting Id"} string meetingId) returns GetLiveStreamDetailsResponse|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/livestream`;
        GetLiveStreamDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a live stream
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting 
    # + return - **HTTP Status Code:** `204`. Meeting live stream updated. 
    @display {label: "Update Meeting Live Stream"}
    remote isolated function updateMeetingLiveStream(@display {label: "Meeting Id"} int meetingId, UpdateMeetingLiveStreamDetailsRequest payload) returns http:Response|error {
        string resourcePath = string `/meetings/${getEncodedUri(meetingId)}/livestream`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List webinar registrants
    #
    # + webinarId - The webinar ID in "**long**" format(represented as int64 data type in JSON).  
    # + occurrenceId - The meeting occurrence ID. 
    # + status - The registrant status: `pending` - Registrant's status is pending. `approved` - Registrant's status is approved.`denied` - Registrant's status is denied. 
    # + trackingSourceId - The tracking source ID for the registrants. Useful if you share the webinar registration page in multiple locations. See [Creating source tracking links for webinar registration](https://support.zoom.us/hc/en-us/articles/360000315683-Creating-source-tracking-links-for-webinar-registration) for details. 
    # + pageSize - The number of records returned within a single API call. 
    # + pageNumber - The page number of the current page in the returned records. 
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - HTTP Status Code: `200` Webinar plan subscription is missing. Enable webinar for this user once the subscription is added. 
    @display {label: "List Webinar Meeting Registrants"}
    remote isolated function listWebinarRegistrants(@display {label: "Webinar Id"} int webinarId, @display {label: "Meeting Occurence Id"} string? occurrenceId = (), @display {label: "Status"} string status = "approved", @display {label: "Tracking Source Id"} string? trackingSourceId = (), @display {label: "Page Size"} int pageSize = 30, @display {label: "Page Number"} int pageNumber = 1, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListWebinarRegistrantsResponse|error {
        string resourcePath = string `/webinars/${getEncodedUri(webinarId)}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "tracking_source_id": trackingSourceId, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListWebinarRegistrantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List webinar participants
    #
    # + webinarId - Unique identifier of the webinar. You can retrieve the value of this field by calling the [list webinars](https://marketplace.zoom.us/docs/api-reference/zoom-api/webinars/webinars) API. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - Webinar participants' details 
    @display {label: "List Webinar Participants"}
    remote isolated function listWebinarParticipants(@display {label: "Webinar Id"} string webinarId, @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListWebinarParticipantsResponse|error {
        string resourcePath = string `/past_webinars/${getEncodedUri(webinarId)}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListWebinarParticipantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List webinar absentees
    #
    # + occurrenceId - The meeting occurrence ID. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + webinarUUID - The Webinar UUID. Each Webinar instance will generate its own Webinar UUID (i.e., after a Webinar ends, a new UUID will be generated for the next instance of the Webinar). Please double encode your UUID when using it for API calls if the UUID begins with a '/' or contains '//' in it. 
    # + return - **HTTP Status Code:** `200`  Success. **Error Code:** `200`  Webinar plan subscription is missing. Enable webinar for this user once the subscription is added:{userId}. 
    @display {label: "List Webinar Absentees"}
    remote isolated function listWebinarAbsentees(@display {label: "Webinar UUID"} string webinarUUID, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListWebinarAbsentees|error {
        string resourcePath = string `/past_webinars/${getEncodedUri(webinarUUID)}/absentees`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "page_size": pageSize, "next_page_token": nextPageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListWebinarAbsentees response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List meeting templates
    #
    # + userId - Unique identifier of the user. Retrieve the value of this field by calling the [List users](https://marketplace.zoom.us/docs/api-reference/zoom-api/users/users) API. 
    # + return - **HTTP Status Code:** `200` **OK** 
    @display {label: "List Meeting Templates"}
    remote isolated function listMeetingTemplates(@display {label: "User Id"} string userId) returns ListMeetingTemplatesResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/meeting_templates`;
        ListMeetingTemplatesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
