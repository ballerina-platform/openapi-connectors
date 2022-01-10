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

# Register participant response
public type InlineResponse2012 record {
    # Event session
    People data?;
};

# Create session response
public type InlineResponse2011 record {
    # Event session
    Session data?;
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
    string avatar_link?;
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
    string created_at?;
    # Updated time
    string updated_at?;
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
    string created_at?;
    # Updated time
    string updated_at?;
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
    record {
        *Event;
        # Attributes
        record {string role?; int? created_at?; int? updated_at?; string? timezone?; string? first_name?; string? last_name?; string? email?; string? avatar_link?; record {string event_id?; string created_at?; string updated_at?; record {string id?; string 'type?; int 'order?; string required?;}[] fields?;}[]? registrant_detail?; int messages_count?; int questions_count?; int votes_count?; int up_votes_count?;} attributes?;
    }[] data;
    # Metadata
    Meta meta?;
};

public type InlineResponse2002 record {
    # Data
    record {
        *Event;
        # Attributes
        record {string? event_type_id?; string status?; string timezone?; string room_link?; int attendees_count?; int? duration?; int estimated_started_at?; int? started_at?; int? ended_at?; int? canceled_at?; int created_at?; int updated_at?; int? registrants_count?;} attributes?;
    }[] data;
    # Metadata
    Meta meta?;
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
