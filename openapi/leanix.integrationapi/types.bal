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

public type StatusResponseArr StatusResponse[];

# A template representing one or more identifiers of Fact Sheets
public type IdentifierSetTemplate record {
    # The template that generates one or more fact sheet identifiers using the ExternalID of the fact sheets
    ExternalIdSetTemplate 'external?;
    # Internal identifiers of the Fact Sheet assigned by LeanIX
    string internal?;
};

public type RelationInboundProcessor record {
    *InboundProcessor;
    # The relation type
    string 'type?;
    # A template representing a unique identifier of a Fact Sheet when evaluated
    IdentifierTemplate 'from?;
    # A template representing a unique identifier of a Fact Sheet when evaluated
    IdentifierTemplate to?;
    # A list of changes that are performed to the specified relation
    PatchTemplate[] updates?;
};

# Defines the factSheet field that controls the deletion, which will be done only if the value represents an empty list
public type FactSheetOwnerDeletion record {
    # The name of the factSheet field that keep the list of owners for a factSheet
    string fieldName?;
    # The value that represents ownership for factSheets, if this value is found in fieldName, it will be removed
    string ownerId?;
};

# Upload the outbound result LDFI to the default cloud storage provided by LeanIX
#
public type LeanIxStorageDataConsumer record {
    *DataConsumer;
};

# The criteria to select fact sheets and activate the deletion.
public type FactSheetDeletionScope record {
    # Defines the factSheet field that controls the deletion, which will be done only if the value represents an empty list
    FactSheetOwnerDeletion owner?;
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
};

# An object that contains information about how the value should be expanded according to a list field
public type ValueForEachTemplate record {
    # The JUEL expressing targeting a list
    string elementOf?;
    # The filter to apply to each element
    string filter?;
};

public type ImpactFilter record {
    # A flag that specifies whether to read impacts belonging to Fact Sheet
    boolean readAll?;
};

public type Input record {
    # The type of connector that is used
    string connectorType;
    # The identifier of the connector instance
    string connectorId;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion;
    # The data flow direction, could be [inbound, outbound]
    string processingDirection;
    # The processing mode, could be [partial, full]
    string processingMode?;
};

public type SynchronizationRun record {
    # A unique ID to distinguish this LDIF instance from other LDIF instances
    string id?;
};

# Specify multiple measurements that are fetched along with the processing Fact Sheet, it is possible to use juel expression in any of the values
public type MetricsMeasurement record {
    # The name to be used for this measurement in the context of 'lx.metrics.'.
    string name?;
    # The name of the measurement as it is known in the workspace.
    string measurement?;
    # The name of the field that belongs to the measurement where the data will be collected.
    string fieldName?;
    # Optional, grouping criteria, it is a time duration value, e.g. '1d'.
    string groupBy?;
    # Optional, start of the period of time to fetch data. If 'start' is defined, then at least 'end' or 'duration' must be also defined
    string 'start?;
    # Optional, end of the period of time to fetch data, must be defined based on the 'start' field.
    string end?;
    # Optional, the duration expression (time interval) to express the period of time to fetch data. ISO-8601 duration format PnDTnHnMn is expected
    string duration?;
    # Specify the condition to collect data. Juel expression can be used in all corresponding values.
    MetricRules rules?;
};

public type OutboundDocumentFilter record {
    # The document names to filter for
    string filter?;
};

# Defines a filter for the content data that this processor is able to evaluate
public type FilterConfig record {
    # The regular expression of the content type this filter config should accept
    string 'type?;
    # The regular expression of the content id this filter config should accept
    string id?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
    # An EL expression to describe the onRead filter settings.
    string onRead?;
    # An EL expression to limit Fact Sheets that have changes since a given data. ISO-8601 duration format PnDTnHnMn is used
    string updatedAtDuration?;
};

public type KeyValueTemplate record {
    # The basic expression of key
    string 'key;
    # The basic expression of value
    string value;
};

# A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
public type IdentifierWithSearchScopeTemplate record {
    # The template that generates the fact sheet identifier using the ExternalID of the fact sheet
    ExternalIdTemplate 'external?;
    # An internal identifier of the Fact Sheet assigned by LeanIX
    string internal?;
    # The criteria for selecting fact sheets and filter in combination with LDIF data
    SearchScope search?;
};

