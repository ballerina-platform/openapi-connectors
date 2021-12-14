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

# Definition of whether to expand hierarchy nodes in the same search instances call.
public type HierarchiesExpandParameter record {
    # Kind of the expansion of hierarchy nodes. When it is set to 'UntilChildren', the hierarchy nodes are expanded recursively until there is more than one child. When it is set to 'OneLevel', the hierarchies are expanded only at the single level matching path search instances parameter. Optional, default is 'UntilChildren'.
    string kind?;
};

# Single page of the search results.
public type SearchInstancesResponsePage record {
    # The instances matching the query based on the input. May be empty or null.
    SearchInstancesResponse instances?;
    # The hierarchy nodes which contains the instances matching the query based on the input. May be empty or null.
    SearchHierarchyNodesResponse hierarchyNodes?;
};

# Information about an API error.
public type TsiError record {
    # A particular API error with an error code and a message.
    TsiErrorBody _error?;
};

# Time series instance that is returned by instances search call. Returned instance matched the search request and contains highlighted text to be displayed to the user if it is set to 'true'.
public type InstanceHit record {
    # A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
    TimeSeriesId timeSeriesId?;
    # Name of the time series instance that matched the search request. May be null.
    string name?;
    # Represents the type that time series instance which matched the search request belongs to. Never null.
    string typeId?;
    # List of time series hierarchy IDs that time series instance which matched the search request belongs to. Cannot be used to lookup hierarchies. May be null.
    string[] hierarchyIds?;
    # Highlighted text of time series instance to be displayed to the user. Highlighting inserts <hit> and </hit> tags in the portions of text that matched the search string. Do not use any of the highlighted properties to do further API calls.
    InstancehitHighlights highlights?;
};

# Request to get or delete time series types by IDs or type names. Exactly one of "typeIds" or "names" must be set.
public type TypesRequestBatchGetOrDelete record {
    # List of IDs of time series types to return or delete.
    string[] typeIds?;
    # List of names of time series types to return or delete.
    string[] names?;
};

# Time series model settings including model name, Time Series ID properties and default type ID.
public type TimeSeriesModelSettings record {
    # Time series model display name which is shown in the UX. Examples: "Temperature Sensors", "MyDevices".
    string name?;
    # Time series ID properties defined during environment creation.
    TimeSeriesIdProperties timeSeriesIdProperties?;
    # Default type ID of the model that new time series instances will automatically belong to.
    string defaultTypeId?;
};

# Response containing full time series model settings which include model name, Time Series ID properties and default type ID.
public type ModelSettingsResponse record {
    # Time series model settings including model name, Time Series ID properties and default type ID.
    TimeSeriesModelSettings modelSettings?;
};

# Response of Get Availability operation. When environment has no data, availability property is null.
public type AvailabilityResponse record {
    # Event availability information when environment contains events. Contains time range of events and approximate distribution of events over time.
    Availability availability?;
};

# The type of the property that is either stored in events or computed by a calculation.
public type PropertyType string;

# The hierarchy nodes which contains the instances matching the query based on the input. May be empty or null.
public type SearchHierarchyNodesResponse record {
    # The list of hierarchy nodes which contains the instances matching the query based on the input. May be empty.
    HierarchyHit[] hits?;
    # Total number of hierarchy nodes which contains the instances matching the query based on the input.
    int hitCount?;
    # If returned, this means that current results represent a partial result. Continuation token allows to get the next page of results. To get the next page of query results, send the same request with continuation token parameter in "x-ms-continuation" HTTP header.
    string continuationToken?;
};

# The instances matching the query based on the input. May be empty or null.
public type SearchInstancesResponse record {
    # The list of instances matching the query based on the input. May be empty.
    InstanceHit[] hits?;
    # Total number of instances matching the query based on the input.
    int hitCount?;
    # If returned, this means that current results represent a partial result. Continuation token allows to get the next page of results. To get the next page of query results, send the same request with continuation token parameter in "x-ms-continuation" HTTP header.
    string continuationToken?;
};

