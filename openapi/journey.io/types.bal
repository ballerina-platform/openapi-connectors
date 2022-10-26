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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-Api-Key`
    @display {label: "", kind: "password"}
    string xApiKey;
|};

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
