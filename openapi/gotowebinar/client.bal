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

# This is a generated connector for [GoToWebinar API v2.0](https://developer.goto.com/GoToWebinarV2) OpenAPI specification.  
# The GoToWebinar API provides the capability to schedule webinars and customize webinars with panelists, polls, questions and surveys.
@display {label: "GoTo Webinar", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [LogMeIn account](https://accounts.logme.in/registration.aspx) and obtain tokens by following [this guide](https://developer.goto.com/guides/HowTos/02_HOW_createClient/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.getgo.com/G2W/rest/v2") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
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
        string resourcePath = string `/accounts/${getEncodedUri(accountKey)}/webinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReportingWebinarsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/sessions`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReportingSessionsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime, "page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReportingWebinarsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create webinar
    #
    # + organizerKey - The key of the organizer 
    # + payload - The webinar details 
    # + return - Created 
    remote isolated function createWebinar(int organizerKey, WebinarReqCreate payload) returns CreatedWebinar|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedWebinar response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get All Insession Webinars
    #
    # + organizerKey - The key of the organizer 
    # + fromTime - Start of the datetime range in ISO8601 UTC format 
    # + toTime - End of the datetime range in ISO8601 UTC format 
    # + return - OK 
    remote isolated function getInSessionWebinars(int organizerKey, string toTime, string? fromTime = ()) returns BrokerWebinar[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/insessionWebinars`;
        map<anydata> queryParam = {"fromTime": fromTime, "toTime": toTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BrokerWebinar[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getWebinar(int organizerKey, int webinarKey) returns WebinarByKey|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}`;
        WebinarByKey response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + notifyParticipants - Defines whether to send notifications to participants 
    # + payload - The webinar details 
    # + return - Accepted 
    remote isolated function updateWebinar(int organizerKey, int webinarKey, WebinarReqUpdate payload, boolean? notifyParticipants = ()) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}`;
        map<anydata> queryParam = {"notifyParticipants": notifyParticipants};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Cancel webinar
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sendCancellationEmails - Indicates whether cancellation notice emails should be sent. The default value is false 
    # + return - No Content 
    remote isolated function cancelWebinar(int organizerKey, int webinarKey, boolean? sendCancellationEmails = ()) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}`;
        map<anydata> queryParam = {"sendCancellationEmails": sendCancellationEmails};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/attendees`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReportingAttendeeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get co-organizers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getCoorganizers(int organizerKey, int webinarKey) returns Coorganizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/coorganizers`;
        Coorganizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create co-organizers
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - The co-organizer details 
    # + return - Created 
    remote isolated function createCoorganizers(int organizerKey, int webinarKey, CoorganizerReqCreate[] payload) returns Coorganizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/coorganizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Coorganizer[] response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/coorganizers/${getEncodedUri(coorganizerKey)}`;
        map<anydata> queryParam = {"external": 'external};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/coorganizers/${getEncodedUri(coorganizerKey)}/resendInvitation`;
        map<anydata> queryParam = {"external": 'external};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get webinar meeting times
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getWebinarMeetingTimes(int organizerKey, int webinarKey) returns DateTimeRange[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/meetingtimes`;
        DateTimeRange[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get webinar panelists
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getPanelists(int organizerKey, int webinarKey) returns Panelist[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/panelists`;
        Panelist[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Panelists
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + payload - Array of panelists 
    # + return - Created 
    remote isolated function createPanelists(int organizerKey, int webinarKey, PanelistReqCreate[] payload) returns CreatedPanelist[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/panelists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedPanelist[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get audio information
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getAudioInformation(int organizerKey, int webinarKey) returns Audio|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/audio`;
        Audio response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update audio information
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + notifyParticipants - Defines whether to send notifications to participants 
    # + payload - The audio/conferencing settings 
    # + return - No Content 
    remote isolated function updateAudioInformation(int organizerKey, int webinarKey, AudioUpdate payload, boolean? notifyParticipants = ()) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/audio`;
        map<anydata> queryParam = {"notifyParticipants": notifyParticipants};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get performance for all webinar sessions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getPerformanceForAllWebinarSessions(int organizerKey, int webinarKey) returns json|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/performance`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Webinar start url
    #
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getStartUrl(int webinarKey) returns WebinarStartUrlResponse|error {
        string resourcePath = string `/webinars/${getEncodedUri(webinarKey)}/startUrl`;
        WebinarStartUrlResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Copy a webinar
    #
    # + webinarKey - The key of source webinar 
    # + payload - Provide a webinar details to be copied 
    # + return - Copied 
    remote isolated function copyWebinar(int webinarKey, CopyWebinar payload) returns CopiedWebinar|error {
        string resourcePath = string `/webinars/${getEncodedUri(webinarKey)}/copy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CopiedWebinar response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get registrants
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getAllRegistrantsForWebinar(int organizerKey, int webinarKey) returns Registrant[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/registrants`;
        Registrant[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + accept - Set to 'application/json' to make a registration using fields (custom or default) additional to the basic ones or set it to 'application/vnd.citrix.g2wapi-v1.1+json' for just basic fields(firstName, lastName, and email). 
    # + resendConfirmation - Indicates whether the confirmation email should be resent when a registrant is re-registered. The default value is false. 
    # + payload - The registrant details. To get all possible values run the API call 'Get registration fields' which is also part of this documentation. 
    # + return - Created 
    remote isolated function createRegistrant(int organizerKey, int webinarKey, RegistrantFields payload, string? accept = (), boolean? resendConfirmation = ()) returns RegistrantCreated|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/registrants`;
        map<anydata> queryParam = {"resendConfirmation": resendConfirmation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RegistrantCreated response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getRegistrant(int organizerKey, int webinarKey, int registrantKey) returns RegistrantDetailed|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/registrants/${getEncodedUri(registrantKey)}`;
        RegistrantDetailed response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete registrant
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + registrantKey - The key of the registrant 
    # + return - No content 
    remote isolated function deleteRegistrant(int organizerKey, int webinarKey, int registrantKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/registrants/${getEncodedUri(registrantKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get registration fields
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + return - OK 
    remote isolated function getRegistrationFields(int organizerKey, int webinarKey) returns RegistrationFields|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/registrants/fields`;
        RegistrationFields response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReportingSessionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get webinar session
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getWebinarSession(int organizerKey, int webinarKey, int sessionKey) returns Attendee[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}`;
        Attendee[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get session attendees
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getAttendees(int organizerKey, int webinarKey, int sessionKey) returns Attendee[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/attendees`;
        Attendee[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/attendees/${getEncodedUri(registrantKey)}`;
        Registrant response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/attendees/${getEncodedUri(registrantKey)}/polls`;
        PollAnswer[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/attendees/${getEncodedUri(registrantKey)}/questions`;
        AttendeeQuestion[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/attendees/${getEncodedUri(registrantKey)}/surveys`;
        PollAnswer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get session performance
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getPerformance(int organizerKey, int webinarKey, int sessionKey) returns SessionPerformance|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/performance`;
        SessionPerformance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get session polls
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getPolls(int organizerKey, int webinarKey, int sessionKey) returns Poll[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/polls`;
        Poll[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get session questions
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getQuestions(int organizerKey, int webinarKey, int sessionKey) returns AttendeeQuestion[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/questions`;
        AttendeeQuestion[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get session surveys
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + sessionKey - The key of the webinar session 
    # + return - OK 
    remote isolated function getSurveys(int organizerKey, int webinarKey, int sessionKey) returns Poll[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/sessions/${getEncodedUri(sessionKey)}/surveys`;
        Poll[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Resend panelist invitation
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + panelistKey - The key of the webinar panelist 
    # + return - No Content 
    remote isolated function resendPanelistInvitation(int organizerKey, int webinarKey, int panelistKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/panelists/${getEncodedUri(panelistKey)}/resendInvitation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete webinar panelist
    #
    # + organizerKey - The key of the organizer 
    # + webinarKey - The key of the webinar 
    # + panelistKey - The key of the webinar panelist 
    # + return - No content 
    remote isolated function deleteWebinarPanelist(int organizerKey, int webinarKey, int panelistKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/webinars/${getEncodedUri(webinarKey)}/panelists/${getEncodedUri(panelistKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Search for completed recording assets
    #
    # + page - The page number to be displayed. The first page is 0. 
    # + size - The size of the page. 
    # + includes - Add the response variables. 
    # + payload - The asset search parameters 
    # + return - OK 
    remote isolated function searchAssets(AssetsSearchReq payload, int? page = (), int? size = (), string[]? includes = ()) returns AssetsResponse|error {
        string resourcePath = string `/recordingassets/search`;
        map<anydata> queryParam = {"page": page, "size": size, "includes": includes};
        map<Encoding> queryParamEncoding = {"includes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a new secret key
    #
    # + payload - The secret key object to create 
    # + return - OK 
    remote isolated function createSecretKey(SecretKeyRequest payload) returns SecretKeyResponse|error {
        string resourcePath = string `/webhooks/secretkey`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SecretKeyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get webhooks
    #
    # + product - Supported products 
    # + return - OK 
    remote isolated function getWebhooks(string product) returns WebhooksResponse|error {
        string resourcePath = string `/webhooks`;
        map<anydata> queryParam = {"product": product};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WebhooksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates webhooks
    #
    # + payload - Webhooks object to update 
    # + return - No Content 
    remote isolated function updateWebhooks(UpdateWebhooksRequest[] payload) returns http:Response|error {
        string resourcePath = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Creates new webhooks
    #
    # + payload - Webhooks object to create 
    # + return - OK 
    remote isolated function createWebhooks(CreateWebhookRequest[] payload) returns WebhooksResponse|error {
        string resourcePath = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhooksResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes webhooks
    #
    # + return - Accepted 
    remote isolated function deleteWebhooks() returns http:Response|error {
        string resourcePath = string `/webhooks`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get webhook
    #
    # + webhookKey - The unique identifier for a webhook. 
    # + return - OK 
    remote isolated function getWebhook(string webhookKey) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookKey)}`;
        Webhook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user subscriptions
    #
    # + product - Supported products 
    # + return - OK 
    remote isolated function getUserSubscriptions(string product) returns UserSubscriptionResponse|error {
        string resourcePath = string `/userSubscriptions`;
        map<anydata> queryParam = {"product": product};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserSubscriptionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates user subscriptions
    #
    # + payload - User subscriptions to update 
    # + return - No Content 
    remote isolated function updateUserSubscriptions(UpdateUserSubscriptionsRequest[] payload) returns http:Response|error {
        string resourcePath = string `/userSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Creates new user subscriptions
    #
    # + payload - User subscriptions to create 
    # + return - OK 
    remote isolated function createUserSubscriptions(CreateUserSubscriptionRequest[] payload) returns UserSubscriptionResponse|error {
        string resourcePath = string `/userSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserSubscriptionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes user subscriptions
    #
    # + return - Accepted 
    remote isolated function deleteUserSubscriptions() returns http:Response|error {
        string resourcePath = string `/userSubscriptions`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get user subscription
    #
    # + userSubscriptionsKey - The unique identifier for a user subscription. 
    # + return - OK 
    remote isolated function getUserSubscription(string userSubscriptionsKey) returns UserSubscription|error {
        string resourcePath = string `/userSubscriptions/${getEncodedUri(userSubscriptionsKey)}`;
        UserSubscription response = check self.clientEp->get(resourcePath);
        return response;
    }
}
