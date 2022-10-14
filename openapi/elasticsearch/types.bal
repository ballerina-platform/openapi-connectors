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

public type DeploymentTemplateInfoV2Arr DeploymentTemplateInfoV2[];

# The container for a set of traffic filter rulesets.
public type TrafficFilterRulesets record {
    # List of traffic filter rules
    TrafficFilterRulesetInfo[] rulesets;
};

# An AppSearch creation request paired with the alias of the Elasticsearch cluster it should be paired with
public type AppSearchPayload record {
    # Alias to the Elasticsearch Cluster to attach AppSearch to
    string elasticsearch_cluster_ref_id;
    # The human readable name for the AppSearch cluster (default: takes the name of its Elasticsearch cluster)
    string display_name?;
    # The settings for the App Search.
    AppSearchSettings settings?;
    # The region where this resource exists
    string region;
    # A locally-unique user-specified id for AppSearch
    string ref_id;
    # The plan for the App Search cluster.
    AppSearchPlan plan;
};

# The response to an APM CRUD (create/update-plan) request.
public type ApmCrudResponse record {
    # For an operation creating or updating an APM server, the Id of that server
    string apm_id?;
    # The secret token for accessing the server
    string secret_token;
    # If the endpoint is called with URL param 'validate_only=true', then this contains advanced debug info (the internal plan representation)
    record {} diagnostics?;
};

# The configuration settings for the timeout and fallback parameters.
public type ElasticsearchPlanControlConfiguration record {
    # Set to 'forced' to force a reboot as part of the upgrade plan. NOTES: (ie taking an existing plan and leaving it alone except for setting 'transient.plan_configuration.cluster_reboot': 'forced' will reboot the cluster)
    string cluster_reboot?;
    # This timeout determines how long to give a cluster after it responds to API calls before performing actual operations on it. It defaults to 5s
    int calm_wait_time?;
    # If true (default: false), does not take (or require) a successful snapshot to be taken before performing any potentially destructive changes to this cluster
    boolean skip_snapshot?;
    # When you take a snapshot and 'skip_snapshots' is false, specifies the maximum age in seconds of the most recent snapshot before a new snapshot is created. Default is 300
    int max_snapshot_age?;
    # The total timeout in seconds after which the plan is cancelled even if it is not complete. Defaults to 4x the max memory capacity per node (in MB). NOTES: A 3 zone cluster with 2 nodes of 2048 each would have a timeout of 4*2048=8192 seconds. Timeout does not include time required to run rollback actions.
    int timeout?;
    # If true (default false), does not clear the maintenance flag (which prevents its API from being accessed except by the constructor) on new instances added until after a snapshot has been restored, otherwise, the maintenance flag is cleared once the new instances successfully join the new cluster
    boolean extended_maintenance?;
    # If taking a snapshot (ie unless 'skip_snapshots': true) then will retry on failure at most this number of times (default: 5)
    int max_snapshot_attempts?;
};

# Information about the APM Servers associated with the Elasticsearch cluster.
public type AppSearchSubInfo record {
    # Whether the associated App Search is currently available
    boolean enabled;
    # The App Search Id
    string app_search_id;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
};

# Defines the topology of the Enterprise Search nodes (e.g. number/capacity of nodes, and where they can be allocated)
public type EnterpriseSearchTopologyElement record {
    record {} node_count_per_zone?;
    # number of zones in which nodes will be placed
    int zone_count?;
    string node_configuration?;
    record {} memory_per_node?;
    EnterpriseSearchConfiguration enterprise_search?;
    # Node types to enable for an Enterprise Search instance
    EnterpriseSearchNodeTypes node_type?;
    record {} allocator_filter?;
    # Controls the allocation of this topology element as well as allowed sizes and node_types. It needs to match the id of an existing instance configuration.
    string instance_configuration_id?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize size?;
};

# The Kibana instance settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
public type KibanaConfiguration record {
    # An arbitrary JSON object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_yaml' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Kibana settings)
    record {} user_settings_override_json?;
    # An arbitrary YAML object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_json' is allowed), provided the parameters are on the allowlist and not on the denylist. (These field together with 'user_settings_override*' and 'system_settings' defines the total set of Kibana settings)
    string user_settings_yaml?;
    # The version of the Kibana cluster (must be one of the ECE supported versions, and won't work unless it matches the Elasticsearch version. Leave blank to auto-detect version.)
    string 'version?;
    # An arbitrary JSON object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_yaml' is allowed), provided the parameters are on the allowlist and not on the denylist. (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Kibana settings)
    record {} user_settings_json?;
    # A subset of Kibana settings. TIP: To define the complete set of Elasticsearch settings, use `KibanaSystemSettings` with `user_settings_override_` and `user_settings_`.
    KibanaSystemSettings system_settings?;
    # An arbitrary YAML object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_json' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Kibana settings)
    string user_settings_override_yaml?;
    # A docker URI that allows overriding of the default docker image specified for this version
    string docker_image?;
};

# The status of your cluster and its readiness to be upgraded
public type DeploymentUpgradeAssistantStatusResponse record {
    # A boolean indicating whether or not the cluster is ready to be upgraded
    boolean ready_for_upgrade;
    # Message with information about the number of Elasticsearch and Kibana deprecations
    string details;
};

public type ExternalHyperlink record {
    # hyperlink to an external resource
    string uri?;
    # Identifier of the external link
    string id;
    # Human-readable description of the external link
    string label;
};

public type ExtensionsExtensionIdBody record {
    # Zip file that contains the extension
    string file;
};

# Additional configuration about the current deployment object.
public type DeploymentSettings record {
    # The configuration settings for IP filtering.
    IpFilteringSettings ip_filtering_settings?;
    # The observability settings for a deployment
    DeploymentObservabilitySettings observability?;
    # The configuration settings for the traffic filter.
    TrafficFilterSettings traffic_filter_settings?;
};

# The request payload that creates the API keys.
public type CreateApiKeyRequest record {
    # API key description. Useful if there are multiple keys
    string description;
    # Deprecated. The security token from reauthenticate API
    string authentication_token?;
};

# Data for a deployment resource
public type DeploymentResource record {
    # The Elasticsearch cluster that this resource depends on.
    string elasticsearch_cluster_ref_id?;
    # The kind of resource
    string kind;
    # An encoded string that provides other Elastic services with the necessary information to connect to this Elasticsearch and Kibana
    string cloud_id?;
    # Secret token for using a created resource. Only provided on initial create and absent otherwise.
    string secret_token?;
    # List of warnings generated from validating resource updates
    ReplyWarning[] warnings?;
    # Identifier of the region in which this resource runs.
    string region;
    # A locally-unique friendly alias for this Elasticsearch cluster
    string ref_id;
    # The username and password for the new Elasticsearch cluster, which is returned from the Elasticsearch cluster `create` command.
    ClusterCredentials credentials?;
    # A system-unique id for the created resource
    string id;
};

# The overview information for the App Search Server.
public type AppSearchInfo record {
    # App Search status
    string status;
    # The name of the App Search
    string name;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
    # Information about the specified Elasticsearch cluster.
    TargetElasticsearchCluster elasticsearch_cluster;
    # Whether the App Search is healthy or not (one or more of the info subsections will have healthy: false)
    boolean healthy;
    # The region that this App Search belongs to. Only populated in SaaS or federated ECE.
    string region?;
    # The settings for the App Search.
    AppSearchSettings settings?;
    # Information about current, pending, and past App Search Server plans.
    AppSearchPlansInfo plan_info;
    # External resources related to the App Search
    ExternalHyperlink[] external_links;
    # The id of the deployment that this App Search belongs to.
    string deployment_id?;
    # The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
    ClusterTopologyInfo topology;
    # The id of the App Search
    string id;
    # Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
    ClusterMetadataInfo metadata?;
};

# Information about the monitoring status for the Elasticsearch cluster.
public type ElasticsearchMonitoringInfo record {
    # Whether the Monitoring configuration has been successfully applied
    boolean healthy;
    # The status message from the last update (successful or not)
    string last_update_status;
    # The list of clusters Ids to which this cluster is currently sending monitoring data
    string[] destination_cluster_ids;
    # The time the monitoring configuration was last changed
    string last_modified;
    # The list of clusters Ids from which this cluster is currently receiving monitoring data
    string[] source_cluster_ids;
};

# Matches documents that have at least one non-`null` value in the original field.
public type ExistsQuery record {
    # The field to check for non-null values in.
    string 'field;
};

# Information about the current, pending, or past Kibana instance plan.
public type KibanaClusterPlanInfo record {
    # If this plan completed or failed (ie is not pending), when the attempt ended (ISO format in UTC)
    string attempt_end_time?;
    # A UUID for each plan attempt
    string plan_attempt_id?;
    ClusterPlanWarning[] warnings;
    # Either the plan ended successfully, or is not yet completed (and no errors have occurred)
    boolean healthy;
    # If this plan is not current or pending, when the plan was no longer active (ISO format in UTC)
    string plan_end_time?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    ClusterPlanStepInfo[] plan_attempt_log;
    # The plan for the Kibana instance.
    KibanaClusterPlan plan?;
    # A human readable name for each plan attempt, only populated when retrieving plan histories
    string plan_attempt_name?;
    # When this plan attempt (ie to apply the plan to the cluster) started (ISO format in UTC)
    string attempt_start_time?;
};

# The trust relationship with the clusters of one account.
public type AccountTrustRelationship record {
    # The list of clusters to trust. Only used when `trust_all` is false.
    string[] trust_allowlist?;
    # the ID of the Account
    string account_id;
    # If true, all clusters in this account will by default be trusted and the `trust_allowlist` is ignored.
    boolean trust_all;
};

# The list of resources used as remote clusters
public type RemoteResources record {
    # The remote resources
    RemoteResourceRef[] resources;
};

# The rule detail for a traffic filter egress rule.
public type TrafficFilterEgressRule record {
    # The target protocol for an egress rule
    string protocol;
    # Allowed traffic filter egress target: IP address or CIDR mask
    string target;
    # A list of target ports for an egress rule
    int[] ports?;
};

# A response returned from the Deployment Resource endpoints
public type DeploymentResourceCrudResponse record {
    # The kind of the stateless resource
    string kind;
    # The id of the deployment
    string id;
    # The reference id of the resource
    string ref_id;
};

# The plan for the Elasticsearch cluster.
public type ElasticsearchClusterPlan record {
    # Enable autoscaling for this Elasticsearch cluster.
    boolean autoscaling_enabled?;
    ElasticsearchClusterTopologyElement[] cluster_topology;
    # Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and Elasticsearch settings.
    TransientElasticsearchPlanConfiguration transient?;
    # The Elasticsearch cluster settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
    ElasticsearchConfiguration elasticsearch;
    # Specifies the deployment template used to create the plan.
    DeploymentTemplateReference deployment_template?;
};

# Information about a warning from a plan.
public type ClusterPlanWarning record {
    # The ID of the step which produced a warning, if any
    string step_id?;
    # A description of the warning
    string message;
    # A unique warning code
    string code;
};

# Additional configuration for the new deployment object.
public type DeploymentCreateSettings record {
    # The configuration settings for IP filtering.
    IpFilteringSettings ip_filtering_settings?;
    # The observability settings for a deployment
    DeploymentObservabilitySettings observability?;
    # The configuration settings for the traffic filter.
    TrafficFilterSettings traffic_filter_settings?;
};

# The costs associated to a Data Transfer and Storage (DTS) dimension for an organization. All of the costs, credits, and trials are expressed in Elastic Consumption Units (ECU).
public type DtsDimensionCosts record {
    # DTS dimension Stock Keeping Unit (SKU)
    string sku;
    # DTS dimension name
    string name;
    # DTS Rate
    DtsRate rate;
    # Costs associated to the Data Transfer and Storage (DTS) dimensions for an organization
    decimal cost;
    # Type of the DTS dimension usage
    string 'type;
    # DTS quantity
    DtsQuantity quantity;
};

# The specification for traffic filter ruleset.
public type TrafficFilterRulesetRequest record {
    # Name of the ruleset
    string name;
    # List of rules
    TrafficFilterRule[] rules;
    # The ruleset can be attached only to deployments in the specific region
    string region;
    # Should the ruleset be automatically included in the new deployments
    boolean include_by_default;
    # Type of the ruleset
    string 'type;
    # Description of the ruleset
    string description?;
};

# Issues that prevent the Elasticsearch cluster or index from correctly operating.
public type ElasticsearchClusterBlockingIssues record {
    # Whether the cluster has issues (false) or not (true)
    boolean healthy;
    # A list of issues that affect availability of entire cluster
    ElasticsearchClusterBlockingIssueElement[] cluster_level;
    # A list of issues that affect availability of the cluster's indices
    ElasticsearchClusterBlockingIssueElement[] index_level;
};

# The snapshot configuration settings for an Elasticsearch cluster.
public type ClusterSnapshotSettings record {
    # When set to true, the deployment will have SLM enabled. Default value is true.
    boolean slm?;
    # Cron expression indicating when should snapshots be taken. This can be enabled only if SLM is enabled for the deployment and 'interval' is not present
    string cron_expression?;
    # Interval between snapshots, with the format 'length unit' (space is optional), where unit can be one of: d (day), h (hour), min (minute). Default is 30 minutes
    string interval?;
    # Information about the Elasticsearch cluster snapshot retention.
    ClusterSnapshotRetention retention?;
};

# Restores a snapshot from a local or remote repository.
public type RestoreSnapshotConfiguration record {
    # Configures the location of a remote repository. The default is the system repository.
    RestoreSnapshotRepoConfiguration repository_config?;
    # If specified, contains the name of the snapshot repository - else will default to the Elastic Cloud system repo ('found-snapshots')
    string repository_name?;
    # The configuration for the restore command, such as which indices you want to restore.
    RestoreSnapshotApiConfiguration restore_payload?;
    # The restore strategy to use. Defaults to a full restore. Partial restore will attempt to restore unavailable indices only
    string strategy?;
    # If specified, contains the name of the source cluster id. Do not send this if you are sending repository_config
    string source_cluster_id?;
    # The name of the snapshot to restore. Use '\_\_latest_success\_\_' to get the most recent snapshot from the specified repository
    string snapshot_name;
};