# Categorical variable represents signal that needs to be analyzed based on the count or duration of occurrence of limited set of defined values.
public type CategoricalVariable record {
    *Variable;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx value?;
    # The interpolation operation to be performed on the raw data points. Currently, only sampling of interpolated time series is allowed. Allowed aggregate function - eg: left($value). Can be null if no interpolation needs to be applied.
    Interpolation interpolation?;
    # Aggregation category types.
    TimeSeriesAggregateCategory[] categories?;
    # Represents the default category.
    TimeSeriesDefaultCategory defaultCategory?;
};

# Highlighted text of time series instance to be displayed to the user. Highlighting inserts <hit> and </hit> tags in the portions of text that matched the search string. Do not use any of the highlighted properties to do further API calls.
public type InstancehitHighlights record {
    # List of highlighted string values of Time Series ID for displaying. Cannot be used to lookup instance.
    string[] timeSeriesId?;
    # Highlighted time series type name that this instance belongs to.
    string typeName?;
    # Highlighted name of time series instance. May be null.
    string name?;
    # Highlighted description of time series instance. May be null.
    string description?;
    # List of highlighted time series hierarchy IDs that time series instance belongs to. Cannot be used to lookup hierarchies. May be null.
    string[] hierarchyIds?;
    # List of highlighted time series hierarchy names that time series instance belongs to. Cannot be used to lookup hierarchies. May be null.
    string[] hierarchyNames?;
    # List of highlighted time series instance field names. May be null.
    string[] instanceFieldNames?;
    # List of highlighted time series instance field values. May be null.
    string[] instanceFieldValues?;
};

# Time series instances are the time series themselves. In most cases, the deviceId or assetId is the unique identifier of the asset in the environment. Instances have descriptive information associated with them called instance fields. At a minimum, instance fields include hierarchy information. They can also include useful, descriptive data like the manufacturer, operator, or the last service date.
public type TimeSeriesInstance record {
    # A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
    TimeSeriesId timeSeriesId;
    # This represents the type that this instance belongs to. Never null.
    string typeId;
    # Optional name of the instance which is unique in an environment. Names acts as a mutable alias or display name of the time series instance. Mutable, may be null.
    string name?;
    # This optional field contains description about the instance.
    string description?;
    # Set of time series hierarchy IDs that the instance belong to. May be null.
    string[] hierarchyIds?;
    # Set of key-value pairs that contain user-defined instance properties. It may be null. Supported property value types are: bool, string, long, double and it cannot be nested or null.
    record {} instanceFields?;
};

# Parameter of how to return time series instance hierarchies by search instances call.
public type SearchInstancesHierarchiesParameters record {
    # Definition of whether to expand hierarchy nodes in the same search instances call.
    HierarchiesExpandParameter expand?;
    # Definition of sorting of hierarchy nodes.
    HierarchiesSortParameter sort?;
    # Maximum number of hierarchies in the same level to return in the same page. Optional, default is 10 when not set. Range is from 1 to 100. If there are results beyond the page size, the continuation token can be used to fetch the next page.
    int pageSize?;
};

# Event availability information when environment contains events. Contains time range of events and approximate distribution of events over time.
public type Availability record {
    # The range of time. Cannot be null or negative.
    DateTimeRange range?;
    # Interval size for the returned distribution of the events. Returned interval is selected to return a reasonable number of points. All intervals are the same size. On the wire interval is specified in ISO-8601 duration format. One month is always converted to 30 days, and one year is always 365 days. Examples: 1 minute is "PT1M", 1 millisecond is "PT0.001S". For more information, see https://www.w3.org/TR/xmlschema-2/#duration
    string intervalSize?;
    # Approximate distribution of events over time.
    record {} distribution?;
};

# Response of a single operation on a batch of time series hierarchies. Only one of "get", "put" or "delete" will be set.
public type HierarchiesBatchResponse record {
    # List of hierarchy or error objects corresponding by position to the "get" array in the request. Hierarchy object is set when operation is successful and error object is set when operation is unsuccessful.
    TimeSeriesHierarchyOrError[] get?;
    # List of hierarchy or error object corresponding by position to the "put" array in the request. Hierarchy object is set when operation is successful and error object is set when operation is unsuccessful.
    TimeSeriesHierarchyOrError[] put?;
    # List of error objects corresponding by position to the "delete" array in the request - null when the operation is successful.
    TsiErrorBody[] delete?;
};

# Values of a single property corresponding to the timestamps. May contain nulls. Type of values matches the type of property.
public type PropertyValues record {
    *EventProperty;
    # Values of a single property corresponding to the timestamps. May contain nulls. Type of values matches the type of property.
    record {}[] values?;
};

