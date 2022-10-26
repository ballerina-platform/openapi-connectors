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
import ballerina/constraint;

public type InlineResponse2016Arr InlineResponse2016[];

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
    # The API Key with format `Token token=<API_KEY>`
    @display {label: "", kind: "password"}
    string authorization;
|};

public type IdRulesBody1 record {
    ServiceEventRule rule;
};

public type BusinessServiceReference record {
    *Reference;
    string 'type?;
};

# Set whether the resulting alert status is trigger or resolve.
public type EventruleactionscommonEventAction record {
    string value;
};

public type InlineResponse20049Relationships record {
    # The reference to the service that supports the technical service.
    InlineResponse20049SupportingService supporting_service?;
    # The reference to the service that is dependent on the technical service.
    InlineResponse20049DependentService dependent_service?;
    string id?;
    string 'type?;
};

public type ExtensionSchema record {
    # A small logo, 18-by-18 pixels.
    string icon_url?;
    # A large logo, 75 pixels high and no more than 300 pixels wide.
    string logo_url?;
    # Human friendly display label
    string label?;
    # Machine friendly display label
    string 'key?;
    # The long description for the Extension
    string description?;
    # A link to the extension's support guide
    string guide_url?;
    # The types of PagerDuty incident events that will activate this Extension
    string[] send_types?;
    # The url that the webhook payload will be sent to for this Extension.
    string url?;
};

public type IdNotificationSubscriptionsBody1 record {
    @constraint:Array {minLength: 1}
    NotificationSubscribable[] subscribables;
};

public type ExtensionSchemaReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse20058Subscriptions record {
    # An object describing the relationship of a NotificationSubscriber and a NotificationSubscribable.
    NotificationSubscription subscription?;
    # The name of the subscribable
    string? subscribable_name?;
};

# Defines how alerts on this service will be automatically grouped into incidents. Note that the alert grouping features are available only on certain plans.
public type AlertGroupingParameters record {
    # The type of Alert Grouping. When `type` is `intelligent`, `config` can be omitted.
    string 'type?;
    TimeBasedAlertGroupingConfiguration|ContentBasedAlertGroupingConfiguration config?;
};

# 
public type BusinessServiceIdImpactsBody record {
    string relation;
};

public type Impactor record {
    string id?;
    # The kind of object that is impacting
    string 'type?;
};

public type AuditRecordResponseSchema record {
    AuditRecord[] records;
    AuditMetadata? response_metadata?;
    *CursorPagination;
};

public type ExtensionsIdBody record {
    Extension extension;
};

public type UserReference record {
    *Reference;
    string 'type?;
};

public type TagsBody record {
    Tag tag;
};

public type SchedulesPreviewBody record {
    Schedule schedule;
};

public type EscalationTargetReference record {
    *Reference;
    string 'type?;
};

public type IntegrationEmailFilters record {
    string subject_mode;
    # Specify if subject_mode is set to match or no-match
    string subject_regex?;
    string body_mode;
    # Specify if body_mode is set to match or no-match
    string body_regex?;
    string from_email_mode;
    # Specify if from_email_mode is set to match or no-match
    string from_email_regex?;
};

public type NotificationRuleReference record {
    *Reference;
    string 'type?;
};

public type ChangeEventsIdBody record {
    ChangeEvent change_event;
};

public type TagReference record {
    *Reference;
    string 'type?;
};

# An object describing the relationship of a NotificationSubscriber and a NotificationSubscribable with additional context on status of subscription attempt.
public type NotificationSubscriptionWithContext record {
    # The ID of the entity being subscribed
    string subscriber_id?;
    # The type of the entity being subscribed
    string subscriber_type?;
    # The ID of the entity being subscribed to
    string subscribable_id?;
    # The type of the entity being subscribed to
    string subscribable_type?;
    # The type of the entity being subscribed to
    string account_id?;
    # The resulting status of the subscription
    string result?;
};

public type MaintenanceWindow record {
    # The type of object being created.
    string 'type;
    # The order in which the maintenance window was created.
    int sequence_number?;
    # This maintenance window's start time. This is when the services will stop creating incidents. If this date is in the past, it will be updated to be the current time.
    string start_time;
    # This maintenance window's end time. This is when the services will start creating incidents again. This date must be in the future and after the `start_time`.
    string end_time;
    # A description for this maintenance window.
    string description?;
    UserReference created_by?;
    ServiceReference[] services;
    TeamReference[] teams?;
};

public type ServiceEventRule record {
    # Position/index of the Event Rule on the Service.  Starting from position 0 (the first rule), rules are evaluated one-by-one until a matching Event Rule is found or the end of the list is reached.
    int position?;
    # When an event matches this Event Rule, the actions that will be taken to change the resulting Alert and Incident.
    EventRuleActionsCommon actions?;
};

public type ChangeeventImages record {
    string src?;
    string href?;
    string alt?;
};

public type InlineResponse2009 record {
    NotificationSubscriptionWithContext[] subscriptions?;
};

public type Ruleset record {
    # ID of the Ruleset.
    string id?;
    # the API show URL at which the object is accessible
    string self?;
    string 'type?;
    # Name of the Ruleset.
    string name?;
    # Routing keys routed to this Ruleset.
    string[] routing_keys?;
    # The date the Ruleset was created at.
    string created_at?;
    # Reference to the user that has created the Ruleset.
    RulesetCreator creator?;
    # The date the Ruleset was last updated.
    string updated_at?;
    # Reference to the user that has updated the Ruleset last.
    RulesetUpdater updater?;
    # Reference to the team that owns the Ruleset. If none is specified, only admins have access.
    RulesetTeam team?;
};

public type InlineResponse2008 record {
    *Pagination;
    NotificationSubscriber[] subscribers?;
    # The ID of the account belonging to the subscriber entity
    string account_id?;
};

# The service on which the incident occurred.
public type WebhooksV1Service record {
    string id?;
    # The name of the service.
    string name?;
    string html_url?;
    # The date/time the service was deleted, if it has been removed.
    string deleted_at?;
    # The description of the service.
    string description?;
};

# The parameters for performing the operation to populate the
public type EventruleParameters record {
    # The value for the operation. For example, an RE2 regular expression for regex-type variables.
    string value;
    # Path to a field in an event, in dot-notation. For Event Rules on a Service, this will have to be a PD-CEF field.
    string path;
};

public type MaintenanceWindowsIdBody record {
    MaintenanceWindow maintenance_window;
};

public type InlineResponse20057Members record {
    UserReference user?;
    string role?;
};

public type ExtensionReference record {
    *Reference;
    string 'type?;
};

public type WeeklyRestriction record {
    *Restriction;
    # The first day of the weekly rotation schedule as [ISO 8601 day](https://en.wikipedia.org/wiki/ISO_week_date) (1 is Monday, etc.)
    @constraint:Int {minValue: 1, maxValue: 7}
    int start_day_of_week;
};

# Tags to add to or remove from the entity.
public type IdChangeTagsBody record {
    # Array of tags and/or tag references to add to the entity.
    # For elements with type `tag_reference`, the tag with the corresponding `id` is added to the entity.
    # For elements with type `tag`, if there is an existing tag with the given
    # label that tag is added to the entity. If there is no existing tag with that label and the user has permission
    # to create tags, a new tag is created with that label and assigned to the entity.
    TagsToAdd[] add?;
    # Array of tag references to remove from the entity.
    EntityTypeidchangeTagsRemove[] remove?;
};

public type Notification record {
    string id?;
    # The type of notification.
    string 'type?;
    # The time at which the notification was sent
    string started_at?;
    # The address where the notification was sent. This will be null for notification type `push_notification`.
    string address?;
    UserReference user?;
};

public type AnalyticsModel record {
    # Accepts a set of filters to apply to the Incidents before aggregating.  Any incidents that do not match the included filters will be omitted from the results
    AnalyticsmodelFilters filters?;
    # The time zone to use for the results and grouping.
    string time_zone?;
    # The time unit to aggregate metrics by.  If no value is provided, the metrics will be aggregated for the entire period.
    string? aggregate_unit?;
};

# Set whether the resulting alert is suppressed. Can optionally be used with a threshold where resulting alerts will be suppressed until the threshold is met in a window of time. If using a threshold the rule must also set a route action.
public type EventruleactionscommonSuppress record {
    boolean value;
    # The number of occurences needed during the window of time to trigger the theshold.
    int threshold_value?;
    # The time unit for the window of time.
    string threshold_time_unit?;
    # The amount of time units for the window of time.
    int threshold_time_amount?;
};

public type ScheduleLayer record {
    string id?;
    # The start time of this layer.
    string 'start;
    # The end time of this layer. If `null`, the layer does not end.
    string end?;
    # The ordered list of users on this layer. The position of the user on the list determines their order in the layer.
    ScheduleLayerUser[] users;
    # An array of restrictions for the layer. A restriction is a limit on which period of the day or week the schedule layer can accept assignments.
    Restriction[] restrictions?;
    # The effective start time of the layer. This can be before the start time of the schedule.
    string rotation_virtual_start;
    # The duration of each on-call shift in seconds.
    int rotation_turn_length_seconds;
    # The name of the schedule layer.
    string name?;
    # This is a list of entries on the computed layer for the current time range. Since or until must be set in order for this field to be populated.
    ScheduleLayerEntry[] rendered_schedule_entries?;
    # The percentage of the time range covered by this layer. Returns null unless since or until are set.
    decimal rendered_coverage_percentage?;
};

public type ResponsePlaysBody record {
    ResponsePlay response_play;
};

# A reference of a subscribable entity.
public type NotificationSubscribable record {
    # The ID of the entity to subscribe to
    string subscribable_id?;
    # The type of the entity being subscribed to
    string subscribable_type?;
};

public type ServicesIdBody record {
    Service 'service;
};

public type InlineResponse2012 record {
    ResponsePlay response_play?;
};

public type InlineResponse2011 record {
    Incident incident;
};

public type Team record {
    # The type of object being created.
    string 'type;
    # The name of the team.
    @constraint:String {maxLength: 100}
    string name;
    # The description of the team.
    @constraint:String {maxLength: 1024}
    string description?;
    TeamReference parent?;
};

public type InlineResponse2014 record {
    EventRule rule?;
};

# An Audit Trail record
public type AuditRecord record {
    string id;
    # Record URL.
    string? self?;
    # The date/time the action executed, in ISO8601 format and millisecond precision.
    string execution_time;
    # Action execution context
    AuditrecordExecutionContext? execution_context?;
    Reference[]? actors?;
    # The method information
    AuditrecordMethod method;
    Reference root_resource;
    string action;
    # Additional details to provide further information about the action or
    # the resource that has been audited.
    AuditrecordDetails? details?;
};

