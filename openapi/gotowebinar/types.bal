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

import ballerina/constraint;

public type BrokerWebinarArr BrokerWebinar[];

public type CoorganizerArr Coorganizer[];

public type DateTimeRangeArr DateTimeRange[];

public type PanelistArr Panelist[];

public type CreatedPanelistArr CreatedPanelist[];

public type RegistrantArr Registrant[];

public type AttendeeArr Attendee[];

public type PollAnswerArr PollAnswer[];

public type AttendeeQuestionArr AttendeeQuestion[];

public type PollArr Poll[];

# Representation of a secret key
public type SecretKeyResponse record {
    # The unique identifier for the secret key
    int id?;
    # The value of the secret key. This is used for generating a signature of events posted to the callback url
    string value?;
    # A date time in ISO8601 format, e.g. 2019-07-01T22:00:00Z. The secret key will be activated at the given date
    string validFrom?;
};

# Describes a scheduled webinar
public type BrokerWebinar record {
    # The number of registrants at the webinar
    int numberOfRegistrants;
    # Array with startTime and endTime for the webinar sessions
    DateTimeRange[] times;
    # A short description of the webinar
    string description;
    # The webinar subject
    string subject;
    # Indicates whether there is a webinar session currently in progress
    boolean inSession;
    # The key of the webinar organizer
    int organizerKey;
    # The unique key of the webinar
    int webinarKey;
    # The 9-digit webinar ID
    string webinarID;
    # The timezone where the webinar is taking place
    string timeZone;
    # The URL the webinar invitees can use to register
    string registrationUrl;
    # Specifies the experience type. The possible values are 'classic', 'broadcast' and 'simulive'.
    string experienceType;
};

# Details on the polls and surveys for a webinar session.
public type PollsAndSurveysStatistics record {
    # The number of polls launched at a webinar session
    int pollCount;
    # The percentage of surveys launched at a webinar session
    float surveyCount;
    # The number of questions asked at a webinar session
    int questionsAsked;
    # The percentage of polls completed by the attendees
    float percentagePollsCompleted;
    # The percentage of surveys completed by the attendees
    float percentageSurveysCompleted;
};

# Product of the events
public type Product string;

# Page
public type Page record {
    # The page size
    int size;
    # The total elements
    int totalElements;
    # The pages count
    int totalPages;
    # The current page number. The first page is 0
    int number;
};

# Representation of a secret key
public type SecretKeyRequest record {
    # A date time in ISO8601 format, e.g. 2019-07-01T22:00:00Z. The secret key will be activated at the given date
    string validFrom?;
};

# Describes a field for a webinar registration.
public type RegistrationField record {
    # The name of the registration field
    string 'field;
    # List of choices for a multiple choice registration field
    string[] answers?;
    # Indicates whether the custom registration field is compulsory
    boolean required;
    # The character size of the custom registration field (max 128)
    int maxSize;
};

# Describes a newly created webinar.
public type CreatedWebinar record {
    # The unique key of the webinar.
    string webinarKey;
};

# Describes a completed registration question for a webinar registrant. If you use "Multiple choice" questions the response contains the numeric answerKey, otherwise the answer text.
public type RegistrantQAResponse record {
    # The unique key of the question
    int questionKey;
    # Answer of the question.
    string responseText?;
    # The numeric key of the answer to a multiple-choice question.
    int answerKey?;
};

# Describes the answer given by a webinar attendee to a poll or survey launched by an organizer.
public type PollAnswer record {
    # The answer given to the poll or survey question. Use `answers` array instead.
    string answer?;
    # The answer given to the poll or survey question
    string[] answers;
    # The poll or survey question
    string question;
};

# Defines in which countries toll PSTN numbers are available.
public type TollCountries string;

