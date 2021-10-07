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

# Create a new feature flag approval request
public type PostFeatureFlagApprovalRequestRequest record {
    # comment will be included in audit log item for change.
    string comment?;
    # A name that describes the changes you would like to apply to a feature flag configuration
    string description;
    # A semantic patch instruction
    SemanticPatchInstruction instructions;
    # Id of members to notify.
    string[] notifyMemberIds;
};

# Create a new feature flag approval request
public type DeleteFeatureFlagApprovalRequestRequest record {
    # comment will be included in audit log item for change.
    string comment?;
    # A name that describes the changes you would like to apply to a feature flag configuration
    string description;
    # A semantic patch instruction
    SemanticPatchInstruction instructions;
    # Id of members to notify.
    string[] notifyMemberIds;
};

public type FeatureFlagStatus record {
    Links _links?;
    record {} 'default?;
    string lastRequested?;
    # | Name     | Description |
    # | --------:| ----------- |
    # | new      | the feature flag was created within the last 7 days, and has not been requested yet |
    # | active   | the feature flag was requested by your servers or clients within the last 7 days |
    # | inactive | the feature flag was created more than 7 days ago, and hasn't been requested by your servers or clients within the past 7 days |
    # | launched | one variation of the feature flag has been rolled out to all your users for at least 7 days |
    string name?;
};

public type StreamSDKVersion record {
    StreamBySDKLinks _links?;
    StreamSDKVersionData[] sdkVersions?;
};

public type UserSegmentRule record {
    string bucketBy?;
    Clause[] clauses?;
    int weight?;
};

public type FlagListItem record {
    Links _links?;
    Site _site?;
    string 'key?;
    string name?;
};

public type Token record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    Member _member?;
    # A unix epoch time in milliseconds specifying the creation time of this access token.
    int creationDate?;
    # A list of custom role IDs to use as access limits for the access token
    string[] customRoleIds?;
    # The default API version for this token
    int defaultApiVersion?;
    Statement[] inlineRole?;
    # A unix epoch time in milliseconds specifying the last time this access token was modified.
    int lastModified?;
    # A unix epoch time in milliseconds specifying the last time this access token was used to authorize access to the LaunchDarkly REST API.
    int lastUsed?;
    # The unique resource id.
    Id memberId?;
    # A human-friendly name for the access token
    string name?;
    # The unique resource id.
    Id ownerId?;
    # The name of a built-in role for the token
    string role?;
    # Whether the token will be a service token https://docs.launchdarkly.com/home/account-security/api-access-tokens#service-tokens
    boolean serviceToken?;
    # The last 4 digits of the unique secret key for this access token. If creating or resetting the token, this will be the full token secret.
    string token?;
};

public type Users record {
    Links _links?;
    UserRecord[] items?;
    decimal totalCount?;
};

public type CustomRoles record {
    Links _links?;
    CustomRole[] items?;
};

public type IntegrationLinks record {
    Link self?;
};

public type ClientSideAvailability record {
    # When set to true, this flag will be available to SDKs using the client-side id.
    boolean usingEnvironmentId?;
    # When set to true, this flag will be available to SDKS using a mobile key.
    boolean usingMobileKey?;
};

public type Tokens record {
    Links _links?;
    Token[] items?;
};

public type FeatureFlagConfig record {
    string _environmentName?;
    Site _site?;
    boolean archived?;
    Fallthrough fallthrough?;
    int lastModified?;
    int offVariation?;
    boolean 'on?;
    Prerequisite[] prerequisites?;
    Rule[] rules?;
    string salt?;
    string sel?;
    Target[] targets?;
    # Set to true to send detailed event information for this flag.
    boolean trackEvents?;
    # Set to true to send detailed event information when targeting is enabled but no individual targeting rule is matched.
    boolean trackEventsFallthrough?;
    int 'version?;
};

public type UnboundedSegmentTargetChanges record {
    # Users to add to this list of targets
    string[] add?;
    # Users to remove from this list of targets
    string[] remove?;
};