public type InlineResponse2013 record {
    Ruleset ruleset?;
};

public type ContactMethod record {
    # The type of contact method being created.
    string 'type;
    # The label (e.g., "Work", "Mobile", etc.).
    string label;
    # The "address" to deliver to: email, phone number, etc., depending on the type.
    string address;
};

public type InlineResponse2016 record {
    # HTTP Status Code reflecting the result of creating this specific override, e.g. 201 for success, 400 for invalid parameters.
    decimal status?;
    # If present, an array of strings representing human-readable explanations for errors found.
    string[] errors?;
    Override override;
};

public type IdNotificationRulesBody record {
    NotificationRule notification_rule;
};

public type InlineResponse2015 record {
    Override[] overrides;
};

public type InlineResponse2018 record {
    PhoneContactMethod|PushContactMethod|EmailContactMethod contact_method?;
};

public type InlineResponse2017 record {
    ServiceEventRule rule?;
};

public type Context record {
    # The type of context being attached to the incident.
    string 'type;
    # The link's target url
    string href?;
    # The image's source url
    string src?;
    # The alternate display for an image
    string text?;
};

# Represents when scheduled action will occur.
public type ScheduledactionAt record {
    # Must be set to named_time.
    string 'type;
    # Designates either the start or the end of support hours.
    string name;
};

public type RulesetsBody record {
    record {*Ruleset;} ruleset;
};

public type InlineResponse409 record {
    InlineResponse409Error 'error?;
};

public type WebhooksubscriptionFilter record {
    # The id of the object being used as the filter.  This field is required for all filter types except account_reference.
    string id?;
    # The type of object being used as the filter.
    string 'type;
};

# A message containing information about a single PagerDuty action.
public type WebhooksV1Message record {
    # Uniquely identifies this outgoing webhook message; can be used for idempotency when processing the messages.
    string id?;
    # The type of action being reported by this message.
    string 'type?;
    # The date/time when the incident changed state.
    string created_on?;
    Webhooksv1messageData data?;
};

# The Business Service to be created
public type BusinessServicesidBusinessService record {
    # The name of the Business Service.
    string name?;
    # The description of the Business Service.
    string description?;
    # The owner of the Business Service.
    string point_of_contact?;
    # Reference to the team that owns the Business Service.
    Team2 team?;
};

public type AlertReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse20032PastIncidents record {
    # Incident model reference
    InlineResponse20032Incident incident?;
    # The computed similarity score associated with the incident and parent incident 
    decimal score?;
};

public type InlineResponse2001 record {
    # The set of abilities your account has.
    string[] abilities;
};

# Information about the configured webhook.
public type Webhook record {
    # The url endpoint the webhook payload is sent to.
    string endpoint_url?;
    # The name of the webhook.
    string name?;
    WebhookObject webhook_object?;
    # The object that contains webhook configuration values depending on the webhook type specification.
    record {} config?;
    OutboundIntegrationReference outbound_integration?;
};

public type InlineResponse2003 record {
    AnalyticsIncidentMetrics[] data?;
    *AnalyticsModel;
};

# The means by which this Note was created. Has different formats depending on type.
public type IncidentnoteChannel record {
    # A string describing the source of the Note.
    string summary;
    string id?;
    # A string that determines the schema of the object
    string 'type?;
    # The API show URL at which the object is accessible
    string self?;
    # a URL at which the entity is uniquely displayed in the Web app
    string html_url?;
};

public type ScheduledAction record {
    # The type of schedule action. Must be set to urgency_change.
    string 'type;
    # Represents when scheduled action will occur.
    ScheduledactionAt at;
    # Urgency level. Must be set to high.
    string to_urgency;
};

public type InlineResponse2002 record {
    *Pagination;
    AddonReference[] addons;
};

public type InlineResponse2005 record {
    *Pagination;
    BusinessService[] business_services;
};

# 
public type BusinessServicesPriorityThresholdsBody record {
    BusinessServicespriorityThresholdsGlobalThreshold global_threshold;
};

public type Webhooksv1incidentdataTriggerSummaryData record {
    string subject?;
};

public type InlineResponse2004 record {
    # Cursor to identify the first object in the response.
    string first;
    # Cursor to identify the last object in the response.
    string last;
    # Number of results to include in the batch.
    int 'limit;
    # Indicates if there are more resources available than were returned.
    boolean more;
    # The order in which the results were sorted;  asc for ascending, desc for descending.
    string 'order;
    # The column that was used for ordering the results.
    string order_by;
    # A collection of filters that were applied to the results.
    InlineResponse2004Filters filters?;
    # The time zone that the results are in.
    string time_zone;
    AnalyticsRawIncident[] data;
};

public type InlineResponse2007 record {
    boolean account_is_subscribed;
};

public type LiveListResponse record {
    # Echoes limit pagination property.
    int 'limit?;
    # Indicates if there are additional records to return
    boolean more?;
};

public type InlineResponse2006 record {
    BusinessService business_service;
};

public type AuditrecordDetailsReferences record {
    # Name of the reference field
    string name;
    # Human readable description of the references field
    string? description?;
    Reference[]? added?;
    Reference[]? removed?;
};

public type AlertCount record {
    # The count of triggered alerts
    int triggered?;
    # The count of resolved alerts
    int resolved?;
    # The total count of alerts
    int all?;
};

public type WebhooksubscriptionupdateWebhookSubscription record {
    # A short description of the webhook subscription.
    string description?;
    # The set of outbound event types the subscription will receive.
    @constraint:Array {minLength: 1}
    string[] events?;
    WebhooksubscriptionupdateWebhookSubscriptionFilter filter?;
    # If true, a webhook will be sent. True is the default state. If false, a webhook will not be sent.
    boolean active?;
};

public type WebhookIncidentAction record {
    *Action;
    # The type of action being reported by this message. * `incident.trigger` - Sent when an incident is newly created/triggered. * `incident.acknowledge` - Sent when an incident is acknowledged by a user. * `incident.unacknowledge` - Sent when an incident is unacknowledged due to its acknowledgement timing out. * `incident.resolve` - Sent when an incident has been resolved. * `incident.assign` - Sent when an incident has been assigned to another user. Often occurs in concert with an `acknowledge`. * `incident.escalate` - Sent when an incident has been escalated to another user in the same escalation chain. * `incident.delegate` - Sent when an incident has been reassigned to another escalation policy. * `incident.annotate` - Sent when a note is created on an incident.
    string 'type?;
    Incident incident?;
    # Log Entries that correspond to the action this Webhook is reporting. Includes the channels.
    LogEntry[] log_entries?;
};

# The Phone Contact Method of the User, used for Voice or SMS.
public type PhoneContactMethod record {
    *ContactMethod;
    string 'type?;
    # The 1-to-3 digit country calling code.
    @constraint:Int {minValue: 1, maxValue: 1999}
    int country_code;
    # If true, this phone is capable of receiving SMS messages.
    boolean enabled?;
    # If true, this phone has been blacklisted by PagerDuty and no messages will be sent to it.
    boolean blacklisted?;
};

public type IdSubscribersBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscriber[] subscribers;
};

public type ResponderRequestTargetReference record {
    # The type of target (either a user or an escalation policy)
    string 'type?;
    # The id of the user or escalation policy
    string id?;
    string summary?;
    # An array of responders associated with the specified incident
    IncidentsRespondersReference[] incident_responders?;
};

public type InlineResponse20061 record {
    NotificationRule[] notification_rules;
};

public type EventruleConditionsParameters record {
    # Path to a field in an event, in dot-notation.  For Event Rules on a serivce, this will have to be a PD-CEF field.
    string path;
    # Value to apply to the operator.
    string value;
    # Options to configure the operator.
    record {} options?;
};

public type EventruleConditionsSubconditions record {
    # The type of operator to apply.
    string operator;
    EventruleConditionsParameters parameters;
};

public type InlineResponse20060 record {
    (PhoneContactMethod|PushContactMethod|EmailContactMethod)[] contact_methods?;
};

# A reference of a subscriber entity with additional subscription context.
public type NotificationSubscriberWithContext record {
    # The ID of the entity being subscribed
    string subscriber_id?;
    # The type of the entity being subscribed
    string subscriber_type?;
    # If this subcriber has an indirect subscription to this incident via another object
    boolean has_indirect_subscription?;
    NotificationsubscriberwithcontextSubscribedVia[]? subscribed_via?;
};

public type ResponsePlayIdRunBody record {
    IncidentReference incident;
};

public type RulesetsIdBody record {
    Ruleset ruleset;
};

public type InlineResponse20063 record {
    UserSession[] user_sessions;
};

# Reference to the team that owns the Ruleset. If none is specified, only admins have access.
public type RulesetTeam record {
    string id;
    # A string that determines the schema of the object
    string 'type;
    # The API show URL at which the object is accessible
    string self?;
};

# A reference of a subscriber entity.
public type NotificationSubscriber record {
    # The ID of the entity being subscribed
    string subscriber_id?;
    # The type of the entity being subscribed
    string subscriber_type?;
};

public type InlineResponse20062 record {
    NotificationRule notification_rule?;
};

public type InlineResponse20065 record {
    StatusUpdateNotificationRule[] status_update_notification_rules;
};

public type InlineResponse20064 record {
    UserSession user_session;
};

public type InlineResponse20067 record {
    # A rule for contacting the user for Incident Status Updates.
    StatusUpdateNotificationRule notification_rule?;
};

public type InlineResponse20066 record {
    # A rule for contacting the user for Incident Status Updates.
    StatusUpdateNotificationRule notification_rule;
};

public type Webhooksv1messageData record {
    # The incident details at the time of the state change.
    WebhooksV1IncidentData incident?;
};

public type NotificationSubscriptionsUnsubscribeBody1 record {
    @constraint:Array {minLength: 1}
    NotificationSubscribable[] subscribables;
};

public type InlineResponse20069 record {
    Vendor[] vendor;
};

public type InlineResponse20068 record {
    *Pagination;
    Vendor[] vendors;
};

public type EscalateLogEntry record {
    *LogEntry;
    # An array of assigned Users for this log entry
    UserReference[] assignees?;
    string 'type?;
};

public type Override record {
    string id?;
    # The start date and time for the override.
    string 'start;
    # The end date and time for the override.
    string end;
    UserReference user;
};

# Set a note on the resulting incident.
public type EventruleactionscommonAnnotate record {
    # The content of the note.
    string value;
};

public type InlineResponse20014GlobalThreshold record {
    string id;
    decimal 'order;
};

public type UsersUserIdBody record {
    # The role of the user on the team.
    string role?;
};

