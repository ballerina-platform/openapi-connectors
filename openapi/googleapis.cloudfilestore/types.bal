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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# A Cloud Filestore instance.
public type Instance record {
    # Output only. The time when the instance was created.
    string createTime?;
    # The description of the instance (2048 characters or less).
    string description?;
    # Server-specified ETag for the instance resource to prevent simultaneous updates from overwriting each other.
    string etag?;
    # File system shares on the instance. For this version, only a single file share is supported.
    FileShareConfig[] fileShares?;
    # Resource labels to represent user provided metadata.
    record {} labels?;
    # Output only. The resource name of the instance, in the format projects/{project}/locations/{location}/instances/{instance}.
    string name?;
    # VPC networks to which the instance is connected. For this version, only a single network is supported.
    NetworkConfig[] networks?;
    # Output only. Reserved for future use.
    boolean satisfiesPzs?;
    # Output only. The instance state.
    string state?;
    # Output only. Additional information about the instance state, if available.
    string statusMessage?;
    # The service tier of the instance.
    string tier?;
};

# A Cloud Filestore backup.
public type Backup record {
    # Output only. Capacity of the source file share when the backup was created.
    string capacityGb?;
    # Output only. The time when the backup was created.
    string createTime?;
    # A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected.
    string description?;
    # Output only. Amount of bytes that will be downloaded if the backup is restored. This may be different than storage bytes, since sequential backups of the same disk will share storage.
    string downloadBytes?;
    # Resource labels to represent user provided metadata.
    record {} labels?;
    # Output only. The resource name of the backup, in the format projects/{project_number}/locations/{location_id}/backups/{backup_id}.
    string name?;
    # Output only. Reserved for future use.
    boolean satisfiesPzs?;
    # Name of the file share in the source Cloud Filestore instance that the backup is created from.
    string sourceFileShare?;
    # The resource name of the source Cloud Filestore instance, in the format projects/{project_number}/locations/{location_id}/instances/{instance_id}, used to create this backup.
    string sourceInstance?;
    # Output only. The service tier of the source Cloud Filestore instance that this backup is created from.
    string sourceInstanceTier?;
    # Output only. The backup state.
    string state?;
    # Output only. The size of the storage used by the backup. As backups share storage, this number is expected to change with backup creation/deletion.
    string storageBytes?;
};