# Response returned when a command is successfully issued against a given Deployment resource
public type DeploymentResourceCommandResponse record {
    # List of warnings generated from validating command
    ReplyWarning[] warnings?;
};

# The container for a set of traffic filter rules.
public type TrafficFilterRulesetInfo record {
    # List of associations. Returned only when include_associations query parameter is true
    FilterAssociation[] associations?;
    # Description of the ruleset
    string description?;
    # List of rules
    TrafficFilterRule[] rules;
    # The ruleset can be attached only to deployments in the specific region
    string region;
    # Should the ruleset be automatically included in the new deployments
    boolean include_by_default;
    # Total number of associations. This includes associations the user does not have permission to view.Returned only when include_associations query parameter is true
    int total_associations?;
    # Type of the ruleset
    string 'type;
    # The ruleset ID
    string id;
    # Name of the ruleset
    string name;
};

# The observability settings for a deployment
public type DeploymentObservabilitySettings record {
    # The metrics settings for a deployment
    DeploymentMetricsSettings metrics?;
    # The logging settings for a deployment
    DeploymentLoggingSettings logging?;
};

# A response returned from the Deployment create endpoint
public type DeploymentCreateResponse record {
    # The name of the deployment
    string name;
    # Whether or not the deployment was freshly created
    boolean created;
    # A user-defined deployment alias for user-friendly resource URLs
    string alias?;
    # Describes the diagnostics for a given Deployment-modifying payload
    DeploymentDiagnostics diagnostics?;
    # The id of the deployment
    string id;
    # List of created resources.
    DeploymentResource[] resources;
};

# Information about the Kibana instances associated with the Elasticsearch cluster.
public type KibanaSubClusterInfo record {
    # The Kibana cluster Id
    string kibana_id;
    # Whether the associated Kibana cluster is currently available
    boolean enabled;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
};

# Describes a given Deployment
public type DeploymentGetResponse record {
    # The name of this deployment
    string name;
    # Additional configuration about the current deployment object.
    DeploymentSettings settings?;
    # Whether the deployment is overall healthy or not (one or more of the resource info subsections will have healthy: false)
    boolean healthy;
    # A user-defined deployment alias for user-friendly resource URLs
    string alias?;
    # Observability information for a deployment
    DeploymentObservability observability?;
    # A randomly-generated id of this Deployment
    string id;
    # Describes a resource belonging to a Deployment
    DeploymentResources resources;
    # Additional information about the current deployment object.
    DeploymentMetadata metadata?;
};

# Holds diagnostics for resources that will be created
public type Creates record {
    # Diagnostics for AppSearches
    AppSearch[] appsearch?;
    # Diagnostics for Elasticsearch clusters
    Elasticsearch[] elasticsearch?;
    # Diagnostics for Enterprise Search resources
    EnterpriseSearch[] enterprise_search?;
    # Diagnostics for Kibanas
    Kibana[] kibana?;
    # Diagnostics for APMs
    Apm[] apm?;
};

# The plan for the App Search cluster.
public type AppSearchPlan record {
    AppSearchConfiguration appsearch;
    AppSearchTopologyElement[] cluster_topology?;
    # Defines configuration parameters that control how the plan (ie consisting of the cluster topology and AppSearch settings) is applied
    TransientAppSearchPlanConfiguration transient?;
};

# Observability health issue
public type ObservabilityIssue record {
    # A user-friendly description of the observability health issue
    string description;
    # Severity of the health issue
    string severity;
};

# The structure that defines the routing settings for index curation.
public type ElasticsearchCuration record {
    # The destination instance configuration
    string to_instance_configuration_id;
    # The source instance configuration
    string from_instance_configuration_id;
};

# The contents of the Elasticsearch keystore.
public type KeystoreContents record {
    # List of secrets
    record {} secrets;
};

# The log message from a specified stage of an executed step in a plan.
public type ClusterPlanStepLogMessageInfo record {
    # Timestamp marking on info log of step
    string timestamp;
    # Time in milliseconds since previous log message
    int delta_in_millis?;
    # A map with details for the log about what happened during the step execution. Keys and values for are always both strings, representing the name of the detail and its value, respectively.
    record {} details;
    # The failure type, in case the step failed
    string failure_type?;
    # Human readable log message
    string message;
    # Stage that info log message takes place in
    string stage;
};

# A strategy that creates instances with the new plan, migrates data from the old instances, then shuts down the old instances. `GrowShrinkStrategyConfig` is safer than 'rolling' and ensures single node availability during a plan change, but can be a lot slower on larger clusters.
public type GrowShrinkStrategyConfig record {
};

# A query that matches nested objects.
public type NestedQuery record {
    # The container for all of the allowed Elasticsearch queries. Specify only one property each time.
    QueryContainer query;
    # Allows to specify how inner children matching affects score of the parent. Refer to the Elasticsearch documentation for details.
    string score_mode?;
    # The path to the nested object.
    string path;
};

# Contains a list of Deployments as result of a search request.
public type DeploymentsSearchResponse record {
    # If a query is supplied, then the total number of deployments that matched
    int match_count?;
    # The number of deployments actually returned
    int return_count;
    DeploymentSearchResponse[] deployments;
};

# Information about current, pending, and past Enterprise Search Server plans.
public type EnterpriseSearchPlansInfo record {
    # Whether the plan situation is healthy (if unhealthy, means the last plan attempt failed)
    boolean healthy;
    # Information about the Enterprise Search Server plan.
    EnterpriseSearchPlanInfo current?;
    # Information about the Enterprise Search Server plan.
    EnterpriseSearchPlanInfo pending?;
    EnterpriseSearchPlanInfo[] history;
};

# Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and Elasticsearch settings.
public type TransientElasticsearchPlanConfiguration record {
    # The configuration settings for the timeout and fallback parameters.
    ElasticsearchPlanControlConfiguration plan_configuration?;
    # If specified, contains transient settings to be applied to an Elasticsearch cluster during changes, default values shown below applied.
    # These can be overridden by specifying them in the map (or null to unset). Additional settings can also be set. Settings will be cleared after the plan has finished. If not specified, no settings will be applied.
    # NOTE: These settings are only explicitly cleared for 5.x+ clusters, they must be hand-reset to their defaults in 2.x- (or a cluster reboot will clear them).
    # - indices.store.throttle.max_bytes_per_sec: 150Mb
    # - indices.recovery.max_bytes_per_sec: 150Mb
    # - cluster.routing.allocation.cluster_concurrent_rebalance: 10
    # - cluster.routing.allocation.node_initial_primaries_recoveries: 8
    # - cluster.routing.allocation.node_concurrent_incoming_recoveries: 8
    record {} cluster_settings_json?;
    # The list of resources used as remote clusters
    RemoteResources remote_clusters?;
    # Restores a snapshot from a local or remote repository.
    RestoreSnapshotConfiguration restore_snapshot?;
    # The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
    PlanStrategy strategy?;
};

# The query that matches documents with fields that contain terms within a specified range.
public type RangeQuery record {
    # Greater-than
    record {} gt?;
    # Greater-than or equal to
    record {} gte?;
    # Formatted dates will be parsed using the format specified on the date field by default, but it can be overridden by passing the format parameter.
    string format?;
    # Dates can be converted from another timezone to UTC either by specifying the time zone in the date value itself (if the format accepts it), or it can be specified as the time_zone parameter.
    string time_zone?;
    # Less-than
    record {} lt?;
    # Less-than or equal to.
    record {} lte?;
    # An optional boost value to apply to the query.
    float boost?;
};

# The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
public type PlanStrategy record {
    # Performs inline, rolling configuration changes that mutate existing containers. TIP: This is the fastest way to update a plan, but can fail for complex plan changes, such as topology changes. Also, this is less safe for configuration changes that leave a cluster in a non running state. NOTE: When you perform a major version upgrade, and 'group_by' is set to 'pass:macros[__all__]';, rolling is required.
    RollingStrategyConfig rolling?;
    # A strategy that creates new Elasticsearch instances, Kibana instances, and APM Servers with the new plan, then migrates the node data to minimize the amount of spare capacity.
    RollingGrowShrinkStrategyConfig rolling_grow_and_shrink?;
    # A strategy that creates instances with the new plan, migrates data from the old instances, then shuts down the old instances. `GrowShrinkStrategyConfig` is safer than 'rolling' and ensures single node availability during a plan change, but can be a lot slower on larger clusters.
    GrowShrinkStrategyConfig grow_and_shrink?;
    # A strategy that lets constructor choose the most optimal way to execute the plan.
    AutodetectStrategyConfig autodetect?;
};

# An APM creation request paired with the alias of the Elasticsearch cluster it should be paired with
public type ApmPayload record {
    # Alias to the Elasticsearch Cluster to attach APM to
    string elasticsearch_cluster_ref_id;
    # The human readable name for the APM cluster (default: takes the name of its Elasticsearch cluster)
    string display_name?;
    # The settings for the APM Server.
    ApmSettings settings?;
    # The region where this resource exists
    string region;
    # A locally-unique user-specified id for APM
    string ref_id;
    # The plan for the APM Server.
    ApmPlan plan;
};

# Information about the APM Servers associated with the Elasticsearch cluster.
public type ApmSubInfo record {
    # The APM cluster Id
    string apm_id;
    # Whether the associated APM cluster is currently available
    boolean enabled;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
};

# The overview information for the APM Server.
public type ApmInfo record {
    # APM status
    string status;
    # The mode APM is operating in.
    string apm_server_mode?;
    # The name of the APM
    string name;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
    # Information about the specified Elasticsearch cluster.
    TargetElasticsearchCluster elasticsearch_cluster;
    # Whether the APM is healthy or not (one or more of the info subsections will have healthy: false)
    boolean healthy;
    # The region that this APM belongs to. Only populated in SaaS or federated ECE.
    string region?;
    # The settings for the APM Server.
    ApmSettings settings?;
    # Information about current, pending, and past APM Server plans.
    ApmPlansInfo plan_info;
    # External resources related to the APM
    ExternalHyperlink[] external_links;
    # The id of the deployment that this APM Server belongs to.
    string deployment_id?;
    # The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
    ClusterTopologyInfo topology;
    # The id of the APM
    string id;
    # Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
    ClusterMetadataInfo metadata?;
};

# Information about the unavailable replicas. NOTE: Unlike shards, unavailable replicas indicate a loss of redundancy rather than a loss of availability.
public type ElasticsearchReplicaElement record {
    # The Elastic Cloud name/id of the instance (container)
    string instance_name;
    # The number of unavailable replicas on this instance
    int replica_count;
};

# The settings for multiple Kibana instances.
public type KibanaClusterSettings record {
    # The top-level configuration settings for the Elasticsearch cluster.
    ClusterMetadataSettings metadata?;
};

# Describes the Deployment resource updates
public type DeploymentUpdateResources record {
    # A list of payloads for AppSearch updates. AppSearch has been replaced by Enterprise Search in the Elastic Stack 7.7 and higher
    AppSearchPayload[] appsearch?;
    # A list of payloads for Elasticsearch cluster updates
    ElasticsearchPayload[] elasticsearch?;
    # A list of payloads for Enterprise Search updates
    EnterpriseSearchPayload[] enterprise_search?;
    # A list of payloads for Kibana updates
    KibanaPayload[] kibana?;
    # A list of payloads for APM updates
    ApmPayload[] apm?;
};

# A request for creating a new Deployment consisting of multiple clusters
public type DeploymentCreateRequest record {
    # A user-defined alias to use in place of Cluster IDs for user-friendly URLs
    string alias?;
    # Additional information about the new deployment object.
    DeploymentCreateMetadata metadata?;
    # A name for the deployment; otherwise this will be the generated deployment id
    string name?;
    # Describes the resources that will belong to a Deployment
    DeploymentCreateResources resources;
    # Additional configuration for the new deployment object.
    DeploymentCreateSettings settings?;
};

public type Hyperlink record {
    # Whether the operation requires elevated permissions (when the field is present, elevated permissions are required).
    boolean need_elevated_permissions?;
};

# Describes the resources that will belong to a Deployment
public type DeploymentCreateResources record {
    # A list of payloads for AppSearch updates. AppSearch has been replaced by Enterprise Search in the Elastic Stack 7.7 and higher.
    AppSearchPayload[] appsearch?;
    # A list of payloads for Elasticsearch cluster creation.
    ElasticsearchPayload[] elasticsearch?;
    # A list of payloads for Enterprise Search creation.
    EnterpriseSearchPayload[] enterprise_search?;
    # A list of payloads for Kibana creation.
    KibanaPayload[] kibana?;
    # A list of payloads for APM creation.
    ApmPayload[] apm?;
};

# Costs associated to a set of deployments for an organization. All of the costs are expressed in Elastic Consumption Unit (ECU).
public type DeploymentsCosts record {
    # Total cost for all deployments
    decimal total_cost;
    # Costs of the list of deployments
    DeploymentCosts[] deployments;
};

# The configuration template for Elasticsearch instances, Kibana instances, and APM Servers.
public type InstanceConfigurationInfo record {
    # Instance sizes that are supported by the Elasticsearch instance, Kibana instance, or APM Server configuration.
    DiscreteSizes discrete_sizes;
    # Optional description for the instance configuration
    string description?;
    # Node types (master, data) for the instance
    string[] node_types?;
    # Settings for the instance storage multiplier
    decimal storage_multiplier?;
    # The type of instance (elasticsearch, kibana)
    string instance_type;
    # Settings for the instance CPU multiplier
    decimal cpu_multiplier?;
    # The maximum number of availability zones in which this instance configuration has allocators. This field will be missing unless explicitly requested with the show_max_zones parameter.
    int max_zones?;
    # Unique identifier for the instance configuration
    string id?;
    # Display name for the instance configuration.
    string name;
};