# Details used for creating a co-organizer for a webinar. 
public type CoorganizerReqCreate record {
    # If the co-organizer has no GoToWebinar account, this value has to be set to 'true'
    boolean 'external;
    # The co-organizer's organizer key. This parameter has to be passed only, if 'external' is set to 'false'
    string organizerKey?;
    # The co-organizer's given name. This parameter has to be passed only, if 'external' is set to 'true'
    string givenName?;
    # The co-organizer's email address. This parameter has to be passed only, if 'external' is set to 'true'
    string email?;
};

# Describes a completed recordingasset.
public type Asset record {
    # The name of the asset
    string name;
    # The unique identifier for the recording asset
    string recordingAssetKey;
    # The product with which the asset was originally created
    string productName;
    # The create time of the asset
    string createTime;
    # The key of the creator
    string creatorKey;
    # The key of the account
    string accountKey;
    # The total number of references of the asset across products
    int totalReferenceCount;
    # The url to download recording assets video
    string mp4DownloadUrl;
    # The url to download the transcript for the given recording video, available only if the transcript was generated
    string transcriptDownloadUrl?;
    # The share link for recording
    string recordingShareUrl?;
    # The webinarKey of parent webinar for which this online recordings was created, not available for uploaded recordings
    string webinarKey?;
};

# Reporting webinars
public type ReportingWebinars record {
    # Webinar list
    Webinar[] webinars;
};

# Describes the details of the webinar
public type WebinarReqUpdate record {
    # The name/subject of the webinar (128 characters maximum)
    string subject?;
    # A description of the webinar (2048 characters maximum)
    string description?;
    # Array with start and end time(s) for webinar
    DateTimeRange[] times?;
    # The time zone where the webinar is taking place (must be a valid time zone ID, see [Date and time conventions](/guides/References/01_Date-Time/)). If this parameter is not passed, the timezone of the organizer's profile will be used
    string timeZone?;
    # The webinar language
    string locale?;
    # Describes email settings of a webinar.
    WebinarEmailSettings emailSettings?;
};

# User subscriptions
public type UserSubscriptions record {
    # User subscriptions list
    UserSubscription[] userSubscriptions;
};

# Describes an answer to a question asked by an attendee during a webinar session.
public type AnswerToAttendeeQuestion record {
    # An answer given to a question asked by an attendee during a webinar session
    string answer;
    # The key of the organizer that answered the attendee's question
    string answeredBy;
};

# Describes Attendee follow-up email settings.
public type AttendeeFollowUpEmailSetting record {
    *EmailSettings;
    # Indicates whether to include certificates in attendee follow-up emails is enabled or disabled.
    boolean includeCertificate?;
};

# State of the webhook
public type WebhookState string;

# Describes a webinar start url
public type WebinarStartUrlResponse record {
    # The URL that can be used to start a webinar
    string startUrl;
};

# Describes a single user subscription
public type CreateUserSubscriptionRequest record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl?;
    # The unique identifier for the webhook
    string webhookKey;
    # State of the user subscription
    UserSubscriptionState userSubscriptionState?;
};

# Describes the details used to search a completed recordingasset.
public type AssetsSearchReq record {
    # The key of the account
    string accountKey;
    # The name of the recordingasset
    string name?;
    # Sorts on the specified field. The default value is 'CREATETIME'. The possible values are 'CREATETIME' and 'NAME'.
    string sortField = "CREATETIME";
    # Specifies the sort order type. The default value is 'DESC'. The possible values are 'DESC', 'ASC'.
    string sortOrder = "DESC";
};

# State of the user subscription
public type UserSubscriptionState string;

# Representation of a single webhook
public type CreateWebhookRequest record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl;
    # Type of event for the webhook. Supported eventNames are registrant.added, registrant.joined, webinar.created, webinar.changed
    string eventName;
    # Version of event being subscribed for. Supported eventVersion is 1.0.0
    string eventVersion;
    # Product of the events
    Product product;
};

# Describes a webinar registrant
public type Registrant record {
    # The registrant's last name
    string lastName;
    # The registrant's email address
    string email;
    # The registrant's first name
    string firstName;
    # The registrant's key
    int registrantKey;
    # The registration date and time
    string registrationDate;
    # The registration status
    string status;
    # The URL the registrant will use to join the webinar
    string joinUrl;
    # The time zone where the webinar will take place
    string timeZone;
};