public type AlertsAlertIdBody record {
    Alert alert;
};

# The reference to the service that is dependent on the Business Service.
public type InlineResponse20050DependentService record {
    string id?;
    string 'type?;
};

public type ResponsePlay record {
    # The type of object being created.
    string 'type?;
    # The name of the response play.
    string name?;
    # The description of the response play.
    string? description?;
    TeamReference|record {} team?;
    # An array containing the users and/or teams to be added as subscribers to any incident on which this response play is run.
    (UserReference|TeamReference)[]? subscribers?;
    # The content of the notification that will be sent to all incident subscribers upon the running of this response play. Note that this includes any users who may have already been subscribed to the incident prior to the running of this response play. If empty, no notifications will be sent.
    string? subscribers_message?;
    # An array containing the users and/or escalation policies to be requested as responders to any incident on which this response play is run.
    (UserReference|EscalationPolicyReference)[] responders?;
    # The message body of the notification that will be sent to this response play's set of responders. If empty, a default response request notification will be sent.
    string? responders_message?;
    # String representing how this response play is allowed to be run. Valid options are:
    #   - `services`: This response play cannot be manually run by any users. It will run automatically for new incidents triggered on any services that are configured with this response play.
    #   - `teams`: This response play can be run manually on an incident only by members of its configured team. This option can only be selected when the `team` property for this response play is not empty.
    #   - `responders`: This response play can be run manually on an incident by any responders in this account.
    string runnability?;
    # The telephone number that will be set as the conference number for any incident on which this response play is run.
    string? conference_number?;
    # The URL that will be set as the conference URL for any incident on which this response play is run.
    string? conference_url?;
    # This field has three possible values and indicates how the response play was created.
    #   - `none` : The response play had no conference_number or conference_url set at time of creation.
    #   - `manual` : The response play had one or both of conference_number and conference_url set at time of creation.
    #   - `zoom` : Customers with the Zoom-Integration Entitelment can use this value to dynamicly configure conference number and url for zoom
    string conference_type?;
};

# Incident model reference
public type InlineResponse20032Incident record {
    # The globally unique identifier of the incident
    string id?;
    # The date/time the incident was first triggered
    string created_at?;
    # The URL at which the object is accessible
    string self?;
    # The description of the nature, symptoms, cause, or effect of the incident
    string title?;
};

public type MatchPredicate record {
    string 'type;
    # Required if the type is `contains`, `exactly` or `regex`.
    @constraint:String {minLength: 1}
    string matcher?;
    # The email field that will attempt to use the matcher expression. Required if the type is `contains`, `exactly` or `regex`.
    string part;
    # Additional matchers to be run. Must be not empty if the type is `all`, `any`, or `not`.
    MatchPredicate[] children;
};

public type NotifyLogEntry record {
    *LogEntry;
    # Time at which the log entry was created
    string created_at?;
    UserReference user?;
    string 'type?;
};

# An incident action is a pending change to an incident that will automatically happen at some future time.
public type IncidentAction record {
    string 'type;
    string at;
};

public type ServiceReference record {
    *Reference;
    string 'type?;
};

public type StatusUpdate record {
    string id?;
    # The message of the status update.
    string message?;
    # The date/time when this status update was created.
    string created_at?;
    UserReference sender?;
};

public type InlineResponse20070 record {
    WebhookSubscription[] webhook_subscriptions;
    *Pagination;
};

public type BusinessServicesIdBody record {
    # The Business Service to be created
    BusinessServicesidBusinessService business_service?;
};

public type IdMergeBody record {
    # The source incidents that will be merged into the target incident and resolved.
    IncidentReference[] source_incidents;
};

public type UsersIdBody record {
    User user;
};

public type IncidentsIdBody record {
    # The parameters of the incident to update.
    IncidentsidIncident incident;
};

public type WebhookReference record {
    *Reference;
    string 'type?;
};

# A message containing information about a single PagerDuty action.
public type Action record {
    # Uniquely identifies this outgoing webhook message; can be used for idempotency when processing the messages.
    string id?;
    # The date/time when this message was was sent.
    string triggered_at?;
    # Information about the configured webhook.
    Webhook webhook?;
};

public type RelatedIncidentServiceDependencyBase record {
    # The ID of the Service referenced.
    string id?;
    # The type of the related Service.
    string 'type?;
    # The API show URL at which the object is accessible.
    string? self?;
};

public type IdSnoozeBody record {
    # The number of seconds to snooze the incident for. After this number of seconds has elapsed, the incident will return to the "triggered" state.
    int duration;
};

public type ImpactAdditionalFields record {
    # Priority information for the highest priority level that is affecting the impacted object.
    ImpactAdditionalFieldsHighestImpactingPriority? highest_impacting_priority?;
};

public type VendorReference record {
    *Reference;
    string 'type?;
};

# The Email Contact Method of the User.
public type EmailContactMethod record {
    *ContactMethod;
    string 'type?;
    # Send an abbreviated email message instead of the standard email output. Useful for email-to-SMS gateways and email based pagers.
    boolean send_short_email?;
};

public type IncidentBody record {
    string 'type;
    # Additional incident details.
    string details?;
};

public type SupportHours record {
    # The type of support hours
    string 'type?;
    # The time zone for the support hours
    string time_zone?;
    int[] days_of_week?;
    # The support hours' starting time of day (date portion is ignored)
    string start_time?;
    # The support hours' ending time of day (date portion is ignored)
    string end_time?;
};

public type EventruleVariables record {
    # The type of operation to populate the variable.
    string 'type;
    # The name of the variable.
    string name;
    # The parameters for performing the operation to populate the
    EventruleParameters parameters;
};

public type IncidentOccurrence record {
    # The ID of the Service referenced.
    int count?;
    # The percentage that this kind of Incident has occurred on this Service over the given period of time.
    decimal frequency?;
    # The classifcation of the Outlier Incident. The values can be one of ["novel", "rare",  "frequent", "other"].
    # "novel": It means this Incident hasn't occured.
    # "rare": It means this Incident occurs with a low frequency.
    # "frequent": It means this Incident occurs with a high frequency.
    # "other": It means this Incident occurs with a medium frequency.
    string category?;
    # The start of the date/time range over which Outlier Incident was calculated.
    string since?;
    # The end of the date/time range over which Outlier Incident was calculated.
    string until?;
};

# The data for a type of relationship where the Incident is related due to our machine learning algorithm.
public type RelatedIncidentMachineLearningRelationship record {
    # The classification for why this Related Incident was grouped into this group.
    # Values can be one of: [similar_contents, prior_feedback], where:
    # similar_contents - The Related Incident was due to similar contents of the Incidents.
    # prior_feedback - The Related Incident was determined to be related, based on User feedback or Incident merge/unmerge actions.
    string grouping_classification?;
    # The feedback provided from Users to influence the machine learning algorithm for future Related Incidents.
    RelatedincidentmachinelearningrelationshipUserFeedback user_feedback?;
};

public type EscalationPolicyReference record {
    *Reference;
    string 'type?;
};

public type IdResponderRequestsBody record {
    # The user id of the requester.
    string requester_id;
    # The message sent with the responder request.
    string message;
    # The array of targets the responder request is sent to.
    ResponderRequestTargetReference[] responder_request_targets;
};

public type TeamsIdBody record {
    Team team;
};

public type IncidentsAssignments record {
    UserReference assignee?;
};

public type RawIncidentsBody record {
    # Filters the result, only show incidents that match the conditions passed in the filter.
    AnalyticsrawincidentsFilters filters?;
    # A cursor to indicate the reference point that the results should follow
    string starting_after?;
    # A cursor to indicate the reference point that the results should precede
    string ending_before?;
    # The order the results;  asc for ascending, desc for descending. Defaults to 'desc'.
    string 'order?;
    # The column to use for ordering the results. Defaults to 'created_at'.
    string order_by?;
    # Number of results to include in each batch.
    # Limits between 1 to 1000 are accepted.
    int 'limit?;
    # The time zone to use for the results.
    string time_zone?;
};

# The data for a type of relationship where the Incident is related due to Business or Technical Service dependencies.
# 
# Both `dependent_services` and `supporting_services` are returned to signify the dependencies between the Services
# that the Incident and Related Incident belong to.
# 
# Each Service reference returned in the list of supporting and dependent Services has a type of:
# [business_service_reference, technical_service_reference].
public type RelatedIncidentServiceDependencyRelationship record {
    RelatedIncidentServiceDependencyBase[] dependent_services?;
    RelatedIncidentServiceDependencyBase[] supporting_services?;
};

public type PriorityReference record {
    *Reference;
    string 'type?;
};

public type ServiceDependenciesDisassociateBody record {
    # List of all service dependencies to be deleted.
    ServiceDependenciesassociateRelationships[] relationships?;
};

# 
public type IdOverridesBody record {
    Override[] overrides?;
};

public type BusinessServicesBody record {
    # The Business Service to be created
    BusinessServicesBusinessService business_service?;
};

public type Extension record {
    # The name of the extension.
    string name;
    # The type of object being created.
    string 'type = "extension";
    # The url of the extension.
    string endpoint_url?;
    # The objects for which the extension applies
    ServiceReference[] extension_objects;
    ExtensionSchemaReference extension_schema;
    # Whether or not this extension is temporarily disabled; for example, a webhook extension that is repeatedly rejected by the server.
    boolean temporarily_disabled = false;
    # The object that contains extension configuration values depending on the extension schema specification.
    record {} config?;
};

public type ScheduleLayerUser record {
    UserReference user;
};

public type UserRole record {
    # The role of the user for a set of resources.
    string role?;
    Reference[] resources?;
};

public type Schedule record {
    # The type of object being created.
    string 'type;
    # A list of schedule layers.
    ScheduleLayer[] schedule_layers?;
    # The time zone of the schedule.
    string time_zone;
    # The name of the schedule
    string name?;
    # The description of the schedule
    string description?;
    SubSchedule final_schedule?;
    SubSchedule overrides_subschedule?;
    # An array of all of the escalation policies that uses this schedule.
    EscalationPolicyReference[] escalation_policies?;
    # An array of all of the users on the schedule.
    UserReference[] users?;
    # An array of all of the teams on the schedule.
    TeamReference[] teams?;
};

# Set the priority ID for the resulting incident. You can find the priority you want by calling the priorities endpoint.
public type EventruleactionscommonPriority record {
    # The priority ID.
    string value;
};

public type StatusUpdatesSubscribersBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscriber[] subscribers;
};