# Additional information about the current deployment object.
public type DeploymentMetadata record {
    # Arbitrary user-defined metadata associated with this deployment
    MetadataItem[] tags?;
};

# The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
public type ClusterTopologyInfo record {
    # Whether the cluster topology is healthy (ie all instances are started and the services they run - ie elasticsearch - are available
    boolean healthy;
    ClusterInstanceInfo[] instances;
};

# Performs inline, rolling configuration changes that mutate existing containers. TIP: This is the fastest way to update a plan, but can fail for complex plan changes, such as topology changes. Also, this is less safe for configuration changes that leave a cluster in a non running state. NOTE: When you perform a major version upgrade, and 'group_by' is set to 'pass:macros[__all__]';, rolling is required.
public type RollingStrategyConfig record {
    # Whether to skip attempting to do a synced flush on the filesystem of the container (default: false), which is less safe but may be required if the container is unhealthy
    boolean skip_synced_flush?;
    # Whether we allow changing the capacity of instances (default false). This is currently implemented by stopping, re-creating then starting the affected instance on its associated allocator when performing the changes. NOTES: This requires a round-trip through the allocation infrastructure of the active constructor, as it has to reserve the target capacity without over-committing
    boolean allow_inline_resize?;
    # Specifies the grouping attribute to use when rolling several instances. Instances that share the same value for the provided attribute key are rolled together as a unit. Examples that make sense to use are '\_\_all\_\_' (roll all instances as a single unit), 'logical_zone_name' (roll instances by zone), '\_\_name\_\_' (roll one instance at a time, the default if not specified). Note that '\_\_all\_\_' is required when performing a major version upgrade
    string group_by?;
    # The time, in seconds, to wait for shards that show no progress of initializing before rolling the next group (default: 10 minutes)
    int shard_init_wait_time?;
};

public type EnterpriseSearchConfiguration record {
    # An arbitrary JSON object allowing ECE admins to set clusters' parameters (only one of this and 'user_settings_override_yaml' is allowed), i.e. in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Enterprise Search settings)
    record {} user_settings_override_json?;
    # An arbitrary YAML object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_json' is allowed), provided the parameters are on the allowlist and not on the denylist. (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Enterprise Search settings)
    string user_settings_yaml?;
    # The version of the Enterprise Search cluster (must be one of the ECE supported versions, and won't work unless it matches the Elasticsearch version. Leave blank to auto-detect version.)
    string 'version?;
    # An arbitrary JSON object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_yaml' is allowed), provided the parameters are on the allowlist and not on the denylist. (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Enterprise Search settings)
    record {} user_settings_json?;
    # This structure defines a curated subset of the Enterprise Search settings. (This field together with 'user_settings_override*' and  'user_settings*' defines the total set of Enterprise Search settings)
    EnterpriseSearchSystemSettings system_settings?;
    # An arbitrary YAML object allowing ECE admins to set clusters' parameters (only one of this and 'user_settings_override_json' is allowed), i.e. in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Enterprise Search settings)
    string user_settings_override_yaml?;
    # A docker URI that allows overriding of the default docker image specified for this version
    string docker_image?;
};

# Information about the current, pending, or past Kibana instance plans.
public type KibanaClusterPlansInfo record {
    # Whether the plan situation is healthy (if unhealthy, means the last plan attempt failed)
    boolean healthy;
    # Information about the current, pending, or past Kibana instance plan.
    KibanaClusterPlanInfo current?;
    # Information about the current, pending, or past Kibana instance plan.
    KibanaClusterPlanInfo pending?;
    KibanaClusterPlanInfo[] history;
};

# Describes a resource belonging to a Deployment
public type DeploymentResources record {
    # List of App Search resources in your Deployment
    AppSearchResourceInfo[] appsearch;
    # List of Elasticsearch resources in your Deployment
    ElasticsearchResourceInfo[] elasticsearch;
    # List of Enterprise Search resources in your Deployment
    EnterpriseSearchResourceInfo[] enterprise_search;
    # List of Kibana resources in your Deployment
    KibanaResourceInfo[] kibana;
    # List of Apm resources in your Deployment
    ApmResourceInfo[] apm;
};

# Embedded object that contains information for linking into a specific Kibana page configured via the template.
public type KibanaDeeplink record {
    # Semver condition when to apply the URI.
    string semver;
    # URI to which the user should be directed.
    string uri;
};

# Detailed costs associated to an Elastic Cloud Resource for an organization. All of the costs are expressed in Elastic Consumption Unit (ECU).
public type ItemCosts record {
    # Stock Keeping Unit (SKU)
    string sku;
    # Kind of resource
    string kind;
    # Resource name
    string name;
    # Resource price
    decimal price;
    # Period
    Period period;
    # Number of instances
    int instance_count;
    # Resource usage in hours
    int hours;
    # Price per hour
    decimal price_per_hour;
};

# A URL to access the service of a resource
public type ServiceUrl record {
    # The full URL to access the service
    string url;
    # Name of the service
    string 'service;
};

# Configuration of trust with other clusters.
public type ElasticsearchClusterTrustSettings record {
    # The list of trust relationships with different accounts
    AccountTrustRelationship[] accounts?;
    # The list of trust relationships with external entities
    ExternalTrustRelationship[] 'external?;
};

# Describes an Elasticsearch resource belonging to a Deployment
public type ElasticsearchResourceInfo record {
    # The information for an Elasticsearch cluster.
    ElasticsearchClusterInfo info;
    # The region where this resource exists
    string region;
    # The randomly-generated id of a Resource
    string id;
    # The locally-unique user-specified id of a Resource
    string ref_id;
};

# Describes an Kibana resource belonging to a Deployment
public type KibanaResourceInfo record {
    # The Elasticsearch cluster that this resource depends on.
    string elasticsearch_cluster_ref_id;
    # The top-level object information for a Kibana instance.
    KibanaClusterInfo info;
    # The region where this resource exists
    string region;
    # The randomly-generated id of a Resource
    string id;
    # The locally-unique user-specified id of a Resource
    string ref_id;
};

# The association with a ruleset or user auth token for a deployment, template, or product.
public type FilterAssociation record {
    # ID of the entity, such as the deployment ID or Elasticsearch cluster ID.
    string id;
    # Type of the traffic filter ruleset association, such as 'deployment', 'cluster'
    string entity_type;
};

# Describes an APM resource belonging to a Deployment
public type ApmResourceInfo record {
    # The Elasticsearch cluster that this resource depends on.
    string elasticsearch_cluster_ref_id;
    # The overview information for the APM Server.
    ApmInfo info;
    # The region where this resource exists
    string region;
    # The randomly-generated id of a Resource
    string id;
    # The locally-unique user-specified id of a Resource
    string ref_id;
};

# A response returned from the Deployment update endpoint
public type DeploymentUpdateResponse record {
    # The name of the deployment
    string name;
    # A user-defined alias to use in place of ResourceIds for user-friendly resource URLs
    string alias?;
    # Describes the diagnostics for a given Deployment-modifying payload
    DeploymentDiagnostics diagnostics?;
    # Details about orphaned resources.
    Orphaned shutdown_resources?;
    # The id of the deployment
    string id;
    # List of resources that are part of the deployment after the update operation.
    DeploymentResource[] resources;
};

# A strategy that lets constructor choose the most optimal way to execute the plan.
public type AutodetectStrategyConfig record {
};

# The response model for the API keys.
public type ApiKeysResponse record {
    # The list of API keys.
    ApiKeyResponse[] keys;
};

# An Enterprise Search creation request paired with the alias of the Elasticsearch cluster it should be paired with
public type EnterpriseSearchPayload record {
    # Alias to the Elasticsearch Cluster to attach Enterprise Search to
    string elasticsearch_cluster_ref_id;
    # The human readable name for the Enterprise Search cluster (default: takes the name of its Elasticsearch cluster)
    string display_name?;
    # The settings for the Enterprise Search.
    EnterpriseSearchSettings settings?;
    # The region where this resource exists
    string region;
    # A locally-unique user-specified id for Enterprise Search
    string ref_id;
    # The plan for the Enterprise Search cluster.
    EnterpriseSearchPlan plan;
};

# The body of a request to create a new extension
public type CreateExtensionRequest record {
    # The Elasticsearch version.
    string 'version;
    # The extension type.
    string extension_type;
    # The extension name. Only ASCII alphanumeric and [_.-] characters allowed
    string name;
    # The URL to download the extension archive.
    string download_url?;
    # The extension description.
    string description?;
};

# The APM Server configuration for an Elastic Stack version.
public type StackVersionApmConfig record {
    # Settings that are applied to all nodes of this type
    record {} settings?;
    # List of configuration options that cannot be overridden by user settings
    string[] blacklist;
    # Version of APM
    string 'version?;
    # The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
    StackVersionInstanceCapacityConstraint capacity_constraints?;
    # Node types that are compatible with this one
    string[] compatible_node_types?;
    # Docker image for the APM
    string docker_image;
};

# Information about a system alert on an Elasticsearch cluster.
public type ClusterSystemAlert record {
    # Instance that caused the system alert
    string instance_name;
    # Timestamp marking the system alert
    string timestamp;
    # Type of system alert
    string alert_type;
    # The URL related to the event. Only applicable for alert_type: heap_dump
    string url?;
    # The exit_code related to the event. Only applicable for alert_type: slain
    int exit_code?;
};

# The plan for the Enterprise Search cluster.
public type EnterpriseSearchPlan record {
    EnterpriseSearchTopologyElement[] cluster_topology?;
    # Defines configuration parameters that control how the plan (i.e. consisting of the cluster topology and Enterprise Search settings) is applied
    TransientEnterpriseSearchPlanConfiguration transient?;
    EnterpriseSearchConfiguration enterprise_search;
};

# AppSearch related configuration of an Elastic Stack version
public type StackVersionAppSearchConfig record {
    # Settings that are applied to all nodes of this type
    record {} settings?;
    # Node types that are supported by this stack version
    StackVersionNodeType[] node_types?;
    # List of configuration options that cannot be overridden by user settings
    string[] blacklist;
    # Version of AppSearch
    string 'version?;
    # The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
    StackVersionInstanceCapacityConstraint capacity_constraints?;
    # Node types that are compatible with this one
    string[] compatible_node_types?;
    # Docker image for the AppSearch
    string docker_image;
};

# Information about the App Search Server plan.
public type AppSearchPlanInfo record {
    # If this plan completed or failed (ie is not pending), when the attempt ended (ISO format in UTC)
    string attempt_end_time?;
    # A UUID for each plan attempt
    string plan_attempt_id?;
    ClusterPlanWarning[] warnings;
    # Either the plan ended successfully, or is not yet completed (and no errors have occurred)
    boolean healthy;
    # If this plan is not current or pending, when the plan was no longer active (ISO format in UTC)
    string plan_end_time?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    ClusterPlanStepInfo[] plan_attempt_log;
    # The plan for the App Search cluster.
    AppSearchPlan plan?;
    # A human readable name for each plan attempt, only populated when retrieving plan histories
    string plan_attempt_name?;
    # When this plan attempt (ie to apply the plan to the App Search) started (ISO format in UTC)
    string attempt_start_time?;
};

public type ReplyWarning record {
    # A human readable message describing the warning that occurred
    string message?;
    # A structured code representing the error type that occurred
    string code;
};

# Information about each Kibana instance and APM Server in the Elasticsearch cluster.
public type ClusterInstanceInfo record {
    # List of roles assigned to the service running in the instance. Currently only populated for Elasticsearch, with possible values: master,data,ingest,ml
    string[] service_roles?;
    # The zone in which this instance is being allocated
    string zone?;
    # Whether the container has started (does not tell you anything about the service -ie Elasticsearch- running inside the container)
    boolean container_started;
    # The version of the service that the instance is running (eg Elasticsearch or Kibana), if available
    string service_version?;
    # Whether the instance is healthy (ie started and running)
    boolean healthy;
    # Whether the service is is maintenance mode (meaning that the proxy is not routing external traffic to it)
    boolean maintenance_mode;
    # Whether the instance is healthy (ie started and running)
    string instance_name;
    # Information about a configuration that creates a Kibana instance or APM Server.
    ClusterInstanceConfigurationInfo instance_configuration?;
    # Information about the memory capacity and use of the Kibana instance or APM Server.
    ClusterInstanceMemoryInfo memory?;
    # The service-specific (eg Elasticsearch) id of the node, if available
    string service_id?;
    # Information about the use and storage capacity of a Kibana instance or APM Server.
    ClusterInstanceDiskInfo disk?;
    # A list of the node roles assigned to the service running in the instance. Currently populated only for Elasticsearch.
    string[] node_roles?;
    # The id of the allocator on which this instance is running (if the container is started or starting)
    string allocator_id?;
    # Whether the service launched inside the container -ie Elasticsearch- is actually running
    boolean service_running;
};

# A request for updating a Deployment consisting of multiple resources
public type DeploymentUpdateRequest record {
    # A new name for the deployment, otherwise stays the same.
    string name?;
    # Additional configuration for the new deployment object.
    DeploymentUpdateSettings settings?;
    # Whether or not to prune orphan resources that are no longer mentioned in this request. Note that resourcesare tracked by ref_id, and if a resource's ref_id is changed, any previous running resources created with that previousref_id are considered to be orphaned as well.
    boolean prune_orphans;
    # A user-defined alias to use in place of Cluster IDs for user-friendly URLs
    string alias?;
    # Describes the Deployment resource updates
    DeploymentUpdateResources resources?;
    # Additional information about the current deployment object.
    DeploymentUpdateMetadata metadata?;
};

# An Elasticsearch search request with a subset of options.
public type SearchRequest record {
    # An array of fields to sort the search results by.
    record {}[] sort?;
    # The container for all of the allowed Elasticsearch queries. Specify only one property each time.
    QueryContainer query?;
    int 'from?;
    # The maximum number of search results to return.
    int size?;
};