public type RelayProxyConfigs record {
    RelayProxyConfig[] items?;
};

public type ScheduledChangesFeatureFlagConflict record {
    # Feature flag scheduled change id this change will conflict with
    string _id?;
    # Feature flag scheduled change conflict reason
    string reason?;
};

public type WeightedVariation record {
    int variation?;
    int weight?;
};

public type FeatureFlagScheduledChange record {
    string _id?;
    int _version?;
    # A unix epoch time in milliseconds specifying the date the scheduled changes will be applied
    int executionDate?;
    # A semantic patch instruction
    SemanticPatchInstruction instructions?;
};

public type FeatureFlags record {
    Links _links?;
    FeatureFlag[] items?;
    decimal totalCount?;
};

public type CustomRole record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    # Description of the custom role.
    string description?;
    # The 20-hexdigit id or the key for a custom role.
    string 'key?;
    # Name of the custom role.
    string name?;
    Policy[] policy?;
};

public type Project record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    ClientSideAvailability defaultClientSideAvailability?;
    Environment[] environments?;
    boolean includeInSnippetByDefault?;
    string 'key?;
    string name?;
    # An array of tags for this project.
    string[] tags?;
};

# Default values to be used when a new environment is created.
public type Defaults record {
    # The index of the variation to be served when a flag is off.
    int offVariation;
    # The index of the variation to be served when a flag's targeting is on (default variation).
    int onVariation;
};

public type DestinationSegment record {
    string writeKey?;
};

public type AuditLogEntry record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    string comment?;
    int date?;
    string description?;
    string kind?;
    Member member?;
    string name?;
    string shortDescription?;
    AuditlogentryTarget target?;
    string title?;
    string titleVerb?;
};

public type UserRecord record {
    string avatar?;
    string environmentId?;
    string lastPing?;
    # The unique resource id.
    Id ownerId?;
    User user?;
};

# The unique resource id.
public type Id string;

public type Rule record {
    string _id?;
    Clause[] clauses?;
    string description?;
    Rollout rollout?;
    boolean trackEvents?;
    int variation?;
};

public type Link record {
    string href?;
    string 'type?;
};

public type Members record {
    Links _links?;
    Member[] items?;
    decimal totalCount?;
};

public type Prerequisite record {
    string 'key?;
    int variation?;
};

public type MAU record {
    UsageLinks _links?;
    StreamBySDKLinksMetadata[] metadata?;
    StreamUsageSeries[] series?;
};

public type Site record {
    string href?;
    string 'type?;
};

public type StreamSDKVersionData record {
    # The language of the sdk
    string sdk?;
    # The version of the sdk
    string 'version?;
};

public type Fallthrough record {
    Rollout rollout?;
    int variation?;
};

public type FeatureFlagCopyObject record {
    # If the latest version of the flag matches provided version it will copy, otherwise it will return a conflict.
    int currentVersion?;
    # The environment key to be used.
    string 'key;
};

public type RelayProxyConfig record {
    Member _creator;
    # The unique resource id.
    Id _id;
    # A unix epoch time in milliseconds specifying the creation time of this relay proxy configuration
    int creationDate;
    # The last 4 digits of the unique secret key for this relay proxy configuration
    string displayKey;
    # Full secret key. Only included if creating or resetting the relay proxy configuration
    string fullKey?;
    # A unix epoch time in milliseconds specifying the last time this relay proxy configuration was modified
    int lastModified;
    # A human-friendly name for the relay proxy configuration
    string name;
    Policy[] policy;
};

public type SemanticPatchOperation record {
    string comment?;
    # A semantic patch instruction
    SemanticPatchInstruction instructions;
};

public type IntegrationsubscriptionStatus record {
    int errorCount?;
    # A unix epoch time in milliseconds specifying the last time this integration was successfully used.
    int lastSuccess?;
    int successCount?;
};

public type Integrations record {
    # A mapping of integration types to their respective API endpoints.
    record {} _links?;
    IntegrationSubscription[] items?;
};

public type Target record {
    string[] values?;
    int variation?;
};

