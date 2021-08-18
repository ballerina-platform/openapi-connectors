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

# A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
public type Entity record {
    # A unique identifier for an entity. If a key's partition ID or any of its path kinds or names are reserved/read-only, the key is reserved/read-only. A reserved/read-only key is forbidden in certain documented contexts.
    Key 'key?;
    # The entity's properties. The map's keys are property names. A property name matching regex `__.*__` is reserved. A reserved property name is forbidden in certain documented contexts. The name must not contain more than 500 characters. The name cannot be `""`.
    record {} properties?;
};

# A query for entities.
public type Query record {
    # The properties to make distinct. The query results will contain the first result for each distinct combination of values for the given properties (if empty, all results are returned).
    PropertyReference[] distinctOn?;
    # An ending point for the query results. Query cursors are returned in query result batches and [can only be used to limit the same query](https://cloud.google.com/datastore/docs/concepts/queries#cursors_limits_and_offsets).
    string endCursor?;
    # A holder for any type of filter.
    Filter filter?;
    # The kinds to query (if empty, returns entities of all kinds). Currently at most 1 kind may be specified.
    KindExpression[] kind?;
    # The maximum number of results to return. Applies after all other constraints. Optional. Unspecified is interpreted as no limit. Must be >= 0 if specified.
    int 'limit?;
    # The number of results to skip. Applies before limit, but after all other constraints. Optional. Must be >= 0 if specified.
    int offset?;
    # The order to apply to the query results (if empty, order is unspecified).
    PropertyOrder[] 'order?;
    # The projection to return. Defaults to returning all properties.
    Projection[] projection?;
    # A starting point for the query results. Query cursors are returned in query result batches and [can only be used to continue the same query](https://cloud.google.com/datastore/docs/concepts/queries#cursors_limits_and_offsets).
    string startCursor?;
};

# A representation of a property in a projection.
public type Projection record {
    # A reference to a property relative to the kind expressions.
    PropertyReference property?;
};

# The result of fetching an entity from Datastore.
public type EntityResult record {
    # A cursor that points to the position after the result entity. Set only when the `EntityResult` is part of a `QueryResultBatch` message.
    string cursor?;
    # A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
    Entity entity?;
    # The version of the entity, a strictly positive number that monotonically increases with changes to the entity. This field is set for `FULL` entity results. For missing entities in `LookupResponse`, this is the version of the snapshot that was used to look up the entity, and it is always set except for eventually consistent reads.
    string 'version?;
};

# The request for Datastore.Lookup.
public type LookupRequest record {
    # Required. Keys of entities to look up.
    Key[] keys?;
    # The options shared by read requests.
    ReadOptions readOptions?;
};

# Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
public type GoogleDatastoreAdminV1beta1EntityFilter record {
    # If empty, then this represents all kinds.
    string[] kinds?;
    # An empty list represents all namespaces. This is the preferred usage for projects that don't use namespaces. An empty string element represents the default namespace. This should be used if the project has data in non-default namespaces, but doesn't want to include them. Each namespace in this list must be unique.
    string[] namespaceIds?;
};

# A (kind, ID/name) pair used to construct a key path. If either name or ID is set, the element is complete. If neither is set, the element is incomplete.
public type PathElement record {
    # The auto-allocated ID of the entity. Never equal to zero. Values less than zero are discouraged and may not be supported in the future.
    string id?;
    # The kind of the entity. A kind matching regex `__.*__` is reserved/read-only. A kind must not contain more than 1500 bytes when UTF-8 encoded. Cannot be `""`.
    string kind?;
    # The name of the entity. A name matching regex `__.*__` is reserved/read-only. A name must not be more than 1500 bytes when UTF-8 encoded. Cannot be `""`.
    string name?;
};

# Datastore composite index definition.
public type GoogleDatastoreAdminV1Index record {
    # Required. The index's ancestor mode. Must not be ANCESTOR_MODE_UNSPECIFIED.
    string ancestor?;
    # Output only. The resource ID of the index.
    string indexId?;
    # Required. The entity kind to which this index applies.
    string kind?;
    # Output only. Project ID.
    string projectId?;
    # Required. An ordered sequence of property names and their index attributes.
    GoogleDatastoreAdminV1IndexedProperty[] properties?;
    # Output only. The state of the index.
    string state?;
};

