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

# A Power BI Installed App
public type App record {
    # The app id
    string id;
    # The app name
    string name?;
    # The app description
    string description?;
    # The last time the app was updated
    string lastUpdate?;
    # The app publisher
    string publishedBy?;
};

# Power BI dataset parameter
public type MashupParameter record {
    # The parameter name
    string name;
    # The parameter type
    string 'type;
    # The parameter current value
    string currentValue?;
    # Is dataset parameter required
    boolean isRequired;
    # List of the parameter suggested values
    string[] suggestedValues?;
};

# Power BI request to restore a deleted group
public type GroupRestoreRequest record {
    # The name of the group to be restored.
    string name?;
    # The email address of the owner of the group to be restored.
    string emailAddress;
};

# Workspace info response
public type WorkspaceInfoResponse record {
    # The workspace info associated with this scan
    WorkspaceInfo[] workspaces?;
    # The datasources' instances associated with this scan
    Datasource[] datasourceInstances?;
};

# The import object
public type Import record {
    # The import id
    string id;
    # The import name
    string name?;
    # The import upload state
    string importState?;
    # The reports associated with this import
    Report[] reports?;
    # The datasets associated with this import
    Dataset[] datasets?;
    # Import creation time
    string createdDateTime?;
    # Import last update time
    string updatedDateTime?;
};

# Artifact sensitivity label info
public type SensitivityLabel record {
    # The sensitivity label ID
    string labelId;
};

# Encryption information for a dataset
public type Encryption record {
    # Dataset encryption status
    string EncryptionStatus?;
};

# A blob for specifying the identity. Only supported for datasets with Direct Query connection to SQL Azure
public type IdentityBlob record {
    # OAuth2 access token for SQL Azure
    string value;
};

# Status of dataflow refresh transaction
public type DataflowTransactionStatus record {
    # Transaction id
    string transactionId?;
    # Status of transaction
    string status?;
};

# Power BI create a new group request
public type GroupCreationRequest record {
    # The name of the newly created group
    string name;
};

# The bind dataset to gateway request
public type BindToGatewayRequest record {
    # The gateway id
    string gatewayObjectId;
    # datasourceObjectIds belonging to the gateway
    string[] datasourceObjectIds?;
};

# Power BI dataset parameter update details
public type UpdateMashupParameterDetails record {
    # The parameter name
    string name;
    # The parameter new value
    string newValue?;
};

# Defines the user identity and roles, for more details see this [article](https://docs.microsoft.com/power-bi/developer/embedded-row-level-security)
public type EffectiveIdentity record {
    # The effective username reflected by a token for applying RLS rules (For OnPrem model, username can be composed of alpha-numerical characters or any of the following characters  '.', '-', '_', '!', '#', '^', '~', '\\', '@', also username cannot contain spaces. For Cloud model, username can be composed of all ASCII characters. username must be up to 256 characters)
    string username;
    # An array of datasets for which this identity applies
    string[] datasets?;
    # An array of RLS roles reflected by a token when applying RLS rules (identity can contain up to 50 roles, role can be composed of any character besides ',' and must be up to 50 characters)
    string[] roles?;
    # The value of customdata to be used for applying RLS rules. Only supported for live connections to Azure Analysis Services.
    string customData?;
    # A blob for specifying the identity. Only supported for datasets with Direct Query connection to SQL Azure
    IdentityBlob identityBlob?;
    # An array of reports for which this identity applies, Only supported for paginated reports
    string[] reports?;
};

# Power BI Generate Token Request
public type GenerateTokenRequest record {
    # Required access level for EmbedToken generation
    string accessLevel?;
    # Dataset id for report creation. Only applies when generating EmbedToken for report creation.
    string datasetId?;
    # Indicates an embedded report can be saved as a new report. Default value is 'false'. Only applies when generating EmbedToken for report embedding.
    boolean allowSaveAs?;
    # List of identities to use for RLS rules.
    EffectiveIdentity[] identities?;
};

# Odata response wrapper for a Power BI dependent dataflows list
public type DependentDataflows record {
    # The dependent dataflows
    DependentDataflow[] value?;
};

# Power BI  refresh schedule request for DirectQuery or LiveConnection 
public type DirectQueryRefreshScheduleRequest record {
    # A Power BI refresh schedule for DirectQuery or LiveConnection, specified by setting either the frequency or a combination of days and times.
    DirectQueryRefreshSchedule value;
};

# A Power BI capacity
public type Capacity record {
    # The capacity id
    string id;
    # The capacity display name
    string displayName?;
    # An array of capacity admins.
    string[] admins?;
    # The capacity SKU.
    string sku?;
    # The capacity state
    string state;
    # Access right user has on the capacity
    string capacityUserAccessRight;
    # The Azure region where the capacity is provisioned
    string region?;
    # The id of the encryption key (Only applicable for admin route)
    string tenantKeyId?;
    # Encryption key information
    TenantKey tenantKey?;
};

# A Power BI measure
public type Measure record {
    # The measure name
    string name;
    # A valid DAX expression
    string expression;
    # (Optional) A string describing how the value should be formatted when it is displayed as specified in [FORMAT_STRING](https://docs.microsoft.com/analysis-services/multidimensional-models/mdx/mdx-cell-properties-format-string-contents)
    string formatString?;
    # (Optional) Measure description
    string description?;
    # (Optional) Is measure hidden
    boolean isHidden?;
};