# Maintenance settings associated with instance. Allows service producers and end users to assign settings that controls maintenance on this instance.
public type GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSettings record {
    # Optional. Exclude instance from maintenance. When true, rollout service will not attempt maintenance on the instance. Rollout service will include the instance in reported rollout progress as not attempted.
    boolean exclude?;
    # Optional. If the update call is triggered from rollback, set the value as true.
    boolean isRollback?;
    # Optional. The MaintenancePolicies that have been attached to the instance. The key must be of the type name of the oneof policy name defined in MaintenancePolicy, and the embedded policy must define the same policy type. For complete details of MaintenancePolicy, please refer to go/cloud-saas-mw-ug. If only the name is needed (like in the deprecated Instance.maintenance_policy_names field) then only populate MaintenancePolicy.name.
    record {} maintenancePolicies?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type Operation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type XxxResponse, where `Xxx` is the original method name. For example, if the original method name is TakeSnapshot(), the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# ListInstancesResponse is the result of ListInstancesRequest.
public type ListInstancesResponse record {
    # A list of instances in the project for the specified location. If the {location} value in the request is "-", the response contains a list of instances from all locations. If any location is unreachable, the response will only return instances in reachable locations and the "unreachable" field will be populated with a list of unreachable locations.
    Instance[] instances?;
    # The token you can use to retrieve the next page of results. Not returned if there are no more results in the list.
    string nextPageToken?;
    # Locations that could not be reached.
    string[] unreachable?;
};

# NFS export options specifications.
public type NfsExportOptions record {
    # Either READ_ONLY, for allowing only read requests on the exported directory, or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE.
    string accessMode?;
    # An integer representing the anonymous group id with a default value of 65534. Anon_gid may only be set with squash_mode of ROOT_SQUASH. An error will be returned if this field is specified for other squash_mode settings.
    string anonGid?;
    # An integer representing the anonymous user id with a default value of 65534. Anon_uid may only be set with squash_mode of ROOT_SQUASH. An error will be returned if this field is specified for other squash_mode settings.
    string anonUid?;
    # List of either an IPv4 addresses in the format {octet 1}.{octet 2}.{octet 3}.{octet 4} or CIDR ranges in the format {octet 1}.{octet 2}.{octet 3}.{octet 4}/{mask size} which may mount the file share. Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned. The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.
    string[] ipRanges?;
    # Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH, for not allowing root access. The default is NO_ROOT_SQUASH.
    string squashMode?;
};

# PerSliSloEligibility is a mapping from an SLI name to eligibility.
public type GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility record {
    # An entry in the eligibilities map specifies an eligibility for a particular SLI for the given instance. The SLI key in the name must be a valid SLI name specified in the Eligibility Exporter binary flags otherwise an error will be emitted by Eligibility Exporter and the oncaller will be alerted. If an SLI has been defined in the binary flags but the eligibilities map does not contain it, the corresponding SLI time series will not be emitted by the Eligibility Exporter. This ensures a smooth rollout and compatibility between the data produced by different versions of the Eligibility Exporters. If eligibilities map contains a key for an SLI which has not been declared in the binary flags, there will be an error message emitted in the Eligibility Exporter log and the metric for the SLI in question will not be emitted.
    record {} eligibilities?;
};

# Time window specified for weekly operations.
public type WeeklyCycle record {
    # User can specify multiple windows in a week. Minimum of 1 window.
    Schedule[] schedule?;
};

# The response message for Operations.ListOperations.
public type ListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    Operation[] operations?;
};

# Maintenance schedule which is exposed to customer and potentially end user, indicating published upcoming future maintenance schedule
public type GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSchedule record {
    # This field is deprecated, and will be always set to true since reschedule can happen multiple times now. This field should not be removed until all service producers remove this for their customers.
    boolean canReschedule?;
    # The scheduled end time for the maintenance.
    string endTime?;
    # The rollout management policy this maintenance schedule is associated with. When doing reschedule update request, the reschedule should be against this given policy.
    string rolloutManagementPolicy?;
    # schedule_deadline_time is the time deadline any schedule start time cannot go beyond, including reschedule. It's normally the initial schedule start time plus maintenance window length (1 day or 1 week). Maintenance cannot be scheduled to start beyond this deadline.
    string scheduleDeadlineTime?;
    # The scheduled start time for the maintenance.
    string startTime?;
};

# Describes provisioned dataplane resources.
public type GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource record {
    # Type of the resource. This can be either a GCP resource or a custom one (e.g. another cloud provider's VM). For GCP compute resources use singular form of the names listed in GCP compute API documentation (https://cloud.google.com/compute/docs/reference/rest/v1/), prefixed with 'compute-', for example: 'compute-instance', 'compute-disk', 'compute-autoscaler'.
    string resourceType?;
    # URL identifying the resource, e.g. "https://www.googleapis.com/compute/v1/projects/...)".
    string resourceUrl?;
};

# SloExclusion represents an exclusion in SLI calculation applies to all SLOs.
public type GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion record {
    # Exclusion duration. No restrictions on the possible values. When an ongoing operation is taking longer than initially expected, an existing entry in the exclusion list can be updated by extending the duration. This is supported by the subsystem exporting eligibility data as long as such extension is committed at least 10 minutes before the original exclusion expiration - otherwise it is possible that there will be "gaps" in the exclusion application in the exported timeseries.
    string duration?;
    # Human-readable reason for the exclusion. This should be a static string (e.g. "Disruptive update in progress") and should not contain dynamically generated data (e.g. instance name). Can be left empty.
    string reason?;
    # Name of an SLI that this exclusion applies to. Can be left empty, signaling that the instance should be excluded from all SLIs.
    string sliName?;
    # Start time of the exclusion. No alignment (e.g. to a full minute) needed.
    string startTime?;
};

