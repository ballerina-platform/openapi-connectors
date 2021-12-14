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

public type AttributeArr Attribute[];

public type AudienceArr Audience[];

public type ImpressionsUsageArr ImpressionsUsage[];

public type CampaignArr Campaign[];

public type ChangeHistoryChangeArr ChangeHistoryChange[];

public type EnvironmentArr Environment[];

public type EventArr Event[];

public type ExperimentArr Experiment[];

public type SectionArr Section[];

public type ExtensionArr Extension[];

public type FeatureArr Feature[];

public type GroupArr Group[];

public type ListAttributeArr ListAttribute[];

public type PageArr Page[];

public type ProjectArr Project[];

public type SubjectAccessRequestArr SubjectAccessRequest[];

public type Account record {
    # The unique identifier of the Account
    int id?;
    # The name of the Account
    string name?;
};

public type Entity record {
    # Generated URL to access the entity by using the public API.
    string api_url?;
    # ID of the entity.
    int id?;
    # Name of the entity.
    string name?;
    # Optional field for entities that have sub_types (projects, experiments, extensions, pages, etc)
    string sub_type?;
    # Type of the entity as defined by the public API.
    string 'type?;
    # Generated URL to access the entity using Optimizely UI.
    string ui_url?;
};

public type AccountFeatureSource record {
    string 'type?;
    string value?;
};

public type CampaignResults record {
    # The unique identifier for the Campaign
    int campaign_id?;
    # The significance level at which you would like to declare winning and losing variations. A lower number minimizes the time needed to declare a winning or losing variation, but increases the risk that your results aren't true winners and losers.
    float confidence_threshold?;
    # End of the time interval (exclusive) used to calculate the results. The time is formatted in ISO 8601.
    string end_time?;
    # The breakdown of Campaign results by metric. CampaignMetricResults object ordering in the array is consistent with the order that metrics are attached to the Experiment in the Optimizely UI and REST API (i.e. index 0 is the primary metric, indices 1-4 are secondary metrics, indices 5+ are monitoring metrics). See here for an explantion of the impact of metric ordering on results calculations.
    CampaignMetricResults[] metrics?;
    # Start of the time interval (inclusive) used to calculate the results. The time is formatted in ISO 8601.
    string start_time?;
};

public type BucketingInformation record {
    # ID of the Account
    int account_id?;
    # Array of bucketing information items
    BucketingInformationItem[] bucketing_history?;
    # The unique identifier of the visitor
    string visitor_id?;
};

public type Feature record {
    # Whether the Feature has been archived
    boolean archived?;
    # Time when the Feature was created
    string created?;
    # A short description of this Feature
    string description?;
    # The configuration for this Feature's Rollout within each Environment, keyed by Environment key
    record {} environments?;
    # The ID of this Feature
    int id?;
    # Unique string identifier for this Feature within the Project
    string 'key;
    # Date last modified
    string last_modified?;
    # Name of the Feature
    string name?;
    # The ID of the Project this Feature belongs to
    int project_id;
    # Variables define the dynamic configuration of a feature, and each variable can take on a different value on a per-variation basis within a feature test.
    FeatureVariable[] variables?;
};

public type ExtensionUpdate record {
    # Whether the extension is archived
    boolean archived?;
    # The description for the extension
    string description?;
    # The URL to load when editing the extension
    string edit_url?;
    # Whether the extension is enabled
    boolean enabled?;
    # Array of editable fields in the extension
    Field[] fields?;
    Implementation implementation?;
    # Name of the extension
    string name?;
};

public type ListAttributeUpdate record {
    # Whether or not the List Attribute has been archived
    boolean archived?;
    # A short description of the List Attribute
    string description?;
    # The name of the object which holds targeting ids on your website
    string key_field?;
    # A comma separated string of IDs or ZIP Codes. Items will be matched against the key_field to determine if an active visitor should be targeted by the list.  Note that if the list currently contains data, providing this value will overwrite the previous data.
    string list_content?;
    # The type of data object which holds targeting ids on your website (cookies, query parameters, zip codes, Global JS variables)
    string list_type?;
    # A unique, human-readable name for the List Attribute
    string name?;
};

public type ChangeAttribute record {
    # Name of the class to set the element(s) matched by a selector to
    string 'class?;
    # Whether or not to hide the element(s) matched by a selector
    boolean hide?;
    # Value of href attribute to add to element(s) matched by a selector
    string href?;
    # Value of HTML attribute to add to element(s) matched by a selector
    string html?;
    # Whether or not to remove the element(s) matched by a selector
    boolean remove?;
    # Value of src attribute to add to element(s) matched by a selector
    string src?;
    # Value of style attribute to add to element(s) matched by a selector
    string style?;
    # Value of text attribute to add to the element(s) matched by a selector
    string text?;
};

public type FeatureVariableUpdate record {
    # Whether or not this Feature Variable is archived
    boolean archived?;
    # The stringified default value for this Feature Variable. The default value is the value Optimizely SDKs will return when this Feature Variable is accessed by getFeatureVariableValue unless the Feature Variable's value is a part of a feature test variation.
    string default_value?;
    # A short description of this Feature Variable
    string description?;
    # The ID of this Feature Variable
    int id?;
    # Unique string identifier for this Feature Variable within the Feature
    string 'key?;
    # The datatype for this Feature Variable
    string 'type?;
};

public type AudienceUpdate record {
    # True if the Audience has been archived
    boolean archived?;
    # A string defining the targeting rules for an Audience
    string conditions?;
    # A short description of the Audience
    string description?;
    # The name of the Audience
    string name?;
    # True if the Audience is available for segmentation on the results page (Enterprise plans only)
    boolean segmentation?;
};

public type ChangeHistoryChange record {
    # Action performed on the entity.
    string change_type?;
    # List of change details.
    ChangeDetail[] changes?;
    # Created time of the current revision. Format is ISO 8601.
    string created?;
    Entity entity?;
    # ID of the change.
    int id?;
    # ID of the project related to the entity.
    int project_id;
    ChangeRevision revisions?;
    # Origin of the current revision.
    string 'source?;
    # Short human readable description of the change.
    string summary?;
    User user?;
};

public type ExperimentEnvironment record {
    # The Experiment's status in different Environments based on the environment key.
    string status;
};

public type ExperimentResultsReport record {
    # End of the time interval (exclusive) used to generate the report. The time is formatted in ISO 8601.
    string end_time?;
    # The unique identifier for the Experiment for which the report is to be generated.
    int experiment_id?;
    # Outcome of the experiment as inferred by the Optimizely system upon the evaluation of variations that may or may not have reached statistical significance.
    string inferred_outcome?;
    # Start of the time interval (inclusive) used to generate the reports. The time is formatted in ISO 8601.
    string start_time?;
};

public type Audience record {
    # Whether the Audience has been archived
    boolean archived?;
    # A string defining the targeting rules for an Audience
    string conditions?;
    # The time the Audience was initially created
    string created?;
    # A short description of the Audience
    string description?;
    # The unique identifier for the Audience
    int id?;
    # Whether or not Audience is a classic Audience. If true, the Audience is only compatible with classic Experiments. Otherwise, the Audience may be used in Optimizely X Campaigns.
    boolean is_classic?;
    # The last time the Audience was modified
    string last_modified?;
    # The name of the Audience
    string name?;
    # The ID of the Project the Audience was created in
    int project_id;
    # True if the Audience is available for segmentation on the results page (Audiences can only be used for segmentation in Optimizely Classic). Set to False if you intend to use this Audience only in Optimizely X. Note that a maximum of 10 Audiences can have segmentation set to True in any given Optimizely Classic project.
    boolean segmentation?;
};

public type VariantResults record {
    # The unique identifier for the Experiment this entity contains results for (if applicable)
    int experiment_id?;
    # Indicates that this variant is the baseline that all other entities will be compared against. Also referred to as the 'Control' or 'Control Group'
    boolean is_baseline?;
    # The level of entity that this variant represents
    string level?;
    # A value with statistical context
    Datapoint lift?;
    # The name of the variant
    string name?;
    # The value of the metric after dividing the numerator value over the denominator value
    float rate?;
    # The value of the denominator
    decimal samples?;
    # A value with statistical context
    Datapoint total_increase?;
    # The value of the numerator
    decimal value?;
    # The variance of the metric value
    float variance?;
    # The unique identifier for the variation this entity contains results for (if applicable)
    string variation_id?;
};

