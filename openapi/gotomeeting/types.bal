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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    OAuth2PasswordGrantConfig|http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
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

public type OrganizerArr Organizer[];

public type OrganizerShortArr OrganizerShort[];

public type AttendeeByOrganizerArr AttendeeByOrganizer[];

public type HistoricalMeetingArr HistoricalMeeting[];

public type UpcomingMeetingArr UpcomingMeeting[];

public type MeetingByOrganizerArr MeetingByOrganizer[];

public type GroupArr Group[];

public type AttendeeByGroupArr AttendeeByGroup[];

public type HistoricalMeetingByGroupArr HistoricalMeetingByGroup[];

public type UpcomingMeetingByGroupArr UpcomingMeetingByGroup[];

public type HistoryMeetingByGroupArr HistoryMeetingByGroup[];

public type OrganizerByGroupArr OrganizerByGroup[];

public type MeetingHistoryArr MeetingHistory[];

public type MeetingCreatedArr MeetingCreated[];

public type MeetingByIdArr MeetingById[];

public type AttendeeByMeetingArr AttendeeByMeeting[];

# Describes a collection of organizers categorized by department or job function, for example. Can be a subgroup of a larger group.
public type Group record {
    # The key of this group
    int groupkey;
    # The name of this group
    string groupName;
    # The key of the parent group this group belongs to. Identical with the groupkey if this group is not a subgroup
    int parentKey;
    # The status of an organizer (or group), i.e. whether the organizer (or the members of the group respectively) are able to host meetings
    Status status;
    # The number of organizers assigned to this group
    int numOrganizers;
};

# Describes an organizer.
public type Organizer record {
    # The organizer's surname
    string lastName;
    # The key of the group this organizer is assigned to
    int groupId;
    # The name of the group this organizer is assigned to
    string groupName;
    # The status of an organizer (or group), i.e. whether the organizer (or the members of the group respectively) are able to host meetings
    Status status;
    # The key of the organizer
    int organizerKey;
    # The organizer's email address
    string email;
    # The organizer's first name
    string firstName;
    # Product list
    Product[] products;
    # The maximum number of attendees allowed at sessions hosted by this organizer.
    int maxNumAttendeesAllowed;
};

# The meeting status, i.e whether the meeting is running or not
public type MeetingStatus string;

# Describes an attendee of a meeting instance held by an organizer within a specified group.
public type AttendeeByGroup record {
    # The surname of the meeting organizer
    string lastName;
    # The name of the group
    string groupName;
    # The number of attendees at the attended meeting instance
    int numAttendees;
    # The full name of the attendee
    string attendeeName;
    # The subject of the attended meeting
    string subject;
    # The time the meeting instance ended
    string endTime;
    # Audio options for the attended meeting
    string conferenceCallInfo;
    # The key of the meeting organizer. Field retained for backwards compatibility reasons
    int organizerkey;
    # The time the meeting instance started
    string startTime;
    # The key of the attended meeting instance
    int meetingInstanceKey;
    # The duration of attendance in minutes
    int duration;
    # The time the attendee joined the meeting instance
    string joinTime;
    # The email address of the meeting organizer
    string email;
    # The time the attendee left the meeting instance
    string leaveTime;
    # The attendee's email address
    string attendeeEmail;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The first name of the organizer of the attended meeting
    string firstName;
};

# Describes the information required to create an organizer, with or without assigning a group.
public type OrganizerReq record {
    # The email address of the organizer
    string organizerEmail;
    # The first name of the organizer
    string firstName;
    # The surname of the organizer
    string lastName;
    # Product type
    Product productType;
};

# Describes a newly created meeting.
public type MeetingCreated record {
    # The URL the meeting participants will use to join the meeting
    string joinURL;
    # The meeting ID
    int meetingid;
    # The maximum number of participants allowed in the meeting
    int maxParticipants;
    # The meeting ID. Field retained for backwards compatibility reasons
    int uniqueMeetingId;
    # Audio options for the meeting
    string conferenceCallInfo;
};

# Product type
public type Product string;

# Describes past meeting instance(s) held by an organizer within a specified group.
public type HistoryMeetingByGroup record {
    # The surname of the meeting organizer
    string lastName;
    # The name of the group
    string groupName;
    # The number of attendees at this meeting instance
    int numAttendees;
    # The subject of the meeting
    string subject;
    # The time this meeting instance ended
    string endTime;
    # Audio options for the meeting
    string conferenceCallInfo;
    # The key of the meeting organizer. Field retained for backwards compatibility reasons
    int organizerkey;
    # The time this meeting instance started
    string startTime;
    # The key of this meeting instance
    int meetingInstanceKey;
    # The duration of this meeting instance in minutes
    string duration;
    # The email address of the meeting organizer
    string email;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The first name of the meeting organizer
    string firstName;
};

