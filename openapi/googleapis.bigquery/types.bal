// Copyright (c) 2021 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

public type JobStatistics record {
    # [TrustedTester] [Output-only] Job progress (0.0 -> 1.0) for LOAD and EXTRACT jobs.
    float completionRatio?;
    # [Output-only] Creation time of this job, in milliseconds since the epoch. This field will be present on all jobs.
    string creationTime?;
    # [Output-only] End time of this job, in milliseconds since the epoch. This field will be present whenever a job is in the DONE state.
    string endTime?;
    JobStatistics4 extract?;
    JobStatistics3 load?;
    # [Output-only] Number of child jobs executed.
    string numChildJobs?;
    # [Output-only] If this is a child job, the id of the parent.
    string parentJobId?;
    JobStatistics2 query?;
    # [Output-only] Quotas which delayed this job's start time.
    string[] quotaDeferments?;
    # [Output-only] Job resource usage breakdown by reservation.
    JobstatisticsReservationusage[] reservationUsage?;
    # [Output-only] Name of the primary reservation assigned to this job. Note that this could be different than reservations reported in the reservation usage field if parent reservations were used to execute this job.
    string reservation_id?;
    RowLevelSecurityStatistics rowLevelSecurityStatistics?;
    ScriptStatistics scriptStatistics?;
    SessionInfo sessionInfo?;
    # [Output-only] Start time of this job, in milliseconds since the epoch. This field will be present when the job transitions from the PENDING state to either RUNNING or DONE.
    string startTime?;
    # [Output-only] [Deprecated] Use the bytes processed in the query statistics instead.
    string totalBytesProcessed?;
    # [Output-only] Slot-milliseconds for the job.
    string totalSlotMs?;
    TransactionInfo transactionInfo?;
};

public type JobStatistics2 record {
    BiEngineStatistics biEngineStatistics?;
    # [Output-only] Billing tier for the job.
    int billingTier?;
    # [Output-only] Whether the query result was fetched from the query cache.
    boolean cacheHit?;
    # [Output-only] [Preview] The number of row access policies affected by a DDL statement. Present only for DROP ALL ROW ACCESS POLICIES queries.
    string ddlAffectedRowAccessPolicyCount?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference ddlDestinationTable?;
    # The DDL operation performed, possibly dependent on the pre-existence of the DDL target. Possible values (new values might be added in the future): "CREATE": The query created the DDL target. "SKIP": No-op. Example cases: the query is CREATE TABLE IF NOT EXISTS while the table already exists, or the query is DROP TABLE IF EXISTS while the table does not exist. "REPLACE": The query replaced the DDL target. Example case: the query is CREATE OR REPLACE TABLE, and the table already exists. "DROP": The query deleted the DDL target.
    string ddlOperationPerformed?;
    DatasetReference ddlTargetDataset?;
    # Reference describing the ID of this routine
    RoutineReference ddlTargetRoutine?;
    # [Output-only] [Preview] The DDL target row access policy. Present only for CREATE/DROP ROW ACCESS POLICY queries.
    RowAccessPolicyReference ddlTargetRowAccessPolicy?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference ddlTargetTable?;
    DmlStatistics dmlStats?;
    # [Output-only] The original estimate of bytes processed for the job.
    string estimatedBytesProcessed?;
    BigQueryModelTraining modelTraining?;
    # [Output-only, Beta] Deprecated; do not use.
    int modelTrainingCurrentIteration?;
    # [Output-only, Beta] Deprecated; do not use.
    string modelTrainingExpectedTotalIteration?;
    # [Output-only] The number of rows affected by a DML statement. Present only for DML statements INSERT, UPDATE or DELETE.
    string numDmlAffectedRows?;
    # [Output-only] Describes execution plan for the query.
    ExplainQueryStage[] queryPlan?;
    # [Output-only] Referenced routines (persistent user-defined functions and stored procedures) for the job.
    RoutineReference[] referencedRoutines?;
    # [Output-only] Referenced tables for the job. Queries that reference more than 50 tables will not have a complete list.
    TableReference[] referencedTables?;
    # [Output-only] Job resource usage breakdown by reservation.
    JobstatisticsReservationusage[] reservationUsage?;
    TableSchema schema?;
    # The type of query statement, if valid. Possible values (new values might be added in the future): "SELECT": SELECT query. "INSERT": INSERT query; see https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language. "UPDATE": UPDATE query; see https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language. "DELETE": DELETE query; see https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language. "MERGE": MERGE query; see https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language. "ALTER_TABLE": ALTER TABLE query. "ALTER_VIEW": ALTER VIEW query. "ASSERT": ASSERT condition AS 'description'. "CREATE_FUNCTION": CREATE FUNCTION query. "CREATE_MODEL": CREATE [OR REPLACE] MODEL ... AS SELECT ... . "CREATE_PROCEDURE": CREATE PROCEDURE query. "CREATE_TABLE": CREATE [OR REPLACE] TABLE without AS SELECT. "CREATE_TABLE_AS_SELECT": CREATE [OR REPLACE] TABLE ... AS SELECT ... . "CREATE_VIEW": CREATE [OR REPLACE] VIEW ... AS SELECT ... . "DROP_FUNCTION" : DROP FUNCTION query. "DROP_PROCEDURE": DROP PROCEDURE query. "DROP_TABLE": DROP TABLE query. "DROP_VIEW": DROP VIEW query.
    string statementType?;
    # [Output-only] [Beta] Describes a timeline of job execution.
    QueryTimelineSample[] timeline?;
    # [Output-only] Total bytes billed for the job.
    string totalBytesBilled?;
    # [Output-only] Total bytes processed for the job.
    string totalBytesProcessed?;
    # [Output-only] For dry-run jobs, totalBytesProcessed is an estimate and this field specifies the accuracy of the estimate. Possible values can be: UNKNOWN: accuracy of the estimate is unknown. PRECISE: estimate is precise. LOWER_BOUND: estimate is lower bound of what the query would cost. UPPER_BOUND: estimate is upper bound of what the query would cost.
    string totalBytesProcessedAccuracy?;
    # [Output-only] Total number of partitions processed from all partitioned tables referenced in the job.
    string totalPartitionsProcessed?;
    # [Output-only] Slot-milliseconds for the job.
    string totalSlotMs?;
    # Standard SQL only: list of undeclared query parameters detected during a dry run validation.
    QueryParameter[] undeclaredQueryParameters?;
};

public type JobStatistics3 record {
    # [Output-only] The number of bad records encountered. Note that if the job has failed because of more bad records encountered than the maximum allowed in the load job configuration, then this number can be less than the total number of bad records present in the input data.
    string badRecords?;
    # [Output-only] Number of bytes of source data in a load job.
    string inputFileBytes?;
    # [Output-only] Number of source files in a load job.
    string inputFiles?;
    # [Output-only] Size of the loaded data in bytes. Note that while a load job is in the running state, this value may change.
    string outputBytes?;
    # [Output-only] Number of rows imported in a load job. Note that while an import job is in the running state, this value may change.
    string outputRows?;
};

# A table type
public type StandardSqlTableType record {
    # The columns in this table type
    StandardSqlField[] columns?;
};

public type JobStatistics4 record {
    # [Output-only] Number of files per destination URI or URI pattern specified in the extract configuration. These values will be in the same order as the URIs specified in the 'destinationUris' field.
    string[] destinationUriFileCounts?;
    # [Output-only] Number of user bytes extracted into the result. This is the byte count as computed by BigQuery for billing purposes.
    string inputBytes?;
};

# [Output-only, Beta] Training options used by this training run. These options are mutable for subsequent training runs. Default values are explicitly stored for options not specified in the input query of the first training run. For subsequent training runs, any option not explicitly specified in the input query will be copied from the previous training run.
public type BqmltrainingrunTrainingoptions record {
    # Whether to stop early when the loss doesn't improve significantly any more (compared to minRelativeProgress). Used only for iterative training algorithms
    boolean earlyStop?;
    # L1 regularization coefficient
    float l1Reg?;
    # L2 regularization coefficient
    float l2Reg?;
    # Learning rate in training. Used only for iterative training algorithms
    float learnRate?;
    # The strategy to determine learn rate for the current iteration
    string learnRateStrategy?;
    # Specifies the initial learning rate for the line search learn rate strategy
    float lineSearchInitLearnRate?;
    # The maximum number of iterations in training. Used only for iterative training algorithms
    string maxIteration?;
    # When earlyStop is true, stops training when accuracy improvement is less than 'minRelativeProgress'. Used only for iterative training algorithms
    float minRelProgress?;
    # Whether to train a model from the last checkpoint
    boolean warmStart?;
};

# Reference describing the ID of this routine
public type RoutineReference record {
    # [Required] The ID of the dataset containing this routine.
    string datasetId?;
    # [Required] The ID of the project containing this routine.
    string projectId?;
    # [Required] The ID of the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters.
    string routineId?;
};

public type ViewDefinition record {
    # [Required] A query that BigQuery executes when the view is referenced.
    string query?;
    # True if the column names are explicitly specified. For example by using the 'CREATE VIEW v(c1, c2) AS ...' syntax. Can only be set using BigQuery's standard SQL: https://cloud.google.com/bigquery/sql-reference/
    boolean useExplicitColumnNames?;
    # Specifies whether to use BigQuery's legacy SQL for this view. The default value is true. If set to false, the view will use BigQuery's standard SQL: https://cloud.google.com/bigquery/sql-reference/ Queries and views that reference this view must use the same flag value.
    boolean useLegacySql?;
    # Describes user-defined function resources used in the query.
    UserDefinedFunctionResource[] userDefinedFunctionResources?;
};

# Model evaluation metrics for a single ARIMA forecasting model.
public type ArimaSingleModelForecastingMetrics record {
    # ARIMA model fitting metrics.
    ArimaFittingMetrics arimaFittingMetrics?;
    # Is arima model fitted with drift or not. It is always false when d is not 1.
    boolean hasDrift?;
    # If true, holiday_effect is a part of time series decomposition result.
    boolean hasHolidayEffect?;
    # If true, spikes_and_dips is a part of time series decomposition result.
    boolean hasSpikesAndDips?;
    # If true, step_changes is a part of time series decomposition result.
    boolean hasStepChanges?;
    # Arima order, can be used for both non-seasonal and seasonal parts.
    ArimaOrder nonSeasonalOrder?;
    # Seasonal periods. Repeated because multiple periods are supported for one time series.
    string[] seasonalPeriods?;
    # The time_series_id value for this time series. It will be one of the unique values from the time_series_id_column specified during ARIMA model training. Only present when time_series_id_column training option was used.
    string timeSeriesId?;
    # The tuple of time_series_ids identifying this time series. It will be one of the unique tuples of values present in the time_series_id_columns specified during ARIMA model training. Only present when time_series_id_columns training option was used and the order of values here are same as the order of time_series_id_columns.
    string[] timeSeriesIds?;
};

# Request message for `GetIamPolicy` method.
public type GetIamPolicyRequest record {
    # Encapsulates settings provided to GetIamPolicy.
    GetPolicyOptions options?;
};

# The fields of this struct, in order, if type_kind = "STRUCT"
public type StandardSqlStructType record {
    # Array of standard sql fields
    StandardSqlField[] fields?;
};

public type TablelistTables record {
    Clustering clustering?;
    # The time when this table was created, in milliseconds since the epoch.
    string creationTime?;
    # [Optional] The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed.
    string expirationTime?;
    # The user-friendly name for this table.
    string friendlyName?;
    # An opaque ID of the table
    string id?;
    # The resource type.
    string kind?;
    # The labels associated with this table. You can use these to organize and group your tables.
    record {} labels?;
    RangePartitioning rangePartitioning?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference tableReference?;
    TimePartitioning timePartitioning?;
    # The type of table. Possible values are: TABLE, VIEW.
    string 'type?;
    # Additional details for a view.
    TablelistView view?;
};

# [Required] Reference describing the ID of the table that was snapshot
public type TableReference record {
    # [Required] The ID of the dataset containing this table.
    string datasetId?;
    # [Required] The ID of the project containing this table.
    string projectId?;
    # [Required] The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
    string tableId?;
};

public type BiEngineStatistics record {
    # [Output-only] Specifies which mode of BI Engine acceleration was performed (if any).
    string biEngineMode?;
    # In case of DISABLED or PARTIAL bi_engine_mode, these contain the explanatory reasons as to why BI Engine could not accelerate. In case the full query was accelerated, this field is not populated.
    BiEngineReason[] biEngineReasons?;
};

# The type of a variable, e.g., a function argument. Examples: INT64: {type_kind="INT64"} ARRAY: {type_kind="ARRAY", array_element_type="STRING"} STRUCT>: {type_kind="STRUCT", struct_type={fields=[ {name="x", type={type_kind="STRING"}}, {name="y", type={type_kind="ARRAY", array_element_type="DATE"}} ]}}
public type StandardSqlDataType record {
    # The type of a variable, e.g., a function argument. Examples: INT64: {type_kind="INT64"} ARRAY: {type_kind="ARRAY", array_element_type="STRING"} STRUCT>: {type_kind="STRUCT", struct_type={fields=[ {name="x", type={type_kind="STRING"}}, {name="y", type={type_kind="ARRAY", array_element_type="DATE"}} ]}}
    StandardSqlDataType arrayElementType?;
    # The fields of this struct, in order, if type_kind = "STRUCT"
    StandardSqlStructType structType?;
    # Required. The top level type of this field. Can be any standard SQL data type (e.g., "INT64", "DATE", "ARRAY").
    string typeKind?;
};

