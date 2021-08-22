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

# Compilation error when evaluating route
public type RouteCompilationError record {
    # Range of route errors
    RouteErrorRange location?;
    # Route error message
    string message?;
    # Severity of the route error
    string severity?;
};

# Input for testing all routes
public type TestAllRoutesInput record {
    # Routing message
    RoutingMessage message?;
    # Routing source
    string routingSource?;
    # Twin reference input parameter. This is an optional parameter
    RoutingTwin twin?;
};

# Detailed result of testing a route
public type TestRouteResultDetails record {
    # JSON-serialized list of route compilation errors
    RouteCompilationError[] compilationErrors?;
};

# The properties of the provisioned Event Hub-compatible endpoint used by the IoT hub.
public type EventHubProperties record {
    # The Event Hub-compatible endpoint.
    string endpoint?;
    # The number of partitions for receiving device-to-cloud messages in the Event Hub-compatible endpoint. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages.
    int partitionCount?;
    # The partition ids in the Event Hub-compatible endpoint.
    string[] partitionIds?;
    # The Event Hub-compatible name.
    string path?;
    # The retention time for device-to-cloud messages in days. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages
    int retentionTimeInDays?;
};

# The JSON-serialized array of Certificate objects.
public type CertificateListDescription record {
    # The array of Certificate objects.
    CertificateDescription[] value?;
};

public type RoutingtwinProperties record {
    # Twin desired properties
    record  { }  desired?;
    # Twin desired properties
    record  { }  reported?;
};

# Name of Iot Hub type
public type Name record {
    # Localized value of name
    string localizedValue?;
    # IotHub type
    string value?;
};

# The properties of a routing rule that your IoT hub uses to route messages to endpoints.
public type RouteProperties record {
    # The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default. For grammar, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-query-language
    string condition?;
    # The list of endpoints to which messages that satisfy the condition are routed. Currently only one endpoint is allowed.
    string[] endpointNames;
    # Used to specify whether a route is enabled.
    boolean isEnabled;
    # The name of the route. The name can only include alphanumeric characters, periods, underscores, hyphens, has a maximum length of 64 characters, and must be unique.
    string name;
    # The source that the routing rule is to be applied to, such as DeviceMessages.
    string 'source;
};

# The JSON-serialized array of JobResponse objects with a next link.
public type JobResponseListResult record {
    # The next link.
    string nextLink?;
    # The array of JobResponse objects.
    JobResponse[] value?;
};

# The JSON-serialized array of IotHubDescription objects with a next link.
public type IotHubDescriptionListResult record {
    # The next link.
    string nextLink?;
    # The array of IotHubDescription objects.
    IotHubDescription[] value?;
};

# The properties of the messaging endpoints used by this IoT hub.
public type MessagingEndpointProperties record {
    # The lock duration. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-file-upload.
    string lockDurationAsIso8601?;
    # The number of times the IoT hub attempts to deliver a message. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-file-upload.
    int maxDeliveryCount?;
    # The period of time for which a message is available to consume before it is expired by the IoT hub. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-file-upload.
    string ttlAsIso8601?;
};

# The properties of the feedback queue for cloud-to-device messages.
public type FeedbackProperties record {
    # The lock duration for the feedback queue. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#cloud-to-device-messages.
    string lockDurationAsIso8601?;
    # The number of times the IoT hub attempts to deliver a message on the feedback queue. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#cloud-to-device-messages.
    int maxDeliveryCount?;
    # The period of time for which a message is available to consume before it is expired by the IoT hub. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#cloud-to-device-messages.
    string ttlAsIso8601?;
};

# Json-serialized array of User subscription quota response
public type UserSubscriptionQuotaListResult record {
    string nextLink?;
    UserSubscriptionQuota[] value?;
};

# Result of the request to list IoT Hub operations. It contains a list of operations and a URL link to get the next set of results.
public type OperationListResult record {
    # URL to get the next set of operation list results if there are any.
    string nextLink?;
    # List of IoT Hub operations supported by the Microsoft.Devices resource provider.
    Operation[] value?;
};

