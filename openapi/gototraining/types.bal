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

public type TrainingArr Training[];

public type RegistrantArr Registrant[];

public type SessionArr Session[];

public type AttendeeArr Attendee[];

# Describes the times the attendee joined and left a part of a training session.
public type Attendance record {
    # The time the attendee joined a part of a training session
    string joinTime;
    # The time the attendee left a part of a training session
    string leaveTime;
    # The time in minutes the attendee spent at a part of a training session
    int timeInPartOfSession;
};

# Contains a list of recordings for the training.
public type RecordingsListForTraining record {
    # The list of online recordings for the training
    Recording[] recordingList;
    # The training's unique key
    int trainingKey;
};

# Describes a training organizer.
public type Organizer record {
    # The key of the training (co-)organizer
    string organizerKey;
    # The email address of the training (co-)organizer
    string email;
    # The (co-)organizer's first name
    string givenName;
    # The (co-)organizer's surname
    string surname;
};

# Number of parties notified of a change to a training session times
public type NotifiedParties record {
    # Number of registrants notified of changes to a training
    int notifiedRegistrants;
    # Number of trainers notified of changes to a training
    int notifiedTrainers;
};

# Details required to update the list of organizers for a training.
public type TrainingOrganizers record {
    # List of keys of the organizers for the training.
    int[] organizers;
    # Specifies whether an email should be sent notifying of the change to the training's organizers.
    boolean notifyOrganizers?;
};

# Describes a training registrant.
public type Registrant record {
    # The registrant's email address
    string email;
    # The registrant's first name
    string givenName;
    # The registrant's surname
    string surname;
    # The registrant's status
    string status;
    # The date and time the registration took place
    string registrationDate;
    # The URL the registrant will use to join the training
    string joinUrl;
    # The URL where the confirmation for the registration can be found
    string confirmationUrl;
    # The registrant's key
    string registrantKey;
};

# Details required to update the session times of a training.
public type TrainingTimes record {
    # Time zone of the training (must be a valid time zone ID, see [Date and time conventions](/guides/References/01_Date-Time/)).
    string timeZone;
    # Start and end times for the training sessions
    DateTimeRange[] times;
    # Notify registrants via email of change to training. Default is true
    boolean notifyRegistrants?;
    # Notify trainers via email of change to training. Default is true
    boolean notifyTrainers?;
};

# Training settings, namely availability of web registration and confirmation emails to the training registrants
public type RegistrationSettings record {
    # Indicates whether confirmation emails to the training registrants are disabled
    boolean disableConfirmationEmail;
    # Indicates whether the web registration for the training is disabled
    boolean disableWebRegistration;
};

# Describes the attendee of a training session.
public type Attendee record {
    # The attendee's first name
    string givenName;
    # The attendee's surname
    string surname;
    # The attendee's email address
    string email;
    # The total time in minutes spent at all the parts of the training session the attendee joined
    int timeInSession;
    # List of the parts of the training session the attendee joined
    Attendance[] inSessionTimes;
};

# Describes a newly created training registrant
public type RegistrantCreated record {
    # The URL the registrant will use to join the training
    string joinUrl;
    # The URL where confirmation for the registration can be found
    string confirmationUrl;
    # The registrant's key
    string registrantKey;
};

# Describes a scheduled training.
public type Training record {
    # The 9-digit training's ID
    string trainingId;
    # The training's subject
    string name;
    # The training's description
    string description?;
    # The time zone where the training takes place
    string timeZone;
    # Array with startDate and endDate for the training sessions
    DateTimeRange[] times;
    # The list of (co-)organizers for the training
    Organizer[] organizers;
    # Training settings, namely availability of web registration and confirmation emails to the training registrants
    RegistrationSettings registrationSettings;
    # The training's unique key
    string trainingKey;
};

# Details required to make a new training registration.
public type RegistrantReqCreate record {
    # The registrant's email address
    string email;
    # The registrant's first name
    string givenName;
    # The registrant's surname
    string surname;
};

# Details required to update a training's name and description.
public type TrainingNameDescription record {
    # The training's name
    string name;
    # The training's description
    string description?;
};

# Host URL that can be used to start a training
public type HostUrl record {
    # The host URL that can be used to start a training
    string hostURL;
};

# Describes the details used to create a new training.
public type TrainingReqCreate record {
    # Name of the training
    string name;
    # Description of the training
    string description?;
    # Time zone of the training (must be a valid time zone ID, see [Date and time conventions](/guides/References/01_Date-Time/)).
    string timeZone;
    # Array with startDate and endDate for the training sessions
    DateTimeRange[] times;
    # Training settings, namely availability of web registration and confirmation emails to the training registrants
    RegistrationSettings registrationSettings?;
    # List of keys of the co-organizers for this training
    int[] organizers?;
};

# A pair of DateTime values, the first of which serves as a start time and the second as an end time of an interval
public type DateTimeRange record {
    # The starting time of an interval
    string startDate;
    # The ending time of an interval
    string endDate;
};

# Describes an online recording of a training
public type Recording record {
    # The unique id of the recording
    int recordingId;
    # The title of the recording
    string name;
    # The description of the recording
    string description?;
    # The url where attendees can register to view the recording
    string registrationUrl?;
    # The url used to download the recording to the local device
    string downloadUrl?;
    # The time the recording was started
    string startDate;
    # The time the recording was ended
    string endDate;
};

# Describes a completed training session.
public type Session record {
    # The key of the training session
    string sessionKey;
    # The subject of the training
    string trainingName;
    # The time the training session started
    string sessionStartTime;
    # The time the training session finished
    string sessionEndTime;
    # The number of attendees at the training session
    int attendanceCount;
    # The duration of the training session in minutes
    int duration;
    # The organizers of the training session.
    Organizer[] organizers;
};