# A Power BI gateway public key
public type GatewayPublicKey record {
    # The public key exponent
    string exponent?;
    # The public key  modulus
    string modulus?;
};

# The dataset object for Generate Token Request V2.
public type GenerateTokenRequestV2Dataset record {
    # Dataset Id
    string id;
};

# Odata response wrapper for a Power BI available features list
public type AvailableFeatures record {
    # The available features list
    AvailableFeature[] features?;
};

# Paginated report Export to file configuration
public type PaginatedReportExportConfiguration record {
    # A single identity to use when exporting a report. Required when a report uses a Power BI dataset or an Azure AS datasource.
    EffectiveIdentity[] identities?;
    # Dictionary of format settings. The keys are the device info property names for the requested file format.
    record {} formatSettings?;
    # List of report parameters
    ParameterValue[] parameterValues?;
};

# The bookmark to apply on a single page. Provide name or state, but not both.
public type PageBookmark record {
    # The bookmark name
    string name?;
    # The bookmark state
    string state?;
};

# Artifact ID with information protection label status
public type ChangeLabelStatus record {
    # Unique artifact Id, uuid format for dashboard/report/dataflow, and string format for dataset.
    string id;
    # Indicates the result of the label change operation
    string status;
};

# A Power BI datasource
public type Datasource record {
    # (Deprecated) The datasource name. Available only for DirectQuery.
    string name?;
    # (Deprecated) The datasource connection string. Available only for DirectQuery.
    string connectionString?;
    # The datasource type
    string datasourceType?;
    # A Power BI datasource connection details
    DatasourceConnectionDetails connectionDetails?;
    # The bound gateway id. Empty when not bound to a gateway.
    string gatewayId?;
    # The bound datasource id. Empty when not bound to a gateway.
    string datasourceId?;
};

# A Power BI dataset
public type CreateDatasetRequest record {
    # The dataset name
    string name;
    # The dataset tables.
    Table[] tables;
    # The dataset relationships.
    Relationship[] relationships?;
    # The datasources associated with this dataset.
    Datasource[] datasources?;
    # The dataset mode or type.
    string defaultMode?;
};

# Data contract for paginated report parameters
public type ParameterValue record {
    # The parameter name
    string name?;
    # The parameter value
    string value?;
};

# A modified workspace
public type ModifiedWorkspace record {
    # The workspace object ID.
    string Id;
};

# Source from existing report
public type SourceReport record {
    # source report id
    string sourceReportId;
    # source worksapce id
    string sourceWorkspaceId?;
};

# Assignment contract for migrating workspaces to shared capacity as tenant admin
public type CapacityMigrationAssignment record {
    # Workspaces to be migrated to shared capacity
    string[] workspacesToAssign;
    # Capacity id
    string targetCapacityObjectId;
};

# Odata response wrapper for a Power BI dataset parameter list
public type MashupParameters record {
    # The dataset parameter List
    MashupParameter[] value?;
};

# A Power BI refreshable
public type Refreshable record {
    # Object id of refreshable
    string id?;
    # Display name of refreshable
    string name?;
    # The refreshable kind
    string kind?;
    # The start time of the window for which summary data exists
    string startTime?;
    # The end time of the window for which summary data exists
    string endTime?;
    # The number of refreshes within the summary time window
    int refreshCount?;
    # The number of refresh failures within the summary time window
    int refreshFailures?;
    # The average duration in seconds of a refresh within the summary time window
    decimal averageDuration?;
    # The median duration in seconds of a refresh within the summary time window
    decimal medianDuration?;
    # The number of refreshes per day within the summary time window
    int refreshesPerDay?;
    # A Power BI refresh history entry
    Refresh lastRefresh?;
    # A Power BI refresh schedule for cached model
    RefreshSchedule refreshSchedule?;
    # Refreshable owners
    string[] configuredBy?;
    # A Power BI capacity
    Capacity capacity?;
    # A Power BI group
    Group group?;
};

# Odata response wrapper for a Power BI capacity list
public type Capacities record {
    # The Capacity List
    Capacity[] value?;
};

# A Power BI refresh schedule for cached model
public type RefreshSchedule record {
    # Days to execute the refresh
    string[] days?;
    # Times to execute the refresh within each day
    string[] times?;
    # Is the refresh enabled
    boolean enabled?;
    # The Id of the Time zone to use. See [Time Zone Info](https://docs.microsoft.com/dotnet/api/system.timezoneinfo.id).
    string localTimeZoneId?;
    # Notification option at scheduled refresh termination
    string NotifyOption?;
};

# Odata response wrapper for a Power BI page collection
public type Pages record {
    # The page collection
    Page[] value?;
};

# Power BI clone tile request
public type CloneTileRequest record {
    # The target dashboard id
    string targetDashboardId;
    # Optional parameter for specifying the target workspace id. Empty Guid (00000000-0000-0000-0000-000000000000) indicates 'My Workspace'. <br/>If not provided, tile will be cloned within the same workspace as the source tile.
    string targetWorkspaceId?;
    # Optional parameter <br/>When cloning a tile linked to a report, pass the target report id to rebind the new tile to a different report.
    string targetReportId?;
    # Optional parameter <br/>When cloning a tile linked to a dataset, pass the target model id to rebind the new tile to a different dataset.
    string targetModelId?;
    # Optional parameter for specifying the action in case of position conflict. <br/>If not provided, 'Tail' is used. <br/>If there is no conflict, clone tile to same position as in source.
    string positionConflictAction?;
};