# Additional details for a view.
public type TablelistView record {
    # True if view is defined in legacy SQL dialect, false if in standard SQL.
    boolean useLegacySql?;
};

# Information about a single iteration of the training run.
public type IterationResult record {
    # (Auto-)arima fitting result. Wrap everything in ArimaResult for easier refactoring if we want to use model-specific iteration results.
    ArimaResult arimaResult?;
    # Information about top clusters for clustering models.
    ClusterInfo[] clusterInfos?;
    # Time taken to run the iteration in milliseconds.
    string durationMs?;
    # Loss computed on the eval data at the end of iteration.
    float evalLoss?;
    # Index of the iteration, 0 based.
    int index?;
    # Learn rate used for this iteration.
    float learnRate?;
    # Loss computed on the training data at the end of iteration.
    float trainingLoss?;
};

public type ListRoutinesResponse record {
    # A token to request the next page of results.
    string nextPageToken?;
    # Routines in the requested dataset. Unless read_mask is set in the request, only the following fields are populated: etag, project_id, dataset_id, routine_id, routine_type, creation_time, last_modified_time, and language.
    Routine[] routines?;
};

# Evaluation metrics used by weighted-ALS models specified by feedback_type=implicit.
public type RankingMetrics record {
    # Determines the goodness of a ranking by computing the percentile rank from the predicted confidence and dividing it by the original rank.
    float averageRank?;
    # Calculates a precision per user for all the items by ranking them and then averages all the precisions across all the users.
    float meanAveragePrecision?;
    # Similar to the mean squared error computed in regression and explicit recommendation models except instead of computing the rating directly, the output from evaluate is computed against a preference which is 1 or 0 depending on if the rating exists or not.
    float meanSquaredError?;
    # A metric to determine the goodness of a ranking calculated from the predicted confidence by comparing it to an ideal rank measured by the original ratings.
    float normalizedDiscountedCumulativeGain?;
};

# Representative value of a categorical feature.
public type CategoricalValue record {
    # Counts of all categories for the categorical feature. If there are more than ten categories, we return top ten (by count) and return one more CategoryCount with category "_OTHER_" and count as aggregate counts of remaining categories.
    CategoryCount[] categoryCounts?;
};

public type DatasetList record {
    # An array of the dataset resources in the project. Each resource contains basic information. For full information about a particular dataset resource, use the Datasets: get method. This property is omitted when there are no datasets in the project.
    DatasetlistDatasets[] datasets?;
    # A hash value of the results page. You can use this property to determine if the page has changed since the last request.
    string etag?;
    # The list type. This property always returns the value "bigquery#datasetList".
    string kind?;
    # A token that can be used to request the next results page. This property is omitted on the final results page.
    string nextPageToken?;
};

# Represents access on a subset of rows on the specified table, defined by its filter predicate. Access to the subset of rows is controlled by its IAM policy.
public type RowAccessPolicy record {
    # Output only. The time when this row access policy was created, in milliseconds since the epoch.
    string creationTime?;
    # Output only. A hash of this resource.
    string etag?;
    # Required. A SQL boolean expression that represents the rows defined by this row access policy, similar to the boolean expression in a WHERE clause of a SELECT query on a table. References to other tables, routines, and temporary functions are not supported. Examples: region="EU" date_field = CAST('2019-9-27' as DATE) nullable_field is not NULL numeric_field BETWEEN 1.0 AND 5.0
    string filterPredicate?;
    # Output only. The time when this row access policy was last modified, in milliseconds since the epoch.
    string lastModifiedTime?;
    # [Output-only] [Preview] The DDL target row access policy. Present only for CREATE/DROP ROW ACCESS POLICY queries.
    RowAccessPolicyReference rowAccessPolicyReference?;
};

# This is used for defining User Defined Function (UDF) resources only when using legacy SQL. Users of Standard SQL should leverage either DDL (e.g. CREATE [TEMPORARY] FUNCTION ... ) or the Routines API to define UDF resources. For additional information on migrating, see: https://cloud.google.com/bigquery/docs/reference/standard-sql/migrating-from-legacy-sql#differences_in_user-defined_javascript_functions
public type UserDefinedFunctionResource record {
    # [Pick one] An inline resource that contains code for a user-defined function (UDF). Providing a inline code resource is equivalent to providing a URI for a file containing the same code.
    string inlineCode?;
    # [Pick one] A code resource to load from a Google Cloud Storage URI (gs://bucket/path).
    string resourceUri?;
};

# Request message for `TestIamPermissions` method.
public type TestIamPermissionsRequest record {
    # The set of permissions to check for the `resource`. Permissions with wildcards (such as '*' or 'storage.*') are not allowed. For more information see [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
    string[] permissions?;
};

public type TableDataInsertAllResponse record {
    # An array of errors for rows that were not inserted.
    TabledatainsertallresponseInserterrors[] insertErrors?;
    # The resource type of the response.
    string kind?;
};

public type JsonValue any;

public type BigtableOptions record {
    # [Optional] List of column families to expose in the table schema along with their types. This list restricts the column families that can be referenced in queries and specifies their value types. You can use this list to do type conversions - see the 'type' field for more details. If you leave this list empty, all column families are present in the table schema and their values are read as BYTES. During a query only the column families referenced in that query are read from Bigtable.
    BigtableColumnFamily[] columnFamilies?;
    # [Optional] If field is true, then the column families that are not specified in columnFamilies list are not exposed in the table schema. Otherwise, they are read with BYTES type values. The default value is false.
    boolean ignoreUnspecifiedColumnFamilies?;
    # [Optional] If field is true, then the rowkey column families will be read and converted to string. Otherwise they are read with BYTES type values and users need to manually cast them with CAST if necessary. The default value is false.
    boolean readRowkeyAsString?;
};

# Data split result. This contains references to the training and evaluation data tables that were used to train the model.
public type DataSplitResult record {
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference evaluationTable?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference trainingTable?;
};

# Options used in model training.
public type TrainingOptions record {
    # If true, detect step changes and make data adjustment in the input time series.
    boolean adjustStepChanges?;
    # Whether to enable auto ARIMA or not.
    boolean autoArima?;
    # The max value of non-seasonal p and q.
    string autoArimaMaxOrder?;
    # Batch size for dnn models.
    string batchSize?;
    # If true, clean spikes and dips in the input time series.
    boolean cleanSpikesAndDips?;
    # The data frequency of a time series.
    string dataFrequency?;
    # The column to split data with. This column won't be used as a feature. 1. When data_split_method is CUSTOM, the corresponding column should be boolean. The rows with true value tag are eval data, and the false are training data. 2. When data_split_method is SEQ, the first DATA_SPLIT_EVAL_FRACTION rows (from smallest to largest) in the corresponding column are used as training data, and the rest are eval data. It respects the order in Orderable data types: https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types#data-type-properties
    string dataSplitColumn?;
    # The fraction of evaluation data over the whole input data. The rest of data will be used as training data. The format should be double. Accurate to two decimal places. Default value is 0.2.
    float dataSplitEvalFraction?;
    # The data split type for training and evaluation, e.g. RANDOM.
    string dataSplitMethod?;
    # If true, perform decompose time series and save the results.
    boolean decomposeTimeSeries?;
    # Distance type for clustering models.
    string distanceType?;
    # Dropout probability for dnn models.
    float dropout?;
    # Whether to stop early when the loss doesn't improve significantly any more (compared to min_relative_progress). Used only for iterative training algorithms.
    boolean earlyStop?;
    # Feedback type that specifies which algorithm to run for matrix factorization.
    string feedbackType?;
    # Hidden units for dnn models.
    string[] hiddenUnits?;
    # The geographical region based on which the holidays are considered in time series modeling. If a valid value is specified, then holiday effects modeling is enabled.
    string holidayRegion?;
    # The number of periods ahead that need to be forecasted.
    string horizon?;
    # Include drift when fitting an ARIMA model.
    boolean includeDrift?;
    # Specifies the initial learning rate for the line search learn rate strategy.
    float initialLearnRate?;
    # Name of input label columns in training data.
    string[] inputLabelColumns?;
    # Item column specified for matrix factorization models.
    string itemColumn?;
    # The column used to provide the initial centroids for kmeans algorithm when kmeans_initialization_method is CUSTOM.
    string kmeansInitializationColumn?;
    # The method used to initialize the centroids for kmeans algorithm.
    string kmeansInitializationMethod?;
    # L1 regularization coefficient.
    float l1Regularization?;
    # L2 regularization coefficient.
    float l2Regularization?;
    # Weights associated with each label class, for rebalancing the training data. Only applicable for classification models.
    record {} labelClassWeights?;
    # Learning rate in training. Used only for iterative training algorithms.
    float learnRate?;
    # The strategy to determine learn rate for the current iteration.
    string learnRateStrategy?;
    # Type of loss function used during training run.
    string lossType?;
    # The maximum number of iterations in training. Used only for iterative training algorithms.
    string maxIterations?;
    # Maximum depth of a tree for boosted tree models.
    string maxTreeDepth?;
    # When early_stop is true, stops training when accuracy improvement is less than 'min_relative_progress'. Used only for iterative training algorithms.
    float minRelativeProgress?;
    # Minimum split loss for boosted tree models.
    float minSplitLoss?;
    # Google Cloud Storage URI from which the model was imported. Only applicable for imported models.
    string modelUri?;
    # Arima order, can be used for both non-seasonal and seasonal parts.
    ArimaOrder nonSeasonalOrder?;
    # Number of clusters for clustering models.
    string numClusters?;
    # Num factors specified for matrix factorization models.
    string numFactors?;
    # Optimization strategy for training linear regression models.
    string optimizationStrategy?;
    # Whether to preserve the input structs in output feature names. Suppose there is a struct A with field b. When false (default), the output feature name is A_b. When true, the output feature name is A.b.
    boolean preserveInputStructs?;
    # Subsample fraction of the training data to grow tree to prevent overfitting for boosted tree models.
    float subsample?;
    # Column to be designated as time series data for ARIMA model.
    string timeSeriesDataColumn?;
    # The time series id column that was used during ARIMA model training.
    string timeSeriesIdColumn?;
    # The time series id columns that were used during ARIMA model training.
    string[] timeSeriesIdColumns?;
    # Column to be designated as time series timestamp for ARIMA model.
    string timeSeriesTimestampColumn?;
    # User column specified for matrix factorization models.
    string userColumn?;
    # Hyperparameter for matrix factoration when implicit feedback type is specified.
    float walsAlpha?;
    # Whether to train a model from the last checkpoint.
    boolean warmStart?;
};

public type ModelReference record {
    # [Required] The ID of the dataset containing this model.
    string datasetId?;
    # [Required] The ID of the model. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
    string modelId?;
    # [Required] The ID of the project containing this model.
    string projectId?;
};

# Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: "Summary size limit" description: "Determines if a summary is less than 100 chars" expression: "document.summary.size() < 100" Example (Equality): title: "Requestor is owner" description: "Determines if requestor is the document owner" expression: "document.owner == request.auth.claims.email" Example (Logic): title: "Public documents" description: "Determine whether the document should be publicly visible" expression: "document.type != 'private' && document.type != 'internal'" Example (Data Manipulation): title: "Notification string" description: "Create a notification string with a timestamp." expression: "'New message received at ' + string(document.create_time)" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information.
public type Expr record {
    # Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
    string description?;
    # Textual representation of an expression in Common Expression Language syntax.
    string expression?;
    # Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
    string location?;
    # Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
    string title?;
};

public type GetQueryResultsResponse record {
    # Whether the query result was fetched from the query cache.
    boolean cacheHit?;
    # [Output-only] The first errors or warnings encountered during the running of the job. The final message includes the number of errors that caused the process to stop. Errors here do not necessarily mean that the job has completed or was unsuccessful.
    ErrorProto[] errors?;
    # A hash of this response.
    string etag?;
    # Whether the query has completed or not. If rows or totalRows are present, this will always be true. If this is false, totalRows will not be available.
    boolean jobComplete?;
    JobReference jobReference?;
    # The resource type of the response.
    string kind?;
    # [Output-only] The number of rows affected by a DML statement. Present only for DML statements INSERT, UPDATE or DELETE.
    string numDmlAffectedRows?;
    # A token used for paging results.
    string pageToken?;
    # An object with as many results as can be contained within the maximum permitted reply size. To get any additional rows, you can call GetQueryResults and specify the jobReference returned above. Present only when the query completes successfully.
    TableRow[] rows?;
    TableSchema schema?;
    # The total number of bytes processed for this query.
    string totalBytesProcessed?;
    # The total number of rows in the complete query result set, which can be more than the number of rows in this single page of results. Present only when the query completes successfully.
    string totalRows?;
};

public type TableRow record {
    # Represents a single row in the result set, consisting of one or more fields.
    TableCell[] f?;
};

public type SnapshotDefinition record {
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference baseTableReference?;
    # [Required] The time at which the base table was snapshot. This value is reported in the JSON response using RFC3339 format.
    string snapshotTime?;
};