# An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
public type LatLng record {
    # The latitude in degrees. It must be in the range [-90.0, +90.0].
    float latitude?;
    # The longitude in degrees. It must be in the range [-180.0, +180.0].
    float longitude?;
};

# The result of applying a mutation.
public type MutationResult record {
    # Whether a conflict was detected for this mutation. Always false when a conflict detection strategy field is not set in the mutation.
    boolean conflictDetected?;
    # A unique identifier for an entity. If a key's partition ID or any of its path kinds or names are reserved/read-only, the key is reserved/read-only. A reserved/read-only key is forbidden in certain documented contexts.
    Key 'key?;
    # The version of the entity on the server after processing the mutation. If the mutation doesn't change anything on the server, then the version will be the version of the current entity or, if no entity is present, a version that is strictly greater than the version of any previous entity and less than the version of any possible future entity.
    string 'version?;
};

# The request for Datastore.Commit.
public type CommitRequest record {
    # The type of commit to perform. Defaults to `TRANSACTIONAL`.
    string mode?;
    # The mutations to perform. When mode is `TRANSACTIONAL`, mutations affecting a single entity are applied in order. The following sequences of mutations affecting a single entity are not permitted in a single `Commit` request: - `insert` followed by `insert` - `update` followed by `insert` - `upsert` followed by `insert` - `delete` followed by `update` When mode is `NON_TRANSACTIONAL`, no two mutations may affect a single entity.
    Mutation[] mutations?;
    # The identifier of the transaction associated with the commit. A transaction identifier is returned by a call to Datastore.BeginTransaction.
    string 'transaction?;
};