# Result of a batch operation on a particular time series instance. Instance object is set when operation is successful (except put operation) and error object is set when operation is unsuccessful.
public type InstanceOrError record {
    # Time series instances are the time series themselves. In most cases, the deviceId or assetId is the unique identifier of the asset in the environment. Instances have descriptive information associated with them called instance fields. At a minimum, instance fields include hierarchy information. They can also include useful, descriptive data like the manufacturer, operator, or the last service date.
    TimeSeriesInstance instance?;
    # A particular API error with an error code and a message.
    TsiErrorBody _error?;
};

# Partial list of time series types returned in a single request.
public type GetTypesPage record {
    *PagedResponse;
    # Partial list of time series types returned in a single request. Can be empty if server was unable to fill the page with more types in this request, or there is no more types when continuation token is null.
    TimeSeriesType[] types?;
};

# Time series type defines variables or formulas for doing computation on events associated with time series instances. Each time series instance is associated with exactly one type. A type can have one or more variables. For example, a time series instance might be of type Temperature Sensor, which consists of the variables avg temperature, min temperature, and max temperature.
public type TimeSeriesType record {
    # Case-sensitive unique type identifier that is immutable. Can be null on create or update requests, and then server generates the ID. Not null on get and delete operations.
    string id?;
    # User-given unique name for the type. Mutable, not null.
    string name;
    # Description of the type. May be null.
    string description?;
    # Different variables associated with the type. Not empty, not null.
    record {} variables;
};

# Definition of sorting of hierarchy nodes.
public type HierarchiesSortParameter record {
    # Value to use for hierarchy node sorting. When it is set to 'CumulativeInstanceCount', the returned hierarchies are sorted based on the total instances belonging to the hierarchy node and its child hierarchy nodes. When it is set to 'Name', the returned hierarchies are sorted based on the hierarchy name. Optional, default is 'CumulativeInstanceCount'.
    string 'by?;
};

# Definition of how time series hierarchy tree levels are created.
public type TimeserieshierarchySource record {
    # List of instance field names that must be set in all time series instances that belong to this hierarchy. The order of the instance fields defines the levels in the hierarchy.
    string[] instanceFieldNames?;
};

# Request to get search string suggestions for time series instances search based on prefix text.
public type InstancesSuggestRequest record {
    # Search string for which suggestions are required. Empty is allowed, but not null.
    string searchString;
    # Maximum number of suggestions expected in the result. Defaults to 10 when not set.
    int take?;
};

# Additional error information.
public type TsiErrorDetails record {
    # Language-independent, human-readable string that defines a service-specific error code. This code serves as a more specific indicator for the HTTP error code specified in the response. Can be used to programmatically handle specific error cases.
    string code?;
    # Human-readable, language-independent representation of the error. It is intended as an aid to developers and is not suitable for exposure to end users.
    string message?;
};

# Category used in categorical variables. A category is defined by 'label' and the 'values' that are assigned this label.
public type TimeSeriesAggregateCategory record {
    # The name of the category which will be used in constructing the output variable names.
    string label;
    # The list of values that a category maps to. Can be either a unique list of string or list of long.
    record {}[] values;
};

# Request to get or delete instances by time series IDs or time series names. Exactly one of "timeSeriesIds" or "names" must be set.
public type InstancesRequestBatchGetOrDelete record {
    # List of time series IDs of the time series instances to return or delete.
    TimeSeriesId[] timeSeriesIds?;
    # List of names of the time series instances to return or delete.
    string[] names?;
};

# Partial list of time series hierarchies returned in a single request.
public type GetHierarchiesPage record {
    *PagedResponse;
    # Partial list of time series hierarchies returned in a single request. Can be empty if server was unable to fill the page in this request, or there is no more objects when continuation token is null.
    TimeSeriesHierarchy[] hierarchies?;
};

# Request to perform a single operation on a batch of instances. Exactly one of "get", "put", "update" or "delete" must be set.
public type InstancesBatchRequest record {
    # Request to get or delete instances by time series IDs or time series names. Exactly one of "timeSeriesIds" or "names" must be set.
    InstancesRequestBatchGetOrDelete get?;
    # Time series instances to be created or updated.
    TimeSeriesInstance[] put?;
    # Time series instance to be updated. If instance does not exist, an error is returned.
    TimeSeriesInstance[] update?;
    # Request to get or delete instances by time series IDs or time series names. Exactly one of "timeSeriesIds" or "names" must be set.
    InstancesRequestBatchGetOrDelete delete?;
};