public type CustomEventUpdate record {
    # Whether or not to archive this Event
    boolean archived?;
    # Event categories
    EventCategories category?;
    # A description of this Event
    string description?;
    # Unique string identifier for this Event within the Project
    string 'key?;
    # A human readable name for this Event
    string name?;
};

# Event categories
public type EventCategories record {
    # Event name
    string name?;
};

public type CampaignUpdate record {
    # A list of changes to apply to the Campaign
    SharedCodeChange[] changes?;
    # The description or goal for a Campaign
    string description?;
    # A list of lists of Experiment IDs that indicate the relative priority of how to show those Experiments in the context of the Campaign. Each list inside of the list represents a group of Experiments of equal priority where groups that appear earlier in the list are of higher priority to be shown.
    int[][] experiment_priorities?;
    # Percentage of visitors to exclude from personalization, measured in basis points. 100 basis points = 1% traffic. For example, a value of 500 would mean that 95% of visitors will see a personalized experience and 5% will see the holdback.
    int holdback?;
    # An ordered list of metrics to track for the Campaign
    Metric[] metrics?;
    # The name of the Campaign
    string name?;
    # A list of Page IDs used in the Campaign.  Only `url_targeting` or `page_ids` can be used when updating a Campaign, but not both.
    int[] page_ids?;
    URLTargeting url_targeting?;
};

public type Project record {
    # The account the Project is associated with
    int account_id?;
    # The significance level at which you would like to declare winning and losing variations. A lower number minimizes the time needed to declare a winning or losing variation, but increases the risk that your results aren't true winners and losers. The precision for this number is up to 4 decimal places
    float confidence_threshold?;
    # The time that the Project was originally created
    string created?;
    # The ID of a Dynamic Customer Profile Service associated with this Project
    int dcp_service_id?;
    # A short description of the Project
    string description?;
    # The unique identifier for the Project
    int id?;
    # If `is_classic` is true it means that the project doesn't have Optimizely X enabled. In other words: this project is Optimizely Classic only. The v2 REST API can only be used for Optimizely X objects (with the exception of Audiences and Projects, which can be shared between Optimizely X and Classic), so when `is_classic` is set to true you will need to use the v1 API
    boolean is_classic?;
    # If is_flags_enabled is true, this project uses the new Flags-First user experience and will use the [Flags API](https://library.optimizely.com/docs/api/flags/v1/index.html) to make changes to entities.
    boolean is_flags_enabled?;
    # The time the Project was last modified
    string last_modified?;
    # The name of the Project
    string name;
    # The platform of the Project
    string platform?;
    # For Full Stack, Mobile, and OTT projects, the language used for the SDK
    string[] sdks?;
    # The token used to identify your mobile app to Optimizely (mobile only)
    string socket_token?;
    # The current status of the Project
    string status?;
    # The third party platform with which the project is intended to be used. When this is set, a project might have special restrictions. This can have a value of "salesforce" but defaults to null. In order to set this field, an account must have the third party platforms feature and be a fullstack project.
    string? third_party_platform?;
    WebSnippet web_snippet?;
};

public type TimeseriesDatapoint record {
    # A value with statistical context
    Datapoint lift?;
    # The value of the metric after dividing the numerator value over the denominator value
    float rate?;
    # The value of the denominator
    decimal samples?;
    # Time of this data point formatted in ISO 8601
    string time?;
    # The value of the numerator
    decimal value?;
    # The variance of the metric value
    float variance?;
};

public type WebSnippet record {
    # The current revision number of the Project snippet
    int code_revision?;
    # Enables the option to force yourself into a specific variation on any page
    boolean enable_force_variation?;
    # Set to true to remove paused and draft Experiment from the snippet
    boolean exclude_disabled_experiments?;
    # Set to true to mask descriptive names
    boolean exclude_names?;
    # Set to true to include jQuery in your snippet
    boolean include_jquery?;
    # Set to true to change the last octet of IP addresses to 0 prior to logging
    boolean ip_anonymization?;
    # A regular expression (max 1500 characters) matching ip addresses for filtering out visitors. Matching visitors will still see the Experiment, but they won't be counted in results.
    string ip_filter?;
    # The current size in bytes of the Project snippet
    int js_file_size?;
    # The prefered jQuery library version you would like to use with your snippet. If you do not want to include jQuery, set include_jquery to false
    string library?;
    # The javascript code which runs before Optimizely on all pages, regardless of whether or not there is a running Experiment
    string project_javascript?;
    # (BETA) The name of said identifier that locates the visitor id
    string? visitor_id_locator_name?;
    # (BETA) The type of identifer where the visitor id is located (e.g. cookies, query param)
    string? visitor_id_locator_type?;
};

public type WebSnippetUpdate record {
    # Enables the option to force yourself into a specific variation on any page
    boolean enable_force_variation?;
    # Set to true to remove paused and draft Experiment from the snippet
    boolean exclude_disabled_experiments?;
    # Set to true to mask descriptive names
    boolean exclude_names?;
    # Set to true to include jQuery in your snippet
    boolean include_jquery?;
    # Set to true to change the last octet of IP addresses to 0 prior to logging
    boolean ip_anonymization?;
    # A regular expression (max 1500 characters) matching ip addresses for filtering out visitors. Matching visitors will still see the Experiment, but they won't be counted in results.
    string ip_filter?;
    # The prefered jQuery library version you would like to use with your snippet. If you do not want to include jQuery, set include_jquery to false
    string library?;
    # The javascript code which runs before Optimizely on all pages, regardless of whether or not there is a running Experiment
    string project_javascript?;
    # (BETA) The name of said identifier that locates the visitor id
    string? visitor_id_locator_name?;
    # (BETA) The type of identifer where the visitor id is located (e.g. cookies, query param)
    string? visitor_id_locator_type?;
};

public type VariationReach record {
    # Total number of visitors exposed to this particular variation
    int count?;
    # The name of the variation
    string name?;
    # The unique identifier for the variation
    string variation_id?;
    float variation_reach?;
};

public type AttributeUpdate record {
    # Whether or not the Attribute has been archived
    boolean archived?;
    # A short description of the Attribute
    string description?;
    # Unique string identifier for this Attribute within the project
    string 'key?;
    # The name of the Attribute
    string name?;
};

public type CollaboratorEntry record {
    # The unique identifier of the user
    string id?;
    UserProfile profile?;
    ProjectRole[] project_roles?;
};

public type Group record {
    # Whether the group is archived
    boolean archived?;
    # The time when the Exclusion Group was initially created
    string created?;
    # The description for an Exclusion Group
    string description?;
    # Array of Group Entities in the Exclusion Group
    GroupEntity[] entities?;
    # The unique identifier for the Exclusion Group
    int id?;
    # The last time the Exclusion Group was modified
    string last_modified?;
    # Name of the Exclusion Group
    string name;
    # The Project the Exclusion Group is in
    int project_id;
};

public type SubjectAccessRequestInternal record {
    # Admin account id
    int account_id?;
    # Time when the request was completed
    string? completed_at_time?;
    # Subject Access Request Data Source
    string data_source;
    # Subject Access Request Data Type
    string data_type;
    # Time when the url expires (7 days from the completed_at_time)
    string expired_at_time?;
    # The location to which the data will be exported.
    string export_location?;
    # Subject Access Request ID
    int id?;
    # Subject Access Request Identifier
    string identifier;
    # Subject Access Request Identifier Type
    string identifier_type;
    # Parent Subject Access Request id
    int parent_request_id?;
    # Time when the processing of the request started
    string? processing_started_time?;
    # Subject Access Request Request Type
    string request_type;
    # Time when the request was submitted
    string requested_at_time?;
    # Time by which the request must be deleted
    string sla_deadline_time?;
    # Status of the Subject Access Request
    string status?;
};

public type Attribute record {
    # Whether or not the Attribute has been archived
    boolean archived?;
    # Whether this Attribute is a custom dimension or custom attribute. If this is a custom dimension, it belongs to an Optimizely Classic experiment and is read-only.
    string condition_type?;
    # A short description of the Attribute
    string description?;
    # The unique identifier for the Attribute
    int id?;
    # Unique string identifier for this Attribute within the project
    string 'key;
    # The last time the Attribute was modified
    string last_modified?;
    # The name of the Attribute. For Full Stack projects, the name will be set to the value of the key.
    string name?;
    # The ID of the project the Attribute belongs to
    int project_id?;
};