# Model evaluation metrics for ARIMA forecasting models.
public type ArimaForecastingMetrics record {
    # Arima model fitting metrics.
    ArimaFittingMetrics[] arimaFittingMetrics?;
    # Repeated as there can be many metric sets (one for each model) in auto-arima and the large-scale case.
    ArimaSingleModelForecastingMetrics[] arimaSingleModelForecastingMetrics?;
    # Whether Arima model fitted with drift or not. It is always false when d is not 1.
    boolean[] hasDrift?;
    # Non-seasonal order.
    ArimaOrder[] nonSeasonalOrder?;
    # Seasonal periods. Repeated because multiple periods are supported for one time series.
    string[] seasonalPeriods?;
    # Id to differentiate different time series for the large-scale case.
    string[] timeSeriesId?;
};

# [Output-only, Beta] Model options used for the first training run. These options are immutable for subsequent training runs. Default values are used for any options not specified in the input query.
public type ModeldefinitionModeloptions record {
    # The labels associated with this model
    string[] labels?;
    # Type of loss function used during training run.
    string lossType?;
    # Output only. Type of the model resource.
    string modelType?;
};

public type ScriptStatistics record {
    # [Output-only] Whether this child job was a statement or expression.
    string evaluationKind?;
    # Stack trace showing the line/column/procedure name of each frame on the stack at the point where the current evaluation happened. The leaf frame is first, the primary script is last. Never empty.
    ScriptStackFrame[] stackFrames?;
};

public type QueryParameter record {
    # [Optional] If unset, this is a positional parameter. Otherwise, should be unique within a query.
    string name?;
    QueryParameterType parameterType?;
    QueryParameterValue parameterValue?;
};

# Arima model information.
public type ArimaModelInfo record {
    # Arima coefficients.
    ArimaCoefficients arimaCoefficients?;
    # ARIMA model fitting metrics.
    ArimaFittingMetrics arimaFittingMetrics?;
    # Whether Arima model fitted with drift or not. It is always false when d is not 1.
    boolean hasDrift?;
    # If true, holiday_effect is a part of time series decomposition result.
    boolean hasHolidayEffect?;
    # If true, spikes_and_dips is a part of time series decomposition result.
    boolean hasSpikesAndDips?;
    # If true, step_changes is a part of time series decomposition result.
    boolean hasStepChanges?;
    # Arima order, can be used for both non-seasonal and seasonal parts.
    ArimaOrder nonSeasonalOrder?;
    # Seasonal periods. Repeated because multiple periods are supported for one time series.
    string[] seasonalPeriods?;
    # The time_series_id value for this time series. It will be one of the unique values from the time_series_id_column specified during ARIMA model training. Only present when time_series_id_column training option was used.
    string timeSeriesId?;
    # The tuple of time_series_ids identifying this time series. It will be one of the unique tuples of values present in the time_series_id_columns specified during ARIMA model training. Only present when time_series_id_columns training option was used and the order of values here are same as the order of time_series_id_columns.
    string[] timeSeriesIds?;
};

public type RowLevelSecurityStatistics record {
    # [Output-only] [Preview] Whether any accessed data was protected by row access policies.
    boolean rowLevelSecurityApplied?;
};

public type JobConfigurationQuery record {
    # [Optional] If true and query uses legacy SQL dialect, allows the query to produce arbitrarily large result tables at a slight cost in performance. Requires destinationTable to be set. For standard SQL queries, this flag is ignored and large results are always allowed. However, you must still set destinationTable when result size exceeds the allowed maximum response size.
    boolean allowLargeResults?;
    Clustering clustering?;
    # Connection properties.
    ConnectionProperty[] connectionProperties?;
    # [Optional] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion.
    string createDisposition?;
    # If true, creates a new session, where session id will be a server generated random id. If false, runs query with an existing session_id passed in ConnectionProperty, otherwise runs query in non-session mode.
    boolean createSession?;
    DatasetReference defaultDataset?;
    EncryptionConfiguration destinationEncryptionConfiguration?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference destinationTable?;
    # [Optional] If true and query uses legacy SQL dialect, flattens all nested and repeated fields in the query results. allowLargeResults must be true if this is set to false. For standard SQL queries, this flag is ignored and results are never flattened.
    boolean flattenResults?;
    # [Optional] Limits the billing tier for this job. Queries that have resource usage beyond this tier will fail (without incurring a charge). If unspecified, this will be set to your project default.
    int maximumBillingTier?;
    # [Optional] Limits the bytes billed for this job. Queries that will have bytes billed beyond this limit will fail (without incurring a charge). If unspecified, this will be set to your project default.
    string maximumBytesBilled?;
    # Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or to NAMED to use named (@myparam) query parameters in this query.
    string parameterMode?;
    # [Deprecated] This property is deprecated.
    boolean preserveNulls?;
    # [Optional] Specifies a priority for the query. Possible values include INTERACTIVE and BATCH. The default value is INTERACTIVE.
    string priority?;
    # [Required] SQL query text to execute. The useLegacySql field can be used to indicate whether the query uses legacy SQL or standard SQL.
    string query?;
    # Query parameters for standard SQL queries.
    QueryParameter[] queryParameters?;
    RangePartitioning rangePartitioning?;
    # Allows the schema of the destination table to be updated as a side effect of the query job. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable.
    string[] schemaUpdateOptions?;
    # [Optional] If querying an external data source outside of BigQuery, describes the data format, location and other properties of the data source. By defining these properties, the data source can then be queried as if it were a standard BigQuery table.
    record {} tableDefinitions?;
    TimePartitioning timePartitioning?;
    # Specifies whether to use BigQuery's legacy SQL dialect for this query. The default value is true. If set to false, the query will use BigQuery's standard SQL: https://cloud.google.com/bigquery/sql-reference/ When useLegacySql is set to false, the value of flattenResults is ignored; query will be run as if flattenResults is false.
    boolean useLegacySql?;
    # [Optional] Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. Moreover, the query cache is only available when a query does not have a destination table specified. The default value is true.
    boolean useQueryCache?;
    # Describes user-defined function resources used in the query.
    UserDefinedFunctionResource[] userDefinedFunctionResources?;
    # [Optional] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion.
    string writeDisposition?;
};

public type SessionInfo record {
    # [Output-only] // [Preview] Id of the session.
    string sessionId?;
};

# Evaluation metrics for multi-class classification/classifier models.
public type MultiClassClassificationMetrics record {
    # Aggregate metrics for classification/classifier models. For multi-class models, the metrics are either macro-averaged or micro-averaged. When macro-averaged, the metrics are calculated for each label and then an unweighted average is taken of those values. When micro-averaged, the metric is calculated globally by counting the total number of correctly predicted rows.
    AggregateClassificationMetrics aggregateClassificationMetrics?;
    # Confusion matrix at different thresholds.
    ConfusionMatrix[] confusionMatrixList?;
};

# BigQuery-specific metadata about a location. This will be set on google.cloud.location.Location.metadata in Cloud Location API responses.
public type LocationMetadata record {
    # The legacy BigQuery location ID, e.g. “EU” for the “europe” location. This is for any API consumers that need the legacy “US” and “EU” locations.
    string legacyLocationId?;
};

# A field or a column.
public type StandardSqlField record {
    # Optional. The name of this field. Can be absent for struct fields.
    string name?;
    # The type of a variable, e.g., a function argument. Examples: INT64: {type_kind="INT64"} ARRAY: {type_kind="ARRAY", array_element_type="STRING"} STRUCT>: {type_kind="STRUCT", struct_type={fields=[ {name="x", type={type_kind="STRING"}}, {name="y", type={type_kind="ARRAY", array_element_type="DATE"}} ]}}
    StandardSqlDataType 'type?;
};

public type Streamingbuffer record {
    # [Output-only] A lower-bound estimate of the number of bytes currently in the streaming buffer.
    string estimatedBytes?;
    # [Output-only] A lower-bound estimate of the number of rows currently in the streaming buffer.
    string estimatedRows?;
    # [Output-only] Contains the timestamp of the oldest entry in the streaming buffer, in milliseconds since the epoch, if the streaming buffer is available.
    string oldestEntryTime?;
};

public type TimePartitioning record {
    # [Optional] Number of milliseconds for which to keep the storage for partitions in the table. The storage in a partition will have an expiration time of its partition time plus this value.
    string expirationMs?;
    # [Beta] [Optional] If not set, the table is partitioned by pseudo column, referenced via either '_PARTITIONTIME' as TIMESTAMP type, or '_PARTITIONDATE' as DATE type. If field is specified, the table is instead partitioned by this field. The field must be a top-level TIMESTAMP or DATE field. Its mode must be NULLABLE or REQUIRED.
    string 'field?;
    boolean requirePartitionFilter?;
    # [Required] The supported types are DAY, HOUR, MONTH, and YEAR, which will generate one partition per day, hour, month, and year, respectively. When the type is not specified, the default behavior is DAY.
    string 'type?;
};

# [Optional] The categories attached to this field, used for field-level access control.
public type TablefieldschemaCategories record {
    # A list of category resource names. For example, "projects/1/taxonomies/2/categories/3". At most 5 categories are allowed.
    string[] names?;
};

public type JobStatus record {
    ErrorProto errorResult?;
    # [Output-only] The first errors encountered during the running of the job. The final message includes the number of errors that caused the process to stop. Errors here do not necessarily mean that the job has completed or was unsuccessful.
    ErrorProto[] errors?;
    # [Output-only] Running state of the job.
    string state?;
};

# Information about a single training query run for the model.
public type TrainingRun record {
    # Data split result. This contains references to the training and evaluation data tables that were used to train the model.
    DataSplitResult dataSplitResult?;
    # Evaluation metrics of a model. These are either computed on all training data or just the eval data based on whether eval data was used during training. These are not present for imported models.
    EvaluationMetrics evaluationMetrics?;
    # Output of each iteration run, results.size() <= max_iterations.
    IterationResult[] results?;
    # The start time of this training run.
    string startTime?;
    # Options used in model training.
    TrainingOptions trainingOptions?;
};

# A single entry in the confusion matrix.
public type Entry record {
    # Number of items being predicted as this label.
    string itemCount?;
    # The predicted label. For confidence_threshold > 0, we will also add an entry indicating the number of items under the confidence threshold.
    string predictedLabel?;
};

public type ProjectList record {
    # A hash of the page of results
    string etag?;
    # The type of list.
    string kind?;
    # A token to request the next page of results.
    string nextPageToken?;
    # Projects to which you have at least READ access.
    ProjectlistProjects[] projects?;
    # The total number of projects in the list.
    int totalItems?;
};

public type CsvOptions record {
    # [Optional] Indicates if BigQuery should accept rows that are missing trailing optional columns. If true, BigQuery treats missing trailing columns as null values. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false.
    boolean allowJaggedRows?;
    # [Optional] Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false.
    boolean allowQuotedNewlines?;
    # [Optional] The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties.
    string encoding?;
    # [Optional] The separator for fields in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (',').
    string fieldDelimiter?;
    # [Optional] An custom string that will represent a NULL value in CSV import data.
    string null_marker?;
    # [Optional] The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true.
    string quote?;
    # [Optional] The number of rows at the top of a CSV file that BigQuery will skip when reading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped. When autodetect is on, the behavior is the following: * skipLeadingRows unspecified - Autodetect tries to detect headers in the first row. If they are not detected, the row is read as data. Otherwise data is read starting from the second row. * skipLeadingRows is 0 - Instructs autodetect that there are no headers and data should be read starting from the first row. * skipLeadingRows = N > 0 - Autodetect skips N-1 rows and tries to detect headers in row N. If headers are not detected, row N is just skipped. Otherwise row N is used to extract column names for the detected schema.
    string skipLeadingRows?;
};

public type QueryParameterType record {
    QueryParameterType arrayType?;
    # [Optional] The types of the fields of this struct, in order, if this is a struct.
    QueryparametertypeStructtypes[] structTypes?;
    # [Required] The top level type of this field.
    string 'type?;
};

public type TransactionInfo record {
    # [Output-only] // [Alpha] Id of the transaction.
    string transactionId?;
};

public type JobList record {
    # A hash of this page of results.
    string etag?;
    # List of jobs that were requested.
    JoblistJobs[] jobs?;
    # The resource type of the response.
    string kind?;
    # A token to request the next page of results.
    string nextPageToken?;
};

public type GetServiceAccountResponse record {
    # The service account email address.
    string email?;
    # The resource type of the response.
    string kind?;
};

# Evaluation metrics for clustering models.
public type ClusteringMetrics record {
    # Information for all clusters.
    Cluster[] clusters?;
    # Davies-Bouldin index.
    float daviesBouldinIndex?;
    # Mean of squared distances between each sample to its cluster centroid.
    float meanSquaredDistance?;
};

public type JobConfiguration record {
    JobConfigurationTableCopy copy?;
    # [Optional] If set, don't actually run this job. A valid query will return a mostly empty response with some processing statistics, while an invalid query will return the same error it would if it wasn't a dry run. Behavior of non-query jobs is undefined.
    boolean dryRun?;
    JobConfigurationExtract extract?;
    # [Optional] Job timeout in milliseconds. If this time limit is exceeded, BigQuery may attempt to terminate the job.
    string jobTimeoutMs?;
    # [Output-only] The type of the job. Can be QUERY, LOAD, EXTRACT, COPY or UNKNOWN.
    string jobType?;
    # The labels associated with this job. You can use these to organize and group your jobs. Label keys and values can be no longer than 63 characters, can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter and each label in the list must have a different key.
    record {} labels?;
    JobConfigurationLoad load?;
    JobConfigurationQuery query?;
};