public type Alert record {
    # The date/time the alert was first triggered.
    string created_at?;
    # The type of object being created.
    string 'type;
    # The current status of the alert.
    string status?;
    # The alert's de-duplication key.
    string alert_key?;
    ServiceReference 'service?;
    LogEntryReference first_trigger_log_entry?;
    IncidentReference incident?;
    # Whether or not an alert is suppressed. Suppressed alerts are not created with a parent incident.
    boolean suppressed = false;
    # The magnitude of the problem as reported by the monitoring tool.
    string severity?;
    IntegrationReference integration?;
    # A JSON object containing data describing the alert.
    Body body?;
};

public type ChangeeventLinks record {
    string href?;
    string text?;
};

public type SubSchedule record {
    # The name of the subschedule
    string name;
    # This is a list of entries on the computed layer for the current time range. Since or until must be set in order for this field to be populated.
    ScheduleLayerEntry[] rendered_schedule_entries?;
    # The percentage of the time range covered by this layer. Returns null unless since or until are set.
    decimal rendered_coverage_percentage?;
};

public type SchedulesBody record {
    Schedule schedule;
};

public type AuditMetadata record {
    string[]? messages?;
};

public type TeamReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse20019 record {
    ExtensionSchema extension_schema;
};

public type LogentryEventDetails record {
    # Additional details about the event.
    string description?;
};

public type ServicesBody record {
    Service 'service;
};

public type ContactMethodsContactMethodIdBody record {
    PhoneContactMethod|PushContactMethod|EmailContactMethod contact_method;
};

public type IntegrationsIntegrationIdBody record {
    Integration integration;
};

# The reference to the service that supports the Business Service.
public type InlineResponse20050SupportingService record {
    string id?;
    string 'type?;
};

public type StatusUpdateNotificationRulesStatusUpdateNotificationRuleIdBody record {
    # A rule for contacting the user for Incident Status Updates.
    StatusUpdateNotificationRule status_update_notification_rule;
};

public type EscalationPoliciesBody record {
    EscalationPolicy escalation_policy;
};

public type NotificationsubscriberwithcontextSubscribedVia record {
    # The id of the object this subscriber is subscribed via
    string id?;
    # The type of the object this subscriber is subscribed via
    string name?;
};

public type Assignment record {
    # Time at which the assignment was created.
    string at;
    UserReference assignee;
};

public type IncidentsRespondersReference record {
    # The status of the responder being added to the incident
    string state?;
    UserReference user?;
    IncidentReference incident?;
    string updated_at?;
    # The message sent with the responder request
    string message?;
    UserReference requester?;
    string requested_at?;
};

public type NotificationRulesNotificationRuleIdBody record {
    NotificationRule notification_rule;
};

public type AgentReference record {
    *Reference;
    string 'type?;
};

public type IncidentsidnotesNote record {
    # The note content
    string content;
};

# The user assigned to the incident.
public type WebhooksV1AssignedToUser record {
    string id?;
    # The user's name.
    string name?;
    # The user's email address.
    string email?;
    string html_url?;
};

public type ScheduleReference record {
    *Reference;
    string 'type?;
};

public type TagsToAdd record {
    string 'type;
    # The label of the tag. Should be used when type is "tag".
    @constraint:String {maxLength: 191}
    string label?;
    # The id of the tag. Should be used when type is "tag_reference".
    string id?;
};

public type InlineResponse20021 record {
    *Pagination;
    Incident[] incidents;
};

public type InlineResponse20020 record {
    *Pagination;
    Extension[] extensions;
};

public type InlineResponse20023 record {
    *Pagination;
    Alert[] alerts;
};

public type UsersBody record {
    User user;
};

public type IncidentAddon record {
    *Addon;
    # The services this Add-on is associated with.
    # If non-empty, the Add-on will appear only on incidents for those services.
    # If empty, it will appear on incidents for all services.
    ServiceReference[] services?;
};

public type InlineResponse20022 record {
    Incident incident;
};

# 
public type InlineResponse20025 record {
    string relation?;
};

public type ContactMethodReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse20024 record {
    Alert alert;
};

public type InlineResponse20027 record {
    *Pagination;
    LogEntry[] log_entries;
};

public type InlineResponse20026 record {
    *CursorPagination;
    Impact[] services?;
};

public type InlineResponse20029 record {
    IncidentNote[] notes;
};

public type InlineResponse20028 record {
    IncidentReference incident;
};

# The reference to the service that supports the technical service.
public type InlineResponse20049SupportingService record {
    string id?;
    string 'type?;
};

public type InlineResponse20034Relationships record {
    # The type of relationship. A relationship outlines the reason why two Incidents are considered related.
    string 'type?;
    RelatedIncidentMachineLearningRelationship|RelatedIncidentServiceDependencyRelationship metadata?;
};

public type RulesRuleIdBody record {
    EventRule rule?;
    # The id of the Event Rule to update.
    string rule_id;
};

# Reference to the user that has created the Ruleset.
public type RulesetCreator record {
    string id?;
    # A string that determines the schema of the object
    string 'type?;
    # The API show URL at which the object is accessible
    string self?;
};

# A fixed window of time during which the rule is active.
public type EventruleTimeFrameActiveBetween record {
    # The start time in milliseconds.
    int start_time;
    # End time in milliseconds.
    int end_time;
};

public type WebhooksubscriptionupdateWebhookSubscriptionFilter record {
    # The id of the object being used as the filter.  This field is required for all filter types except account_reference.
    string id?;
    # The type of object being used as the filter.
    string 'type?;
};

public type IncidentsBody record {
    # An array of incidents, including the parameters to update.
    IncidentsIncidents[] incidents;
};

public type AnalyticsRawIncident record {
    # Incident Id
    string id?;
    # ID of the team the incident was assigned to.
    string? team_id?;
    # ID of the service that the incident triggered on.
    string service_id?;
    # Timestamp of when the incident was created.
    string created_at?;
    # Timestamp of when the incident was resolved.
    string resolved_at?;
    # Notification level
    string urgency?;
    # An incident is classified as a [major incident](https://support.pagerduty.com/docs/operational-reviews#major-incidents) if it has one of the two highest priorities, or if multiple responders are added and acknowledge the incident.
    boolean major?;
    # ID of the incident's priority level.
    string? priority_id?;
    # The user-provided short name of the priority.
    string? priority_name?;
    # The integer representation of the incident's priority level.
    int priority_order?;
    # Time from when incident triggered until it was resolved.
    int seconds_to_resolve?;
    # Time between start of an incident, and the first responder to acknowledge.
    int seconds_to_first_ack?;
    # Time between start of an incident, and the first responder to acknowledge, or to accept responder request.
    int seconds_to_engage?;
    # Time between start of an incident, and the last additional responder to acknowledge.  If an incident has one or less responders, the value will be null.
    int seconds_to_mobilize?;
    # Total engaged time across all responders for this incident.  Engaged time is measured from the time a user engages with an incident (by acknowledging or accepting a responder request) until the incident is resolved.  This may include periods in which the incident was snoozed.
    int engaged_seconds?;
    # Total number of users who engaged (acknowledged, accepted responder request) in the incident.
    int engaged_user_count?;
    # Total count of instances where an incident is escalated between responders assigned to an escalation policy.
    int escalation_count?;
    # Total count of instances where an additional responder, who was not on-call for the incident, is added.
    int assignment_count?;
    # Total number of unique interruptions during business hour.
    # Business hour: 8am-6pm Mon-Fri, based on the user’s time zone.
    int business_hour_interruptions?;
    # Total number of unique interruptions during sleep hour.
    # Sleep hour: 10pm-8am every day, based on the user’s time zone.
    int sleep_hour_interruptions?;
    # Total number of unique interruptions during off hour.
    # Off hour: 6pm-10pm Mon-Fri and all day Sat-Sun, based on the user’s time zone.
    int off_hour_interruptions?;
    # Total seconds the incident has been snoozed for.
    int snoozed_seconds?;
};

public type EmailparserValueExtractors record {
    string 'type;
    string part;
    # The field name to set in the Incident object. Exactly one must use the `value_name` of `incident_key`
    @constraint:String {minLength: 1}
    string value_name;
    string regex?;
    string starts_after?;
    string ends_with?;
};

public type IdAlertsBody record {
    # An array of alerts, including the parameters to update for each alert.
    Alert[] alerts;
};

# Details of the incident to be created.
public type IncidentsIncident record {
    string 'type;
    # A succinct description of the nature, symptoms, cause, or effect of the incident.
    string title;
    ServiceReference 'service;
    PriorityReference priority?;
    # The urgency of the incident
    string urgency?;
    IncidentBody body?;
    # A string which identifies the incident. Sending subsequent requests referencing the same service and with the same incident_key will result in those requests being rejected if an open incident matches that incident_key.
    string incident_key?;
    # Assign the incident to these assignees. Cannot be specified if an escalation policy is given.
    IncidentsAssignments[] assignments?;
    EscalationPolicyReference escalation_policy?;
    ConferenceBridge conference_bridge?;
};

public type InlineResponse20030 record {
    IncidentNote note;
};

# The reference to the service that is dependent on the supporting service.
public type ServiceDependenciesassociateDependentService record {
    string id?;
    string 'type?;
};

# 
public type InlineResponse20032 record {
    # Aggregate of past incidents
    InlineResponse20032PastIncidents[] past_incidents?;
    # The total number of Past Incidents if the total parameter was set in the request
    decimal total?;
    # The maximum number of Incidents requested
    decimal 'limit?;
};

# 
public type InlineResponse20031 record {
    # Outlier Incident information calculated over the same Service as the given Incident.
    InlineResponse20031OutlierIncident outlier_incident?;
};

# 
public type InlineResponse20034 record {
    # A list of Related Incidents and their relationships.
    InlineResponse20034RelatedIncidents[] related_incidents?;
};

public type IdIntegrationsBody record {
    Integration integration;
};

public type RulesRuleIdBody1 record {
    ServiceEventRule rule?;
    # The id of the Event Rule to update on the Service.
    string rule_id;
};

public type OutboundIntegrationReference record {
    *Reference;
    string 'type?;
};

# Filters the result, only show incidents that match the conditions passed in the filter.
public type AnalyticsrawincidentsFilters record {
    # Filters the result, showing only the incidents where the creation timestamp is greater than the filter value.
    string created_at_start?;
    # Filters the result, showing only the incidents where the creation timestamp is less than the filter value.
    string created_at_end?;
    # Filters the result, showing only the incidents where urgency matches the filter value.
    string urgency?;
    # An incident is classified as a [major incident](https://support.pagerduty.com/docs/operational-reviews#major-incidents) if it has one of the two highest priorities, or if multiple responders are added and acknowledge the incident.
    boolean major?;
    # An array of team IDs. Only results related to these teams will be returned. Account must have the teams ability to use this parameter.
    string[] team_ids?;
    # An array of service IDs. Only results related to these services will be returned.
    string[] service_ids?;
    # The priority_ids filter applied to the results.
    string[] priority_ids?;
    # The priority_names filter applied to the results.
    string[] priority_names?;
};

