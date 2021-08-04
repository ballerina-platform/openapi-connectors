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

public type CompoundLinkResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundTrackJourneyEventResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundUpsertUserResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundUpsertAccountResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundAddUserToAccountResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundRemoveUserFromAccountResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # The object was created
    string message?;
};

public type CompoundGetValidityResponse record {
    # The basic response containing the unique ID of the request and the response status
    record  { string requestId; decimal status;}  meta?;
    # Validation of API Key
    record  { string[] permissions;}  data?;
};

public type CompoundGetTrackingSnippetResponse record {
    record  { string requestId; decimal status;}  meta?;
    # A snippet
    record  { string domain; string snippet;}  data?;
};

# Identification requires an accountId, domain or both
public type AccountsupsertMembers record {
    # User identification requires a userId, email or both
    LinkIdentification identification;
};

# The user being added/removed from the account
public type Body4 record {
    # Unique identifier for the user in your database
    string userId;
};

# The user being added/removed from the account
public type Body5 record {
    # Unique identifier for the user in your database
    string userId;
};

# Update properties of a user
public type Body2 record {
    # User identification requires a userId, email or both
    LinkIdentification identification;
    # The properties being set, possible values are strings, booleans, numbers and datetimes (ISO 8601)
    record {} properties?;
};

# Event identification requires a user, account or both
public type EventsIdentification record {
    # Account identification requires an accountId, domain or both
    EventsIdentificationAccount account?;
    # User identification requires a userId, email or both
    LinkIdentification user?;
};

# Update properties and/or members of an account
public type Body3 record {
    # Account identification requires an accountId, domain or both
    EventsIdentificationAccount identification;
    # The properties being set, possible values are strings, booleans, numbers and datetimes (ISO 8601)
    record {} properties?;
    # The users that are member of this account
    AccountsupsertMembers[] members?;
};

# User identification requires a userId, email or both
public type LinkIdentification record {
    # Email address of the user
    string email?;
    # Unique identifier for the user in your database
    string userId?;
};

# Account identification requires an accountId, domain or both
public type EventsIdentificationAccount record {
    # The domain associated with the account (e.g. acme-inc.com)
    string domain?;
    # Unique identifier for the account in your database
    string accountId?;
};

# Event for a user or an account
public type Body1 record {
    # Event identification requires a user, account or both
    EventsIdentification identification;
    # Event name
    string name;
    # Event metadata, possible values are strings, booleans, numbers and datetimes (ISO 8601)
    record {} metadata?;
    # If left blank this defaults to the current datetime
    string triggeredAt?;
};

# Link web activity to user
public type Body record {
    # Device ID
    string deviceId;
    # User identification requires a userId, email or both
    LinkIdentification identification;
};