public type ScheduleUpdate record {
    # The start time for the Experiment, in date-time or date format (as defined by ISO 8601), and rounded to the nearest minute. If only date is supplied without time, the start time defaults to 00:00 on the specified start date.
    string start_time?;
    # The stop time for the Experiment, in date-time or full-date format (as defined by ISO 8601), and rounded to the nearest minute. If only date is supplied without time, the stop time defaults to 00:00 on the specified
    #  stop date.
    string stop_time?;
    # The time zone to use for Experiment start and stop times with respect to an IANA time zone (ex. "America/New_York"). The time zones expressed by GMT (e.g. "GMT-08:00") are no longer supported.
    string time_zone?;
};

public type VariantTimeseries record {
    # The unique identifier for the Experiment this entity contains results for (if applicable)
    int experiment_id?;
    # Indicates that this variant is the baseline that all other entities will be compared against. Also referred to as the 'Control' or 'Control Group'
    boolean is_baseline?;
    # The level of entity that this variant represents
    string level?;
    # The name of the variant
    string name?;
    # The results time series data points
    TimeseriesDatapoint[] timeseries?;
    # The unique identifier for the variation this entity contains results for (if applicable)
    string variation_id?;
};

public type SharedCodeChange record {
    # Indicates whether or not to execute the change asyncronously. If true, src will be returned in the response. Otherwise, it will be not included.
    boolean async?;
    # A list of dependent change IDs that must happen before this change
    string[] dependencies?;
    # The ID of the change
    string id?;
    # Name of the change
    string name?;
    # CSS selector to determine where changes are applied. Required for changes of type 'custom_css'.
    string selector?;
    # The path to the change payload on the CDN. Only present if 'async' is True.
    string src?;
    # The type of this change.
    string 'type;
    # The value for the change can be JavaScript or CSS as a string.
    string value;
};

public type Implementation record {
    # The Apply JS code is used to inject the extension onto the page
    string apply_js?;
    # Some extensions may not need any CSS because they inherit styles from the page itself. However, you can add additional styling here. This will be injected on the page through a <style> tag
    string css?;
    # The html implementation of the field
    string html?;
    # Reset JS is used to "clean up" after a extension. It's used in the editor, when changing field values or removing an existing extension. Reset JS should remove the element and any other side-effects
    string reset_js?;
};

public type ProjectUpdate record {
    # The ID of the account the Project is associated with
    int account_id?;
    # The significance level at which you would like to declare winning and losing variations. A lower number minimizes the time needed to declare a winning or losing variation, but increases the risk that your results aren't true winners and losers. The precision for this number is up to 4 decimal places.
    float confidence_threshold?;
    # The ID of a Dynamic Customer Profile Service associated with this Project
    int dcp_service_id?;
    # A short description of the Project
    string description?;
    # The name of the Project
    string name?;
    # The current status of the Project
    string status?;
    WebSnippetUpdate web_snippet?;
};

public type FeatureVariable record {
    # Whether or not this Feature Variable is archived
    boolean archived?;
    # The stringified default value for this Feature Variable. The default value is the value Optimizely SDKs will return when this Feature Variable is accessed by getFeatureVariableValue unless the Feature Variable's value is a part of a feature test variation.
    string default_value;
    # The ID of this Feature Variable
    int id?;
    # Unique string identifier for this Feature Variable within the Feature
    string 'key;
    # The datatype for this Feature Variable
    string 'type;
};

public type ExperimentResults record {
    # The significance level at which you would like to declare winning and losing variations. A lower number minimizes the time needed to declare a winning or losing variation, but increases the risk that your results aren't true winners and losers.
    float confidence_threshold?;
    # End of the time interval (exclusive) used to calculated the results. The time is formatted in ISO 8601.
    string end_time?;
    # The unique identifier for the Experiment
    int experiment_id?;
    # The breakdown of Experiment results by metric. ExperimentMetricResults object ordering in the array is consistent with the order that metrics are attached to the Experiment in the Optimizely UI and REST API (i.e. index 0 is the primary metric, indices 1-4 are secondary metrics, indices 5+ are monitoring metrics). See here for an explantion of the impact of metric ordering on results calculations.
    ExperimentMetricResults[] metrics?;
    ExperimentVariationReach reach?;
    # Start of the time interval (inclusive) used to calculate the results. The time is formatted in ISO 8601.
    string start_time?;
    # Stats Engine configuration settings
    StatsConfig stats_config?;
};

public type CSSAttribute record {
    string 'background\-color?;
    string 'background\-image?;
    string 'border\-color?;
    string 'border\-style?;
    string 'border\-width?;
    string color?;
    string 'font\-size?;
    string 'font\-weight?;
    string height?;
    string position?;
    string width?;
};

public type GroupEntity record {
    # The unique identifier for the Group Entity
    int id;
    # The kind of the Group Entity
    string kind;
    # The weight of the Group Entity. The weight is a value between 0 and 10000. An entity with weight 5000 will receive 50% of this group's traffic
    int weight;
};

# Credentials item containing information on access key and secrets
public type CredentialsItem record {
    # AWS access key
    string accessKeyId?;
    # expiration time of the token in epoch time
    int expiration?;
    # AWS secret access key
    string secretAccessKey?;
    # AWS session token
    string sessionToken?;
};

public type SearchResult record {
    # Whether or not the entity is archived.
    boolean archived?;
    # The time that the entity was created.
    string created?;
    # Description for the entity if it has one.
    string description?;
    # The type of experiment
    string experiment_type?;
    # The feature flag key
    string feature_key?;
    # The feature flag name to display in the Optimizely app. Whitespaces and other non-alphanumeric characters allowed. Defaults to feature key if left empty.
    string feature_name?;
    # ID of the entity
    int id?;
    # Key of the entity.
    string 'key?;
    # The time that the entity was last modified.
    string last_modified?;
    # Name of the entity. This value will be the 'key' of the entity if there is no name.
    string name?;
    # ID of the project that contains the entity (if applicable)
    int project_id?;
    # Name of the project that contains the entity (if applicable)
    string project_name?;
    # The current status for the entity if it has one.
    string status?;
    # Type of the entity.
    string 'type?;
};

public type Plan record {
    # The account ID of the account that this Plan & Usage information is associated with
    int account_id?;
    # The name of the plan for the current account
    string plan_name?;
    # Array of products under this account
    ProductUsage[] product_usages?;
    # The status of the plan for the current account
    string status?;
    # The unit by which we measure the `usage` of this account
    string unit_of_measurement?;
};

public type ProjectRole record {
    string invitation_status?;
    # The unique identifier of the Project
    int project_id?;
    string role?;
};

public type Section record {
    # Whether or not the Section has been archived
    boolean archived?;
    # A short description of this Section
    string description?;
    # The ID of the Multivariate Test this Section belongs to
    int experiment_id?;
    # The ID of this Section
    int id?;
    # The name of this Section
    string name?;
    # The ID of the project that this Section belongs to
    int project_id?;
    Variation[] variations;
};

public type EnvironmentUpdate record {
    # Boolean representing whether the Environment is archived.
    boolean archived?;
    # Text description of the Environment.
    string description?;
    # Boolean representing whether starting experiments should be restricted to publishers and above in this Environment.
    boolean has_restricted_permissions?;
    # Unique string identifier for this Environment within the Project.
    string 'key?;
    # Name of the Environment.
    string name?;
    # Integer representing the priority of the Environment. This is used for ordering in the UI.
    int priority?;
};

public type VariationUpdate record {
    # A collection of changes to run for each page in an experiment. Only applicable to Optimizely X Web.
    Action[] actions?;
    # Whether the variation is archived
    boolean archived?;
    # A description for the variation.
    string description?;
    # For Feature Tests, indicates if the feature should be enabled for the variation
    boolean feature_enabled?;
    # Unique string identifier for this variation within the Experiment. Only applicable for Full Stack and Mobile projects.
    string 'key?;
    # The name of the variation. Required for Web Experiments and Personalization experiences. Not required for Full Stack Experiments.
    string name?;
    # Current status of the variation
    string status?;
    # For Feature Tests, the variable values for the variation represented as a map of Variable keys to their values.
    record {} variable_values?;
    # An immutable unique identifier for the variation. Required to update an existing variation.
    int variation_id?;
    # The percentage of your visitors that should see this variation, measured in basis points. 100 basis points = 1% traffic. Variation weights must add up to 10000.
    int weight;
};