# Describes the details of the webinar to be copied
public type CopyWebinar record {
    # The name/subject of the webinar (128 characters maximum)
    string subject?;
    # A description of the webinar (2048 characters maximum)
    string description?;
    # Specifies the webinar type. The default type value is 'single_session', which is used to create a single webinar session. The possible values are 'single_session', 'series' and 'sequence'. If type is set to 'single_session', a single webinar session is created. If type is set to 'series', a webinar series is created. In this case 2 or more timeframes must be specified for each webinar. Example: 'times': [{'startTime': '...', 'endTime':'...'}, {'startTime': '...', 'endTime': '...'},{'startTime': '...','endTime': '...'}]. If type is set to 'sequence', a sequence of webinars is created. In this case 2 or more timeframes must be specified for each webinar. If given webinar is 'single_session', we can create 'sequence' or 'series'
    #  webinar, in this case 2 or more timeframes must be specified for each webinar
    # (same example as above). If given webinar is 'series', we can create 'single_session' or 'sequence' webinar with 2 or more timeframes must be specified. If given webinar is simulive webinar 'sequence' type is not supported.
    string 'type?;
    # The recording asset with from the simulive webinar should be created from. In case the recordingasset was created as an online recording the simulive webinar settings, poll and surveys would be copied from the webinar whose session was recorded. We can get recordingasset from [RecordingAssets](GoToWebinarV2#operation/searchAssets)
    string recordingAssetKey?;
    # A boolean flag indicating if the webinar should be ondemand
    boolean isOndemand?;
    # Describes email settings of a webinar.
    WebinarEmailSettings emailSettings?;
    # Array with start and end time(s) for webinar
    DateTimeRange[] times?;
    # The time zone where the webinar is taking place (must be a valid time zone ID, see [Date and time conventions](/guides/References/01_Date-Time/)). If this parameter is not passed, the timezone of the organizer's profile will be used
    string timeZone?;
};

# List of webhooks
public type WebhooksResponse record {
    # Webhooks
    Webhooks _embedded;
};

# Describes a completed webinar session.
public type ReportingSession record {
    # The unique key of the webinar session
    string sessionKey;
    # The unique key of the webinar
    string webinarKey;
    # The webinar name
    string webinarName;
    # The starting time of the webinar session
    string startTime;
    # The ending time of the webinar session
    string endTime;
    # The number of registrants who attended the webinar session
    int registrantsAttended;
    # The total number of registrants for the webinar
    int registrantCount;
    # The key of the account
    string accountKey;
    # The key of the webinar organizer who scheduled the webinar
    string creatingOrganizerKey;
    # The name of the webinar organizer who scheduled the webinar
    string creatingOrganizerName;
    # The key of the webinar organizer who started the webinar session
    string startingOrganizerKey;
    # The name of the webinar organizer who started the webinar session
    string startingOrganizerName;
    # The total number of polls for the webinar session
    int totalPollCount;
    # The timezone where the webinar is taking place
    string timeZone;
    # Specifies the experience type. The possible values are 'classic', 'broadcast' and 'simulive'.
    string experienceType;
    # The 9-digit webinar ID
    string webinarID;
};

# Describes a webinar co-organizer. A co-organizer without a GoToWebinar account is marked as external and is returned without a surname
public type Coorganizer record {
    # The co-organizer's join link
    string joinLink;
    # The co-organizer's email address
    string email;
    # The co-organizer's organizer key. A new member key is created for external co-organizers
    string memberKey;
    # If the co-organizer has no GoToWebinar account, this value is set to 'true'
    boolean 'external;
    # The co-organizer's surname. For external co-organizers this parameter is not returned
    string surname;
    # The co-organizer's given name
    string givenName;
};

# Describes a newly created webinar registrant.
public type RegistrantCreated record {
    # The registrant's key
    int registrantKey;
    # The URL the registrant will use to join the webinar.
    string joinUrl;
};

