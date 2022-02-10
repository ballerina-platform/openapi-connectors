// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# An object that represents a set of mutable Analysis Services resource properties.
public type AnalysisServicesServerMutableProperties record {
    # An array of administrator user identities.
    ServerAdministrators asAdministrators?;
    # The SAS container URI to the backup container.
    string backupBlobContainerUri?;
    # The gateway details.
    GatewayDetails gatewayDetails?;
    # An array of firewall rules.
    IPv4FirewallSettings ipV4FirewallSettings?;
    # How the read-write server's participation in the query pool is controlled.<br/>It can have the following values: <ul><li>readOnly - indicates that the read-write server is intended not to participate in query operations</li><li>all - indicates that the read-write server can participate in query operations</li></ul>Specifying readOnly when capacity is 1 results in error.
    string querypoolConnectionMode?;
    # The managed mode of the server (0 = not managed, 1 = managed).
    int managedMode?;
    # The server monitor mode for AS server
    int serverMonitorMode?;
};

# The detail of firewall rule.
public type IPv4FirewallRule record {
    # The rule name.
    string firewallRuleName?;
    # The start range of IPv4.
    string rangeStart?;
    # The end range of IPv4.
    string rangeEnd?;
};

# A Consumption REST API operation.
public type Operation record {
    # Operation name: {provider}/{resource}/{operation}.
    string name?;
    # The object that represents the operation.
    OperationDisplay display?;
    # The origin
    string origin?;
    # Additional properties to expose performance metrics to shoebox.
    OperationProperties properties?;
};

# Status of gateway is live.
public type GatewayListStatusLive record {
    # Live message of list gateway. Status: 0 - Live
    int status?;
};

# The log metric specification for exposing performance metrics to shoebox.
public type LogSpecifications record {
    # The name of metric.
    string name?;
    # The displayed name of log.
    string displayName?;
    # The blob duration for the log.
    string blobDuration?;
};

# The gateway details.
public type GatewayDetails record {
    # Gateway resource to be associated with the server.
    string gatewayResourceId?;
    # Gateway object id from in the DMTS cluster for the gateway resource.
    string gatewayObjectId?;
    # Uri of the DMTS cluster.
    string dmtsClusterUri?;
};

# The resource management error additional info.
public type ErrorAdditionalInfo record {
    # The additional info type.
    string 'type?;
    # The additional info.
    record {} info?;
};

# The object that represents the operation.
public type OperationDisplay record {
    # Service provider: Microsoft.Consumption.
    string provider?;
    # Resource on which the operation is performed: UsageDetail, etc.
    string 'resource?;
    # Operation type: Read, write, delete, etc.
    string operation?;
    # Description of the operation object.
    string description?;
};

# An object that represents SKU details for existing resources.
public type SkuDetailsForExistingResource record {
    # Represents the SKU name and Azure pricing tier for Analysis Services resource.
    ResourceSku sku?;
    # The resource type.
    string resourceType?;
};

# An object that represents enumerating SKUs for existing resources.
public type SkuEnumerationForExistingResourceResult record {
    # The collection of available SKUs for existing resources.
    SkuDetailsForExistingResource[] value?;
};

# The error detail.
public type ErrorDetail record {
    # The error code.
    string code?;
    # The error message.
    string message?;
    # The error target.
    string target?;
    # The error sub code
    int subCode?;
    # The http status code
    int httpStatusCode?;
    # the timestamp for the error.
    string timeStamp?;
    # The error details.
    ErrorDetail[] details?;
    # The error additional info.
    ErrorAdditionalInfo[] additionalInfo?;
};

# The status of operation.
public type OperationStatus record {
    # The operation Id.
    string id?;
    # The operation name.
    string name?;
    # The start time of the operation.
    string startTime?;
    # The end time of the operation.
    string endTime?;
    # The status of the operation.
    string status?;
    # The error detail.
    ErrorDetail _error?;
};