# Power BI available feature
public type AvailableFeature record {
    # The feature name
    string name;
    # The feature state
    string state;
    # The feature extended state
    string extendedState;
    # Additional feature information
    AdditionalFeatureInfo additionalInfo?;
};

# Encryption key information
public type TenantKey record {
    # The id of the encryption key
    string id?;
    # The name of the encryption key
    string name?;
    # Uri to the version of the Azure Key Vault key
    string keyVaultKeyIdentifier?;
    # Indicates that this key is set as default for the entire tenant. Any new capacity creation will inherit this key upon creation
    boolean isDefault?;
    # Encryption key creation time
    string createdAt?;
    # Encryption key last update time
    string updatedAt?;
};

# 
public type PostRowsRequest record {
    # An array of data rows pushed to a dataset table
    Object[] rows?;
};

# An update datasource to gateway request
public type UpdateDatasourceRequest record {
    # The credential details
    CredentialDetails credentialDetails;
};

# A Power BI refresh schedule for DirectQuery or LiveConnection, specified by setting either the frequency or a combination of days and times.
public type DirectQueryRefreshSchedule record {
    # the refresh frequency in minutes, supported values are 15, 30, 60, 120, and 180.
    int frequency?;
    # Days to execute the refresh
    string[] days?;
    # Times to execute the refresh within each day
    string[] times?;
    # The Id of the Time zone to use. See [Time Zone Info](https://docs.microsoft.com/dotnet/api/system.timezoneinfo.id).
    string localTimeZoneId?;
};

public type Object record {
};

# A paginated report datasources update request.
public type UpdateRdlDatasourcesRequest record {
    # The paginated report datasources update details.
    UpdateRdlDatasourceDetails[] updateDetails;
};

# Composite of artifact IDs that will be used to update the information protection labels of those artifacts.
public type InformationProtectionArtifactsChangeLabel record {
    # List of unique dashboard IDs.
    ArtifactId[] dashboards?;
    # List of unique report IDs.
    ArtifactId[] reports?;
    # List of unique dataset IDs.
    ArtifactStringId[] datasets?;
    # List of unique dataflow IDs.
    ArtifactId[] dataflows?;
};

# A required workspaces request
public type RequiredWorkspaces record {
    # Required workspace IDs to be scaned. It should contain 1-100 workspaces.
    string[] workspaces?;
};

# Power BI refresh request
public type RefreshRequest record {
    # Mail notification options (success and/or failure, or none)
    string notifyOption;
};

# A Power BI group
public type Group record {
    # The workspace id
    string id;
    # The group name
    string name?;
    # Is the group read only
    boolean isReadOnly?;
    # Is the group on dedicated capacity
    boolean isOnDedicatedCapacity?;
    # The capacity id
    string capacityId?;
    # The group description. Available only for admin API calls.
    string description?;
    # The type of group. Available only for admin API calls.
    string 'type?;
    # The group state. Available only for admin API calls.
    string state?;
    # The users that belong to the group, and their access rights. Available only for admin API calls.
    GroupUser[] users?;
    # The reports that belong to the group. Available only for admin API calls.
    Report[] reports?;
    # The dashboards that belong to the group. Available only for admin API calls.
    Dashboard[] dashboards?;
    # The datasets that belong to the group. Available only for admin API calls.
    Dataset[] datasets?;
    # The dataflows that belong to the group. Available only for admin API calls.
    Dataflow[] dataflows?;
    # The Power BI dataflow storage account id
    string dataflowStorageId?;
    # The workbooks that belong to the group. Available only for admin API calls.
    Workbook[] workbooks?;
};

# Delegated user details. The user must be an existing user in Power BI and Azure AAD, who has signed in to Power BI during the last 3 months.
public type DelegatedUser record {
    # Delegated user email address.
    string emailAddress;
};

# Odata response wrapper for a Power BI import collection
public type Imports record {
    # The imports collection
    Import[] value?;
};

# Power BI assign to Power BI dataflow storage account request
public type AssignToDataflowStorageRequest record {
    # The Power BI dataflow storage account id. To unassign the specified workspace from a Power BI dataflow storage account, an empty GUID (00000000-0000-0000-0000-000000000000) should be provided as dataflowStorageId.
    string dataflowStorageId;
};

# Power BI Template App Install Details
public type TemplateAppInstallDetails record {
    # Unique application Id.
    string appId;
    # Application version secure key
    string packageKey;
    # Application owner's tenant object Id
    string ownerTenantId;
    # Power BI Template App Automated install configuration. Dictionary of name-value pairs
    TemplateAppConfigurationRequest config?;
};

# A Power BI refresh history entry
public type Refresh record {
    # Type of refresh request
    string refreshType?;
    # DateTime of start
    string startTime?;
    # DateTime of termination (may be empty if refresh is progress)
    string endTime?;
    # Failure error code in json format (not empty only on error).
    string serviceExceptionJson?;
    # 'Unknown' - Unknown completion state or refresh is in progress. endTime will be empty with this status. <br/>'Completed' - refresh completed successfully <br/> 'Failed' - Refresh failed. serviceExceptionJson will contain the error. <br/>'Disabled' - Refresh disabled by Selective Refresh.
    string status?;
    # The identifier of the Refresh request. <br/>Please provide this identifier in all service requests
    string requestId?;
};