# Describes a list of webinars for an account within a given date range
public type ReportingWebinarsResponse record {
    # Reporting webinars
    ReportingWebinars _embedded;
    # Page
    Page page;
};

# Describes attendance metrics for a webinar session.
public type AttendanceStatistics record {
    # The number of registrations for the webinar
    int registrantCount;
    # The percentage of registrants that actually attended the webinar session
    float percentageAttendance;
    # Numerical value 1-100 (100 being most interested) indicating the average interest rating of the webinar attendees
    float averageInterestRating;
    # Average based on the focus of the attendees Viewer during the webinar session
    float averageAttentiveness;
    # Average attendance time in seconds
    float averageAttendanceTimeSeconds;
};

# Describes a list of webinar attendees
public type ReportingAttendeeResponse record {
    # Reporting attendees
    ReportingAttendees _embedded;
    # Page
    Page page;
};

# Defines the audio data for an own conferencing system
public type PrivateInfoUpdate record {
    # Attendee phone number for own conference call system
    string attendee;
    # Organizer phone number for own conference call system
    string organizer?;
    # Panelist phone number for own conference call system
    string panelist?;
};

# Describes the details used to create a new single session webinar.
public type WebinarReqCreate record {
    # The name/subject of the webinar (128 characters maximum)
    string subject;
    # A short description of the webinar (2048 characters maximum)
    string description?;
    # Array with startTime and endTime for webinar. Since this call creates single session webinars, the array can only contain a single pair of startTime and endTime
    DateTimeRange[] times;
    # The time zone where the webinar is taking place (must be a valid time zone ID, see [Date and time conventions](/guides/References/01_Date-Time/)). If this parameter is not passed, the timezone of the organizer's profile will be used
    string timeZone?;
    # Specifies the webinar type. The default type value is 'single_session', which is used to create a single webinar session. The possible values are 'single_session', 'series', 'sequence'. If type is set to 'single_session', a single webinar session is created. If type is set to 'series', a webinar series is created. In this case 2 or more timeframes must be specified for each webinar. Example: 'times': [{'startTime': '...', 'endTime': '...'},{'startTime': '...', 'endTime': '...'},{'startTime': '...', 'endTime': '...'}. If type is set to 'sequence' a sequence of webinars is created. The times object in the body must be replaced by the 'recurrenceStart' object. Example: 'recurrenceStart': {'startTime':'2012-06-12T16:00:00Z', 'endTime': '2012-06-12T17:00:00Z' }.  The 'recurrenceEnd' and 'recurrencePattern' body parameter must be specified. Example: , 'recurrenceEnd': '2012-07-10', 'recurrencePattern': 'daily'.
    string 'type = "single_session";
    # A boolean flag indicating if the webinar is password protected or not.
    boolean isPasswordProtected = false;
    # The recording asset with which the simulive webinar should be created from. In case the recordingasset was created as an online recording the simulive webinar settings, poll and surveys would be copied from the webinar whose session was recorded.
    string recordingAssetKey?;
    # A boolean flag indicating if the webinar should be ondemand
    boolean isOndemand = false;
    # Specifies the experience type. The possible values are 'CLASSIC', 'BROADCAST' and 'SIMULIVE'.
    string experienceType = "CLASSIC";
    # Describes email settings of a webinar.
    WebinarEmailSettings emailSettings?;
};

# Describes a webinar session panelist
public type Panelist record {
    # The co-organizer's join link
    string joinLink;
    # DEPRECATED. The fields 'firstName' and 'lastName' are replaced by the field 'name'
    string lastName;
    # The panelist's email address
    string email;
    # The panelist's name
    string name;
    # The panelist's ID
    int panelistId;
    # DEPRECATED. The fields 'firstName' and 'lastName' are replaced by the field 'name'
    string firstName;
};

