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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Zoom API Version 2.0.0](https://marketplace.zoom.us/docs/api-reference/zoom-api) OpenAPI Specification.
# The Zoom API allows developers to access information from Zoom. You can use this API to build private services or public applications on the [Zoom App Marketplace](http://marketplace.zoom.us). To learn how to get your credentials and create private/public applications, read our [Authorization Guide](https://marketplace.zoom.us/docs/guides/authorization/credentials). 
# All endpoints are available via `https` and are located at `api.zoom.us/v2/`. For instance you can list all users on an account via `https://api.zoom.us/v2/users/`.
@display {label: "Zoom", iconPath: "resources/zoom.svg"}
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
        string  path = string `/users/${userId}/meetings`;
        map<anydata> queryParam = {"type": 'type, "page_size": pageSize, "next_page_token": nextPageToken, "page_number": pageNumber};
        path = path + check getPathForQueryParam(queryParam);
        ListMeetingsResponse response = check self.clientEp-> get(path, targetType = ListMeetingsResponse);
        return response;
    }
    # Create a meeting
    #
    # + userId - The user ID or email address of the user. For user-level apps, pass me as the value for userId. 
    # + payload - Meeting detailed. 
    # + return - HTTP Status Code:201 - Meeting created. 
    @display {label: "Create Meeting"}
    remote isolated function createMeeting(@display {label: "User Id"} string userId, @display {label: "Meeting Details"} MeetingDetails payload) returns CreateMeetingResponse|error {
        string  path = string `/users/${userId}/meetings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateMeetingResponse response = check self.clientEp->post(path, request, targetType=CreateMeetingResponse);
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
        string  path = string `/meetings/${meetingId}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListMeetingRegistrantsResponse response = check self.clientEp-> get(path, targetType = ListMeetingRegistrantsResponse);
        return response;
    }
    # Add meeting registrant
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). 
    # + payload - Meeting Registrant Details 
    # + occurrenceIds - Occurrence IDs. You can find these with the meeting get API. Multiple values separated by comma. 
    # + return - Meeting registrant's details 
    @display {label: "Add Meeting Registrant"}
    remote isolated function addMeetingRegistrant(@display {label: "Meeting Id"} int meetingId, AddMeetingRegistrantRequest payload, @display {label: "Occurence Id"} string? occurrenceIds = ()) returns AddMeetingRegistrantResponse|error {
        string  path = string `/meetings/${meetingId}/registrants`;
        map<anydata> queryParam = {"occurrence_ids": occurrenceIds};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddMeetingRegistrantResponse response = check self.clientEp->post(path, request, targetType=AddMeetingRegistrantResponse);
        return response;
    }
    # List registration questions 
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`. Meeting Registrant Question object returned 
    @display {label: "List Registrant Questions"}
    remote isolated function getMeetingRegistrantsQuestions(@display {label: "Meeting Id"} int meetingId) returns RegistrantQuestions|error {
        string  path = string `/meetings/${meetingId}/registrants/questions`;
        RegistrantQuestions response = check self.clientEp-> get(path, targetType = RegistrantQuestions);
        return response;
    }
    # Update registration questions
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting Registrant Questions 
    # + return - **HTTP Status Code:** `204`. Meeting Registrant Questions Updated 
    @display {label: "Update Registration Questions"}
    remote isolated function updateMeetingRegistrantQuestions(@display {label: "Meeting Id"} int meetingId, RegistrantQuestions payload) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/registrants/questions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    # Update registrant's status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Request payload for meeting registrant status update 
    # + occurrenceId - The meeting occurrence ID. 
    # + return - **HTTP Status Code:** `204`. Registrant status updated. 
    @display {label: "Update Meeting Registrant's Status"}
    remote isolated function updateMeetingRegistrantStatus(@display {label: "Meting Id"} int meetingId, UpdateMeetingRegistrantstatusRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/registrants/status`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a meeting registrant
    #
    # + meetingId - The meeting ID. 
    # + registrantId - The meeting registrant ID. 
    # + occurrenceId - The meeting occurence ID. 
    # + return - **HTTP status code:** `204` OK 
    @display {label: "Delete Meeting Registrant"}
    remote isolated function deleteMeetingregistrant(@display {label: "Meeting Id"} int meetingId, @display {label: "Registrant Id"} string registrantId, @display {label: "occurence Id"} string? occurrenceId = ()) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/registrants/${registrantId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "show_previous_occurrences": showPreviousOccurrences};
        path = path + check getPathForQueryParam(queryParam);
        GetMeetingDetailsResponse response = check self.clientEp-> get(path, targetType = GetMeetingDetailsResponse);
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
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "schedule_for_reminder": scheduleForReminder, "cancel_meeting_reminder": cancelMeetingReminder};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting 
    # + occurrenceId - Meeting occurrence id. Support change of agenda, start_time, duration, settings: {host_video, participant_video, join_before_host, mute_upon_entry, waiting_room, watermark, auto_recording} 
    # + return - **HTTP Status Code:** `204`. Meeting updated. 
    @display {label: "Update Meeting"}
    remote isolated function updateMeeting(@display {label: "Meeting Id"} int meetingId, UpdateMeetingRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns http:Response|error {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    # Update meeting status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting status update details 
    # + return - **HTTP Status Code:** `204`. Meeting updated. 
    @display {label: "Update Meeting Status"}
    remote isolated function updateMeetingStatus(@display {label: "Meeting Id"} int meetingId, UpdateMeetingstatusRequest payload) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/status`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # List ended meeting instances
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`. List of ended meeting instances returned. 
    @display {label: "List Past Meetings"}
    remote isolated function listPastMeetings(@display {label: "Meeting Id"} int meetingId) returns ListPastMeetingsResponse|error {
        string  path = string `/past_meetings/${meetingId}/instances`;
        ListPastMeetingsResponse response = check self.clientEp-> get(path, targetType = ListPastMeetingsResponse);
        return response;
    }
    # List past meeting's poll results
    #
    # + meetingId - The meeting ID or the meeting UUID.  If a meeting ID is provided in the request instead of a UUID, the response will be for the latest meeting instance. If a UUID starts with "/" or contains "//" (example: "/ajXp112QmuoKj4854875==\"), you must **double encode** the UUID before making an API request. 
    # + return - **HTTP Status Code:** `200` **OK**. Polls returned successfully. 
    @display {label: "List Meeting Polls"}
    remote isolated function listPastMeetingPolls(@display {label: "Meeting Id"} string meetingId) returns ListPastMeetingPollsResponse|error {
        string  path = string `/past_meetings/${meetingId}/polls`;
        ListPastMeetingPollsResponse response = check self.clientEp-> get(path, targetType = ListPastMeetingPollsResponse);
        return response;
    }
    # Get past meeting details
    #
    # + meetingUUID - The meeting UUID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for other API calls if the UUID begins with a '/'or contains '//' in it. 
    # + return - **HTTP Status Code:** `200`. Meeting details returned. 
    @display {label: "Get Past Meeting Details"}
    remote isolated function getPastMeetingDetails(@display {label: "Meeting UUID"} string meetingUUID) returns PastMeetingDetailsResponse|error {
        string  path = string `/past_meetings/${meetingUUID}`;
        PastMeetingDetailsResponse response = check self.clientEp-> get(path, targetType = PastMeetingDetailsResponse);
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
        string  path = string `/past_meetings/${meetingUUID}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListPastMeetingParticipantsResponse response = check self.clientEp-> get(path, targetType = ListPastMeetingParticipantsResponse);
        return response;
    }
    # List meeting polls
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:**. List polls of a Meeting  returned 
    @display {label: "Get Meeting Polls"}
    remote isolated function getMeetingPolls(@display {label: "Meeting Id"} int meetingId) returns MeetingPollsResponse|error {
        string  path = string `/meetings/${meetingId}/polls`;
        MeetingPollsResponse response = check self.clientEp-> get(path, targetType = MeetingPollsResponse);
        return response;
    }
    # Create a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting poll object 
    # + return - **HTTP Status Code:** `201`. Meeting Poll Created 
    @display {label: "Create Meeting Poll"}
    remote isolated function createMeetingPoll(@display {label: "Meeting Id"} int meetingId, CreateMeetingPollRequest payload) returns CreateMeetingPollResponse|error {
        string  path = string `/meetings/${meetingId}/polls`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateMeetingPollResponse response = check self.clientEp->post(path, request, targetType=CreateMeetingPollResponse);
        return response;
    }
    # Get a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + pollId - The poll ID 
    # + return - **HTTP Status Code:** `200`. Meeting Poll object returned 
    @display {label: "Get Meeting Poll"}
    remote isolated function getMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns GetMeetingPollResponse|error {
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        GetMeetingPollResponse response = check self.clientEp-> get(path, targetType = GetMeetingPollResponse);
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
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + pollId - The poll ID 
    # + return - **HTTP Status Code:** `204`. Meeting Poll deleted 
    @display {label: "Delete Meeting Poll"}
    remote isolated function deleteMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Perform batch poll creation
    #
    # + meetingId - Meeting Id 
    # + payload - Batch Meeting poll object 
    # + return - **HTTP Status Code:** `201`. Meeting Poll Created 
    @display {label: "Create Batch Polls"}
    remote isolated function createBatchPolls(@display {label: "Meeting Id"} string meetingId, CreateBatchPollsRequest payload) returns CreateBatchPollsResponse|error {
        string  path = string `/meetings/${meetingId}/batch_polls`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateBatchPollsResponse response = check self.clientEp->post(path, request, targetType=CreateBatchPollsResponse);
        return response;
    }
    # Get meeting invitation
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + return - **HTTP Status Code:** `200`<br> Meeting invitation returned. 
    @display {label: "Get Meeting Invitation"}
    remote isolated function getMeetingInvitation(@display {label: "Meeting Id"} int meetingId) returns GetMeetingInvitationResponse|error {
        string  path = string `/meetings/${meetingId}/invitation`;
        GetMeetingInvitationResponse response = check self.clientEp-> get(path, targetType = GetMeetingInvitationResponse);
        return response;
    }
    # Get live stream details
    #
    # + meetingId - Unique identifier of the meeting. 
    # + return - **HTTP Status Code:** `200` **OK**.  Live Stream details returned. 
    @display {label: "Get Live Stream Details"}
    remote isolated function getLiveStreamDetails(@display {label: "Meeting Id"} string meetingId) returns GetLiveStreamDetailsResponse|error {
        string  path = string `/meetings/${meetingId}/livestream`;
        GetLiveStreamDetailsResponse response = check self.clientEp-> get(path, targetType = GetLiveStreamDetailsResponse);
        return response;
    }
    # Update a live stream
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON). While storing it in your database, store it as a **long** data type and **not as an integer**, as the Meeting IDs can be longer than 10 digits. 
    # + payload - Meeting 
    # + return - **HTTP Status Code:** `204`. Meeting live stream updated. 
    @display {label: "Update Meeting Live Stream"}
    remote isolated function updateMeetingLiveStream(@display {label: "Meeting Id"} int meetingId, UpdateMeetingLiveStreamDetailsRequest payload) returns http:Response|error {
        string  path = string `/meetings/${meetingId}/livestream`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
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
        string  path = string `/webinars/${webinarId}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "tracking_source_id": trackingSourceId, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListWebinarRegistrantsResponse response = check self.clientEp-> get(path, targetType = ListWebinarRegistrantsResponse);
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
        string  path = string `/past_webinars/${webinarId}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListWebinarParticipantsResponse response = check self.clientEp-> get(path, targetType = ListWebinarParticipantsResponse);
        return response;
    }
    # List webinar absentees
    #
    # + webinarUUID - The Webinar UUID. Each Webinar instance will generate its own Webinar UUID (i.e., after a Webinar ends, a new UUID will be generated for the next instance of the Webinar). Please double encode your UUID when using it for API calls if the UUID begins with a '/' or contains '//' in it. 
    # + occurrenceId - The meeting occurrence ID. 
    # + pageSize - The number of records returned within a single API call. 
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes. 
    # + return - **HTTP Status Code:** `200`  Success. **Error Code:** `200`  Webinar plan subscription is missing. Enable webinar for this user once the subscription is added:{userId}. 
    @display {label: "List Webinar Absentees"}
    remote isolated function listWebinarAbsentees(@display {label: "Webinar UUID"} string webinarUUID, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Page Size"} int pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListWebinarAbsentees|error {
        string  path = string `/past_webinars/${webinarUUID}/absentees`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListWebinarAbsentees response = check self.clientEp-> get(path, targetType = ListWebinarAbsentees);
        return response;
    }
    # List meeting templates
    #
    # + userId - Unique identifier of the user. Retrieve the value of this field by calling the [List users](https://marketplace.zoom.us/docs/api-reference/zoom-api/users/users) API. 
    # + return - **HTTP Status Code:** `200` **OK** 
    @display {label: "List Meeting Templates"}
    remote isolated function listMeetingTemplates(@display {label: "User Id"} string userId) returns ListMeetingTemplatesResponse|error {
        string  path = string `/users/${userId}/meeting_templates`;
        ListMeetingTemplatesResponse response = check self.clientEp-> get(path, targetType = ListMeetingTemplatesResponse);
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
