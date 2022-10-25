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

# This is a generated connector for [GoToTraining API v1.0](https://developer.goto.com/GoToTrainingV1) OpenAPI specification.  
# The GoToTraining API provides the capability to schedule training sessions and customize the trainings with panelists, polls, questions and surveys.
@display {label: "GoTo Training", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [LogMeIn account](https://accounts.logme.in/registration.aspx) and obtain tokens by following [this guide](https://developer.goto.com/guides/HowTos/02_HOW_createClient/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.getgo.com/G2T/rest") returns error? {
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
    # Get Organizers
    #
    # + accountKey - The key of the multi-user account 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getAllOrganizers(int accountKey) returns Organizer[]|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountKey)}/organizers`;
        Organizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Trainings
    #
    # + organizerKey - The key of the training organizer 
    # + return - OK 
    remote isolated function getAllTrainings(int organizerKey) returns Training[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings`;
        Training[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Training
    #
    # + organizerKey - The key of the training organizer 
    # + payload - The details of the training to create 
    # + return - The training's unique key 
    remote isolated function scheduleTraining(int organizerKey, TrainingReqCreate payload) returns string|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getTraining(int organizerKey, int trainingKey) returns Training|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}`;
        Training response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - No Content 
    remote isolated function cancelTraining(int organizerKey, int trainingKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Management URL for Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - URL to the admin portal page of the requested training 
    remote isolated function getManageTrainingURL(int organizerKey, int trainingKey) returns string|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/manageUrl`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Training Name and Description
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new name and description for the training 
    # + return - No Content 
    remote isolated function updateTrainingNameDescription(int organizerKey, int trainingKey, TrainingNameDescription payload) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/nameDescription`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Training Organizers
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getOrganizersForTraining(int organizerKey, int trainingKey) returns Organizer[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/organizers`;
        Organizer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Training Organizers
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - Details required to update the list of organizers for a training 
    # + return - No Content 
    remote isolated function updateOrganizersForTraining(int organizerKey, int trainingKey, TrainingOrganizers payload) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/organizers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Online Recordings for Training
    #
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getRecordingsForTraining(int trainingKey) returns RecordingsListForTraining|error {
        string resourcePath = string `/trainings/${getEncodedUri(trainingKey)}/recordings`;
        RecordingsListForTraining response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Download for Online Recordings
    #
    # + trainingKey - The key of the training 
    # + recordingId - the unique id of the recording 
    # + return - Redirected to download 
    remote isolated function getRecordingDownloadById(int trainingKey, int recordingId) returns http:Response|error {
        string resourcePath = string `/trainings/${getEncodedUri(trainingKey)}/recordings/${getEncodedUri(recordingId)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Training Registrants
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getRegistrants(int organizerKey, int trainingKey) returns Registrant[]|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/registrants`;
        Registrant[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Register for Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The details of the registrant to create 
    # + return - Created 
    remote isolated function registerForTraining(int organizerKey, int trainingKey, RegistrantReqCreate payload) returns RegistrantCreated|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/registrants`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RegistrantCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Registrant
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + registrantKey - The key of the registrant 
    # + return - OK 
    remote isolated function getRegistrant(int organizerKey, int trainingKey, int registrantKey) returns Registrant|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/registrants/${getEncodedUri(registrantKey)}`;
        Registrant response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel Registration
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + registrantKey - The key of the registrant 
    # + return - No Content 
    remote isolated function cancelRegistration(int organizerKey, int trainingKey, int registrantKey) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/registrants/${getEncodedUri(registrantKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update Training Registration Settings
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new registration settings for the training 
    # + return - No Content 
    remote isolated function updateRegistrationSettingsForTraining(int organizerKey, int trainingKey, RegistrationSettings payload) returns http:Response|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/registrationSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Start Url
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - URL to start the training 
    remote isolated function getStartUrl(int organizerKey, int trainingKey) returns string|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/startUrl`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start Training
    #
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function startTraining(int trainingKey) returns HostUrl|error {
        string resourcePath = string `/trainings/${getEncodedUri(trainingKey)}/start`;
        HostUrl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Training Times
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + payload - The new start and end times for the scheduled training 
    # + return - OK 
    remote isolated function updateTrainingTimes(int organizerKey, int trainingKey, TrainingTimes payload) returns NotifiedParties|error {
        string resourcePath = string `/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}/times`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotifiedParties response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Sessions by Date Range
    #
    # + organizerKey - The key of the training organizer 
    # + payload - The start and end times for the time range over which to retrieve training sessions 
    # + return - OK 
    remote isolated function getSessionDetailsForDateRange(int organizerKey, DateTimeRange payload) returns Session[]|error {
        string resourcePath = string `/reports/organizers/${getEncodedUri(organizerKey)}/sessions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Session[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Attendance Details
    #
    # + organizerKey - The key of the training organizer 
    # + sessionKey - The key of the training session 
    # + return - OK 
    remote isolated function getAttendanceDetails(int organizerKey, int sessionKey) returns Attendee[]|error {
        string resourcePath = string `/reports/organizers/${getEncodedUri(organizerKey)}/sessions/${getEncodedUri(sessionKey)}/attendees`;
        Attendee[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Sessions By Training
    #
    # + organizerKey - The key of the training organizer 
    # + trainingKey - The key of the training 
    # + return - OK 
    remote isolated function getSessionDetailsForTraining(int organizerKey, int trainingKey) returns Session[]|error {
        string resourcePath = string `/reports/organizers/${getEncodedUri(organizerKey)}/trainings/${getEncodedUri(trainingKey)}`;
        Session[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