public type Events record {
    UsageLinks links?;
};

public type PatchOperation record {
    string op;
    string path;
    record {} value;
};

# | Name     | Description |
# | --------:| ----------- |
# | pending  | the feature flag approval request has not been reviewed yet |
# | approved | the feature flag approval request has been approved and can now be applied |
# | declined | the feature flag approval request has been declined and cannot be applied |
public type FeatureFlagApprovalRequestReviewStatus string;

public type UserSegments record {
    Links _links?;
    UserSegment[] items?;
};

public type Body8 record {
    # comment will be included in audit log item for change.
    string comment?;
};

public type Body9 record {
    # comment will be included in audit log item for change.
    string comment?;
    # One of approve, decline, or comment.
    string kind;
};

public type Usage record {
    UsageLinks _links?;
    StreamUsageSeries[] series?;
};

public type Body6 record {
    string[] customRoles?;
    string email;
    string firstName?;
    Statement[] inlineRole?;
    string lastName?;
    Role role?;
};

public type Body7 record {
    ClientSideAvailability defaultClientSideAvailability?;
    EnvironmentPost[] environments?;
    boolean includeInSnippetByDefault?;
    string 'key;
    string name;
    string[] tags?;
};

public type DestinationAmazonKinesis record {
    string region?;
    string roleArn?;
    string streamName?;
};

public type Body4 record {
    # comment will be included in audit log item for change.
    string comment?;
    # Define the parts of the flag configuration that will not be copied.
    CopyActions[] excludedActions?;
    # Define the parts of the flag configuration that will be copied.
    CopyActions[] includedActions?;
    FeatureFlagCopyObject 'source?;
    FeatureFlagCopyObject target?;
};

public type Body5 record {
    # Integration-specific configuration fields.
    record {} config;
    # A human-readable name for your subscription configuration.
    string name;
    # Whether the integration subscription is active or not.
    boolean 'on?;
    Statement[] statements?;
    # Tags for the integration subscription.
    string[] tags?;
};

public type Statement record {
    string[] actions?;
    string effect?;
    # Targeted actions will be those actions NOT in this list. The "actions" field must be empty to use this field.
    string[] notActions?;
    # Targeted resource will be those resources NOT in this list. The "resources" field must be empty to use this field.
    string[] notResources?;
    string[] resources?;
};

public type Body2 record {
    ClientSideAvailability clientSideAvailability?;
    # Default values to be used when a new environment is created.
    Defaults defaults?;
    # A description of the feature flag.
    string description?;
    # Whether or not this flag should be made available to the client-side JavaScript SDK.
    boolean includeInSnippet?;
    # A unique key that will be used to reference the flag in your code.
    string 'key;
    # A human-friendly name for the feature flag. Remember to note if this flag is intended to be temporary or permanent.
    string name;
    # Tags for the feature flag.
    string[] tags?;
    # Whether or not the flag is a temporary flag.
    boolean temporary?;
    # An array of possible variations for the flag.
    Variation[] variations;
};

public type Body3 record {
    string comment?;
    PatchOperation[] patch?;
};

public type UsageError record {
    string message?;
};

public type SemanticpatchinstructionInner record {
    # The name of the modification you would like to perform on a resource.
    string kind?;
};

public type FeatureFlagStatusForQueriedEnvironment record {
    record {} 'default?;
    string lastRequested?;
    # | Name     | Description |
    # | --------:| ----------- |
    # | new      | the feature flag was created within the last 7 days, and has not been requested yet |
    # | active   | the feature flag was requested by your servers or clients within the last 7 days |
    # | inactive | the feature flag was created more than 7 days ago, and hasn't been requested by your servers or clients within the past 7 days |
    # | launched | one variation of the feature flag has been rolled out to all your users for at least 7 days |
    string name?;
};

public type AuditlogentryTarget record {
    Links _links?;
    string name?;
    string[] resources?;
};

public type UsageLinks record {
    Link parent?;
    Link self?;
    # The following links that are in the response.
    Link[] subseries?;
};