# 
public type UpdateDatasourceConnectionRequest record {
    # A Power BI datasource connection details
    DatasourceConnectionDetails connectionDetails;
    # A Power BI datasource
    Datasource datasourceSelector?;
};

# Odata response wrapper for a dataflow metadata list
public type Dataflows record {
    # The dataflow metadata List
    Dataflow[] value?;
};

# Odata response wrapper for a Power BI group list
public type Groups record {
    # The groups
    Group[] value?;
};

# The Export to file request
public type ExportReportRequest record {
    # Export to file format
    string format;
    # Power BI report Export to file configuration
    PowerBIReportExportConfiguration powerBIReportConfiguration?;
    # Paginated report Export to file configuration
    PaginatedReportExportConfiguration paginatedReportConfiguration?;
};

# Odata response wrapper for a Power BI table collection
public type Tables record {
    # The Power BI tables
    Table[] value?;
};

# An object describing Export to file details and current state
public type Export record {
    # The Export to file job ID
    string id?;
    # The start time of the Export to file job
    string createdDateTime?;
    # The time of last change in the Export to file job
    string lastActionDateTime?;
    # The ID of the exported report
    string reportId?;
    # The name of the exported report
    string reportName?;
    # The current state of the Export to file job
    string status?;
    # Indicate job progress as percentage
    @constraint:Int {maxValue: 100}
    int percentComplete?;
    # The URL for retrieving the exported file
    string resourceLocation?;
    # The extension of the exported file
    string ResourceFileExtension?;
    # The expiration time of the URL
    string expirationTime?;
};

# Datasource usage
public type DatasourceUsage record {
    # The datasource instance ID
    string datasourceInstanceId;
};

# Odata response wrapper for a Power BI user access right for group List
public type GroupUsers record {
    # The user access right for group List
    GroupUser[] value?;
};

# Power BI refreshable list
public type Refreshables record {
    # The refreshables
    Refreshable[] value?;
};

# A Power BI dataset to dataflow link
public type DatasetToDataflowLinkResponse record {
    # The dataset object id
    string datasetObjectId?;
    # The dataflow object id
    string dataflowObjectId?;
    # The workspace object id
    string workspaceObjectId?;
};

# Odata response wrapper for a Power BI refresh history
public type Refreshes record {
    # The Refresh history list
    Refresh[] value?;
};

# Export to file request settings
public type ExportReportSettings record {
    # The locale to apply
    string locale?;
    # A flag indicating whether to include hidden pages when exporting the entire report (when passing specific pages this property will be ignored). If not provided, the default behavior is to exclude hidden pages
    boolean includeHiddenPages?;
};

# A dataset table
public type Table record {
    # The table name
    string name;
    # The column schema for this table
    Column[] columns;
    # The data rows within this table
    Row[] rows?;
    # The measures within this table
    Measure[] measures?;
};

# Add encryption key request
public type TenantKeyCreationRequest record {
    # The name of the encryption key
    string name?;
    # Uri to the version of the Azure Key Vault key to be used
    string keyVaultKeyIdentifier?;
    # Indicates that this key is set as default for the entire tenant. Any new capacity creation will inherit this key upon creation
    boolean isDefault?;
    # Indicates to activate any inactivated capacities to use this key for its encryption
    boolean activate?;
};

# A Power BI dataset. Below is a list of properties that may be returned for a dataset. Only a subset of the properties will be returned depending on the API called, the caller permissions and the availability of the data in the Power BI database.
public type Dataset record {
    # The dataset id
    string id;
    # The dataset name
    string name?;
    # The dataset owner
    string configuredBy?;
    # Whether the dataset allows adding new rows
    boolean addRowsAPIEnabled?;
    # The dataset web url
    string webUrl?;
    # Can this dataset be refreshed
    boolean IsRefreshable?;
    # Whether the dataset requires an effective identity. This indicates that you must send an effective identity using the GenerateToken API.
    boolean IsEffectiveIdentityRequired?;
    # Whether RLS is defined inside the PBIX file. This indicates that you must specify a role.
    boolean IsEffectiveIdentityRolesRequired?;
    # Dataset requires an On-premises Data Gateway
    boolean IsOnPremGatewayRequired?;
    # Encryption information for a dataset
    Encryption Encryption?;
    # DateTime of creation of this dataset
    string CreatedDate?;
    # The content provider type for the dataset
    string ContentProviderType?;
    # The dataset create report embed url
    string CreateReportEmbedURL?;
    # The dataset qna embed url
    string QnaEmbedURL?;
    # The dataset description
    string description?;
    # Power BI endorsement details
    EndorsementDetails endorsementDetails?;
    # Datasource usages
    DatasourceUsage[] datasourceUsages?;
    # Upstream Dataflows
    DependentDataflow[] upstreamDataflows?;
    # Artifact sensitivity label info
    SensitivityLabel sensitivityLabel?;
};

# A dataflow transaction odata list wrapper
public type DataflowTransactions record {
    # The dataflow transactions
    DataflowTransaction[] value?;
};

