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

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# List of meetings
public type CompoundListMeetingsResponse record {
    *PaginationObject;
    *MeetingList;
};

# Response received from meeting creation
public type CompoundCreateMeetingResponse record {
    *MeetingMetadata;
    *RequestedMeetingDetails;
};

# List of meeting registrants
public type CompoundListMeetingRegistrantsResponse record {
    *PaginationObject;
    *RegistrantsList;
};

# Registrant base object
public type CompoundAddMeetingRegistrantRequest record {
    # Registrant's address.
    string address?;
    # Registrant's city.
    string city?;
    # A field that allows registrants to provide any questions or comments that they might have.
    string comments?;
    # Registrant's country. The value of this field must be in two-letter abbreviated form and must match the ID field provided in the [Countries](https://marketplace.zoom.us/docs/api-reference/other-references/abbreviation-lists#countries) table.
    string country?;
    # Custom questions.
    RegistrantCustomQuestion[] custom_questions?;
    # A valid email address of the registrant.
    string email;
    # Registrant's first name.
    string first_name;
    # Registrant's Industry.
    string industry?;
    # Registrant's job title.
    string job_title?;
    # Registrant's last name.
    string last_name?;
    # Number of Employees: `1-20`, `21-50`, `51-100`, `101-500`, `500-1,000`, `1,001-5,000`, `5,001-10,000`, `More than 10,000`
    string no_of_employees?;
    # Registrant's Organization.
    string org?;
    # Registrant's Phone number.
    string phone?;
    # This field can be included to gauge interest of webinar attendees towards buying your product or service.
    string purchasing_time_frame?;
    # Role in Purchase Process: `Decision Maker`, `Evaluator/Recommender`, `Influencer`, `Not involved` 
    string role_in_purchase_process?;
    # Registrant's State/Province.
    string state?;
    # Registrant's Zip/Postal Code.
    string zip?;
};

# Add meeting registrant respond
public type AddMeetingRegistrantResponse record {
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id;
    # Unique URL for this registrant to join the meeting. This URL should only be shared with the registrant for whom the API request was made.
    string join_url?;
    # Unique identifier of the registrant.
    string registrant_id?;
    # The start time for the meeting.
    string start_time?;
    # Topic of the meeting.
    string topic?;
};

# Meeting registrant update request
public type UpdateMeetingRegistrantStatusRequest record {
    # Registrant Status:<br>`approve` - Approve registrant.<br>`cancel` - Cancel previously approved registrant's registration.<br>`deny` - Deny registrant.
    string action;
    # List of registrants.
    SimplifiedRegistrantDetails[] registrants?;
};

# Meeting details 
public type CompoundGetMeetingByIdResponse record {
    *MeetingFullMetadata;
    *RequestedMeetingDetails;
};

# Base object for sessions.
public type CompoundUpdateMeetingRequest record {
    # Email or userId if you want to schedule meeting for another user.
    string schedule_for?;
    # Meeting description.
    string agenda?;
    # Meeting duration (minutes). Used for scheduled meetings only.
    int duration?;
    # Meeting passcode. Passcode may only contain the following characters: [a-z A-Z 0-9 @ - _ *] and can have a maximum of 10 characters.
    string password?;
    # Recurrence related meeting informations
    ReccurenceDetails recurrence?;
    # Meeting settings
    MeetingSettings settings?;
    # Meeting start time. When using a format like "yyyy-MM-dd'T'HH:mm:ss'Z'", always use GMT time. When using a format like "yyyy-MM-dd'T'HH:mm:ss", you should use local time and  specify the time zone. Only used for scheduled meetings and recurring meetings with a fixed time.
    string start_time?;
    # Unique identifier of the meeting template. 
    string template_id?;
    # Time zone to format start_time. For example, "America/Los_Angeles". For scheduled meetings only. Please reference our [time zone](#timezones) list for supported time zones and their formats.
    string timezone?;
    # Meeting topic.
    string topic?;
    # Tracking fields
    TrackingFields[] tracking_fields?;
    # Meeting Types:<br>`1` - Instant meeting.<br>`2` - Scheduled meeting.<br>`3` - Recurring meeting with no fixed time.<br>`8` - Recurring meeting with a fixed time.
    int 'type?;
};

# Meeting status update details
public type UpdateMeetingStatusRequest record {
    # `end` - End a meeting.<br>
    string action?;
};

# List of ended meeting instances returned. **HTTP Status Code:** `200`. 
public type ListPastMeetingsResponse record {
    # List of ended meeting instances.
    EndedMeetingDetails[] meetings?;
};