# DenyMaintenancePeriod definition. Maintenance is forbidden within the deny period. The start_date must be less than the end_date.
public type DenyMaintenancePeriod record {
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date endDate?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date startDate?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay time?;
};

# SloMetadata contains resources required for proper SLO classification of the instance.
public type GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata record {
    # List of SLO exclusion windows. When multiple entries in the list match (matching the exclusion time-window against current time point) the exclusion reason used in the first matching entry will be published. It is not needed to include expired exclusion in this list, as only the currently applicable exclusions are taken into account by the eligibility exporting subsystem (the historical state of exclusions will be reflected in the historically produced timeseries regardless of the current state). This field can be used to mark the instance as temporary ineligible for the purpose of SLO calculation. For permanent instance SLO exclusion, use of custom instance eligibility is recommended. See 'eligibility' field below.
    GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion[] exclusions?;
    # Optional. List of nodes. Some producers need to use per-node metadata to calculate SLO. This field allows such producers to publish per-node SLO meta data, which will be consumed by SSA Eligibility Exporter and published in the form of per node metric to Monarch.
    GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata[] nodes?;
    # PerSliSloEligibility is a mapping from an SLI name to eligibility.
    GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility perSliEligibility?;
    # Name of the SLO tier the Instance belongs to. This name will be expected to match the tiers specified in the service SLO configuration. Field is mandatory and must not be empty.
    string tier?;
};

# Defines policies to service maintenance events.
public type MaintenancePolicy record {
    # Output only. The time when the resource was created.
    string createTime?;
    # Optional. Description of what this policy is for. Create/Update methods return INVALID_ARGUMENT if the length is greater than 512.
    string description?;
    # Optional. Resource labels to represent user provided metadata. Each label is a key-value pair, where both the key and the value are arbitrary strings provided by the user.
    record {} labels?;
    # Required. MaintenancePolicy name using the form: `projects/{project_id}/locations/{location_id}/maintenancePolicies/{maintenance_policy_id}` where {project_id} refers to a GCP consumer project ID, {location_id} refers to a GCP region/zone, {maintenance_policy_id} must be 1-63 characters long and match the regular expression `[a-z0-9]([-a-z0-9]*[a-z0-9])?`.
    string name?;
    # Optional. The state of the policy.
    string state?;
    # Maintenance policy applicable to instance updates.
    UpdatePolicy updatePolicy?;
    # Output only. The time when the resource was updated.
    string updateTime?;
};

# Represents the metadata of the long-running operation.
public type OperationMetadata record {
    # Output only. API version used to start the operation.
    string apiVersion?;
    # Output only. Identifies whether the user has requested cancellation of the operation. Operations that have successfully been cancelled have Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    boolean cancelRequested?;
    # Output only. The time the operation was created.
    string createTime?;
    # Output only. The time the operation finished running.
    string endTime?;
    # Output only. Human-readable status of the operation, if any.
    string statusDetail?;
    # Output only. Server-defined resource path for the target of the operation.
    string target?;
    # Output only. Name of the verb executed by the operation.
    string verb?;
};

# RestoreInstanceRequest restores an existing instances's file share from a backup.
public type RestoreInstanceRequest record {
    # Required. Name of the file share in the Cloud Filestore instance that the backup is being restored to.
    string fileShare?;
    # The resource name of the backup, in the format projects/{project_number}/locations/{location_id}/backups/{backup_id}.
    string sourceBackup?;
};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
public type TimeOfDay record {
    # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
    int hours?;
    # Minutes of hour of day. Must be from 0 to 59.
    int minutes?;
    # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
    int nanos?;
    # Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
    int seconds?;
};

# Time window specified for daily operations.
public type DailyCycle record {
    # Output only. Duration of the time window, set by service producer.
    string duration?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay startTime?;
};