# Options specific to read-only transactions.
public type ReadOnly record {
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

# A filter that merges multiple other filters using the given operator.
public type CompositeFilter record {
    # The list of filters to combine. Must contain at least one filter.
    Filter[] filters?;
    # The operator for combining multiple filters.
    string op?;
};

# Measures the progress of a particular metric.
public type GoogleDatastoreAdminV1Progress record {
    # The amount of work that has been completed. Note that this may be greater than work_estimated.
    string workCompleted?;
    # An estimate of how much work needs to be performed. May be zero if the work estimate is unavailable.
    string workEstimated?;
};

# The desired order for a specific property.
public type PropertyOrder record {
    # The direction to order by. Defaults to `ASCENDING`.
    string direction?;
    # A reference to a property relative to the kind expressions.
    PropertyReference property?;
};

# The request for Datastore.ReserveIds.
public type ReserveIdsRequest record {
    # If not empty, the ID of the database against which to make the request.
    string databaseId?;
    # Required. A list of keys with complete key paths whose numeric IDs should not be auto-allocated.
    Key[] keys?;
};

# The request for Datastore.RunQuery.
public type RunQueryRequest record {
    # A [GQL query](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
    GqlQuery gqlQuery?;
    # A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty. A partition ID contains several dimensions: project ID and namespace ID. Partition dimensions: - May be `""`. - Must be valid UTF-8 bytes. - Must have values that match regex `[A-Za-z\d\.\-_]{1,100}` If the value of any dimension matches regex `__.*__`, the partition is reserved/read-only. A reserved/read-only partition ID is forbidden in certain documented contexts. Foreign partition IDs (in which the project ID does not match the context project ID ) are discouraged. Reads and writes of foreign partition IDs may fail if the project is not in an active state.
    PartitionId partitionId?;
    # A query for entities.
    Query query?;
    # The options shared by read requests.
    ReadOptions readOptions?;
};

# The response for Datastore.Commit.
public type CommitResponse record {
    # The number of index entries updated during the commit, or zero if none were updated.
    int indexUpdates?;
    # The result of performing the mutations. The i-th mutation result corresponds to the i-th mutation in the request.
    MutationResult[] mutationResults?;
};

# The request for Datastore.AllocateIds.
public type AllocateIdsRequest record {
    # Required. A list of keys with incomplete key paths for which to allocate IDs. No key may be reserved/read-only.
    Key[] keys?;
};

# Metadata common to all Datastore Admin operations.
public type GoogleDatastoreAdminV1beta1CommonMetadata record {
    # The time the operation ended, either successfully or otherwise.
    string endTime?;
    # The client-assigned labels which were provided when the operation was created. May also include additional labels.
    record {} labels?;
    # The type of the operation. Can be used as a filter in ListOperationsRequest.
    string operationType?;
    # The time that work began on the operation.
    string startTime?;
    # The current state of the Operation.
    string state?;
};

# The response for Datastore.Lookup.
public type LookupResponse record {
    # A list of keys that were not looked up due to resource constraints. The order of results in this field is undefined and has no relation to the order of the keys in the input.
    Key[] deferred?;
    # Entities found as `ResultType.FULL` entities. The order of results in this field is undefined and has no relation to the order of the keys in the input.
    EntityResult[] found?;
    # Entities not found as `ResultType.KEY_ONLY` entities. The order of results in this field is undefined and has no relation to the order of the keys in the input.
    EntityResult[] missing?;
};

# A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty. A partition ID contains several dimensions: project ID and namespace ID. Partition dimensions: - May be `""`. - Must be valid UTF-8 bytes. - Must have values that match regex `[A-Za-z\d\.\-_]{1,100}` If the value of any dimension matches regex `__.*__`, the partition is reserved/read-only. A reserved/read-only partition ID is forbidden in certain documented contexts. Foreign partition IDs (in which the project ID does not match the context project ID ) are discouraged. Reads and writes of foreign partition IDs may fail if the project is not in an active state.
public type PartitionId record {
    # If not empty, the ID of the namespace to which the entities belong.
    string namespaceId?;
    # The ID of the project to which the entities belong.
    string projectId?;
};

# The response for Datastore.BeginTransaction.
public type BeginTransactionResponse record {
    # The transaction identifier (always present).
    string 'transaction?;
};

# The response for google.datastore.admin.v1.DatastoreAdmin.ExportEntities.
public type GoogleDatastoreAdminV1ExportEntitiesResponse record {
    # Location of the output metadata file. This can be used to begin an import into Cloud Datastore (this project or another project). See google.datastore.admin.v1.ImportEntitiesRequest.input_url. Only present if the operation completed successfully.
    string outputUrl?;
};

# The response for Datastore.RunQuery.
public type RunQueryResponse record {
    # A batch of results produced by a query.
    QueryResultBatch batch?;
    # A query for entities.
    Query query?;
};

# A binding parameter for a GQL query.
public type GqlQueryParameter record {
    # A query cursor. Query cursors are returned in query result batches.
    string cursor?;
    # A message that can hold any of the supported value types and associated metadata.
    Value value?;
};

# A message that can hold any of the supported value types and associated metadata.
public type Value record {
    # An array value.
    ArrayValue arrayValue?;
    # A blob value. May have at most 1,000,000 bytes. When `exclude_from_indexes` is false, may have at most 1500 bytes. In JSON requests, must be base64-encoded.
    string blobValue?;
    # A boolean value.
    boolean booleanValue?;
    # A double value.
    float doubleValue?;
    # A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
    Entity entityValue?;
    # If the value should be excluded from all indexes including those defined explicitly.
    boolean excludeFromIndexes?;
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng geoPointValue?;
    # An integer value.
    string integerValue?;
    # A unique identifier for an entity. If a key's partition ID or any of its path kinds or names are reserved/read-only, the key is reserved/read-only. A reserved/read-only key is forbidden in certain documented contexts.
    Key keyValue?;
    # The `meaning` field should only be populated for backwards compatibility.
    int meaning?;
    # A null value.
    string nullValue?;
    # A UTF-8 encoded string value. When `exclude_from_indexes` is false (it is indexed) , may have at most 1500 bytes. Otherwise, may be set to at most 1,000,000 bytes.
    string stringValue?;
    # A timestamp value. When stored in the Datastore, precise only to microseconds; any additional precision is rounded down.
    string timestampValue?;
};

# The response for Datastore.AllocateIds.
public type AllocateIdsResponse record {
    # The keys specified in the request (in the same order), each with its key path completed with a newly allocated ID.
    Key[] keys?;
};

# A filter on a specific property.
public type PropertyFilter record {
    # The operator to filter by.
    string op?;
    # A reference to a property relative to the kind expressions.
    PropertyReference property?;
    # A message that can hold any of the supported value types and associated metadata.
    Value value?;
};

# A mutation to apply to an entity.
public type Mutation record {
    # The version of the entity that this mutation is being applied to. If this does not match the current version on the server, the mutation conflicts.
    string baseVersion?;
    # A unique identifier for an entity. If a key's partition ID or any of its path kinds or names are reserved/read-only, the key is reserved/read-only. A reserved/read-only key is forbidden in certain documented contexts.
    Key delete?;
    # A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
    Entity insert?;
    # A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
    Entity update?;
    # A Datastore data object. An entity is limited to 1 megabyte when stored. That _roughly_ corresponds to a limit of 1 megabyte for the serialized form of this message.
    Entity upsert?;
};

# An array value.
public type ArrayValue record {
    # Values in the array. The order of values in an array is preserved as long as all values have identical settings for 'exclude_from_indexes'.
    Value[] values?;
};

# A unique identifier for an entity. If a key's partition ID or any of its path kinds or names are reserved/read-only, the key is reserved/read-only. A reserved/read-only key is forbidden in certain documented contexts.
public type Key record {
    # A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty. A partition ID contains several dimensions: project ID and namespace ID. Partition dimensions: - May be `""`. - Must be valid UTF-8 bytes. - Must have values that match regex `[A-Za-z\d\.\-_]{1,100}` If the value of any dimension matches regex `__.*__`, the partition is reserved/read-only. A reserved/read-only partition ID is forbidden in certain documented contexts. Foreign partition IDs (in which the project ID does not match the context project ID ) are discouraged. Reads and writes of foreign partition IDs may fail if the project is not in an active state.
    PartitionId partitionId?;
    # The entity path. An entity path consists of one or more elements composed of a kind and a string or numerical identifier, which identify entities. The first element identifies a _root entity_, the second element identifies a _child_ of the root entity, the third element identifies a child of the second entity, and so forth. The entities identified by all prefixes of the path are called the element's _ancestors_. An entity path is always fully complete: *all* of the entity's ancestors are required to be in the path along with the entity identifier itself. The only exception is that in some documented cases, the identifier in the last path element (for the entity) itself may be omitted. For example, the last path element of the key of `Mutation.insert` may have no identifier. A path can never be empty, and a path can have at most 100 elements.
    PathElement[] path?;
};

# Metadata for ImportEntities operations.
public type GoogleDatastoreAdminV1beta1ImportEntitiesMetadata record {
    # Metadata common to all Datastore Admin operations.
    GoogleDatastoreAdminV1beta1CommonMetadata common?;
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1beta1EntityFilter entityFilter?;
    # The location of the import metadata file. This will be the same value as the google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url field.
    string inputUrl?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1beta1Progress progressBytes?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1beta1Progress progressEntities?;
};

# The request for google.datastore.admin.v1.DatastoreAdmin.ExportEntities.
public type GoogleDatastoreAdminV1ExportEntitiesRequest record {
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1EntityFilter entityFilter?;
    # Client-assigned labels.
    record {} labels?;
    # Required. Location for the export metadata and data files. The full resource URL of the external storage location. Currently, only Google Cloud Storage is supported. So output_url_prefix should be of the form: `gs://BUCKET_NAME[/NAMESPACE_PATH]`, where `BUCKET_NAME` is the name of the Cloud Storage bucket and `NAMESPACE_PATH` is an optional Cloud Storage namespace path (this is not a Cloud Datastore namespace). For more information about Cloud Storage namespace paths, see [Object name considerations](https://cloud.google.com/storage/docs/naming#object-considerations). The resulting files will be nested deeper than the specified URL prefix. The final output URL will be provided in the google.datastore.admin.v1.ExportEntitiesResponse.output_url field. That value should be used for subsequent ImportEntities operations. By nesting the data files deeper, the same Cloud Storage bucket can be used in multiple ExportEntities operations without conflict.
    string outputUrlPrefix?;
};

# The request for google.datastore.admin.v1.DatastoreAdmin.ImportEntities.
public type GoogleDatastoreAdminV1ImportEntitiesRequest record {
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1EntityFilter entityFilter?;
    # Required. The full resource URL of the external storage location. Currently, only Google Cloud Storage is supported. So input_url should be of the form: `gs://BUCKET_NAME[/NAMESPACE_PATH]/OVERALL_EXPORT_METADATA_FILE`, where `BUCKET_NAME` is the name of the Cloud Storage bucket, `NAMESPACE_PATH` is an optional Cloud Storage namespace path (this is not a Cloud Datastore namespace), and `OVERALL_EXPORT_METADATA_FILE` is the metadata file written by the ExportEntities operation. For more information about Cloud Storage namespace paths, see [Object name considerations](https://cloud.google.com/storage/docs/naming#object-considerations). For more information, see google.datastore.admin.v1.ExportEntitiesResponse.output_url.
    string inputUrl?;
    # Client-assigned labels.
    record {} labels?;
};

# The request for Datastore.Rollback.
public type RollbackRequest record {
    # Required. The transaction identifier, returned by a call to Datastore.BeginTransaction.
    string 'transaction?;
};

# A [GQL query](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
public type GqlQuery record {
    # When false, the query string must not contain any literals and instead must bind all values. For example, `SELECT * FROM Kind WHERE a = 'string literal'` is not allowed, while `SELECT * FROM Kind WHERE a = @value` is.
    boolean allowLiterals?;
    # For each non-reserved named binding site in the query string, there must be a named parameter with that name, but not necessarily the inverse. Key must match regex `A-Za-z_$*`, must not match regex `__.*__`, and must not be `""`.
    record {} namedBindings?;
    # Numbered binding site @1 references the first numbered parameter, effectively using 1-based indexing, rather than the usual 0. For each binding site numbered i in `query_string`, there must be an i-th numbered parameter. The inverse must also be true.
    GqlQueryParameter[] positionalBindings?;
    # A string of the format described [here](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
    string queryString?;
};

# Metadata for ImportEntities operations.
public type GoogleDatastoreAdminV1ImportEntitiesMetadata record {
    # Metadata common to all Datastore Admin operations.
    GoogleDatastoreAdminV1CommonMetadata common?;
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1EntityFilter entityFilter?;
    # The location of the import metadata file. This will be the same value as the google.datastore.admin.v1.ExportEntitiesResponse.output_url field.
    string inputUrl?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1Progress progressBytes?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1Progress progressEntities?;
};

# A batch of results produced by a query.
public type QueryResultBatch record {
    # A cursor that points to the position after the last result in the batch.
    string endCursor?;
    # The result type for every entity in `entity_results`.
    string entityResultType?;
    # The results for this batch.
    EntityResult[] entityResults?;
    # The state of the query after the current batch.
    string moreResults?;
    # A cursor that points to the position after the last skipped result. Will be set when `skipped_results` != 0.
    string skippedCursor?;
    # The number of results skipped, typically because of an offset.
    int skippedResults?;
    # The version number of the snapshot this batch was returned from. This applies to the range of results from the query's `start_cursor` (or the beginning of the query if no cursor was given) to this batch's `end_cursor` (not the query's `end_cursor`). In a single transaction, subsequent query result batches for the same query can have a greater snapshot version number. Each batch's snapshot version is valid for all preceding batches. The value will be zero for eventually consistent queries.
    string snapshotVersion?;
};

# The options shared by read requests.
public type ReadOptions record {
    # The non-transactional read consistency to use. Cannot be set to `STRONG` for global queries.
    string readConsistency?;
    # The identifier of the transaction in which to read. A transaction identifier is returned by a call to Datastore.BeginTransaction.
    string 'transaction?;
};

# The request for Datastore.BeginTransaction.
public type BeginTransactionRequest record {
    # Options for beginning a new transaction. Transactions can be created explicitly with calls to Datastore.BeginTransaction or implicitly by setting ReadOptions.new_transaction in read requests.
    TransactionOptions transactionOptions?;
};

# Metadata for ExportEntities operations.
public type GoogleDatastoreAdminV1ExportEntitiesMetadata record {
    # Metadata common to all Datastore Admin operations.
    GoogleDatastoreAdminV1CommonMetadata common?;
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1EntityFilter entityFilter?;
    # Location for the export metadata and data files. This will be the same value as the google.datastore.admin.v1.ExportEntitiesRequest.output_url_prefix field. The final output location is provided in google.datastore.admin.v1.ExportEntitiesResponse.output_url.
    string outputUrlPrefix?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1Progress progressBytes?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1Progress progressEntities?;
};

# Metadata for ExportEntities operations.
public type GoogleDatastoreAdminV1beta1ExportEntitiesMetadata record {
    # Metadata common to all Datastore Admin operations.
    GoogleDatastoreAdminV1beta1CommonMetadata common?;
    # Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
    GoogleDatastoreAdminV1beta1EntityFilter entityFilter?;
    # Location for the export metadata and data files. This will be the same value as the google.datastore.admin.v1beta1.ExportEntitiesRequest.output_url_prefix field. The final output location is provided in google.datastore.admin.v1beta1.ExportEntitiesResponse.output_url.
    string outputUrlPrefix?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1beta1Progress progressBytes?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1beta1Progress progressEntities?;
};

# A representation of a kind.
public type KindExpression record {
    # The name of the kind.
    string name?;
};

# The response for google.datastore.admin.v1.DatastoreAdmin.ListIndexes.
public type GoogleDatastoreAdminV1ListIndexesResponse record {
    # The indexes.
    GoogleDatastoreAdminV1Index[] indexes?;
    # The standard List next-page token.
    string nextPageToken?;
};

# Measures the progress of a particular metric.
public type GoogleDatastoreAdminV1beta1Progress record {
    # The amount of work that has been completed. Note that this may be greater than work_estimated.
    string workCompleted?;
    # An estimate of how much work needs to be performed. May be zero if the work estimate is unavailable.
    string workEstimated?;
};

# The response for google.datastore.admin.v1beta1.DatastoreAdmin.ExportEntities.
public type GoogleDatastoreAdminV1beta1ExportEntitiesResponse record {
    # Location of the output metadata file. This can be used to begin an import into Cloud Datastore (this project or another project). See google.datastore.admin.v1beta1.ImportEntitiesRequest.input_url. Only present if the operation completed successfully.
    string outputUrl?;
};

# Options specific to read / write transactions.
public type ReadWrite record {
    # The transaction identifier of the transaction being retried.
    string previousTransaction?;
};

# The response message for Operations.ListOperations.
public type GoogleLongrunningListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    GoogleLongrunningOperation[] operations?;
};