# Composite of artifact IDs and label change status.
public type InformationProtectionChangeLabelResponse record {
    # List of unique dashboard IDs with label change status.
    ChangeLabelStatus[] dashboards?;
    # List of unique report IDs with label change status.
    ChangeLabelStatus[] reports?;
    # List of unique dataflow IDs with label change status.
    ChangeLabelStatus[] dataflows?;
    # List of unique dataset IDs with label change status.
    ChangeLabelStatus[] datasets?;
};

# A Power BI datasource connection details
public type DatasourceConnectionDetails record {
    # The connection server.
    string server?;
    # The connection database.
    string database?;
    # The connection url
    string url?;
};

# The information about the import
public type ImportInfo record {
    # The OneDrive for Business .xlsx file path to import, can be absolute or relative. .pbix files are not supported.
    string filePath?;
    # The import connection type for OneDrive for Business file
    string connectionType?;
    # The shared access signature (SAS) url of the temporary blob storage, used to import large .pbix files between 1 GB and 10 GB
    string fileUrl?;
};

# A Power BI gateway datasource
public type GatewayDatasource record {
    # The unique id for this datasource
    string id;
    # The associated gateway id
    string gatewayId;
    # The name of the datasource
    string datasourceName?;
    # The type of the datasource
    string datasourceType?;
    # Connection details in json format
    string connectionDetails?;
    # Type of the datasource credentials
    string credentialType;
};

# Odata response wrapper for audit activity events list
public type ActivityEventResponse record {
    # The activity event entities
    Object[] activityEventEntities?;
    # Uri to get the next chunk of the result set
    string continuationUri?;
    # Token to get the next chunk of the result set
    string continuationToken?;
};

# A Power BI workbook
public type Workbook record {
    # The workbook name
    string name?;
    # DatasetId for workbooks. Only applies for workbooks that has an associated dataset.
    string datasetId?;
};

# Power BI rebind report request
public type RebindReportRequest record {
    # The new dataset for the rebound report. If the dataset resides in a different workspace than the report, a shared dataset will be created in the report's workspace
    string datasetId;
};

# Capacity workload setting
public type Workload record {
    # The workload name
    string name?;
    # The capacity workload state
    WorkloadState state;
    # The memory percentage maximum Limit set by the user
    int maxMemoryPercentageSetByUser?;
};

# Request body for migrating workspaces to shared capacity as tenant admin
public type UnassignWorkspacesCapacityRequest record {
    # Workspaces to be migrated to shared capacity
    string[] workspacesToUnassign;
};

# 
public type UpdateDatasourcesRequest record {
    # The connection server
    UpdateDatasourceConnectionRequest[] updateDetails;
};

# A relationship between tables in a dataset
public type Relationship record {
    # The relationship name and identifier
    string name;
    # The filter direction of the relationship
    string crossFilteringBehavior = "OneDirection";
    # The name of the foreign key table
    string fromTable;
    # The name of the foreign key column
    string fromColumn;
    # The name of the primary key table
    string toTable;
    # The name of the primary key column
    string toColumn;
};

# Power BI Template Apps automated install token
public type InstallTicket record {
    # Install ticket
    string ticket;
    # Unique ticket Id. Can be used to correlate operations that use this ticket with the generate operation through audit logs.
    string ticketId;
    # Expiration time of token. In UTC.
    string expiration;
};

# A single page configuration for the export request
public type ExportReportPage record {
    # The page name
    string pageName;
    # Visual name to be exported. Should be provided in case only a single visual from this page is exported
    string visualName?;
    # The bookmark to apply on a single page. Provide name or state, but not both.
    PageBookmark bookmark?;
};

# The capacity workload state
public type WorkloadState string;

# Request body for assigning workspaces to a premium capacity as tenant admin
public type AssignWorkspacesToCapacityRequest record {
    # Assignment contract for migrating workspaces to premium capacity as tenant admin
    CapacityMigrationAssignment[] capacityMigrationAssignments;
};

# The metadata of a dataflow. Below is a list of properties that may be returned for a dataflow. Only a subset of the properties will be returned depending on the API called, the caller permissions and the availability of the data in the Power BI database.
public type Dataflow record {
    # The dataflow id
    string objectId;
    # The dataflow name
    string name?;
    # The dataflow description
    string description?;
    # A URL to the dataflow definition file (model.json)
    string modelUrl?;
    # The dataflow owner
    string configuredBy?;
    # The user that modified this dataflow
    string modifiedBy?;
    # Power BI endorsement details
    EndorsementDetails endorsementDetails?;
    # modification date time
    string modifiedDateTime?;
    # Datasource usages
    DatasourceUsage[] datasourceUsages?;
    # Upstream Dataflows
    DependentDataflow[] upstreamDataflows?;
    # Artifact sensitivity label info
    SensitivityLabel sensitivityLabel?;
};

# A Power BI dataflow storage account
public type DataflowStorageAccount record {
    # The Power BI dataflow storage account id
    string id;
    # The Power BI dataflow storage account name
    string name?;
    # Indicates if workspaces can be assigned to this storage account
    boolean isEnabled;
};

# Power BI workbook list
public type Workbooks record {
    # The workbooks
    Workbook[] value?;
};

# The new connection details and the target datasource name to be updated.
public type UpdateRdlDatasourceDetails record {
    # A paginated report datasource connection details.
    RdlDatasourceConnectionDetails connectionDetails;
    # The target datasource name to be updated.
    string datasourceName;
};

# Unique artifact ID: uuid format for dashboards/reports/dataflows.
public type ArtifactId record {
    # ID
    string id;
};