# The response message for Locations.ListLocations.
public type ListLocationsResponse record {
    # A list of locations that matches the specified filter in the request.
    Location[] locations?;
    # The standard List next-page token.
    string nextPageToken?;
};

# Maintenance policy applicable to instance updates.
public type UpdatePolicy record {
    # Optional. Relative scheduling channel applied to resource.
    string channel?;
    # Deny Maintenance Period that is applied to resource to indicate when maintenance is forbidden. User can specify zero or more non-overlapping deny periods. Maximum number of deny_maintenance_periods expected is one.
    DenyMaintenancePeriod[] denyMaintenancePeriods?;
    # MaintenanceWindow definition.
    MaintenanceWindow window?;
};

# Network configuration for the instance.
public type NetworkConfig record {
    # Output only. IPv4 addresses in the format {octet 1}.{octet 2}.{octet 3}.{octet 4} or IPv6 addresses in the format {block 1}:{block 2}:{block 3}:{block 4}:{block 5}:{block 6}:{block 7}:{block 8}.
    string[] ipAddresses?;
    # Internet protocol versions for which the instance has IP addresses assigned. For this version, only MODE_IPV4 is supported.
    string[] modes?;
    # The name of the Google Compute Engine [VPC network](/compute/docs/networks-and-firewalls#networks) to which the instance is connected.
    string network?;
    # A /29 CIDR block in one of the [internal IP address ranges](https://www.arin.net/knowledge/address_filters.html) that identifies the range of IP addresses reserved for this instance. For example, 10.0.0.0/29 or 192.168.0.0/29. The range you specify can't overlap with either existing subnets or assigned IP address ranges for other Cloud Filestore instances in the selected VPC network.
    string reservedIpRange?;
};

# Node information for custom per-node SLO implementations. SSA does not support per-node SLO, but producers can populate per-node information in SloMetadata for custom precomputations. SSA Eligibility Exporter will emit per-node metric based on this information.
public type GoogleCloudSaasacceleratorManagementProvidersV1NodeSloMetadata record {
    # By default node is eligible if instance is eligible. But individual node might be excluded from SLO by adding entry here. For semantic see SloMetadata.exclusions. If both instance and node level exclusions are present for time period, the node level's reason will be reported by Eligibility Exporter.
    GoogleCloudSaasacceleratorManagementProvidersV1SloExclusion[] exclusions?;
    # The location of the node, if different from instance location.
    string location?;
    # The id of the node. This should be equal to SaasInstanceNode.node_id.
    string nodeId?;
    # PerSliSloEligibility is a mapping from an SLI name to eligibility.
    GoogleCloudSaasacceleratorManagementProvidersV1PerSliSloEligibility perSliEligibility?;
};

# Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
public type Date record {
    # Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant.
    int day?;
    # Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
    int month?;
    # Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
    int year?;
};