# The configuration settings for the timeout and fallback parameters.
public type KibanaPlanControlConfiguration record {
    # Set to 'forced' to force a reboot as part of the upgrade plan
    string cluster_reboot?;
    # If true (default false), does not clear the maintenance flag (which prevents its API from being accessed except by the constructor) on new instances added until after a snapshot has been restored, otherwise, the maintenance flag is cleared once the new instances successfully join the new cluster
    boolean extended_maintenance?;
    # This timeout determines how long to give a cluster after it responds to API calls before performing actual operations on it. It defaults to 5s
    int calm_wait_time?;
    # The total timeout in seconds after which the plan is cancelled even if it is not complete. Defaults to 4x the max memory capacity per node (in MB)
    int timeout?;
};

# The request payload that deletes the API keys.
public type DeleteApiKeysRequest record {
    # The list of API key IDs.
    string[] keys;
};

# Observability information for a deployment
public type DeploymentObservability record {
    # Whether the deployment observability is healthy or not (one or more of the subsections will have healthy: false)
    boolean healthy;
    # Metrics information for a deployment
    DeploymentMetrics metrics?;
    # Logging information for a deployment
    DeploymentLogging logging?;
    # General observability health issues for the deployment
    ObservabilityIssue[] issues?;
};

# Detailed costs for a deployment for an organization. All of the costs are expressed in Elastic Consumption Unit (ECU).
public type DeploymentCosts record {
    # Elasticsearch deployment id
    string deployment_id;
    # Costs overview for an organization. All of the costs, credits, trials are expressed in Elastic Consumption Unit (ECU).
    Costs costs;
    # Period
    Period period?;
    # Elasticsearch deployment name
    string deployment_name;
    # Price per hour
    decimal hourly_rate;
};

# Additional configuration for the new deployment object.
public type DeploymentUpdateSettings record {
    # The observability settings for a deployment
    DeploymentObservabilitySettings observability?;
};

# The configuration for the restore command, such as which indices you want to restore.
public type RestoreSnapshotApiConfiguration record {
    # The list of indices to restore (supports +ve and -ve selection and wildcarding - see the default Elasticsearch index format documentation)
    string[] indices?;
    # This JSON object (merged with the 'indices' field (if present) is passed untouched into the restore command - see the Elasticsearch '_snapshot' documentation for more details on supported formats
    record {} raw_settings?;
};

# A collection of extensions
public type Extensions record {
    # The list of extensions.
    Extension[] extensions;
};

# A query for documents that match boolean combinations of other queries.
public type BoolQuery record {
    QueryContainer[] filter?;
    # The minimum number of optional should clauses to match.
    int minimum_should_match?;
    QueryContainer[] should?;
    QueryContainer[] must_not?;
    QueryContainer[] must?;
};

# Logging information for a deployment
public type DeploymentLogging record {
    # Whether the deployment logging is healthy or not
    boolean healthy;
    # Logging health issues for the deployment
    ObservabilityIssue[] issues?;
    # The URLs to view this deployment's logs in Kibana
    record {} urls?;
};

# Describes an App Search resource belonging to a Deployment
public type AppSearchResourceInfo record {
    # The Elasticsearch cluster that this resource depends on.
    string elasticsearch_cluster_ref_id;
    # The overview information for the App Search Server.
    AppSearchInfo info;
    # The region where this resource exists
    string region;
    # The randomly-generated id of a Resource
    string id;
    # The locally-unique user-specified id of a Resource
    string ref_id;
};

public type BasicFailedReply record {
    # A list of errors that occurred in the failing request
    BasicFailedReplyElement[] errors;
};

# DTS Rate
public type DtsRate record {
    # Rate in human readable format
    string formatted_value;
    # Raw rate
    decimal value;
};

# The index curation settings for an Elasticsearch cluster.
public type ClusterCurationSettings record {
    # Specifications for curation
    ClusterCurationSpec[] specs;
};

# Information about a configuration that creates a Kibana instance or APM Server.
public type ClusterInstanceConfigurationInfo record {
    # The resource type of the instance configuration
    string 'resource;
    # The id of the configuration used to create the instance
    string id;
    # The name of the configuration used to create the instance
    string name;
};

# The body of a request to update an extension
public type UpdateExtensionRequest record {
    # The Elasticsearch version.
    string 'version;
    # The extension type.
    string extension_type;
    # The extension name.
    string name;
    # The URL to download the extension archive.
    string download_url?;
    # The extension description.
    string description?;
};

# A query for documents that contain the specified term in the inverted index.
public type TermQuery record {
    # The exact value to query for.
    record {} value;
};

# A strategy that creates new Elasticsearch instances, Kibana instances, and APM Servers with the new plan, then migrates the node data to minimize the amount of spare capacity.
public type RollingGrowShrinkStrategyConfig record {
};

# Information about current, pending, and past APM Server plans.
public type ApmPlansInfo record {
    # Whether the plan situation is healthy (if unhealthy, means the last plan attempt failed)
    boolean healthy;
    # Information about the APM Server plan.
    ApmPlanInfo current?;
    # Information about the APM Server plan.
    ApmPlanInfo pending?;
    ApmPlanInfo[] history;
};

# Metrics information for a deployment
public type DeploymentMetrics record {
    # Whether the deployment metrics are healthy or not
    boolean healthy;
    # Metrics health issues for the deployment
    ObservabilityIssue[] issues?;
    # The URLs to view this deployment's metrics in Kibana
    record {} urls?;
};

# Line Item
public type SimplifiedLineItem record {
    # Start of the line item's validity
    string 'start;
    # Elastic Consumption Unit (ECU) Balance
    decimal ecu_balance;
    # Expiration of the line item
    string end;
    # Line Item ID
    string id;
    # Original Elastic Consumption Unit (ECU) quantity
    decimal ecu_quantity;
};

# Information about the current, pending, and past Elasticsearch cluster plans.
public type ElasticsearchClusterPlansInfo record {
    # Whether the plan situation is healthy (if unhealthy, means the last plan attempt failed)
    boolean healthy;
    # Information about the Elasticsearch cluster plan.
    ElasticsearchClusterPlanInfo current?;
    # Information about the Elasticsearch cluster plan.
    ElasticsearchClusterPlanInfo pending?;
    ElasticsearchClusterPlanInfo[] history;
};

# The plan for the Kibana instance.
public type KibanaClusterPlan record {
    KibanaClusterTopologyElement[] cluster_topology?;
    # Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and Kibana instance settings.
    TransientKibanaPlanConfiguration transient?;
    # The Kibana instance settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
    KibanaConfiguration kibana;
};

# Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and Kibana instance settings.
public type TransientKibanaPlanConfiguration record {
    # The configuration settings for the timeout and fallback parameters.
    KibanaPlanControlConfiguration plan_configuration?;
    # The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
    PlanStrategy strategy?;
};

# The configuration settings for the traffic filter.
public type TrafficFilterSettings record {
    # IDs of the traffic filter rulesets
    string[] rulesets;
};

public type EnterpriseSearchPlanControlConfiguration record {
    # Set to 'forced' to force a reboot as part of the upgrade plan
    string cluster_reboot?;
    AllocatorMoveRequest[] move_allocators?;
    # If true (default: false) does not allow re-using any existing instances currently in the cluster, i.e. even unchanged instances will be re-created
    boolean reallocate_instances?;
    # List of allocators on which instances are placed if possible (if not possible/not specified then any available allocator with space is used)
    string[] preferred_allocators?;
    # This timeout determines how long to give a cluster after it responds to API calls before performing actual operations on it. It defaults to 5s
    int calm_wait_time?;
    # The total timeout in seconds after which the plan is cancelled even if it is not complete. Defaults to 4x the max memory capacity per node (in MB)
    int timeout?;
    # If true (default false), does not clear the maintenance flag (which prevents its API from being accessed except by the constructor) on new instances added until after a snapshot has been restored, otherwise, the maintenance flag is cleared once the new instances successfully join the new cluster
    boolean extended_maintenance?;
    InstanceMoveRequest[] move_instances?;
};

# An API extension. It represents clusters' plugins and bundles
public type Extension record {
    # The extension description.
    string description?;
    # The extension URL to be used in the plan.
    string url;
    # The extension type.
    string extension_type;
    # The download URL specified during extension creation.
    string download_url?;
    # List of deployments using this extension. Up to only 10000 deployments will be included in the list.
    string[] deployments?;
    # The Elasticsearch version.
    string 'version;
    ExtensionFileMetadata file_metadata?;
    # The extension ID
    string id;
    # The extension name.
    string name;
};

# The top-level configuration settings for the Elasticsearch cluster.
public type ClusterMetadataSettings record {
    # The display name of the cluster
    string name?;
};

# Envelope holding the newly-reset password for a cluster's user
public type ElasticsearchElasticUserPasswordResetResponse record {
    # The username for the newly-reset password for the given Elasticsearch cluster
    string username;
    # The newly-reset password for the given Elasticsearch cluster
    string password;
};

# Information about an issue and the Elasticsearch instance it affects.
public type ElasticsearchClusterBlockingIssueElement record {
    # A list of instances that are affected by the issue
    string[] instances;
    # Description of the issue
    string description;
};

# Information about the shards and replicas that comprise the Elasticsearch indices.
public type ElasticsearchShardsInfo record {
    # Whether the shard situation is healthy (any unavailable shards is unhealthy)
    boolean healthy;
    ElasticsearchShardElement[] unavailable_shards;
    ElasticsearchReplicaElement[] unavailable_replicas;
    ElasticsearchShardElement[] available_shards;
};

# The settings for the APM Server.
public type ApmSettings record {
    # The top-level configuration settings for the Elasticsearch cluster.
    ClusterMetadataSettings metadata?;
};

# Holds diagnostics for an AppSearch resource
public type AppSearch record {
    # The user-specified id of the Elasticsearch Cluster that this will link to
    string elasticsearch_cluster_ref_id;
    # The backend plan as JSON
    record {} backend_plan;
    # The human readable name (defaults to the generated cluster id if not specified)
    string display_name;
    # A locally-unique user-specified id
    string ref_id;
};

# A response returned from the Deployment shutdown endpoint
public type DeploymentShutdownResponse record {
    # The id of the deployment
    string id;
    # Details about orphaned resources.
    Orphaned orphaned?;
    # The name of the deployment
    string name;
};

# Settings related to the level of trust of the clusters in this account
public type AccountTrustSettings record {
    # If true, all clusters in this account will by default trust all other clusters in the same account
    boolean trust_all;
};

# Configures the location of a remote repository. The default is the system repository.
public type RestoreSnapshotRepoConfiguration record {
    # The remote snapshot settings raw JSON - see the Elasticsearch '_snapshot' documentation for more details on supported formats
    record {} raw_settings?;
};

# Information about the shards for each Elasticsearch instance container that hosts an Elasticsearch node. TIP: When the shard is unavailable, the cluster is unable to serve all of the data.
public type ElasticsearchShardElement record {
    # The Elastic Cloud name/id of the instance (container)
    string instance_name;
    # The number of shards of the given type (available/unavailable) on this instance
    int shard_count;
};

# The details for an Elastic Stack configuration.
public type StackVersionConfig record {
    # Whether or not this version is accessible by the calling user. This is only relevant in EC (SaaS) and is not sent in ECE.
    boolean accessible?;
    # The minimum version recommended to upgrade this version.
    string min_upgradable_from?;
    # Identifies that the Elastic Stack version is marked for deletion
    boolean deleted?;
    # Whether or not this version is whitelisted. This is only relevant in EC (SaaS) and is not sent in ECE.
    boolean whitelisted?;
    # The Kibana configuration for an Elastic Stack version.
    StackVersionKibanaConfig kibana;
    # Stack Versions that this version can upgrade to
    string[] upgradable_to;
    # Stack version
    string 'version?;
    # The Elasticsearch configuration for an Elastic Stack version. 
    StackVersionElasticsearchConfig elasticsearch;
    # The template information for an Elastic Stack version.
    StackVersionTemplateInfo template;
    # The APM Server configuration for an Elastic Stack version.
    StackVersionApmConfig apm?;
    # AppSearch related configuration of an Elastic Stack version
    StackVersionAppSearchConfig appsearch?;
    # The metadata for the Elastic Stack.
    StackVersionMetadata metadata?;
};

# The response model for an API key.
public type ApiKeyResponse record {
    # The date/time for when the API key is created.
    string creation_date;
    # The user ID.
    string user_id?;
    # The API key ID.
    string id;
    # The API key. TIP: Since the API key is returned only once, save it in a safe place.
    string 'key?;
    # The API key description. TIP: Useful when you have multiple API keys.
    string description;
};

# The Kibana configuration for an Elastic Stack version.
public type StackVersionKibanaConfig record {
    # Settings that are applied to all nodes of this type
    record {} settings?;
    # List of configuration options that cannot be overridden by user settings
    string[] blacklist;
    # Version of Kibana
    string 'version?;
    # The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
    StackVersionInstanceCapacityConstraint capacity_constraints?;
    # Node types that are compatible with this one
    string[] compatible_node_types?;
    # Docker image for the kibana
    string docker_image;
};

# Enables scripting for the specified type and controls other parameters. Store scripts in indexes (`stored`), upload in file bundles (`file`), or use in API requests (`inline`).
public type ElasticsearchScriptTypeSettings record {
    # If enabled (default: true) then scripts are enabled, either for sandboxing languages (by default), or for all installed languages if 'sandbox_mode' is disabled (or for 6.x). NOTES: (Corresponds to the parameter 'script.file|stored/indexed|inline')
    boolean enabled?;
    # If enabled (default: true) and this script type is enabled, then only the sandbox languages are allowed. By default the sandbox languages are painless, expressions and mustache, but this can be restricted via the 'painless_enabled', 'mustache_enabled' 'expression_enabled' settings.NOTES: Not supported in 6.x. (Corresponds to the parameters 'script.engine.[painless|mustache|expressions].[file|stored|inline]')
    boolean sandbox_mode?;
};