public type StreamBySDK record {
    StreamBySDKLinks _links?;
    StreamBySDKLinksMetadata[] metadata?;
    StreamUsageSeries[] series?;
};

public type Webhooks record {
    Links _links?;
    Webhook[] items?;
};

# A name and value describing a custom property.
public type CustomProperty record {
    # The name of the property.
    string name;
    # Values for this property.
    string[] value?;
};

public type Body1 record {
    # destination-specific configuration.
    record {} config;
    # The data export destination type. Available choices are kinesis, google-pubsub, mparticle, or segment.
    string kind;
    # A human-readable name for your data export destination.
    string name;
    # Whether the data export destination is on or not.
    boolean 'on?;
};

public type Webhook record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    # The name of the webhook.
    string name?;
    # Whether this webhook is enabled or not.
    boolean 'on?;
    # If defined, the webhooks post request will include a X-LD-Signature header whose value will contain an HMAC SHA256 hex digest of the webhook payload, using the secret as the key.
    string secret?;
    Statement[] statements?;
    # Tags assigned to this webhook.
    string[] tags?;
    # The URL of the remote webhook.
    string url?;
};

public type Variation record {
    string _id?;
    string description?;
    string name?;
    record {} value;
};

public type StreamBySDKLinks record {
    Link parent?;
    Link self?;
};

public type FeatureFlagApprovalRequest record {
    # The unique resource id.
    Id _id?;
    int _version?;
    FeatureFlagApprovalRequestReview[] allReviews?;
    # The id of the member that applied the approval request
    string appliedByMemberID?;
    # A unix epoch time in milliseconds specifying the date the approval request was applied
    int appliedDate?;
    # A unix epoch time in milliseconds specifying the date the approval request was requested
    int creationDate?;
    # A semantic patch instruction
    SemanticPatchInstruction instructions?;
    # Id of members to notify.
    string[] notifyMemberIds?;
    # The id of the member that requested the change
    string requestorId?;
    # | Name     | Description |
    # | --------:| ----------- |
    # | pending  | the feature flag approval request has not been reviewed yet |
    # | approved | the feature flag approval request has been approved and can now be applied |
    # | declined | the feature flag approval request has been declined and cannot be applied |
    FeatureFlagApprovalRequestReviewStatus reviewStatus?;
    # | Name     | Description |
    # | --------:| ----------- |
    # | pending  | the feature flag approval request has not been applied yet |
    # | completed| the feature flag approval request has been applied successfully |
    # | failed   | the feature flag approval request has been applied but the changes were not applied successfully |
    string status?;
};

public type Policy record {
    string[] actions?;
    # Effect of the policy - allow or deny.
    string effect?;
    # Targeted actions will be those actions NOT in this list. The "actions" field must be empty to use this field.
    string[] notActions?;
    # Targeted resource will be those resources NOT in this list. The "resources" field must be empty to use this field.
    string[] notResources?;
    string[] resources?;
};

# A semantic patch instruction
# A semantic patch instruction
public type SemanticPatchInstruction SemanticpatchinstructionInner[];

public type Destinations record {
    Links _links?;
    Destination[] items?;
};

public type UserTargetingExpirationForFlags record {
    Links _links?;
    UserTargetingExpirationForFlag[] items?;
};

public type Body12 record {
    UnboundedSegmentTargetChanges excluded?;
    UnboundedSegmentTargetChanges included?;
};

public type FeatureFlag record {
    Links _links?;
    Member _maintainer?;
    int _version?;
    # Whether or not this flag is archived.
    boolean archived?;
    # A unix epoch time in milliseconds specifying the archived time of this flag.
    int archivedDate?;
    ClientSideAvailability clientSideAvailability?;
    # A unix epoch time in milliseconds specifying the creation time of this flag.
    int creationDate?;
    # A mapping of keys to CustomProperty entries.
    record {} customProperties?;
    # Default values to be used when a new environment is created.
    Defaults defaults?;
    # Description of the feature flag.
    string description?;
    record {} environments?;
    # An array goals from all environments associated with this feature flag
    string[] goalIds?;
    boolean includeInSnippet?;
    string 'key?;
    # Whether the feature flag is a boolean flag or multivariate.
    string kind?;
    # The ID of the member that should maintain this flag.
    string maintainerId?;
    # Name of the feature flag.
    string name?;
    # An array of tags for this feature flag.
    string[] tags?;
    # Whether or not this flag is temporary.
    boolean temporary?;
    # The variations for this feature flag.
    Variation[] variations?;
};