# A value template describes the mapping from an incoming object to a single value or a json object
public type ValueTemplate record {
    # An EL expression that evaluates to a single value. Use 'map' to evaluate to whole json object
    string expr?;
    # If this regex does not match on the evaluated 'expr' then this value template is ignored. Can not be used with 'map'
    string regexMatch?;
    # The combination of a matching and a replacement pattern. The default matching pattern selects the whole string in group 1, while the default replace pattern replaces the matches with group 1
    RegexReplace regexReplace?;
    # A list of key-value pairs that evaluates to a json object. Use 'expr' to evaluate to a single value
    KeyValueTemplate[] 'map?;
    # An object that contains information about how the value should be expanded according to a list field
    ValueForEachTemplate forEach?;
    # An EL expression that evaluates to an arbitrary data object.
    string 'object?;
};

public type SubscriptionFilter record {
    # The subscription types to retrieve
    string[] types?;
};

public type OutboundSubscriptionFilter record {
    # The subscription types to retrieve
    string[] types?;
};

# Specify the condition to collect data. Juel expression can be used in all corresponding values.
public type MetricRules record {
    # Identify the key for the rule
    string 'key?;
    # Identify the operation that is used to compare values
    string comparator?;
    # The value used in the comparison operation
    string compareWith?;
};

public type OutboundInput record {
    *Input;
    # The type of connector that is used
    string connectorType?;
    # The identifier of the connector instance
    string connectorId?;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion?;
    # The direction of the data flow.
    string processingDirection?;
    # Optional additional options to parse this LDIF request
    string processingMode?;
    # A customer added, arbitrary description for any kind of grouping, notification or note purpose
    string description?;
};

# Configuration for the created LDIF, in case 'writeToLdif' is used
public type TargetLdifConfiguration record {
    # A list of key-value pairs that evaluates to be the keys of the new LDIF
    KeyValueTemplate[] ldifKeys?;
    # Define the target location to which the outbound result LDIF should be uploaded to
    DataConsumer dataConsumer?;
};

public type DocumentFilter record {
    # The document names to filter for
    string filter?;
};

# The criteria to select subscriptions
public type SubscriptionScopes record {
    # List of role names
    string[] roles?;
    # Type of role, like RESPONSIBLE
    string 'type?;
};

# The criteria for selection of documents.
public type DocumentDeletionScope record {
    # A list of matching patterns that document names have to match to be considered for deletion
    record {} documentMatches?;
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
};

public type SyncRunInboundProgressReport record {
    # Number of elements processed from content in the current run level for Inbound processing.
    int processedContentCount?;
    # Number of errors in the current run level, valid for Inbound
    int errorCount?;
    # Number of GraphQL request made to Pathfinder backend in the current run level, not applicable for Outbound
    int graphQLRequestCount?;
    # Identifier of the run level being executed, valid only for Inbound processing.
    int runLevelIndex?;
    # Status of the synchronization Job
    int status?;
    # Number of elements build in the output content. Valid for Outbound
    int contentsCount?;
    # Number of warnings detected during Outbound processing
    int warningsCount?;
    # Number of elements found in the Outbound Scope or the Scope of the processors
    int itemsInScopeCount?;
};

public type ProcessorConfiguration record {
    # The type of connector that is used
    string connectorType;
    # The identifier of the connector instance
    string connectorId;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion;
    # The data flow direction, could be [inbound, outbound]
    string processingDirection;
    # The processing mode, could be [partial, full]
    string processingMode?;
};

# The ratio limits for each type of deletion scope
public type MaximumDeletionRatio record {
    # The maximum ratio for deletion in fact sheets
    int factSheets?;
    # The maximum ratio for deletion in subscriptions
    int subscriptions?;
    # The maximum ratio for deletion in documents
    int documents?;
    # The maximum ratio for deletion in relations
    int relations?;
    # The maximum ratio for deletion in tags
    int tags?;
};

