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

public type TrackingFields record {
    # Tracking fields type
    string 'field?;
    # Tracking fields value
    string value?;
};

# Custom Question.
public type RegistrantCustomQuestion record {
    # Question title
    string title?;
    # Question value
    string value?;
};

# List of users.
public type ListWebinarAbsentees record {
    *PaginationObject;
    *RegistrantsList;
};

# Poll questions
public type PollQuestions record {
    # Possible answers for the question.
    string[] answers?;
    # Name of the question.
    string name?;
    # Question type:<br>`single` - Single choice<br>`mutliple` - Multiple choice
    string 'type?;
};

# Participant's details
public type PartcipantDetails record {
    # Universally unique identifier of the Participant. It is the same as the User ID of the participant if the participant joins the meeting by logging into Zoom. If the participant joins the meeting without logging in, the value of this field will be blank.
    string id?;
    # Participant display name.
    string name?;
    # Email address of the user. This field will be returned if the user logged into Zoom to join the meeting.
    string user_email?;
};

public type GetLiveStreamDetailsResponse record {
    # Live streaming page URL. This is the URL using which anyone can view the live stream of the meeting.
    string page_url?;
    # Stream Key.
    string stream_key?;
    # Stream URL.
    string stream_url?;
};

# Meeting Registrant Questions
public type RegistrantQuestions record {
    # Array of Registrant Custom Questions
    CustomQuestions[] custom_questions?;
    # Array of Registrant Questions
    CustomRegistrantQuestions[] questions?;
};

public type ListMeetingTemplatesResponse record {
    TemplateDetails[] templates?;
    # Total records found for this request.
    int total_records?;
};

# Setting to pre-assign breakout rooms
public type BreakoutRoomSettings record {
    # Set the value of this field to `true` if you would like to enable the pre-assigned breakout rooms. 
    boolean enable?;
    # Create room(s).
    BreakoutRoomsDetails[] rooms?;
};

# Details of the meeting.
public type GetMeetingDetailsResponse record {
    *MeetingFullMetadata;
    *RequestedMeetingDetails;
};

# List of participants
public type ListPastMeetingParticipantsResponse record {
    *PaginationObject;
    *MeetingPartcipantsList;
};

# List of users.
public type ListMeetingRegistrantsResponse record {
    *PaginationObject;
    *RegistrantsList;
};