# A structure that defines a curated subset of the APM Server settings. 
# TIP: To define the complete set of APM Server setting, use `ApmSystemSettings` with `user_settings_override_` and `user_settings_`.
public type ApmSystemSettings record {
    # Optionally override the URL to which to send data (for advanced users only, if unspecified the system selects an internal URL)
    string elasticsearch_url?;
    # Optionally override the secret token within APM - defaults to the previously existing secretToken
    string secret_token?;
    # Optionally override the account within APM - defaults to a system account that always exists (if specified, the username must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_password?;
    # Optionally enable debug mode for APM servers - defaults false
    boolean debug_enabled?;
    # Optionally override the URL to which to send data (for advanced users only, if unspecified the system selects an internal URL)
    string kibana_url?;
    # Optionally override the account within APM - defaults to a system account that always exists (if specified, the password must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_username?;
};

# Information about the Enterprise Search Server plan.
public type EnterpriseSearchPlanInfo record {
    # If this plan completed or failed (ie is not pending), when the attempt ended (ISO format in UTC)
    string attempt_end_time?;
    # A UUID for each plan attempt
    string plan_attempt_id?;
    ClusterPlanWarning[] warnings;
    # Either the plan ended successfully, or is not yet completed (and no errors have occurred)
    boolean healthy;
    # If this plan is not current or pending, when the plan was no longer active (ISO format in UTC)
    string plan_end_time?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    ClusterPlanStepInfo[] plan_attempt_log;
    # The plan for the Enterprise Search cluster.
    EnterpriseSearchPlan plan?;
    # A human readable name for each plan attempt, only populated when retrieving plan histories
    string plan_attempt_name?;
    # When this plan attempt (ie to apply the plan to the Enterprise Search) started (ISO format in UTC)
    string attempt_start_time?;
};

# The settings for the App Search.
public type AppSearchSettings record {
    # The top-level configuration settings for the Elasticsearch cluster.
    ClusterMetadataSettings metadata?;
};

# A Kibana creation request paired with the alias of the Elasticsearch cluster it should be paired with
public type KibanaPayload record {
    # Alias to the Elasticsearch Cluster to attach Kibana to
    string elasticsearch_cluster_ref_id;
    # The human readable name for the Kibana cluster (default: takes the name of its Elasticsearch cluster)
    string display_name?;
    # The settings for multiple Kibana instances.
    KibanaClusterSettings settings?;
    # The region where this resource exists
    string region;
    # A locally-unique user-specified id for Kibana
    string ref_id;
    # The plan for the Kibana instance.
    KibanaClusterPlan plan;
};

# Information about the APM Server plan.
public type ApmPlanInfo record {
    # If this plan completed or failed (ie is not pending), when the attempt ended (ISO format in UTC)
    string attempt_end_time?;
    # A UUID for each plan attempt
    string plan_attempt_id?;
    ClusterPlanWarning[] warnings;
    # Either the plan ended successfully, or is not yet completed (and no errors have occurred)
    boolean healthy;
    # If this plan is not current or pending, when the plan was no longer active (ISO format in UTC)
    string plan_end_time?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    ClusterPlanStepInfo[] plan_attempt_log;
    # The plan for the APM Server.
    ApmPlan plan?;
    # A human readable name for each plan attempt, only populated when retrieving plan histories
    string plan_attempt_name?;
    # When this plan attempt (ie to apply the plan to the APM) started (ISO format in UTC)
    string attempt_start_time?;
};

# Consumes and analyzes text, numbers, and dates, then constructs a query.
public type MatchQuery record {
    # The operator flag can be set to or or and to control the boolean clauses (defaults to or).
    string operator?;
    # The text/numeric/date to query for.
    string query;
    # The minimum number of optional should clauses to match.
    int minimum_should_match?;
    # The analyzer that will be used to perform the analysis process on the text. Defaults to the analyzer that was used to index the field.
    string analyzer?;
};

# Information about a step in a plan.
public type ClusterPlanStepInfo record {
    # The status of the step (success, warning, error - warning means something didn't go as expected but it was not serious enough to abort the plan)
    string status;
    # When the step started (ISO format in UTC)
    string started;
    # The duration of the step in MS
    int duration_in_millis?;
    # When the step completed (ISO format in UTC)
    string completed?;
    # ID of current step
    string step_id;
    # Human readable summaries of the step, including messages for each stage of the step
    ClusterPlanStepLogMessageInfo[] info_log;
    # Current stage that the step is in
    string stage;
};

# Additional information about the current deployment object.
public type DeploymentUpdateMetadata record {
    # Arbitrary user-defined metadata associated with this deployment
    MetadataItem[] tags?;
};

# The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
public type StackVersionInstanceCapacityConstraint record {
    # Max capacity of the instances
    int max;
    # Min capacity of the instances
    int min;
};

# The configuration for an Elastic Stack node type.
public type StackVersionNodeType record {
    # Flag to specify a node type is mandatory in a cluster's plan
    boolean mandatory?;
    # Name of the node type
    string name;
    # Settings that are applied to all nodes of this type
    record {} settings?;
    # Type of the node (master, data, ...)
    string node_type;
    # The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
    StackVersionInstanceCapacityConstraint capacity_constraints?;
    # Node types that are compatible with this one
    string[] compatible_node_types?;
    # Description of the node type
    string description;
};

# The container for all of the allowed Elasticsearch queries. Specify only one property each time.
public type QueryContainer record {
    # A query that matches all documents.
    MatchAllQuery match_all?;
    # Matches documents that have at least one non-`null` value in the original field.
    ExistsQuery exists?;
    record {} term?;
    # A query that matches nested objects.
    NestedQuery nested?;
    record {} prefix?;
    # A query for documents that match boolean combinations of other queries.
    BoolQuery bool?;
    # A query that uses the `SimpleQueryParser` for parsing.
    QueryStringQuery query_string?;
    record {} range?;
    # A query that doesn't match any documents.
    MatchNoneQuery match_none?;
    record {} 'match?;
};

# Defines the topology of the AppSearch nodes (eg number/capacity of nodes, and where they can be allocated)
public type AppSearchTopologyElement record {
    AppSearchConfiguration appsearch?;
    # Node types to enable for an AppSearch instance
    AppSearchNodeTypes node_type?;
    # Controls the allocation of this topology element as well as allowed sizes and node_types. It needs to match the id of an existing instance configuration.
    string instance_configuration_id?;
    # number of zones in which nodes will be placed
    int zone_count?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize size?;
};

# The template file hash for an Elastic Stack version.
public type StackVersionTemplateFileHash record {
    # File path relative to template's root
    string path;
    # SHA-256 hash of a file
    string hash;
};

# Details about an orphaned Elasticsearch resources.
public type OrphanedElasticsearch record {
    # List of orphaned dependent resources
    ElasticsearchDependant[] dependents;
    # The id of the orphaned resource
    string id;
};

# Information about the master nodes in the Elasticsearch cluster.
public type ElasticsearchMasterInfo record {
    # Whether the master situation in the cluster is healthy (ie is the number of masters != 1), or do any instances have no master
    boolean healthy;
    # A list of any instances with no master
    string[] instances_with_no_master;
    ElasticsearchMasterElement[] masters;
};

# A list of admin-uploaded plugin objects.
public type ElasticsearchUserPlugin record {
    # The URL of the plugin (must be accessible from the ECE infrastructure)
    string url;
    # The name of the plugin
    string name;
    # The supported Elasticsearch version (must match the version in the plan)
    string elasticsearch_version;
};

# Defines configuration parameters that control how the plan (i.e. consisting of the cluster topology and Enterprise Search settings) is applied
public type TransientEnterpriseSearchPlanConfiguration record {
    EnterpriseSearchPlanControlConfiguration plan_configuration?;
    # The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
    PlanStrategy strategy?;
};

# The overview information for the Enterprise Search Server.
public type EnterpriseSearchInfo record {
    # Enterprise Search status
    string status;
    # The name of the Enterprise Search
    string name;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
    # Information about the specified Elasticsearch cluster.
    TargetElasticsearchCluster elasticsearch_cluster;
    # Whether the Enterprise Search is healthy or not (one or more of the info subsections will have healthy: false)
    boolean healthy;
    # The region that this Enterprise Search belongs to. Only populated in SaaS or federated ECE.
    string region?;
    # The settings for the Enterprise Search.
    EnterpriseSearchSettings settings?;
    # Information about current, pending, and past Enterprise Search Server plans.
    EnterpriseSearchPlansInfo plan_info;
    # External resources related to the Enterprise Search
    ExternalHyperlink[] external_links;
    # The id of the deployment that this Enterprise Search belongs to.
    string deployment_id?;
    # The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
    ClusterTopologyInfo topology;
    # The id of the Enterprise Search
    string id;
    # Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
    ClusterMetadataInfo metadata?;
};

# Describes a searched Deployment
public type DeploymentSearchResponse record {
    # The name of this deployment
    string name;
    # Additional configuration about the current deployment object.
    DeploymentSettings settings?;
    # Whether the deployment is overall healthy or not (one or more of the resource info subsections will have healthy: false)
    boolean healthy;
    # A user-defined deployment alias for user-friendly resource URLs
    string alias?;
    # A randomly-generated id of this Deployment
    string id;
    # Describes a resource belonging to a Deployment
    DeploymentResources resources;
    # Additional information about the current deployment object.
    DeploymentMetadata metadata?;
};

# Defines configuration parameters that control how the plan (ie consisting of the cluster topology and AppSearch settings) is applied
public type TransientAppSearchPlanConfiguration record {
    AppSearchPlanControlConfiguration plan_configuration?;
    # The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
    PlanStrategy strategy?;
};

# This structure defines a curated subset of the AppSearch settings. (This field together with 'user_settings_override*' and  'user_settings*' defines the total set of AppSearch settings)
public type AppSearchSystemSettings record {
    # Optionally override the account within App Search - defaults to a system account that always exists (if specified, the username must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_password?;
    # Optionally override the account within App Search - defaults to a system account that always exists (if specified, the password must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_username?;
    # Optionally override the secret session key within App Search - defaults to the previously existing secretSession. Note that this field is never returned from the API, it is write only.
    string secret_session_key?;
    # Optionally override the URL to which to send data (for advanced users only, if unspecified the system selects an internal URL)
    string elasticsearch_url?;
};

# The top level costs overview for an organization. All of the costs, credits, trials are expressed in Elastic Consumption Unit (ECU).
public type CostsOverview record {
    # Trial costs for the organization
    decimal trials;
    # Costs overview for an organization. All of the costs, credits, trials are expressed in Elastic Consumption Unit (ECU).
    Costs costs;
    # The available balance for an organization
    Balance balance?;
    # Hourly rate applied.
    decimal hourly_rate;
};

# A request to update an account
public type AccountUpdateRequest record {
    # Settings related to the level of trust of the clusters in this account
    AccountTrustSettings trust?;
};

# As part of the upgrade plan, identifies the move requests for the Kibana instances or APM Servers on the allocators.
public type AllocatorMoveRequest record {
    # An optional list of allocator ids to which the instance(s) should be moved. If not specified then any available allocator can be used (including the current one if it is healthy)
    string[] to?;
    # The allocator id off which all instances in the cluster should be moved
    string 'from;
    # Tells the infrastructure that all instances on the allocator should be considered as permanently down when deciding how to migrate data to new nodes. If left blank then the system will auto-decide (currently: will treat the allocator as up)
    boolean allocator_down?;
};

# Holds diagnostics for a Kibana resource
public type Kibana record {
    # The user-specified id of the Elasticsearch Cluster that this will link to
    string elasticsearch_cluster_ref_id;
    # The backend plan as JSON
    record {} backend_plan;
    # The human readable name (defaults to the generated cluster id if not specified)
    string display_name;
    # A locally-unique user-specified id
    string ref_id;
};

# Specifies the conditions to trigger an Elasticsearch cluster curation.
public type ClusterCurationSpec record {
    # Index matching pattern
    string index_pattern;
    # Number of seconds after index creation to trigger this spec
    int trigger_interval_seconds;
};

# An index pattern described indicating how it has to be migrated to ILM.
public type IndexPattern record {
    # Index pattern to which the ILM policy will be applied.
    string index_pattern;
    # Defines the Elasticsearch node attributes for the warm element of the topology
    record {} node_attributes?;
    # Name of the policy to create
    string policy_name;
};

# A subset of Elasticsearch settings. TIP: To define the complete set of Elasticsearch settings, use `ElasticsearchSystemSettings` with `user_settings_override*` and `user_settings*`.
public type ElasticsearchSystemSettings record {
    # Limits remote Elasticsearch clusters that can be used as the source for '_reindex' API commands
    string[] reindex_whitelist?;
    # (2.x only - to get the same result in 5.x template mappings must be used) Sets the default number of shards per index, defaulting to 1 if not specified. (Corresponds to the parameter 'index.number_of_shards' in 2.x, not supported in 5.x)
    int default_shards_per_index?;
    # The duration for which monitoring history is stored (format '(NUMBER)d' eg '3d' for 3 days). NOTES: ('Corresponds to the parameter xpack.monitoring.history.duration' in 5.x, defaults to '7d')
    string monitoring_history_duration?;
    # The default interval at which monitoring information from the cluster if collected, if monitoring is enabled. NOTES: (Corresponds to the parameter 'marvel.agent.interval' in 2.x and 'xpack.monitoring.collection.interval' in 5.x)
    int monitoring_collection_interval?;
    # If true (default is false) then the index deletion API will not support wildcards or '_all'. NOTES: (Corresponds to the parameter 'action.destructive_requires_name')
    boolean destructive_requires_name?;
    # If true (the default), then any write operation on an index that does not currently exist will create it. NOTES: (Corresponds to the parameter 'action.auto_create_index')
    boolean auto_create_index?;
    # The trigger engine for Watcher, defaults to 'scheduler' - see the xpack documentation for more information. NOTES: (Corresponds to the parameter '(xpack.)watcher.trigger.schedule.engine', depending on version. Ignored from 6.x onwards.)
    string watcher_trigger_engine?;
    # Whether to factor in the available disk space on a node before deciding whether to allocate new shards to that node or actively relocate shards away from the node (default: true). NOTES: (Corresponds to the parameter 'cluster.routing.allocation.disk.threshold_enabled')
    boolean use_disk_threshold?;
    # Controls the languages supported by the Elasticsearch cluster, such as Painless, Mustache, and Expressions. Controls how the languages are used, such as file, index, and inline. TIP: For complex configurations, leave these blank and configure these settings in the user YAML or JSON.
    ElasticsearchScriptingUserSettings scripting?;
    # Defaults to false on versions <= 7.2.0, true otherwise. If false, then the API commands to close indices are disabled. This is important because Elasticsearch does not snapshot or migrate close indices on versions under 7.2.0, therefore standard Elastic Cloud configuration operations will cause irretrievable loss of indices' data. NOTES: (Corresponds to the parameter 'cluster.indices.close.enable')
    boolean enable_close_index?;
};