# Detailed description of a all fields to register a registrant for a webinar.
public type RegistrantFields record {
    # The registrant's first name
    string firstName;
    # The registrant's last name
    string lastName;
    # The registrant's email address
    string email;
    # The source that led to the registration. This can be any string like 'Newsletter 123' or 'Marketing campaign ABC'
    string 'source?;
    # The registrant's address
    string address?;
    # The registrant's city
    string city?;
    # The registrant's state (US only)
    string state?;
    # The registrant's zip (post) code
    string zipCode?;
    # The registrant's country
    string country?;
    # The registrant's phone
    string phone?;
    # The registrant's organization
    string organization?;
    # The registrant's job title
    string jobTitle?;
    # Any questions or comments the registrant made at the time of registration
    string questionsAndComments?;
    # The type of industry the registrant's organization belongs to
    string industry?;
    # The size in employees of the registrant's organization
    string numberOfEmployees?;
    # The time frame within which the product will be purchased
    string purchasingTimeFrame?;
    # The registrant's role in purchasing the product
    string purchasingRole?;
    # Set the answers of all questions
    RegistrantQAResponse[] responses?;
};

# How to connect to the webinar's audio conference
public type AudioType string;

# Describes a list of user subscriptions
public type UserSubscriptionResponse record {
    # User subscriptions
    UserSubscriptions _embedded;
};

public type LastPage record {
    # The last page link
    string href;
};

# Reporting Sessions
public type ReportingSessions record {
    # Reporting session list
    ReportingSession[] sessionInfoResources;
};

# Describes an answer to a multiple choice custom registration field.
public type RegistrationAnswer record {
    # The answer value
    string answer;
    # The answer key
    int answerKey;
};

# Describes a single panelist
public type PanelistReqCreate record {
    # The panelist's email address
    string email;
    # The panelist's name
    string name;
};

# Describes a newly copied webinar.
public type CopiedWebinar record {
    # The unique key of the webinar.
    string webinarKey;
};

# Describes the question asked by an attendee during a webinar session; includes the answers given to it.
public type AttendeeQuestion record {
    # Answer to a question of an attendee and key of the organizer that answered
    AnswerToAttendeeQuestion[] answers;
    # The question asked by the attendee
    string question;
    # The email address of the attendee that asked the question
    string askedBy;
};

# Describes Confirmation email, Reminder email and Absentee follow-up email settings.
public type EmailSettings record {
    # Indicates whether email settings are enabled or disabled.
    boolean enabled?;
};

# Describes a single webhook update request
public type UpdateWebhooksRequest record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl?;
    # The unique identifier for the webhook
    string webhookKey;
    # State of the webhook
    WebhookState state?;
};

# Describes a list of completed assets
public type AssetsResponse record {
    # Assets
    Assets _embedded;
    # Page
    Page page;
};

# Describes a single user subscription update request
public type UpdateUserSubscriptionsRequest record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl?;
    # The unique identifier for the webhook
    string webhookKey;
    # The unique identifier for the user subscription
    string userSubscriptionKey;
    # State of the user subscription
    UserSubscriptionState userSubscriptionState?;
};

# Describes the access codes for organizer, panelists and attendees
public type AccessCodes record {
    # Access code for the organizer
    string organizer;
    # Access code for panelists
    string panelist;
    # Access code for attendees
    string attendee;
};

# Describes a single user subscription
public type UserSubscription record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl?;
    # Type of event of the webhook
    string eventName?;
    # Version of event being subscribed for
    string eventVersion?;
    # Product of the events
    Product product?;
    # The unique identifier for the webhook
    string webhookKey?;
    # The unique identifier for the user subscription
    string userSubscriptionKey?;
    # State of the user subscription
    UserSubscriptionState userSubscriptionState?;
    # Final state of user subscription. ActivationState will be ACTIVE if both webhook and user subscription states are ACTIVE, INACTIVE otherwise.
    ActivationState activationState?;
    # The create time of the webhook
    string createTime?;
};

# Assets
public type Assets record {
    # Recording assets
    Asset[] recordingAssets;
};