# Request to perform a single operation on a batch of hierarchies. Exactly one of "get", "put" or "delete" must be set.
public type HierarchiesBatchRequest record {
    # Request to get or delete multiple time series hierarchies. Exactly one of "hierarchyIds" or "names" must be set.
    HierarchiesRequestBatchGetDelete get?;
    # "put" should be set while creating or updating hierarchies.
    TimeSeriesHierarchy[] put?;
    # Request to get or delete multiple time series hierarchies. Exactly one of "hierarchyIds" or "names" must be set.
    HierarchiesRequestBatchGetDelete delete?;
};

# Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
public type Tsx record {
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    string tsx;
};

# Response of getting suggestions for search for time series instances.
public type InstancesSuggestResponse record {
    # List of instance suggestions for searching time series models.
    InstancesSearchStringSuggestion[] suggestions?;
};

# Variables are named calculations over values from the events. Time Series Insights variable definitions contain formula and computation rules. Variables are stored in the type definition in Time Series Model and can be provided inline via Query APIs to override the stored definition.
public type Variable record {
    # Allowed "kind" values are - "numeric" or "aggregate". While "numeric" allows you to specify value of the reconstructed signal and the expression to aggregate them, the "aggregate" kind lets you directly aggregate on the event properties without specifying value.
    string kind;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx filter?;
};

# Request to execute a search query against time series instances and return matching time series instances.
public type SearchInstancesRequest record {
    # Query search string that will be matched to the attributes of time series instances. Example: "floor 100". Case-insensitive, must be present, but can be empty string.
    string searchString;
    # Filter on hierarchy path of time series instances. Path is represented as array of string path segments. First element should be hierarchy name. Example: ["Location", "California"]. Optional, case sensitive, never empty and can be null.
    string[] path?;
    # Parameters of how to return time series instances by search instances call.
    SearchInstancesParameters instances?;
    # Parameter of how to return time series instance hierarchies by search instances call.
    SearchInstancesHierarchiesParameters hierarchies?;
};

# The time range to the left and right of the search span to be used for Interpolation. This is helpful in scenarios where the data points are missing close to the start or end of the input search span. Can be null.
public type InterpolationBoundary record {
    # Search span.
    string span?;
};

# Get Series query. Allows to retrieve time series of calculated variable values from events for a given Time Series ID and search span.
public type GetSeries record {
    # A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
    TimeSeriesId timeSeriesId;
    # The range of time. Cannot be null or negative.
    DateTimeRange searchSpan;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx filter?;
    # Selected variables that needs to be projected in the query result. When it is null or not set, all the variables from inlineVariables and time series type in the model are returned. Can be null.
    string[] projectedVariables?;
    # Optional inline variables apart from the ones already defined in the time series type in the model. When the inline variable name is the same name as in the model, the inline variable definition takes precedence. Can be null.
    record {} inlineVariables?;
    # Maximum number of property values in the whole response set, not the maximum number of property values per page. Defaults to 10,000 when not set. Maximum value of take can be 250,000.
    int take?;
};

# Represents the default category.
public type TimeSeriesDefaultCategory record {
    # The name of the default category which will be assigned to the values that does not match any of those that are defined in the 'categories'.
    string label;
};

# Suggested search string to be used for further search for time series instances.
public type InstancesSearchStringSuggestion record {
    # Suggested search string. Can be used for further search for time series instances.
    string searchString?;
    # Highlighted suggested search string to be displayed to the user. Highlighting inserts <hit> and </hit> tags in the portions of text that matched the search string. Do not use highlighted search string to do further search calls.
    string highlightedSearchString?;
};

