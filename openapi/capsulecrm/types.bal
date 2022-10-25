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
    http:BearerTokenConfig auth;
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

# Represents a task that is stored in Capsule. These are generally used as a simple way to create a reminder of something the user needs to do. Tasks can be categorized for such things as a meeting, phone call or submission deadline using task categories and can be linked to a party, opportunity or case.
public type Task record {
    # The unique id of this task.
    int id?;
    # The ISO date/time when this task was created.
    string createdAt?;
    # The ISO date/time when this task was last updated.
    string updatedAt?;
    # A short description of the task.
    string description;
    # More details about the task.
    string detail?;
    # Represents a task category.
    Category category?;
    # The date (without a time element) when this task is due.
    string dueOn;
    # The time (without a date element) when this task is due. Note that the time is in the user's timezone, and not UTC.
    string dueTime?;
    # Specify whether this task is open, completed or pending. A task is pending when it was not completed by the user, but is not relevant anymore (i.e. linked to a closed opportunity). Accepted values are OPEN, COMPLETED, PENDING.
    string status?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty party?;
    # Represents a reference to an opportunity. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Opportunity object. If the opportunity is restricted for the user calling the API endpoint the full Opportunity object is not included.
    NestedOpportunity opportunity?;
    # Represents a reference to a case. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Case object. If the case is restricted for the user calling the API endpoint the full Case object is not included.
    NestedCase kase?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # The username of the user that completed this task.
    string completedBy?;
    # The ISO DateTime when this task was completed. By default, this will be the time of the request that marked the task as completed. However, if you provide offline capability, you might want to override this field when completing the task.
    string completedAt?;
    # Determines if the task is part of a track associated with the parent kase or opportunity.
    boolean hasTrack?;
    # Represents a reference to a task. By default, contains only the id and description. If the field name is included in the embed parameter will instead be a full Task object.
    NestedTask nextTask?;
    # For tasks that are part of a track, this indicates if the dueOn date is calculated based on the start date of the track (TRACK_START), an end date specified when adding the track (END_DATE), or relative to the date the previous task in the track is completed (LAST_TASK). Accepted values are TRACK_START, END_DATE, LAST_TASK.
    string taskDelayRule?;
    # If this task is part of a track with a taskDelayRule of LAST_TASK, indicates the number of days after the completion of the previous task that this task is due. If this task is part of a track with a taskDelayRule of START_DATE or END_DATE, indicates the number of days between the start or end date of the track and the due date of this task respectively.
    int daysAfter?;
};

# Represents a task category.
public type Category record {
    # The unique id of this category.
    int id?;
    # The name of the category.
    string name;
    # The hex colour code of the category. Must be a '#' followed by 6 hexadecimal digits.
    string colour?;
};

# Represents a physical address of a contact that is stored in Capsule.
public type Address record {
    # The unique id of this address.
    int id?;
    # The address type. Accepted values are Home, Postal, Office, Billing, Shipping
    string 'type?;
    # The multi-line street address.
    string street?;
    # The city of the address.
    string city?;
    # The state or province of the address.
    string state?;
    # The country of the address. This field should be a valid country name. You can obtain a list of valid countries using the api/v2/countries endpoint.
    string country?;
    # The zip/postal code.
    string zip?;
};

# An object with a single property opportunity which must be an Opportunity object. One or more tracks can be applied to the opportunity by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new opportunities only, and tracks is not a field of Opportunity objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
public type CreateOpportunityRequest record {
    # Represents an opportunity that is stored in Capsule.
    OpportunityRequest opportunity?;
};

# An object with a single property kase which must be a Case object. Note that one or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
public type CreateCaseRequest record {
    # An object with a single property kase which must be a Case object. Note that one or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
    CaseRequest kase?;
};

# Represents a reference to a team.
public type NestedTeam record {
    # The unique id of this team.
    int id?;
    # The name of the team.
    string name?;
};