# Provision request specification
public type AnalysisServicesServerUpdateParameters record {
    # Represents the SKU name and Azure pricing tier for Analysis Services resource.
    ResourceSku sku?;
    # Key-value pairs of additional provisioning properties.
    record {} tags?;
    # An object that represents a set of mutable Analysis Services resource properties.
    AnalysisServicesServerMutableProperties properties?;
};

# Result of listing consumption operations. It contains a list of operations and a URL link to get the next set of results.
public type OperationListResult record {
    # List of analysis services operations supported by the Microsoft.AnalysisServices resource provider.
    Operation[] value?;
    # URL to get the next set of operation list results if there are any.
    string nextLink?;
};

# An array of administrator user identities.
public type ServerAdministrators record {
    # An array of administrator user identities.
    string[] members?;
};

# The error detail.
public type GatewayError ErrorDetail;

# Performance metrics to shoebox.
public type OperationPropertiesServicespecification record {
    # The metric specifications.
    MetricSpecifications[] metricSpecifications?;
    # The log specifications.
    LogSpecifications[] logSpecifications?;
};

# An object that represents enumerating SKUs for new resources.
public type SkuEnumerationForNewResourceResult record {
    # The collection of available SKUs for new resources.
    ResourceSku[] value?;
};

# An array of firewall rules.
public type IPv4FirewallSettings record {
    # An array of firewall rules.
    IPv4FirewallRule[] firewallRules?;
    # The indicator of enabling PBI service.
    boolean enablePowerBIService?;
};

# Metric dimension.
public type MetricDimensions record {
    # Dimension name.
    string name?;
    # Dimension display name.
    string displayName?;
};

# Represents an instance of an Analysis Services resource.
public type Resource record {
    # An identifier that represents the Analysis Services resource.
    string id?;
    # The name of the Analysis Services resource.
    string name?;
    # The type of the Analysis Services resource.
    string 'type?;
    # Location of the Analysis Services resource.
    string location;
    # Represents the SKU name and Azure pricing tier for Analysis Services resource.
    ResourceSku sku;
    # Key-value pairs of additional resource provisioning properties.
    record {} tags?;
};

# Describes the format of Error response.
public type ErrorResponse record {
    # The error detail.
    ErrorDetail _error?;
};

# Represents the SKU name and Azure pricing tier for Analysis Services resource.
public type ResourceSku record {
    # Name of the SKU level.
    string name;
    # The name of the Azure pricing tier to which the SKU applies.
    string tier?;
    # The number of instances in the read only query pool.
    int capacity?;
};

# The checking result of server name availability.
public type CheckServerNameAvailabilityResult record {
    # Indicator of available of the server name.
    boolean nameAvailable?;
    # The reason of unavailability.
    string reason?;
    # The detailed message of the request unavailability.
    string message?;
};

# Additional properties to expose performance metrics to shoebox.
public type OperationProperties record {
    # Performance metrics to shoebox.
    OperationPropertiesServicespecification serviceSpecification?;
};

# Represents an instance of an Analysis Services resource.
public type AnalysisServicesServer record {
    *Resource;
};

# Details of server name request body.
public type CheckServerNameAvailabilityParameters record {
    # Name for checking availability.
    string name?;
    # The resource type of azure analysis services.
    string 'type?;
};

# An array of Analysis Services resources.
public type AnalysisServicesServers record {
    # An array of Analysis Services resources.
    AnalysisServicesServer[] value;
};

# Available operation metric specification for exposing performance metrics to shoebox.
public type MetricSpecifications record {
    # The name of metric.
    string name?;
    # The displayed name of metric.
    string displayName?;
    # The displayed description of metric.
    string displayDescription?;
    # The unit of the metric.
    string unit?;
    # The aggregation type of metric.
    string aggregationType?;
    # The dimensions of metric.
    MetricDimensions[] dimensions?;
};

# Properties of Analysis Services resource.
public type AnalysisServicesServerProperties record {
    *AnalysisServicesServerMutableProperties;
};

public type GatewayListStatusError record {
    GatewayError _error?;
};