public type InboundProcessorConfiguration record {
    *ProcessorConfiguration;
    # The type of connector that is used
    string connectorType?;
    # The identifier of the connector instance
    string connectorId?;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion?;
    # The data flow direction, must be [inbound]
    string processingDirection?;
    # The processing mode, could be [partial, full]
    string processingMode?;
    # The list of processors used to evaluate the LDIF data
    InboundProcessor[] processors?;
    # The deletion scope definition used to delete untouched entities on a 'full' sync mode
    record  { }  deletionScope?;
    # The global variable definition used to define default values
    record {} variables?;
    # Definition of the provider which provides the inbound LDIF.
    record  { }  dataProvider?;
    # Credentials setting for the synchronization run.
    record  { }  credentials?;
    # Configuration for the created LDIF, in case 'writeToLdif' is used
    TargetLdifConfiguration targetLdif?;
    # The default LDIF for testing with this processor configuration.
    record  { }  defaultInput?;
};

public type FastRunStatsReport record {
    # The duration of the execution expressed in ISO-8601 format PnDTnHnMn
    string duration?;
    # The number of elements processed as given by the LDIF input content
    int processedContentCount?;
    # The number or processors that were part of the execution
    int processorCount?;
};

# Represents a LeanIX Data Interchange Format (LDIF)
#
public type LeanIxDataInterchangeFormat record {
    *Input;
    # The type of connector that is used
    string connectorType?;
    # The identifier of the connector instance
    string connectorId?;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion?;
    # The target API version
    string lxVersion?;
    # The optional target workspace
    string lxWorkspace?;
    # A customer added, arbitrary description for any kind of grouping, notification or note purpose
    string description?;
    # The direction of the data flow
    string processingDirection?;
    # Optional additional options to parse this LDIF request
    string processingMode?;
    ChunkInformation chunkInformation?;
    # Global variables accessible from all data processors.
    record {} customFields?;
    # The list of content changes that are applied within this LDIF
    Content[] content?;
};

public type DocumentInboundProcessor record {
    *InboundProcessor;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A list of changes that are performed to the specified fact sheet
    PatchTemplate[] updates?;
};

# An object containing all necessary information about changes that are going to be made by the processors
public type Content record {
    # The type of content defined by this entry
    string 'type;
    # The (External) ID that identifies the fact sheet
    string id;
    # Processor specific fields that correspond to changes
    record {} data;
};

public type OutboundTagFilter record {
    # The tag groups to retrieve
    string[] groups?;
};

# The template that generates the fact sheet identifier using the ExternalID of the fact sheet
public type ExternalIdTemplate record {
    KeyTemplate id;
    KeyTemplate 'type;
};

public type StorageManagerResponse record {
    # The date until the SAS url for the new blob file is valid.
    string expireAt;
    # The Shared Accesss Signature (SAS)
    string SAS;
};

# The combination of a matching and a replacement pattern. The default matching pattern selects the whole string in group 1, while the default replace pattern replaces the matches with group 1
public type RegexReplace record {
    # The matching pattern
    string 'match?;
    # The replacement pattern
    string replace?;
};

public type KeyTemplate record {
    # The basic expression that is evaluated by the EL based on the content data
    string expr;
    # The combination of a matching and a replacement pattern. The default matching pattern selects the whole string in group 1, while the default replace pattern replaces the matches with group 1
    RegexReplace regexReplace?;
};

# A template representing a unique identifier of a Fact Sheet when evaluated
public type IdentifierTemplate record {
    # The template that generates the fact sheet identifier using the ExternalID of the fact sheet
    ExternalIdTemplate 'external?;
    # An internal identifier of the Fact Sheet assigned by LeanIX
    string internal?;
};

public type RequiredRelationInfo record {
    # The relation types to filter for
    string[] filter?;
    # The names of the fields of a relation that are be available
    string[] fields?;
    # The names of the fields of the target Fact Sheet that are available
    string[] targetFields?;
    # Whether to get constraining relations of relations
    boolean constrainingRelations?;
    # An EL expression to describe which relation fields from the data model are selected
    string multipleFields?;
    # An EL expression to describe which relation type to filter for
    string multipleFilters?;
    # An EL expression to describe which factSheet fields on the target factSheet are selected
    string multipleTargetFields?;
};

# The criteria to select impacts for deletion
public type ImpactDeletionScope record {
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
};

public type Warning record {
    Processor processor?;
    # The content ID element from the LDIF that was processed when this warning was generated.
    string content?;
    # The error message
    string message?;
    # Additional information to complement the error message
    string detail?;
    # An internal category that identifies of processing category where the warning was originated.
    string category?;
    # An identifier of the type of alert. Possible values are WARNING, ERROR
    string status?;
};