# A filter to be applied during the export operation
public type ExportFilter record {
    # The filter to apply. Filter format should be as described [here](https://docs.microsoft.com/power-bi/collaborate-share/service-url-filters)
    string filter?;
};

# Odata response wrapper for modified workspaces list
public type ModifiedWorkspaces record {
    # The modified workspaces list
    ModifiedWorkspace[] value?;
};

# Connection string wrapper.
public type ConnectionDetails record {
    # A dataset connection string.
    string connectionString;
};

# A Power BI dashboard. Below is a list of properties that may be returned for a dashboard. Only a subset of the properties will be returned depending on the API called, the caller permissions and the availability of the data in the Power BI database.
public type Dashboard record {
    # The dashboard id
    string id;
    # The dashboard display name
    string displayName?;
    # Is ReadOnly dashboard
    boolean isReadOnly?;
    # The dashboard embed url
    string embedUrl?;
    # The tiles that belong to the dashboard.
    Tile[] tiles?;
    # The data classification tag of the dashboard
    string dataClassification?;
    # Artifact sensitivity label info
    SensitivityLabel sensitivityLabel?;
};

# A Power BI report page
public type Page record {
    # The page name
    string name?;
    # The page display name
    string displayName?;
    # The page order
    int 'order?;
};

# Encryption keys information
public type TenantKeys record {
    # Encryption keys
    TenantKey[] value?;
};

# Odata response wrapper for a Power BI installed App list
public type Apps record {
    # The installed apps
    App[] value?;
};

# Power BI workspace assignment status to capacity response
public type WorkspaceCapacityAssignmentStatus record {
    # Workspace assignment status
    string status;
    # Start time of workspace assignment operation
    string startTime?;
    # End time of workspace assignment operation
    string endTime?;
    # The capacity id
    string capacityId?;
    # The activity id of the acctual assignment operation, can be provided in case of assignment failures
    string activityId?;
};

# A dataset odata list wrapper
public type Datasets record {
    # The datasets
    Dataset[] value?;
};

# Patch workload setting request
public type PatchWorkloadRequest record {
    # The capacity workload state
    WorkloadState state;
    # The memory percentage maximum Limit set by the user
    int maxMemoryPercentageSetByUser?;
};

# Odata response wrapper for capacity workload settings list
public type Workloads record {
    # The capacity workload settings list
    Workload[] value?;
};

# A publish datasource to gateway request
public type PublishDatasourceToGatewayRequest record {
    # The datasource type
    string dataSourceType;
    # The connection details
    string connectionDetails;
    # The credential details
    CredentialDetails credentialDetails;
    # The datasource name
    string dataSourceName;
};

# Odata response wrapper for a Power BI gateway datasource collection
public type GatewayDatasources record {
    # List of gateway datasources
    GatewayDatasource[] value?;
};

# Power BI report Export to file configuration
public type PowerBIReportExportConfiguration record {
    # Export to file request settings
    ExportReportSettings settings?;
    # The bookmark to apply on a single page. Provide name or state, but not both.
    PageBookmark defaultBookmark?;
    # List of report level filters to apply. Currently only one filter can be provided
    ExportFilter[] reportLevelFilters?;
    # List of pages to export and their properties. The same page may appear more than once with different visuals
    ExportReportPage[] pages?;
    # List of identities to use for RLS rules
    EffectiveIdentity[] identities?;
};

# Power BI clone report request
public type CloneReportRequest record {
    # The new report name
    string name;
    # Optional parameter for specifying the target workspace id. Empty Guid (00000000-0000-0000-0000-000000000000) indicates 'My Workspace'. <br/>If not provided, the new report will be cloned within the same workspace as the source report.
    string targetWorkspaceId?;
    # Optional parameter for specifying the target associated dataset id. <br/>If not provided, the new report will be associated with the same dataset as the source report
    string targetModelId?;
};

# A Power BI user access right entry for datasource
public type DatasourceUser record {
    # The user access rights for the datasource.
    string datasourceAccessRight;
    # Email address of the user
    string emailAddress?;
    # Display name of the principal
    string displayName?;
    # [Object ID](/power-bi/developer/embedded/embedded-troubleshoot#what-is-the-difference-between-application-object-id-and-principal-object-id) of the principal
    string identifier?;
    # The principal type
    string principalType?;
};

# Odata response wrapper for a Power BI gateways list
public type Gateways record {
    # The gateways
    Gateway[] value?;
};

# The credential details
public type CredentialDetails record {
    # The credentials. Depends on the 'credentialType' value. See [Update Datasource Examples](/rest/api/power-bi/gateways/updatedatasource#examples).
    string credentials;
    # The credential type
    string credentialType;
    # User input for this attribute is currently ignored. Today, regardless of the provided value, we always try to establish an encrypted connection first but fall back to an unencrypted option in case of a failure. <br/>This will be fixed for the following data source types with the June 2019 gateway release causing a value of Encrypted to try only an encrypted connection and NotEncrypted with an unencrypted connection and there would be no fallback behavior <ul><li>Impala</li><li>MySql</li><li>DB2</li><li>Netezza</li><li>PostgreSQL</li><li>Sybase</li><li>Teradata</li><li>GoogleBigQuery</li><li>Amazon Redshift</li></ul>
    string encryptedConnection;
    # The encryption algorithm. For cloud datasource, use 'None'. For on-premises datasource, use gateway public key with 'RSA-OAEP' algorithm.
    string encryptionAlgorithm;
    # The privacy level. Relevant when combining data from multiple sources.
    string privacyLevel;
    # Should the caller's AAD identity be used for OAuth2 credentials configuration
    boolean useCallerAADIdentity?;
    # Should the end-user OAuth2 credentials be used for connecting to the datasource in DirectQuery mode. Only supported for Direct Query to SQL Azure.
    boolean useEndUserOAuth2Credentials?;
};

