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
    # All requests on the Livestorm API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`.
    @display {label: "", kind: "password"}
    string authorization;
|};

# Metadata
public type Meta record {
    # Total record count
    int record_count?;
    # Page count
    int page_count?;
    # Items per page
    int items_per_page?;
};

# Owner details
public type Owner record {
    # Owner ID
    string id?;
    # Type
    string 'type?;
    # Owner attributes
    OwnerAttribute attributes?;
};

# Session releationship
public type SessionRelationship record {
    # People
    People[]? people?;
};

# Create new event response
public type InlineResponse201 record {
    # Event response
    Event data?;
};

public type InlineResponse200 record {
    # Event Data
    Event[] data;
    # Metadata
    Meta meta?;
};

# Event attributes
public type EventAttribute record {
    # Event title
    string title?;
    # Event slug
    string slug?;
    # Event title
    string? registration_link?;
    # Estimated duration
    int? estimated_duration?;
    # Registration page enabled or not
    boolean? registration_page_enabled?;
    # Everyone can speack or not
    boolean? everyone_can_speak?;
    # Description about event
    string? description?;
    # Event language
    string? language?;
    # Updated timestamp
    int? published_at?;
    # Created timestamp
    int? created_at?;
    # Updated timestamp
    int? updated_at?;
    # Owner details
    Owner owner?;
    # Number of sessions
    int? sessions_count?;
    # Fields available
    Field[]? fields?;
};

public type InlineResponse2002Data record {
    # Event ID
    string id?;
    # Event type
    string 'type?;
    # Attributes
    InlineResponse2002Attributes attributes?;
};

# Add Session data
public type SessionData record {
    # Event type
    string 'type?;
    # Session request attributes
    SessionRequestAttribute attributes?;
    # Session releationship
    SessionRelationship relationships?;
};

# Event post data
public type EventData record {
    # Event type
    string 'type?;
    # Event request attributes
    EventRequestAttribute attributes?;
    # Event releationship
    EventRelationship relationships?;
};

# Event fields
public type Field record {
    # Event field ID
    string? id?;
    # Type of fields
    string? 'type?;
    # Order of fields
    int? 'order?;
    # Required or not
    boolean? required?;
};

# People request attributes
public type PeopleRequestAttribute record {
    # Referrer detail
    string? referrer?;
    # UTM tracking source
    string utm_source?;
    # UTM medium
    string? utm_medium?;
    # UTM term
    string utm_term?;
    # UTM content
    string? utm_content?;
    # UTM campaign
    string utm_campaign?;
};

public type InlineResponse2003AttributesRegistrantDetail record {
    string event_id?;
    int created_at?;
    int updated_at?;
    InlineResponse2003AttributesRegistrantDetailFields[] fields?;
};

# Register participant response
public type InlineResponse2012 record {
    # Event session
    People data?;
};

public type InlineResponse2003Data record {
    # Event ID
    string id?;
    # Event type
    string 'type?;
    # Attributes
    InlineResponse2003Attributes attributes?;
};

# Create session response
public type InlineResponse2011 record {
    # Event session
    Session data?;
};

# Attributes
public type InlineResponse2002Attributes record {
    string? event_type_id?;
    string status?;
    string timezone?;
    string room_link?;
    int attendees_count?;
    int? duration?;
    int estimated_started_at?;
    int? started_at?;
    int? ended_at?;
    int? canceled_at?;
    int created_at?;
    int updated_at?;
    int? registrants_count?;
};

# Owner attributes
public type OwnerAttribute record {
    # Role of owner
    string role?;
    # Created timestamp
    int created_at?;
    # Updated timestamp
    int updated_at?;
    # Timezone
    string timezone?;
    # First name
    string first_name?;
    # Last name
    string last_name?;
    # Email
    string email?;
    # Avatar link
    string? avatar_link?;
};

# Event releationship
public type EventRelationship record {
    # Event session
    Session[]? sessions?;
};

# Session request attributes
public type SessionRequestAttribute record {
    # Estimated started time
    string? estimated_started_at?;
    # Time zone
    string timezone?;
};

# People attribute
public type PeopleAttribute record {
    # Role assigned to
    string role?;
    # Created time
    int created_at?;
    # Updated time
    int updated_at?;
    # Time zone
    string timezone?;
    # First name
    string first_name?;
    # Last name
    string last_name?;
    # Email address
    string email?;
    # Avatar url link
    string avatar_link?;
};

public type InlineResponse2003AttributesRegistrantDetailFields record {
    string id?;
    string 'type?;
    string? value?;
    boolean required?;
};

# Event session
public type People record {
    # People type
    string 'type?;
    # People ID
    string id?;
    # People attribute
    PeopleAttribute attributes?;
};

# RegisterPeopleRequest
public type IdPeopleBody record {
    # Add People data
    PeopleData data?;
};

# Event session attribute
public type SessionAttribute record {
    # Event type ID
    string event_type_id?;
    # Session status
    string status?;
    # Time zone
    string timezone?;
    # Url link to room
    string room_link?;
    # Number of Attendees
    string attendees_count?;
    # Session duration
    string duration?;
    # Estimated started time
    string estimated_started_at?;
    # Started time
    string started_at?;
    # Ended time
    string ended_at?;
    # Canceled time
    string canceled_at?;
    # Created time
    int created_at?;
    # Updated time
    int updated_at?;
    # Number of registrants
    string registrants_count?;
};

# PostSessionRequest
public type IdSessionsBody record {
    # Add Session data
    SessionData data?;
};

# Add People data
public type PeopleData record {
    # Event type
    string 'type?;
    # People request attributes
    PeopleRequestAttribute attributes?;
};

# Get an event by ID response
public type InlineResponse2001 record {
    # Event response
    Event data?;
};

# Event response
public type Event record {
    # Event ID
    string id?;
    # Event type
    string 'type?;
    # Event attributes
    EventAttribute attributes?;
};

# PosteventsRequest
public type EventsBody record {
    # Event post data
    EventData data?;
};

public type InlineResponse2003 record {
    # Data
    InlineResponse2003Data[] data;
    # Metadata
    Meta meta?;
};

public type InlineResponse2002 record {
    # Data
    InlineResponse2002Data[] data;
    # Metadata
    Meta meta?;
};

# Attributes
public type InlineResponse2003Attributes record {
    string role?;
    int? created_at?;
    int? updated_at?;
    string? timezone?;
    string? first_name?;
    string? last_name?;
    string? email?;
    string? avatar_link?;
    InlineResponse2003AttributesRegistrantDetail? registrant_detail?;
    int messages_count?;
    int questions_count?;
    int votes_count?;
    int up_votes_count?;
};

# Event request attributes
public type EventRequestAttribute record {
    # Event ID to copy
    string? copy_from_event_id?;
    # Owner ID
    string owner_id?;
    # Event title
    string title?;
    # Event slug
    string slug?;
};

# Event session
public type Session record {
    # Session type
    string 'type?;
    # Session ID
    string id?;
    # Event session attribute
    SessionAttribute attributes?;
};