public type InlineResponse20033 record {
    record {
        *ChangeEvent;
        record {
            # The reason a change event was determined to be related to the given incident.
            string reason?;
        } correlation_reason?;
    }[] change_events?;
};

public type InlineResponse20013GlobalThreshold record {
    string id?;
    int 'order?;
};

public type InlineResponse20036 record {
    StatusUpdate status_update;
};

public type InlineResponse20035 record {
    ResponderRequest responder_request;
};

public type InlineResponse20038 record {
    LogEntry log_entry;
};

public type InlineResponse20037 record {
    *Pagination;
    NotificationSubscriberWithContext[] subscribers?;
    # The ID of the account belonging to the subscriber entity
    string account_id?;
};

# The feedback provided from Users to influence the machine learning algorithm for future Related Incidents.
public type RelatedincidentmachinelearningrelationshipUserFeedback record {
    # The total number of times Users agreed that the Incidents are related.
    int positive_feedback_count?;
    # The total number of times Users disagreed that the Incidents are related.
    int negative_feedback_count?;
};

public type InlineResponse20039 record {
    *Pagination;
    MaintenanceWindow[] maintenance_windows;
};

public type InlineResponse20010AdditionalFields record {
    int total_impacted_count?;
};

# When an event matches this Event Rule, the actions that will be taken to change the resulting Alert and Incident.
public type EventRuleActionsCommon record {
    # Set a note on the resulting incident.
    EventruleactionscommonAnnotate? annotate?;
    # Set whether the resulting alert status is trigger or resolve.
    EventruleactionscommonEventAction? event_action?;
    # Dynamically extract values to set and modify new and existing PD-CEF fields.
    (record {
        # The PD-CEF field that will be set with the value from the regex.
        string target;
        # The path to the event field where the regex will be applied to extract a value.
        string 'source;
        # A RE2 regular expression.  If it contains one or more capture groups, their values will be extracted and appended together.  If it contains no capture groups, the whole match is used.
        string regex;
    }|record {
        # The PD-CEF field that will be set with the value from the regex.
        string target;
        # A value that will be used to populate the target PD-CEF field.  You can include variables extracted from the payload by using string interpolation.
        string template;
    })[] extractions?;
    # Set the priority ID for the resulting incident. You can find the priority you want by calling the priorities endpoint.
    EventruleactionscommonPriority? priority?;
    # Set the severity of the resulting alert.
    EventruleactionscommonSeverity? severity?;
    # Set whether the resulting alert is suppressed. Can optionally be used with a threshold where resulting alerts will be suppressed until the threshold is met in a window of time. If using a threshold the rule must also set a route action.
    EventruleactionscommonSuppress suppress?;
    # Set the length of time to suspend the resulting alert before triggering. Rules with a suspend action must also set a route action, and cannot have a suppress with threshold action
    EventruleactionscommonSuspend? suspend?;
};

public type WebhookSubscriptionUpdate record {
    WebhooksubscriptionupdateWebhookSubscription webhook_subscription?;
};

public type ResponderRequest record {
    IncidentReference incident?;
    UserReference requester?;
    # The time the request was made
    string requested_at?;
    # The message sent with the responder request
    string message?;
    # The array of targets the responder request is being sent to
    ResponderRequestTargetReference[] responder_request_targets?;
};

# Priority information for the highest priority level that is affecting the impacted object.
public type ImpactAdditionalFieldsHighestImpactingPriority record {
    string id?;
    int 'order?;
};

public type InlineResponse20031OutlierIncidentIncidentTemplate record {
    string id?;
    # The cluster the Incident Template pattern belongs to
    string cluster_id?;
    # The Incident Template mined pattern text
    string mined_text?;
};

public type IncidentsIncidents record {
    # The id of the incident to update.
    string id;
    # The incident type.
    string 'type;
    # The new status of the incident.
    string status?;
    # The resolution for this incident if status is set to resolved.
    string resolution?;
    # A succinct description of the nature, symptoms, cause, or effect of the incident.
    string title?;
    PriorityReference priority?;
    # Escalate the incident to this level in the escalation policy.
    int escalation_level?;
    # Assign the incident to these assignees.
    IncidentsAssignments[] assignments?;
    EscalationPolicyReference escalation_policy?;
    ConferenceBridge conference_bridge?;
};

public type BusinessServicespriorityThresholdsGlobalThreshold record {
    @constraint:String {minLength: 1}
    string id;
    decimal 'order;
};

public type InlineResponse20041 record {
    *Pagination;
    Oncall[] oncalls;
};

public type InlineResponse20040 record {
    *Pagination;
    Notification[] notifications;
};

# Outlier Incident information calculated over the same Service as the given Incident.
public type InlineResponse20031OutlierIncident record {
    Incident incident?;
    InlineResponse20031OutlierIncidentIncidentTemplate incident_template?;
};

public type InlineResponse20043 record {
    ResponsePlay[] response_plays?;
};

# Action execution context
public type AuditrecordExecutionContext record {
    # Request Id
    string? request_id?;
    # remote address
    string? remote_address?;
};

public type InlineResponse20042 record {
    *Pagination;
    Priority[] priorities;
};

public type InlineResponse20045 record {
    *Pagination;
    Ruleset[] rulesets?;
};

public type InlineResponse20044 record {
    string status;
};

public type InlineResponse20047 record {
    *Pagination;
    Schedule[] schedules;
};

public type InlineResponse20046 record {
    *Pagination;
    # The paginated list of rules of the Ruleset.
    EventRule[] rules?;
};

public type InlineResponse20049 record {
    # List of all the technical service's dependencies
    InlineResponse20049Relationships[] relationships?;
};

public type InlineResponse20048 record {
    User[] users;
};

public type LogEntryReference record {
    *Reference;
    string 'type?;
};

public type SnoozeLogEntry record {
    *LogEntry;
    IncidentAction[] changed_actions?;
    string 'type?;
};

public type IdUnsubscribeBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscriber[] subscribers;
};

# The reference to the service that is dependent on the technical service.
public type InlineResponse20049DependentService record {
    string id?;
    string 'type?;
};

public type Reference record {
};

public type ExtensionsBody record {
    Extension extension;
};

public type IncidentNote record {
    string id?;
    record {*Reference; string 'type?;} user?;
    # The means by which this Note was created. Has different formats depending on type.
    IncidentnoteChannel channel?;
    # The note content
    string content;
    # The time at which the note was submitted
    string created_at?;
};

public type InlineResponse20050Relationships record {
    # The reference to the service that supports the Business Service.
    InlineResponse20050SupportingService supporting_service?;
    # The reference to the service that is dependent on the Business Service.
    InlineResponse20050DependentService dependent_service?;
    string id?;
    string 'type?;
};

# Set the length of time to suspend the resulting alert before triggering. Rules with a suspend action must also set a route action, and cannot have a suppress with threshold action
public type EventruleactionscommonSuspend record {
    # The amount of time to suspend the alert in seconds.
    int value;
};

public type IncidentsBody1 record {
    # Details of the incident to be created.
    IncidentsIncident incident;
};

public type SchedulesIdBody record {
    Schedule schedule;
};

# The method information
public type AuditrecordMethod record {
    string? description?;
    # Truncated token containing the last 4 chars of the token's actual value.
    string? truncated_token?;
    # Describes the method used to perform the action:
    # 
    # `browser` -- authenticated user session. Session value is not returned in the `truncated_token` field.
    # 
    # `oauth` -- access token obtained via the OAuth flow. Truncated token value is returned in the `truncated_token` field.
    # 
    # `api_token` -- Pagerduty API token. Truncated token value is returned in the `truncated_token` field.
    # 
    # `identity_provider` -- action performed by an Identity provider on behalf of a user. No value is returned in the `truncated_token` field.
    # 
    # `other` -- Method that does not fall in the predefined categories. Truncated token value MAY be returned in the `truncated_token` field.
    string 'type;
};

public type IdChannelBody record {
    # The parameters to update.
    LogEntriesidchannelChannel channel;
};

public type IdStatusUpdatesBody record {
    # The message to be posted as a status update.
    string message;
};

public type InlineResponse20050 record {
    # List of all the Business Service's dependencies.
    InlineResponse20050Relationships[] relationships?;
};

public type IncidentReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse20052 record {
    *Pagination;
    # The paginated list of Event Rules of the Service.
    ServiceEventRule[] rules?;
};

public type InlineResponse20051 record {
    *Pagination;
    Service[] services;
};

public type NotificationRule record {
    # The type of object being created.
    string 'type;
    # The delay before firing the rule, in minutes.
    int start_delay_in_minutes;
    ContactMethodReference contact_method;
    # Which incident urgency this rule is used for. Account must have the `urgencies` ability to have a low urgency notification rule.
    string urgency;
};

public type PushContactMethodSound record {
    # The type of sound.
    string 'type?;
    # The sound file name.
    string file?;
};

public type InlineResponse20054 record {
    StatusDashboard status_dashboard?;
};

public type InlineResponse20053 record {
    *CursorPagination;
    StatusDashboard[] status_dashboards?;
};

public type InlineResponse20056 record {
    *Pagination;
    Team[] teams;
};

public type IdStatusUpdateNotificationRulesBody record {
    # A rule for contacting the user for Incident Status Updates.
    StatusUpdateNotificationRule status_update_notification_rule;
};

public type InlineResponse20055 record {
    *Pagination;
    EntityReference[] users?;
    EntityReference[] teams?;
    EntityReference[] escalation_policies?;
};

public type InlineResponse20058 record {
    *Pagination;
    InlineResponse20058Subscriptions[] subscriptions;
};

# Information about the affected field.
# When available, field's before and after values are returned:
#   
# #### Resource creation
# - `value` MAY be returned
# 
# #### Resource update
# - `value` MAY be returned
# - `before_value` MAY be returned
# 
# #### Resource deletion
# - `before_value` MAY be returned
public type AuditrecordDetailsFields record {
    # Name of the resource field
    string name;
    # Human readable description of the resource field
    string? description?;
    # new or updated value of the field
    string? value?;
    # previous or deleted value of the field
    string? before_value?;
};

public type Tag record {
    string id?;
    # A short-form, server-generated string that provides succinct, important information about an object suitable for primary labeling of an entity in a client. In many cases, this will be identical to `name`, though it is not intended to be an identifier.
    string? summary?;
    # A string that determines the schema of the object. This must be the standard name for the entity, suffixed by `_reference` if the object is a reference.
    string 'type?;
    # the API show URL at which the object is accessible
    string? self?;
    # a URL at which the entity is uniquely displayed in the Web app
    string? html_url?;
    # The type of object being created.
    string created_type = "tag";
    # The label of the tag.
    @constraint:String {maxLength: 191}
    string label;
};

public type InlineResponse20057 record {
    *Pagination;
    InlineResponse20057Members[] members?;
};

public type InlineResponse20059 record {
    *Pagination;
    User[] users;
};

# Reference to the user that has updated the Ruleset last.
public type RulesetUpdater record {
    string id?;
    # A string that determines the schema of the object
    string 'type?;
    # The API show URL at which the object is accessible
    string self?;
};

public type MaintenanceWindowsBody record {
    MaintenanceWindow maintenance_window;
};

public type IdNotificationSubscriptionsBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscribable[] subscribables;
};