public type Body11 record {
    # A description for the user segment.
    string description?;
    # A unique key that will be used to reference the user segment in feature flags.
    string 'key;
    # A human-friendly name for the user segment.
    string name;
    # Tags for the user segment.
    string[] tags?;
    # Controls whether this segment can support unlimited numbers of users. Requires the beta API and additional setup. Include/exclude lists in this payload are not used in unbounded segments.
    boolean unbounded?;
};

public type Body10 record {
    # Description of the custom role.
    string description?;
    # The 20-hexdigit id or the key for a custom role.
    string 'key;
    # Name of the custom role.
    string name;
    Policy[] policy;
};

public type Body15 record {
    # The name of the webhook.
    string name?;
    # Whether this webhook is enabled or not.
    boolean 'on;
    # If sign is true, and the secret attribute is omitted, LaunchDarkly will automatically generate a secret for you.
    string secret?;
    # If sign is false, the webhook will not include a signature header, and the secret can be omitted.
    boolean sign;
    Statement[] statements?;
    # Tags for the webhook.
    string[] tags?;
    # The URL of the remote webhook.
    string url;
};

public type Body14 record {
    # The variation value to set for the user. Must match the variation type of the flag.
    boolean setting?;
};

public type EnvironmentPost record {
    # A color swatch (as an RGB hex value with no leading '#', e.g. C8C8C8).
    string color;
    # Determines if this environment requires confirmation for flag and segment changes.
    boolean confirmChanges?;
    # Set to true to send detailed event information for newly created flags.
    boolean defaultTrackEvents?;
    # The default TTL for the new environment.
    decimal defaultTtl?;
    # A project-unique key for the new environment.
    string 'key;
    # The name of the new environment.
    string name;
    # Determines if this environment requires comments for flag and segment changes.
    boolean requireComments?;
    # Determines whether the environment is in secure mode.
    boolean secureMode?;
    # An array of tags for this environment.
    string[] tags?;
};

public type Body13 record {
    # A list of custom role IDs to use as access limits for the access token
    string[] customRoleIds?;
    # The default API version for this token
    int defaultApiVersion?;
    Statement[] inlineRole?;
    # A human-friendly name for the access token
    string name?;
    # The name of a built-in role for the token
    string role?;
    # Whether the token will be a service token https://docs.launchdarkly.com/home/account-security/api-access-tokens#service-tokens
    boolean serviceToken?;
};

public type FeatureFlagScheduledChanges record {
    Links _links?;
    FeatureFlagScheduledChange[] items?;
};

public type FeatureFlagStatuses record {
    Links _links?;
    FeatureFlagStatus[] items?;
};

public type StreamBySDKLinksMetadata record {
    string sdk?;
    string 'source?;
    string 'version?;
};

public type HierarchicalLinks record {
    Link parent?;
    Link self?;
};

public type StreamUsageMetadata record {
    # The language of the sdk
    string sdk?;
    string 'source?;
    # The version of the SDK
    string 'version?;
};

public type DestinationGooglePubSub record {
    string project?;
    string topic?;
};

public type Stream record {
    StreamUsageLinks _links?;
    StreamUsageMetadata[] metadata?;
    StreamUsageSeries[] series?;
};

public type FeatureFlagApprovalRequests record {
    Links _links?;
    FeatureFlagApprovalRequest[] items?;
};

public type UserFlagSettings record {
    Links _links?;
    record {} items?;
};