# Polls returned successfully. **HTTP Status Code:** `200` **OK**. 
public type ListPastMeetingPollsResponse record {
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id;
    # Answers submitted by users.
    UserSubmittedAnswers[] questions?;
    # The start time of the meeting.
    string start_time?;
    # Meeting UUID.
    string uuid?;
};

# Meeting details returned. **HTTP Status Code:** `200`. 
public type GetPastMeetingDetailsResponse record {
    # Meeting duration.
    int duration?;
    # Meeting end time (GMT).
    string end_time?;
    # Host ID.
    string host_id?;
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id;
    # Number of meeting participants.
    int participants_count?;
    # Meeting start time (GMT).
    string start_time?;
    # Meeting topic.
    string topic?;
    # Sum of meeting minutes from all participants in the meeting.
    int total_minutes?;
    # Meeting type.
    int 'type?;
    # User email.
    string user_email?;
    # User display name.
    string user_name?;
    # Meeting UUID.
    string uuid?;
};

# List of past meeting participants
public type CompoundListPastMeetingParticipantsResponse record {
    *PaginationObject;
    *MeetingPartcipantsList;
};

# List polls of a Meeting  returned. **HTTP Status Code:**.
public type GetMeetingPollsResponse record {
    # Array of Polls
    PollDetails[] polls?;
    # The number of all records available across pages
    int total_records?;
};