public type BasicFailedReplyElement record {
    # If the error can be tied to a specific field or fields in the user request, this lists those fields
    string[] fields?;
    # A human readable message describing the error that occurred
    string message;
    # A structured code representing the error type that occurred
    string code;
};

# Details about orphaned resources.
public type Orphaned record {
    # List of orphaned AppSearch resource ids
    string[] appsearch;
    # List of orphaned Elasticsearch resources
    OrphanedElasticsearch[] elasticsearch;
    # List of orphaned Enterprise Search resource ids
    string[] enterprise_search;
    # List of orphaned Kibana resource ids
    string[] kibana;
    # List of orphaned APM resource ids
    string[] apm;
};

# A subset of Kibana settings. TIP: To define the complete set of Elasticsearch settings, use `KibanaSystemSettings` with `user_settings_override_` and `user_settings_`.
public type KibanaSystemSettings record {
    # Optionally override the account within Elasticsearch - defaults to a system account that always exists (if specified, the username must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_password?;
    # Optionally override the account within Elasticsearch - defaults to a system account that always exists (if specified, the password must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_username?;
    # Optionally override the URL to which to send data (for advanced users only, if unspecified the system selects an internal URL)
    string elasticsearch_url?;
};

# The details for multiple Elastic Stack configurations.
public type StackVersionConfigs record {
    StackVersionConfig[] stacks;
};

# The information about an Elasticsearch cluster user.
public type ElasticsearchClusterUser record {
    # The username
    string username;
    # The hashed password
    string password_hash;
};

# Information about the use and storage capacity of a Kibana instance or APM Server.
public type ClusterInstanceDiskInfo record {
    # If known, the amount of total disk space available to the container in MB
    int disk_space_available?;
    # The storage multiplier originally defined to calculate disk space.
    decimal storage_multiplier;
    # The amount of disk space being used by the service in MB
    int disk_space_used;
};

# The Elasticsearch resource used as a Remote Cluster.
public type RemoteResourceRef record {
    # Information about a Remote Cluster.
    RemoteResourceInfo info?;
    # The locally-unique user-specified id of an Elasticsearch Resource
    string elasticsearch_ref_id;
    # The id of the deployment
    string deployment_id;
    # If true, skip this cluster during search if it is disconnected. Default: false
    boolean skip_unavailable?;
    # The alias for this remote cluster. Aliases must only contain letters, digits, dashes and underscores
    string alias;
};

# Information about the snapshot status for the Elasticsearch cluster. For example, the health status.
public type SnapshotStatusInfo record {
    # Number of snapshots stored for this cluster
    int count;
    # Scheduled time of next snapshot attempt
    string scheduled_time?;
    # The end time of the most recently attempted snapshot
    string latest_end_time?;
    # Health status of snapshots for this cluster
    boolean healthy;
    # Latest snapshot status
    boolean latest_successful?;
    # Indicates whether the cluster has a relatively recent successful snapshot.
    boolean recent_success;
    # The end time of the most recently successful snapshot
    string latest_successful_end_time?;
    # Status of the latest snapshot attempt, if any exist.
    string latest_status?;
};

# Read-only mode request payload
public type ReadOnlyRequest record {
    # Enabled or disabled read-only mode
    boolean enabled;
};

# Information about the ports that allow communication between the Elasticsearch cluster and various protocols.
public type ClusterMetadataPortInfo record {
    # Port where the cluster listens for transport traffic using TLS
    int transport_passthrough;
    # Port where the cluster listens for HTTP traffic
    int http;
    # Port where the cluster listens for HTTPS traffic
    int https;
};

# A response returned from the Deployment restore endpoint
public type DeploymentRestoreResponse record {
    # The id of the deployment
    string id;
};

# Controls for the topology element. Only used as part of the deployment template. Ignored if included as part of a deployment.
public type TopologyElementControl record {
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize min;
};

# DTS quantity
public type DtsQuantity record {
    # Quantity in human readable format
    string formatted_value;
    # Raw quantity
    int value;
};

# Information about a Remote Cluster.
public type RemoteResourceInfo record {
    # Whether or not the remote cluster is healthy
    boolean healthy;
    # Whether or not the remote cluster version is compatible with this cluster version.
    boolean compatible;
    # Whether or not there is at least one connection to the remote cluster.
    boolean connected;
    # Whether or not the remote cluster is trusted by this cluster.
    boolean trusted;
    # Whether or not the remote cluster trusts this cluster back.
    boolean trusted_back;
};

# Information about the Elasticsearch cluster plan.
public type ElasticsearchClusterPlanInfo record {
    # If this plan completed or failed (ie is not pending), when the attempt ended (ISO format in UTC)
    string attempt_end_time?;
    # A UUID for each plan attempt
    string plan_attempt_id?;
    ClusterPlanWarning[] warnings;
    # Either the plan ended successfully, or is not yet completed (and no errors have occurred)
    boolean healthy;
    # If this plan is not current or pending, when the plan was no longer active (ISO format in UTC)
    string plan_end_time?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    ClusterPlanStepInfo[] plan_attempt_log;
    # The plan for the Elasticsearch cluster.
    ElasticsearchClusterPlan plan?;
    # A human readable name for each plan attempt, only populated when retrieving plan histories
    string plan_attempt_name?;
    # When this plan attempt (ie to apply the plan to the cluster) started (ISO format in UTC)
    string attempt_start_time?;
};

# The top-level object information for a Kibana instance.
public type KibanaClusterInfo record {
    # Cluster status
    string status;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
    # Information about the specified Elasticsearch cluster.
    TargetElasticsearchCluster elasticsearch_cluster;
    # Whether the cluster is healthy or not (one or more of the info subsections will have healthy: false)
    boolean healthy;
    # The region that this cluster belongs to. Only populated in SaaS or federated ECE.
    string region?;
    # The settings for multiple Kibana instances.
    KibanaClusterSettings settings?;
    # The name of the cluster
    string cluster_name;
    # Information about the current, pending, or past Kibana instance plans.
    KibanaClusterPlansInfo plan_info;
    # The id of the cluster
    string cluster_id;
    # External resources related to the cluster
    ExternalHyperlink[] external_links;
    # The id of the deployment to which this Kibana Server belongs to.
    string deployment_id?;
    # The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
    ClusterTopologyInfo topology;
    # Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
    ClusterMetadataInfo metadata;
};

# Describes an Enterprise Search resource belonging to a Deployment
public type EnterpriseSearchResourceInfo record {
    # The Elasticsearch cluster that this resource depends on.
    string elasticsearch_cluster_ref_id;
    # The overview information for the Enterprise Search Server.
    EnterpriseSearchInfo info;
    # The region where this resource exists
    string region;
    # The randomly-generated id of a Resource
    string id;
    # The locally-unique user-specified id of a Resource
    string ref_id;
};

# Instance sizes that are supported by the Elasticsearch instance, Kibana instance, or APM Server configuration.
public type DiscreteSizes record {
    # The default size
    int default_size;
    # The unit that each size represents
    string 'resource;
    # List of supported sizes
    int[] sizes;
};

# The topology of the Kibana nodes, including the number, capacity, and type of nodes, and where they can be allocated.
public type KibanaClusterTopologyElement record {
    # Controls the allocation of this topology element as well as allowed sizes and node_types. It needs to match the id of an existing instance configuration.
    string instance_configuration_id?;
    # number of zones in which nodes will be placed
    int zone_count?;
    # The Kibana instance settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
    KibanaConfiguration kibana?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize size?;
};

# Costs associated to a set of Elastic Cloud resources for an organization. All of the costs are expressed in Elastic Consumption Unit (ECU).
public type ItemsCosts record {
    # Costs overview for an organization. All of the costs, credits, trials are expressed in Elastic Consumption Unit (ECU).
    Costs costs;
    # Costs of the list of resources
    ItemCosts[] resources;
    # List of the detailed costs associated to the Data Transfer and Storage (DTS) dimensions
    DtsDimensionCosts[] data_transfer_and_storage;
};

# Information about the specified Elasticsearch cluster.
public type TargetElasticsearchCluster record {
    # The Elasticsearch cluster Id
    string elasticsearch_id;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
};

# Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
public type ClusterMetadataInfo record {
    # The DNS name of the cluster endpoint, if available
    string endpoint?;
    # The cloud ID, an encoded string that provides other Elastic services with the necessary information to connect to this Elasticsearch and Kibana (only present if both exist)
    string cloud_id?;
    # The most recent time the cluster metadata was changed (ISO format in UTC)
    string last_modified;
    # The DNS name of the cluster endpoint derived from the deployment alias, if available
    string aliased_endpoint?;
    # An unstructured JSON representation of the public and internal state (can be filtered out via URL parameter). The contents and structure of the `raw` field can change at any time. 
    record {} raw?;
    # The resource version number of the cluster metadata
    int 'version;
    # The full URL to access this deployment resource
    string service_url?;
    # The full aliased URL to access this deployment resource
    string aliased_url?;
    # A list of the URLs to access services that the resource provides at this time. Note that if the service is not running or has not started yet, the URL to access it won't be available
    ServiceUrl[] services_urls?;
    # Information about the ports that allow communication between the Elasticsearch cluster and various protocols.
    ClusterMetadataPortInfo ports?;
};

# The key-value pair.
public type MetadataItem record {
    # The metadata value
    string value;
    # The metadata field name
    string 'key;
};

public type DeploymentResourceUpgradeResponse record {
    string stack_version;
    string resource_id;
};

# The settings for sending monitoring information to another cluster.
public type ManagedMonitoringSettings record {
    # The Id of the target cluster to which to send monitoring information
    string target_cluster_id;
};

# Information about current, pending, and past App Search Server plans.
public type AppSearchPlansInfo record {
    # Whether the plan situation is healthy (if unhealthy, means the last plan attempt failed)
    boolean healthy;
    # Information about the App Search Server plan.
    AppSearchPlanInfo current?;
    # Information about the App Search Server plan.
    AppSearchPlanInfo pending?;
    AppSearchPlanInfo[] history;
};

# This structure defines a curated subset of the Enterprise Search settings. (This field together with 'user_settings_override*' and  'user_settings*' defines the total set of Enterprise Search settings)
public type EnterpriseSearchSystemSettings record {
    # Optionally override the account within Enterprise Search - defaults to a system account that always exists (if specified, the username must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_password?;
    # Optionally override the account within Enterprise Search - defaults to a system account that always exists (if specified, the password must also be specified). Note that this field is never returned from the API, it is write only.
    string elasticsearch_username?;
    # Optionally override the secret session key within Enterprise Search - defaults to the previously existing secretSession. Note that this field is never returned from the API, it is write only.
    string secret_session_key?;
    # Optionally override the URL to which to send data (for advanced users only, if unspecified the system selects an internal URL)
    string elasticsearch_url?;
};

# Information about the Elasticsearch cluster.
public type ElasticsearchInfo record {
    # Whether the Elasticsearch cluster is healthy (check the sub-objects for more details if not)
    boolean healthy;
    # Information about the shards and replicas that comprise the Elasticsearch indices.
    ElasticsearchShardsInfo shard_info;
    # Information about the master nodes in the Elasticsearch cluster.
    ElasticsearchMasterInfo master_info;
    # Issues that prevent the Elasticsearch cluster or index from correctly operating.
    ElasticsearchClusterBlockingIssues blocking_issues;
};

# Controls the languages supported by the Elasticsearch cluster, such as Painless, Mustache, and Expressions. Controls how the languages are used, such as file, index, and inline. TIP: For complex configurations, leave these blank and configure these settings in the user YAML or JSON.
public type ElasticsearchScriptingUserSettings record {
    # (5.x+ only) If enabled (the default) then the expressions scripting engine is allowed as a sandboxed language. Sandboxed languages are the only ones allowed if 'sandbox_mode' is set to true. NOTES: (Corresponds to the parameters 'script.engine.expression.[file|stored|inline]')
    boolean expressions_enabled?;
    # Enables scripting for the specified type and controls other parameters. Store scripts in indexes (`stored`), upload in file bundles (`file`), or use in API requests (`inline`).
    ElasticsearchScriptTypeSettings stored?;
    # (5.x+ only) If enabled (the default) then the painless scripting engine is allowed as a sandboxed language. Sandboxed languages are the only ones allowed if 'sandbox_mode' is set to true. NOTES: (Corresponds to the parameters 'script.engine.painless.[file|stored|inline]')
    boolean painless_enabled?;
    # Enables scripting for the specified type and controls other parameters. Store scripts in indexes (`stored`), upload in file bundles (`file`), or use in API requests (`inline`).
    ElasticsearchScriptTypeSettings file?;
    # Enables scripting for the specified type and controls other parameters. Store scripts in indexes (`stored`), upload in file bundles (`file`), or use in API requests (`inline`).
    ElasticsearchScriptTypeSettings inline?;
    # (5.x+ only) If enabled (the default) then the mustache scripting engine is allowed as a sandboxed language. Sandboxed languages are the only ones allowed if 'sandbox_mode' is set to true. NOTES: (Corresponds to the parameters 'script.engine.mustache.[file|stored|inline]')
    boolean mustache_enabled?;
};