# Aggregate Series query. Allows to calculate an aggregated time series from events for a given Time Series ID and search span.
public type AggregateSeries record {
    # A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
    TimeSeriesId timeSeriesId;
    # The range of time. Cannot be null or negative.
    DateTimeRange searchSpan;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx filter?;
    # Interval size is specified in ISO-8601 duration format. All intervals are the same size. One month is always converted to 30 days, and one year is always 365 days. Examples: 1 minute is "PT1M", 1 millisecond is "PT0.001S". For more information, see https://www.w3.org/TR/xmlschema-2/#duration
    string interval;
    # This allows the user to optionally select the variables that needs to be projected. When it is null or not set, all the variables from inlineVariables and model are returned. Can be null.
    string[] projectedVariables?;
    # This allows the user the optionally define inline-variables apart from the ones already defined in the model. When the inline variable names have the same name as the model, the inline variable definition takes precedence. Can be null.
    record {} inlineVariables?;
};

# Result of a batch operation on a particular time series hierarchy. Hierarchy is set when operation is successful and error object is set when operation is unsuccessful.
public type TimeSeriesHierarchyOrError record {
    # Time series hierarchy organizes time series instances into a tree.
    TimeSeriesHierarchy hierarchy?;
    # A particular API error with an error code and a message.
    TsiErrorBody _error?;
};

# Property of an event that is either stored or computed. Properties are identified by both name and type. Different events can have properties with same name, but different type.
public type EventProperty record {
    # The name of the property.
    string name?;
    # The type of the property that is either stored in events or computed by a calculation.
    PropertyType 'type?;
};

# A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
public type TimeSeriesId record {}[];

# The hierarchy node which contains the instances matching the query based on the input. May be empty or null.
public type HierarchyHit record {
    # Name of the hierarchy node. May be empty, cannot be null.
    string name?;
    # Total number of instances that belong to this node and it's subtrees matching the query.
    int cumulativeInstanceCount?;
    # The hierarchy nodes which contains the instances matching the query based on the input. May be empty or null.
    SearchHierarchyNodesResponse hierarchyNodes?;
};

# Partial list of time series instances returned in a single request.
public type GetInstancesPage record {
    *PagedResponse;
    # Partial list of time series instances returned in a single request. Can be empty if server was unable to fill the page in this request, or there is no more objects when continuation token is null.
    TimeSeriesInstance[] instances?;
};

# Request to perform a single operation on a batch of time series types. Exactly one of "get", "put" or "delete" must be set.
public type TypesBatchRequest record {
    # Request to get or delete time series types by IDs or type names. Exactly one of "typeIds" or "names" must be set.
    TypesRequestBatchGetOrDelete get?;
    # Definition of what time series types to update or create.
    TimeSeriesType[] put?;
    # Request to get or delete time series types by IDs or type names. Exactly one of "typeIds" or "names" must be set.
    TypesRequestBatchGetOrDelete delete?;
};

# A definition of a single property that can be used in time series ID properties defined during environment creation.
public type TimeSeriesIdProperty record {
    # The name of the property.
    string name?;
    # The type of the property. Currently, only "String" is supported.
    string 'type?;
};

# Definition of how time series instances are sorted before being returned by search instances call.
public type InstancesSortParameter record {
    # Value to use for sorting of the time series instances before being returned by search instances call. When it is set to 'Rank', the returned instances are sorted based on the relevance. When it is set to 'DisplayName', the returned results are sorted based on the display name. Display name is the name of the instance if it exists, otherwise, display name is the time series ID. Default is 'Rank'.
    string 'by?;
};

# The range of time. Cannot be null or negative.
public type DateTimeRange record {
    # Start timestamp of the time range. Start timestamp is inclusive when used in time series query requests. Events that have this timestamp are included.
    string 'from;
    # End timestamp of the time range. End timestamp is exclusive when used in time series query requests. Events that match this timestamp are excluded. Note that end timestamp is inclusive when returned by Get Availability (meaning that there is an event with this exact "to" timestamp).
    string to;
};

# Request to update model settings. One of "name" or "defaultTypeId" must be set.
public type UpdateModelSettingsRequest record {
    # Model display name which is shown in the UX and mutable by the user. Initial value is "DefaultModel".
    string name?;
    # Default type id of the model that new instances will automatically belong to.
    string defaultTypeId?;
};

# Event schema of all events within a given search span. Event schema is a set of property definitions. Properties are identified by both name and type. Different events can have properties with same name, but different type. Event schema may not be contain all persisted properties when there are too many properties.
public type EventSchema record {
    # A set of property definitions. When environment has no data, the returned array is empty.
    EventProperty[] properties?;
};