public type Event record {
    # Whether or not this Event is archived
    boolean archived?;
    # Event categories
    EventCategories category?;
    # Inpage event config
    InPageEventConfig config?;
    # Creation date for this Event
    string created?;
    # A description for this Event
    string description?;
    # The type of this Event
    string event_type?;
    # The unique identifier of the Event
    int id?;
    # Whether or not this Event is a classic Event. If true, this Event is read-only
    boolean is_classic?;
    # Whether this Event may be edited
    boolean is_editable?;
    # Unique string identifier for this Event within the Project
    string 'key?;
    # The last time the Event was modified
    string last_modified?;
    # A human readable name for this Event
    string name?;
    # The Page ID associated with this Event
    int page_id?;
    # The ID of this Event's parent Project
    int project_id?;
};

public type Variation record {
    # A collection of changes to run for each page in an experiment. Only applicable to Optimizely X Web.
    Action[] actions?;
    # Whether the variation is archived
    boolean archived?;
    # A description of the variation.
    string description?;
    # For Feature Tests, indicates if the feature should be enabled for the variation
    boolean feature_enabled?;
    # Unique string identifier for this variation within the Experiment. Only applicable for Full Stack and Mobile projects.
    string 'key?;
    # The name of the variation. Required for Web Experiments and Personalization experiences. Not required for Full Stack Experiments.
    string name?;
    # Current status of the variation
    string status?;
    # For Feature Tests, the variable values for the variation represented as a map of Variable keys to their values.
    record {} variable_values?;
    # The unique identifier for the variation
    int variation_id?;
    # The percentage of your visitors that should see this variation, measured in basis points. 100 basis points = 1% traffic. Variation weights must add up to 10000.
    int weight;
};

public type ChangeRevision record {
    Revision current?;
    Revision previous?;
};

public type ListAttribute record {
    # The unique identifier for the Optimizely account
    int account_id?;
    # Whether or not the List Attribute has been archived
    boolean archived?;
    # AWS access key to upload List Attribute source file to S3
    string aws_access_key?;
    # AWS secret key to upload List Attribute source file to S3
    string aws_secret_key?;
    # Time when the List Attribute was created
    string created?;
    # A short description of the List Attribute
    string description?;
    # The unique identifier for the List Attribute
    int id?;
    # The name of the object which holds targeting ids on your website
    string key_field;
    # The last time the List Attribute was modified
    string last_modified?;
    # A comma separated string of IDs or ZIP Codes. Items will be matched against the key_field to determine if an active visitor should be targeted by the list.  Note that if the list currently contains data, providing this value will overwrite the previous data.
    string list_content?;
    # The type of data object which holds targeting ids on your website (cookies, query parameters, zip codes, Global JS variables)
    string list_type?;
    # A unique, human-readable name for the List Attribute
    string name;
    # The ID of the project the List Attribute belongs to
    int project_id;
    # S3 path containing files used to populate the List Attribute with data. Can be used with an S3 client or CLI to upload data.
    string s3_path?;
};

public type CustomEvent record {
    # Whether or not to archive this Event
    boolean archived?;
    # Event categories
    EventCategories category?;
    # Creation date for this Event
    string created?;
    # A description of this Event
    string description?;
    # The type of this Event
    string event_type?;
    # The unique identifier of the Event
    int id?;
    # Whether or not this Event is a classic Event. If true, this Event is read-only
    boolean is_classic?;
    # Whether or not this Event may be edited
    boolean is_editable?;
    # Unique string identifier for this Event within the Project
    string 'key;
    # A human readable name for this Event. If unspecified, defaults to the key
    string name?;
    # The ID of this Event's parent Project
    int project_id?;
};

public type ExperimentWhitelist record {
    # The ID of the user being whitelisted
    string user_id;
    # The unique identifier for the variation
    int variation_id;
};

public type Page record {
    # Stringified Javascript function that determines when the Page is activated. Only required when activation_type is 'polling' or 'callback'.
    string activation_code?;
    # Page activation type is a trigger that determines when the page is activated. Triggers tell Optimizely when to start checking whether certain conditions are true
    # 'Immediate' activation mode activates the page as soon as the snippet loads.
    # 'Polling' activation mode polls every 50ms until 'activation_code' evaluates to True, then activates the page.
    # 'Callback' activation mode activates the page when the event defined by 'activation_code' is triggered.
    # 'Manual' activation mode requires code within the subject app to explicitly trigger page activation.
    # 'DOM Changed' sets the page to trigger when the DOM changes [Learn more](https://help.optimizely.com/Build_Campaigns_and_Experiments/Support_for_dynamic_websites%3A_Use_Optimizely_on_single_page_applications#Triggers).
    # 'URL Changed' sets the page to trigger when the URL changes [Learn more](https://help.optimizely.com/Build_Campaigns_and_Experiments/Support_for_dynamic_websites%3A_Use_Optimizely_on_single_page_applications#Triggers).
    string activation_type?;
    # Whether the Page has been archived
    boolean archived?;
    # The category this Page is grouped under
    string category?;
    # Stringified array of the conditions that activate the Page. The array contains Page Condition JSON dicts joined by "and" and "or".
    # Each individual Page Condition dict has format {"type": "url", "match_type": <match_type>, "value": <value>} where match_types are:
    # "simple" match type will match if "value" matches the hostname and path of the Page URL.
    # "exact" match type will match only an exact string match between "value" and the Page URL.
    # "substring" match type will match if "value" is a substring of the Page URL.
    # "regex" match type will match if "value" is a regular expression match for the Page URL.
    string conditions?;
    # Date created
    string created?;
    # URL of the Page
    string edit_url;
    # The unique identifier of the Page
    int id?;
    # Unique string identifier for this Page within the Project
    string 'key?;
    # Date last modified
    string last_modified?;
    # Name of the Page
    string name;
    # Type of Page
    string page_type?;
    # ID of the Page's Project
    int project_id;
};

public type InPageEventUpdate record {
    # Whether or not to archive this Event
    boolean archived?;
    # Event categories
    EventCategories category?;
    # Inpage event config
    InPageEventConfig config?;
    # A description of this Event
    string description?;
    # Unique string identifier for this Event within the Project
    string 'key?;
    # A human readable name for this Event
    string name?;
    # The Page ID associated with this Event
    int page_id?;
};

# Results time series specific to an Event
public type ExperimentMetricTimeseries record {
    # The aggregation function for the numerator of the metric. 'unique' measures the number of unique visitors/sessions that include the specified Event. 'count' measures the total number of occurrences of Event for the scope (visitor/session). 'sum' is the sum of the 'field' value
    string aggregator?;
    # The ID for the Event to select data from. Omitted for global metrics that are not relative to a specific Event, i.e. "overall revenue"
    int event_id?;
    # The field to aggregate for the numerator of the metric. Required when 'aggregator' = 'sum', otherwise omitted
    string 'field?;
    # The name of the Metric
    string name?;
    # A map of results for each variation in the Experiment keyed by variation ID. For Personalization Campaigns, the special variant 'baseline' represents visitors that have been held back from any change in experience for the Experiment
    record {} results?;
    # Specifies how Events should be grouped together. Can also be thought of as the denonimator of the metric. 'session' divides by the number of sessions. "Influenced sessions", or sessions that do not contain a decision Event but carry a decision from a previous session are not included in counts for numerator or denominator. 'visitor' divides by the number of visitors. 'event' divides by the total occurrences (impressions) of the specified Event
    string scope?;
    # The winning direction of this metric
    string winning_direction?;
};

public type UserProxy record {
    # Email of the user proxy.
    string email?;
    # ID of the user proxy.
    string id;
    # Type of user proxy.
    string proxy_type;
};

public type AccountFeature record {
    string feature_id?;
    AccountFeatureSource[] sources?;
};

public type ChangeDetail record {
    # Value of the property after modification.
    record {} after?;
    # Value of the property before modification.
    record {} before?;
    # Human readable description of the change.
    string description?;
    # The name of the property modified.
    string property?;
};

public type FeatureUpdate record {
    # Whether the Feature has been archived
    boolean archived?;
    # A short description of this Feature
    string description?;
    # The configuration for this Feature's Rollout within each Environment, keyed by Environment key.
    record {} environments?;
    # Unique string identifier for this Feature within the Project
    string 'key?;
    # Name of the Feature
    string name?;
    # Variables define the dynamic configuration of a feature, and each variable can take on a different value on a per-variation basis within a feature test.
    FeatureVariableUpdate[] variables?;
};