# Represents a website or a social network account.
public type Website record {
    # The unique id of this website.
    int id?;
    # Defines what social network this website represents. Accepted values are URL, SKYPE, TWITTER, LINKED_IN, FACEBOOK, XING, FEED, GOOGLE_PLUS, FLICKR, GITHUB, YOUTUBE, INSTAGRAM, PINTEREST.
    string 'service;
    # For Twitter, Github, Youtube, Pinterest, Instagram this is the account username. For all other services this is the profile or web page URL.
    string address;
    # Accepted values are Home, Work
    string 'type?;
    # Generated URL that links to the website or profile page.
    string url?;
};

# Represents an attached tag. Depending on the tag type this can be assignable to parties, opportunities or cases.
public type NestedTag record {
    # The id of this tag. Note that tags assignable to different entities (parties, cases or opportunities) can have the same id.
    int id?;
    # The name of this tag.
    string name;
    # A longer description of this tag.
    string description?;
};

# An object with a single property party which must be a Party object.
public type CreatePartyRequest record {
    # Represents a contact that is stored in Capsule. This can be either a person or an organisation.
    Party party?;
};

# Represents a case file that is stored in Capsule.
public type Case record {
    # The unique id of this case.
    int id?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty party;
    # The name of this case.
    string name;
    # The description of this case.
    string description?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # Represents a reference to a team.
    NestedTeam team?;
    # The status of the case. Accepted values are OPEN, CLOSED.
    string status?;
    # Represents a reference to an opportunity. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Opportunity object. If the opportunity is restricted for the user calling the API endpoint the full Opportunity object is not included.
    NestedOpportunity opportunity?;
    # The ISO date/time when this case was created.
    string createdAt?;
    # The ISO date/time when this case was last updated.
    string updatedAt?;
    # The ISO date when this case was closed.
    string closedOn?;
    # The ISO date/time when this case was last contacted. This field is automatically set by Capsule based on the attached history entries.
    string lastContactedAt?;
    # An array of tags that are added to this case. This field is included in responses only if the embed parameter contains tags.
    NestedTag[] tags?;
    # An array of custom fields that are defined for this case. This field is included in responses only if the embed parameter contains fields.
    FieldValue[] fields?;
    # Indicates if this case has any Important custom fields that are missing a value. This field is included in responses only if the embed parameter contains missingImportantFields.
    boolean missingImportantFields?;
};

# Represents a reference to a milestone. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Milestone object.
public type NestedMilestone record {
    # The unique id of the milestone.
    int id?;
    # The name of the milestone.
    string name?;
};

# An object with a single property parties which is an array of Party objects.
public type Parties record {
    # An array of Party objects.
    Party[] parties?;
};

# Represents a contact that is stored in Capsule. This can be either a person or an organisation.
public type Party record {
    # The unique id of this party.
    int id?;
    # Represents if this party is a person or an organisation. Accepted values are person, organisation.
    string 'type;
    # The first name of the person. This field is present only when type is person.
    string firstName?;
    # The last name of the person. This field is present only when type is person.
    string lastName?;
    # The title of the person. This field is present only when type is person. Accepted values are existing custom titles.
    string title?;
    # The job title of the person. This field is present only when type is person.
    string jobTitle?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty organisation?;
    # The name of the organisation. This field is present only when type is organisation.
    string name?;
    # A short description of the party.
    string about?;
    # The ISO date/time when this party was created.
    string createdAt?;
    # The ISO date/time when this party was last updated.
    string updatedAt?;
    # The ISO date/time when this party was last contacted.
    string lastContactedAt?;
    # An array of all the addresses associated with this party.
    Address[] addresses?;
    # An array of all the phone numbers associated with this party.
    PhoneNumber[] phoneNumbers?;
    # An array of the websites and social network accounts associated with this party.
    Website[] websites?;
    # An array of all the email addresses associated with this party.
    EmailAddress[] emailAddresses?;
    # A URL that represents the location of the profile picture for this party. This field is automatically derived by Capsule.
    string pictureURL?;
    # An array of tags that are added to this party. This field is included in responses only if the embed parameter contains tags.
    NestedTag[] tags?;
    # An array of custom fields that are defined for this party. This field is included in responses only if the embed parameter contains fields.
    FieldValue[] fields?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # Represents a reference to a team.
    NestedTeam team?;
    # Indicates if this party has any Important custom fields that are missing a value. This field is included in responses only if the embed parameter contains missingImportantFields.
    boolean missingImportantFields?;
};