# Describes a scheduled meeting.
public type MeetingScheduled record {
    # The starting time of the meeting.
    string startTime;
    # The time the meeting was created.
    string createTime;
    # The meeting ID.
    int meetingid;
    # The maximum number of participants allowed at the meeting.
    int maxParticipants;
    # Indicates whether a password is required to join the meeting.
    boolean passwordRequired;
    # The meeting status, i.e whether the meeting is running or not
    MeetingStatus status;
    # The subject of the meeting.
    string subject;
    # The meeting type
    MeetingType meetingType;
    # The ending time of the meeting.
    string endTime;
    # The meeting ID. Field retained for backwards compatibility reasons.
    int uniqueMeetingId;
    # Audio options for the meeting.
    string conferenceCallInfo;
    # Co-organizer keys. Co-organizers can start the meeting on the organizers behalf.
    string[] coorganizerKeys?;
};

# Describes a unique past meeting instance.
public type MeetingHistory record {
    # The surname of the meeting organizer
    string lastName;
    # DEPRECATED. An empty string '' is returned
    string groupName;
    # The number of attendees at the meeting instance
    int numAttendees;
    # DEPRECATED. An empty string '' is returned
    boolean passwordRequired;
    # DEPRECATED. An empty string '' is returned
    string status;
    # The subject of the meeting
    string subject;
    # The time the meeting instance ended
    string endTime;
    # The time the meeting instance started. Field retained for backwards compatibility reasons
    string date;
    # Audio options for the meeting
    string conferenceCallInfo;
    # The time the meeting instance started
    string startTime;
    # The key of the meeting organizer. Field retained for backwards compatibility reasons
    string organizerkey;
    # The key of the unique meeting instance
    int meetingInstanceKey;
    # The key of the meeting organizer. Field introduced for compatibility reasons
    string newOrganizerKey;
    # The duration of the meeting session in minutes
    int duration;
    # Formatted meeting ID
    string newMeetingId;
    # The ID of the meeting session
    int sessionId;
    # The meeting organizer's email address
    string email;
    # The meeting ID
    int meetingId;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID. Field retained for backwards compatibility reasons
    int meetingKey;
    # The meeting type
    MeetingType meetingType;
    # The meeting organizer's first name
    string firstName;
    # The meeting ID. Field retained for backwards compatibility reasons
    int uniqueMeetingId;
    # Information about the meeting recording.
    MeetingRecording recording?;
};

# Describes an attendee of a meeting instance held by a specified organizer.
public type AttendeeByOrganizer record {
    # The surname of the meeting organizer
    string lastName;
    # The name of the group the organizer is assigned to
    string groupName;
    # The number of attendees at the attended meeting instance
    int numAttendees;
    # The full name of the attendee
    string attendeeName;
    # The subject of the attended meeting
    string subject;
    # The time the meeting instance ended
    string endTime;
    # Audio options for the attended meeting
    string conferenceCallInfo;
    # The key of the meeting organizer. Field retained for backwards compatibility reasons
    int organizerkey;
    # The time the meeting instance started
    string startTime;
    # The key of the attended meeting instance
    int meetingInstanceKey;
    # The duration of attendance in minutes
    int duration;
    # The formatted meeting ID
    string newMeetingId;
    # The email address of the meeting organizer
    string email;
    # The time the attendee joined the meeting instance
    string joinTime;
    # The full name of the meeting organizer
    string name;
    # The time the attendee left the meeting instance
    string leaveTime;
    # The attendee's email address
    string attendeeEmail;
    # The meeting ID
    int meetingId;
    # The meeting type
    MeetingType meetingType;
    # The first name of the meeting organizer
    string firstName;
};

# Describes a newly created organizer.
public type OrganizerShort record {
    # The organizer's key
    int 'key;
    # The organizer's email address
    string email;
};

# Describes an attendee of a specified meeting instance.
public type AttendeeByMeeting record {
    # The surname of the meeting organizer
    string lastName;
    # DEPRECATED. Returns 'NA'
    string groupName;
    # The number of attendees at the meeting instance
    int numAttendees;
    # The attendee's full name
    string attendeeName;
    # The subject of the meeting
    string subject;
    # The ending time of the meeting instance
    string endTime;
    # Audio options for the meeting
    string conferenceCallInfo;
    # The key of the meeting organizer
    int organizerkey;
    # The starting time of the meeting instance
    string startTime;
    # The key of the unique meeting instance
    int meetingInstanceKey;
    # The meeting duration in minutes
    int duration;
    # The email address of the meeting organizer
    string email;
    # The time the attendee joined the meeting instance
    string joinTime;
    # The attendee's full name
    string name;
    # The time the attendee left the meeting instance
    string leaveTime;
    # The attendee's email address
    string attendeeEmail;
    # The meeting ID
    int meetingId;
    # The meeting type
    MeetingType meetingType;
    # The first name of the meeting organizer
    string firstName;
};