public type ProductUsage record {
    # The current allocation term length in months. The allocation term is the time between the `start_time` and the `end_time`. For example the `usage` for an account with an `allocation_term_in_months` of 6 has started accumulating on the `start_time` and will reset to 0 at `end_time` (6 months later)
    int allocation_term_in_months?;
    # The end date of the current allocation term period. For monthly paying accounts, the current allocation term period means the current billing month
    string end_time?;
    # The last time that the `unit_of_measurement` count was updated
    string last_update_time?;
    # (optional) The cost in cents for every visitor when the number of `unit_of_measurement` has exceeded the `usage_allowance`. This value is only set for accounts with a limited `usage_allowance`
    float overage_cents_per_visitor?;
    # The product name
    string product_name?;
    # Key-value map of `usage` per project under this account and this product. Keys are project IDs, values are `usage` numbers. Only available for the Impressions metrics, otherwise omitted.
    record {} projects?;
    # The start date of the current allocation term period. For monthly paying accounts, the current allocation term period means the current billing month
    string start_time?;
    # The total `usage` in the `unit_of_measurement` within the current allocation term
    int usage?;
    # (optional) The total `usage` allowed in the `unit_of_measurement` for the current allocation term. This value is only set for accounts with a limited `usage_allowance`
    int usage_allowance?;
};

public type Experiment record {
    # Traffic allocation policy across variations in this experiment
    string allocation_policy?;
    # The audiences that should see this experiment. To target everyone, use the string "everyone" or omit this field. Multiple audiences can be combined with "and" or "or" using the same structure as audience conditions
    string audience_conditions?;
    # For Personalization experiences, this ID corresponds to the parent Campaign. For standalone experiments this campaign_id does not correspond to a campaign object.
    int campaign_id?;
    # Custom CSS or JavaScript that will run before all variations in the Experiment (for Experiments in Web Projects only)
    SharedCodeChange[] changes?;
    # The time when the Experiment was initially created
    string created?;
    # The description or hypothesis for an Experiment
    string description?;
    # The first time the Experiment was activated
    string earliest?;
    # String identifier for the Experiment's status in each Environment based on the environment key.
    record {} environments?;
    # The ID of a Feature to attach to the Experiment. This turns an Experiment into a Feature Test.
    int feature_id?;
    # The key for the Feature attached to the Experiment. Applies to Feature Tests only. Valid keys contain alphanumeric characters, hyphens, and underscores, and are limited to 64 characters.
    string feature_key?;
    # The feature flag name to display in the Optimizely app. Whitespaces and other non-alphanumeric characters allowed. Defaults to feature key if left empty.
    string feature_name?;
    # Percent of traffic to exclude from the experiment, measured in basis points. 100 basis points = 1% traffic. For example, a value of 9900 would mean that 1% of visitors will be eligible for the experiment. This is only applicable for Web.
    int holdback?;
    # The unique identifier for the Experiment
    int id?;
    # Whether or not the Experiment is a classic Experiment. If true, the Experiment is read-only
    boolean is_classic?;
    # Unique string identifier for this Experiment within the Project. Only applicable for Full Stack and Mobile projects.
    string 'key?;
    # The last time the Experiment was modified
    string last_modified?;
    # The last time the Experiment was paused (not present if the Experiment is still running). For campaign experiences, this field represents the last time the Campaign was paused.
    string latest?;
    # An ordered list of metrics to track for the Experiment. Required for Web, Full Stack, and Mobile Experimentation. Not applicable for Web Personalization Experiences.
    Metric[] metrics?;
    # For Experiments of  `multivariate` type, this specifies how the weights and statuses of combinations will be decided. In `full_factorial` mode, | combination weights are read-only, and are generated by multiplying together weights of section variations.
    string multivariate_traffic_policy?;
    # Name of the Experiment. Required for Web Experimentation. Optional for Web Personalization experiences and Full Stack experiments. Not applicable for Mobile Experiments.
    string name?;
    # A list of Page IDs used in the Experiment.  `url_targeting` or `page_ids`, but not both.
    int[] page_ids?;
    # The Project the Experiment is in
    int project_id;
    # temporary token based on experiment id, used to access data platform services from other parts of the product
    string results_token?;
    Schedule schedule?;
    # Current state of the Experiment.<br> In Full Stack, this is the Experiment's state in the primary (production) environment.
    string status?;
    # Percent of traffic allocated for the experiment, measured in basis points. 100 basis points = 1% traffic. For example, a value of 5500 would mean that 55% of visitors will be eligible for the experiment. This is only applicable for Full Stack.
    int traffic_allocation?;
    # Indicates whether this is an `a/b`, `multivariate`, `feature`, or `multiarmed_bandit` test or an experience within a `personalization` campaign. Note that the default for this field is `a/b`. If another test type is desired, populate this field with the appropriate string (from one of the possible values).
    string 'type?;
    URLTargeting url_targeting?;
    # A list of variations that each define an experience to show in the context of the Experiment for the purpose of comparison against each other
    Variation[] variations?;
    # A list containing the user IDs and variations of users who have been whitelisted
    ExperimentWhitelist[] whitelist?;
};

public type ExperimentVariationReach record {
    # Baseline count
    int baseline_count?;
    # Baseline reach
    float baseline_reach?;
    # Total number of visitors exposed to the Experiment
    int total_count?;
    # Treatment count
    int treatment_count?;
    # Treatment reach
    float treatment_reach?;
    # A map of reach for each variation keyed by variation ID
    record {} variations?;
};

public type ImpressionsUsage record {
    # The ID for the experiment.
    int experiment_id;
    # The Experiment name to display in the Optimizely app. Whitespaces and other non-alphanumeric characters allowed. Defaults to experiment key if left empty.
    string experiment_name;
    # The status of the Experiment.
    string experiment_status;
    # The Impressions count at experiment level.
    int impression_count;
    # The platform of the Project
    string platform;
    # The ID for the project.
    int project_id;
    # The name of the Project.
    string project_name;
};

# A value with statistical context
public type Datapoint record {
    # The confidence interval measures the uncertainty around improvement. It starts out wide and shrinks as more data comes in. Significance means that the confidence interval is completely above or completely below 0. If the result is significant and positive, the confidence interval will be above 0. If the result is significant and negative, confidence interval will be below 0. If the result is inconclusive, confidence interval includes 0
    float[2] confidence_interval?;
    # The confidence interval with bounds that are scaled by the baseline conversion rate.
    float[2] confidence_interval_scaled?;
    # End of epoch
    boolean end_of_epoch?;
    # Indicates that this is the best performing variant for this metric. Also referred to as the 'Winner'
    boolean is_most_conclusive?;
    # Indicates if significance is above your confidence threshold
    boolean is_significant?;
    # Indicates whether a variation is doing better/worse than the baseline after taking the metric's winning direction into account.
    string lift_status?;
    # The likelihood that the observed difference in conversion rate is not due to chance
    float significance?;
    # The estimated improvement for this variant compared to the baseline
    float value?;
    # The estimated improvement scaled by the baseline conversion rate.
    float value_scaled?;
    # The number of estimated visitors remaining before result becomes statistically significant. A value of 9223372036854775807 means the value is not available.
    int visitors_remaining?;
};

public type Campaign record {
    # A list of changes to apply to the Campaign.  This corresponds to the Campaign's Shared Code in the application.  Only supports 'custom_css' or 'custom_code' type changes.
    SharedCodeChange[] changes?;
    # The time the Campaign was initially created
    string created?;
    # The description or goal for a Campaign
    string description?;
    # The first time the Campaign was activated
    string earliest?;
    # A list of lists of Experiment IDs that indicate the relative priority of how to show those Experiments in the context of the Campaign. Each list inside of the list represents a group of Experiments of equal priority where groups that appear earlier in the list are of higher priority to be shown.
    int[][] experiment_priorities?;
    # Percentage of visitors to exclude from personalization, measured in basis points. 100 basis points = 1% traffic. For example, a value of 500 would mean that 95% of visitors will see a personalized experience and 5% will see the holdback.
    int holdback?;
    # The unique identifier for the Campaign
    int id?;
    # The last time the Campaign was modified
    string last_modified?;
    # The last time the Campaign was paused (not present if the Campaign still running)
    string latest?;
    # An ordered list of metrics to track for the Campaign
    Metric[] metrics?;
    # The name of the Campaign
    string name?;
    # A list of Page IDs used in the Campaign
    int[] page_ids?;
    # The Project ID the Campaign is in
    int project_id;
    # Current state of the Campaign. not_started means the Campaign has never been published to the world. running means the Campaign is currently live to the world. paused means the Campaign has been published, but is currently not running. archived means the Campaign is paused and not visible in the web UI.
    string status?;
    # Indicates the type of this campaign. Campaigns created or fetched via the API should currently all have a type of `personalization`, but if you get a campaign_id for an experiment and look it up, you may get an `other` value.
    string 'type?;
    URLTargeting url_targeting?;
};