# Phone numbers for an own conference call service.
public type PrivateInfo record {
    # Text for the panelist when using an own conference call service
    string attendee;
    # Text for the organizer when using an own conference call service
    string organizer?;
    # Text for the panelist when using an own conference call service
    string panelist?;
};

# Final state of user subscription. ActivationState will be ACTIVE if both webhook and user subscription states are ACTIVE, INACTIVE otherwise.
public type ActivationState string;

# One of the potential responses/options to a poll or survey launched by an organizer during a webinar session.
public type PollResponse record {
    # The text of the response/option to a poll or survey
    string text;
    # The percentage of responses that favored this particular option
    @constraint:Float {maxValue: 100}
    float percentage;
};

# A pair of DateTime values, the first of which serves as a start time and the second as an end time of an interval.
public type DateTimeRange record {
    # The starting time of an interval, e.g. 2020-03-13T10:00:00Z
    string startTime;
    # The ending time of an interval, e.g. 2020-03-13T22:00:00Z
    string endTime;
};

# Countries in which toll free PSTN numbers are available.
public type TollFreeCountries string;

# Reporting attendees
public type ReportingAttendees record {
    # Reporting attendees list
    ReportingAttendee[] attendeeParticipationResponses;
};

# Describes the times the attendee joined and left a webinar session.
public type Attendance record {
    # The time the attendee joined a webinar session
    string joinTime;
    # The time the attendee left a webinar session
    string leaveTime;
};

public type FirstPage record {
    # The first page link
    string href;
};

# Answers to custom questions of the registrant
public type CustomAnswers record {
    # Answer to a custom question when registering
    string answer;
    # Custom question for registering
    string question;
};

# Describes a webinar
public type Webinar record {
    # The unique key of the webinar
    string webinarKey;
    # The 9-digit webinar ID
    string webinarID?;
    # The key of the webinar organizer
    string organizerKey;
    # The key of the account
    string accountKey;
    # The webinar subject
    string subject;
    # A short description of the webinar
    string description;
    # Array with startTime and endTime for the webinar sessions
    DateTimeRange[] times;
    # The timezone where the webinar is taking place
    string timeZone;
    # The webinar language
    string locale;
    # Specifies if the organizer needs to approve the webinar registrations. The possible values are 'AUTOMATIC' and 'MANUAL'.
    string approvalType;
    # The URL the webinar invitees can use to register
    string registrationUrl;
    # A boolean flag indicating if the webinar type is impromptu
    boolean impromptu;
    # A boolean flag indicating if the webinar is password protected
    boolean isPasswordProtected;
    # Specifies the recurrence type. The possible values are 'single_session', 'series' and 'sequence'.
    string recurrenceType;
    # Specifies the experience type. The possible values are 'classic', 'broadcast' and 'simulive'.
    string experienceType;
};

# Describes the attendee of a webinar
public type ReportingAttendee record {
    # The key of the webinar attendee
    int registrantKey;
    # The unique key of the webinar session
    int sessionKey;
    # The attendee's email address
    string email;
    # The total attendance time in seconds
    int attendanceTimeInSeconds;
    # The list of times the attendee joined and left the webinar session
    Attendance[] attendance;
    # The attendee's first name
    string firstName;
    # The attendee's last name
    string lastName;
};

# Conference call numbers per country.
public type CallNumbers record {
    # Describes the access codes for organizer, panelists and attendees
    AccessCodes accessCodes;
    # Conference number for toll calls.
    string toll;
    # Conference number for toll-free calls.
    string tollFree?;
};

# Describes performance details for webinar sessions
public type SessionPerformance record {
    # Describes attendance metrics for a webinar session.
    AttendanceStatistics attendance;
    # Details on the polls and surveys for a webinar session.
    PollsAndSurveysStatistics pollsAndSurveys;
};

