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

# Event releationship
public type EventRelationship record {
    # Event session
    Session[] sessions?;
};

# Session request attributes
public type SessionRequestAttribute record {
    # Estimated started time
    string estimated_started_at?;
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

# Session releationship
public type SessionRelationship record {
    # People
    People[] people?;
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

# Event attributes
public type EventAttribute record {
    # Event title
    string title?;
    # Event slug
    string slug?;
    # Event title
    string registration_link?;
    # Estimated duration
    int estimated_duration?;
    # Registration page enabled or not
    boolean registration_page_enabled?;
    # Everyone can speack or not
    boolean everyone_can_speak?;
    # Description about event
    string? description?;
    # Event language
    string language?;
    # Updated timestamp
    int published_at?;
    # Created timestamp
    int created_at?;
    # Updated timestamp
    int updated_at?;
    # Owner details
    Owner owner?;
    # Number of sessions
    int sessions_count?;
    # Fields available
    Field[] fields?;
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

# Event fields
public type Field record {
    # Event field ID
    string id?;
    # Type of fields
    string 'type?;
    # Order of fields
    int 'order?;
    # Required or not
    boolean required?;
};

# Add People data
public type PeopleData record {
    # Event type
    string 'type?;
    # People request attributes
    PeopleRequestAttribute attributes?;
};

# People request attributes
public type PeopleRequestAttribute record {
    # Referrer detail
    string referrer?;
    # UTM tracking source
    string utm_source?;
    # UTM medium
    string utm_medium?;
    # UTM term
    string utm_term?;
    # UTM content
    string utm_content?;
    # UTM campaign
    string utm_campaign?;
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

# Event request attributes
public type EventRequestAttribute record {
    # Event ID to copy
    string copy_from_event_id?;
    # Owner ID
    string owner_id?;
    # Event title
    string title?;
    # Event slug
    string slug?;
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

# Event session
public type Session record {
    # Session type
    string 'type?;
    # Session ID
    string id?;
    # Event session attribute
    SessionAttribute attributes?;
};