# The properties of the Azure Storage endpoint for file upload.
public type StorageEndpointProperties record {
    # The connection string for the Azure Storage account to which files are uploaded.
    string connectionString;
    # The name of the root container where you upload files. The container need not exist but should be creatable using the connectionString specified.
    string containerName;
    # The period of time for which the SAS URI generated by IoT Hub for file upload is valid. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-file-upload#file-upload-notification-configuration-options.
    string sasTtlAsIso8601?;
};

# The X509 Certificate.
public type CertificateWithNonceDescription record {
    # The entity tag.
    string etag?;
    # The resource identifier.
    string id?;
    # The name of the certificate.
    string name?;
    # The description of an X509 CA Certificate including the challenge nonce issued for the Proof-Of-Possession flow.
    CertificatePropertiesWithNonce properties?;
    # The resource type.
    string 'type?;
};

# The IoT hub cloud-to-device messaging properties.
public type CloudToDeviceProperties record {
    # The default time to live for cloud-to-device messages in the device queue. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#cloud-to-device-messages.
    string defaultTtlAsIso8601?;
    # The properties of the feedback queue for cloud-to-device messages.
    FeedbackProperties feedback?;
    # The max delivery count for cloud-to-device messages in the device queue. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#cloud-to-device-messages.
    int maxDeliveryCount?;
};

# Use to provide failover region when requesting manual Failover for a hub.
public type FailoverInput record {
    # Region the hub will be failed over to
    string failoverRegion;
};

# The properties of an IoT hub shared access policy.
public type SharedAccessSignatureAuthorizationRule record {
    # The name of the shared access policy.
    string keyName;
    # The primary key.
    string primaryKey?;
    # The permissions assigned to the shared access policy.
    string rights;
    # The secondary key.
    string secondaryKey?;
};

# The properties of the fallback route. IoT Hub uses these properties when it routes messages to the fallback endpoint.
public type FallbackRouteProperties record {
    # The condition which is evaluated in order to apply the fallback route. If the condition is not provided it will evaluate to true by default. For grammar, See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-query-language
    string condition?;
    # The list of endpoints to which the messages that satisfy the condition are routed to. Currently only 1 endpoint is allowed.
    string[] endpointNames;
    # Used to specify whether the fallback route is enabled.
    boolean isEnabled;
    # The name of the route. The name can only include alphanumeric characters, periods, underscores, hyphens, has a maximum length of 64 characters, and must be unique.
    string name?;
    # The source to which the routing rule is to be applied to. For example, DeviceMessages
    string 'source;
};

# Routes that matched
public type MatchedRoute record {
    # The properties of a routing rule that your IoT hub uses to route messages to endpoints.
    RouteProperties properties?;
};

# A container holding only the Tags for a resource, allowing the user to update the tags on an IoT Hub instance.
public type TagsResource record {
    # Resource tags
    record {} tags?;
};

# The properties related to service bus topic endpoint types.
public type RoutingServiceBusTopicEndpointProperties record {
    # The connection string of the service bus topic endpoint.
    string connectionString;
    # The name that identifies this endpoint. The name can only include alphanumeric characters, periods, underscores, hyphens and has a maximum length of 64 characters. The following names are reserved:  events, fileNotifications, $default. Endpoint names must be unique across endpoint types.  The name need not be the same as the actual topic name.
    string name;
    # The name of the resource group of the service bus topic endpoint.
    string resourceGroup?;
    # The subscription identifier of the service bus topic endpoint.
    string subscriptionId?;
};

# The common properties of an Azure resource.
public type Resource record {
    # The resource identifier.
    string id?;
    # The resource location.
    string location;
    # The resource name.
    string name?;
    # The resource tags.
    record {} tags?;
    # The resource type.
    string 'type?;
};