# Power BI endorsement details
public type EndorsementDetails record {
    # The endorsement status
    string endorsement?;
    # The user that certified the artifact
    string certifiedBy?;
};

# The report object for Generate Token Request V2.
public type GenerateTokenRequestV2Report record {
    # Indicates that the generated EmbedToken grand editing for this report
    boolean allowEdit?;
    # Report Id
    string id;
};

# Power BI embed token
public type EmbedToken record {
    # Embed token
    string token;
    # Unique token Id. Can be used to correlate operations that use this token with the generate operation through audit logs.
    string tokenId;
    # Expiration time of token. In UTC.
    string expiration;
};

# A paginated report datasource connection details.
public type RdlDatasourceConnectionDetails record {
    # The connection server.
    string server?;
    # The connection database.
    string database?;
};

# Power BI assign to capacity request
public type AssignToCapacityRequest record {
    # The capacity id. To unassign from capacity, use Empty Guid (00000000-0000-0000-0000-000000000000).
    string capacityId;
};

# Power BI add dashboard request
public type AddDashboardRequest record {
    # The name of the new dashboard
    string name;
};

# Unique artifact ID: string format (can be uuid) for datasets.
public type ArtifactStringId record {
    # ID
    string id;
};

# Odata response wrapper for a Power BI tile collection
public type Tiles record {
    # The tile collection
    Tile[] value?;
};

# Power BI refresh schedule request
public type RefreshScheduleRequest record {
    # A Power BI refresh schedule for cached model
    RefreshSchedule value;
};

# A data row in a dataset
public type Row record {
    # The unique row id
    string id?;
};

# Odata response wrapper for a Power BI user access right for datasource List
public type DatasourceUsers record {
    # The user access right for datasource List
    DatasourceUser[] value?;
};

# A Power BI user access right entry for workspace
public type GroupUser record {
    # Access rights user has for the workspace
    string groupUserAccessRight;
    # Email address of the user
    string emailAddress?;
    # Display name of the principal
    string displayName?;
    # [Object ID](/power-bi/developer/embedded/embedded-troubleshoot#what-is-the-difference-between-application-object-id-and-principal-object-id) of the principal
    string identifier?;
    # The principal type
    string principalType?;
};

# Power BI update report content request
public type TemporaryUploadLocation record {
    # The shared access signature (SAS) url for the temporary blob storage
    string Url;
    # The expiration time of the shared access signature (SAS) url
    string ExpirationTime;
};

# Request payload for updating dataflow information
public type DataflowUpdateRequestMessage record {
    # New name of the dataflow
    string name?;
    # New description for the dataflow
    string description?;
    # Allow native queries
    boolean allowNativeQueries?;
    # Compute Engine Behavior
    string computeEngineBehavior?;
};

# Set label details.
public type InformationProtectionChangeLabelDetails record {
    # Composite of artifact IDs that will be used to update the information protection labels of those artifacts.
    InformationProtectionArtifactsChangeLabel artifacts;
    # Label ID (must be in the user’s policy).
    string labelId;
    # Delegated user details. The user must be an existing user in Power BI and Azure AAD, who has signed in to Power BI during the last 3 months.
    DelegatedUser delegatedUser?;
    # Specifies whether the assigned label is to be regarded as having been set manually or as the result of automatic labeling. (default value is Standard).
    string assignmentMethod?;
};

# Odata response wrapper for a Power BI datasource collection
public type Datasources record {
    # The datasource collection
    Datasource[] value?;
};

# Power BI Create Install Ticket Request
public type CreateInstallTicketRequest record {
    # List of install details
    TemplateAppInstallDetails[] installDetails?;
};

# Odata response wrapper for a Power BI dataset to dataflow links list
public type DatasetToDataflowLinksResponse record {
    # The dataset to dataflow links 
    DatasetToDataflowLinkResponse[] value?;
};

# Power BI dataset parameter update request
public type UpdateMashupParametersRequest record {
    # The dataset parameter list to update
    UpdateMashupParameterDetails[] updateDetails;
};

# Additional feature information
public type AdditionalFeatureInfo record {
    # The token generation usage (in %) from the limitation on shared capacity
    int Usage?;
};

# The workspace object for Generate Token Request V2.
public type GenerateTokenRequestV2TargetWorkspace record {
    # Workspace Id
    string id;
};

# A dataset column
public type Column record {
    # The column name
    string name;
    # The column data type
    string dataType;
    # (Optional) The format of the column as specified in [FORMAT_STRING](https://docs.microsoft.com/analysis-services/multidimensional-models/mdx/mdx-cell-properties-format-string-contents)
    string formatString?;
    # (Optional) String name of a column in the same table to be used to order the current column
    string sortByColumn?;
    # (Optional) String value to be used for the data category which describes the data within this column
    string dataCategory?;
    # (Optional) Property indicating if the column is hidden from view. Default is false.
    boolean isHidden?;
    # (Optional) Aggregate Function to use for summarizing this column
    string summarizeBy?;
};