public type Processor record {
    # The name of the processor as defined by the processor configuration
    string name?;
    # An internal integer value used to identify the processor
    int index?;
};

public type TagInboundProcessor record {
    *InboundProcessor;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A template representing one or more identifiers of Fact Sheets
    IdentifierSetTemplate factSheets?;
    # A list of changes that are performed to the specified tag
    PatchTemplate[] updates?;
};

public type TagFilter record {
    # The tag groups to retrieve
    string[] groups?;
    # Create list of tag group names by evaluating juel expression. It iterates all tagGroups in Workspace, tag group currently iterated over is available as “dm.tagGroup” in the JUEL expression, example: ${dm.tagGroup.name=='TagGroupsName'}
    string[] multipleGroups?;
};

public type OutboundRequiredRelationInfo record {
    # The relation types to filter for
    string[] filter?;
    # The names of the fields of a relation that are be available
    string[] fields?;
    # The names of the fields of the target Fact Sheet that are available
    string[] targetFields?;
    # Whether to get constraining relations of relations
    boolean constrainingRelations?;
};

public type MetricsInboundProcessor record {
    *InboundProcessor;
    # A set of values that specify the metrics point that is created.
    PatchTemplate[] updates?;
};

public type OutboundProcessorConfiguration record {
    *ProcessorConfiguration;
    # The type of connector that is used
    string connectorType?;
    # The identifier of the connector instance
    string connectorId?;
    # The version of the connector that is expected to process this LDIF file
    string connectorVersion?;
    # The data flow direction, must be [outbound]
    string processingDirection?;
    # The processing mode, could be [partial]
    string processingMode?;
    # A list of facet filters to limit which Fact Sheets are considered for output
    record {} scope?;
    # The list of processors used to evaluate the LDIF data
    OutboundProcessor[] processors?;
    # Define the target location to which the outbound result LDIF should be uploaded to
    DataConsumer dataConsumer?;
    # The default outbound input for testing with this processor configuration.
    record  { }  defaultInput?;
};

public type OutboundFieldTemplate record {
    KeyTemplate 'key;
    # Either 'list' or 'selectFirst'. Defines if the field should be written as a list or as a single element.
    string mode?;
    # A list of expressions for multiple values, e.g. for multi select fields
    ValueTemplate[] values?;
    # An object that contains information about how the value should be expanded according to a list field
    ValueForEachTemplate forEach?;
    # Whether this value is optional. If true, then missing value error will not be reported
    boolean optional?;
};

# Definition of the provider which provides the inbound LDIF
public type DataProvider record {
    # The url from which the inbound LDIF should be downloaded from
    string url?;
    # The type of storage provider. Use 'azureStorage' to optimize for Azure Storage, or null for other types.
    string 'type?;
};

public type InboundProcessor record {
    # The type that identifies this processor (one of 'inboundFactSheet', 'inboundRelation', 'inboundTag', 'inboundDocument', 'inboundSubscription', 'inboundMetrics', 'inboundImpact', 'variableProcessor')
    string processorType;
    # A not necessarily unique name for this processor
    string processorName?;
    # A description for this processor
    string processorDescription?;
    # Defines a filter for the content data that this processor is able to evaluate
    FilterConfig filter?;
    # Order of processor execution. Processors with high numbers are executed after such processors with low number. A value greater or equal 0 is expected for this value
    int run?;
    # Whether this processor is executed or not. Default is true.
    boolean enabled?;
    # An EL expression which targets a content property with a list. Processing will be done for each element in the list.
    string forEach?;
    # A list of variables. Each variable consists of a key and a value. Both fields can contain EL expressions. The expression in key must be evaluated to a single element while the expression in value will be evaluated to a list. The EL expressions are evaluated after a processor has run for a data object and the values will be provided in the next run of the running synchronization.
    VariableKeyValueTemplate[] variables?;
    # The operation mode of this processor. It can be either 'delete', or 'createOrUpdate'.
    string mode?;
    # The log level of this processor. It can be 'off', 'warning' or 'debug'.
    string logLevel?;
};