# SKU properties.
public type IotHubSkuDescription record {
    # IoT Hub capacity information.
    IotHubCapacity capacity;
    # The type of the resource.
    string resourceType?;
    # Information about the SKU of the IoT hub.
    IotHubSkuInfo sku;
};

# The JSON-serialized array of IotHubSkuDescription objects with a next link.
public type IotHubSkuDescriptionListResult record {
    # The next link.
    string nextLink?;
    # The array of IotHubSkuDescription.
    IotHubSkuDescription[] value?;
};

# The description of the IoT hub.
public type IotHubDescription record {
    *Resource;
};

# The properties related to the custom endpoints to which your IoT hub routes messages based on the routing rules. A maximum of 10 custom endpoints are allowed across all endpoint types for paid hubs and only 1 custom endpoint is allowed across all endpoint types for free hubs.
public type RoutingEndpoints record {
    # The list of Event Hubs endpoints that IoT hub routes messages to, based on the routing rules. This list does not include the built-in Event Hubs endpoint.
    RoutingEventHubProperties[] eventHubs?;
    # The list of Service Bus queue endpoints that IoT hub routes the messages to, based on the routing rules.
    RoutingServiceBusQueueEndpointProperties[] serviceBusQueues?;
    # The list of Service Bus topic endpoints that the IoT hub routes the messages to, based on the routing rules.
    RoutingServiceBusTopicEndpointProperties[] serviceBusTopics?;
    # The list of storage container endpoints that IoT hub routes messages to, based on the routing rules.
    RoutingStorageContainerProperties[] storageContainers?;
};

# The properties of an enrichment that your IoT hub applies to messages delivered to endpoints.
public type EnrichmentProperties record {
    # The list of endpoints for which the enrichment is applied to the message.
    string[] endpointNames;
    # The key or name for the enrichment property.
    string 'key;
    # The value for the enrichment property.
    string value;
};

# Information about the SKU of the IoT hub.
public type IotHubSkuInfo record {
    # The number of provisioned IoT Hub units. See: https://docs.microsoft.com/azure/azure-subscription-service-limits#iot-hub-limits.
    int capacity?;
    # The name of the SKU.
    string name;
    # The billing tier for the IoT hub.
    string tier?;
};

# Identity registry statistics.
public type RegistryStatistics record {
    # The count of disabled devices in the identity registry.
    int disabledDeviceCount?;
    # The count of enabled devices in the identity registry.
    int enabledDeviceCount?;
    # The total count of devices in the identity registry.
    int totalDeviceCount?;
};

# The properties related to an event hub endpoint.
public type RoutingEventHubProperties record {
    # The connection string of the event hub endpoint. 
    string connectionString;
    # The name that identifies this endpoint. The name can only include alphanumeric characters, periods, underscores, hyphens and has a maximum length of 64 characters. The following names are reserved:  events, fileNotifications, $default. Endpoint names must be unique across endpoint types.
    string name;
    # The name of the resource group of the event hub endpoint.
    string resourceGroup?;
    # The subscription identifier of the event hub endpoint.
    string subscriptionId?;
};

# Result of testing all routes
public type TestAllRoutesResult record {
    # JSON-serialized array of matched routes
    MatchedRoute[] routes?;
};

# The description of an X509 CA Certificate including the challenge nonce issued for the Proof-Of-Possession flow.
public type CertificatePropertiesWithNonce record {
    # The certificate content
    string certificate?;
    # The certificate's create date and time.
    string created?;
    # The certificate's expiration date and time.
    string expiry?;
    # Determines whether certificate has been verified.
    boolean isVerified?;
    # The certificate's subject name.
    string subject?;
    # The certificate's thumbprint.
    string thumbprint?;
    # The certificate's last update date and time.
    string updated?;
    # The certificate's verification code that will be used for proof of possession.
    string verificationCode?;
};