# Meeting poll object
public type CreateMeetingPollRequest record {
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Response received from poll creation
public type CompoundCreateMeetingPollResponse record {
    # Meeting Poll ID
    string id?;
    # Status of the Meeting Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Meeting poll details
public type CompoundGetMeetingPollResponse record {
    # Meeting Poll ID
    string id?;
    # Status of the Meeting Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Updated poll request 
public type CompoundUpdateMeetingPollRequest record {
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Batch meeting poll object
public type CreateBatchPollsRequest record {
    # Array of Poll Questions
    PollQuestions[] questions?;
    # Meeting Poll Title.
    string title?;
};

# Meeting poll created. **HTTP Status Code:** `201`. 
public type CreateBatchPollsResponse record {
    # create batch poll response
    AddPollQuestionsResponse[] polls?;
};

# Meeting invitation. **HTTP Status Code:** `200`.
public type GetMeetingInvitationResponse record {
    # Meeting invitation.
    string invitation?;
};

# Live Stream details returned. **HTTP Status Code:** `200` **OK**.  
public type GetLiveStreamDetailsResponse record {
    # Live streaming page URL. This is the URL using which anyone can view the live stream of the meeting.
    string page_url?;
    # Stream Key.
    string stream_key;
    # Stream URL.
    string stream_url;
};

# Meeting live stream update request. 
public type UpdateMeetingLiveStreamRequest record {
    # The livestream page URL.
    string page_url;
    # Stream name and key.
    string stream_key;
    # Streaming URL.
    string stream_url;
};

# List of webinar registrants  
public type CompoundListWebinarRegistrantsResponse record {
    *PaginationObject;
    *RegistrantsList;
};

# Webinar participants' details
public type ListWebinarParticipantsResponse record {
    # The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    string next_page_token?;
    # The number of pages returned for this request.
    int page_count?;
    # The total number of records returned from a single API call.
    int page_size?;
    # ParticipantsDetails
    WebinarParticipantDetails[] participants?;
    # The total number of records available across all pages.
    int total_records?;
};

# List of webinar absentees  
public type CompoundListWebinarAbsenteesResponse record {
    *PaginationObject;
    *RegistrantsList;
};

# List of meeting templates. **HTTP Status Code:** `200` **OK**
public type ListMeetingTemplatesResponse record {
    # template details
    TemplateDetails[] templates?;
    # Total records found for this request.
    int total_records?;
};

# Client endpoint for Zoom API
#
# + clientEp - Connector http endpoint
@display {label: "Zoom Client"}
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.zoom.us/v2") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
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
    remote isolated function listMeetings(@display {label: "User Id"} string userId, @display {label: "Meeting Type"} string? 'type = "live", @display {label: "Page Size"} int? pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = (), @display {label: "Page Number"} string? pageNumber = ()) returns CompoundListMeetingsResponse|error {
        string  path = string `/users/${userId}/meetings`;
        map<anydata> queryParam = {"type": 'type, "page_size": pageSize, "next_page_token": nextPageToken, "page_number": pageNumber};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListMeetingsResponse response = check self.clientEp-> get(path, targetType = CompoundListMeetingsResponse);
        return response;
    }
    # Create a meeting
    #
    # + userId - The user ID or email address of the user. For user-level apps, pass me as the value for userId.
    # + payload - Meeting detailed.
    # + return - HTTP Status Code:201 - Meeting created.
    @display {label: "Create Meeting"}
    remote isolated function createMeeting(@display {label: "User Id"} string userId, @display {label: "Meeting Details"} MeetingDetails payload) returns CompoundCreateMeetingResponse|error {
        string  path = string `/users/${userId}/meetings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundCreateMeetingResponse response = check self.clientEp->post(path, request, targetType=CompoundCreateMeetingResponse);
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
    remote isolated function listMeetingRegistrants(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Registrant Status"} string? status = "approved", @display {label: "Page Size"} int? pageSize = 30, @display {label: "Page Number"} int? pageNumber = 1, @display {label: "Next Page Token"} string? nextPageToken = ()) returns CompoundListMeetingRegistrantsResponse|error {
        string  path = string `/meetings/${meetingId}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListMeetingRegistrantsResponse response = check self.clientEp-> get(path, targetType = CompoundListMeetingRegistrantsResponse);
        return response;
    }
    # Add meeting registrant
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting Registrant Details
    # + occurrenceIds - Occurrence IDs. You can find these with the meeting get API. Multiple values separated by comma.
    # + return - Add meeting registrant respond
    @display {label: "Add Meeting Registrant"}
    remote isolated function addMeetingRegistrant(@display {label: "Meeting Id"} int meetingId, CompoundAddMeetingRegistrantRequest payload, @display {label: "Occurence Id"} string? occurrenceIds = ()) returns AddMeetingRegistrantResponse|error {
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
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + return - **HTTP Status Code:** `200`. Meeting Registrant Question object returned
    @display {label: "List Registrant Questions"}
    remote isolated function getMeetingRegistrantsQuestions(@display {label: "Meeting Id"} int meetingId) returns RegistrantQuestions|error {
        string  path = string `/meetings/${meetingId}/registrants/questions`;
        RegistrantQuestions response = check self.clientEp-> get(path, targetType = RegistrantQuestions);
        return response;
    }
    # Update registration questions
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting Registrant Questions
    # + return - **HTTP Status Code:** `204`. Meeting Registrant Questions Updated
    @display {label: "Update Registration Questions"}
    remote isolated function updateMeetingRegistrantQuestions(@display {label: "Meeting Id"} int meetingId, RegistrantQuestions payload) returns error? {
        string  path = string `/meetings/${meetingId}/registrants/questions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> patch(path, request, targetType=http:Response);
    }
    # Update registrant's status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).  
    # + payload - Request payload for meeting registrant status update
    # + occurrenceId - The meeting occurrence ID.
    # + return - **HTTP Status Code:** `204`. Registrant status updated.
    @display {label: "Update Meeting Registrant's Status"}
    remote isolated function updateMeetingRegistrantStatus(@display {label: "Meting Id"} int meetingId, UpdateMeetingRegistrantStatusRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns error? {
        string  path = string `/meetings/${meetingId}/registrants/status`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> put(path, request, targetType=http:Response);
    }
    # Delete a meeting registrant
    #
    # + meetingId - The meeting ID.
    # + registrantId - The meeting registrant ID.
    # + occurrenceId - The meeting occurence ID.
    # + return - **HTTP status code:** `204` OK
    @display {label: "Delete Meeting Registrant"}
    remote isolated function deleteMeetingregistrant(@display {label: "Meeting Id"} int meetingId, @display {label: "Registrant Id"} string registrantId, @display {label: "occurence Id"} string? occurrenceId = ()) returns error? {
        string  path = string `/meetings/${meetingId}/registrants/${registrantId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + occurrenceId - Meeting Occurrence ID. Provide this field to view meeting details of a particular occurrence of the [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings).
    # + showPreviousOccurrences - Set the value of this field to `true` if you would like to view meeting details of all previous occurrences of a [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings). 
    # + return - **HTTP Status Code:** `200` Meeting object returned.
    @display {label: "Get Meeting Details"}
    remote isolated function getMeetingById(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Show Previous Occurrences"} boolean? showPreviousOccurrences = ()) returns CompoundGetMeetingByIdResponse|error {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "show_previous_occurrences": showPreviousOccurrences};
        path = path + check getPathForQueryParam(queryParam);
        CompoundGetMeetingByIdResponse response = check self.clientEp-> get(path, targetType = CompoundGetMeetingByIdResponse);
        return response;
    }
    # Delete a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + occurrenceId - The meeting occurrence ID.
    # + scheduleForReminder - `true`: Notify host and alternative host about the meeting cancellation via email.
    # + cancelMeetingReminder - `true`: Notify registrants about the meeting cancellation via email. 
    # + return - **HTTP Status Code**: `204` Meeting deleted.
    @display {label: "Delete Meeting"}
    remote isolated function deleteMeeting(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Schedule for Reminder"} boolean? scheduleForReminder = (), @display {label: "Meeting Cancellation Reminder"} string? cancelMeetingReminder = ()) returns error? {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "schedule_for_reminder": scheduleForReminder, "cancel_meeting_reminder": cancelMeetingReminder};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Update a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting
    # + occurrenceId - Meeting occurrence id. Support change of agenda, start_time, duration, settings: {host_video, participant_video, join_before_host, mute_upon_entry, waiting_room, watermark, auto_recording}
    # + return - **HTTP Status Code:** `204`. Meeting updated.
    @display {label: "Update Meeting"}
    remote isolated function updateMeeting(@display {label: "Meeting Id"} int meetingId, CompoundUpdateMeetingRequest payload, @display {label: "Occurrence Id"} string? occurrenceId = ()) returns error? {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> patch(path, request, targetType=http:Response);
    }
    # Update meeting status
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting status update details
    # + return - **HTTP Status Code:** `204`. Meeting updated.
    @display {label: "Update Meeting Status"}
    remote isolated function updateMeetingStatus(@display {label: "Meeting Id"} int meetingId, UpdateMeetingStatusRequest payload) returns error? {
        string  path = string `/meetings/${meetingId}/status`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> put(path, request, targetType=http:Response);
    }
    # List ended meeting instances
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + return - **HTTP Status Code:** `200`. List of ended meeting instances returned.
    @display {label: "List Past Meetings"}
    remote isolated function listPastMeetings(@display {label: "Meeting Id"} int meetingId) returns ListPastMeetingsResponse|error {
        string  path = string `/past_meetings/${meetingId}/instances`;
        ListPastMeetingsResponse response = check self.clientEp-> get(path, targetType = ListPastMeetingsResponse);
        return response;
    }
    # List past meeting's poll results
    #
    # + meetingId - The meeting ID or the meeting UUID.  If a meeting ID is provided in the request instead of a UUID, the response will be for the latest meeting instance.
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
    remote isolated function getPastMeetingDetails(@display {label: "Meeting UUID"} string meetingUUID) returns GetPastMeetingDetailsResponse|error {
        string  path = string `/past_meetings/${meetingUUID}`;
        GetPastMeetingDetailsResponse response = check self.clientEp-> get(path, targetType = GetPastMeetingDetailsResponse);
        return response;
    }
    # List past meeting participants
    #
    # + meetingUUID - The meeting UUID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for other API calls if the UUID begins with a '/'or contains '//' in it.
    # + pageSize - The number of records returned within a single API call.
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - **HTTP Status Code:** `200`. Meeting participants' report returned.
    @display {label: "List Past Meeting Participants"}
    remote isolated function listPastMeetingParticipants(@display {label: "Meeting UUID"} string meetingUUID, @display {label: "Page Size"} int? pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns CompoundListPastMeetingParticipantsResponse|error {
        string  path = string `/past_meetings/${meetingUUID}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListPastMeetingParticipantsResponse response = check self.clientEp-> get(path, targetType = CompoundListPastMeetingParticipantsResponse);
        return response;
    }
    # List meeting polls
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + return - **HTTP Status Code:**. List polls of a Meeting  returned
    @display {label: "Get Meeting Polls"}
    remote isolated function getMeetingPolls(@display {label: "Meeting Id"} int meetingId) returns GetMeetingPollsResponse|error {
        string  path = string `/meetings/${meetingId}/polls`;
        GetMeetingPollsResponse response = check self.clientEp-> get(path, targetType = GetMeetingPollsResponse);
        return response;
    }
    # Create a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting poll object
    # + return - **HTTP Status Code:** `201`. Meeting Poll Created
    @display {label: "Create Meeting Poll"}
    remote isolated function createMeetingPoll(@display {label: "Meeting Id"} int meetingId, CreateMeetingPollRequest payload) returns CompoundCreateMeetingPollResponse|error {
        string  path = string `/meetings/${meetingId}/polls`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundCreateMeetingPollResponse response = check self.clientEp->post(path, request, targetType=CompoundCreateMeetingPollResponse);
        return response;
    }
    # Get a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + pollId - The poll ID
    # + return - **HTTP Status Code:** `200`. Meeting Poll object returned
    @display {label: "Get Meeting Poll"}
    remote isolated function getMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns CompoundGetMeetingPollResponse|error {
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        CompoundGetMeetingPollResponse response = check self.clientEp-> get(path, targetType = CompoundGetMeetingPollResponse);
        return response;
    }
    # Update a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + pollId - The poll ID
    # + payload - Meeting Poll
    # + return - **HTTP Status Code:** `204`. Meeting Poll Updated
    @display {label: "Update Meeting Poll"}
    remote isolated function updateMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId, CompoundUpdateMeetingPollRequest payload) returns error? {
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> put(path, request, targetType=http:Response);
    }
    # Delete a meeting poll
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + pollId - The poll ID
    # + return - **HTTP Status Code:** `204`. Meeting Poll deleted
    @display {label: "Delete Meeting Poll"}
    remote isolated function deleteMeetingPoll(@display {label: "Meeting Id"} int meetingId, @display {label: "Poll Id"} string pollId) returns error? {
        string  path = string `/meetings/${meetingId}/polls/${pollId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
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
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + return - **HTTP Status Code:** `200`<br>
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
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting
    # + return - **HTTP Status Code:** `204`. Meeting live stream updated.
    @display {label: "Update Meeting Live Stream"}
    remote isolated function updateMeetingLiveStream(@display {label: "Meeting Id"} int meetingId, UpdateMeetingLiveStreamRequest payload) returns error? {
        string  path = string `/meetings/${meetingId}/livestream`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> patch(path, request, targetType=http:Response);
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
    remote isolated function listWebinarRegistrants(@display {label: "Webinar Id"} int webinarId, @display {label: "Meeting Occurence Id"} string? occurrenceId = (), @display {label: "Status"} string? status = "approved", @display {label: "Tracking Source Id"} string? trackingSourceId = (), @display {label: "Page Size"} int? pageSize = 30, @display {label: "Page Number"} int? pageNumber = 1, @display {label: "Next Page Token"} string? nextPageToken = ()) returns CompoundListWebinarRegistrantsResponse|error {
        string  path = string `/webinars/${webinarId}/registrants`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "status": status, "tracking_source_id": trackingSourceId, "page_size": pageSize, "page_number": pageNumber, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListWebinarRegistrantsResponse response = check self.clientEp-> get(path, targetType = CompoundListWebinarRegistrantsResponse);
        return response;
    }
    # List webinar participants
    #
    # + webinarId - Unique identifier of the webinar. You can retrieve the value of this field by calling the [list webinars](https://marketplace.zoom.us/docs/api-reference/zoom-api/webinars/webinars) API.
    # + pageSize - The number of records returned within a single API call.
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - Webinar participants' details
    @display {label: "List Webinar Participants"}
    remote isolated function listWebinarParticipants(@display {label: "Webinar Id"} string webinarId, @display {label: "Page Size"} int? pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns ListWebinarParticipantsResponse|error {
        string  path = string `/past_webinars/${webinarId}/participants`;
        map<anydata> queryParam = {"page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListWebinarParticipantsResponse response = check self.clientEp-> get(path, targetType = ListWebinarParticipantsResponse);
        return response;
    }
    # List webinar absentees
    #
    # + WebinarUUID - Parameter Description  
    # + occurrenceId - The meeting occurrence ID.  
    # + pageSize - The number of records returned within a single API call.  
    # + nextPageToken - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - **HTTP Status Code:** `200`
    @display {label: "List Webinar Absentees"}
    remote isolated function listWebinarAbsentees(@display {label: "Webinar UUID"} string WebinarUUID, @display {label: "Occurence Id"} string? occurrenceId = (), @display {label: "Page Size"} int? pageSize = 30, @display {label: "Next Page Token"} string? nextPageToken = ()) returns CompoundListWebinarAbsenteesResponse|error {
        string  path = string `/past_webinars/${WebinarUUID}/absentees`;
        map<anydata> queryParam = {"occurrence_id": occurrenceId, "page_size": pageSize, "next_page_token": nextPageToken};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListWebinarAbsenteesResponse response = check self.clientEp-> get(path, targetType = CompoundListWebinarAbsenteesResponse);
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