public type UpdateMeetingRequest record {
    # Email or userId if you want to schedule meeting for another user.
    string schedule_for?;
    # Meeting description.
    string agenda?;
    # Meeting duration (minutes). Used for scheduled meetings only.
    int duration?;
    # Meeting passcode. Passcode may only contain the following characters: [a-z A-Z 0-9 @ - _ *] and can have a maximum of 10 characters.
    # 
    # **Note:** If the account owner or the admin has configured [minimum passcode requirement settings](https://support.zoom.us/hc/en-us/articles/360033559832-Meeting-and-webinar-passwords#h_a427384b-e383-4f80-864d-794bf0a37604), the passcode value provided here must meet those requirements. <br><br>If the requirements are enabled, you can view those requirements by calling either the [Get User Settings API](https://marketplace.zoom.us/docs/api-reference/zoom-api/users/usersettings) or the  [Get Account Settings](https://marketplace.zoom.us/docs/api-reference/zoom-api/accounts/accountsettings) API. 
    string password?;
    # Recurrence related meeting informations
    ReccurenceDetails recurrence?;
    # Meeting settings
    MeetingSettings settings?;
    # Meeting start time. When using a format like "yyyy-MM-dd'T'HH:mm:ss'Z'", always use GMT time. When using a format like "yyyy-MM-dd'T'HH:mm:ss", you should use local time and  specify the time zone. Only used for scheduled meetings and recurring meetings with a fixed time.
    string start_time?;
    # Unique identifier of the meeting template. 
    # 
    # Use this field if you would like to [schedule the meeting from a meeting template](https://support.zoom.us/hc/en-us/articles/360036559151-Meeting-templates#h_86f06cff-0852-4998-81c5-c83663c176fb). You can retrieve the value of this field by calling the [List meeting templates]() API.
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

public type GlobalDialInNumbersDetails record {
    # City of the number, if any. For example, Chicago.
    string city?;
    # Country code. For example, BR.
    string country?;
    # Full name of country. For example, Brazil.
    string country_name?;
    # Phone number. For example, +1 2332357613.
    string number?;
    # Type of number. 
    string 'type?;
};

# Language interpretation for meetings. 
public type LanguageInterpretationDetails record {
    # Indicate whether or not you would like to enable language interpretation or this meeting.
    boolean enable?;
    # Information associated with the interpreter.
    InterpreterDetails[] interpreters?;
};

# Poll
public type UpdateMeetingPollRequest record {
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

public type ParticipantDetails record {
    # Email address of the participant.
    string email?;
    # Name of the participant.
    string name?;
};

# Poll List
public type MeetingPollsResponse record {
    # Array of Polls
    PollDetails[] polls?;
    # The number of all records available across pages
    int total_records?;
};

# Meeting object
public type RequestedMeetingDetails record {
    # Agenda
    string agenda?;
    # The date and time at which this meeting was created.
    string created_at?;
    # Meeting duration.
    int duration?;
    # H.323/SIP room system password
    string h323_password?;
    # URL for participants to join the meeting. This URL should only be shared with users that you would like to invite for the meeting.
    string join_url?;
    # Array of occurrence objects.
    MeetingOccurenceDetails[] occurrences?;
    # Meeting password. Password may only contain the following characters: `[a-z A-Z 0-9 @ - _ * !]`
    # 
    # If "Require a password when scheduling new meetings" setting has been **enabled** **and** [locked](https://support.zoom.us/hc/en-us/articles/115005269866-Using-Tiered-Settings#locked) for the user, the password field will be autogenerated in the response even if it is not provided in the API request. 
    string password?;
    # Personal Meeting Id. Only used for scheduled meetings and recurring meetings with no fixed time.
    int pmi?;
    # Recurrence related meeting informations
    ReccurenceDetails recurrence?;
    # Meeting settings
    MeetingSettings settings?;
    # Meeting start date-time in UTC/GMT. Example: "2020-03-31T12:02:00Z"
    string start_time?;
    # URL to start the meeting. This URL should only be used by the host of the meeting and **should not be shared with anyone other than the host** of the meeting as anyone with this URL will be able to login to the Zoom Client as the host of the meeting.
    string start_url?;
    # Timezone to format start_time
    string timezone?;
    # Meeting topic
    string topic?;
    # Tracking fields
    RequestedMeetingTrackingDetails[] tracking_fields?;
    # Meeting Type
    int 'type?;
};

# Recurrence related meeting informations
public type ReccurenceDetails record {
    # Select the final date on which the meeting will recur before it is canceled. Should be in UTC time, such as 2017-11-25T12:00:00Z. (Cannot be used with "end_times".)
    string end_date_time?;
    # Select how many times the meeting should recur before it is canceled. (Cannot be used with "end_date_time".)
    int end_times?;
    # Use this field **only if you're scheduling a recurring meeting of type** `3` to state which day in a month, the meeting should recur. The value range is from 1 to 31.
    # 
    # For instance, if you would like the meeting to recur on 23rd of each month, provide `23` as the value of this field and `1` as the value of the `repeat_interval` field. Instead, if you would like the meeting to recur every three months, on 23rd of the month, change the value of the `repeat_interval` field to `3`.
    int monthly_day?;
    # Use this field **only if you're scheduling a recurring meeting of type** `3` to state the week of the month when the meeting should recur. If you use this field, **you must also use the `monthly_week_day` field to state the day of the week when the meeting should recur.** `-1` - Last week of the month.`1` - First week of the month.`2` - Second week of the month.`3` - Third week of the month.`4` - Fourth week of the month.
    int monthly_week?;
    # Use this field **only if you're scheduling a recurring meeting of type** `3` to state a specific day in a week when the monthly meeting should recur. To use this field, you must also use the `monthly_week` field. 
    # 
    # `1` - Sunday.`2` - Monday.`3` - Tuesday.`4` -  Wednesday.`5` - Thursday.`6` - Friday.`7` - Saturday.
    int monthly_week_day?;
    # Define the interval at which the meeting should recur. For instance, if you would like to schedule a meeting that recurs every two months, you must set the value of this field as `2` and the value of the `type` parameter as `3`. 
    # 
    # For a daily meeting, the maximum interval you can set is `90` days. For a weekly meeting the maximum interval that you can set is  of `12` weeks. For a monthly meeting, there is a maximum of `3` months.
    int repeat_interval?;
    # Recurrence meeting types:`1` - Daily.`2` - Weekly.`3` - Monthly.
    int 'type;
    # This field is required **if you're scheduling a recurring meeting of type** `2` to state which day(s) of the week the meeting should repeat.   The value for this field could be a number between `1` to `7` in string format. For instance, if the meeting should recur on Sunday, provide `"1"` as the value of this field. **Note:** If you would like the meeting to occur on multiple days of a week, you should provide comma separated values for this field. For instance, if the meeting should recur on Sundays and Tuesdays provide `"1,3"` as the value of this field.
    # 
    #  `1`  - Sunday. `2` - Monday.`3` - Tuesday.`4` -  Wednesday.`5` -  Thursday.`6` - Friday.`7` - Saturday.
    string weekly_days?;
};

public type CreateBatchPollsResponse record {
    AddPollQuestionsResponse[] polls?;
};

public type CustomKeys record {
    # Custom key associated with the user.
    string 'key?;
    # Value of the custom key associated with the user.
    string value?;
};

# Details of the created meeting.
public type CreateMeetingResponse record {
    *MeetingMetadata;
    *RequestedMeetingDetails;
};

# List of Meetings
public type ListPastMeetingsResponse record {
    # List of ended meeting instances.
    EndedMeetingDetails[] meetings?;
};

# Answers submitted by users
public type UserSubmittedAnswers record {
    # Email address of the user who submitted answers to the poll.
    string email?;
    # Name of the user who submitted answers to the poll. If "anonymous" option is enabled for a poll, the participant's polling information will be kept anonymous and the value of `name` field will be "Anonymous Attendee".
    string name?;
    PollQuestionAnswer[] question_details?;
};

public type PastMeetingDetailsResponse record {
    # Meeting duration.
    int duration?;
    # Meeting end time (GMT).
    string end_time?;
    # Host ID.
    string host_id?;
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id?;
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

public type GetMeetingPollResponse record {
    # Meeting Poll ID
    string id?;
    # Status of the Meeting Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

public type CustomRegistrantQuestions record {
    # Field name of the question.
    string field_name?;
    # Indicates whether or not the displayed fields are required to be filled out by registrants.
    boolean required?;
};

public type ListWebinarParticipantsResponse record {
    # The next page token is used to paginate through large result sets. A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    string next_page_token?;
    # The number of pages returned for this request.
    int page_count?;
    # The total number of records returned from a single API call.
    int page_size?;
    # ParticipantsDetails
    PartcipantDetails[] participants?;
    # The total number of records available across all pages.
    int total_records?;
};

# Meeting live stream.
public type UpdateMeetingLiveStreamDetailsRequest record {
    # The livestream page URL.
    string page_url?;
    # Stream name and key.
    string stream_key;
    # Streaming URL.
    string stream_url;
};

# Meeting settings
public type MeetingSettings record {
    # Allow attendees to join the meeting from multiple devices. This setting only works for meetings that require [registration](https://support.zoom.us/hc/en-us/articles/211579443-Setting-up-registration-for-a-meeting).
    boolean allow_multiple_devices?;
    # Alternative host's emails or IDs: multiple values are separated by a semicolon.
    string alternative_hosts?;
    # Flag to determine whether to send email notifications to alternative hosts, default value is true.
    boolean alternative_hosts_email_notification?;
    # The default value is `2`. To enable registration required, set the approval type to `0` or `1`.  `0` - Automatically approve. `1` - Manually approve. `2` - No registration required.
    int approval_type?;
    # Approve or block users from specific regions/countries from joining this meeting. 
    ApprovedOrDeniedCountriesDetails approved_or_denied_countries_or_regions?;
    # Determine how participants can join the audio portion of the  meeting. both : Both Telephony and VoIP, telephony :Telephony only, voip:VoIP only.
    string audio?;
    # If user has configured ["Sign Into Zoom with Specified Domains"](https://support.zoom.us/hc/en-us/articles/360037117472-Authentication-Profiles-for-Meetings-and-Webinars#h_5c0df2e1-cfd2-469f-bb4a-c77d7c0cca6f) option, this will list the domains that are authenticated.
    string authentication_domains?;
    # The participants added here will receive unique meeting invite links and bypass authentication.
    ParticipantDetails[] authentication_exception?;
    # Authentication name set in the [authentication profile](https://support.zoom.us/hc/en-us/articles/360037117472-Authentication-Profiles-for-Meetings-and-Webinars#h_5c0df2e1-cfd2-469f-bb4a-c77d7c0cca6f).
    string authentication_name?;
    # Specify the authentication type for users to join a meeting with `meeting_authentication` setting set to `true`. 
    string authentication_option?;
    # Automatic recording: `local` - Record on local. `cloud` - Record on cloud. `none` - Disabled.
    string auto_recording?;
    # Setting to pre-assign breakout rooms
    BreakoutRoomSettings breakout_room?;
    # Close registration after event date
    boolean close_registration?;
    # Host meeting in China.
    boolean cn_meeting?;
    # Contact email for registration
    string contact_email?;
    # Contact name for registration
    string contact_name?;
    # Custom keys and values assigned to the meeting.
    CustomKeys[10] custom_keys?;
    # Choose between enhanced encryption and [end-to-end encryption](https://support.zoom.us/hc/en-us/articles/360048660871) when starting or a meeting. When using end-to-end encryption, several features (e.g. cloud recording, phone/SIP/H.323 dial-in) will be **automatically disabled**. The value of this field can be one of the following:
    # `enhanced_encryption`: Enhanced encryption. Encryption is stored in the cloud if you enable this option. 
    # 
    # `e2ee`: [End-to-end encryption](https://support.zoom.us/hc/en-us/articles/360048660871). The encryption key is stored in your local device and can not be obtained by anyone else. Enabling this setting also **disables** the following features: join before host, cloud recording, streaming, live transcription, breakout rooms, polling, 1:1 private chat, and meeting reactions.
    string encryption_type?;
    # Only signed in users can join this meeting.
    # 
    # **This field is deprecated and will not be supported in the future.**  As an alternative, use the "meeting_authentication", "authentication_option" and "authentication_domains" fields to understand the [authentication configurations](https://support.zoom.us/hc/en-us/articles/360037117472-Authentication-Profiles-for-Meetings-and-Webinars) set for the meeting.
    boolean enforce_login?;
    # Only signed in users with specified domains can join meetings.
    # 
    # **This field is deprecated and will not be supported in the future.**  As an alternative, use the "meeting_authentication", "authentication_option" and "authentication_domains" fields to understand the [authentication configurations](https://support.zoom.us/hc/en-us/articles/360037117472-Authentication-Profiles-for-Meetings-and-Webinars) set for the meeting.
    string enforce_login_domains?;
    # List of global dial-in countries
    string[] global_dial_in_countries?;
    # Global Dial-in Countries/Regions
    GlobalDialInNumbersDetails[] global_dial_in_numbers?;
    # Start video when the host joins the meeting.
    boolean host_video?;
    # Host meeting in India.
    boolean in_meeting?;
    # If the value of "join_before_host" field is set to true, this field can be used to indicate time limits within which a participant may join a meeting before a host. The value of this field can be one of the following:
    # 
    # *  `0`: Allow participant to join anytime.
    # *  `5`: Allow participant to join 5 minutes before meeting start time.
    #  * `10`: Allow participant to join 10 minutes before meeting start time.
    int jbh_time?;
    # Allow participants to join the meeting before the host starts the meeting. Only used for scheduled or recurring meetings.
    boolean join_before_host?;
    # Language interpretation for meetings. 
    LanguageInterpretationDetails language_interpretation?;
    # `true` - Only authenticated users can join meetings.
    boolean meeting_authentication?;
    # Mute participants upon entry.
    boolean mute_upon_entry?;
    # Start video when participants join the meeting.
    boolean participant_video?;
    # Send confirmation email to registrants upon successful registration.
    boolean registrants_confirmation_email?;
    # Send email notifications to registrants about approval, cancellation, denial of the registration. The value of this field must be set to true in order to use the `registrants_confirmation_email` field.
    boolean registrants_email_notification?;
    # Registration type. Used for recurring meeting with fixed time only. `1` - Attendees register once and can attend any of the occurrences. `2` - Attendees need to register for each occurrence to attend. `3` - occurrences to attend.
    int registration_type?;
    # Show social share buttons on the meeting registration page.
    # This setting only works for meetings that require [registration](https://support.zoom.us/hc/en-us/articles/211579443-Setting-up-registration-for-a-meeting).
    boolean show_share_button?;
    # Use a personal meeting ID. Only used for scheduled meetings and recurring meetings with no fixed time.
    boolean use_pmi?;
    # Enable waiting room
    boolean waiting_room?;
    # Add watermark when viewing a shared screen.
    boolean watermark?;
};

# Meeting settings
public type MeetingSettingsInRequest record {
    # Enable additional data center regions for this meeting. Provide the value in  the form of array of country code(s) for the countries which are available as data center regions
    string[] additional_data_center_regions?;
    # If set to `true`, attendees will be allowed to join a meeting from multiple devices.
    boolean allow_multiple_devices?;
    # Alternative host's emails or IDs: multiple values separated by a comma.
    string alternative_hosts?;
    # Flag to determine whether to send email notifications to alternative hosts, default value is true.
    boolean alternative_hosts_email_notification?;
    # The default value is `2`. To enable registration required, set the approval type to `0` or `1`.  `0` - Automatically approve. `1` - Manually approve. `2` - No registration required.
    int approval_type?;
    # Approve or block users from specific regions/countries from joining this meeting.
    ApprovalAndDenialInfo approved_or_denied_countries_or_regions?;
    # Determine how participants can join the audio portion of the  meeting. both : Both Telephony and VoIP, telephony :Telephony only, voip:VoIP only.
    string audio?;
    # Meeting authentication domains. This option, allows you to specify the rule so that Zoom users, whose email address contains a certain domain, can join the meeting.
    string authentication_domains?;
    # Specify the authentication type for users to join a meeting with `meeting_authentication` setting set to `true`. 
    string authentication_option?;
    # Automatic recording: local - Record on local.cloud - Record on cloud.none - Disabled.
    string auto_recording?;
    # Setting to pre-assign breakout rooms
    BreakoutRoomSettings breakout_room?;
    # Close registration after event date
    boolean close_registration?;
    # Host meeting in China.
    boolean cn_meeting?;
    # Contact email for registration
    string contact_email?;
    # Contact name for registration
    string contact_name?;
    # Choose between enhanced encryption and end-to-end encryption. Values: enhanced_encryption, e2ee
    string encryption_type?;
    # List of global dial-in countries
    string[] global_dial_in_countries?;
    # Start video when the host joins the meeting.
    boolean host_video?;
    # Host meeting in India.
    boolean in_meeting?;
    #  If the value of join_before_host field is set to true, this field can be used to indicate time limits within which a participant may join a meeting before a host. The value of this field can be one of the following: 0: Allow participant to join anytime. 5: Allow participant to join 5 minutes before meeting start time. 10: Allow participant to join 10 minutes before meeting start time.
    int jbh_time?;
    # Allow participants to join the meeting before the host starts the meeting. This field can only used for scheduled or recurring meetings.
    boolean join_before_host?;
    # Language interpretation for meetings. 
    LanguageInterpretationDetails language_interpretation?;
    # Only authenticated users can join meeting if the value of this field is set to `true`.
    boolean meeting_authentication?;
    # Mute participants upon entry.
    boolean mute_upon_entry?;
    # Start video when participants join the meeting.
    boolean participant_video?;
    # Send email notifications to registrants about approval,  cancellation, denial of the registration. The value of this field must be set to true in order to use the `registrants_confirmation_email` field.
    boolean registrants_email_notification?;
    # Registration type. Used for recurring meeting with fixed time only. `1` - Attendees register once and can attend any of the occurrences. `2` - Attendees need to register for each occurrence to attend. `3` - occurrences to attend.
    int registration_type?;
    # If set to `true`, the registration page for the meeting will include social share buttons. 
    boolean show_share_button?;
    # Use Personal Meeting ID instead of an automatically generated meeting ID. It can only be used for scheduled meetings, instant meetings and recurring meetings with no fixed time.
    boolean use_pmi?;
    # Enable waiting room. Note that if the value of this field is set to `true`, it will override and disable the `join_before_host` setting.
    boolean waiting_room?;
    # Add watermark when viewing a shared screen.
    boolean watermark?;
};

public type AddMeetingRegistrantResponse record {
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id?;
    # Unique URL for this registrant to join the meeting. This URL should only be shared with the registrant for whom the API request was made.
    # If the meeting was [created](https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/meetingcreate) with manual approval type (`approval_type`: 1), the join URL will not be returned in the response.
    string join_url?;
    # Unique identifier of the registrant.
    string registrant_id?;
    # The start time for the meeting.
    string start_time?;
    # Topic of the meeting.
    string topic?;
};

public type RequestedMeetingTrackingDetails record {
    # Label of the tracking field.
    string 'field?;
    # Value for the field.
    string value?;
    # Indicates whether the [tracking field](https://support.zoom.us/hc/en-us/articles/115000293426-Scheduling-Tracking-Fields) is visible in the meeting scheduling options in the Zoom Web Portal or not.
    # 
    # `true`: Tracking field is visible. 
    # 
    # `false`: Tracking field is not visible to the users in the meeting options in the Zoom Web Portal but the field was used while scheduling this meeting via API. An invisible tracking field can be used by users while scheduling meetings via API only. 
    boolean visible?;
};

# Meeting Registrnats's Details
public type RegistrantsList record {
    # List of registrant objects.
    RegistrantDetails[] registrants?;
};

public type InterpreterDetails record {
    # Email address of the interpreter.
    string email?;
    # Languages for interpretation. The string must contain two separated by a comma. For example, if the language is to be interpreted from English to Chinese, the value of this field should be US,CN.
    string languages?;
};

# Poll
public type CreateMeetingPollRequest record {
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Registrant's details
public type RegistriantDetails record {
    # Registrant email
    string email?;
    # Registrant Id
    string id?;
};

public type BreakoutRoomsDetails record {
    # Name of the breakout room.
    string name?;
    # Email addresses of the participants who are to be assigned to the breakout room.
    string[] participants?;
};

# List of meeting participants
public type MeetingPartcipantsList record {
    # Array of meeting participant objects.
    PartcipantDetails[] participants?;
};

# Ended meeting details
public type EndedMeetingDetails record {
    # Start time
    string start_time?;
    # Meeting UUID. Unique meeting ID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). Please double encode your UUID when using it for API calls if the UUID begins with a '/'or contains '//' in it.
    string uuid?;
};

public type RegistrantDetails record {
    # Registrant ID.
    string id?;
    # Registrant's address.
    string address?;
    # Registrant's city.
    string city?;
    # A field that allows registrants to provide any questions or comments that they might have.
    string comments?;
    # Registrant's country.
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
    # 
    # Purchasing Time Frame:`Within a month``1-3 months``4-6 months``More than 6 months``No timeframe`
    string purchasing_time_frame?;
    # Role in Purchase Process: `Decision Maker`, `Evaluator/Recommender`, `Influencer`, `Not involved` 
    string role_in_purchase_process?;
    # Registrant's State/Province.
    string state?;
    # Registrant's Zip/Postal Code.
    string zip?;
    # The time at which the registrant registered.
    string create_time?;
    # The URL using which an approved registrant can join the webinar.
    string join_url?;
    # The status of the registrant's registration.  `approved`: User has been successfully approved for the webinar. `pending`:  The registration is still pending. `denied`: User has been denied from joining the webinar.
    string status?;
};

# Occurence object. This object is only returned for Recurring Webinars.
public type MeetingOccurenceDetails record {
    # Duration.
    int duration?;
    # Occurrence ID: Unique Identifier that identifies an occurrence of a recurring webinar. [Recurring webinars](https://support.zoom.us/hc/en-us/articles/216354763-How-to-Schedule-A-Recurring-Webinar) can have a maximum of 50 occurrences.
    string occurrence_id?;
    # Start time.
    string start_time?;
    # Occurrence status.
    string status?;
};

public type UpdateMeetingstatusRequest record {
    # `end` - End a meeting.<br>
    # `recover` - [Recover](https://support.zoom.us/hc/en-us/articles/360038297111-Recover-a-deleted-meeting) a deleted meeting.
    string action?;
};

public type CreateBatchPollsRequest record {
    PollQuestions[] questions?;
    # Meeting Poll Title.
    string title?;
};

# Answers submitted for poll questions
public type PollQuestionAnswer record {
    # Answer submitted by the user.
    string answer?;
    # Date and time at which the answer to the poll was submitted.
    string date_time?;
    # Unique identifier of the poll.
    string polling_id?;
    # Question asked during the poll.
    string question?;
};

# Meeting invitation details.
public type GetMeetingInvitationResponse record {
    # Meeting invitation.
    string invitation?;
};

public type PollDetails record {
    # ID of Poll
    string id?;
    # Status of Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# Approve or block users from specific regions/countries from joining this meeting. 
public type ApprovedOrDeniedCountriesDetails record {
    # List of countries/regions from where participants can join this meeting. 
    string[] approved_list?;
    # List of countries/regions from where participants can not join this meeting. 
    string[] denied_list?;
    # `true`: Setting enabled to either allow users or block users from specific regions to join your meetings. 
    # 
    # `false`: Setting disabled.
    boolean enable?;
    # Specify whether to allow users from specific regions to join this meeting; or block users from specific regions from joining this meeting. 
    # `approve`: Allow users from specific regions/countries to join this meeting. If this setting is selected, the approved regions/countries must be included in the `approved_list`.
    # `deny`: Block users from specific regions/countries from joining this meeting. If this setting is selected, the approved regions/countries must be included in the `denied_list`
    string method?;
};

public type MeetingObject record {
    # Meeting description. The length of agenda gets truncated to 250 characters when you list all meetings for a user. To view the complete agenda of a meeting, retrieve details for a single meeting [here](https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/meeting).
    string agenda?;
    # Time of creation. 
    string created_at?;
    # Meeting duration.
    int duration?;
    # ID of the user who is set as the host of the meeting.
    string host_id?;
    # Meeting ID - also known as the meeting number in double (int64) format.
    int id?;
    # Join URL.
    string join_url?;
    # Meeting start time.
    string start_time?;
    # Timezone to format the meeting start time. 
    string timezone?;
    # Meeting topic.
    string topic?;
    # Meeting Type: 1 - Instant meeting. 2 - Scheduled meeting. 3 - Recurring meeting with no fixed time. 8 - Recurring meeting with fixed time.
    int 'type?;
    # Unique Meeting ID. Each meeting instance will generate its own Meeting UUID.
    string uuid?;
};

# Pagination Object
public type PaginationObject record {
    # The next page token is used to paginate through large result sets.  A next page token will be returned whenever the set of available results exceeds the current page size. The expiration period for this token is 15 minutes.
    string next_page_token?;
    # The number of pages returned for the request made.
    int page_count?;
    # This field has been deprecated.
    int page_number?;
    # The number of records returned with a single API call.
    int page_size?;
    # The total number of all the records available across pages.
    int total_records?;
};

# Registrant base object
public type AddMeetingRegistrantRequest record {
    # Registrant's language preference for confirmation  emails. The value can be one of the following: `en-US`,`de-DE`,`es-ES`,`fr-FR`,`jp-JP`,`pt-PT`,`ru-RU`,`zh-CN`, `zh-TW`, `ko-KO`, `it-IT`, `vi-VN`.
    string language?;
    boolean auto_approve?;
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
    # 
    # Purchasing Time Frame:`Within a month``1-3 months``4-6 months``More than 6 months``No timeframe`
    string purchasing_time_frame?;
    # Role in Purchase Process: `Decision Maker`, `Evaluator/Recommender`, `Influencer`, `Not involved` 
    string role_in_purchase_process?;
    # Registrant's State/Province.
    string state?;
    # Registrant's Zip/Postal Code.
    string zip?;
};

# List of meetings
public type MeetingList record {
    # List of Meeting objects.
    MeetingObject[] meetings?;
};

# Response received from adding poll quetions
public type AddPollQuestionsResponse record {
    # Meeting Poll ID
    string id?;
    PollQuestions[] questions?;
    # Status of the Meeting Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Title for the Poll
    string title?;
};

# List of meetings
public type ListMeetingsResponse record {
    *PaginationObject;
    *MeetingList;
};

# Approve or block users from specific regions/countries from joining this meeting.
public type ApprovalAndDenialInfo record {
    # List of countries/regions from where participants can join this meeting. 
    string[] approved_list?;
    # List of countries/regions from where participants can not join this meeting. 
    string[] denied_list?;
    # `true`: Setting enabled to either allow users or block users from specific regions to join your meetings.  `false`: Setting disabled.
    boolean enable?;
    # Specify whether to allow users from specific regions to join thismeeting; or block users from specific regions from oining this meeting. Values: approve or deny
    string method?;
};

# Detailed Meeting Metadata
public type MeetingFullMetadata record {
    # Unique identifier of the scheduler who scheduled this meeting on behalf of the host. This field is only returned if you used "schedule_for" option in the [Create a Meeting API request](https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/meetingcreate).
    string assistant_id?;
    # Email address of the meeting host.
    string host_email?;
    # ID of the user who is set as host of meeting.
    string host_id?;
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id?;
    # Unique meeting ID. Each meeting instance will generate its own Meeting UUID (i.e., after a meeting ends, a new UUID will be generated for the next instance of the meeting). You can retrieve a list of UUIDs from past meeting instances using [this API](https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/pastmeetings) . Please double encode your UUID when using it for API calls if the UUID begins with a '/'or contains '//' in it.
    string uuid?;
};

# Template details
public type TemplateDetails record {
    # Unique identifier of the template.
    string id?;
    # Name of the template.
    string name?;
    # Type of the template. The value of this field can be one of the following:<br>
    # `1`: meeting template <br>
    # `2`: admin meeting template
    int 'type?;
};

public type ListPastMeetingPollsResponse record {
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id?;
    UserSubmittedAnswers[] questions?;
    # The start time of the meeting.
    string start_time?;
    # Meeting UUID.
    string uuid?;
};

public type CustomQuestions record {
    # Answer choices for the question. Can not be used for `short` question type as this type of question requires registrants to type out the answer.
    string[] answers?;
    # Indicates whether or not the custom question is required to be answered by participants or not.
    boolean required?;
    # Title of the custom question.
    string title?;
    # Type of the question being asked.
    string 'type?;
};

public type MeetingTrackingDetails record {
    # Label of the tracking field.
    string 'field;
    # Tracking fields value
    string value?;
};

# Meeting Metadata
public type MeetingMetadata record {
    # Unique identifier of the scheduler who scheduled this meeting on behalf of the host. This field is only returned if you used "schedule_for" option in the [Create a Meeting API request](https://marketplace.zoom.us/docs/api-reference/zoom-api/meetings/meetingcreate).
    string assistant_id?;
    # Email address of the meeting host.
    string host_email?;
    # [Meeting ID](https://support.zoom.us/hc/en-us/articles/201362373-What-is-a-Meeting-ID-): Unique identifier of the meeting in "**long**" format(represented as int64 data type in JSON), also known as the meeting number.
    int id;
    # URL using which registrants can register for a meeting. This field is only returned for meetings that have enabled registration.
    string registration_url?;
};

# Base object for meeting
public type MeetingDetails record {
    # Meeting description.
    string agenda?;
    # Meeting duration (minutes). Used for scheduled meetings only.
    int duration?;
    # Passcode to join the meeting.
    string password?;
    # Recurrence related meeting informations
    ReccurenceDetails recurrence?;
    # If you would like to schedule this meeting for someone else in your account, provide the Zoom user id or email address of the user here.
    string schedule_for?;
    # Meeting settings
    MeetingSettingsInRequest settings?;
    # Meeting start time. We support two formats for `start_time` - local time and GMT.To set time as GMT the format should be `yyyy-MM-dd`T`HH:mm:ssZ`. To set time using a specific timezone, use `yyyy-MM-dd`T`HH:mm:ss` format and specify the timezone id in the `timezone` field OR leave it blank and the timezone set on your Zoom account will be used. You can also set the time as UTC as the timezone field
    string start_time?;
    # Unique identifier of the admin meeting template. To create  admin meeting templates, contact the Zoom support team.
    string template_id?;
    # Time zone to format start_time. For example, "America/Los_Angeles". For scheduled meetings only. Please reference our [time zone](https://marketplace.zoom.us/docs/api-reference/other-references/abbreviation-lists#timezones) list for supported time zones and their formats.
    string timezone?;
    # Meeting topic.
    string topic?;
    # Tracking fields
    MeetingTrackingDetails[] tracking_fields?;
    # Meeting Type: 1 - Instant meeting. 2 - Scheduled meeting. 3 - Recurring meeting with no fixed time. 8 - Recurring meeting with fixed time.
    int 'type?;
};

public type CreateMeetingPollResponse record {
    # Meeting Poll ID
    string id?;
    # Status of the Meeting Poll:<br>`notstart` - Poll not started<br>`started` - Poll started<br>`ended` - Poll ended<br>`sharing` - Sharing poll results
    string status?;
    # Array of Polls
    PollQuestions[] questions?;
    # Title for the poll.
    string title?;
};

# List of users.
public type ListWebinarRegistrantsResponse record {
    *PaginationObject;
    *RegistrantsList;
};

# Meeting registrant status update details
public type UpdateMeetingRegistrantstatusRequest record {
    # Registrant Status:<br>`approve` - Approve registrant.<br>`cancel` - Cancel previously approved registrant's registration.<br>`deny` - Deny registrant.
    string action;
    # List of registrants.
    RegistriantDetails[] registrants?;
};