# The metadata for the Elastic Stack.
public type StackVersionMetadata record {
    # Indicates that the stack pack version is not GA and is not supposed to be used in production
    boolean pre_release?;
    # The minimum version required for performing a rolling upgrade to this stack version.
    string min_wire_compatibility_version?;
    # The schema version of the stack pack version
    int schema_version?;
    # The minimum version required for performing a full cluster restart upgrade to this stack version.
    string min_index_compatibility_version?;
    # The minimum version of the platform that the stack pack version is compatible with
    string min_platform_version?;
    # Notes for administrator
    string notes?;
};

# Holds diagnostics for existing resources that might be updated
public type Updates record {
    # Diagnostics for AppSearches
    AppSearch[] appsearch?;
    # Diagnostics for Elasticsearch clusters
    Elasticsearch[] elasticsearch?;
    # Diagnostics for Enterprise Search resources
    EnterpriseSearch[] enterprise_search?;
    # Diagnostics for Kibanas
    Kibana[] kibana?;
    # Diagnostics for APMs
    Apm[] apm?;
};

# Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
public type TopologySize record {
    # Type of resource
    string 'resource;
    # Amount of resource
    int value;
};

# The settings for the Enterprise Search.
public type EnterpriseSearchSettings record {
    # The top-level configuration settings for the Elasticsearch cluster.
    ClusterMetadataSettings metadata?;
};

# The Elasticsearch configuration for an Elastic Stack version. 
public type StackVersionElasticsearchConfig record {
    # Settings that are applied to all nodes of this type
    record {} settings?;
    # Node types that are supported by this stack version
    StackVersionNodeType[] node_types?;
    # List of configuration options that cannot be overridden by user settings
    string[] blacklist;
    # List of available plugins
    string[] plugins;
    # The Elasticsearch instance, Kibana instance, APM Server capacity constraints for an Elastic Stack node type.
    StackVersionInstanceCapacityConstraint capacity_constraints?;
    # Node types that are compatible with this one
    string[] compatible_node_types?;
    # List of default plugins
    string[] default_plugins;
    # Docker image for the Elasticsearch
    string docker_image;
};

# The value that you configure for the Elasticsearch keystore secret.
public type KeystoreSecret record {
    # Stores the keystore secret as a file. The default is false, which stores the keystore secret as string when value is a plain string, or true when value is an object.
    boolean as_file?;
    # Value of this setting. This can either be a string or a JSON object that is stored as a JSON string in the keystore. NOTE: When the keystore secret is unspecified, it is removed.
    record {} value?;
};

# Deployment template detailed information
public type DeploymentTemplateInfoV2 record {
    # List of instance configurations used in the cluster template.
    InstanceConfigurationInfo[] instance_configurations;
    # An optional description for the template.
    string description?;
    # Provider and version agnostic template identifier used for grouping related template types.
    string template_category_id?;
    # Minimum stack version required by this template, if any.
    string min_version?;
    # The Kibana Deeplink for this type of deployment.
    KibanaDeeplink[] kibana_deeplink?;
    # The unique identifier for the template.
    string id;
    # Determines the order in which this template should be returned when listed. Templates are returned in ascending order. If not specified, then the template willbe appended to the end of the list.
    int 'order?;
    # A container for information about the source of a change.
    ChangeSourceInfo 'source?;
    # A request for creating a new Deployment consisting of multiple clusters
    DeploymentCreateRequest deployment_template;
    # Optional arbitrary metadata to associate with this template.
    MetadataItem[] metadata?;
    # Whether or not if this is system owned template.
    boolean system_owned?;
    # A human readable name for the template.
    string name;
};

# Holds diagnostics for an Enterprise Search resource
public type EnterpriseSearch record {
    # The user-specified id of the Elasticsearch Cluster that this will link to
    string elasticsearch_cluster_ref_id;
    # The backend plan as JSON
    record {} backend_plan;
    # The human readable name (defaults to the generated cluster id if not specified)
    string display_name;
    # A locally-unique user-specified id
    string ref_id;
};

# Read-only mode response
public type ReadOnlyResponse record {
    # Whether read-only mode is enabled or disabled
    boolean enabled;
};

# The settings for an Elasticsearch cluster.
public type ElasticsearchClusterSettings record {
    # The settings for sending monitoring information to another cluster.
    ManagedMonitoringSettings monitoring?;
    # The index curation settings for an Elasticsearch cluster.
    ClusterCurationSettings curation?;
    # The configuration settings for IP filtering.
    IpFilteringSettings ip_filtering?;
    # The snapshot configuration settings for an Elasticsearch cluster.
    ClusterSnapshotSettings snapshot?;
    # The configuration settings for the traffic filter.
    TrafficFilterSettings traffic_filter?;
    # Configuration of trust with other clusters.
    ElasticsearchClusterTrustSettings trust?;
    # Threshold starting from which the number of instances in the cluster results in the introduction of dedicated masters. If the cluster is downscaled to a number of nodes below this one, dedicated masters will be removed. Limit is inclusive.
    int dedicated_masters_threshold?;
    # The top-level configuration settings for the Elasticsearch cluster.
    ClusterMetadataSettings metadata?;
};

# Controls the combinations of Elasticsearch node types. TIP: By default, the Elasticsearch node is master eligible, can hold data, and run ingest pipelines. WARNING: Do not set for tiebreaker topologies.
public type ElasticsearchNodeType record {
    # Defines whether this node can hold data (default: false)
    boolean data?;
    # Defines whether this node can be elected master (default: false)
    boolean master?;
    # Defines whether this node can run an ingest pipeline (default: false)
    boolean ingest?;
    # Defines whether this node can run ml jobs, valid only for versions 5.4.0 or greater (default: false)
    boolean ml?;
};

# Information about the Elasticsearch instances. For split-brain cases, this also includes sub-clusters.
public type ElasticsearchMasterElement record {
    # The names of the instance/container hosting the node belong to the cluster with the given master
    string[] instances;
    # The Elasticsearch node id of a master node
    string master_node_id;
    # The corresponding instance name of the container hosting the Elasticsearch master node, if available
    string master_instance_name?;
};

# The container for a traffic filter rule.
public type TrafficFilterRule record {
    # Name of the Azure Private Endpoint to allow connections from
    string azure_endpoint_name?;
    # The rule detail for a traffic filter egress rule.
    TrafficFilterEgressRule egress_rule?;
    # Description of the rule
    string description?;
    # Allowed traffic filter source: IP address, CIDR mask, or VPC endpoint ID
    string 'source?;
    # Resource GUID of the Azure Private Endpoint to allow connections from
    string azure_endpoint_guid?;
    # The rule ID
    string id?;
};

# The information for an Elasticsearch cluster.
public type ElasticsearchClusterInfo record {
    # Cluster status
    string status;
    ApmSubInfo[] associated_apm_clusters;
    KibanaSubClusterInfo[] associated_kibana_clusters;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
    EnterpriseSearchSubInfo[] associated_enterprise_search_clusters;
    # The settings for an Elasticsearch cluster.
    ElasticsearchClusterSettings settings?;
    # Whether the cluster is healthy or not (one or more of the info subsections will have healthy: false)
    boolean healthy;
    AppSearchSubInfo[] associated_appsearch_clusters;
    # The region that this cluster belongs to. Only populated in SaaS or federated ECE.
    string region?;
    # Information about the monitoring status for the Elasticsearch cluster.
    ElasticsearchMonitoringInfo elasticsearch_monitoring_info?;
    # Information about the snapshot status for the Elasticsearch cluster. For example, the health status.
    SnapshotStatusInfo snapshots;
    # The name of the cluster
    string cluster_name;
    # Information about the current, pending, and past Elasticsearch cluster plans.
    ElasticsearchClusterPlansInfo plan_info;
    # The id of the cluster
    string cluster_id;
    # External resources related to the cluster
    ExternalHyperlink[] external_links;
    # List of cluster system alerts
    ClusterSystemAlert[] system_alerts?;
    # Information about the Elasticsearch cluster.
    ElasticsearchInfo elasticsearch;
    # The id of the deployment that this Elasticsearch belongs to.
    string deployment_id?;
    # The topology for Elasticsearch clusters, multiple Kibana instances, or multiple APM Servers. The `ClusterTopologyInfo` also includes the instances and containers, and where they are located.
    ClusterTopologyInfo topology;
    # For 2.x Elasticsearch clusters, specifies the information about the users and roles. For 5.x Elasticsearch clusters, use the Kibana management UI.
    ElasticsearchClusterSecurityInfo security?;
    # Information about the public and internal state, and the configuration settings of an Elasticsearch cluster.
    ClusterMetadataInfo metadata;
};

# Request sent to enable ILM on a deployment.
public type EnableIlmRequest record {
    # A locally-unique user-specified id for Kibana
    IndexPattern[] index_patterns;
};

# Period
public type Period record {
    # Start
    string 'start;
    # End
    string end;
};

# Information about the APM Servers associated with the Elasticsearch cluster.
public type EnterpriseSearchSubInfo record {
    # The Enterprise Search Id
    string enterprise_search_id;
    # Whether the associated Enterprise Search is currently available
    boolean enabled;
    # A map of application-specific operations (which map to 'operationId's in the Swagger API) to metadata about that operation
    record {} links?;
};

# A list of admin-uploaded bundle objects, such as scripts and synonym files.
public type ElasticsearchUserBundle record {
    # The URL of the bundle, which must be accessible from the ECE infrastructure. This URL could be cached by platform, make sure to change it when updating the bundle
    string url;
    # The name of the bundle
    string name;
    # The supported Elasticsearch version (must match the version in the plan)
    string elasticsearch_version;
};

# Describes the diagnostics for a given Deployment-modifying payload
public type DeploymentDiagnostics record {
    # Holds diagnostics for resources that will be created
    Creates creates?;
    # Holds diagnostics for existing resources that might be updated
    Updates updates?;
};

# The logging settings for a deployment
public type DeploymentLoggingSettings record {
    # A reference to a specific resource of a deployment
    AbsoluteRefId destination;
};

# A query that uses the `SimpleQueryParser` for parsing.
public type QueryStringQuery record {
    # The actual query to be parsed.
    string query;
    # The default operator used if no explicit operator is specified.
    string default_operator?;
    # The default field for query terms if no prefix field is specified.
    string default_field?;
    # When set, * or ? are allowed as the first character. Defaults to false.
    boolean allow_leading_wildcard?;
    # The analyzer used to analyze each term of the query when creating composite queries.
    string analyzer?;
};

# A container for information about the source of a change.
public type ChangeSourceInfo record {
    # The user that requested the change
    string user_id?;
    # The host addresses of the user that originated the change
    string[] remote_addresses?;
    # The service where the change originated from
    string facilitator;
    # The admin user that requested the change
    string admin_id?;
    # The time the change was initiated
    string date;
    # The type of plan change that was initiated
    string action;
};

# An alias for an Elasticsearch Cluster paired with a request for creating one
public type ElasticsearchPayload record {
    # The region where this resource exists
    string region;
    # The settings for an Elasticsearch cluster.
    ElasticsearchClusterSettings settings?;
    # The human readable name for the cluster (defaults to the generated cluster id if not specified)
    string display_name?;
    # The plan for the Elasticsearch cluster.
    ElasticsearchClusterPlan plan;
    # A locally-unique user-specified id for this Elasticsearch cluster
    string ref_id;
};

# A reference to a specific resource of a deployment
public type AbsoluteRefId record {
    # The deployment id
    string deployment_id;
    # The reference id of the resource in the given deployment
    string ref_id;
};

# The Elasticsearch cluster settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
public type ElasticsearchConfiguration record {
    # An arbitrary JSON object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_yaml' is allowed), ie in addition to the documented 'system_settings'. NOTES: (This field together with 'system_settings' and 'user_settings*' defines the total set of Elasticsearch settings)
    record {} user_settings_override_json?;
    # A list of plugin names from the Elastic-supported subset that are bundled with the version images. NOTES: (Users should consult the Elastic stack objects to see what plugins are available, this is currently only available from the UI)
    string[] enabled_built_in_plugins?;
    # A list of admin-uploaded plugin objects that are available for this user.
    ElasticsearchUserPlugin[] user_plugins?;
    # An arbitrary YAML object allowing cluster owners to set their parameters (only one of this and 'user_settings_json' is allowed), provided the parameters arey are on the allowlist and not on the denylist. NOTES: (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Elasticsearch settings)
    string user_settings_yaml?;
    # A list of admin-uploaded bundle objects (eg scripts, synonym files) that are available for this user.
    ElasticsearchUserBundle[] user_bundles?;
    # The version of the Elasticsearch cluster (must be one of the ECE supported versions). Currently cannot be different across the topology (and is generally specified in the globals). Defaults to the latest version if not specified.
    string 'version?;
    # An arbitrary JSON object allowing cluster owners to set their parameters (only one of this and 'user_settings_yaml' is allowed), provided the parameters arey are on the allowlist and not on the denylist. NOTES: (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Elasticsearch settings)
    record {} user_settings_json?;
    # The structure that defines the routing settings for index curation.
    ElasticsearchCuration curation?;
    # A subset of Elasticsearch settings. TIP: To define the complete set of Elasticsearch settings, use `ElasticsearchSystemSettings` with `user_settings_override*` and `user_settings*`.
    ElasticsearchSystemSettings system_settings?;
    # An arbitrary YAML object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_json' is allowed), ie in addition to the documented 'system_settings'. NOTES: (This field together with 'system_settings' and 'user_settings*' defines the total set of Elasticsearch settings)
    string user_settings_override_yaml?;
    # A docker URI that allows overriding of the default docker image specified for this version
    string docker_image?;
    # Defines the Elasticsearch node attributes for the instances in the topology
    record {} node_attributes?;
};