# The properties related to a storage container endpoint.
public type RoutingStorageContainerProperties record {
    # Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds.
    int batchFrequencyInSeconds?;
    # The connection string of the storage account.
    string connectionString;
    # The name of storage container in the storage account.
    string containerName;
    # Encoding that is used to serialize messages to blobs. Supported values are 'avro', 'avrodeflate', and 'JSON'. Default value is 'avro'.
    string encoding?;
    # File name format for the blob. Default format is {iothub}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}. All parameters are mandatory but can be reordered.
    string fileNameFormat?;
    # Maximum number of bytes for each blob written to storage. Value should be between 10485760(10MB) and 524288000(500MB). Default value is 314572800(300MB).
    int maxChunkSizeInBytes?;
    # The name that identifies this endpoint. The name can only include alphanumeric characters, periods, underscores, hyphens and has a maximum length of 64 characters. The following names are reserved:  events, fileNotifications, $default. Endpoint names must be unique across endpoint types.
    string name;
    # The name of the resource group of the storage account.
    string resourceGroup?;
    # The subscription identifier of the storage account.
    string subscriptionId?;
};

# Input for testing route
public type TestRouteInput record {
    # Routing message
    RoutingMessage message?;
    # The properties of a routing rule that your IoT hub uses to route messages to endpoints.
    RouteProperties route;
    # Twin reference input parameter. This is an optional parameter
    RoutingTwin twin?;
};

# The health data for an endpoint
public type EndpointHealthData record {
    # Id of the endpoint
    string endpointId?;
    # Health statuses have following meanings. The 'healthy' status shows that the endpoint is accepting messages as expected. The 'unhealthy' status shows that the endpoint is not accepting messages as expected and IoT Hub is retrying to send data to this endpoint. The status of an unhealthy endpoint will be updated to healthy when IoT Hub has established an eventually consistent state of health. The 'dead' status shows that the endpoint is not accepting messages, after IoT Hub retried sending messages for the retrial period. See IoT Hub metrics to identify errors and monitor issues with endpoints. The 'unknown' status shows that the IoT Hub has not established a connection with the endpoint. No messages have been delivered to or rejected from this endpoint
    string healthStatus?;
};

# The JSON-serialized array of Event Hub-compatible consumer group names with a next link.
public type EventHubConsumerGroupsListResult record {
    # The next link.
    string nextLink?;
    # List of consumer groups objects
    EventHubConsumerGroupInfo[] value?;
};

# Public representation of one of the locations where a resource is provisioned.
public type IotHubLocationDescription record {
    # The name of the Azure region
    string location?;
    # The role of the region, can be either primary or secondary. The primary region is where the IoT hub is currently provisioned. The secondary region is the Azure disaster recovery (DR) paired region and also the region where the IoT hub can failover to.
    string role?;
};

# Range of route errors
public type RouteErrorRange record {
    # Position where the route error happened
    RouteErrorPosition end?;
    # Position where the route error happened
    RouteErrorPosition 'start?;
};

# The properties indicating whether a given IoT hub name is available.
public type IotHubNameAvailabilityInfo record {
    # The detailed reason message.
    string message?;
    # The value which indicates whether the provided name is available.
    boolean nameAvailable?;
    # The reason for unavailability.
    string reason?;
};

# Quota metrics properties.
public type IotHubQuotaMetricInfo record {
    # The current value for the quota metric.
    int currentValue?;
    # The maximum value of the quota metric.
    int maxValue?;
    # The name of the quota metric.
    string name?;
};

# The properties of the Job Response object.
public type JobResponse record {
    # The time the job stopped processing.
    string endTimeUtc?;
    # If status == failed, this string containing the reason for the failure.
    string failureReason?;
    # The job identifier.
    string jobId?;
    # The job identifier of the parent job, if any.
    string parentJobId?;
    # The start time of the job.
    string startTimeUtc?;
    # The status of the job.
    string status?;
    # The status message for the job.
    string statusMessage?;
    # The type of the job.
    string 'type?;
};