# Metadata common to all Datastore Admin operations.
public type GoogleDatastoreAdminV1CommonMetadata record {
    # The time the operation ended, either successfully or otherwise.
    string endTime?;
    # The client-assigned labels which were provided when the operation was created. May also include additional labels.
    record {} labels?;
    # The type of the operation. Can be used as a filter in ListOperationsRequest.
    string operationType?;
    # The time that work began on the operation.
    string startTime?;
    # The current state of the Operation.
    string state?;
};

# A reference to a property relative to the kind expressions.
public type PropertyReference record {
    # The name of the property. If name includes "."s, it may be interpreted as a property name path.
    string name?;
};

# A holder for any type of filter.
public type Filter record {
    # A filter that merges multiple other filters using the given operator.
    CompositeFilter compositeFilter?;
    # A filter on a specific property.
    PropertyFilter propertyFilter?;
};

# Metadata for Index operations.
public type GoogleDatastoreAdminV1IndexOperationMetadata record {
    # Metadata common to all Datastore Admin operations.
    GoogleDatastoreAdminV1CommonMetadata common?;
    # The index resource ID that this operation is acting on.
    string indexId?;
    # Measures the progress of a particular metric.
    GoogleDatastoreAdminV1Progress progressEntities?;
};

# Options for beginning a new transaction. Transactions can be created explicitly with calls to Datastore.BeginTransaction or implicitly by setting ReadOptions.new_transaction in read requests.
public type TransactionOptions record {
    # Options specific to read-only transactions.
    ReadOnly readOnly?;
    # Options specific to read / write transactions.
    ReadWrite readWrite?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type GoogleLongrunningOperation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status _error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type XxxResponse, where `Xxx` is the original method name. For example, if the original method name is TakeSnapshot(), the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# Identifies a subset of entities in a project. This is specified as combinations of kinds and namespaces (either or both of which may be all, as described in the following examples). Example usage: Entire project: kinds=[], namespace_ids=[] Kinds Foo and Bar in all namespaces: kinds=['Foo', 'Bar'], namespace_ids=[] Kinds Foo and Bar only in the default namespace: kinds=['Foo', 'Bar'], namespace_ids=[''] Kinds Foo and Bar in both the default and Baz namespaces: kinds=['Foo', 'Bar'], namespace_ids=['', 'Baz'] The entire Baz namespace: kinds=[], namespace_ids=['Baz']
public type GoogleDatastoreAdminV1EntityFilter record {
    # If empty, then this represents all kinds.
    string[] kinds?;
    # An empty list represents all namespaces. This is the preferred usage for projects that don't use namespaces. An empty string element represents the default namespace. This should be used if the project has data in non-default namespaces, but doesn't want to include them. Each namespace in this list must be unique.
    string[] namespaceIds?;
};

# A property of an index.
public type GoogleDatastoreAdminV1IndexedProperty record {
    # Required. The indexed property's direction. Must not be DIRECTION_UNSPECIFIED.
    string direction?;
    # Required. The property name to index.
    string name?;
};