public type GoogleCloudSaasacceleratorManagementProvidersV1Instance record {
    # consumer_defined_name is the name that is set by the consumer. On the other hand Name field represents system-assigned id of an instance so consumers are not necessarily aware of it. consumer_defined_name is used for notification/UI purposes for consumer to recognize their instances.
    string consumerDefinedName?;
    # Output only. Timestamp when the resource was created.
    string createTime?;
    # Optional. Resource labels to represent user provided metadata. Each label is a key-value pair, where both the key and the value are arbitrary strings provided by the user.
    record {} labels?;
    # Deprecated. The MaintenancePolicies that have been attached to the instance. The key must be of the type name of the oneof policy name defined in MaintenancePolicy, and the referenced policy must define the same policy type. For complete details of MaintenancePolicy, please refer to go/cloud-saas-mw-ug.
    record {} maintenancePolicyNames?;
    # The MaintenanceSchedule contains the scheduling information of published maintenance schedule with same key as software_versions.
    record {} maintenanceSchedules?;
    # Maintenance settings associated with instance. Allows service producers and end users to assign settings that controls maintenance on this instance.
    GoogleCloudSaasacceleratorManagementProvidersV1MaintenanceSettings maintenanceSettings?;
    # Unique name of the resource. It uses the form: `projects/{project_id|project_number}/locations/{location_id}/instances/{instance_id}` Note: Either project_id or project_number can be used, but keep it consistent with other APIs (e.g. RescheduleUpdate)
    string name?;
    # Output only. Custom string attributes used primarily to expose producer-specific information in monitoring dashboards. See go/get-instance-metadata.
    record {} producerMetadata?;
    # Output only. The list of data plane resources provisioned for this instance, e.g. compute VMs. See go/get-instance-metadata.
    GoogleCloudSaasacceleratorManagementProvidersV1ProvisionedResource[] provisionedResources?;
    # Link to the SLM instance template. Only populated when updating SLM instances via SSA's Actuation service adaptor. Service producers with custom control plane (e.g. Cloud SQL) doesn't need to populate this field. Instead they should use software_versions.
    string slmInstanceTemplate?;
    # SloMetadata contains resources required for proper SLO classification of the instance.
    GoogleCloudSaasacceleratorManagementProvidersV1SloMetadata sloMetadata?;
    # Software versions that are used to deploy this instance. This can be mutated by rollout services.
    record {} softwareVersions?;
    # Output only. Current lifecycle state of the resource (e.g. if it's being created or ready to use).
    string state?;
    # Output only. ID of the associated GCP tenant project. See go/get-instance-metadata.
    string tenantProjectId?;
    # Output only. Timestamp when the resource was last modified.
    string updateTime?;
};

# SloEligibility is a tuple containing eligibility value: true if an instance is eligible for SLO calculation or false if it should be excluded from all SLO-related calculations along with a user-defined reason.
public type GoogleCloudSaasacceleratorManagementProvidersV1SloEligibility record {
    # Whether an instance is eligible or ineligible.
    boolean eligible?;
    # User-defined reason for the current value of instance eligibility. Usually, this can be directly mapped to the internal state. An empty reason is allowed.
    string reason?;
};

# Configure the schedule.
public type Schedule record {
    # Allows to define schedule that runs specified day of the week.
    string day?;
    # Output only. Duration of the time window, set by service producer.
    string duration?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay startTime?;
};

# File share configuration for the instance.
public type FileShareConfig record {
    # File share capacity in gigabytes (GB). Cloud Filestore defines 1 GB as 1024^3 bytes.
    string capacityGb?;
    # The name of the file share (must be 16 characters or less).
    string name?;
    # Nfs Export Options. There is a limit of 10 export options per file share.
    NfsExportOptions[] nfsExportOptions?;
    # The resource name of the backup, in the format projects/{project_number}/locations/{location_id}/backups/{backup_id}, that this file share has been restored from.
    string sourceBackup?;
};

# ListBackupsResponse is the result of ListBackupsRequest.
public type ListBackupsResponse record {
    # A list of backups in the project for the specified location. If the {location} value in the request is "-", the response contains a list of backups from all locations. If any location is unreachable, the response will only return backups in reachable locations and the "unreachable" field will be populated with a list of unreachable locations.
    Backup[] backups?;
    # The token you can use to retrieve the next page of results. Not returned if there are no more results in the list.
    string nextPageToken?;
    # Locations that could not be reached.
    string[] unreachable?;
};

# MaintenanceWindow definition.
public type MaintenanceWindow record {
    # Time window specified for daily operations.
    DailyCycle dailyCycle?;
    # Time window specified for weekly operations.
    WeeklyCycle weeklyCycle?;
};

# A resource that represents Google Cloud Platform location.
public type Location record {
    # The friendly name for this location, typically a nearby city name. For example, "Tokyo".
    string displayName?;
    # Cross-service attributes for the location. For example {"cloud.googleapis.com/region": "us-east1"}
    record {} labels?;
    # The canonical id for this location. For example: `"us-east1"`.
    string locationId?;
    # Service-specific metadata. For example the available capacity at the given location.
    record {} metadata?;
    # Resource name for the location, which may vary between implementations. For example: `"projects/example-project/locations/us-east1"`
    string name?;
};