public type BigtableColumn record {
    # [Optional] The encoding of the values when the type is not STRING. Acceptable encoding values are: TEXT - indicates values are alphanumeric text strings. BINARY - indicates values are encoded using HBase Bytes.toBytes family of functions. 'encoding' can also be set at the column family level. However, the setting at this level takes precedence if 'encoding' is set at both levels.
    string encoding?;
    # [Optional] If the qualifier is not a valid BigQuery field identifier i.e. does not match [a-zA-Z][a-zA-Z0-9_]*, a valid identifier must be provided as the column field name and is used as field name in queries.
    string fieldName?;
    # [Optional] If this is set, only the latest version of value in this column are exposed. 'onlyReadLatest' can also be set at the column family level. However, the setting at this level takes precedence if 'onlyReadLatest' is set at both levels.
    boolean onlyReadLatest?;
    # [Required] Qualifier of the column. Columns in the parent column family that has this exact qualifier are exposed as . field. If the qualifier is valid UTF-8 string, it can be specified in the qualifier_string field. Otherwise, a base-64 encoded value must be set to qualifier_encoded. The column field name is the same as the column qualifier. However, if the qualifier is not a valid BigQuery field identifier i.e. does not match [a-zA-Z][a-zA-Z0-9_]*, a valid identifier must be provided as field_name.
    string qualifierEncoded?;
    string qualifierString?;
    # [Optional] The type to convert the value in cells of this column. The values are expected to be encoded using HBase Bytes.toBytes function when using the BINARY encoding value. Following BigQuery types are allowed (case-sensitive) - BYTES STRING INTEGER FLOAT BOOLEAN Default type is BYTES. 'type' can also be set at the column family level. However, the setting at this level takes precedence if 'type' is set at both levels.
    string 'type?;
};

public type TabledatainsertallrequestRows record {
    # [Optional] A unique ID for each row. BigQuery uses this property to detect duplicate insertion requests on a best-effort basis.
    string insertId?;
    # Represents a single JSON object.
    JsonObject 'json?;
};

public type ErrorProto record {
    # Debugging information. This property is internal to Google and should not be used.
    string debugInfo?;
    # Specifies where the error occurred, if present.
    string location?;
    # A human-readable description of the error.
    string message?;
    # A short error code that summarizes the error.
    string reason?;
};

public type Table record {
    Clustering clustering?;
    # [Output-only] The time when this table was created, in milliseconds since the epoch.
    string creationTime?;
    # [Optional] A user-friendly description of this table.
    string description?;
    EncryptionConfiguration encryptionConfiguration?;
    # [Output-only] A hash of the table metadata. Used to ensure there were no concurrent modifications to the resource when attempting an update. Not guaranteed to change when the table contents or the fields numRows, numBytes, numLongTermBytes or lastModifiedTime change.
    string etag?;
    # [Optional] The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed. The defaultTableExpirationMs property of the encapsulating dataset can be used to set a default expirationTime on newly created tables.
    string expirationTime?;
    ExternalDataConfiguration externalDataConfiguration?;
    # [Optional] A descriptive name for this table.
    string friendlyName?;
    # [Output-only] An opaque ID uniquely identifying the table.
    string id?;
    # [Output-only] The type of the resource.
    string kind?;
    # The labels associated with this table. You can use these to organize and group your tables. Label keys and values can be no longer than 63 characters, can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter and each label in the list must have a different key.
    record {} labels?;
    # [Output-only] The time when this table was last modified, in milliseconds since the epoch.
    string lastModifiedTime?;
    # [Output-only] The geographic location where the table resides. This value is inherited from the dataset.
    string location?;
    MaterializedViewDefinition materializedView?;
    ModelDefinition model?;
    # [Output-only] The size of this table in bytes, excluding any data in the streaming buffer.
    string numBytes?;
    # [Output-only] The number of bytes in the table that are considered "long-term storage".
    string numLongTermBytes?;
    # [Output-only] [TrustedTester] The physical size of this table in bytes, excluding any data in the streaming buffer. This includes compression and storage used for time travel.
    string numPhysicalBytes?;
    # [Output-only] The number of rows of data in this table, excluding any data in the streaming buffer.
    string numRows?;
    RangePartitioning rangePartitioning?;
    # [Optional] If set to true, queries over this table require a partition filter that can be used for partition elimination to be specified.
    boolean requirePartitionFilter?;
    TableSchema schema?;
    # [Output-only] A URL that can be used to access this resource again.
    string selfLink?;
    SnapshotDefinition snapshotDefinition?;
    Streamingbuffer streamingBuffer?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference tableReference?;
    TimePartitioning timePartitioning?;
    # [Output-only] Describes the table type. The following values are supported: TABLE: A normal BigQuery table. VIEW: A virtual table defined by a SQL query. SNAPSHOT: An immutable, read-only table that is a copy of another table. [TrustedTester] MATERIALIZED_VIEW: SQL query whose result is persisted. EXTERNAL: A table that references data stored in an external storage system, such as Google Cloud Storage. The default value is TABLE.
    string 'type?;
    ViewDefinition view?;
};

public type EncryptionConfiguration record {
    # [Optional] Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.
    string kmsKeyName?;
};

public type Dataset record {
    # [Optional] An array of objects that define dataset access for one or more entities. You can set this property when inserting or updating a dataset in order to control who is allowed to access the data. If unspecified at dataset creation time, BigQuery adds default dataset access for the following entities: access.specialGroup: projectReaders; access.role: READER; access.specialGroup: projectWriters; access.role: WRITER; access.specialGroup: projectOwners; access.role: OWNER; access.userByEmail: [dataset creator email]; access.role: OWNER;
    DatasetAccess[] access?;
    # [Output-only] The time when this dataset was created, in milliseconds since the epoch.
    string creationTime?;
    DatasetReference datasetReference?;
    EncryptionConfiguration defaultEncryptionConfiguration?;
    # [Optional] The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an expirationMs property in the timePartitioning settings set to this value, and changing the value will only affect new tables, not existing ones. The storage in a partition will have an expiration time of its partition time plus this value. Setting this property overrides the use of defaultTableExpirationMs for partitioned tables: only one of defaultTableExpirationMs and defaultPartitionExpirationMs will be used for any new partitioned table. If you provide an explicit timePartitioning.expirationMs when creating or updating a partitioned table, that value takes precedence over the default partition expiration time indicated by this property.
    string defaultPartitionExpirationMs?;
    # [Optional] The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). Once this property is set, all newly-created tables in the dataset will have an expirationTime property set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the expirationTime for a given table is reached, that table will be deleted automatically. If a table's expirationTime is modified or removed before the table expires, or if you provide an explicit expirationTime when creating a table, that value takes precedence over the default expiration time indicated by this property.
    string defaultTableExpirationMs?;
    # [Optional] A user-friendly description of the dataset.
    string description?;
    # [Output-only] A hash of the resource.
    string etag?;
    # [Optional] A descriptive name for the dataset.
    string friendlyName?;
    # [Output-only] The fully-qualified unique name of the dataset in the format projectId:datasetId. The dataset name without the project name is given in the datasetId field. When creating a new dataset, leave this field blank, and instead specify the datasetId field.
    string id?;
    # [Optional] Indicates if table names are case insensitive in the dataset.
    boolean isCaseInsensitive?;
    # [Output-only] The resource type.
    string kind?;
    # The labels associated with this dataset. You can use these to organize and group your datasets. You can set this property when inserting or updating a dataset. See Creating and Updating Dataset Labels for more information.
    record {} labels?;
    # [Output-only] The date when this dataset or any of its tables was last modified, in milliseconds since the epoch.
    string lastModifiedTime?;
    # The geographic location where the dataset should reside. The default value is US. See details at https://cloud.google.com/bigquery/docs/locations.
    string location?;
    # [Output-only] Reserved for future use.
    boolean satisfiesPZS?;
    # [Output-only] A URL that can be used to access the resource again. You can use this URL in Get or Update requests to the resource.
    string selfLink?;
};

public type QueryTimelineSample record {
    # Total number of units currently being processed by workers. This does not correspond directly to slot usage. This is the largest value observed since the last sample.
    string activeUnits?;
    # Total parallel units of work completed by this query.
    string completedUnits?;
    # Milliseconds elapsed since the start of query execution.
    string elapsedMs?;
    # Total parallel units of work remaining for the active stages.
    string pendingUnits?;
    # Cumulative slot-ms consumed by the query.
    string totalSlotMs?;
};

public type TabledatainsertallresponseInserterrors record {
    # Error information for the row indicated by the index property.
    ErrorProto[] errors?;
    # The index of the row that error applies to.
    int index?;
};

# A user-defined function or a stored procedure.
public type Routine record {
    # Optional.
    Argument[] arguments?;
    # Output only. The time when this routine was created, in milliseconds since the epoch.
    string creationTime?;
    # Required. The body of the routine. For functions, this is the expression in the AS clause. If language=SQL, it is the substring inside (but excluding) the parentheses. For example, for the function created with the following statement: `CREATE FUNCTION JoinLines(x string, y string) as (concat(x, "\n", y))` The definition_body is `concat(x, "\n", y)` (\n is not replaced with linebreak). If language=JAVASCRIPT, it is the evaluated string in the AS clause. For example, for the function created with the following statement: `CREATE FUNCTION f() RETURNS STRING LANGUAGE js AS 'return "\n";\n'` The definition_body is `return "\n";\n` Note that both \n are replaced with linebreaks.
    string definitionBody?;
    # Optional. [Experimental] The description of the routine if defined.
    string description?;
    # Optional. [Experimental] The determinism level of the JavaScript UDF if defined.
    string determinismLevel?;
    # Output only. A hash of this resource.
    string etag?;
    # Optional. If language = "JAVASCRIPT", this field stores the path of the imported JAVASCRIPT libraries.
    string[] importedLibraries?;
    # Optional. Defaults to "SQL".
    string language?;
    # Output only. The time when this routine was last modified, in milliseconds since the epoch.
    string lastModifiedTime?;
    # A table type
    StandardSqlTableType returnTableType?;
    # The type of a variable, e.g., a function argument. Examples: INT64: {type_kind="INT64"} ARRAY: {type_kind="ARRAY", array_element_type="STRING"} STRUCT>: {type_kind="STRUCT", struct_type={fields=[ {name="x", type={type_kind="STRING"}}, {name="y", type={type_kind="ARRAY", array_element_type="DATE"}} ]}}
    StandardSqlDataType returnType?;
    # Reference describing the ID of this routine
    RoutineReference routineReference?;
    # Required. The type of routine.
    string routineType?;
};

public type DatasetAccessEntry record {
    DatasetReference dataset?;
    DatasetaccessentryTargetTypes[] target_types?;
};

# Specifies the audit configuration for a service. The configuration determines which permission types are logged, and what identities, if any, are exempted from logging. An AuditConfig must have one or more AuditLogConfigs. If there are AuditConfigs for both `allServices` and a specific service, the union of the two AuditConfigs is used for that service: the log_types specified in each AuditConfig are enabled, and the exempted_members in each AuditLogConfig are exempted. Example Policy with multiple AuditConfigs: { "audit_configs": [ { "service": "allServices", "audit_log_configs": [ { "log_type": "DATA_READ", "exempted_members": [ "user:jose@example.com" ] }, { "log_type": "DATA_WRITE" }, { "log_type": "ADMIN_READ" } ] }, { "service": "sampleservice.googleapis.com", "audit_log_configs": [ { "log_type": "DATA_READ" }, { "log_type": "DATA_WRITE", "exempted_members": [ "user:aliya@example.com" ] } ] } ] } For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ logging. It also exempts jose@example.com from DATA_READ logging, and aliya@example.com from DATA_WRITE logging.
public type AuditConfig record {
    # The configuration for logging of each type of permission.
    AuditLogConfig[] auditLogConfigs?;
    # Specifies a service that will be enabled for audit logging. For example, `storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices` is a special value that covers all services.
    string 'service?;
};

# Representative value of a single feature within the cluster.
public type FeatureValue record {
    # Representative value of a categorical feature.
    CategoricalValue categoricalValue?;
    # The feature column name.
    string featureColumn?;
    # The numerical feature value. This is the centroid value for this feature.
    float numericalValue?;
};

public type DatasetReference record {
    # [Required] A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
    string datasetId?;
    # [Optional] The ID of the project containing this dataset.
    string projectId?;
};

public type ParquetOptions record {
    # [Optional] Indicates whether to use schema inference specifically for Parquet LIST logical type.
    boolean enableListInference?;
    # [Optional] Indicates whether to infer Parquet ENUM logical type as STRING instead of BYTES by default.
    boolean enumAsString?;
};

public type TablefieldschemaPolicytags record {
    # A list of category resource names. For example, "projects/1/location/eu/taxonomies/2/policyTags/3". At most 1 policy tag is allowed.
    string[] names?;
};

# Arima order, can be used for both non-seasonal and seasonal parts.
public type ArimaOrder record {
    # Order of the differencing part.
    string d?;
    # Order of the autoregressive part.
    string p?;
    # Order of the moving-average part.
    string q?;
};

public type ListModelsResponse record {
    # Models in the requested dataset. Only the following fields are populated: model_reference, model_type, creation_time, last_modified_time and labels.
    Model[] models?;
    # A token to request the next page of results.
    string nextPageToken?;
};