# The configuration for Content Based Alert Grouping
public type ContentBasedAlertGroupingConfiguration record {
    # Whether Alerts should be grouped if `all` or `any` specified fields match. If `all` is selected, an exact match on every specified field name must occur for Alerts to be grouped. If `any` is selected, Alerts will be grouped when there is an exact match on at least one of the specified fields.
    string aggregate?;
    # The fields with which to group against. Depending on the aggregate, Alerts will group if some or all the fields match
    string[] fields?;
};

# A reccuring window of time based on the day of the week, during which the rule is active.
public type EventruleTimeFrameScheduledWeekly record {
    # The amount of milliseconds into the day at which the window starts.
    int start_time;
    # The duration of the window in milliseconds.
    int duration;
    # The timezone.
    string timezone;
    # An array of day values. Ex [1, 3, 5] is Monday, Wednesday, Friday.
    int[] weekdays;
};

# Additional details to provide further information about the action or
# the resource that has been audited.
public type AuditrecordDetails record {
    Reference 'resource;
    # A set of fields that have been affected.
    # The fields that have not been affected MAY be returned.
    AuditrecordDetailsFields[]? fields?;
    # A set of references that have been affected.
    AuditrecordDetailsReferences[]? references?;
};

public type InlineResponse409Error record {
    int code?;
    # Error message string
    string message?;
    string[] errors?;
};

public type IdNotesBody record {
    IncidentsidnotesNote note;
};

public type Pagination record {
    # Echoes offset pagination property.
    int offset?;
    # Echoes limit pagination property.
    int 'limit?;
    # Indicates if there are additional records to return
    boolean more?;
    # The total number of records matching the given query.
    int? total?;
};

public type WebhooksV1AssignedTo record {
    # Time at which the assignment was created.
    string at?;
    record {*WebhooksV1AssignedToUser; string 'type?;} 'object?;
};

public type ServiceDependenciesassociateRelationships record {
    # The reference to the service that supports the dependent service.
    ServiceDependenciesassociateSupportingService supporting_service?;
    # The reference to the service that is dependent on the supporting service.
    ServiceDependenciesassociateDependentService dependent_service?;
};

public type IdRulesBody record {
    EventRule rule;
};

public type AssignLogEntry record {
    *LogEntry;
    # An array of assigned Users for this log entry
    UserReference[] assignees?;
    string 'type?;
};

public type UserSession record {
    string id;
    string user_id;
    # The date/time the user session was first created.
    string created_at;
    # The type of the session
    string 'type;
    # The summary of the session
    string summary;
};

public type WebhookObject record {
    *Reference;
    string 'type?;
};

# Reference to the team that owns the business service.
public type Team3 record {
    string id;
    # A string that determines the schema of the object.
    string 'type?;
    # The API show URL at which the object is accessible.
    string self?;
};

# Reference to the team that owns the Business Service.
public type Team2 record {
    # The team ID
    string id?;
};

public type NotificationSubscriptionsUnsubscribeBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscribable[] subscribables;
};

# Reference to the team that owns the Business Service.
public type Team1 record {
    # The Team ID
    string id?;
};

public type Impact record {
    string id?;
    string name?;
    # The kind of object that has been impacted
    string 'type?;
    # The current impact status of the object
    string status?;
    ImpactAdditionalFields additional_fields?;
};

public type InlineResponse2019 record {
    # A rule for contacting the user for Incident Status Updates.
    StatusUpdateNotificationRule status_update_notification_rule;
};

public type InlineResponse20034RelatedIncidents record {
    Incident incident?;
    # A list of reasons for why the Incident is considered related.
    InlineResponse20034Relationships[] relationships?;
};

public type MaintenanceWindowReference record {
    *Reference;
    string 'type?;
};

public type TeamsBody record {
    Team team;
};

# The Business Service to be created
public type BusinessServicesBusinessService record {
    # The name of the Business Service.
    string name?;
    # The description of the Business Service.
    string description?;
    # The owner of the Business Service.
    string point_of_contact?;
    # Reference to the team that owns the Business Service.
    Team1 team?;
};

# The reference to the service that supports the dependent service.
public type ServiceDependenciesassociateSupportingService record {
    string id?;
    string 'type?;
};

public type Priority record {
    # The user-provided short name of the priority.
    string name?;
    # The user-provided description of the priority.
    string description?;
};

# Polymorphic object representation of the means by which the action was channeled. Has different formats depending on type, indicated by channel[type]. Will be one of `auto`, `email`, `api`, `nagios`, or `timeout` if `agent[type]` is `service`. Will be one of `email`, `sms`, `website`, `web_trigger`, or `note` if `agent[type]` is `user`. See [below](https://developer.pagerduty.com/documentation/rest/log_entries/show#channel_types) for detailed information about channel formats.
public type Channel record {
    # type
    string 'type;
    # user
    record {} user?;
    # team
    record {} team?;
    # channel
    record {} channel?;
};

public type IncidentUrgencyType record {
    # The type of incident urgency: whether it's constant, or it's dependent on the support hours.
    string 'type?;
    # The incidents' urgency, if type is constant.
    string urgency?;
};

public type EscalationRule record {
    string id?;
    # The number of minutes before an unacknowledged incident escalates away from this rule.
    int escalation_delay_in_minutes;
    # The targets an incident should be assigned to upon reaching this rule.
    @constraint:Array {maxLength: 10, minLength: 1}
    EscalationTargetReference[] targets;
};

public type EscalationPoliciesIdBody record {
    EscalationPolicy escalation_policy;
};

public type CursorPagination record {
    # The minimum of the `limit` parameter used in the request or the maximum request size of the API.
    int 'limit;
    # An opaque string than will deliver the next set of results when provided as the `cursor` parameter in a subsequent request.  A `null` value for this field indicates that there are no additional results.
    string? next_cursor;
};

public type ScheduleLayerEntry record {
    UserReference user?;
    # The start time of this entry.
    string 'start;
    # The end time of this entry. If null, the entry does not end.
    string end;
};

public type AnalyticsIncidentMetrics record {
    # ID of the service.  Only included when aggregating by service.
    string service_id?;
    # Name of the service.  Only included when aggregating by service.
    string service_name?;
    # ID of the team.
    string team_id?;
    # Name of the team.
    string team_name?;
    # Mean time from when an incident was triggered until it was resolved.
    int mean_seconds_to_resolve?;
    # Mean time between the start of an incident, and the first responder to acknowledge.
    int mean_seconds_to_first_ack?;
    # A measure of *people response time*. This metric measures the time from
    # the first user engagement (acknowledge or responder accept) to the last.
    # This metric is only used for incidents with **multiple responders**;
    # for incidents with one or no engaged users, this value is null.'
    int mean_seconds_to_engage?;
    # Mean time between the start of an incident, and the last additional responder
    # to acknowledge. For incidents with one or no engaged users, this value is null.
    int mean_seconds_to_mobilize?;
    # Mean engaged time across all responders for incidents that match the given filters.
    # Engaged time is measured from the time a user engages with an incident (by
    # acknowledging or accepting a responder request) until the incident is resolved.
    # This may include periods in which the incidents was snoozed.
    int mean_engaged_seconds?;
    # Mean number of users who engaged with an incident. *Engaged* is defined as
    # acknowledging an incident or accepting a responder request in it.
    int mean_engaged_user_count?;
    # Total count of instances where an incident is escalated between responders
    # assigned to an escalation policy.
    int total_escalation_count?;
    # Mean count of instances where an additional responder, who was not on-call for an incident, is added.
    int mean_assignment_count?;
    # Total number of unique interruptions during business hours.
    # Business hour: 8am-6pm Mon-Fri, based on the user’s time zone.
    int total_business_hour_interruptions?;
    # Total number of unique interruptions during sleep hours.
    # Sleep hour: 10pm-8am every day, based on the user’s time zone.
    int total_sleep_hour_interruptions?;
    # Total number of unique interruptions during off hours.
    # Off hour: 6pm-10pm Mon-Fri and all day Sat-Sun, based on the user’s time zone.
    int total_off_hour_interruptions?;
    # Total number of seconds incidents were snoozed.
    int total_snoozed_seconds?;
    # Total engaged time across all responders for incidents. Engaged time is measured from
    # the time a user engages with an incident (by acknowledging or accepting a responder request)
    # until the incident is resolved. This may include periods in which the incidents was snoozed.'
    int total_engaged_seconds?;
    # The percentage of time in the defined date range that the service was not interrupted
    # by a [major incident](https://support.pagerduty.com/docs/operational-reviews#major-incidents).
    decimal up_time_pct?;
    # The total response effort in seconds,
    # [as defined by the user](https://support.pagerduty.com/docs/editing-incidents#edit-incident-duration).
    int user_defined_effort_seconds?;
};

# The incident details at the time of the state change.
public type WebhooksV1IncidentData record {
    string id?;
    # The number of the incident. This is unique across the account.
    int incident_number?;
    # The date/time the incident was first triggered.
    string created_on?;
    # The current status of the incident.
    string status?;
    string html_url?;
    # The incident's de-duplication key.
    string incident_key?;
    # The service on which the incident occurred.
    WebhooksV1Service 'service?;
    # The user assigned to the incident.
    WebhooksV1AssignedToUser assigned_to_user?;
    WebhooksV1AssignedTo[] assigned_to?;
    Webhooksv1incidentdataTriggerSummaryData trigger_summary_data?;
    string trigger_details_html_url?;
    # The time at which the status of the incident last changed.
    string last_status_change_on?;
    # The user assigned to the incident.
    WebhooksV1AssignedToUser last_status_change_by?;
    # Number of times the incident has been escalated.
    int number_of_escalations?;
    string urgency?;
};