# Defines the audio/conferencing settings for the specified webinar. It required to pass 'tollFreeCountries' or 'tollCountries' or both.
public type PstnInfoUpdate record {
    # Defines in which countries toll free PSTN numbers are available.
    TollFreeCountries[] tollFreeCountries?;
    # Defines in which countries toll PSTN numbers are available.
    TollCountries[] tollCountries?;
};

# Defines the audio/conferencing settings for the specified webinar
public type AudioUpdate record {
    # How to connect to the webinar's audio conference
    AudioType 'type;
    # Defines the audio/conferencing settings for the specified webinar. It required to pass 'tollFreeCountries' or 'tollCountries' or both.
    PstnInfoUpdate pstnInfo?;
    # Defines the audio data for an own conferencing system
    PrivateInfoUpdate privateInfo?;
};

# Describes the attendee of a webinar
public type Attendee record {
    # The key of the webinar attendee
    int registrantKey;
    # The attendee's first name
    string firstName;
    # The attendee's last name
    string lastName;
    # The attendee's email address
    string email;
    # The total attendance time in seconds
    int attendanceTimeInSeconds;
    # The unique key of the webinar session
    int sessionKey;
    # The list of times the attendee joined and left the webinar session
    Attendance[] attendance;
};

# Describes a custom field for a webinar registration.
public type RegistrationQuestion record {
    # The unique key of the custom registration field
    int questionKey;
    # The value (text) of the custom registration field
    string question;
    # Indicates whether the custom registration field is compulsory
    boolean required;
    # Indicates whether the custom registration field requires a single short answer or whether it is a multiple choice question
    string 'type;
    # The character size of the custom registration field (max 1000)
    int maxSize;
    # The answers to a multiple choice custom registration field
    RegistrationAnswer[] answers?;
};

# Describes a list of webinar sessions
public type ReportingSessionsResponse record {
    # Reporting Sessions
    ReportingSessions _embedded;
    # Page
    Page page;
};

# Describes a webinar
public type WebinarByKey record {
    # The unique key of the webinar
    int webinarKey;
    # The 9-digit webinar ID
    string webinarID;
    # The webinar subject.
    string subject;
    # A short description of the webinar
    string description;
    # The key of the webinar organizer
    int organizerKey;
    # The email of the webinar organizer
    string organizerEmail;
    # The name of the webinar organizer
    string organizerName;
    # Array with startTime and endTime for the webinar sessions
    DateTimeRange[] times;
    # The URL the webinar invitees can use to register
    string registrationUrl;
    # Indicates whether there is a webinar session currently in progress
    boolean inSession;
    # A boolean flag indicating if the webinar type is impromptu
    boolean impromptu;
    # Specifies the recurrence type. The possible values are 'single_session', 'series' and 'sequence'.
    string 'type;
    # The timezone where the webinar is taking place
    string timeZone;
    # The number of registrants at the webinar
    int numberOfRegistrants;
    # The maximum number of registrants a webinar can have
    int registrationLimit;
    # The webinar language
    string locale;
    # The key of the account
    string accountKey;
    # Specifies the recurrence type. The possible values are 'single_session', 'series' and 'sequence'.
    string recurrencePeriod;
    # Specifies the experience type. The possible values are 'classic', 'broadcast' and 'simulive'.
    string experienceType;
    # A boolean flag indicating if the webinar is password protected
    boolean isPasswordProtected;
};

# The fields to be completed on the webinar registration form.
public type RegistrationFields record {
    # Custom fields created by the organizer for the webinar registration form
    RegistrationQuestion[] questions;
    # The default fields the organizer has selected for the webinar registration form
    RegistrationField[] fields;
};

# Describes a created panelist
public type CreatedPanelist record {
    # The panelist's name
    string name;
    # The panelist's email address
    string email;
    # The panelist's join link
    string joinLink;
    # The panelist's key
    string panelistKey;
};

# Webhooks
public type Webhooks record {
    # Webhook list
    Webhook[] webhooks;
};