public type MaterializedViewDefinition record {
    # [Optional] [TrustedTester] Enable automatic refresh of the materialized view when the base table is updated. The default value is "true".
    boolean enableRefresh?;
    # [Output-only] [TrustedTester] The time when this materialized view was last modified, in milliseconds since the epoch.
    string lastRefreshTime?;
    # [Required] A query whose result is persisted.
    string query?;
    # [Optional] [TrustedTester] The maximum frequency at which this materialized view will be refreshed. The default value is "1800000" (30 minutes).
    string refreshIntervalMs?;
};

public type QueryResponse record {
    # Whether the query result was fetched from the query cache.
    boolean cacheHit?;
    DmlStatistics dmlStats?;
    # [Output-only] The first errors or warnings encountered during the running of the job. The final message includes the number of errors that caused the process to stop. Errors here do not necessarily mean that the job has completed or was unsuccessful.
    ErrorProto[] errors?;
    # Whether the query has completed or not. If rows or totalRows are present, this will always be true. If this is false, totalRows will not be available.
    boolean jobComplete?;
    JobReference jobReference?;
    # The resource type.
    string kind?;
    # [Output-only] The number of rows affected by a DML statement. Present only for DML statements INSERT, UPDATE or DELETE.
    string numDmlAffectedRows?;
    # A token used for paging results.
    string pageToken?;
    # An object with as many results as can be contained within the maximum permitted reply size. To get any additional rows, you can call GetQueryResults and specify the jobReference returned above.
    TableRow[] rows?;
    TableSchema schema?;
    SessionInfo sessionInfoTemplate?;
    # The total number of bytes processed for this query. If this query was a dry run, this is the number of bytes that would be processed if the query were run.
    string totalBytesProcessed?;
    # The total number of rows in the complete query result set, which can be more than the number of rows in this single page of results.
    string totalRows?;
};

public type Model record {
    # The best trial_id across all training runs.
    string bestTrialId?;
    # Output only. The time when this model was created, in millisecs since the epoch.
    string creationTime?;
    # Optional. A user-friendly description of this model.
    string description?;
    EncryptionConfiguration encryptionConfiguration?;
    # Output only. A hash of this resource.
    string etag?;
    # Optional. The time when this model expires, in milliseconds since the epoch. If not present, the model will persist indefinitely. Expired models will be deleted and their storage reclaimed. The defaultTableExpirationMs property of the encapsulating dataset can be used to set a default expirationTime on newly created models.
    string expirationTime?;
    # Output only. Input feature columns that were used to train this model.
    StandardSqlField[] featureColumns?;
    # Optional. A descriptive name for this model.
    string friendlyName?;
    # Output only. Label columns that were used to train this model. The output of the model will have a "predicted_" prefix to these columns.
    StandardSqlField[] labelColumns?;
    # The labels associated with this model. You can use these to organize and group your models. Label keys and values can be no longer than 63 characters, can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter and each label in the list must have a different key.
    record {} labels?;
    # Output only. The time when this model was last modified, in millisecs since the epoch.
    string lastModifiedTime?;
    # Output only. The geographic location where the model resides. This value is inherited from the dataset.
    string location?;
    ModelReference modelReference?;
    # Output only. Type of the model resource.
    string modelType?;
    # Output only. Information for all training runs in increasing order of start_time.
    TrainingRun[] trainingRuns?;
};

public type ModelDefinition record {
    # [Output-only, Beta] Model options used for the first training run. These options are immutable for subsequent training runs. Default values are used for any options not specified in the input query.
    ModeldefinitionModeloptions modelOptions?;
    # [Output-only, Beta] Information about ml training runs, each training run comprises of multiple iterations and there may be multiple training runs for the model if warm start is used or if a user decides to continue a previously cancelled query.
    BqmlTrainingRun[] trainingRuns?;
};

public type ExplainQueryStep record {
    # Machine-readable operation type.
    string kind?;
    # Human-readable stage descriptions.
    string[] substeps?;
};

public type TableDataList record {
    # A hash of this page of results.
    string etag?;
    # The resource type of the response.
    string kind?;
    # A token used for paging results. Providing this token instead of the startIndex parameter can help you retrieve stable results when an underlying table is changing.
    string pageToken?;
    # Rows of results.
    TableRow[] rows?;
    # The total number of rows in the complete table.
    string totalRows?;
};

public type BqmlIterationResult record {
    # [Output-only, Beta] Time taken to run the training iteration in milliseconds.
    string durationMs?;
    # [Output-only, Beta] Eval loss computed on the eval data at the end of the iteration. The eval loss is used for early stopping to avoid overfitting. No eval loss if eval_split_method option is specified as no_split or auto_split with input data size less than 500 rows.
    float evalLoss?;
    # [Output-only, Beta] Index of the ML training iteration, starting from zero for each training run.
    int index?;
    # [Output-only, Beta] Learning rate used for this iteration, it varies for different training iterations if learn_rate_strategy option is not constant.
    float learnRate?;
    # [Output-only, Beta] Training loss computed on the training data at the end of the iteration. The training loss function is defined by model type.
    float trainingLoss?;
};

public type DmlStatistics record {
    # Number of deleted Rows. populated by DML DELETE, MERGE and TRUNCATE statements.
    string deletedRowCount?;
    # Number of inserted Rows. Populated by DML INSERT and MERGE statements.
    string insertedRowCount?;
    # Number of updated Rows. Populated by DML UPDATE and MERGE statements.
    string updatedRowCount?;
};

# An Identity and Access Management (IAM) policy, which specifies access controls for Google Cloud resources. A `Policy` is a collection of `bindings`. A `binding` binds one or more `members` to a single `role`. Members can be user accounts, service accounts, Google groups, and domains (such as G Suite). A `role` is a named list of permissions; each `role` can be an IAM predefined role or a user-created custom role. For some types of Google Cloud resources, a `binding` can also specify a `condition`, which is a logical expression that allows access to a resource only if the expression evaluates to `true`. A condition can add constraints based on attributes of the request, the resource, or both. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies). **JSON example:** { "bindings": [ { "role": "roles/resourcemanager.organizationAdmin", "members": [ "user:mike@example.com", "group:admins@example.com", "domain:google.com", "serviceAccount:my-project-id@appspot.gserviceaccount.com" ] }, { "role": "roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com" ], "condition": { "title": "expirable access", "description": "Does not grant access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')", } } ], "etag": "BwWWja0YfJA=", "version": 3 } **YAML example:** bindings: - members: - user:mike@example.com - group:admins@example.com - domain:google.com - serviceAccount:my-project-id@appspot.gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: - user:eve@example.com role: roles/resourcemanager.organizationViewer condition: title: expirable access description: Does not grant access after Sep 2020 expression: request.time < timestamp('2020-10-01T00:00:00.000Z') - etag: BwWWja0YfJA= - version: 3 For a description of IAM and its features, see the [IAM documentation](https://cloud.google.com/iam/docs/).
public type Policy record {
    # Specifies cloud audit logging configuration for this policy.
    AuditConfig[] auditConfigs?;
    # Associates a list of `members` to a `role`. Optionally, may specify a `condition` that determines how and when the `bindings` are applied. Each of the `bindings` must contain at least one member.
    Binding[] bindings?;
    # `etag` is used for optimistic concurrency control as a way to help prevent simultaneous updates of a policy from overwriting each other. It is strongly suggested that systems make use of the `etag` in the read-modify-write cycle to perform policy updates in order to avoid race conditions: An `etag` is returned in the response to `getIamPolicy`, and systems are expected to put that etag in the request to `setIamPolicy` to ensure that their change will be applied to the same version of the policy. **Important:** If you use IAM Conditions, you must include the `etag` field whenever you call `setIamPolicy`. If you omit this field, then IAM allows you to overwrite a version `3` policy with a version `1` policy, and all of the conditions in the version `3` policy are lost.
    string etag?;
    # Specifies the format of the policy. Valid values are `0`, `1`, and `3`. Requests that specify an invalid value are rejected. Any operation that affects conditional role bindings must specify version `3`. This requirement applies to the following operations: * Getting a policy that includes a conditional role binding * Adding a conditional role binding to a policy * Changing a conditional role binding in a policy * Removing any role binding, with or without a condition, from a policy that includes conditions **Important:** If you use IAM Conditions, you must include the `etag` field whenever you call `setIamPolicy`. If you omit this field, then IAM allows you to overwrite a version `3` policy with a version `1` policy, and all of the conditions in the version `3` policy are lost. If a policy does not include any conditions, operations on that policy may specify any valid version or leave the field unset. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
    int 'version?;
};

public type QueryParameterValue record {
    # [Optional] The array values, if this is an array type.
    QueryParameterValue[] arrayValues?;
    # [Optional] The struct field values, in order of the struct type's declaration.
    record {} structValues?;
    # [Optional] The value of this value, if a simple scalar type.
    string value?;
};

public type ProjectReference record {
    # [Required] ID of the project. Can be either the numeric ID or the assigned ID of the project.
    string projectId?;
};

# Confusion matrix for multi-class classification models.
public type ConfusionMatrix record {
    # Confidence threshold used when computing the entries of the confusion matrix.
    float confidenceThreshold?;
    # One row per actual label.
    Row[] rows?;
};

public type RangePartitioning record {
    # [TrustedTester] [Required] The table is partitioned by this field. The field must be a top-level NULLABLE/REQUIRED field. The only supported type is INTEGER/INT64.
    string 'field?;
    # [TrustedTester] [Required] Defines the ranges for range partitioning.
    RangepartitioningRange range?;
};

# Represents a single JSON object.
public type JsonObject record {};

public type TableList record {
    # A hash of this page of results.
    string etag?;
    # The type of list.
    string kind?;
    # A token to request the next page of results.
    string nextPageToken?;
    # Tables in the requested dataset.
    TablelistTables[] tables?;
    # The total number of tables in the dataset.
    int totalItems?;
};

# Response message for the ListRowAccessPolicies method.
public type ListRowAccessPoliciesResponse record {
    # A token to request the next page of results.
    string nextPageToken?;
    # Row access policies on the requested table.
    RowAccessPolicy[] rowAccessPolicies?;
};

# Evaluation metrics of a model. These are either computed on all training data or just the eval data based on whether eval data was used during training. These are not present for imported models.
public type EvaluationMetrics record {
    # Model evaluation metrics for ARIMA forecasting models.
    ArimaForecastingMetrics arimaForecastingMetrics?;
    # Evaluation metrics for binary classification/classifier models.
    BinaryClassificationMetrics binaryClassificationMetrics?;
    # Evaluation metrics for clustering models.
    ClusteringMetrics clusteringMetrics?;
    # Evaluation metrics for multi-class classification/classifier models.
    MultiClassClassificationMetrics multiClassClassificationMetrics?;
    # Evaluation metrics used by weighted-ALS models specified by feedback_type=implicit.
    RankingMetrics rankingMetrics?;
    # Evaluation metrics for regression and explicit feedback type matrix factorization models.
    RegressionMetrics regressionMetrics?;
};

public type TableFieldSchema record {
    # [Optional] The categories attached to this field, used for field-level access control.
    TablefieldschemaCategories categories?;
    # Optional. Collation specification of the field. It only can be set on string type field.
    string collationSpec?;
    # [Optional] The field description. The maximum length is 1,024 characters.
    string description?;
    # [Optional] Describes the nested schema fields if the type property is set to RECORD.
    TableFieldSchema[] fields?;
    # [Optional] Maximum length of values of this field for STRINGS or BYTES. If max_length is not specified, no maximum length constraint is imposed on this field. If type = "STRING", then max_length represents the maximum UTF-8 length of strings in this field. If type = "BYTES", then max_length represents the maximum number of bytes in this field. It is invalid to set this field if type ≠ "STRING" and ≠ "BYTES".
    string maxLength?;
    # [Optional] The field mode. Possible values include NULLABLE, REQUIRED and REPEATED. The default value is NULLABLE.
    string mode?;
    # [Required] The field name. The name must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_), and must start with a letter or underscore. The maximum length is 300 characters.
    string name?;
    TablefieldschemaPolicytags policyTags?;
    # [Optional] Precision (maximum number of total digits in base 10) and scale (maximum number of digits in the fractional part in base 10) constraints for values of this field for NUMERIC or BIGNUMERIC. It is invalid to set precision or scale if type ≠ "NUMERIC" and ≠ "BIGNUMERIC". If precision and scale are not specified, no value range constraint is imposed on this field insofar as values are permitted by the type. Values of this NUMERIC or BIGNUMERIC field must be in this range when: - Precision (P) and scale (S) are specified: [-10P-S + 10-S, 10P-S - 10-S] - Precision (P) is specified but not scale (and thus scale is interpreted to be equal to zero): [-10P + 1, 10P - 1]. Acceptable values for precision and scale if both are specified: - If type = "NUMERIC": 1 ≤ precision - scale ≤ 29 and 0 ≤ scale ≤ 9. - If type = "BIGNUMERIC": 1 ≤ precision - scale ≤ 38 and 0 ≤ scale ≤ 38. Acceptable values for precision if only precision is specified but not scale (and thus scale is interpreted to be equal to zero): - If type = "NUMERIC": 1 ≤ precision ≤ 29. - If type = "BIGNUMERIC": 1 ≤ precision ≤ 38. If scale is specified but not precision, then it is invalid.
    string precision?;
    # [Optional] See documentation for precision.
    string scale?;
    # [Required] The field data type. Possible values include STRING, BYTES, INTEGER, INT64 (same as INTEGER), FLOAT, FLOAT64 (same as FLOAT), NUMERIC, BIGNUMERIC, BOOLEAN, BOOL (same as BOOLEAN), TIMESTAMP, DATE, TIME, DATETIME, INTERVAL, RECORD (where RECORD indicates that the field contains a nested schema) or STRUCT (same as RECORD).
    string 'type?;
};