# Accepts a set of filters to apply to the Incidents before aggregating.  Any incidents that do not match the included filters will be omitted from the results
public type AnalyticsmodelFilters record {
    # Accepts an ISO8601 DateTime string.  Any incidents with a created_at less than this value will be omitted from the results.  The maximum supported time range in conjunction with created_at_end is one year.
    string created_at_start?;
    # Accepts an ISO8601 DateTime string.  Any incidents with a created_at greater than or equal to this value will be omitted from the results.  The maximum supported time range in conjunction with created_at_start is one year.
    string created_at_end?;
    # Any incidents whose urgency does not match the provided string will be omitted from the results.
    string urgency?;
    # A boolean flag including whether results should contain *only* [major incidents](https://support.pagerduty.com/docs/operational-reviews#major-incidents), or exclude major incidents. If no value is provided all incidents will be included.
    boolean major?;
    # An array of team IDs. Only incidents related to these teams will be included in the results. If omitted, all teams the requestor has access to will be included in the results.
    string[] team_ids?;
    # An array of service IDs. Only incidents related to these services will be included in the results. If omitted, all services the requestor has access to will be included in the results.
    string[] service_ids?;
    # An array of priority IDs. Only incidents with these priorities will be included in the results. If omitted, all services the requestor has access to will be included in the results.
    string[] priority_ids?;
    # An array of user-defined priority names. Only incidents with these priorities will be included in the results. If omitted, all services the requestor has access to will be included in the results.
    string[] priority_names?;
};

public type AddonsIdBody record {
    Addon addon;
};

# Conditions evaluated to check if an event matches this Event Rule. Is always empty for the catch_all rule, though.
public type EventruleConditions record {
    # Operator to combine sub-conditions.
    string operator;
    # Array of sub-conditions.
    EventruleConditionsSubconditions[] subconditions;
};

# The Push Contact Method of the User.
public type PushContactMethod record {
    *ContactMethod;
    string 'type?;
    # The type of device.
    string device_type;
    PushContactMethodSound[] sounds?;
    # Time at which the contact method was created.
    string created_at?;
    # If true, this phone has been blacklisted by PagerDuty and no messages will be sent to it.
    boolean blacklisted?;
};

public type User record {
    # The name of the user.
    @constraint:String {maxLength: 100}
    string name;
    # The type of object being created.
    string 'type;
    # The user's email address.
    string email;
    # The preferred time zone name. If null, the account's time zone will be used.
    string time_zone?;
    # The schedule color.
    string color?;
    # The user role. Account must have the `read_only_users` ability to set a user as a `read_only_user` or a `read_only_limited_user`, and must have advanced permissions abilities to set a user as `observer` or `restricted_access`.
    string role?;
    # The URL of the user's avatar.
    string avatar_url?;
    # The user's bio.
    string? description?;
    # If true, the user has an outstanding invitation.
    boolean invitation_sent?;
    # The user's title.
    @constraint:String {maxLength: 100}
    string job_title?;
    # The list of teams to which the user belongs. Account must have the `teams` ability to set this.
    TeamReference[] teams?;
    # The list of contact methods for the user.
    ContactMethodReference[] contact_methods?;
    # The list of notification rules for the user.
    NotificationRuleReference[] notification_rules?;
};

public type WebhookSubscriptionsBody record {
    WebhookSubscription webhook_subscription;
};

public type ConferenceBridge record {
    # The phone number of the conference call for the conference bridge. Phone numbers should be formatted like +1 415-555-1212,,,,1234#, where a comma (,) represents a one-second wait and pound (#) completes access code input.
    string conference_number?;
    # An URL for the conference bridge. This could be a link to a web conference or Slack channel.
    string conference_url?;
};

public type EventRule record {
    # ID of the Event Rule.
    string id?;
    # the API show URL at which the object is accessible.
    string self?;
    # Indicates whether the Event Rule is disabled and would therefore not be evaluated.
    boolean disabled?;
    # Conditions evaluated to check if an event matches this Event Rule. Is always empty for the catch_all rule, though.
    EventruleConditions conditions?;
    # Time-based conditions for limiting when the rule is active.
    EventruleTimeFrame time_frame?;
    # [Early Access] Populate variables from event payloads and use those variables in other event actions.
    EventruleVariables[] variables?;
    # Position/index of the Event Rule in the Ruleset.  Starting from position 0 (the first rule), rules are evaluated one-by-one until a matching rule is found.
    int position?;
    # Indicates whether the Event Rule is the last Event Rule of the Ruleset that serves as a catch-all. It has limited functionality compared to other rules and always matches.
    boolean catch_all?;
    # When an event matches this rule, the actions that will be taken to change the resulting alert and incident.
    record {
        *EventRuleActionsCommon;
        # Set the service ID of the target service for the resulting alert. You can find the service you want to route to by calling the services endpoint.
        record {
            # The target service's ID.
            string value;
        } route?;
    } actions?;
};

public type AddonsBody record {
    Addon addon;
};

# A collection of filters that were applied to the results.
public type InlineResponse2004Filters record {
    # The lower boundary for the created_at range filter applied to the results.
    string created_at_start?;
    # The upper boundary for the created_at range filter applied to the results.
    string created_at_end?;
    # The urgency filter applied to the results.
    string urgency?;
    # The [major incident](https://support.pagerduty.com/docs/operational-reviews#major-incidents) filter applied to the results.
    boolean major?;
    # The team_ids filter applied to the results.
    string[] team_ids?;
    # The service_ids filter applied to the results.
    string[] service_ids?;
    # The priority_ids filter applied to the results.
    @constraint:Array {maxLength: 5}
    string[] priority_ids?;
    # The priority_names filter applied to the results.
    @constraint:Array {maxLength: 5}
    string[] priority_names?;
};

public type AcknowledgerReference record {
    *Reference;
    string 'type?;
};

public type InlineResponse201 record {
    AddonReference addon;
};

public type InlineResponse200 record {
    *Pagination;
    Tag[] tags;
};

public type ResponsePlaysIdBody record {
    ResponsePlay response_play;
};

public type IdContactMethodsBody record {
    PhoneContactMethod|PushContactMethod|EmailContactMethod contact_method;
};

public type Acknowledgement record {
    # Time at which the acknowledgement was created.
    string at;
    AcknowledgerReference acknowledger;
};

public type WebhooksubscriptionDeliveryMethod record {
    string id?;
    # The secret used to sign webhook payloads. Only provided on the initial create response.
    string? secret?;
    # Whether or not this webhook subscription is temporarily disabled. Becomes `true` if the delivery method URL is repeatedly rejected by the server.
    boolean temporarily_disabled?;
    # Indicates the type of the delivery method.
    string 'type;
    # The destination URL for webhook delivery.
    string url;
};

public type Oncall record {
    EscalationPolicyReference escalation_policy?;
    UserReference user?;
    ScheduleReference schedule?;
    # The escalation level for the on-call.
    int escalation_level?;
    # The start of the on-call. If `null`, the on-call is a permanent user on-call.
    string 'start?;
    # The end of the on-call. If `null`, the user does not go off-call.
    string end?;
};

public type EntityTypeidchangeTagsRemove record {
    string 'type;
    # The id of the tag
    string id;
};

public type StatusUpdatesUnsubscribeBody record {
    @constraint:Array {minLength: 1}
    NotificationSubscriber[] subscribers;
};

public type EntityReference record {
    *Reference;
    string 'type?;
};

public type EmailParser record {
    string action;
    MatchPredicate match_predicate;
    # Additional values that will be pulled in to the Incident object. Exactly one value extractor must have a `value_name` of `incident_key`.
    @constraint:Array {minLength: 1}
    EmailparserValueExtractors[] value_extractors?;
};

# Set the severity of the resulting alert.
public type EventruleactionscommonSeverity record {
    string value;
};

public type IntegrationReference record {
    *Reference;
    string 'type?;
};

# A JSON object containing data describing the alert.
public type Body record {
    # The type of the body.
    string 'type?;
    # Contexts to be included with the body such as links to graphs or images.
    Context[] contexts?;
    # An arbitrary JSON object containing any data explaining the nature of the alert.
    record {} details?;
};

public type LogEntry record {
    string 'type?;
    # Time at which the log entry was created.
    string created_at?;
    # Polymorphic object representation of the means by which the action was channeled. Has different formats depending on type, indicated by channel[type]. Will be one of `auto`, `email`, `api`, `nagios`, or `timeout` if `agent[type]` is `service`. Will be one of `email`, `sms`, `website`, `web_trigger`, or `note` if `agent[type]` is `user`. See [below](https://developer.pagerduty.com/documentation/rest/log_entries/show#channel_types) for detailed information about channel formats.
    Channel channel?;
    AgentReference agent?;
    # Optional field containing a note, if one was included with the log entry.
    string note?;
    # Contexts to be included with the trigger such as links to graphs or images.
    Context[] contexts?;
    ServiceReference 'service?;
    IncidentReference incident?;
    # Will consist of references unless included
    TeamReference[] teams?;
    LogentryEventDetails event_details?;
};

# The parameters to update.
public type LogEntriesidchannelChannel record {
    # New channel details
    string details;
    # Channel type. Cannot be changed and must match the present value.
    string 'type;
};

public type Addon record {
    # The type of Add-on.
    string 'type;
    # The name of the Add-on.
    @constraint:String {maxLength: 100}
    string name;
    # The source URL to display in a frame in the PagerDuty UI. HTTPS is required.
    string src;
};

public type Integration record {
    string 'type?;
    # The name of this integration.
    string name?;
    ServiceReference 'service?;
    # The date/time when this integration was created.
    string created_at?;
    VendorReference vendor?;
    # Specify for generic_email_inbound_integration. Must be set to an email address @your-subdomain.pagerduty.com
    string integration_email?;
    # Specify for generic_email_inbound_integration
    string email_incident_creation?;
    # Specify for generic_email_inbound_integration. May override email_incident_creation
    string email_filter_mode?;
    # Specify for generic_email_inbound_integration.
    @constraint:Array {minLength: 1}
    EmailParser[] email_parsers?;
    # Specify for generic_email_inbound_integration.
    string email_parsing_fallback?;
    # Specify for generic_email_inbound_integration.
    @constraint:Array {minLength: 1}
    IntegrationEmailFilters[] email_filters?;
};

# The parameters of the incident to update.
public type IncidentsidIncident record {
    # The incident type.
    string 'type;
    # The new status of the incident.
    string status?;
    PriorityReference priority?;
    # The resolution for this incident if status is set to resolved.
    string resolution?;
    # The new title of the incident.
    string title?;
    # Escalate the incident to this level in the escalation policy.
    int escalation_level?;
    # Assign the incident to these assignees.
    IncidentsAssignments[] assignments?;
    EscalationPolicyReference escalation_policy?;
    # The urgency of the incident.
    string urgency?;
    ConferenceBridge conference_bridge?;
};

