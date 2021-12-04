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

# This is a generated connector for [GoToWebinar API v2.0](https://developer.goto.com/GoToWebinarV2) OpenAPI specification.  
# The GoToWebinar API provides the capability to schedule webinars and customize webinars with panelists, polls, questions and surveys.
@display {label: "GoTo Webinar", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [LogMeIn account](https://accounts.logme.in/registration.aspx) and obtain tokens by following [this guide](https://developer.goto.com/guides/HowTos/02_HOW_createClient/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.getgo.com/G2W/rest/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get all webinars for an account
    #
    # + accountKey - The key of the account 
    # + fromTime - Start of the datetime range in ISO8601 UTC format 
    # + toTime - End of the datetime range in ISO8601 UTC format 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + return - OK 
    remote isolated function getAllAccountWebinars(int accountKey, string fromTime, string toTime, int? page = (), int? size = ()) returns ReportingWebinarsResponse|error {
        string  path = string `/accounts/${accountKey}/webinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        ReportingWebinarsResponse response = check self.clientEp-> get(path, targetType = ReportingWebinarsResponse);
        return response;
    }
    # Get organizer sessions
    #
    # + organizerKey - The key of the organizer 
    # + fromTime - Start of the datetime range in ISO8601 UTC format 
    # + toTime - End of the datetime range in ISO8601 UTC format 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + return - OK 
    remote isolated function getOrganizerSessions(int organizerKey, string fromTime, string toTime, int? page = (), int? size = ()) returns ReportingSessionsResponse|error {
        string  path = string `/organizers/${organizerKey}/sessions`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        ReportingSessionsResponse response = check self.clientEp-> get(path, targetType = ReportingSessionsResponse);
        return response;
    }
    # Get Webinars
    #
    # + organizerKey - The key of the organizer 
    # + fromTime - Start of the datetime range in ISO8601 UTC format 
    # + toTime - End of the datetime range in ISO8601 UTC format 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + return - OK 
    remote isolated function getWebinars(int organizerKey, string fromTime, string toTime, int? page = (), int? size = ()) returns ReportingWebinarsResponse|error {
        string  path = string `/organizers/${organizerKey}/webinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        ReportingWebinarsResponse response = check self.clientEp-> get(path, targetType = ReportingWebinarsResponse);
        return response;
    }
    # Create webinar
    #
    # + organizerKey - The key of the organizer 
    # + payload - The webinar details 
    # + return - Created 
    remote isolated function createWebinar(int organizerKey, WebinarReqCreate payload) returns CreatedWebinar|error {
        string  path = string `/organizers/${organizerKey}/webinars`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedWebinar response = check self.clientEp->post(path, request, targetType=CreatedWebinar);
        return response;
    }
    # Get All Insession Webinars
    #
    # + organizerKey - The key of the organizer 
    # + toTime - End of the datetime range in ISO8601 UTC format 
    # + fromTime - Start of the datetime range in ISO8601 UTC format 
    # + return - OK 
    remote isolated function getInSessionWebinars(int organizerKey, string toTime, string? fromTime = ()) returns BrokerWebinar[]|error {
        string  path = string `/organizers/${organizerKey}/insessionWebinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime};
        path = path + check getPathForQueryParam(queryParam);
        BrokerWebinar[] response = check self.clientEp-> get(path, targetType = BrokerWebinarArr);
        return response;
    }
    # Get webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getWebinar(int organizerKey, int webinarKey) returns WebinarByKey|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}`;
        WebinarByKey response = check self.clientEp-> get(path, targetType = WebinarByKey);
        return response;
    }
    # Update webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - The webinar details 
    # + notifyParticipants - Defines whether to send notifications to participants 
    # + return - Accepted 
    remote isolated function updateWebinar(int organizerKey, int webinarKey, WebinarReqUpdate payload, boolean? notifyParticipants = ()) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}`;
        map<anydata> queryParam = {"notifyParticipants": notifyParticipants};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Cancel webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sendCancellationEmails - Indicates whether cancellation notice emails should be sent. The default value is false 
    # + return - No Content 
    remote isolated function cancelWebinar(int organizerKey, int webinarKey, boolean? sendCancellationEmails = ()) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}`;
        map<anydata> queryParam = {"sendCancellationEmails": sendCancellationEmails};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get attendees for all webinar sessions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + return - OK 
    remote isolated function getAttendeesForAllWebinarSessions(int organizerKey, int webinarKey, int? page = (), int? size = ()) returns ReportingAttendeeResponse|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/attendees`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        ReportingAttendeeResponse response = check self.clientEp-> get(path, targetType = ReportingAttendeeResponse);
        return response;
    }
    # Get co-organizers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getCoorganizers(int organizerKey, int webinarKey) returns Coorganizer[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/coorganizers`;
        Coorganizer[] response = check self.clientEp-> get(path, targetType = CoorganizerArr);
        return response;
    }
    # Create co-organizers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - The co-organizer details 
    # + return - Created 
    remote isolated function createCoorganizers(int organizerKey, int webinarKey, CoorganizerReqCreate[] payload) returns Coorganizer[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/coorganizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Coorganizer[] response = check self.clientEp->post(path, request, targetType=CoorganizerArr);
        return response;
    }
    # Delete co-organizer
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + coorganizerKey - The key of the internal or external co-organizer (memberKey) 
    # + 'external - By default only internal co-organizers (with a GoToWebinar account) can be deleted. If you want to use this call for external co-organizers you have to set this parameter to 'true'. 
    # + return - No Content (Co-organizer was deleted) 
    remote isolated function deleteCoorganizer(int organizerKey, int webinarKey, int coorganizerKey, boolean? 'external = ()) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/coorganizers/${coorganizerKey}`;
        map<anydata> queryParam = {"external": 'external};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Resend invitation
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + coorganizerKey - The key of the internal or external co-organizer (memberKey) 
    # + 'external - By default only internal co-organizers (with a GoToWebinar account) will retrieve the resent invitation email. If you want to use this call for external co-organizers you have to set this parameter to 'true'. 
    # + return - No Content (Invitation email was sent) 
    remote isolated function resendCoorganizerInvitation(int organizerKey, int webinarKey, int coorganizerKey, boolean? 'external = ()) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/coorganizers/${coorganizerKey}/resendInvitation`;
        map<anydata> queryParam = {"external": 'external};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Get webinar meeting times
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getWebinarMeetingTimes(int organizerKey, int webinarKey) returns DateTimeRange[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/meetingtimes`;
        DateTimeRange[] response = check self.clientEp-> get(path, targetType = DateTimeRangeArr);
        return response;
    }
    # Get webinar panelists
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getPanelists(int organizerKey, int webinarKey) returns Panelist[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/panelists`;
        Panelist[] response = check self.clientEp-> get(path, targetType = PanelistArr);
        return response;
    }
    # Create Panelists
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - Array of panelists 
    # + return - Created 
    remote isolated function createPanelists(int organizerKey, int webinarKey, PanelistReqCreate[] payload) returns CreatedPanelist[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/panelists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedPanelist[] response = check self.clientEp->post(path, request, targetType=CreatedPanelistArr);
        return response;
    }
    # Get audio information
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getAudioInformation(int organizerKey, int webinarKey) returns Audio|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/audio`;
        Audio response = check self.clientEp-> get(path, targetType = Audio);
        return response;
    }
    # Update audio information
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - The audio/conferencing settings 
    # + notifyParticipants - Defines whether to send notifications to participants 
    # + return - No Content 
    remote isolated function updateAudioInformation(int organizerKey, int webinarKey, AudioUpdate payload, boolean? notifyParticipants = ()) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/audio`;
        map<anydata> queryParam = {"notifyParticipants": notifyParticipants};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get performance for all webinar sessions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getPerformanceForAllWebinarSessions(int organizerKey, int webinarKey) returns json|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/performance`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Webinar start url
    #
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getStartUrl(int webinarKey) returns WebinarStartUrlResponse|error {
        string  path = string `/webinars/${webinarKey}/startUrl`;
        WebinarStartUrlResponse response = check self.clientEp-> get(path, targetType = WebinarStartUrlResponse);
        return response;
    }
    # Copy a webinar
    #
    # + webinarKey - The key of source webinar 
    # + payload - Provide a webinar details to be copied 
    # + return - Copied 
    remote isolated function copyWebinar(int webinarKey, CopyWebinar payload) returns CopiedWebinar|error {
        string  path = string `/webinars/${webinarKey}/copy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CopiedWebinar response = check self.clientEp->put(path, request, targetType=CopiedWebinar);
        return response;
    }
    # Get registrants
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getAllRegistrantsForWebinar(int organizerKey, int webinarKey) returns Registrant[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/registrants`;
        Registrant[] response = check self.clientEp-> get(path, targetType = RegistrantArr);
        return response;
    }
    # Create registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - The registrant details. To get all possible values run the API call 'Get registration fields' which is also part of this documentation. 
    # + accept - Set to 'application/json' to make a registration using fields (custom or default) additional to the basic ones or set it to 'application/vnd.citrix.g2wapi-v1.1+json' for just basic fields(firstName, lastName, and email). 
    # + resendConfirmation - Indicates whether the confirmation email should be resent when a registrant is re-registered. The default value is false. 
    # + return - Created 
    remote isolated function createRegistrant(int organizerKey, int webinarKey, RegistrantFields payload, string? accept = (), boolean? resendConfirmation = ()) returns RegistrantCreated|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/registrants`;
        map<anydata> queryParam = {"resendConfirmation": resendConfirmation};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RegistrantCreated response = check self.clientEp->post(path, request, headers = accHeaders, targetType=RegistrantCreated);
        return response;
    }
    # Get registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getRegistrant(int organizerKey, int webinarKey, int registrantKey) returns RegistrantDetailed|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/registrants/${registrantKey}`;
        RegistrantDetailed response = check self.clientEp-> get(path, targetType = RegistrantDetailed);
        return response;
    }
    # Delete registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + registrantKey - The key of the registrant 
    # + return - No content 
    remote isolated function deleteRegistrant(int organizerKey, int webinarKey, int registrantKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/registrants/${registrantKey}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get registration fields
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getRegistrationFields(int organizerKey, int webinarKey) returns RegistrationFields|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/registrants/fields`;
        RegistrationFields response = check self.clientEp-> get(path, targetType = RegistrationFields);
        return response;
    }
    # Get webinar sessions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + return - OK 
    remote isolated function getAllSessions(int organizerKey, int webinarKey, int? page = (), int? size = ()) returns ReportingSessionsResponse|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        ReportingSessionsResponse response = check self.clientEp-> get(path, targetType = ReportingSessionsResponse);
        return response;
    }
    # Get webinar session
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getWebinarSession(int organizerKey, int webinarKey, int sessionKey) returns Attendee[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}`;
        Attendee[] response = check self.clientEp-> get(path, targetType = AttendeeArr);
        return response;
    }
    # Get session attendees
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getAttendees(int organizerKey, int webinarKey, int sessionKey) returns Attendee[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/attendees`;
        Attendee[] response = check self.clientEp-> get(path, targetType = AttendeeArr);
        return response;
    }
    # Get attendee
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getAttendee(int organizerKey, int webinarKey, int sessionKey, int registrantKey) returns Registrant|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/attendees/${registrantKey}`;
        Registrant response = check self.clientEp-> get(path, targetType = Registrant);
        return response;
    }
    # Get attendee poll answers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getAttendeePollAnswers(int organizerKey, int webinarKey, int sessionKey, int registrantKey) returns PollAnswer[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/attendees/${registrantKey}/polls`;
        PollAnswer[] response = check self.clientEp-> get(path, targetType = PollAnswerArr);
        return response;
    }
    # Get attendee questions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getAttendeeQuestions(int organizerKey, int webinarKey, int sessionKey, int registrantKey) returns AttendeeQuestion[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/attendees/${registrantKey}/questions`;
        AttendeeQuestion[] response = check self.clientEp-> get(path, targetType = AttendeeQuestionArr);
        return response;
    }
    # Get attendee survey answers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getAttendeeSurveyAnswers(int organizerKey, int webinarKey, int sessionKey, int registrantKey) returns PollAnswer[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/attendees/${registrantKey}/surveys`;
        PollAnswer[] response = check self.clientEp-> get(path, targetType = PollAnswerArr);
        return response;
    }
    # Get session performance
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getPerformance(int organizerKey, int webinarKey, int sessionKey) returns SessionPerformance|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/performance`;
        SessionPerformance response = check self.clientEp-> get(path, targetType = SessionPerformance);
        return response;
    }
    # Get session polls
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getPolls(int organizerKey, int webinarKey, int sessionKey) returns Poll[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/polls`;
        Poll[] response = check self.clientEp-> get(path, targetType = PollArr);
        return response;
    }
    # Get session questions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getQuestions(int organizerKey, int webinarKey, int sessionKey) returns AttendeeQuestion[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/questions`;
        AttendeeQuestion[] response = check self.clientEp-> get(path, targetType = AttendeeQuestionArr);
        return response;
    }
    # Get session surveys
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getSurveys(int organizerKey, int webinarKey, int sessionKey) returns Poll[]|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/sessions/${sessionKey}/surveys`;
        Poll[] response = check self.clientEp-> get(path, targetType = PollArr);
        return response;
    }
    # Resend panelist invitation
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + panelistKey - The key of the webinar panelist 
    # + return - No Content 
    remote isolated function resendPanelistInvitation(int organizerKey, int webinarKey, int panelistKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/panelists/${panelistKey}/resendInvitation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Delete webinar panelist
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + panelistKey - The key of the webinar panelist 
    # + return - No content 
    remote isolated function deleteWebinarPanelist(int organizerKey, int webinarKey, int panelistKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/webinars/${webinarKey}/panelists/${panelistKey}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Search for completed recording assets
    #
    # + payload - The asset search parameters 
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + includes - Add the response variables. 
    # + return - OK 
    remote isolated function searchAssets(AssetsSearchReq payload, int? page = (), int? size = (), string[]? includes = ()) returns AssetsResponse|error {
        string  path = string `/recordingassets/search`;
        map<anydata> queryParam = {"page": page, "size": size, "includes": includes};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetsResponse response = check self.clientEp->post(path, request, targetType=AssetsResponse);
        return response;
    }
    # Creates a new secret key
    #
    # + payload - The secret key object to create 
    # + return - OK 
    remote isolated function createSecretKey(SecretKeyRequest payload) returns SecretKeyResponse|error {
        string  path = string `/webhooks/secretkey`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SecretKeyResponse response = check self.clientEp->post(path, request, targetType=SecretKeyResponse);
        return response;
    }
    # Get webhooks
    #
    # + product - Supported products 
    # + return - OK 
    remote isolated function getWebhooks(string product) returns WebhooksResponse|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"product": product};
        path = path + check getPathForQueryParam(queryParam);
        WebhooksResponse response = check self.clientEp-> get(path, targetType = WebhooksResponse);
        return response;
    }
    # Updates webhooks
    #
    # + payload - Webhooks object to update 
    # + return - No Content 
    remote isolated function updateWebhooks(UpdateWebhooksRequest[] payload) returns http:Response|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Creates new webhooks
    #
    # + payload - Webhooks object to create 
    # + return - OK 
    remote isolated function createWebhooks(CreateWebhookRequest[] payload) returns WebhooksResponse|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhooksResponse response = check self.clientEp->post(path, request, targetType=WebhooksResponse);
        return response;
    }
    # Deletes webhooks
    #
    # + payload - List of webhookKeys to delete 
    # + return - Accepted 
    remote isolated function deleteWebhooks(string[] payload) returns http:Response|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Get webhook
    #
    # + webhookKey - The unique identifier for a webhook. 
    # + return - OK 
    remote isolated function getWebhook(string webhookKey) returns Webhook|error {
        string  path = string `/webhooks/${webhookKey}`;
        Webhook response = check self.clientEp-> get(path, targetType = Webhook);
        return response;
    }
    # Get user subscriptions
    #
    # + product - Supported products 
    # + return - OK 
    remote isolated function getUserSubscriptions(string product) returns UserSubscriptionResponse|error {
        string  path = string `/userSubscriptions`;
        map<anydata> queryParam = {"product": product};
        path = path + check getPathForQueryParam(queryParam);
        UserSubscriptionResponse response = check self.clientEp-> get(path, targetType = UserSubscriptionResponse);
        return response;
    }
    # Updates user subscriptions
    #
    # + payload - User subscriptions to update 
    # + return - No Content 
    remote isolated function updateUserSubscriptions(UpdateUserSubscriptionsRequest[] payload) returns http:Response|error {
        string  path = string `/userSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Creates new user subscriptions
    #
    # + payload - User subscriptions to create 
    # + return - OK 
    remote isolated function createUserSubscriptions(CreateUserSubscriptionRequest[] payload) returns UserSubscriptionResponse|error {
        string  path = string `/userSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserSubscriptionResponse response = check self.clientEp->post(path, request, targetType=UserSubscriptionResponse);
        return response;
    }
    # Deletes user subscriptions
    #
    # + payload - List of userSubscriptionKeys to delete 
    # + return - Accepted 
    remote isolated function deleteUserSubscriptions(string[] payload) returns http:Response|error {
        string  path = string `/userSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Get user subscription
    #
    # + userSubscriptionsKey - The unique identifier for a user subscription. 
    # + return - OK 
    remote isolated function getUserSubscription(string userSubscriptionsKey) returns UserSubscription|error {
        string  path = string `/userSubscriptions/${userSubscriptionsKey}`;
        UserSubscription response = check self.clientEp-> get(path, targetType = UserSubscription);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