public type Member record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    boolean _pendingInvite?;
    boolean _verified?;
    Id[] customRoles?;
    string email?;
    string firstName?;
    boolean isBeta?;
    string lastName?;
    Role role?;
};

public type MAUMetadata record {
};

public type CopyActions string;

public type StreamLinks record {
    Link parent?;
    Link self?;
    # Links to endpoints that are in the request path.
    Link[] subseries?;
};

public type FeatureFlagScheduledChangesConflicts record {
    FeatureflagscheduledchangesconflictsInstructions[] instructions?;
};

public type IntegrationSubscription record {
    # The unique resource id.
    Id _id?;
    HierarchicalLinks _links?;
    IntegrationsubscriptionStatus _status?;
    # A key-value mapping of configuration fields.
    record {} config?;
    # The type of integration associated with this configuration.
    string kind?;
    # The user-defined name associated with this configuration.
    string name?;
    # Whether or not the integration is currently active.
    boolean 'on?;
    Statement[] statements?;
    # An array of tags for this integration configuration.
    string[] tags?;
};

public type MAUbyCategory record {
    StreamBySDKLinks _links?;
    MAUMetadata[] metadata?;
    StreamUsageSeries[] series?;
};

public type Role string;

public type UserFlagSetting record {
    Links _links?;
    # The most important attribute in the response. The _value is the current setting for the user. For a boolean feature toggle, this will be true, false, or null if there is no defined fallthrough value.
    boolean _value?;
    # The setting attribute indicates whether you've explicitly targeted this user to receive a particular variation. For example, if you have explicitly turned off a feature toggle for a user, setting will be false. A setting of null means that you haven't assigned that user to a specific variation.
    boolean setting?;
};

public type Environment record {
    # The unique resource id.
    Id _id?;
    Links _links?;
    # The SDK key for backend LaunchDarkly SDKs.
    string apiKey?;
    # Approval settings for an environment. Only appears if the approvals feature is enabled.
    EnvironmentApprovalsettings approvalSettings?;
    # The swatch color for the environment.
    string color?;
    # Determines if this environment requires confirmation for flag and segment changes.
    boolean confirmChanges?;
    # Set to true to send detailed event information for new flags.
    boolean defaultTrackEvents?;
    # The default TTL.
    decimal defaultTtl?;
    # The key for the environment.
    string 'key?;
    # The SDK key for mobile LaunchDarkly SDKs.
    string mobileKey?;
    # The name of the environment.
    string name?;
    # Determines if this environment requires comments for flag and segment changes.
    boolean requireComments?;
    # Determines if this environment is in safe mode.
    boolean secureMode?;
    # An array of tags for this environment.
    string[] tags?;
};

public type EvaluationUsageError record {
    string code?;
    string message?;
};

# Approval settings for an environment. Only appears if the approvals feature is enabled.
public type EnvironmentApprovalsettings record {
    # Whether changes can be applied as long as minNumApprovals is met, regardless of if any reviewers have declined a request.
    boolean canApplyDeclinedChanges?;
    # Whether requesters can approve or decline their own request. They may always comment.
    boolean canReviewOwnRequest?;
    # The number of approvals required before an approval request can be applied.
    int minNumApprovals?;
    # Whether any changes to flags in this environment will require approval.
    boolean required?;
    # The approvals system used.
    string serviceKind?;
};

public type Destination record {
    # Unique destination ID.
    string _id?;
    Links _links?;
    # destination-specific configuration.
    record {} config?;
    # Destination type ("google-pubsub", "kinesis", "mparticle", or "segment")
    string kind?;
    # The destination name
    string name?;
    # Whether the data export destination is on or not.
    boolean 'on?;
    int 'version?;
};

public type User record {
    boolean anonymous?;
    string avatar?;
    string country?;
    record {} custom?;
    string email?;
    string firstName?;
    string ip?;
    string 'key?;
    string lastName?;
    string name?;
    string secondary?;
};

