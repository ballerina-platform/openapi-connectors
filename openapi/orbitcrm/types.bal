public type  CustomOrPostActivity Activity|PostActivity;

public type Note record {
    string body;
};

public type MemberAndIdentity record {
    # Represents an email address, a profile on networks like github and twitter, or a record in another system.
    Identity identity?;
    Member member?;
};

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

public type Member record {
    string bio?;
    string birthday?;
    string company?;
    # The member's dev.to username
    string devto?;
    # The member's email
    string email?;
    # The member's GitHub username
    string github?;
    # The member's LinkedIn username, without the in/ or pub/
    string linkedin?;
    string location?;
    string name?;
    string pronouns?;
    string shipping_address?;
    string slug?;
    # Deprecated: Please use the tags attribute instead
    string tag_list?;
    # Replaces all tags for the member; comma-separated string or array
    string tags?;
    # Adds tags to member; comma-separated string or array
    string tags_to_add?;
    boolean teammate?;
    string title?;
    string tshirt?;
    # The member's Twitter username
    string twitter?;
    string url?;
};

public type ActivityAndIdentity record {
    ActivityWithMember|PostActivityWithMember activity?;
    # Represents an email address, a profile on networks like github and twitter, or a record in another system.
    Identity identity?;
};

public type ActivityWithMember record {
    *Activity;
    Member member?;
};