# A Power BI gateway
public type Gateway record {
    # The gateway id
    string id;
    # The gateway name
    string name?;
    # The gateway type
    string 'type?;
    # Gateway metadata in json format
    string gatewayAnnotation?;
    # A Power BI gateway public key
    GatewayPublicKey publicKey?;
    # The gateway connectivity status
    string gatewayStatus?;
};

# A Power BI error response details
public type PowerBIApiErrorResponseDetail record {
    # The error code.
    string code?;
    # The error message.
    string message?;
    # The error target.
    string target?;
};

# Odata response wrapper for a Power BI dashboard collection
public type Dashboards record {
    # The dashboard collection
    Dashboard[] value?;
};

# A Power BI report. Below is a list of properties that may be returned for a report. Only a subset of the properties will be returned depending on the API called, the caller permissions and the availability of the data in the Power BI database.
public type Report record {
    # The report id
    string id;
    # The report name
    string name?;
    # The report web url
    string webUrl?;
    # The report embed url
    string embedUrl?;
    # The dataset id
    string datasetId?;
    # The report description
    string description?;
    # The report owner
    string createdBy?;
    # The user that modified this report
    string modifiedBy?;
    # The report created date time.
    string createdDateTime?;
    # The report modified date time.
    string modifiedDateTime?;
    # Power BI endorsement details
    EndorsementDetails endorsementDetails?;
    # Artifact sensitivity label info
    SensitivityLabel sensitivityLabel?;
    # The report type
    string reportType?;
};

# Odata response wrapper for a Power BI report collection
public type Reports record {
    # The report collection
    Report[] value?;
};

# A Power BI tile
public type Tile record {
    # The tile id
    string id;
    # The dashboard display name
    string title?;
    # number of rows a tile should span
    int rowSpan?;
    # number of columns a tile should span
    int colSpan?;
    # The tile embed url
    string embedUrl?;
    # The tile embed data
    string embedData?;
    # The report id. Available only for tiles created from a report.
    string reportId?;
    # The dataset id. Available only for tiles created from a report or using a dataset; for example, Q&A tiles.
    string datasetId?;
};

# A scan request
public type ScanRequest record {
    # The scan ID.
    string id?;
    # The scan created date time.
    string createdDateTime?;
    # The scan state.
    string status?;
    # A Power BI error response details
    PowerBIApiErrorResponseDetail 'error?;
};

# Odata response wrapper for Power BI dataflow storage account list
public type DataflowStorageAccounts record {
    # The Power BI dataflow storage account list
    DataflowStorageAccount[] value?;
};

# Workspace info details
public type WorkspaceInfo record {
    # The workspace object ID
    string id;
    # The workspace name
    string name?;
    # The workspace description
    string description?;
    # The workspace type
    string 'type?;
    # The workspace state
    string state?;
    # The workspace data retrieval state
    string dataRetrievalState?;
    # Whether the workspace is on dedicated capacity
    boolean isOnDedicatedCapacity?;
    # The workspace capacity ID
    string capacityId?;
    # The reports associated with this workspace. The list of properties returned varies between APIs, thus you may not see them all as part of the API response.
    Report[] reports?;
    # The dashboards associated with this workspace. The list of properties returned varies between APIs, thus you may not see them all as part of the API response.
    Dashboard[] dashboards?;
    # The datasets associated with this workspace. The list of properties returned varies between APIs, thus you may not see them all as part of the API response.
    Dataset[] datasets?;
    # The dataflows associated with this workspace. The list of properties returned varies between APIs, thus you may not see them all as part of the API response.
    Dataflow[] dataflows?;
};

# Rotate encryption key request
public type TenantKeyRotationRequest record {
    # Uri to the version of the Azure Key Vault key to be used
    string keyVaultKeyIdentifier?;
};

# A Power BI dataflow transaction
public type DataflowTransaction record {
    # The transaction id
    string id;
    # The type of refresh transaction
    string refreshType?;
    # Start time of the transaction
    string startTime?;
    # End time of the transaction
    string endTime?;
    # Status of the transaction
    string status?;
};

# Power BI Template App Automated install configuration. Dictionary of name-value pairs
public type TemplateAppConfigurationRequest record {
    # Configuration
    record {} configuration?;
};

# Power BI Generate Token Request V2
public type GenerateTokenRequestV2 record {
    # List of datasets
    GenerateTokenRequestV2Dataset[] datasets?;
    # List of reports
    GenerateTokenRequestV2Report[] reports?;
    # List of workspaces *Embed Token* allows saving to
    GenerateTokenRequestV2TargetWorkspace[] targetWorkspaces?;
    # List of identities to use for RLS rules.
    EffectiveIdentity[] identities?;
};

# A Power BI Dependent dataflow
public type DependentDataflow record {
    # The target dataflow id
    string targetDataflowId?;
    # The target group id
    string groupId?;
};

# Patch capacity request
public type CapacityPatchRequest record {
    # The id of the encryption key
    string tenantKeyId?;
};

# Power BI update report content request
public type UpdateReportContentRequest record {
    # The source type for the content update.
    string sourceType;
    # Source from existing report
    SourceReport sourceReport;
};