public type Revision record {
    # Reference to a revision of the entity.
    int? id?;
};

public type Me record {
    # List of Accounts this user can access
    Account[] accounts?;
    CurrentAccount current_account?;
    # The unique identifier of the current User
    string id?;
    UserProfile profile?;
    # List of Project IDs in the current Account with the current User's role information
    ProjectRole[] project_roles?;
};

public type Environment record {
    # Boolean representing whether the Environment is archived.
    boolean archived?;
    # Created time.
    string created?;
    Datafile datafile?;
    # A short description of the Environment.
    string description?;
    # Boolean representing whether starting experiments should be restricted to publishers and above in this Environment.
    boolean has_restricted_permissions?;
    # ID of this Environment.
    int id?;
    # Boolean representing if this is the primary (default) Environment.
    boolean is_primary?;
    # Unique string identifier for this Environment within the Project.
    string 'key;
    # Last modification time.
    string last_modified?;
    # Name of the Environment.
    string name;
    # Integer representing the priority of the Environment. This is used for ordering in the UI.
    int priority?;
    # ID of the project of the Environment.
    int project_id;
};

public type ExperimentEnvironmentUpdate record {
    # Update the Experiment's status in different Environments based on the environment key.
    string status;
};

public type SectionUpdate record {
    # Whether or not the Section has been archived
    boolean archived?;
    # A short description of this Section
    string description?;
    # The name of this Section
    string name?;
    Variation[] variations?;
};

public type ExperimentTimeseries record {
    # The significance level at which you would like to declare winning and losing variations. A lower number minimizes the time needed to declare a winning or losing variation, but increases the risk that your results aren't true winners and losers.
    float confidence_threshold?;
    # End of the time interval (exclusive) used to calculated the results. The time is formatted in ISO 8601.
    string end_time?;
    # The unique identifier for the Experiment
    int experiment_id?;
    # The breakdown of Experiment results time series by metric
    ExperimentMetricTimeseries[] metrics?;
    # Start of the time interval (inclusive) used to calculate the results. The time is formatted in ISO 8601.
    string start_time?;
    # Stats Engine configuration settings
    StatsConfig stats_config?;
};

public type Options record {
    # The choices for a field
    Choices[] choices?;
};

public type Action record {
    # The list of changes to apply to the Page. If 'dependencies' is supplied in a Change within 'changes', each ID in 'dependencies' must also be in 'changes'.
    Change[] changes?;
    # The ID of the Page to apply changes to
    int page_id;
    # The share link for the provided Variation and Page combination
    string share_link?;
};

public type CurrentAccount record {
    # The available features for the Account
    record {} features?;
    # The unique identifier of the Account
    int id?;
};

public type URLTargeting record {
    # Stringified Javascript function that determines when the Page is activated. Only required when activation_type is 'polling' or 'callback'.
    string activation_code?;
    # How this page is activated.  See the full documentation on the Page object.
    string activation_type?;
    # Conditions to activate the experiment; our knowledge base article on Activation Types is the best guide for how to set up this data.
    string conditions?;
    # URL to load in the editor for this page
    string edit_url;
    # Unique string identifier for this Page within the Project
    string 'key?;
    # The unique identifier of the Page that represents the experiment or campaign's URL Targeting.
    int page_id?;
};

public type Datafile record {
    # ID of Datafile.
    int id?;
    # The current size in bytes of the Datafile.
    int latest_file_size?;
    # List of other URLs where this Datafile is also available.
    string[] other_urls?;
    # Current revision number.
    int revision?;
    # Unique key to identify this specific Environment and Datafile programmatically in our SDKs.
    string sdk_key?;
    # URL where this Datafile is available.
    string url?;
};

public type ResultsShareLink record {
    # The share link for the results of this Campaign
    string url?;
};

public type User record {
    # Display name of the user, most commonly the Optimizely user's email.
    string? display_name?;
    # Email of the user.
    string email;
    # First name of the user.
    string? first_name?;
    # ID of the user.
    string id;
    # Last name of the user.
    string? last_name?;
    # URL to the user profile image.
    string? profile_image_url?;
};

# Results specific to an Event
public type ExperimentMetricResults record {
    # The aggregation function for the numerator of the metric. 'unique' measures the number of unique visitors/sessions that include the specified Event. 'count' measures the total number of occurrences of Event for the scope (visitor/session). 'sum' is the sum of the 'field' value. 'exit' measures the ratio of sessions with last activation occurring on the target page to the sessions that activated the target page at least once during the session. 'bounce' measures the ratio of sessions that with first and last activation occurring on the target page to the sessions with first activation on the target page. For both 'exit' and 'bounce', the eventId must be the ID of a Page.
    string aggregator?;
    # Experiment metric conclusion.
    ExperimentMetricConclusion conclusion?;
    # The ID for the Event to select data from. Omitted for global metrics that are not relative to a specific Event, i.e. "overall revenue"
    int event_id?;
    # The field to aggregate for the numerator of the metric. Required when 'aggregator' = 'sum', otherwise omitted
    string 'field?;
    # The name of the Metric
    string name?;
    # A map of results for each variation in the Experiment keyed by variation ID. For Personalization Campaigns, the special variant 'baseline' represents visitors that have been held back from any change in experience for the Experiment
    record {} results?;
    # Specifies how Events should be grouped together. Can also be thought of as the denonimator of the metric. 'session' divides by the number of sessions. "Influenced sessions", or sessions that do not contain a decision Event but carry a decision from a previous session are not included in counts for numerator or denominator. 'visitor' divides by the number of visitors. 'event' divides by the total occurrences (impressions) of the specified Event
    string scope?;
    # The winning direction of this metric
    string winning_direction?;
};

public type UserProfile record {
    # User's email
    string email?;
    # User's first name
    string first_name?;
    # User's last name
    string last_name?;
    # User's profile image URL
    string profile_image?;
};

# Results specific to an Event
public type CampaignMetricResults record {
    # The aggregation function for the numerator of the metric. 'unique' measures the number of unique visitors/sessions that include the specified Event. 'count' measures the total number of occurrences of Event for the scope (visitor/session). 'sum' is the sum of the 'field' value
    string aggregator?;
    # The ID for the Event to select data from. Omitted for global metrics that are not relative to a specific Event, i.e. "overall revenue"
    int event_id?;
    # The field to aggregate for the numerator of the metric. Required when 'aggregator' = 'sum', otherwise omitted
    string 'field?;
    # The name of the Metric
    string name?;
    # A map of results for the variants affected by the Campaign. Variants may represent aggregated results scoped to the Campaign and/or individual Experiment results scoped to just that Experiment. The special variant 'baseline' represents visitors that have been held back from any change in experience across all Experiments in the Campaign. The special variant 'campaign' represents the aggregated effect of all Experiments included in the Campaign.
    record {} results?;
    # Specifies how Events should be grouped together. Can also be thought of as the denonimator of the metric. 'session' divides by the number of sessions. "Influenced sessions", or sessions that do not contain a decision Event but carry a decision from a previous session are not included in counts for numerator or denominator. 'visitor' divides by the number of visitors. 'event' divides by the total occurrences (impressions) of the specified Event
    string scope?;
    # The winning direction of this metric
    string winning_direction?;
};

