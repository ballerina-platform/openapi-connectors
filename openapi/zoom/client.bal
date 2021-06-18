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

public type CompoundListMeetingsResponse record {
    *PaginationObject;
    *MeetingList;
};

public type CompoundCreateMeetingResponse record {
    *MeetingMetadata;
    *RequestedMeetingDetails;
};

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
    record  { string title?; string value?;} [] custom_questions?;
    # A valid email address of the registrant.
    string email?;
    # Registrant's first name.
    string first_name?;
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
    int id?;
    # Unique URL for this registrant to join the meeting. This URL should only be shared with the registrant for whom the API request was made.
    string join_url?;
    # Unique identifier of the registrant.
    string registrant_id?;
    # The start time for the meeting.
    string start_time?;
    # Topic of the meeting.
    string topic?;
};

public type CompoundGetMeetingByIdResponse record {
    *MeetingFullMetadata;
    *RequestedMeetingDetails;
};

public type CompoundListPastMeetingParticipantsResponse record {
    *PaginationObject;
    *MeetingPartcipantsList;
};

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
    record  { # Unique identifier of the participant.
        string id?; # Name of the participant.
        string name?; # Email address of the participant.
        string user_email?;} [] participants?;
    # The total number of records available across all pages.
    int total_records?;
};

public type CompoundListWebinarAbsenteesResponse record {
    *PaginationObject;
    *RegistrantsList;
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
    # + page_size - The number of records returned within a single API call.
    # + next_page_token - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + page_number - The page number of the current page in the returned records.
    # + return - HTTP Status Code:200. List of meetings returned.
    @display {label: "List Meetings"}
    remote isolated function listMeetings(@display {label: "User Id"} string userId, @display {label: "Meeting Type"} string? 'type = "live", @display {label: "Page Size"} int? page_size = 30, @display {label: "Next Page Token"} string? next_page_token = (), @display {label: "Page Number"} string? page_number = ()) returns CompoundListMeetingsResponse|error {
        string  path = string `/users/${userId}/meetings`;
        map<anydata> queryParam = {'type: 'type, page_size: page_size, next_page_token: next_page_token, page_number: page_number};
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
    # + occurrence_id - The meeting occurrence ID.
    # + status - The registrant status
    # + page_size - The number of records returned within a single API call.
    # + page_number - Deprecated - The page number of the current page in the returned records.
    # + next_page_token - The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - HTTP Status Code:200. Successfully listed meeting registrants.
    @display {label: "List Meeting Registrants"}
    remote isolated function listMeetingRegistrants(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrence_id = (), @display {label: "Registrant Status"} string? status = "approved", @display {label: "Page Size"} int? page_size = 30, @display {label: "Page Number"} int? page_number = 1, @display {label: "Next Page Token"} string? next_page_token = ()) returns CompoundListMeetingRegistrantsResponse|error {
        string  path = string `/meetings/${meetingId}/registrants`;
        map<anydata> queryParam = {occurrence_id: occurrence_id, status: status, page_size: page_size, page_number: page_number, next_page_token: next_page_token};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListMeetingRegistrantsResponse response = check self.clientEp-> get(path, targetType = CompoundListMeetingRegistrantsResponse);
        return response;
    }
    # Add meeting registrant
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + payload - Meeting Registrant Details
    # + occurrence_ids - Occurrence IDs. You can find these with the meeting get API. Multiple values separated by comma.
    # + return - Add meeting registrant respond
    @display {label: "Add Meeting Registrant"}
    remote isolated function addMeetingRegistrant(@display {label: "Meeting Id"} int meetingId, CompoundAddMeetingRegistrantRequest payload, @display {label: "Occurence Id"} string? occurrence_ids = ()) returns AddMeetingRegistrantResponse|error {
        string  path = string `/meetings/${meetingId}/registrants`;
        map<anydata> queryParam = {occurrence_ids: occurrence_ids};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddMeetingRegistrantResponse response = check self.clientEp->post(path, request, targetType=AddMeetingRegistrantResponse);
        return response;
    }
    # Get a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + occurrence_id - Meeting Occurrence ID. Provide this field to view meeting details of a particular occurrence of the [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings).
    # + show_previous_occurrences - Set the value of this field to `true` if you would like to view meeting details of all previous occurrences of a [recurring meeting](https://support.zoom.us/hc/en-us/articles/214973206-Scheduling-Recurring-Meetings). 
    # + return - **HTTP Status Code:** `200` Meeting object returned.
    @display {label: "Get Meeting Details"}
    remote isolated function getMeetingById(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrence_id = (), @display {label: "Show Previous Occurrences"} boolean? show_previous_occurrences = ()) returns CompoundGetMeetingByIdResponse|error {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {occurrence_id: occurrence_id, show_previous_occurrences: show_previous_occurrences};
        path = path + check getPathForQueryParam(queryParam);
        CompoundGetMeetingByIdResponse response = check self.clientEp-> get(path, targetType = CompoundGetMeetingByIdResponse);
        return response;
    }
    # Delete a meeting
    #
    # + meetingId - The meeting ID in **long** format. The data type of this field is "long"(represented as int64 in JSON).
    # + occurrence_id - The meeting occurrence ID.
    # + schedule_for_reminder - `true`: Notify host and alternative host about the meeting cancellation via email.
    # + cancel_meeting_reminder - `true`: Notify registrants about the meeting cancellation via email. 
    # + return - **HTTP Status Code**: `204` Meeting deleted.
    @display {label: "Delete Meeting"}
    remote isolated function deleteMeeting(@display {label: "Meeting Id"} int meetingId, @display {label: "Occurence Id"} string? occurrence_id = (), @display {label: "Schedule for Reminder"} boolean? schedule_for_reminder = (), @display {label: "Meeting Cancellation Reminder"} string? cancel_meeting_reminder = ()) returns error? {
        string  path = string `/meetings/${meetingId}`;
        map<anydata> queryParam = {occurrence_id: occurrence_id, schedule_for_reminder: schedule_for_reminder, cancel_meeting_reminder: cancel_meeting_reminder};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # List past meeting participants
    #
    # + meetingUUID - The meeting UUID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for other API calls if the UUID begins with a '/'or contains '//' in it.
    # + page_size - The number of records returned within a single API call.
    # + next_page_token - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - **HTTP Status Code:** `200`<br>
    @display {label: "List Past Meeting Participants"}
    remote isolated function listPastMeetingParticipants(@display {label: "Meeting UUID"} string meetingUUID, @display {label: "Page Size"} int? page_size = 30, @display {label: "Next Page Token"} string? next_page_token = ()) returns CompoundListPastMeetingParticipantsResponse|error {
        string  path = string `/past_meetings/${meetingUUID}/participants`;
        map<anydata> queryParam = {page_size: page_size, next_page_token: next_page_token};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListPastMeetingParticipantsResponse response = check self.clientEp-> get(path, targetType = CompoundListPastMeetingParticipantsResponse);
        return response;
    }
    # List webinar registrants
    #
    # + webinarId - The webinar ID in "**long**" format(represented as int64 data type in JSON). 
    # + occurrence_id - The meeting occurrence ID.
    # + status - The registrant status: `pending` - Registrant's status is pending. `approved` - Registrant's status is approved.`denied` - Registrant's status is denied.
    # + tracking_source_id - The tracking source ID for the registrants. Useful if you share the webinar registration page in multiple locations. See [Creating source tracking links for webinar registration](https://support.zoom.us/hc/en-us/articles/360000315683-Creating-source-tracking-links-for-webinar-registration) for details.
    # + page_size - The number of records returned within a single API call.
    # + page_number - The page number of the current page in the returned records.
    # + next_page_token - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - HTTP Status Code: `200` Webinar plan subscription is missing. Enable webinar for this user once the subscription is added.
    @display {label: "List Webinar Meeting Registrants"}
    remote isolated function listWebinarRegistrants(@display {label: "Webinar Id"} int webinarId, @display {label: "Meeting Occurence Id"} string? occurrence_id = (), @display {label: "Status"} string? status = "approved", @display {label: "Tracking Source Id"} string? tracking_source_id = (), @display {label: "Page Size"} int? page_size = 30, @display {label: "Page Number"} int? page_number = 1, @display {label: "Next Page Token"} string? next_page_token = ()) returns CompoundListWebinarRegistrantsResponse|error {
        string  path = string `/webinars/${webinarId}/registrants`;
        map<anydata> queryParam = {occurrence_id: occurrence_id, status: status, tracking_source_id: tracking_source_id, page_size: page_size, page_number: page_number, next_page_token: next_page_token};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListWebinarRegistrantsResponse response = check self.clientEp-> get(path, targetType = CompoundListWebinarRegistrantsResponse);
        return response;
    }
    # List webinar participants
    #
    # + webinarId - Unique identifier of the webinar. You can retrieve the value of this field by calling the [list webinars](https://marketplace.zoom.us/docs/api-reference/zoom-api/webinars/webinars) API.
    # + page_size - The number of records returned within a single API call.
    # + next_page_token - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - Webinar participants' details
    @display {label: "List Webinar Participants"}
    remote isolated function listWebinarParticipants(@display {label: "Webinar Id"} string webinarId, @display {label: "Page Size"} int? page_size = 30, @display {label: "Next Page Token"} string? next_page_token = ()) returns ListWebinarParticipantsResponse|error {
        string  path = string `/past_webinars/${webinarId}/participants`;
        map<anydata> queryParam = {page_size: page_size, next_page_token: next_page_token};
        path = path + check getPathForQueryParam(queryParam);
        ListWebinarParticipantsResponse response = check self.clientEp-> get(path, targetType = ListWebinarParticipantsResponse);
        return response;
    }
    # List webinar absentees
    #
    # + WebinarUUID - The Webinar UUID. Each Webinar instance will generate its own Webinar UUID (i.e., after a Webinar ends, a new UUID will be generated for the next instance of the Webinar). Please double encode your UUID when using it for API calls if the UUID begins with a '/' or contains '//' in it.
    # + occurrence_id - The meeting occurrence ID.
    # + page_size - The number of records returned within a single API call.
    # + next_page_token - The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    # + return - **HTTP Status Code:** `200` 
    @display {label: "List Webinar Absentees"}
    remote isolated function listWebinarAbsentees(@display {label: "Webinar UUID"} string WebinarUUID, @display {label: "Occurence Id"} string? occurrence_id = (), @display {label: "Page Size"} int? page_size = 30, @display {label: "Next Page Token"} string? next_page_token = ()) returns CompoundListWebinarAbsenteesResponse|error {
        string  path = string `/past_webinars/${WebinarUUID}/absentees`;
        map<anydata> queryParam = {occurrence_id: occurrence_id, page_size: page_size, next_page_token: next_page_token};
        path = path + check getPathForQueryParam(queryParam);
        CompoundListWebinarAbsenteesResponse response = check self.clientEp-> get(path, targetType = CompoundListWebinarAbsenteesResponse);
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