# Request to execute a time series query over events. Exactly one of "getEvents", "getSeries" or "aggregateSeries" must be set.
public type QueryRequest record {
    # Get Events query. Allows to retrieve raw events for a given Time Series ID and search span.
    GetEvents getEvents?;
    # Get Series query. Allows to retrieve time series of calculated variable values from events for a given Time Series ID and search span.
    GetSeries getSeries?;
    # Aggregate Series query. Allows to calculate an aggregated time series from events for a given Time Series ID and search span.
    AggregateSeries aggregateSeries?;
};

# Time series hierarchy organizes time series instances into a tree.
public type TimeSeriesHierarchy record {
    # Case-sensitive unique hierarchy identifier. Can be null while creating hierarchy objects and then server generates the id, not null on get and delete operations.
    string id?;
    # User-given unique name for the type. It is mutable and not null.
    string name;
    # Definition of how time series hierarchy tree levels are created.
    TimeserieshierarchySource 'source;
};

# Parameters of how to return time series instances by search instances call.
public type SearchInstancesParameters record {
    # Definition of which instances are returned. When recursive is set to 'true', all instances that have the path that starts with path the path parameter are returned. When recursive is set to 'false', only instances that have the path that exactly matches the path parameter are returned. Using recursive search allows to implement search user experience, while using non-recursive search allows to implement navigation experience. Optional, default is 'true'.
    boolean recursive?;
    # Definition of how time series instances are sorted before being returned by search instances call.
    InstancesSortParameter sort?;
    # Definition of highlighted search results or not. When it is set to 'true', the highlighted search results are returned. When it is set to 'false', the highlighted search results are not returned. Default is 'true'.
    boolean highlights?;
    # Maximum number of instances expected in each page of the result. Defaults to 10 when not set. Ranges from 1 to 100. If there are results beyond the page size, the user can use the continuation token to fetch the next page.
    int pageSize?;
};

# Response of a single operation on a batch of time series types. Exactly one of "get", "put" or "delete" will be set.
public type TypesBatchResponse record {
    # List of types or error objects corresponding by position to the "get" array in the request. Type object is set when operation is successful and error object is set when operation is unsuccessful.
    TimeSeriesTypeOrError[] get?;
    # List of types or error objects corresponding by position to the "put" array in the request. Type object is set when operation is successful and error object is set when operation is unsuccessful.
    TimeSeriesTypeOrError[] put?;
    # List of error objects corresponding by position to the "delete" array in the request - null when the operation is successful.
    TsiErrorBody[] delete?;
};

# Numeric variable represents a single continuous numeric signal that can be reconstructed using interpolation.
public type NumericVariable record {
    *Variable;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx value?;
    # The interpolation operation to be performed on the raw data points. Currently, only sampling of interpolated time series is allowed. Allowed aggregate function - eg: left($value). Can be null if no interpolation needs to be applied.
    Interpolation interpolation?;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx aggregation?;
};

# Aggregate variable represents any aggregation calculation. Aggregate Variables does not support interpolation.
public type AggregateVariable record {
    *Variable;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx aggregation?;
};

# Time series ID properties defined during environment creation.
public type TimeSeriesIdProperties TimeSeriesIdProperty[];

# The interpolation operation to be performed on the raw data points. Currently, only sampling of interpolated time series is allowed. Allowed aggregate function - eg: left($value). Can be null if no interpolation needs to be applied.
public type Interpolation record {
    # The type of interpolation technique : "Linear" or "Step".
    string kind?;
    # The time range to the left and right of the search span to be used for Interpolation. This is helpful in scenarios where the data points are missing close to the start or end of the input search span. Can be null.
    InterpolationBoundary boundary?;
};

# Request to get the event schema of all events within a given search span.
public type GetEventSchemaRequest record {
    # The range of time. Cannot be null or negative.
    DateTimeRange searchSpan;
};

# Result of a batch operation on a particular time series type. Type object is set when operation is successful and error object is set when operation is unsuccessful.
public type TimeSeriesTypeOrError record {
    # Time series type defines variables or formulas for doing computation on events associated with time series instances. Each time series instance is associated with exactly one type. A type can have one or more variables. For example, a time series instance might be of type Temperature Sensor, which consists of the variables avg temperature, min temperature, and max temperature.
    TimeSeriesType timeSeriesType?;
    # A particular API error with an error code and a message.
    TsiErrorBody _error?;
};