public type ExperimentUpdate record {
    # The audiences that should see this experiment. To target everyone, use the string "everyone". Multiple audiences can be combined with "and" or "or" using the same structure as audience conditions
    string audience_conditions?;
    # Custom CSS or JavaScript that will run before all variations in the Experiment (for Experiments in Web Projects only)
    SharedCodeChange[] changes?;
    # The description or hypothesis for an Experiment
    string description?;
    # String identifier for the Experiment's status in each Environment based on the environment key.
    record {} environments?;
    # The ID of a Feature to attach to the Experiment. This turns an Experiment into a Feature Test.
    int feature_id?;
    # Percent of traffic to exclude from the experiment, measured in basis points. 100 basis points = 1% traffic. For example, a value of 9900 would mean that 1% of visitors will be eligible for the experiment. This is only applicable for Web.
    int holdback?;
    # Unique string identifier for this Experiment within the Project. Only applicable for Full Stack and Mobile projects.
    string 'key?;
    # An ordered list of metrics to track for the Experiment
    Metric[] metrics?;
    # Name of the Experiment
    string name?;
    # A list of Page IDs used in the Experiment.  Only `url_targeting` or `page_ids` can be used when updating an experiment, but not both.
    int[] page_ids?;
    ScheduleUpdate schedule?;
    # Percent of traffic allocated for the experiment, measured in basis points. 100 basis points = 1% traffic. For example, a value of 5500 would mean that 55% of visitors will be eligible for the experiment. This is only applicable for Full Stack.
    int traffic_allocation?;
    URLTargeting url_targeting?;
    # List of IDs of all variations in the Experiment
    VariationUpdate[] variations?;
    # A list containing the user IDs and variations of users who have been whitelisted
    ExperimentWhitelist[] whitelist?;
};

public type Field record {
    # The API name of the field
    string api_name;
    # A string in JSON format that corresponds to the default_value of the field
    string default_value;
    # The type of the field
    string field_type;
    # The label of the field
    string label;
    Options options?;
};

public type Choices record {
    # label of the choice
    string label?;
    # value of the choice
    string value?;
};

# Inpage event config
public type InPageEventConfig record {
    # CSS selector for the page element(s) that trigger an Event
    string selector;
};

# Stats Engine configuration settings
public type StatsConfig record {
    # Confidence level
    decimal confidence_level?;
    # The type of test to compare the variant to baseline
    string difference_type?;
    # Indicates if epoch-based statistics were used
    boolean epoch_enabled?;
};

public type RolloutRule record {
    # The audiences that should see this feature. To target everyone, use the string "everyone". Multiple audiences can be combined with "and" or "or" using the same structure as audience conditions. <code>audience_conditions</code> sent in any environment must always match those of the primary environment.
    string audience_conditions?;
    # Whether or not the Rollout Rule is applied in this Environment. You can toggle this on and off by sending True or False.
    boolean enabled?;
    # The percentage of the designated audiences that should get this Feature, measured in basis points. 100 basis points = 1% traffic.
    int percentage_included?;
};

public type BucketingInformationItem record {
    # The unique identifier of the Campaign
    int campaign_id?;
    # The unique identifier of the Experiment
    int experiment_id?;
    # Is the visitor bucketed into a variation or a holdback
    boolean is_holdback?;
    # The timestamp of the bucketing decision on the client side
    int timestamp?;
    # The unique identifier of the Variation
    int variation_id?;
};

public type E3Credentials record {
    # Credentials item containing information on access key and secrets
    CredentialsItem credentials?;
    # s3 path of the enriched events dataset of the account
    string s3Path?;
};

public type GroupUpdate record {
    # Whether the Exclusion Group has been archived
    boolean archived?;
    # The updated description of the Exclusion Group
    string description?;
    # Array of experiments or campaigns in the Exclusion Group, represented as a GroupEntity object
    GroupEntity[] entities?;
    # The updated name of the Exclusion Group
    string name?;
};

public type ImpressionsUsageSummary record {
    # Total allowance purchased for the account.
    int allowance;
    # Current subscription end date.
    string end_date;
    # Last impressions usage updated date.
    string last_update_date;
    # Current subscription start date.
    string start_date;
    # Usage for the account.
    int usage;
    # Utilised usage percentage.
    decimal usage_percentage;
};

public type SubjectAccessRequest record {
    # The Account ID for the account the Subject Access Request will be executed.
    int account_id?;
    # The time when the request was completed.
    string? completed_at_time?;
    # <p>The type of data to be accessed or deleted. The two options are:</p>
    # 
    # <ul>
    #     <li><code>user</code> - End users (also known as <em>Collaborators</em>) that are added to the accounts of our customers. A user can be a <a href="https://help.optimizely.com/Set_Up_Optimizely/Manage_collaborators_in_Optimizely_X" rel="internal"><u>collaborator</u></a> on multiple accounts.</li>
    #     <li><code>visitor</code> - Visitors who visit or use our customers’ websites, apps and other digital products. Optimizely stores visitor data to calculate experiment results and to tailor content.</li>
    # </ul>
    string data_type;
    # Time when the url expires (7 days from the completed_at_time)
    string expired_at_time?;
    # The location to which the data will be exported. The data will be made accessible in a AWS S3 bucket.
    string export_location?;
    # The Subject Access Request ID.
    int id?;
    # The identifier value that you would like us to use when searching. If <code>user</code> was selected in the previous step, the identifier will be the email address for the User.
    string identifier;
    # <p>User data is identified by the email address used to create the end user account. The endpoint only accepts the <code>email</code> datatype if you selected <code>user</code> for <strong>Datatype</strong>.<br>
    # <br>
    # If you selected <code>visitor</code> for <strong>data_type</strong>, you can select 5 options for personal identifier types:</p>
    # 
    # <ul>
    #     <li>
    #     <p><code>dcp_id</code> - Any ID used to identify targeting records in Optimizely.</p>
    #     </li>
    #     <li>
    #     <p><code>email</code> - The email address of a visitor.</p>
    #     </li>
    #     <li>
    #     <p><code>fullstack_id</code> - The unique identifier used for Full Stack experiments.</p>
    #     </li>
    #     <li>
    #     <p><code>optimizely_end_user_id</code> - An Optimizely generated user cookie.</p>
    #     </li>
    #     <li>
    #     <p><code>other</code> -&nbsp;Any other identifier that was uploaded to Optimizely.</p>
    #     </li>
    # </ul>
    string identifier_type;
    # The time when the processing of the Subject Access Request started.
    string? processing_started_time?;
    # <code>delete</code> - Removes all data within an account that is associated to the identifier defined in the identifier field.
    # <br>
    # <code>access</code> - Finds all data stored in Optimizely systems associated to the identifier defined in the identifier field and exports it to an AWS S3 bucket for you to access.
    string request_type;
    # The time when the Subject Access Request was submitted.
    string requested_at_time?;
    # The time by which the Subject Access Request must be completed.
    string? sla_deadline_time?;
    # The status of the Subject Access Request.
    string status?;
};

public type ScheduledJob record {
    # The account that the job is associated with
    int account_id?;
    # Whether the Scheduled Job is archived
    boolean archived?;
    # A list of campaign_ids that should be considered during the job
    int[] campaign_ids?;
    # A list of experiment_ids that should be considered during the job
    int[] experiment_ids?;
    # How often the job should be performed
    string frequency;
    # The unique identifier of the Scheduled Job
    int id?;
    # The type of job to be performed
    string job_type;
    # An object describing how the output of the job should be communicated
    record {} output_channels?;
    # The project that the job is associated with
    int project_id;
};

public type Error record {
    string code?;
    string message?;
    record {} messages?;
    string uuid?;
};