public type UserTargetingExpirationForSegment record {
    string _id?;
    Links _links?;
    UserTargetingExpirationResourceIdForFlag _resourceId?;
    int _version?;
    # Unix epoch time in milliseconds specifying the expiration date
    int expirationDate?;
    # either the included or excluded variation that the user is targeted on a segment
    string targetType?;
    # Unique identifier for the user
    string userKey?;
};

public type Projects record {
    Links _links?;
    Project[] items?;
};

public type FeatureflagscheduledchangesconflictsInstructions record {
    ScheduledChangesFeatureFlagConflict[] conflicts?;
    # The name of the modification you would like to perform on a resource.
    string kind?;
};

public type UserTargetingExpirationResourceIdForFlag record {
    string environmentKey?;
    string flagKey?;
    string 'key?;
    string kind?;
    string projectKey?;
};

public type UserSegment record {
    FlagListItem[] _flags?;
    Links _links?;
    # A unix epoch time in milliseconds specifying the creation time of this flag.
    int creationDate;
    # Description of the user segment.
    string description?;
    # An array of user keys that should not be included in this segment, unless they are also listed in "included".
    string[] excluded?;
    # An array of user keys that are included in this segment.
    string[] included?;
    # Unique identifier for the user segment.
    string 'key;
    # Name of the user segment.
    string name;
    # An array of rules that can cause a user to be included in this segment.
    UserSegmentRule[] rules?;
    # An array of tags for this user segment.
    string[] tags?;
    # Controls whether this segment can support unlimited numbers of users. Requires the beta API and additional setup. Include/exclude lists in this payload are not used in unbounded segments.
    boolean unbounded?;
    int 'version?;
};

public type FeatureFlagStatusAcrossEnvironments record {
    Links _links?;
    record {} environments?;
    string 'key?;
};

public type Rollout record {
    string bucketBy?;
    WeightedVariation[] variations?;
};

public type Body record {
    # A human-friendly name for the relay proxy configuration
    string name?;
    Policy[] policy?;
};

public type DestinationMParticle record {
    string apiKey?;
    string environment?;
    string secret?;
    string userIdentity?;
};

public type Streams record {
    StreamUsageLinks _links?;
};

public type UserTargetingExpirationOnFlagsForUser record {
    Links _links?;
    UserTargetingExpirationForFlag[] items?;
};

public type Integration record {
    IntegrationLinks _links?;
    IntegrationSubscription[] items?;
};

public type StreamUsageSeries record {
    # A key corresponding to a time series data point.
    int '0?;
    # A unix epoch time in milliseconds specifying the creation time of this flag.
    int time?;
};

public type UserTargetingExpirationForFlag record {
    string _id?;
    Links _links?;
    UserTargetingExpirationResourceIdForFlag _resourceId?;
    int _version?;
    # Unix epoch time in milliseconds specifying the expiration date
    int expirationDate?;
    # Unique identifier for the user
    string userKey?;
    # the ID of the variation that the user is targeted on a flag
    string variationId?;
};

public type AuditLogEntries record {
    Links _links?;
    AuditLogEntry[] items?;
};

public type StreamUsageError record {
    string code?;
    string message?;
};

public type StreamUsageLinks record {
    Link parent?;
    Link self?;
    # The following links that are in the response.
    Link[] subseries?;
};

# Values for this property.
# Values for this property.
public type CustomPropertyValues string[];

public type Links record {
    Link next?;
    Link self?;
};

public type Clause record {
    string _id?;
    string attribute?;
    boolean negate?;
    string op?;
    record {}[] values?;
};

public type FeatureFlagApprovalRequestReview record {
    # The unique resource id.
    Id _id?;
    # A unix epoch time in milliseconds specifying the date the approval request was reviewed
    int creationDate?;
    # | Name     | Description |
    # | --------:| ----------- |
    # | pending  | the feature flag approval request has not been reviewed yet |
    # | approved | the feature flag approval request has been approved and can now be applied |
    # | declined | the feature flag approval request has been declined and cannot be applied |
    FeatureFlagApprovalRequestReviewStatus kind?;
    # The unique resource id.
    Id memberId?;
};