# Host URL that can be used to start a meeting
public type StartUrl record {
    # The host URL that can be used to start a meeting.
    string hostURL;
};

# The status of an organizer (or group), i.e. whether the organizer (or the members of the group respectively) are able to host meetings
public type Status string;

# Describes a historical meeting within specified dates.
public type HistoricalMeeting record {
    # The time the meeting instance started
    string startTime;
    # The surname of the meeting organizer
    string lastName;
    # The duration of the meeting session in minutes
    string duration;
    # The number of attendees at the meeting instance
    string numAttendees;
    # The key of the company account
    string accountKey;
    # The meeting organizer's email address
    string email;
    # The ID of the meeting session
    string sessionId;
    # The subject of the meeting
    string subject;
    # The current language setting of the organizer in the web portal
    string locale;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The meeting organizer's first name
    string firstName;
    # The time the meeting instance ended
    string endTime;
    # Audio options for the meeting
    string conferenceCallInfo;
    # Information about the meeting recording.
    MeetingRecording recording?;
};

# Describes a meeting scheduled by a specified organizer
public type MeetingByOrganizer record {
    # The starting time of the meeting
    string startTime;
    # DEPRECATED. Returns an empty string ''
    string createTime;
    # The meeting ID
    int meetingid;
    # The maximum number of participants allowed at the meeting
    int maxParticipants;
    # Indicates whether a password is required to join the meeting
    boolean passwordRequired;
    # The meeting status, i.e whether the meeting is running or not
    MeetingStatus status;
    # The subject of the meeting
    string subject;
    # The meeting type
    MeetingType meetingType;
    # The ending time of the meeting
    string endTime;
    # A unique ID for the meeting
    int uniqueMeetingId;
    # Audio options for the meeting
    string conferenceCallInfo;
};

# Describes the information required to update a meeting.
public type MeetingReqUpdate record {
    # A description of the meeting. 100 characters maximum. The characters '>' and '<' have to be replaced with the corresponding html character code (&gt; for '>' and &lt; for '<')
    string subject;
    # The starting time of the meeting. A required ISO8601 UTC string, e.g. 2015-07-01T22:00:00Z
    string starttime;
    # The ending time of the meeting. A required ISO8601 UTC string, e.g. 2015-07-01T22:00:00Z
    string endtime;
    # Indicates whether a password is required to join the meeting. Required parameter
    boolean passwordrequired;
    # A required string. Can be one of the following options: PSTN (PSTN only), Free (PSTN and VoIP), Hybrid, (PSTN and VoIP), Private (you provide numbers and access code), or VoIP (VoIP only). You may also enter plain text for numbers and access codes with a limit of 255 characters
    string conferencecallinfo;
    # DEPRECATED. Must be provided and set to empty string ''
    string timezonekey;
    # The meeting type
    MeetingType meetingtype;
    # Co-organizer keys. Co-organizers can start the meeting on the organizers behalf. Retrieve a list of valid organizers from the 'Get Users' call.
    string[] coorganizerKeys?;
};

# Describes an upcoming meeting.
public type UpcomingMeeting record {
    # The time the meeting instance will start
    string startTime;
    # The surname of the meeting organizer
    string lastName;
    # The key of the company account
    string accountKey;
    # Indicates whether a password is required to join the meeting or not
    boolean passwordRequired;
    # The meeting organizer's email address
    string email;
    # The meeting status, i.e whether the meeting is running or not
    MeetingStatus status;
    # The subject of the meeting
    string subject;
    # The current language setting of the organizer in the web portal
    string locale;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The meeting organizer's first name
    string firstName;
    # The time the meeting instance ended
    string endTime;
    # Audio options for the meeting
    string conferenceCallInfo;
};

# Describes an organizer within a specified group.
public type OrganizerByGroup record {
    # The organizer's surname
    string lastName;
    # The key of the group
    int groupId;
    # The name of the group
    string groupName;
    # The status of an organizer (or group), i.e. whether the organizer (or the members of the group respectively) are able to host meetings
    Status status;
    # The organizer's email address
    string email;
    # The key of the organizer
    int organizerKey;
    # The organizer's first name
    string firstName;
    # Product list
    Product[] products;
    # The maximum number of attendees allowed at sessions held by this organizer
    int maxNumAttendeesAllowed;
};

# Describes the status of an organizer, i.e. whether they are able to host meetings.
public type OrganizerStatus record {
    # The status of the organizer can be set to. Use 'suspended' to remove all products. The formerly used status 'active' is now DEPRECATED for this call. To activate the organizer please assign a product. In this case do not pass this parameter
    string status?;
    # Product type
    Product productType?;
};