# An object with a single property kase which must be a Case object. Note that one or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
public type CaseRequest record {
    # The unique id of this case.
    int id?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty party;
    # The name of this case.
    string name;
    # The description of this case.
    string description?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # Represents a reference to a team.
    NestedTeam team?;
    # The status of the case. Accepted values are OPEN, CLOSED.
    string status?;
    # Represents a reference to an opportunity. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Opportunity object. If the opportunity is restricted for the user calling the API endpoint the full Opportunity object is not included.
    NestedOpportunity opportunity?;
    # The ISO date/time when this case was created.
    string createdAt?;
    # The ISO date/time when this case was last updated.
    string updatedAt?;
    # The ISO date when this case was closed.
    string closedOn?;
    # The ISO date/time when this case was last contacted. This field is automatically set by Capsule based on the attached history entries.
    string lastContactedAt?;
    # An array of tags that are added to this case. This field is included in responses only if the embed parameter contains tags.
    NestedTag[] tags?;
    # An array of custom fields that are defined for this case. This field is included in responses only if the embed parameter contains fields.
    FieldValue[] fields?;
    # Indicates if this case has any Important custom fields that are missing a value. This field is included in responses only if the embed parameter contains missingImportantFields.
    boolean missingImportantFields?;
    # One or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
    TracksDefinitionObject[] tracks?;
};

# Created opportunity stored in Capsule
public type CreatedOpportunity record {
    # Represents an opportunity that is stored in Capsule.
    Opportunity opportunity?;
};

# Represents an opportunity that is stored in Capsule.
public type Opportunity record {
    # The unique id of this opportunity.
    int id?;
    # The ISO date/time this opportunity was created.
    string createdAt?;
    # The ISO DateTime when this opportunity was last updated.
    string updatedAt?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty party;
    # Represents a reference to a lost reason.
    NestedLostReason lostReason?;
    # The name of this opportunity.
    string name;
    # The description of this opportunity.
    string description?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # Represents a reference to a team.
    NestedTeam team?;
    # Represents a reference to a milestone. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Milestone object.
    NestedMilestone milestone;
    # Represents the value of an opportunity.
    OpportunityValue value?;
    # The expected close date of this opportunity.
    string expectedCloseOn?;
    # The probability of winning this opportunity.
    int probability?;
    # The time unit used by the duration field. Accepted values are FIXED, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR.
    string durationBasis?;
    # The duration of this opportunity. Must be null if durationBasis is set to FIXED.
    int duration?;
    # The date this opportunity was closed.
    string closedOn?;
    # An array of tags that are added to this opportunity. This field is included in responses only if the embed parameter contains tags.
    NestedTag[] tags?;
    # An array of custom fields that are defined for this opportunity. This field is included in responses only if the embed parameter contains fields.
    FieldValue[] fields?;
    # The ISO DateTime when this opportunity was last contacted.
    string lastContactedAt?;
    # The ISO DateTime when this opportunity last had its milestone changes.
    string lastStageChangedAt?;
    # Represents a reference to a milestone. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Milestone object.
    NestedMilestone lastOpenMilestone?;
    # Indicates if this opportunity has any Important custom fields that are missing a value. This field is included in responses only if the embed parameter contains missingImportantFields.
    boolean missingImportantFields?;
};

# Represents a value of a custom field. Depending on the custom field definition this can be assignable to parties, opportunities or cases.
public type FieldValue record {
    # The id of this value. Note that field values assignable to different entities (parties, cases or opportunities) can have the same id.
    int id?;
    # The value of this field. For text custom fields value is a string. For date custom fields value is a string in the format YYYY-MM-DD. For list custom fields value is a string and must match one of the options specified in the custom field definition. For boolean custom fields value is a boolean. For number custom fields value can be passed as either a string or a number, but will always be returned as a string by the API. For link custom fields value is a string URL and can include one of {id} - id, {name} - name, {email} - first email address, {phone} - first phone number, {phone[Mobile]} first mobile number, {custom[name of custom field]} - value of a custom field.
    string|boolean|decimal value;
    # Represents a reference to a definition of a custom field.
    NestedFieldDefinition definition;
};

