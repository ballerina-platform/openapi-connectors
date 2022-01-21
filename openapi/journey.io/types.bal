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

# Identification requires an accountId, domain or both
public type AccountsupsertMembers record {
    # User identification requires a userId, email or both
    LinkIdentification identification;
};

# A snippet
public type InlineResponse2001Data record {
    string domain;
    string snippet;
};

# Update properties of a user
public type UsersUpsertBody record {
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

public type InlineResponse201 record {
    InlineResponse201Meta meta;
    string message;
};

# User identification requires a userId, email or both
public type LinkIdentification record {
    # Email address of the user
    string email?;
    # Unique identifier for the user in your database
    string userId?;
};

public type InlineResponse200 record {
    InlineResponse201Meta meta;
    # Validation of API Key
    InlineResponse200Data data;
};

# Account identification requires an accountId, domain or both
public type EventsIdentificationAccount record {
    # The domain associated with the account (e.g. acme-inc.com)
    string domain?;
    # Unique identifier for the account in your database
    string accountId?;
};

public type InlineResponse401 record {
    InlineResponse201Meta meta;
    string message;
};

public type InlineResponse400 record {
    record {string requestId; decimal status;} meta;
    string message;
    # Map that sums up all received values that seemed incorrect
    InlineResponse400Errors errors;
};

# Map that sums up all received values that seemed incorrect
public type InlineResponse400Errors record {
    # All input fields that seemed incorrect
    record {} fields?;
    # All query-, header- and path- parameters that seemed incorrect
    InlineResponse400ErrorsParameters parameters?;
};

# Update properties and/or members of an account
public type AccountsUpsertBody record {
    # Account identification requires an accountId, domain or both
    EventsIdentificationAccount identification;
    # The properties being set, possible values are strings, booleans, numbers and datetimes (ISO 8601)
    record {} properties?;
    # The users that are member of this account
    AccountsupsertMembers[] members?;
};

# All query-, header- and path- parameters that seemed incorrect
public type InlineResponse400ErrorsParameters record {
    record {} query?;
    record {} header?;
    record {} path?;
};

# Validation of API Key
public type InlineResponse200Data record {
    string[] permissions;
};

public type InlineResponse201Meta record {
    string requestId;
    decimal status;
};

public type InlineResponse2001 record {
    InlineResponse201Meta meta;
    # A snippet
    InlineResponse2001Data data;
};

# Event for a user or an account
public type EventsBody record {
    # Event identification requires a user, account or both
    EventsIdentification identification;
    string name;
    # Event metadata, possible values are strings, booleans, numbers and datetimes (ISO 8601)
    record {} metadata?;
    # If left blank this defaults to the current datetime
    string triggeredAt?;
};

# Link web activity to user
public type LinkBody record {
    string deviceId;
    # User identification requires a userId, email or both
    LinkIdentification identification;
};

# The user being added/removed from the account
public type AccountidUsersBody record {
    # Unique identifier for the user in your database
    string userId;
};
