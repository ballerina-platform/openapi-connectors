public type  CustomOrPostActivity Activity|PostActivity;

# A member's notes are free-form areas to attach information to a member's profile.
public type Note record {
    # The body of member's note
    string body;
};

public type MemberAndIdentity record {
    # Represents an email address, a profile on networks like github and twitter, or a record in another system.
    Identity identity?;
    # Members are the people in the community.
    Member member?;
};

# Activities are instances of community participation and contribution.
public type Activity record {
    # The type of activity - what action was done by the member
    string activity_type?;
    # A description of the activity; displayed in the timeline
    string description?;
    # Supply a key that must be unique or leave blank to have one generated.
    string 'key?;
    # A URL for the activity; displayed in the timeline
    string link?;
    # The text for the timeline link
    string link_text?;
    # The date and time the activity occurred; defaults to now
    string occurred_at?;
    # [EXPERIMENTAL] Capture facets of the activity to group by later e.g. locations or channels; replaces existing value
    string[] tags?;
    # A title for the activity; displayed in the timeline
    string title;
    # A custom weight to be used in filters and reports; defaults to 1.
    string weight?;
};

public type PostActivityWithMember record {
    *PostActivity;
    # Members are the people in the community.
    Member member?;
};

# Represents an email address, a profile on networks like github and twitter, or a record in another system.
public type Identity record {
    # The email of the person in the source system
    string email?;
    # The name of the person in the source system
    string name?;
    # The type of source: known values include github, twitter, discourse, email, linkedin, devto. Custom values can also be used
    string 'source;
    # Specifies the location of the source, such as the host of a Discourse instance
    string source_host?;
    # The uid of the person in the source system
    string uid?;
    # For custom identities, an optional link to the profile on the source system
    string url?;
    # The username of the person in the source system
    string username?;
};

public type PostActivity record {
    # Activity type related to activities
    string activity_type;
    # The date and time at which the content was published; defaults to now
    string occurred_at?;
    # The url representing the post
    string url;
};

# Members are the people in the community.
public type Member record {
    # The member’s bio
    string bio?;
    # The member’s birthday, e.g. August 1
    string birthday?;
    # The member’s company
    string company?;
    # The member's dev.to username
    string devto?;
    # The member's email
    string email?;
    # The member's GitHub username
    string github?;
    # The member's LinkedIn username, without the in/ or pub/
    string linkedin?;
    # The member’s location. That field is not normalized and reflects what can be found in the member’s identities.
    string location?;
    # The member’s name
    string name?;
    # The member’s pronouns
    string pronouns?;
    # The member’s shipping address
    string shipping_address?;
    # The member’s slug in the Orbit app
    string slug?;
    # Deprecated: Please use the tags attribute instead
    string tag_list?;
    # Replaces all tags for the member; comma-separated string or array
    string tags?;
    # Adds tags to member; comma-separated string or array
    string tags_to_add?;
    # Whether the member is a teammate
    boolean teammate?;
    # The member’s title
    string title?;
    # The member’s tshirt size
    string tshirt?;
    # The member’s Twitter username, if available. null otherwise
    string twitter?;
    # The URL listed by the member in one of their profiles
    string url?;
};

public type ActivityAndIdentity record {
    ActivityWithMember|PostActivityWithMember activity?;
    # Represents an email address, a profile on networks like github and twitter, or a record in another system.
    Identity identity?;
};

public type ActivityWithMember record {
    *Activity;
    # Members are the people in the community.
    Member member?;
};