# Created task stored in Capsule
public type CreatedTask record {
    # Represents a task that is stored in Capsule. These are generally used as a simple way to create a reminder of something the user needs to do. Tasks can be categorized for such things as a meeting, phone call or submission deadline using task categories and can be linked to a party, opportunity or case.
    Task task?;
};

# Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
public type NestedUser record {
    # The unique id of this user.
    int id?;
    # The username of the user.
    string username?;
    # The name of the user.
    string name?;
};

# Represents the value of an opportunity.
public type OpportunityValue record {
    # The amount the opportunity is worth.
    decimal amount;
    # The currency type of the opportunity.
    string currency?;
};

# A Party object.
public type PartyObject record {
    # Represents a contact that is stored in Capsule. This can be either a person or an organisation.
    Party party?;
};

# Represents a reference to a task. By default, contains only the id and description. If the field name is included in the embed parameter will instead be a full Task object.
public type NestedTask record {
    # The unique id of this task.
    int id?;
    # A short description of the task.
    string description?;
};

# Track definition object
public type TracksDefinitionObject record {
    # Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
    int|TrackDefinitionId definition?;
};

# Track Definition ID
public type TrackDefinitionId record {
    # Track ID
    int id?;
};

# An object with a single property tasks which is an array of Task objects.
public type Tasks record {
    # An array of Task objects.
    Task[] tasks?;
};

# Represents a reference to an opportunity. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Opportunity object. If the opportunity is restricted for the user calling the API endpoint the full Opportunity object is not included.
public type NestedOpportunity record {
    # The unique id of the opportunity.
    int id?;
    # The name of the opportunity. This will contain Private when the user calling the API endpoint doesn't have access to the opportunity record.
    string name?;
    # Defines whether this opportunity is restricted for the user calling the API endpoint.
    boolean isRestricted?;
};

# Represents an opportunity that is stored in Capsule.
public type OpportunityRequest record {
    # The unique id of this opportunity.
    int id?;
    # The ISO date/time this opportunity was created.
    string createdAt?;
    # The ISO DateTime when this opportunity was last updated.
    string updatedAt?;
    # Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
    NestedParty party;
    # Represents a reference to a lost reason.
    NestedLostReason lostReason?;
    # The name of this opportunity.
    string name;
    # The description of this opportunity.
    string description?;
    # Represents a reference to a user. By default, contains only the id, name and username. If the field is included in the embed parameter will instead be a full User object.
    NestedUser owner?;
    # Represents a reference to a team.
    NestedTeam team?;
    # Represents a reference to a milestone. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Milestone object.
    NestedMilestone milestone;
    # Represents the value of an opportunity.
    OpportunityValue value?;
    # The expected close date of this opportunity.
    string expectedCloseOn?;
    # The probability of winning this opportunity.
    int probability?;
    # The time unit used by the duration field. Accepted values are FIXED, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR.
    string durationBasis?;
    # The duration of this opportunity. Must be null if durationBasis is set to FIXED.
    int duration?;
    # The date this opportunity was closed.
    string closedOn?;
    # An array of tags that are added to this opportunity. This field is included in responses only if the embed parameter contains tags.
    NestedTag[] tags?;
    # An array of custom fields that are defined for this opportunity. This field is included in responses only if the embed parameter contains fields.
    FieldValue[] fields?;
    # The ISO DateTime when this opportunity was last contacted.
    string lastContactedAt?;
    # The ISO DateTime when this opportunity last had its milestone changes.
    string lastStageChangedAt?;
    # Represents a reference to a milestone. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Milestone object.
    NestedMilestone lastOpenMilestone?;
    # Indicates if this opportunity has any Important custom fields that are missing a value. This field is included in responses only if the embed parameter contains missingImportantFields.
    boolean missingImportantFields?;
    # One or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both.
    TracksDefinitionObject[] tracks?;
};