# The properties of an IoT hub.
public type IotHubProperties record {
    # The shared access policies you can use to secure a connection to the IoT hub.
    SharedAccessSignatureAuthorizationRule[] authorizationPolicies?;
    # The IoT hub cloud-to-device messaging properties.
    CloudToDeviceProperties cloudToDevice?;
    # IoT hub comments.
    string comments?;
    # If True, file upload notifications are enabled.
    boolean enableFileUploadNotifications?;
    # The Event Hub-compatible endpoint properties. The only possible keys to this dictionary is events. This key has to be present in the dictionary while making create or update calls for the IoT hub.
    record {} eventHubEndpoints?;
    # The capabilities and features enabled for the IoT hub.
    string features?;
    # The name of the host.
    string hostName?;
    # The IP filter rules.
    IpFilterRule[] ipFilterRules?;
    # Primary and secondary location for iot hub
    IotHubLocationDescription[] locations?;
    # The messaging endpoint properties for the file upload notification queue.
    record {} messagingEndpoints?;
    # The provisioning state.
    string provisioningState?;
    # The routing related properties of the IoT hub. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging
    RoutingProperties routing?;
    # The hub state.
    string state?;
    # The list of Azure Storage endpoints where you can upload files. Currently you can configure only one Azure Storage account and that MUST have its key as $default. Specifying more than one storage account causes an error to be thrown. Not specifying a value for this property when the enableFileUploadNotifications property is set to True, causes an error to be thrown.
    record {} storageEndpoints?;
};

# Error details.
public type ErrorDetails record {
    # The error code.
    string code?;
    # The error details.
    string details?;
    # The HTTP status code.
    string httpStatusCode?;
    # The error message.
    string message?;
};

# IoT Hub REST API operation
public type Operation record {
    # The object that represents the operation.
    OperationDisplay display?;
    # Operation name: {provider}/{resource}/{read | write | action | delete}
    string name?;
};

# The object that represents the operation.
public type OperationDisplay record {
    # Description of the operation
    string description?;
    # Name of the operation
    string operation?;
    # Service provider: Microsoft Devices
    string provider?;
    # Resource Type: IotHubs
    string 'resource?;
};

# The IP filter rules for the IoT hub.
public type IpFilterRule record {
    # The desired action for requests captured by this rule.
    string action;
    # The name of the IP filter rule.
    string filterName;
    # A string that contains the IP address range in CIDR notation for the rule.
    string ipMask;
};

# The JSON-serialized array of IotHubQuotaMetricInfo objects with a next link.
public type IotHubQuotaMetricInfoListResult record {
    # The next link.
    string nextLink?;
    # The array of quota metrics objects.
    IotHubQuotaMetricInfo[] value?;
};

# The JSON-serialized array of EndpointHealthData objects with a next link.
public type EndpointHealthDataListResult record {
    # Link to more results
    string nextLink?;
    # JSON-serialized array of Endpoint health data
    EndpointHealthData[] value?;
};

# The JSON-serialized leaf certificate
public type CertificateVerificationDescription record {
    # base-64 representation of X509 certificate .cer file or just .pem file content.
    string certificate?;
};

# Use to provide parameters when requesting an export of all devices in the IoT hub.
public type ExportDevicesRequest record {
    # The value indicating whether keys should be excluded during export.
    boolean excludeKeys;
    # The export blob container URI.
    string exportBlobContainerUri;
};

# Position where the route error happened
public type RouteErrorPosition record {
    # Column where the route error happened
    int column?;
    # Line where the route error happened
    int line?;
};

# The routing related properties of the IoT hub. See: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging
public type RoutingProperties record {
    # The properties related to the custom endpoints to which your IoT hub routes messages based on the routing rules. A maximum of 10 custom endpoints are allowed across all endpoint types for paid hubs and only 1 custom endpoint is allowed across all endpoint types for free hubs.
    RoutingEndpoints endpoints?;
    # The list of user-provided enrichments that the IoT hub applies to messages to be delivered to built-in and custom endpoints. See: https://aka.ms/telemetryoneventgrid
    EnrichmentProperties[] enrichments?;
    # The properties of the fallback route. IoT Hub uses these properties when it routes messages to the fallback endpoint.
    FallbackRouteProperties fallbackRoute?;
    # The list of user-provided routing rules that the IoT hub uses to route messages to built-in and custom endpoints. A maximum of 100 routing rules are allowed for paid hubs and a maximum of 5 routing rules are allowed for free hubs.
    RouteProperties[] routes?;
};

