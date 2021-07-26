public type StandardError record {
    string status;
    string id?;
    ErrorCategory category;
    record  { }  subCategory?;
    string message;
    ErrorDetail[] errors;
    record {} context;
    record {} links;
};

public type CollectionResponseAssociatedId record {
    AssociatedId[] results;
    Paging paging?;
};

public type BatchResponseSimplePublicObject record {
    string status;
    SimplePublicObject[] results;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
};

public type FilterGroup record {
    Filter[] filters;
};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

public type ForwardPaging record {
    NextPage next?;
};

public type SimplePublicObjectId record {
    string id;
};

public type BatchReadInputSimplePublicObjectId record {
    string[] properties;
    string idProperty?;
    SimplePublicObjectId[] inputs;
};

public type BatchInputSimplePublicObjectId record {
    SimplePublicObjectId[] inputs;
};

public type CollectionResponseWithTotalSimplePublicObjectForwardPaging record {
    int total;
    SimplePublicObject[] results;
    ForwardPaging paging?;
};

public type SimplePublicObject record {
    string id;
    record {} properties;
    string createdAt;
    string updatedAt;
    boolean archived?;
    string archivedAt?;
};

public type BatchInputSimplePublicObjectInput record {
    SimplePublicObjectInput[] inputs;
};

public type Paging record {
    NextPage next?;
    PreviousPage prev?;
};

public type PublicObjectSearchRequest record {
    FilterGroup[] filterGroups;
    string[] sorts;
    string query?;
    string[] properties;
    int 'limit;
    int after;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

public type BatchResponseSimplePublicObjectWithErrors record {
    string status;
    SimplePublicObject[] results;
    int numErrors?;
    StandardError[] errors?;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
};

# Company properties
public type SimplePublicObjectInput record {
    # Properties
    record {} properties;
};

public type CollectionResponseSimplePublicObjectWithAssociationsForwardPaging record {
    SimplePublicObjectWithAssociations[] results;
    ForwardPaging paging?;
};

public type ErrorCategory record {
    string httpStatus;
    string name;
};

public type SimplePublicObjectWithAssociations record {
    string id;
    record {} properties;
    string createdAt;
    string updatedAt;
    boolean archived?;
    string archivedAt?;
    record {} associations?;
};

public type Filter record {
    string value?;
    string propertyName;
    string operator;
};

public type BatchInputSimplePublicObjectBatchInput record {
    SimplePublicObjectBatchInput[] inputs;
};

public type PreviousPage record {
    string before;
    string link?;
};

public type CollectionResponseAssociatedIdForwardPaging record {
    AssociatedId[] results;
    ForwardPaging paging?;
};

public type SimplePublicObjectBatchInput record {
    record {} properties;
    string id;
};

public type AssociatedId record {
    string id;
    string 'type;
};

public type NextPage record {
    string after;
    string link?;
};