public type DatasetlistDatasets record {
    DatasetReference datasetReference?;
    # A descriptive name for the dataset, if one exists.
    string friendlyName?;
    # The fully-qualified, unique, opaque ID of the dataset.
    string id?;
    # The resource type. This property always returns the value "bigquery#dataset".
    string kind?;
    # The labels associated with this dataset. You can use these to organize and group your datasets.
    record {} labels?;
    # The geographic location where the data resides.
    string location?;
};

public type JobConfigurationLoad record {
    # [Optional] Accept rows that are missing trailing optional columns. The missing values are treated as nulls. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. Only applicable to CSV, ignored for other formats.
    boolean allowJaggedRows?;
    # Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false.
    boolean allowQuotedNewlines?;
    # [Optional] Indicates if we should automatically infer the options and schema for CSV and JSON sources.
    boolean autodetect?;
    Clustering clustering?;
    # [Optional] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion.
    string createDisposition?;
    # [Optional] Defines the list of possible SQL data types to which the source decimal values are converted. This list and the precision and the scale parameters of the decimal field determine the target type. In the order of NUMERIC, BIGNUMERIC, and STRING, a type is picked if it is in the specified list and if it supports the precision and the scale. STRING supports all precision and scale values. If none of the listed types supports the precision and the scale, the type supporting the widest range in the specified list is picked, and if a value exceeds the supported range when reading the data, an error will be thrown. Example: Suppose the value of this field is ["NUMERIC", "BIGNUMERIC"]. If (precision,scale) is: (38,9) -> NUMERIC; (39,9) -> BIGNUMERIC (NUMERIC cannot hold 30 integer digits); (38,10) -> BIGNUMERIC (NUMERIC cannot hold 10 fractional digits); (76,38) -> BIGNUMERIC; (77,38) -> BIGNUMERIC (error if value exeeds supported range). This field cannot contain duplicate types. The order of the types in this field is ignored. For example, ["BIGNUMERIC", "NUMERIC"] is the same as ["NUMERIC", "BIGNUMERIC"] and NUMERIC always takes precedence over BIGNUMERIC. Defaults to ["NUMERIC", "STRING"] for ORC and ["NUMERIC"] for the other file formats.
    string[] decimalTargetTypes?;
    EncryptionConfiguration destinationEncryptionConfiguration?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference destinationTable?;
    DestinationTableProperties destinationTableProperties?;
    # [Optional] The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties.
    string encoding?;
    # [Optional] The separator for fields in a CSV file. The separator can be any ISO-8859-1 single-byte character. To use a character in the range 128-255, you must encode the character as UTF8. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (',').
    string fieldDelimiter?;
    HivePartitioningOptions hivePartitioningOptions?;
    # [Optional] Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names
    boolean ignoreUnknownValues?;
    # [Optional] If sourceFormat is set to newline-delimited JSON, indicates whether it should be processed as a JSON variant such as GeoJSON. For a sourceFormat other than JSON, omit this field. If the sourceFormat is newline-delimited JSON: - for newline-delimited GeoJSON: set to GEOJSON.
    string jsonExtension?;
    # [Optional] The maximum number of bad records that BigQuery can ignore when running the job. If the number of bad records exceeds this value, an invalid error is returned in the job result. This is only valid for CSV and JSON. The default value is 0, which requires that all records are valid.
    int maxBadRecords?;
    # [Optional] Specifies a string that represents a null value in a CSV file. For example, if you specify "\N", BigQuery interprets "\N" as a null value when loading a CSV file. The default value is the empty string. If you set this property to a custom value, BigQuery throws an error if an empty string is present for all data types except for STRING and BYTE. For STRING and BYTE columns, BigQuery interprets the empty string as an empty value.
    string nullMarker?;
    ParquetOptions parquetOptions?;
    # If sourceFormat is set to "DATASTORE_BACKUP", indicates which entity properties to load into BigQuery from a Cloud Datastore backup. Property names are case sensitive and must be top-level properties. If no properties are specified, BigQuery loads all properties. If any named property isn't found in the Cloud Datastore backup, an invalid error is returned in the job result.
    string[] projectionFields?;
    # [Optional] The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true.
    string quote?;
    RangePartitioning rangePartitioning?;
    TableSchema schema?;
    # [Deprecated] The inline schema. For CSV schemas, specify as "Field1:Type1[,Field2:Type2]*". For example, "foo:STRING, bar:INTEGER, baz:FLOAT".
    string schemaInline?;
    # [Deprecated] The format of the schemaInline property.
    string schemaInlineFormat?;
    # Allows the schema of the destination table to be updated as a side effect of the load job if a schema is autodetected or supplied in the job configuration. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable.
    string[] schemaUpdateOptions?;
    # [Optional] The number of rows at the top of a CSV file that BigQuery will skip when loading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped.
    int skipLeadingRows?;
    # [Optional] The format of the data files. For CSV files, specify "CSV". For datastore backups, specify "DATASTORE_BACKUP". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". For Avro, specify "AVRO". For parquet, specify "PARQUET". For orc, specify "ORC". The default value is CSV.
    string sourceFormat?;
    # [Required] The fully-qualified URIs that point to your data in Google Cloud. For Google Cloud Storage URIs: Each URI can contain one '*' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources. For Google Cloud Bigtable URIs: Exactly one URI can be specified and it has be a fully specified and valid HTTPS URL for a Google Cloud Bigtable table. For Google Cloud Datastore backups: Exactly one URI can be specified. Also, the '*' wildcard character is not allowed.
    string[] sourceUris?;
    TimePartitioning timePartitioning?;
    # [Optional] If sourceFormat is set to "AVRO", indicates whether to enable interpreting logical types into their corresponding types (ie. TIMESTAMP), instead of only using their raw types (ie. INTEGER).
    boolean useAvroLogicalTypes?;
    # [Optional] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_APPEND. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion.
    string writeDisposition?;
};

public type Job record {
    JobConfiguration configuration?;
    # [Output-only] A hash of this resource.
    string etag?;
    # [Output-only] Opaque ID field of the job
    string id?;
    JobReference jobReference?;
    # [Output-only] The type of the resource.
    string kind?;
    # [Output-only] A URL that can be used to access this resource again.
    string selfLink?;
    JobStatistics statistics?;
    JobStatus status?;
    # [Output-only] Email address of the user who ran the job.
    string user_email?;
};

public type GoogleSheetsOptions record {
    # [Optional] Range of a sheet to query from. Only used when non-empty. Typical format: sheet_name!top_left_cell_id:bottom_right_cell_id For example: sheet1!A1:B20
    string range?;
    # [Optional] The number of rows at the top of a sheet that BigQuery will skip when reading the data. The default value is 0. This property is useful if you have header rows that should be skipped. When autodetect is on, behavior is the following: * skipLeadingRows unspecified - Autodetect tries to detect headers in the first row. If they are not detected, the row is read as data. Otherwise data is read starting from the second row. * skipLeadingRows is 0 - Instructs autodetect that there are no headers and data should be read starting from the first row. * skipLeadingRows = N > 0 - Autodetect skips N-1 rows and tries to detect headers in row N. If headers are not detected, row N is just skipped. Otherwise row N is used to extract column names for the detected schema.
    string skipLeadingRows?;
};

# Associates `members` with a `role`.
public type Binding record {
    # Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: "Summary size limit" description: "Determines if a summary is less than 100 chars" expression: "document.summary.size() < 100" Example (Equality): title: "Requestor is owner" description: "Determines if requestor is the document owner" expression: "document.owner == request.auth.claims.email" Example (Logic): title: "Public documents" description: "Determine whether the document should be publicly visible" expression: "document.type != 'private' && document.type != 'internal'" Example (Data Manipulation): title: "Notification string" description: "Create a notification string with a timestamp." expression: "'New message received at ' + string(document.create_time)" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information.
    Expr condition?;
    # Specifies the identities requesting access for a Cloud Platform resource. `members` can have the following values: * `allUsers`: A special identifier that represents anyone who is on the internet; with or without a Google account. * `allAuthenticatedUsers`: A special identifier that represents anyone who is authenticated with a Google account or a service account. * `user:{emailid}`: An email address that represents a specific Google account. For example, `alice@example.com` . * `serviceAccount:{emailid}`: An email address that represents a service account. For example, `my-other-app@appspot.gserviceaccount.com`. * `group:{emailid}`: An email address that represents a Google group. For example, `admins@example.com`. * `deleted:user:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a user that has been recently deleted. For example, `alice@example.com?uid=123456789012345678901`. If the user is recovered, this value reverts to `user:{emailid}` and the recovered user retains the role in the binding. * `deleted:serviceAccount:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a service account that has been recently deleted. For example, `my-other-app@appspot.gserviceaccount.com?uid=123456789012345678901`. If the service account is undeleted, this value reverts to `serviceAccount:{emailid}` and the undeleted service account retains the role in the binding. * `deleted:group:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a Google group that has been recently deleted. For example, `admins@example.com?uid=123456789012345678901`. If the group is recovered, this value reverts to `group:{emailid}` and the recovered group retains the role in the binding. * `domain:{domain}`: The G Suite domain (primary) that represents all the users of that domain. For example, `google.com` or `example.com`. 
    string[] members?;
    # Role that is assigned to `members`. For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
    string role?;
};

# Confusion matrix for binary classification models.
public type BinaryConfusionMatrix record {
    # The fraction of predictions given the correct label.
    float accuracy?;
    # The equally weighted average of recall and precision.
    float f1Score?;
    # Number of false samples predicted as false.
    string falseNegatives?;
    # Number of false samples predicted as true.
    string falsePositives?;
    # Threshold value used when computing each of the following metric.
    float positiveClassThreshold?;
    # The fraction of actual positive predictions that had positive actual labels.
    float precision?;
    # The fraction of actual positive labels that were given a positive prediction.
    float recall?;
    # Number of true samples predicted as false.
    string trueNegatives?;
    # Number of true samples predicted as true.
    string truePositives?;
};

public type DatasetaccessentryTargetTypes record {
    # [Required] Which resources in the dataset this entry applies to. Currently, only views are supported, but additional target types may be added in the future. Possible values: VIEWS: This entry applies to all views in the dataset.
    string targetType?;
};

# Evaluation metrics for binary classification/classifier models.
public type BinaryClassificationMetrics record {
    # Aggregate metrics for classification/classifier models. For multi-class models, the metrics are either macro-averaged or micro-averaged. When macro-averaged, the metrics are calculated for each label and then an unweighted average is taken of those values. When micro-averaged, the metric is calculated globally by counting the total number of correctly predicted rows.
    AggregateClassificationMetrics aggregateClassificationMetrics?;
    # Binary confusion matrix at multiple thresholds.
    BinaryConfusionMatrix[] binaryConfusionMatrixList?;
    # Label representing the negative class.
    string negativeLabel?;
    # Label representing the positive class.
    string positiveLabel?;
};

public type ExternalDataConfiguration record {
    # Try to detect schema and format options automatically. Any option specified explicitly will be honored.
    boolean autodetect?;
    BigtableOptions bigtableOptions?;
    # [Optional] The compression type of the data source. Possible values include GZIP and NONE. The default value is NONE. This setting is ignored for Google Cloud Bigtable, Google Cloud Datastore backups and Avro formats.
    string compression?;
    # [Optional, Trusted Tester] Connection for external data source.
    string connectionId?;
    CsvOptions csvOptions?;
    # [Optional] Defines the list of possible SQL data types to which the source decimal values are converted. This list and the precision and the scale parameters of the decimal field determine the target type. In the order of NUMERIC, BIGNUMERIC, and STRING, a type is picked if it is in the specified list and if it supports the precision and the scale. STRING supports all precision and scale values. If none of the listed types supports the precision and the scale, the type supporting the widest range in the specified list is picked, and if a value exceeds the supported range when reading the data, an error will be thrown. Example: Suppose the value of this field is ["NUMERIC", "BIGNUMERIC"]. If (precision,scale) is: (38,9) -> NUMERIC; (39,9) -> BIGNUMERIC (NUMERIC cannot hold 30 integer digits); (38,10) -> BIGNUMERIC (NUMERIC cannot hold 10 fractional digits); (76,38) -> BIGNUMERIC; (77,38) -> BIGNUMERIC (error if value exeeds supported range). This field cannot contain duplicate types. The order of the types in this field is ignored. For example, ["BIGNUMERIC", "NUMERIC"] is the same as ["NUMERIC", "BIGNUMERIC"] and NUMERIC always takes precedence over BIGNUMERIC. Defaults to ["NUMERIC", "STRING"] for ORC and ["NUMERIC"] for the other file formats.
    string[] decimalTargetTypes?;
    GoogleSheetsOptions googleSheetsOptions?;
    HivePartitioningOptions hivePartitioningOptions?;
    # [Optional] Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names Google Cloud Bigtable: This setting is ignored. Google Cloud Datastore backups: This setting is ignored. Avro: This setting is ignored.
    boolean ignoreUnknownValues?;
    # [Optional] The maximum number of bad records that BigQuery can ignore when reading data. If the number of bad records exceeds this value, an invalid error is returned in the job result. This is only valid for CSV, JSON, and Google Sheets. The default value is 0, which requires that all records are valid. This setting is ignored for Google Cloud Bigtable, Google Cloud Datastore backups and Avro formats.
    int maxBadRecords?;
    ParquetOptions parquetOptions?;
    TableSchema schema?;
    # [Required] The data format. For CSV files, specify "CSV". For Google sheets, specify "GOOGLE_SHEETS". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". For Avro files, specify "AVRO". For Google Cloud Datastore backups, specify "DATASTORE_BACKUP". [Beta] For Google Cloud Bigtable, specify "BIGTABLE".
    string sourceFormat?;
    # [Required] The fully-qualified URIs that point to your data in Google Cloud. For Google Cloud Storage URIs: Each URI can contain one '*' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources. For Google Cloud Bigtable URIs: Exactly one URI can be specified and it has be a fully specified and valid HTTPS URL for a Google Cloud Bigtable table. For Google Cloud Datastore backups, exactly one URI can be specified. Also, the '*' wildcard character is not allowed.
    string[] sourceUris?;
};

