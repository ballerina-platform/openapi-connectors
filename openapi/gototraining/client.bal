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

# This is a generated connector for [GoToTraining API v1.0](https://developer.goto.com/GoToTrainingV1) OpenAPI specification.  
# The GoToTraining API provides the capability to schedule training sessions and customize the trainings with panelists, polls, questions and surveys.
@display {label: "GoTo Training", iconPath: "resources/gototraining.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [LogMeIn account](https://accounts.logme.in/registration.aspx) and obtain tokens by following [this guide](https://developer.goto.com/guides/HowTos/02_HOW_createClient/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.getgo.com/G2T/rest") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get Organizers
    #
    # + accountKey - The key of the multi-user account 
    # + return - OK 
    remote isolated function getAllOrganizers(int accountKey) returns Organizer[]|error {
        string  path = string `/accounts/${accountKey}/organizers`;
        Organizer[] response = check self.clientEp-> get(path, targetType = OrganizerArr);
        return response;
    }
    # Get Trainings
    #
    # + organizerKey - The key of the training organizer 
    # + return - OK 
    remote isolated function getAllTrainings(int organizerKey) returns Training[]|error {
        string  path = string `/organizers/${organizerKey}/trainings`;
        Training[] response = check self.clientEp-> get(path, targetType = TrainingArr);
        return response;
    }
    # Create Training
    #
    # + organizerKey - The key of the training organizer 
    # + payload - The details of the training to create 
    # + return - The training's unique key 
    remote isolated function scheduleTraining(int organizerKey, TrainingReqCreate payload) returns string|error {
        string  path = string `/organizers/${organizerKey}/trainings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, targetType=string);
        return response;
    }
    # Get Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getTraining(int organizerKey, int trainingKey) returns Training|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}`;
        Training response = check self.clientEp-> get(path, targetType = Training);
        return response;
    }
    # Delete Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - No Content 
    remote isolated function cancelTraining(int organizerKey, int trainingKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get Management URL for Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - URL to the admin portal page of the requested training 
    remote isolated function getManageTrainingURL(int organizerKey, int trainingKey) returns string|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/manageUrl`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Update Training Name and Description
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new name and description for the training 
    # + return - No Content 
    remote isolated function updateTrainingNameDescription(int organizerKey, int trainingKey, TrainingNameDescription payload) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/nameDescription`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Training Organizers
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getOrganizersForTraining(int organizerKey, int trainingKey) returns Organizer[]|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/organizers`;
        Organizer[] response = check self.clientEp-> get(path, targetType = OrganizerArr);
        return response;
    }
    # Update Training Organizers
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - Details required to update the list of organizers for a training 
    # + return - No Content 
    remote isolated function updateOrganizersForTraining(int organizerKey, int trainingKey, TrainingOrganizers payload) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Online Recordings for Training
    #
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getRecordingsForTraining(int trainingKey) returns RecordingsListForTraining|error {
        string  path = string `/trainings/${trainingKey}/recordings`;
        RecordingsListForTraining response = check self.clientEp-> get(path, targetType = RecordingsListForTraining);
        return response;
    }
    # Get Download for Online Recordings
    #
    # + trainingKey - The key of the training 
    # + recordingId - the unique id of the recording 
    # + return - Redirected to download 
    remote isolated function getRecordingDownloadById(int trainingKey, int recordingId) returns http:Response|error {
        string  path = string `/trainings/${trainingKey}/recordings/${recordingId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get Training Registrants
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getRegistrants(int organizerKey, int trainingKey) returns Registrant[]|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/registrants`;
        Registrant[] response = check self.clientEp-> get(path, targetType = RegistrantArr);
        return response;
    }
    # Register for Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The details of the registrant to create 
    # + return - Created 
    remote isolated function registerForTraining(int organizerKey, int trainingKey, RegistrantReqCreate payload) returns RegistrantCreated|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/registrants`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RegistrantCreated response = check self.clientEp->post(path, request, targetType=RegistrantCreated);
        return response;
    }
    # Get Registrant
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getRegistrant(int organizerKey, int trainingKey, int registrantKey) returns Registrant|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/registrants/${registrantKey}`;
        Registrant response = check self.clientEp-> get(path, targetType = Registrant);
        return response;
    }
    # Cancel Registration
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + registrantKey - The key of the registrant 
    # + return - No Content 
    remote isolated function cancelRegistration(int organizerKey, int trainingKey, int registrantKey) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/registrants/${registrantKey}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update Training Registration Settings
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new registration settings for the training 
    # + return - No Content 
    remote isolated function updateRegistrationSettingsForTraining(int organizerKey, int trainingKey, RegistrationSettings payload) returns http:Response|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/registrationSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Start Url
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - URL to start the training 
    remote isolated function getStartUrl(int organizerKey, int trainingKey) returns string|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/startUrl`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Start Training
    #
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function startTraining(int trainingKey) returns HostUrl|error {
        string  path = string `/trainings/${trainingKey}/start`;
        HostUrl response = check self.clientEp-> get(path, targetType = HostUrl);
        return response;
    }
    # Update Training Times
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new start and end times for the scheduled training 
    # + return - OK 
    remote isolated function updateTrainingTimes(int organizerKey, int trainingKey, TrainingTimes payload) returns NotifiedParties|error {
        string  path = string `/organizers/${organizerKey}/trainings/${trainingKey}/times`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotifiedParties response = check self.clientEp->put(path, request, targetType=NotifiedParties);
        return response;
    }
    # Get Sessions by Date Range
    #
    # + organizerKey - The key of the training organizer 
    # + payload - The start and end times for the time range over which to retrieve training sessions 
    # + return - OK 
    remote isolated function getSessionDetailsForDateRange(int organizerKey, DateTimeRange payload) returns Session[]|error {
        string  path = string `/reports/organizers/${organizerKey}/sessions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Session[] response = check self.clientEp->post(path, request, targetType=SessionArr);
        return response;
    }
    # Get Attendance Details
    #
    # + organizerKey - The key of the training organizer 
    # + sessionKey - The key of the training session 
    # + return - OK 
    remote isolated function getAttendanceDetails(int organizerKey, int sessionKey) returns Attendee[]|error {
        string  path = string `/reports/organizers/${organizerKey}/sessions/${sessionKey}/attendees`;
        Attendee[] response = check self.clientEp-> get(path, targetType = AttendeeArr);
        return response;
    }
    # Get Sessions By Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getSessionDetailsForTraining(int organizerKey, int trainingKey) returns Session[]|error {
        string  path = string `/reports/organizers/${organizerKey}/trainings/${trainingKey}`;
        Session[] response = check self.clientEp-> get(path, targetType = SessionArr);
        return response;
    }
}