# A poll or survey launched by an organizer during or after a webinar session; includes the responses given to it by the attendees.
public type Poll record {
    # The responses given by the attendees to the poll or survey
    PollResponse[] responses;
    # The poll or survey question asked by the webinar organizer
    string question;
    # The total number of responses received for this poll or survey
    int numberOfResponses;
};

# Detailed description of a webinar registrant with all registration fields.
public type RegistrantDetailed record {
    # The registrant's last name
    string lastName;
    # The registrant's email address
    string email;
    # The registrant's first name
    string firstName;
    # The registrant's key
    int registrantKey;
    # The registration date and time
    string registrationDate;
    # The source that led to the registration. This can be any string like 'Newsletter 123' or 'Marketing campaign ABC'
    string 'source?;
    # The registration status
    string status;
    # The URL the registrant will use to join the webinar
    string joinUrl;
    # The time zone where the webinar will take place
    string timeZone;
    # The registrant's phone
    string phone?;
    # The registrant's state (US only)
    string state?;
    # The registrant's city
    string city?;
    # The registrant's organization
    string organization?;
    # The registrant's zip (post) code
    string zipCode?;
    # The size in employees of the registrant's organization
    string numberOfEmployees?;
    # The type of industry the registrant's organization belongs to
    string industry?;
    # The registrant's job title
    string jobTitle?;
    # The registrant's role in purchasing the product
    string purchasingRole?;
    # The time frame within which the product will be purchased
    string implementationTimeFrame?;
    # The time frame within which the product will be purchased
    string purchasingTimeFrame?;
    # Any questions or comments the registrant made at the time of registration
    string questionsAndComments?;
    # The size in employees of the registrant's organization
    string employeeCount?;
    # The registrant's country
    string country?;
    # The registrant's address
    string address?;
    # The type is REGULAR for 'One session' and 'Sequence' webinars. The type LATE is for registrants registering for past webinars. For webinar series this parameter is not passed
    string 'type?;
    # Indicates whether the registrant opted-out from receiving other emails from this webinar's organizer
    boolean unsubscribed?;
    # Responses to custom questions
    CustomAnswers[] responses?;
};

# Representation of a single webhook
public type Webhook record {
    # A HTTPs url that can accept posted events. It should return 200 OK for GET requests.
    string callbackUrl;
    # Type of event for the webhook. Supported eventNames are registrant.added, registrant.joined, webinar.created, webinar.changed
    string eventName;
    # Version of event being subscribed for. Supported eventVersion is 1.0.0
    string eventVersion;
    # Product of the events
    Product product;
    # The unique identifier for the webhook
    string webhookKey?;
    # State of the webhook
    WebhookState state?;
    # The create time of the webhook
    string createTime?;
};

# Describes the audio/conferencing information for a webinar.
public type Audio record {
    # How to connect to the webinar's audio conference
    AudioType 'type;
    # The conference call numbers and access codes per country. This will be returned only, if 'type' is not set to 'Private'.
    record {} confCallNumbers?;
    # Phone numbers for an own conference call service.
    PrivateInfo privateInfo?;
};

# Describes email settings of a webinar.
public type WebinarEmailSettings record {
    # Describes Confirmation email, Reminder email and Absentee follow-up email settings.
    EmailSettings confirmationEmail?;
    # Describes Confirmation email, Reminder email and Absentee follow-up email settings.
    EmailSettings reminderEmail?;
    # Describes Confirmation email, Reminder email and Absentee follow-up email settings.
    EmailSettings absenteeFollowUpEmail?;
    # Describes Attendee follow-up email settings.
    AttendeeFollowUpEmailSetting attendeeFollowUpEmail?;
};

public type SelfPage record {
    # The current page link
    string href;
};

# Describes a completed webinar session.
public type Session record {
    # The starting time of the webinar session
    string startTime;
    # The number of registrants who attended the webinar session
    int registrantsAttended;
    # The unique key of the webinar
    int webinarKey;
    # The 9-digit webinar ID
    string webinarID;
    # The unique key of the webinar session
    int sessionKey;
    # The ending time of the webinar session
    string endTime;
};