# Describes an upcoming meeting of a group.
public type UpcomingMeetingByGroup record {
    # The time the meeting instance will start
    string startTime;
    # The surname of the meeting organizer
    string lastName;
    # The key of the company account
    string accountKey;
    # Indicates whether a password is required to join the meeting or not
    boolean passwordRequired;
    # The meeting organizer's email address
    string email;
    # The meeting status, i.e whether the meeting is running or not
    MeetingStatus status?;
    # The subject of the meeting
    string subject;
    # The current language setting of the organizer in the web portal
    string locale;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The meeting organizer's first name
    string firstName;
    # The time the meeting instance ended
    string endTime;
    # The name of the group the meeting belongs to
    string groupName;
};

# Describes a historical meeting within specified dates for a specified group.
public type HistoricalMeetingByGroup record {
    # The time the meeting instance started
    string startTime;
    # The surname of the meeting organizer
    string lastName;
    # The duration of the meeting session in minutes
    string duration;
    # The number of attendees at the meeting instance
    string numAttendees;
    # The key of the company account
    string accountKey;
    # The meeting organizer's email address
    string email;
    # The subject of the meeting
    string subject;
    # The current language setting of the organizer in the web portal
    string locale;
    # The key of the meeting organizer
    string organizerKey;
    # The meeting ID
    string meetingId;
    # The meeting type
    MeetingType meetingType;
    # The meeting organizer's first name
    string firstName;
    # The time the meeting instance ended
    string endTime;
    # The name of the group
    string groupName;
};

# Describes the information required to create a meeting.
public type MeetingReqCreate record {
    # The subject of the meeting. 100 characters maximum. The characters '>' and '<' have to be replaced with the corresponding html character code (&gt; for '>' and &lt; for '<')
    string subject;
    # The starting time of the meeting. Required ISO8601 UTC string, e.g. 2015-07-01T22:00:00Z
    string starttime;
    # The ending time of the meeting. Required ISO8601 UTC string, e.g. 2015-07-01T23:00:00Z
    string endtime;
    # Indicates whether a password is required to join the meeting. Required parameter
    boolean passwordrequired;
    # A required string. Can be one of the following options: PSTN (PSTN only), Free (PSTN and VoIP), Hybrid, (PSTN and VoIP), Private (you provide numbers and access code), or VoIP (VoIP only). You may also enter plain text for numbers and access codes with a limit of 255 characters
    string conferencecallinfo;
    # DEPRECATED. Must be provided and set to empty string ''
    string timezonekey;
    # The meeting type
    MeetingType meetingtype;
    # Co-organizer keys. Co-organizers can start the meeting on the organizers behalf. Retrieve a list of valid organizers from the 'Get Users' call.
    string[] coorganizerKeys?;
};

# Describes a given meeting.
public type MeetingById record {
    # DEPRECATED. Returns an empty string ''
    string createTime;
    # Indicates whether a password is required to join the meeting
    boolean passwordRequired;
    # The meeting status, i.e whether the meeting is running or not
    MeetingStatus status;
    # The subject of the meeting
    string subject;
    # The ending time of the meeting
    string endTime;
    # Audio options of the meeting
    string conferenceCallInfo;
    # The meeting starting time
    string startTime;
    # The duration of the meeting in minutes
    int duration;
    # The maximum number of participants allowed at the meeting
    int maxParticipants;
    # The meeting ID
    int meetingId;
    # The meeting ID. Field retained for backwards compatibility reasons
    int meetingKey;
    # The meeting type
    MeetingType meetingType;
    # The meeting ID. Field retained for backwards compatibility reasons
    int uniqueMeetingId;
    # The co-organizer keys of users that also can host the meeting.
    string[] coorganizerKeys?;
};

# The meeting type
public type MeetingType string;

# Describes a meeting scheduled by an organizer within a specified group.
public type ScheduledMeetingByGroup record {
    # The key of the meeting organizer. Field retained for backwards compatibility reasons.
    int organizerkey;
    # Not in use.
    string attendees;
    # The surname of the meeting organizer.
    string lastName;
    # The name of the group.
    string groupName;
    # Indicates whether a password is required to join the meeting.
    boolean passwordRequired;
    # The email address of the meeting organizer.
    string email;
    # The subject of the meeting.
    string subject;
    # The meeting ID.
    string meetingId;
    # The key of the meeting organizer.
    string organizerKey;
    # The meeting type
    MeetingType meetingType;
    # The first name of the meeting organizer.
    string firstName;
    # Audio options for the meeting.
    string conferenceCallInfo;
};

# Information about the meeting recording.
public type MeetingRecording record {
    # Name of the recording
    string recordingName?;
    # The recording ID
    string recordingId?;
    # Url where the mp4 file of the recording can be downloaded
    string downloadUrl?;
    # Size of the recording file in bytes
    int fileSize?;
    # Url that can be used to share the recording only or including transcripts if present
    string shareUrl?;
};