# The criteria for selection of relations.
public type RelationDeletionScope record {
    # A list of relation types like 'relToParent', 'relToChild'
    string[] relationTypes?;
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
};

public type InputWithProcessorConfig record {
    Input input;
    ProcessorConfiguration processorConfiguration;
};

# A combination of tag and tag group.
public type TagScope record {
    # The group name or the regular expression pattern 
    string 'group?;
    # The tag name or the regular expression pattern 
    string tag?;
};

public type SynchronizationRunWithConfiguration record {
    # A unique ID to distinguish this LDIF instance from other LDIF instances
    string id?;
    ProcessorConfiguration processorConfiguration?;
};

# Upload the outbound result LDFI to the target Azure storage account and container
#
public type AzureStorageDataConsumer record {
    *DataConsumer;
};

public type VariableKeyValueTemplate record {
    # The basic expression of key
    string 'key;
    # The basic expression of value
    string value;
};

public type ChunkInformation record {
    # Index of the first data object in this chunk
    int firstDataObject?;
    # Index of the last data object in this chunk
    int lastDataObject?;
    # Index of the last data object over all chunks
    int maxDataObject?;
};

# The template of a key/value pair that defines an abstract change to the data
public type PatchTemplate record {
    KeyTemplate 'key;
    # Defines the operation that is used. Data can be added or updated
    string op?;
    # A list of expressions for multiple values, e.g. for multi select fields
    ValueTemplate[] values;
    # Whether this value is optional. If true, then missing value error will not be reported
    boolean optional?;
    # An object that contains information about how the value should be expanded according to a list field
    ValueForEachTemplate forEach?;
};

public type StatusResponse record {
    # The ID of the synchronization run
    string id;
    # The status of the synchronization run
    string status?;
    # The optional description that was provided as part of the Input object.
    string description?;
};

public type WriteToLdifProcessor record {
    *InboundProcessor;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A list of changes that are performed to the specified fact sheet
    OutboundFieldTemplate[] updates?;
    # Define the components that will be available for JUEL expression under the symbol 'lx'.
    ReadFactSheetSection read?;
};

# Define the components that will be available for JUEL expression under the symbol 'lx'.
public type ReadFactSheetSection record {
    # Specify multiple measurements that are fetched along with the processing Fact Sheet, it is possible to use juel expression in any of the values
    MetricsMeasurement metrics?;
    # A list of fields that are required to get from Fact Sheet
    string[] fields?;
    RequiredRelationInfo relations?;
    TagFilter tags?;
    SubscriptionFilter subscriptions?;
    DocumentFilter documents?;
    ImpactFilter impacts?;
    # A flag to determine the fallback response in the function lx.toOrdinal(...). A true (default if absent) makes the value returned by lx.toOrdinal(...) to be zero for non-found cases. False will make the returned value equals NULL.
    boolean noNullForOrdinal?;
    # An EL expression to describe which factSheet fields from the data model are selected
    string multipleFields?;
};

# The template that generates one or more fact sheet identifiers using the ExternalID of the fact sheets
public type ExternalIdSetTemplate record {
    # The ExternalIDs of the fact sheets
    string ids;
    KeyTemplate 'type;
};

# Define the target location to which the outbound result LDIF should be uploaded to
public type DataConsumer record {
    # The type of data consumer (one of 'leanixStorage' or 'azureStorage').
    string 'type;
};

public type ImpactInboundProcessor record {
    *InboundProcessor;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A list of changes that are performed to the specified fact sheet
    PatchTemplate[] updates?;
    # Define the components that will be available for JUEL expression under the symbol 'lx'.
    ReadFactSheetSection read?;
};

# The criteria to select subscriptions
public type SubscriptionDeletionScope record {
    # The combinations of type and roles for subscriptions
    SubscriptionScopes[] subscriptionScopes?;
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
};

public type VariableInboundProcessor record {
    *InboundProcessor;
};