# [Output-only] [Preview] The DDL target row access policy. Present only for CREATE/DROP ROW ACCESS POLICY queries.
public type RowAccessPolicyReference record {
    # [Required] The ID of the dataset containing this row access policy.
    string datasetId?;
    # [Required] The ID of the row access policy. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters.
    string policyId?;
    # [Required] The ID of the project containing this row access policy.
    string projectId?;
    # [Required] The ID of the table containing this row access policy.
    string tableId?;
};

# [TrustedTester] [Required] Defines the ranges for range partitioning.
public type RangepartitioningRange record {
    # [TrustedTester] [Required] The end of range partitioning, exclusive.
    string end?;
    # [TrustedTester] [Required] The width of each interval.
    string interval?;
    # [TrustedTester] [Required] The start of range partitioning, inclusive.
    string 'start?;
};

public type QueryparametertypeStructtypes record {
    # [Optional] Human-oriented description of the field.
    string description?;
    # [Optional] The name of this field.
    string name?;
    QueryParameterType 'type?;
};

# (Auto-)arima fitting result. Wrap everything in ArimaResult for easier refactoring if we want to use model-specific iteration results.
public type ArimaResult record {
    # This message is repeated because there are multiple arima models fitted in auto-arima. For non-auto-arima model, its size is one.
    ArimaModelInfo[] arimaModelInfo?;
    # Seasonal periods. Repeated because multiple periods are supported for one time series.
    string[] seasonalPeriods?;
};

public type JobstatisticsReservationusage record {
    # [Output-only] Reservation name or "unreserved" for on-demand resources usage.
    string name?;
    # [Output-only] Slot-milliseconds the job spent in the given reservation.
    string slotMs?;
};

public type BqmlTrainingRun record {
    # [Output-only, Beta] List of each iteration results.
    BqmlIterationResult[] iterationResults?;
    # [Output-only, Beta] Training run start time in milliseconds since the epoch.
    string startTime?;
    # [Output-only, Beta] Different state applicable for a training run. IN PROGRESS: Training run is in progress. FAILED: Training run ended due to a non-retryable failure. SUCCEEDED: Training run successfully completed. CANCELLED: Training run cancelled by the user.
    string state?;
    # [Output-only, Beta] Training options used by this training run. These options are mutable for subsequent training runs. Default values are explicitly stored for options not specified in the input query of the first training run. For subsequent training runs, any option not explicitly specified in the input query will be copied from the previous training run.
    BqmltrainingrunTrainingoptions trainingOptions?;
};

public type ProjectlistProjects record {
    # A descriptive name for this project.
    string friendlyName?;
    # An opaque ID of this project.
    string id?;
    # The resource type.
    string kind?;
    # The numeric ID of this project.
    string numericId?;
    ProjectReference projectReference?;
};

# A single row in the confusion matrix.
public type Row record {
    # The original label of this row.
    string actualLabel?;
    # Info describing predicted label distribution.
    Entry[] entries?;
};

public type ScriptStackFrame record {
    # [Output-only] One-based end column.
    int endColumn?;
    # [Output-only] One-based end line.
    int endLine?;
    # [Output-only] Name of the active procedure, empty if in a top-level script.
    string procedureId?;
    # [Output-only] One-based start column.
    int startColumn?;
    # [Output-only] One-based start line.
    int startLine?;
    # [Output-only] Text of the current statement/expression.
    string text?;
};

public type JobReference record {
    # [Required] The ID of the job. The ID must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). The maximum length is 1,024 characters.
    string jobId?;
    # The geographic location of the job. See details at https://cloud.google.com/bigquery/docs/locations#specifying_your_location.
    string location?;
    # [Required] The ID of the project containing this job.
    string projectId?;
};

# Input/output argument of a function or a stored procedure.
public type Argument record {
    # Optional. Defaults to FIXED_TYPE.
    string argumentKind?;
    # The type of a variable, e.g., a function argument. Examples: INT64: {type_kind="INT64"} ARRAY: {type_kind="ARRAY", array_element_type="STRING"} STRUCT>: {type_kind="STRUCT", struct_type={fields=[ {name="x", type={type_kind="STRING"}}, {name="y", type={type_kind="ARRAY", array_element_type="DATE"}} ]}}
    StandardSqlDataType dataType?;
    # Optional. Specifies whether the argument is input or output. Can be set for procedures only.
    string mode?;
    # Optional. The name of this argument. Can be absent for function return argument.
    string name?;
};

public type JobConfigurationTableCopy record {
    # [Optional] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion.
    string createDisposition?;
    EncryptionConfiguration destinationEncryptionConfiguration?;
    # [Optional] The time when the destination table expires. Expired tables will be deleted and their storage reclaimed.
    anydata destinationExpirationTime?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference destinationTable?;
    # [Optional] Supported operation types in table copy job.
    string operationType?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference sourceTable?;
    # [Pick one] Source tables to copy.
    TableReference[] sourceTables?;
    # [Optional] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion.
    string writeDisposition?;
};

public type TableSchema record {
    # Describes the fields in a table.
    TableFieldSchema[] fields?;
};

public type HivePartitioningOptions record {
    # [Optional] When set, what mode of hive partitioning to use when reading data. The following modes are supported. (1) AUTO: automatically infer partition key name(s) and type(s). (2) STRINGS: automatically infer partition key name(s). All types are interpreted as strings. (3) CUSTOM: partition key schema is encoded in the source URI prefix. Not all storage formats support hive partitioning. Requesting hive partitioning on an unsupported format will lead to an error. Currently supported types include: AVRO, CSV, JSON, ORC and Parquet.
    string mode?;
    # [Optional] If set to true, queries over this table require a partition filter that can be used for partition elimination to be specified. Note that this field should only be true when creating a permanent external table or querying a temporary external table. Hive-partitioned loads with requirePartitionFilter explicitly set to true will fail.
    boolean requirePartitionFilter?;
    # [Optional] When hive partition detection is requested, a common prefix for all source uris should be supplied. The prefix must end immediately before the partition key encoding begins. For example, consider files following this data layout. gs://bucket/path_to_table/dt=2019-01-01/country=BR/id=7/file.avro gs://bucket/path_to_table/dt=2018-12-31/country=CA/id=3/file.avro When hive partitioning is requested with either AUTO or STRINGS detection, the common prefix can be either of gs://bucket/path_to_table or gs://bucket/path_to_table/ (trailing slash does not matter).
    string sourceUriPrefix?;
};

# ARIMA model fitting metrics.
public type ArimaFittingMetrics record {
    # AIC.
    float aic?;
    # Log-likelihood.
    float logLikelihood?;
    # Variance.
    float variance?;
};

# Encapsulates settings provided to GetIamPolicy.
public type GetPolicyOptions record {
    # Optional. The policy format version to be returned. Valid values are 0, 1, and 3. Requests specifying an invalid value will be rejected. Requests for policies with any conditional bindings must specify version 3. Policies without any conditional bindings may specify any valid value or leave the field unset. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
    int requestedPolicyVersion?;
};

# Provides the configuration for logging a type of permissions. Example: { "audit_log_configs": [ { "log_type": "DATA_READ", "exempted_members": [ "user:jose@example.com" ] }, { "log_type": "DATA_WRITE" } ] } This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting jose@example.com from DATA_READ logging.
public type AuditLogConfig record {
    # Specifies the identities that do not cause logging for this type of permission. Follows the same format of Binding.members.
    string[] exemptedMembers?;
    # The log type that this config enables.
    string logType?;
};

# Arima coefficients.
public type ArimaCoefficients record {
    # Auto-regressive coefficients, an array of double.
    decimal[] autoRegressiveCoefficients?;
    # Intercept coefficient, just a double not an array.
    float interceptCoefficient?;
    # Moving-average coefficients, an array of double.
    decimal[] movingAverageCoefficients?;
};

public type TableCell record {
    anydata v?;
};

# Represents the count of a single category within the cluster.
public type CategoryCount record {
    # The name of category.
    string category?;
    # The count of training samples matching the category within the cluster.
    string count?;
};

# Response message for `TestIamPermissions` method.
public type TestIamPermissionsResponse record {
    # A subset of `TestPermissionsRequest.permissions` that the caller is allowed.
    string[] permissions?;
};

# Evaluation metrics for regression and explicit feedback type matrix factorization models.
public type RegressionMetrics record {
    # Mean absolute error.
    float meanAbsoluteError?;
    # Mean squared error.
    float meanSquaredError?;
    # Mean squared log error.
    float meanSquaredLogError?;
    # Median absolute error.
    float medianAbsoluteError?;
    # R^2 score. This corresponds to r2_score in ML.EVALUATE.
    float rSquared?;
};

public type ConnectionProperty record {
    # [Required] Name of the connection property to set.
    string 'key?;
    # [Required] Value of the connection property.
    string value?;
};

public type DatasetAccess record {
    DatasetAccessEntry dataset?;
    # [Pick one] A domain to grant access to. Any users signed in with the domain specified will be granted the specified access. Example: "example.com". Maps to IAM policy member "domain:DOMAIN".
    string domain?;
    # [Pick one] An email address of a Google Group to grant access to. Maps to IAM policy member "group:GROUP".
    string groupByEmail?;
    # [Pick one] Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group.
    string iamMember?;
    # [Required] An IAM role ID that should be granted to the user, group, or domain specified in this access entry. The following legacy mappings will be applied: OWNER  roles/bigquery.dataOwner WRITER  roles/bigquery.dataEditor READER  roles/bigquery.dataViewer This field will accept any of the above formats, but will return only the legacy format. For example, if you set this field to "roles/bigquery.dataOwner", it will be returned back as "OWNER".
    string role?;
    # Reference describing the ID of this routine
    RoutineReference routine?;
    # [Pick one] A special group to grant access to. Possible values include: projectOwners: Owners of the enclosing project. projectReaders: Readers of the enclosing project. projectWriters: Writers of the enclosing project. allAuthenticatedUsers: All authenticated BigQuery users. Maps to similarly-named IAM members.
    string specialGroup?;
    # [Pick one] An email address of a user to grant access to. For example: fred@example.com. Maps to IAM policy member "user:EMAIL" or "serviceAccount:EMAIL".
    string userByEmail?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference view?;
};

public type BiEngineReason record {
    # [Output-only] High-level BI Engine reason for partial or disabled acceleration.
    string code?;
    # [Output-only] Free form human-readable reason for partial or disabled acceleration.
    string message?;
};

public type JobConfigurationExtract record {
    # [Optional] The compression type to use for exported files. Possible values include GZIP, DEFLATE, SNAPPY, and NONE. The default value is NONE. DEFLATE and SNAPPY are only supported for Avro. Not applicable when extracting models.
    string compression?;
    # [Optional] The exported file format. Possible values include CSV, NEWLINE_DELIMITED_JSON, PARQUET or AVRO for tables and ML_TF_SAVED_MODEL or ML_XGBOOST_BOOSTER for models. The default value for tables is CSV. Tables with nested or repeated fields cannot be exported as CSV. The default value for models is ML_TF_SAVED_MODEL.
    string destinationFormat?;
    # [Pick one] DEPRECATED: Use destinationUris instead, passing only one URI as necessary. The fully-qualified Google Cloud Storage URI where the extracted table should be written.
    string destinationUri?;
    # [Pick one] A list of fully-qualified Google Cloud Storage URIs where the extracted table should be written.
    string[] destinationUris?;
    # [Optional] Delimiter to use between fields in the exported data. Default is ','. Not applicable when extracting models.
    string fieldDelimiter?;
    # [Optional] Whether to print out a header row in the results. Default is true. Not applicable when extracting models.
    boolean printHeader?;
    ModelReference sourceModel?;
    # [Required] Reference describing the ID of the table that was snapshot
    TableReference sourceTable?;
    # [Optional] If destinationFormat is set to "AVRO", this flag indicates whether to enable extracting applicable column types (such as TIMESTAMP) to their corresponding AVRO logical types (timestamp-micros), instead of only using their raw types (avro-long). Not applicable when extracting models.
    boolean useAvroLogicalTypes?;
};