# A particular API error with an error code and a message.
public type TsiErrorBody record {
    # Language-independent, human-readable string that defines a service-specific error code. This code serves as a more specific indicator for the HTTP error code specified in the response. Can be used to programmatically handle specific error cases.
    string code?;
    # Human-readable, language-independent representation of the error. It is intended as an aid to developers and is not suitable for exposure to end users.
    string message?;
    # Target of the particular error (for example, the name of the property in error). May be null.
    string target?;
    # A particular API error with an error code and a message.
    TsiErrorBody innerError?;
    # Contains additional error information. May be null.
    TsiErrorDetails[] details?;
};

# Request to get or delete multiple time series hierarchies. Exactly one of "hierarchyIds" or "names" must be set.
public type HierarchiesRequestBatchGetDelete record {
    # List of hierarchy IDs.
    string[] hierarchyIds?;
    # List of hierarchy names.
    string[] names?;
};

# Partial result that has continuation token to fetch the next partial result.
public type PagedResponse record {
    # If returned, this means that current results represent a partial result. Continuation token allows to get the next page of results. To get the next page of query results, send the same request with continuation token parameter in "x-ms-continuation" HTTP header.
    string continuationToken?;
};

# A single page of query results. If query has not finished yet, a page will have continuation token set. In this case, to get the next page of results, send the same request again with continuation token parameter. If query has completed, the continuation token is null. It is also possible to get an empty page with only continuation token set when no query results have been computed yet. If paging has completed (continuation token is null), then timestamps and properties may be empty if there is no data to return.
public type QueryResultPage record {
    *PagedResponse;
    # The timestamps of the values of the time series. If an aggregation over intervals is used, timestamps represent the start of corresponding intervals. If events are retrieved, timestamps are values of timestamp $ts property of events. Can be null if server was unable to fill the page in this request, or can be empty if there are no more objects when continuation token is null.
    string[] timestamps?;
    # Collection of time series properties and values for each of the timestamps.  Can be null if server was unable to fill the page in this request, or can be empty if there are no more objects when continuation token is null.
    PropertyValues[] properties?;
    # Approximate progress of the query in percentage. It can be between 0 and 100. When the continuation token in the response is null, the progress is expected to be 100.
    float progress?;
};

# Response of a single operation on a batch of instances. Only one of "get", "put", "update" or "delete" will be set based on the request.
public type InstancesBatchResponse record {
    # List of instance or error objects corresponding by position to the "get" array in the request. Instance object is set when operation is successful and error object is set when operation is unsuccessful.
    InstanceOrError[] get?;
    # List of error objects corresponding by position to the "put" array in the request. Error object is set when operation is unsuccessful.
    InstanceOrError[] put?;
    # List of error objects corresponding by position to the "update" array in the request. Instance object is set when operation is successful and error object is set when operation is unsuccessful.
    InstanceOrError[] update?;
    # List of error objects corresponding by position to the "delete" array in the request. Null means the instance has been deleted, or did not exist. Error object is set when operation is unsuccessful (e.g. when there are events associated with this time series instance).
    TsiErrorBody[] delete?;
};

# Get Events query. Allows to retrieve raw events for a given Time Series ID and search span.
public type GetEvents record {
    # A single Time Series ID value that is an array of primitive values that uniquely identifies a time series instance (e.g. a single device). Note that a single Time Series ID can be composite if multiple properties are specified as Time Series ID at environment creation time. The position and type of values must match Time Series ID properties specified on the environment and returned by Get Model Setting API. Cannot be empty.
    TimeSeriesId timeSeriesId;
    # The range of time. Cannot be null or negative.
    DateTimeRange searchSpan;
    # Time series expression (TSX) written as a single string. Examples: "$event.Status.String='Good'", "avg($event.Temperature)". Refer to the documentation on how to write time series expressions.
    Tsx filter?;
    # Projected properties is an array of properties which you want to project. These properties must appear in the events; otherwise, they are not returned.
    EventProperty[] projectedProperties?;
    # Maximum number of property values in the whole response set, not the maximum number of property values per page. Defaults to 10,000 when not set. Maximum value of take can be 250,000.
    int take?;
};