public type OutboundProcessor record {
    # The type that identifies this processor ('outboundFactSheet')
    string processorType;
    # A not necessarily unique name for this processor
    string processorName?;
    # A description for this processor
    string processorDescription?;
    # Defines a filter for the content data that this processor is able to evaluate
    FilterConfig filter?;
    # Whether this processor is executed or not. Default is true.
    boolean enabled?;
    # A list of facet filters which limit which Fact Sheets are considered for output
    record {} scope?;
    # A list of fields that are required to get from Fact Sheet
    string[] fields?;
    OutboundRequiredRelationInfo relations?;
    OutboundTagFilter tags?;
    OutboundSubscriptionFilter subscriptions?;
    OutboundDocumentFilter documents?;
    # Define the target location to which the outbound result LDIF should be uploaded to
    DataConsumer dataConsumer?;
    # Specify multiple measurements that are fetched along with the processing Fact Sheet, it is possible to use juel expression in any of the values
    MetricsMeasurement metrics?;
    # A list of fields that are constructed an exported Fact Sheet
    OutboundFieldTemplate[] output?;
    # A flag to determine the fallback response in the function lx.toOrdinal(...). A true (default if absent) makes the value returned by lx.toOrdinal(...) to be zero for non-found cases. False will make the returned value equals NULL.
    boolean noNullForOrdinal?;
    # An EL expression to describe which factSheet fields from the data model are selected
    string multipleFields?;
};

# The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
public type Scope record {
};

# The criteria for selection of tags.
public type TagDeletionScope record {
    # A list of tag and tag group combinations.
    TagScope[] tagScopes?;
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # An EL expression to describe the advanced filter settings.
    string advanced?;
};

# The criteria for selecting fact sheets and filter in combination with LDIF data
public type SearchScope record {
    # The criteria for selection of entities. In case you use facetFilters inside, it is possible to use Juel expressions inside 'keys', for example: ${customFields.factSheetType}
    Scope scope?;
    # The JUEL expression to filter results from search scope. References to LDIF fields are allowed here
    record {} filter?;
    # True is multiple matches are allowed for the target fact sheets to update. False if only one match is allowed
    record {} multipleMatchesAllowed?;
    # String or JUEL expression that define bookmark that wil be used for selecting factsheets.
    record {} scopeFromBookmark?;
    # The projection query request for obtaining projection PointOfViews, create this section as documented in projection endpoint (https://app.leanix.net/openapi-explorer/?urls.primaryName=Impacts). Every item from the PointOfViews response can be used in JUEL expressions by ${lx.projection}
    record  { }  projectionScope?;
};

# Definition of the entities to be removed if they are not touched by the processor configuration
public type DeletionScope record {
    # Maximum Ratio (percentage) between elements to be deleted compared to size of the scope. If this limit is violated the deletion is canceled
    record  { }  maximumDeletionRatio?;
    # The scopes for fact sheet entities
    FactSheetDeletionScope[] factSheets?;
    # The scopes for fact sheet entities
    RelationDeletionScope[] relations?;
    # The scopes for fact sheet entities
    TagDeletionScope[] tags?;
    # The scopes for subscriptions entities
    SubscriptionDeletionScope[] subscriptions?;
    # The scopes for document entities
    DocumentDeletionScope[] documents?;
    # The scopes for impact entities
    ImpactDeletionScope[] impacts?;
};

public type SubscriptionInboundProcessor record {
    *InboundProcessor;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A list of changes that are performed to the specified subscription
    PatchTemplate[] updates?;
};

public type FactSheetInboundProcessor record {
    *InboundProcessor;
    # An expression resolving to a Fact Sheet type present in the data model of your LeanIX workspace
    string 'type?;
    # A template representing the conditions for obtaining the fact sheets to been evaluated. Includes an identifier for internal, external Id, or a search criteria to obtain multiple fact sheets to evaluate
    IdentifierWithSearchScopeTemplate identifier?;
    # A list of changes that are performed to the specified fact sheet
    PatchTemplate[] updates?;
    # Define the components that will be available for JUEL expression under the symbol 'lx'.
    ReadFactSheetSection read?;
};

# Credential settting for synchronization run
public type Credentials record {
    # The API token that is used for executing the synchronization run
    string apiToken?;
    # Whether to use the technical user of the workspace to execute the synchronization run. If true, 'apiToken' field will be ignored.
    boolean useTechnicalUser?;
};

public type FastRunResponse record {
    # The status result of the run, like FINISHED, FAILED.
    string status?;
    # A list of error/warnings messages found during the execution.
    Warning[] warnings?;
    FastRunStatsReport stats?;
    # Output ldif when writeToLdif processor is used.
    record  { }  results?;
};