public type JobCancelResponse record {
    Job job?;
    # The resource type of the response.
    string kind?;
};

public type QueryRequest record {
    # Connection properties.
    ConnectionProperty[] connectionProperties?;
    # If true, creates a new session, where session id will be a server generated random id. If false, runs query with an existing session_id passed in ConnectionProperty, otherwise runs query in non-session mode.
    boolean createSession?;
    DatasetReference defaultDataset?;
    # [Optional] If set to true, BigQuery doesn't run the job. Instead, if the query is valid, BigQuery returns statistics about the job such as how many bytes would be processed. If the query is invalid, an error returns. The default value is false.
    boolean dryRun?;
    # The resource type of the request.
    string kind?;
    # The labels associated with this job. You can use these to organize and group your jobs. Label keys and values can be no longer than 63 characters, can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter and each label in the list must have a different key.
    record {} labels?;
    # The geographic location where the job should run. See details at https://cloud.google.com/bigquery/docs/locations#specifying_your_location.
    string location?;
    # [Optional] The maximum number of rows of data to return per page of results. Setting this flag to a small value such as 1000 and then paging through results might improve reliability when the query result set is large. In addition to this limit, responses are also limited to 10 MB. By default, there is no maximum row count, and only the byte limit applies.
    int maxResults?;
    # [Optional] Limits the bytes billed for this job. Queries that will have bytes billed beyond this limit will fail (without incurring a charge). If unspecified, this will be set to your project default.
    string maximumBytesBilled?;
    # Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or to NAMED to use named (@myparam) query parameters in this query.
    string parameterMode?;
    # [Deprecated] This property is deprecated.
    boolean preserveNulls?;
    # [Required] A query string, following the BigQuery query syntax, of the query to execute. Example: "SELECT count(f1) FROM [myProjectId:myDatasetId.myTableId]".
    string query?;
    # Query parameters for Standard SQL queries.
    QueryParameter[] queryParameters?;
    # A unique user provided identifier to ensure idempotent behavior for queries. Note that this is different from the job_id. It has the following properties: 1. It is case-sensitive, limited to up to 36 ASCII characters. A UUID is recommended. 2. Read only queries can ignore this token since they are nullipotent by definition. 3. For the purposes of idempotency ensured by the request_id, a request is considered duplicate of another only if they have the same request_id and are actually duplicates. When determining whether a request is a duplicate of the previous request, all parameters in the request that may affect the behavior are considered. For example, query, connection_properties, query_parameters, use_legacy_sql are parameters that affect the result and are considered when determining whether a request is a duplicate, but properties like timeout_ms don't affect the result and are thus not considered. Dry run query requests are never considered duplicate of another request. 4. When a duplicate mutating query request is detected, it returns: a. the results of the mutation if it completes successfully within the timeout. b. the running operation if it is still in progress at the end of the timeout. 5. Its lifetime is limited to 15 minutes. In other words, if two requests are sent with the same request_id, but more than 15 minutes apart, idempotency is not guaranteed.
    string requestId?;
    # [Optional] How long to wait for the query to complete, in milliseconds, before the request times out and returns. Note that this is only a timeout for the request, not the query. If the query takes longer to run than the timeout value, the call returns without any results and with the 'jobComplete' flag set to false. You can call GetQueryResults() to wait for the query to complete and read the results. The default value is 10000 milliseconds (10 seconds).
    int timeoutMs?;
    # Specifies whether to use BigQuery's legacy SQL dialect for this query. The default value is true. If set to false, the query will use BigQuery's standard SQL: https://cloud.google.com/bigquery/sql-reference/ When useLegacySql is set to false, the value of flattenResults is ignored; query will be run as if flattenResults is false.
    boolean useLegacySql?;
    # [Optional] Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. The default value is true.
    boolean useQueryCache?;
};

# Request message for `SetIamPolicy` method.
public type SetIamPolicyRequest record {
    # An Identity and Access Management (IAM) policy, which specifies access controls for Google Cloud resources. A `Policy` is a collection of `bindings`. A `binding` binds one or more `members` to a single `role`. Members can be user accounts, service accounts, Google groups, and domains (such as G Suite). A `role` is a named list of permissions; each `role` can be an IAM predefined role or a user-created custom role. For some types of Google Cloud resources, a `binding` can also specify a `condition`, which is a logical expression that allows access to a resource only if the expression evaluates to `true`. A condition can add constraints based on attributes of the request, the resource, or both. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies). **JSON example:** { "bindings": [ { "role": "roles/resourcemanager.organizationAdmin", "members": [ "user:mike@example.com", "group:admins@example.com", "domain:google.com", "serviceAccount:my-project-id@appspot.gserviceaccount.com" ] }, { "role": "roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com" ], "condition": { "title": "expirable access", "description": "Does not grant access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')", } } ], "etag": "BwWWja0YfJA=", "version": 3 } **YAML example:** bindings: - members: - user:mike@example.com - group:admins@example.com - domain:google.com - serviceAccount:my-project-id@appspot.gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: - user:eve@example.com role: roles/resourcemanager.organizationViewer condition: title: expirable access description: Does not grant access after Sep 2020 expression: request.time < timestamp('2020-10-01T00:00:00.000Z') - etag: BwWWja0YfJA= - version: 3 For a description of IAM and its features, see the [IAM documentation](https://cloud.google.com/iam/docs/).
    Policy policy?;
    # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only the fields in the mask will be modified. If no mask is provided, the following default mask is used: `paths: "bindings, etag"`
    string updateMask?;
};

public type DestinationTableProperties record {
    # [Optional] The description for the destination table. This will only be used if the destination table is newly created. If the table already exists and a value different than the current description is provided, the job will fail.
    string description?;
    # [Optional] The friendly name for the destination table. This will only be used if the destination table is newly created. If the table already exists and a value different than the current friendly name is provided, the job will fail.
    string friendlyName?;
    # [Optional] The labels associated with this table. You can use these to organize and group your tables. This will only be used if the destination table is newly created. If the table already exists and labels are different than the current labels are provided, the job will fail.
    record {} labels?;
};

public type JoblistJobs record {
    JobConfiguration configuration?;
    ErrorProto errorResult?;
    # Unique opaque ID of the job.
    string id?;
    JobReference jobReference?;
    # The resource type.
    string kind?;
    # Running state of the job. When the state is DONE, errorResult can be checked to determine whether the job succeeded or failed.
    string state?;
    JobStatistics statistics?;
    JobStatus status?;
    # [Full-projection-only] Email address of the user who ran the job.
    string user_email?;
};

# Aggregate metrics for classification/classifier models. For multi-class models, the metrics are either macro-averaged or micro-averaged. When macro-averaged, the metrics are calculated for each label and then an unweighted average is taken of those values. When micro-averaged, the metric is calculated globally by counting the total number of correctly predicted rows.
public type AggregateClassificationMetrics record {
    # Accuracy is the fraction of predictions given the correct label. For multiclass this is a micro-averaged metric.
    float accuracy?;
    # The F1 score is an average of recall and precision. For multiclass this is a macro-averaged metric.
    float f1Score?;
    # Logarithmic Loss. For multiclass this is a macro-averaged metric.
    float logLoss?;
    # Precision is the fraction of actual positive predictions that had positive actual labels. For multiclass this is a macro-averaged metric treating each class as a binary classifier.
    float precision?;
    # Recall is the fraction of actual positive labels that were given a positive prediction. For multiclass this is a macro-averaged metric.
    float recall?;
    # Area Under a ROC Curve. For multiclass this is a macro-averaged metric.
    float rocAuc?;
    # Threshold at which the metrics are computed. For binary classification models this is the positive class threshold. For multi-class classfication models this is the confidence threshold.
    float threshold?;
};

public type BigtableColumnFamily record {
    # [Optional] Lists of columns that should be exposed as individual fields as opposed to a list of (column name, value) pairs. All columns whose qualifier matches a qualifier in this list can be accessed as .. Other columns can be accessed as a list through .Column field.
    BigtableColumn[] columns?;
    # [Optional] The encoding of the values when the type is not STRING. Acceptable encoding values are: TEXT - indicates values are alphanumeric text strings. BINARY - indicates values are encoded using HBase Bytes.toBytes family of functions. This can be overridden for a specific column by listing that column in 'columns' and specifying an encoding for it.
    string encoding?;
    # Identifier of the column family.
    string familyId?;
    # [Optional] If this is set only the latest version of value are exposed for all columns in this column family. This can be overridden for a specific column by listing that column in 'columns' and specifying a different setting for that column.
    boolean onlyReadLatest?;
    # [Optional] The type to convert the value in cells of this column family. The values are expected to be encoded using HBase Bytes.toBytes function when using the BINARY encoding value. Following BigQuery types are allowed (case-sensitive) - BYTES STRING INTEGER FLOAT BOOLEAN Default type is BYTES. This can be overridden for a specific column by listing that column in 'columns' and specifying a type for it.
    string 'type?;
};

# Message containing the information about one cluster.
public type Cluster record {
    # Centroid id.
    string centroidId?;
    # Count of training data rows that were assigned to this cluster.
    string count?;
    # Values of highly variant features for this cluster.
    FeatureValue[] featureValues?;
};

public type Clustering record {
    # [Repeated] One or more fields on which data should be clustered. Only top-level, non-repeated, simple-type fields are supported. When you cluster a table using multiple columns, the order of columns you specify is important. The order of the specified columns determines the sort order of the data.
    string[] fields?;
};

public type ExplainQueryStage record {
    # Number of parallel input segments completed.
    string completedParallelInputs?;
    # Milliseconds the average shard spent on CPU-bound tasks.
    string computeMsAvg?;
    # Milliseconds the slowest shard spent on CPU-bound tasks.
    string computeMsMax?;
    # Relative amount of time the average shard spent on CPU-bound tasks.
    float computeRatioAvg?;
    # Relative amount of time the slowest shard spent on CPU-bound tasks.
    float computeRatioMax?;
    # Stage end time represented as milliseconds since epoch.
    string endMs?;
    # Unique ID for stage within plan.
    string id?;
    # IDs for stages that are inputs to this stage.
    string[] inputStages?;
    # Human-readable name for stage.
    string name?;
    # Number of parallel input segments to be processed.
    string parallelInputs?;
    # Milliseconds the average shard spent reading input.
    string readMsAvg?;
    # Milliseconds the slowest shard spent reading input.
    string readMsMax?;
    # Relative amount of time the average shard spent reading input.
    float readRatioAvg?;
    # Relative amount of time the slowest shard spent reading input.
    float readRatioMax?;
    # Number of records read into the stage.
    string recordsRead?;
    # Number of records written by the stage.
    string recordsWritten?;
    # Total number of bytes written to shuffle.
    string shuffleOutputBytes?;
    # Total number of bytes written to shuffle and spilled to disk.
    string shuffleOutputBytesSpilled?;
    # Slot-milliseconds used by the stage.
    string slotMs?;
    # Stage start time represented as milliseconds since epoch.
    string startMs?;
    # Current status for the stage.
    string status?;
    # List of operations within the stage in dependency order (approximately chronological).
    ExplainQueryStep[] steps?;
    # Milliseconds the average shard spent waiting to be scheduled.
    string waitMsAvg?;
    # Milliseconds the slowest shard spent waiting to be scheduled.
    string waitMsMax?;
    # Relative amount of time the average shard spent waiting to be scheduled.
    float waitRatioAvg?;
    # Relative amount of time the slowest shard spent waiting to be scheduled.
    float waitRatioMax?;
    # Milliseconds the average shard spent on writing output.
    string writeMsAvg?;
    # Milliseconds the slowest shard spent on writing output.
    string writeMsMax?;
    # Relative amount of time the average shard spent on writing output.
    float writeRatioAvg?;
    # Relative amount of time the slowest shard spent on writing output.
    float writeRatioMax?;
};

public type TableDataInsertAllRequest record {
    # [Optional] Accept rows that contain values that do not match the schema. The unknown values are ignored. Default is false, which treats unknown values as errors.
    boolean ignoreUnknownValues?;
    # The resource type of the response.
    string kind?;
    # The rows to insert.
    TabledatainsertallrequestRows[] rows?;
    # [Optional] Insert all valid rows of a request, even if invalid rows exist. The default value is false, which causes the entire request to fail if any invalid rows exist.
    boolean skipInvalidRows?;
    # If specified, treats the destination table as a base template, and inserts the rows into an instance table named "{destination}{templateSuffix}". BigQuery will manage creation of the instance table, using the schema of the base template table. See https://cloud.google.com/bigquery/streaming-data-into-bigquery#template-tables for considerations when working with templates tables.
    string templateSuffix?;
};

# Information about a single cluster for clustering model.
public type ClusterInfo record {
    # Centroid id.
    string centroidId?;
    # Cluster radius, the average distance from centroid to each point assigned to the cluster.
    float clusterRadius?;
    # Cluster size, the total number of points assigned to the cluster.
    string clusterSize?;
};

public type BigQueryModelTraining record {
    # [Output-only, Beta] Index of current ML training iteration. Updated during create model query job to show job progress.
    int currentIteration?;
    # [Output-only, Beta] Expected number of iterations for the create model query job specified as num_iterations in the input query. The actual total number of iterations may be less than this number due to early stop.
    string expectedTotalIterations?;
};