# A Case object.
public type CaseObject record {
    # Represents a case file that is stored in Capsule.
    Case kase?;
};

# An object with a single property opportunities which is an array of Opportunity objects.
public type Opportunities record {
    # An array of Opportunity objects.
    Opportunity[] opportunities?;
};

# Created party stored in Capsule
public type CreatedParty record {
    # Represents a contact that is stored in Capsule. This can be either a person or an organisation.
    Party party?;
};

# Represents an email address of a party.
public type EmailAddress record {
    # The unique id of this email address.
    int id?;
    # The type of the email address. Accepted values are Home, Work
    string 'type?;
    # The actual email address.
    string address;
};

# An Opportunity object.
public type OpportunityObject record {
    # Represents an opportunity that is stored in Capsule.
    Opportunity opportunity?;
};

# Represents a reference to a party. By default, contains only the id, name and pictureURL. If the field is included in the embed parameter will instead be a full Party object. If the party is restricted for the user calling the API endpoint, the full Party object is not included.
public type NestedParty record {
    # The unique id of the party.
    int id?;
    # The first name of the person. This field is present only when type is person.
    string firstName?;
    # The last name of the person. This field is present only when type is person.
    string lastName?;
    # The name of the organisation. This field is present only when type is organisation. This will contain Private when the user calling the API endpoint doesn't have access to the party record.
    string name?;
    # Represents if this party is a person or organisation. Accepted values are person, organisation
    string 'type?;
    # A URL that represents the location of the profile picture for this party.
    string pictureURL?;
    # Indicates whether this party is restricted for the user calling the API endpoint.
    boolean isRestricted?;
};

# Represents a reference to a lost reason.
public type NestedLostReason record {
    # The unique id of the lost reason.
    int id?;
    # The name of the lost reason.
    string name?;
};

# Represents a reference to a case. By default, contains only the id and name. If the field is included in the embed parameter will instead be a full Case object. If the case is restricted for the user calling the API endpoint the full Case object is not included.
public type NestedCase record {
    # The unique id of this case.
    int id?;
    # The name of this case. This will contain Private when the user calling the API endpoint doesn't have access to the the case record.
    string name?;
    # Defines whether this case is restricted for the user calling the API endpoint.
    boolean isRestricted?;
};

# Represents a reference to a definition of a custom field.
public type NestedFieldDefinition record {
    # The id of this custom field definition. Note that field definitions assignable to different entities (parties, opportunities or cases) can have the same id.
    int id?;
    # The name of this custom field.
    string name?;
};

# An object with a single property opportunity which must be an Opportunity object. Fields that are not included in the request will remain unchanged. An owner and/or team are required on an opportunity.
public type UpdateOpportunityRequest record {
    # Represents an opportunity that is stored in Capsule.
    Opportunity opportunity?;
};

# An object with a single property party which must be a Party object. Fields that are not included in the request will remain unchanged.
public type UpdatePartyRequest record {
    # Represents a contact that is stored in Capsule. This can be either a person or an organisation.
    Party party?;
};

# An object with a single property task which must be a Task object.
public type CreateTaskRequest record {
    # Represents a task that is stored in Capsule. These are generally used as a simple way to create a reminder of something the user needs to do. Tasks can be categorized for such things as a meeting, phone call or submission deadline using task categories and can be linked to a party, opportunity or case.
    Task task?;
};

# Created case stored in Capsule
public type CreatedCase record {
    # Represents a case file that is stored in Capsule.
    Case kase?;
};

# Represents a phone number of a party.
public type PhoneNumber record {
    # The unique id of this phone number.
    int id?;
    # The type of the phone number. Accepted values are Home, Work, Mobile, Fax, Direct.
    string 'type?;
    # The actual phone number.
    string number;
};

# An object with a single property kases which is an array of Case objects.
public type Cases record {
    # An array of Case objects.
    Case[] kases?;
};