public type DeploymentsListingData record {
    # The id of this deployment
    string id;
    # List of resources in this deployment
    DeploymentResource[] resources;
    # The name of this deployment
    string name;
};

# The response after you create a new ruleset.
public type TrafficFilterRulesetResponse record {
    # The new ruleset ID
    string id;
};

# The metrics settings for a deployment
public type DeploymentMetricsSettings record {
    # A reference to a specific resource of a deployment
    AbsoluteRefId destination;
};

# An account is the entity that owns deployments, and it is accessed by users. Accounts are isolated from each other.
public type AccountResponse record {
    # Settings related to the level of trust of the clusters in this account
    AccountTrustSettings trust?;
    # The account's identifier
    string id;
};

public type ExtensionFileMetadata record {
    # The temporary URL to download the extension file. Usable for verification.
    string url?;
    # The date and time the extension was last modified.
    string last_modified_date?;
    # The extension file size in bytes.
    int size?;
};

public type EmptyResponse record {
};

# The available balance for an organization
public type Balance record {
    # Available balance
    decimal available;
    # A collection of order line items for for an organization
    SimplifiedLineItem[] line_items;
    # Remaining balance
    decimal remaining;
};

# A query that matches all documents.
public type MatchAllQuery record {
};

# Node types to enable for an Enterprise Search instance
public type EnterpriseSearchNodeTypes record {
    # Defines whether this instance should run as Connector
    boolean connector;
    # Defines whether this instance should run as Application/API server
    boolean appserver;
    # Defines whether this instance should run as background worker
    boolean 'worker;
};

# The template information for an Elastic Stack version.
public type StackVersionTemplateInfo record {
    # Relative paths of files with SHA-256 hashes that contains the template
    StackVersionTemplateFileHash[] hashes?;
    # Template version
    string template_version?;
};

# The username and password for the new Elasticsearch cluster, which is returned from the Elasticsearch cluster `create` command.
public type ClusterCredentials record {
    # The username of the newly created cluster
    string username;
    # The password of the newly created cluster
    string password;
};

# Specifies the deployment template used to create the plan.
public type DeploymentTemplateReference record {
    # A version identifier to disambiguate multiple revisions of the same template
    string 'version?;
    # The unique identifier of the deployment template
    string id;
};

# Information about the memory capacity and use of the Kibana instance or APM Server.
public type ClusterInstanceMemoryInfo record {
    # The memory capacity in MB of the instance
    int instance_capacity;
    # The % memory pressure of the service if available (60-75% consider increasing capacity, >75% can incur significant performance and stability issues)
    int memory_pressure?;
    # The planned memory capacity in MB of the instance (only shown when an override is present)
    int instance_capacity_planned?;
    # The % native memory pressure of the service if available
    int native_memory_pressure?;
};

# The topology of the Elasticsearch nodes, including the number, capacity, and type of nodes, and where they can be allocated.
public type ElasticsearchClusterTopologyElement record {
    # An arbitrary JSON object overriding the default autoscaling policy. Don't set unless you really know what you are doing.
    record {} autoscaling_policy_override_json?;
    # The default number of zones in which data nodes will be placed
    int zone_count?;
    # Controls for the topology element. Only used as part of the deployment template. Ignored if included as part of a deployment.
    TopologyElementControl topology_element_control?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize autoscaling_min?;
    # Controls the combinations of Elasticsearch node types. TIP: By default, the Elasticsearch node is master eligible, can hold data, and run ingest pipelines. WARNING: Do not set for tiebreaker topologies.
    ElasticsearchNodeType node_type?;
    # The Elasticsearch cluster settings. When specified at the top level, provides a field-by-field default. When specified at the topology level, provides the override settings.
    ElasticsearchConfiguration elasticsearch?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize autoscaling_max?;
    # Controls the allocation of this topology element as well as allowed sizes and node_types. It needs to match the id of an existing instance configuration.
    string instance_configuration_id?;
    # The list of node roles for this topology element (ES version >= 7.10). Allowable values are: master, ingest, ml, data_hot, data_content, data_warm, data_cold, data_frozen, remote_cluster_client, transform
    string[] node_roles?;
    # Unique identifier of this topology element
    string id?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize size?;
};

# Costs overview for an organization. All of the costs, credits, trials are expressed in Elastic Consumption Unit (ECU).
public type Costs record {
    # Total costs
    decimal total;
    # Total costs associated to the Elastic Cloud resources
    decimal resources;
    # Total costs associated to Data Transfer and Storage (DTS)
    decimal data_transfer_and_storage;
};

# Information about the Elasticsearch cluster snapshot retention.
public type ClusterSnapshotRetention record {
    # Total retention period for all snapshots, with the format 'length unit' (space is optional), where unit can be one of: d (day), h (hour), min (minute)
    string max_age?;
    # Number of snapshots to retain
    int snapshots?;
};

# For 2.x Elasticsearch clusters, specifies the information about the users and roles. For 5.x Elasticsearch clusters, use the Kibana management UI.
public type ElasticsearchClusterSecurityInfo record {
    ElasticsearchClusterRole[] users_roles;
    # An arbitrarily nested JSON object mapping roles to sets of resources and permissions - see the Elasticsearch security documentation for more details on roles
    record {} roles;
    # The resource version number of the security settings
    int 'version;
    ElasticsearchClusterUser[] users;
    # The most recent time the security settings were changed (ISO format in UTC)
    string last_modified;
};

# The configuration options for the APM Server.
public type ApmConfiguration record {
    # An arbitrary JSON object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_yaml' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Apm settings)
    record {} user_settings_override_json?;
    # An arbitrary YAML object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_json' is allowed), provided the parameters are on the allowlist and not on the denylist. (These field together with 'user_settings_override*' and 'system_settings' defines the total set of Apm settings)
    string user_settings_yaml?;
    # The version of the Apm cluster (must be one of the ECE supported versions, and won't work unless it matches the APM version. Leave blank to auto-detect version.)
    string 'version?;
    # An arbitrary JSON object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_yaml' is allowed), provided the parameters are on the allowlist and not on the denylist. (This field together with 'user_settings_override*' and 'system_settings' defines the total set of Apm settings)
    record {} user_settings_json?;
    # A structure that defines a curated subset of the APM Server settings. 
    # TIP: To define the complete set of APM Server setting, use `ApmSystemSettings` with `user_settings_override_` and `user_settings_`.
    ApmSystemSettings system_settings?;
    # An arbitrary YAML object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_json' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of Apm settings)
    string user_settings_override_yaml?;
    # A docker URI that allows overriding of the default docker image specified for this version
    string docker_image?;
};

# Details about an orphaned Elasticsearch-dependent resources.
public type ElasticsearchDependant record {
    # The kind of resource
    string kind;
    # The id of the orphaned resource
    string id;
};

# Holds diagnostics for an Elasticsearch cluster
public type Elasticsearch record {
    # The backend plan as JSON
    record {} backend_plan;
    # The human readable name for the cluster (defaults to the generated cluster id if not specified)
    string display_name;
    # A locally-unique user-specified id
    string ref_id;
};

# Contains a list of deployments
public type DeploymentsListResponse record {
    # The deployments
    DeploymentsListingData[] deployments;
};

# A query that doesn't match any documents.
public type MatchNoneQuery record {
};

# The request that specifies the Elasticsearch instances, Kibana instances, and APM Servers to move to allocators as part of the upgrade plan.
public type InstanceMoveRequest record {
    # An optional list of allocator ids to which the instance should be moved. If not specified then any available allocator can be used (including the current one if it is healthy)
    string[] to?;
    # The instance id that is going to be moved
    string 'from;
    # Tells the infrastructure that the instance should be considered as permanently down when deciding how to migrate data to new nodes. If left blank then the system will automatically decide (currently: will treat the instances as up)
    boolean instance_down?;
};

# The authorization information for an Elasticsearch cluster user.
public type ElasticsearchClusterRole record {
    # The username
    string username;
    # The list of roles for this user
    string[] roles;
};

# The trust relationship with external entities (remote environments, remote accounts...).
public type ExternalTrustRelationship record {
    # The list of clusters to trust. Only used when `trust_all` is false.
    string[] trust_allowlist?;
    # the ID of the external trust relationship
    string trust_relationship_id;
    # If true, all clusters in this external entity will be trusted and the `trust_allowlist` is ignored.
    boolean trust_all;
};

# The plan control configuration options for the APM Server.
public type ApmPlanControlConfiguration record {
    # Set to 'forced' to force a reboot as part of the upgrade plan
    string cluster_reboot?;
    # If true (default false), does not clear the maintenance flag (which prevents its API from being accessed except by the constructor) on new instances added until after a snapshot has been restored, otherwise, the maintenance flag is cleared once the new instances successfully join the new cluster
    boolean extended_maintenance?;
    # This timeout determines how long to give a cluster after it responds to API calls before performing actual operations on it. It defaults to 5s
    int calm_wait_time?;
    # The total timeout in seconds after which the plan is cancelled even if it is not complete. Defaults to 4x the max memory capacity per node (in MB)
    int timeout?;
};

# The configuration settings for IP filtering.
public type IpFilteringSettings record {
    # IDs of the IP filter rulesets
    string[] rulesets;
};

# Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and APM Server settings.
public type TransientApmPlanConfiguration record {
    # The plan control configuration options for the APM Server.
    ApmPlanControlConfiguration plan_configuration?;
    # The options for performing a plan change. Specify only one property each time. The default is `grow_and_shrink`.
    PlanStrategy strategy?;
};

public type AppSearchPlanControlConfiguration record {
    # Set to 'forced' to force a reboot as part of the upgrade plan
    string cluster_reboot?;
    AllocatorMoveRequest[] move_allocators?;
    # If true (default: false) does not allow re-using any existing instances currently in the cluster, ie even unchanged instances will be re-created
    boolean reallocate_instances?;
    # List of allocators on which instances are placed if possible (if not possible/not specified then any available allocator with space is used)
    string[] preferred_allocators?;
    # This timeout determines how long to give a cluster after it responds to API calls before performing actual operations on it. It defaults to 5s
    int calm_wait_time?;
    # The total timeout in seconds after which the plan is cancelled even if it is not complete. Defaults to 4x the max memory capacity per node (in MB)
    int timeout?;
    # If true (default false), does not clear the maintenance flag (which prevents its API from being accessed except by the constructor) on new instances added until after a snapshot has been restored, otherwise, the maintenance flag is cleared once the new instances successfully join the new cluster
    boolean extended_maintenance?;
    InstanceMoveRequest[] move_instances?;
};

# Defines the topology of the APM Server nodes. For example, the number or capacity of the nodes, and where you can allocate the nodes.
public type ApmTopologyElement record {
    # The configuration options for the APM Server.
    ApmConfiguration apm?;
    # Controls the allocation of this topology element as well as allowed sizes and node_types. It needs to match the id of an existing instance configuration.
    string instance_configuration_id?;
    # number of zones in which nodes will be placed
    int zone_count?;
    # Measured by the amount of a resource. The final cluster size is calculated using multipliers from the topology instance configuration.
    TopologySize size?;
};

# The query that matches documents with fields that contain terms with a specified, not analyzed, prefix.
public type PrefixQuery record {
    # An optional boost value to apply to the query.
    float boost?;
    # The prefix to search for.
    string value;
};

# Additional information about the new deployment object.
public type DeploymentCreateMetadata record {
    # Arbitrary user-defined metadata associated with this deployment
    MetadataItem[] tags?;
};

# Node types to enable for an AppSearch instance
public type AppSearchNodeTypes record {
    # Defines whether this instance should run as Application/API server
    boolean appserver;
    # Defines whether this instance should run as background worker
    boolean 'worker;
};

# The configuration settings for the traffic filter.
public type RulesetAssociations record {
    # List of associations
    FilterAssociation[] associations;
    # Total number of associations. This includes associations the user does not have permission to view.
    int total_associations;
};

# The plan for the APM Server.
public type ApmPlan record {
    ApmTopologyElement[] cluster_topology?;
    # Defines the configuration parameters that control how the plan is applied. For example, the Elasticsearch cluster topology and APM Server settings.
    TransientApmPlanConfiguration transient?;
    # The configuration options for the APM Server.
    ApmConfiguration apm;
};

public type AppSearchConfiguration record {
    # An arbitrary JSON object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_yaml' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of AppSearch settings)
    record {} user_settings_override_json?;
    # An arbitrary YAML object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_json' is allowed), provided the parameters are on the allowlist and not on the denylist. (These field together with 'user_settings_override*' and 'system_settings' defines the total set of AppSearch settings)
    string user_settings_yaml?;
    # The version of the AppSearch cluster (must be one of the ECE supported versions, and won't work unless it matches the Elasticsearch version. Leave blank to auto-detect version.)
    string 'version?;
    # An arbitrary JSON object allowing (non-admin) cluster owners to set their parameters (only one of this and 'user_settings_yaml' is allowed), provided the parameters are on the allowlist and not on the denylist. (This field together with 'user_settings_override*' and 'system_settings' defines the total set of AppSearch settings)
    record {} user_settings_json?;
    # This structure defines a curated subset of the AppSearch settings. (This field together with 'user_settings_override*' and  'user_settings*' defines the total set of AppSearch settings)
    AppSearchSystemSettings system_settings?;
    # An arbitrary YAML object allowing ECE admins owners to set clusters' parameters (only one of this and 'user_settings_override_json' is allowed), ie in addition to the documented 'system_settings'. (This field together with 'system_settings' and 'user_settings*' defines the total set of AppSearch settings)
    string user_settings_override_yaml?;
    # A docker URI that allows overriding of the default docker image specified for this version
    string docker_image?;
};

# Holds diagnostics for an APM resource
public type Apm record {
    # The user-specified id of the Elasticsearch Cluster that this will link to
    string elasticsearch_cluster_ref_id;
    # The backend plan as JSON
    record {} backend_plan;
    # The human readable name (defaults to the generated cluster id if not specified)
    string display_name;
    # A locally-unique user-specified id
    string ref_id;
};