public type AddonReference record {
    *Reference;
    # The URL source of the Addon
    string src?;
    # The user entered name of the Addon.
    string name?;
    string 'type?;
};

public type StatusDashboard record {
    string id?;
    string url_slug?;
    string name?;
};

public type WebhookSubscription record {
    string id?;
    # The type indicating the schema of the object.
    string 'type;
    # Determines whether this subscription will produce webhook events.
    boolean active = true;
    WebhooksubscriptionDeliveryMethod delivery_method;
    # A short description of the webhook subscription.
    string description?;
    # The set of outbound event types the webhook will receive.
    @constraint:Array {minLength: 1}
    string[] events;
    WebhooksubscriptionFilter filter;
};

# A rule for contacting the user for Incident Status Updates.
public type StatusUpdateNotificationRule record {
    ContactMethodReference contact_method;
};

public type EscalationPolicy record {
    # The type of object being created.
    string 'type;
    # The name of the escalation policy.
    string name;
    # Escalation policy description.
    string description?;
    # The number of times the escalation policy will repeat after reaching the end of its escalation.
    int num_loops = 0;
    # Determines how on call handoff notifications will be sent for users on the escalation policy. Defaults to "if_has_services".
    string on_call_handoff_notifications?;
    EscalationRule[] escalation_rules;
    ServiceReference[] services?;
    # Teams associated with the policy. Account must have the `teams` ability to use this parameter.
    TeamReference[] teams?;
};

public type Service record {
    # The type of object being created.
    string 'type;
    # The name of the service.
    string name?;
    # The user-provided description of the service.
    string description?;
    # Time in seconds that an incident is automatically resolved if left open for that long. Value is `null` if the feature is disabled. Value must not be negative. Setting this field to `0`, `null` (or unset in POST request) will disable the feature.
    int auto_resolve_timeout = 14400;
    # Time in seconds that an incident changes to the Triggered State after being Acknowledged. Value is `null` if the feature is disabled. Value must not be negative. Setting this field to `0`, `null` (or unset in POST request) will disable the feature.
    int acknowledgement_timeout = 1800;
    # The date/time when this service was created
    string created_at?;
    # The current state of the Service. Valid statuses are:
    # 
    # 
    # - `active`: The service is enabled and has no open incidents. This is the only status a service can be created with.
    # - `warning`: The service is enabled and has one or more acknowledged incidents.
    # - `critical`: The service is enabled and has one or more triggered incidents.
    # - `maintenance`: The service is under maintenance, no new incidents will be triggered during maintenance mode.
    # - `disabled`: The service is disabled and will not have any new triggered incidents.
    string status = "active";
    # The date/time when the most recent incident was created for this service.
    string last_incident_timestamp?;
    EscalationPolicyReference escalation_policy;
    # The set of teams associated with this service.
    TeamReference[] teams?;
    # An array containing Integration objects that belong to this service. If `integrations` is passed as an argument, these are full objects - otherwise, these are references.
    IntegrationReference[] integrations?;
    IncidentUrgencyRule incident_urgency_rule?;
    SupportHours support_hours?;
    # An array containing scheduled actions for the service.
    ScheduledAction[] scheduled_actions?;
    # The array of Add-ons associated with this service.
    AddonReference[] addons?;
    # Whether a service creates only incidents, or both alerts and incidents. A service must create alerts in order to enable incident merging.
    # * "create_incidents" - The service will create one incident and zero alerts for each incoming event.
    # * "create_alerts_and_incidents" - The service will create one incident and one associated alert for each incoming event.
    string alert_creation?;
    # Defines how alerts on this service will be automatically grouped into incidents. Note that the alert grouping features are available only on certain plans.
    AlertGroupingParameters alert_grouping_parameters?;
    # Defines how alerts on this service will be automatically grouped into incidents. Note that the alert grouping features are available only on certain plans. There are three available options:
    # * null - No alert grouping on the service. Each alert will create a separate incident;
    # * "time" - All alerts within a specified duration will be grouped into the same incident. This duration is set in the `alert_grouping_timeout` setting (described below). Available on Standard, Enterprise, and Event Intelligence plans;
    # * "intelligent" - Alerts will be intelligently grouped based on a machine learning model that looks at the alert summary, timing, and the history of grouped alerts. Available on Enterprise and Event Intelligence plans
    string alert_grouping?;
    # The duration in minutes within which to automatically group incoming alerts. This setting applies only when `alert_grouping` is set to `time`. To continue grouping alerts until the Incident is resolved, set this value to `0`.
    int alert_grouping_timeout?;
};

public type Vendor record {
    # The short name of the vendor
    string name?;
    # URL of the vendor's main website
    string website_url?;
    # URL of a logo identifying the vendor
    string logo_url?;
    # URL of a small thumbnail image identifying the vendor
    string thumbnail_url?;
    # A short description of this vendor, and common use-cases of integrations for this vendor.
    string description?;
    # URL of an integration guide for this vendor
    string integration_guide_url?;
};

# An object describing the relationship of a NotificationSubscriber and a NotificationSubscribable.
public type NotificationSubscription record {
    # The ID of the entity being subscribed
    string subscriber_id?;
    # The type of the entity being subscribed
    string subscriber_type?;
    # The ID of the entity being subscribed to
    string subscribable_id?;
    # The type of the entity being subscribed to
    string subscribable_type?;
    # The ID of the account belonging to the subscriber entity
    string account_id?;
};

public type IncidentUrgencyRule record {
    *IncidentUrgencyType;
    IncidentUrgencyType during_support_hours?;
    IncidentUrgencyType outside_support_hours?;
};

public type Restriction record {
    # Specify the types of `restriction`.
    string 'type;
    # The duration of the restriction in seconds.
    int duration_seconds;
    # The start time in HH:mm:ss format.
    string start_time_of_day;
    # Only required for use with a `weekly_restriction` restriction type. The first day of the weekly rotation schedule as [ISO 8601 day](https://en.wikipedia.org/wiki/ISO_week_date) (1 is Monday, etc.)
    @constraint:Int {minValue: 1, maxValue: 7}
    int start_day_of_week?;
};

public type BusinessService record {
    # The name of the business service.
    string name?;
    # The user-provided description of the business service.
    string description?;
    # The point of contact assigned to this service.
    string point_of_contact?;
    # Reference to the team that owns the business service.
    Team3? team?;
};

public type ChangeEvent record {
    # The time at which the emitting tool detected or generated the event.
    string timestamp?;
    # The type of object being created.
    string 'type?;
    # An array containing Service objects that this change event is associated with.
    ServiceReference[] services?;
    record {*IntegrationReference;} integration?;
    # This is the 32 character Integration Key for an Integration on a Service. The same Integration Key can be used for both alert and change events.
    string routing_key?;
    # A brief text summary of the event. Displayed in PagerDuty to provide information about the change. The maximum permitted length of this property is 1024 characters.
    string summary?;
    # The unique name of the location where the Change Event occurred.
    string 'source?;
    # List of links to include.
    ChangeeventLinks[] links?;
    ChangeeventImages[] images?;
    # Additional details about the change event.
    record {} custom_details?;
};

public type InlineResponse20010 record {
    *LiveListResponse;
    Impact[] services?;
    InlineResponse20010AdditionalFields additional_fields?;
};

public type ServiceDependenciesAssociateBody record {
    # List of all service dependencies to be created.
    ServiceDependenciesassociateRelationships[] relationships?;
};

public type InlineResponse20012 record {
    *LiveListResponse;
    Impactor[] impactors?;
};

public type InlineResponse20011 record {
    decimal deleted_count;
    decimal unauthorized_count;
    decimal non_existent_count;
};

# 
public type InlineResponse20014 record {
    InlineResponse20014GlobalThreshold global_threshold;
};

# Time-based conditions for limiting when the rule is active.
public type EventruleTimeFrame record {
    # A fixed window of time during which the rule is active.
    EventruleTimeFrameActiveBetween active_between?;
    # A reccuring window of time based on the day of the week, during which the rule is active.
    EventruleTimeFrameScheduledWeekly scheduled_weekly?;
};

public type Incident record {
    # The number of the incident. This is unique across your account.
    int incident_number?;
    # The date/time the incident was first triggered.
    string created_at?;
    # The current status of the incident.
    string status?;
    # A succinct description of the nature, symptoms, cause, or effect of the incident.
    string title?;
    # The list of pending_actions on the incident. A pending_action object contains a type of action which can be escalate, unacknowledge, resolve or urgency_change. A pending_action object contains at, the time at which the action will take place. An urgency_change pending_action will contain to, the urgency that the incident will change to.
    IncidentAction[] pending_actions?;
    # The incident's de-duplication key.
    string incident_key?;
    ServiceReference 'service?;
    # List of all assignments for this incident. This list will be empty if the `Incident.status` is `resolved`.
    Assignment[] assignments?;
    # How the current incident assignments were decided.  Note that `direct_assignment` incidents will not escalate up the attached `escalation_policy`
    string assigned_via?;
    # List of all acknowledgements for this incident. This list will be empty if the `Incident.status` is `resolved` or `triggered`.
    Acknowledgement[] acknowledgements?;
    # The time at which the status of the incident last changed.
    string last_status_change_at?;
    AgentReference last_status_change_by?;
    LogEntryReference first_trigger_log_entry?;
    EscalationPolicyReference escalation_policy?;
    # The teams involved in the incident’s lifecycle.
    TeamReference[] teams?;
    PriorityReference priority?;
    # The current urgency of the incident.
    string urgency?;
    ResolveReason resolve_reason?;
    AlertCount alert_counts?;
    ConferenceBridge conference_bridge?;
    IncidentBody body?;
    IncidentOccurrence occurrence?;
};

public type InlineResponse20013 record {
    InlineResponse20013GlobalThreshold? global_threshold?;
};

public type ResolveReason record {
    # The reason the incident was resolved. The only reason currently supported is merge.
    string 'type?;
    IncidentReference incident?;
};

# The configuration for Time Based Alert Grouping
public type TimeBasedAlertGroupingConfiguration record {
    # The duration in minutes within which to automatically group incoming Alerts.  To continue grouping Alerts until the Incident is resolved, set this value to 0.
    int timeout?;
};

public type InlineResponse20016 record {
    ChangeEvent change_event?;
};

public type InlineResponse20015 record {
    ChangeEvent[] change_events?;
};

public type InlineResponse20018 record {
    *Pagination;
    ExtensionSchema[] extension_schemas;
};

public type InlineResponse20017 record {
    *Pagination;
    EscalationPolicy[] escalation_policies;
};