# Input values.
public type OperationInputs record {
    # The name of the IoT hub to check.
    string name;
};

# The description of an X509 CA Certificate.
public type CertificateProperties record {
    # The certificate content
    string certificate?;
    # The certificate's create date and time.
    string created?;
    # The certificate's expiration date and time.
    string expiry?;
    # Determines whether certificate has been verified.
    boolean isVerified?;
    # The certificate's subject name.
    string subject?;
    # The certificate's thumbprint.
    string thumbprint?;
    # The certificate's last update date and time.
    string updated?;
};

# User subscription quota response
public type UserSubscriptionQuota record {
    # Current number of IotHub type
    int currentValue?;
    # IotHub type id
    string id?;
    # Numerical limit on IotHub type
    int 'limit?;
    # Name of Iot Hub type
    Name name?;
    # Response type
    string 'type?;
    # Unit of IotHub type
    string unit?;
};

# The X509 Certificate.
public type CertificateDescription record {
    # The entity tag.
    string etag?;
    # The resource identifier.
    string id?;
    # The name of the certificate.
    string name?;
    # The description of an X509 CA Certificate.
    CertificateProperties properties?;
    # The resource type.
    string 'type?;
};

# The properties related to service bus queue endpoint types.
public type RoutingServiceBusQueueEndpointProperties record {
    # The connection string of the service bus queue endpoint.
    string connectionString;
    # The name that identifies this endpoint. The name can only include alphanumeric characters, periods, underscores, hyphens and has a maximum length of 64 characters. The following names are reserved:  events, fileNotifications, $default. Endpoint names must be unique across endpoint types. The name need not be the same as the actual queue name.
    string name;
    # The name of the resource group of the service bus queue endpoint.
    string resourceGroup?;
    # The subscription identifier of the service bus queue endpoint.
    string subscriptionId?;
};

# Routing message
public type RoutingMessage record {
    # App properties
    record {} appProperties?;
    # Body of routing message
    string body?;
    # System properties
    record {} systemProperties?;
};

# Twin reference input parameter. This is an optional parameter
public type RoutingTwin record {
    RoutingtwinProperties properties?;
    # Twin Tags
    record  { }  tags?;
};

# IoT Hub capacity information.
public type IotHubCapacity record {
    # The default number of units.
    int 'default?;
    # The maximum number of units.
    int maximum?;
    # The minimum number of units.
    int minimum?;
    # The type of the scaling enabled.
    string scaleType?;
};

# The JSON-serialized X509 Certificate.
public type CertificateBodyDescription record {
    # base-64 representation of the X509 leaf certificate .cer file or just .pem file content.
    string certificate?;
};

# The properties of the EventHubConsumerGroupInfo object.
public type EventHubConsumerGroupInfo record {
    # The etag.
    string etag?;
    # The Event Hub-compatible consumer group identifier.
    string id?;
    # The Event Hub-compatible consumer group name.
    string name?;
    # The tags.
    record {} properties?;
    # the resource type.
    string 'type?;
};

# The list of shared access policies with a next link.
public type SharedAccessSignatureAuthorizationRuleListResult record {
    # The next link.
    string nextLink?;
    # The list of shared access policies.
    SharedAccessSignatureAuthorizationRule[] value?;
};

# Use to provide parameters when requesting an import of all devices in the hub.
public type ImportDevicesRequest record {
    # The input blob container URI.
    string inputBlobContainerUri;
    # The output blob container URI.
    string outputBlobContainerUri;
};

# Result of testing one route
public type TestRouteResult record {
    # Detailed result of testing a route
    TestRouteResultDetails details?;
    # Result of testing route
    string result?;
};