public type Change record {
    # Whether or not to allow additional redirects after redirecting to destination. Required for changes of type 'redirect'
    boolean allow_additional_redirect?;
    # Indicates whether or not to execute the change asyncronously. If true, src will be returned in the response. Otherwise, it will be not included.
    boolean async?;
    ChangeAttribute attributes?;
    # Configuration properties for the extension
    record {} config?;
    CSSAttribute css?;
    # A list of dependent change IDs that must happen before this change
    string[] dependencies?;
    # URL to redirect to. Required for changes of type 'redirect'. `destination` and `destination_function` cannot be used at the same time
    string destination?;
    # A function string to redirect to. Required for changes of type 'redirect'. `destination` and `destination_function` cannot be used at the same time
    string destination_function?;
    # ID of the extension to insert. Required for changes of type 'extension'
    string extension_id?;
    # The ID of the change
    string id?;
    # Name of the change
    string name?;
    # Where to instert HTML or image for types 'insert_html' and 'insert_image' with respect to the element(s) matched by 'selector'
    string operator?;
    # Whether or not to preserve parameters from original request when redirecting to new destination URL. Required for changes of type 'redirect'. For redirects using `destination_function`, `preserve_parameters` must be false.
    boolean preserve_parameters?;
    # A directive to place the DOM element(s) matched by 'selector' to the position of the element matched by 'insertSelector', with the relation specified by 'operator'. The supplied example moves element matched by 'selector' above the element of class .greyBox
    record {} rearrange?;
    # CSS selector to determine where changes are applied. Required for changes of type 'attribute', 'insert_html', and 'insert_image'
    string selector?;
    # The path to the change payload on the CDN. Only present if 'async' is True.
    string src?;
    # The type of this change.
    # - Changes of type 'attribute' have required fields 'selector' and 'attributes'
    # - Changes of type 'custom_code' have required field 'value'
    # - Changes of type 'custom_css' have required field 'value'
    # - Changes of type 'extension' have required field 'extension_id'
    # - Changes of type 'insert_html' have required field 'selector'
    # - Changes of type 'insert_image' have required field 'selector'
    # - Changes of type 'redirect' have required fields 'destination', 'preserve_parameters', and 'allow_additional_redirect'
    string 'type;
    # The value for the change can be custom Javascript or CSS as a string. Required for changes of type 'custom_css' and 'custom_code'
    string value?;
};

public type PageUpdate record {
    # Stringified Javascript function that determines when the Page is activated. Only required when activation_type is 'polling' or 'callback'.
    string activation_code?;
    # Page activation type is a trigger that determines when the page is activated. Triggers tell Optimizely when to start checking whether certain conditions are true
    # 'Immediate' activation mode activates the page as soon as the snippet loads.
    # 'Polling' activation mode polls every 50ms until 'activation_code' evaluates to True, then activates the page.
    # 'Callback' activation mode activates the page when the event defined by 'activation_code' is triggered.
    # 'Manual' activation mode requires code within the subject app to explicitly trigger page activation.
    # 'DOM Changed' sets the page to trigger when the DOM changes [Learn more](https://help.optimizely.com/Build_Campaigns_and_Experiments/Support_for_dynamic_websites%3A_Use_Optimizely_on_single_page_applications#Triggers).
    # 'URL Changed' sets the page to trigger when the URL changes [Learn more](https://help.optimizely.com/Build_Campaigns_and_Experiments/Support_for_dynamic_websites%3A_Use_Optimizely_on_single_page_applications#Triggers).
    string activation_type?;
    # Whether the Page is archived
    boolean archived?;
    # The category this Page is grouped under
    string category?;
    # Stringified array of the conditions that activate the Page. The array contains Page Condition JSON dicts joined by "and" and "or".
    # Each individual Page Condition dict has format {"type": "url", "match_type": <match_type>, "value": <value>} where match_types are:
    # "simple" match type will match if "value" matches the hostname and path of the Page URL.
    # "exact" match type will match only an exact string match between "value" and the Page URL.
    # "substring" match type will match if "value" is a substring of the Page URL.
    # "regex" match type will match if "value" is a regular expression match for the Page URL.
    string conditions?;
    # URL of the Page
    string edit_url?;
    # Unique string identifier for this Page within the Project
    string 'key?;
    # Page Name
    string name?;
    # Type of Page
    string page_type?;
};

# Experiment metric conclusion.
public type ExperimentMetricConclusion record {
    # ID of the variation that has reached statistical significance and has performed worse than all other variations.
    string loser?;
    # ID of the variation that has reached statistical significance and has performed better than all other variations.
    string winner?;
};

public type FeatureEnvironment record {
    # The ID of the Environment this set of Rollout Rules applies to
    int id?;
    # Whether the Environment this set of Rollout Rules applies to is the primary Environment
    boolean is_primary?;
    # Rollout Rules allow you to define groups of users and a percentage of those users that will see a Feature by default. You are currently limited to a single rollout rule. Audience IDs sent in any environment must always match that of the primary environment.
    RolloutRule[1] rollout_rules;
};

public type ExperimentSummary record {
    # Whether or not the entity is archived.
    boolean archived?;
    # The time that the entity was created.
    string created?;
    # Description for the entity if it has one.
    string description?;
    # The type of experiment
    string experiment_type?;
    # ID of the entity
    int id?;
    # The time that the entity was last modified.
    string last_modified?;
    # Name of the entity. This value will be the 'key' of the entity if there is no name.
    string name?;
    # ID of the project that contains the entity (if applicable)
    int project_id?;
    # Name of the project that contains the entity (if applicable)
    string project_name?;
    # The current status for the entity if it has one.
    string status?;
    # Type of the entity.
    string 'type?;
};

public type Extension record {
    # Whether the extension is archived
    boolean archived?;
    # The time when the extension was initially created
    string created?;
    # The description for the extension
    string description?;
    # The URL to load when editing the extension
    string edit_url;
    # Whether the extension is enabled. A disabled extension won't appear in the editor and won't be built into the snippet
    boolean enabled?;
    # Array of editable fields in the extension
    Field[] fields?;
    # The unique identifier for the extension
    int id?;
    Implementation implementation;
    # The last time when the extension was modified
    string last_modified?;
    # Name of the extension
    string name;
    # The project the extension is in
    int project_id;
};

public type Schedule record {
    # The start time for the Experiment, in date-time or date format (as defined by ISO 8601), and rounded to the nearest minute. If only date is supplied without time, the start time defaults to 00:00 on the specified start date.
    string start_time?;
    # The stop time for the Experiment, in date-time or full-date format (as defined by ISO 8601), and rounded to the nearest minute. If only date is supplied without time, the stop time defaults to 00:00 on the specified
    #  stop date.
    string stop_time?;
    # The time zone to use for Experiment start and stop times with respect to an IANA time zone (ex. "America/New_York"). The time zones expressed by GMT (e.g. "GMT-08:00") are no longer supported.
    string time_zone?;
};

public type Metric record {
    # The aggregation function for the numerator of the metric. 'unique' measures the number of unique visitors/sessions that include the specified Event. 'count' measures the total number of occurrences of Event for the scope (visitor/session). 'sum' is the sum of the 'field' value
    string aggregator?;
    # The ID for the Event to select data from. Omitted for global metrics that are not relative to a specific Event, i.e. "overall revenue"
    int event_id?;
    # The field to aggregate for the numerator of the metric. Required when 'aggregator' = 'sum', otherwise omitted
    string 'field?;
    # Specifies how Events should be grouped together. Can also be thought of as the denonimator of the metric. 'session' divides by the number of sessions. "Influenced sessions", or sessions that do not contain a decision Event but carry a decision from a previous session are not included in counts for numerator or denominator. 'visitor' divides by the number of visitors. 'event' divides by the total occurrences (impressions) of the specified Event
    string scope?;
    # The winning direction of this metric
    string winning_direction?;
};

public type ScheduledJobUpdate record {
    # Whether the Scheduled Job is archived
    boolean archived?;
    # A list of campaign_ids that should be considered during the job
    int[] campaign_ids?;
    # A list of experiment_ids that should be considered during the job
    int[] experiment_ids?;
    string frequency?;
    # The type of job to be performed
    string job_type?;
    # An object describing how the output of the job should be communicated
    record {} output_channels?;
    # The project that the job is associated with
    int project_id?;
};

# An Event that can occur only within the context of a specific Page (allowed in Web Projects only)
public type InPageEvent record {
    # Whether or not this Event is archived
    boolean archived?;
    # Event categories
    EventCategories category?;
    # Inpage event config
    InPageEventConfig config?;
    # Creation date for this Event
    string created?;
    # A description of this Event
    string description?;
    # The type of this Event
    string event_type;
    # The unique identifier of the Event
    int id?;
    # Whether or not this Event is a classic Event. If true, the Event is read-only
    boolean is_classic?;
    # Whether or not this Event may be edited
    boolean is_editable?;
    # Unique string identifier for this Event within the Project
    string 'key?;
    # A human readable name for this Event
    string name;
    # The Page ID associated with this Event
    int page_id?;
    # The ID of this Event's parent Project
    int project_id?;
};

public type SubjectAccessRequestUpdate record {
    # Time when the request was completed
    string? completed_at_time?;
    # s3 path to the Subject Access Request's ZIP file in the optimizely-sar-prod bucket
    string export_location?;
    # Time when the processing of the request started
    string? processing_started_time?;
    # Status of the Subject Access Request
    string status;
};
