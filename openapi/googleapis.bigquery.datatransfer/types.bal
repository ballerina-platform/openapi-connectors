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

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# The response message for Locations.ListLocations.
public type ListLocationsResponse record {
    # A list of locations that matches the specified filter in the request.
    Location[] locations?;
    # The standard List next-page token.
    string nextPageToken?;
};

# The returned list transfer run messages.
public type ListTransferLogsResponse record {
    # Output only. The next-pagination token. For multiple-page list results, this token can be used as the `GetTransferRunLogRequest.page_token` to request the next page of list results.
    string nextPageToken?;
    # Output only. The stored pipeline transfer messages.
    TransferMessage[] transferMessages?;
};

# Represents preferences for sending email notifications for transfer run events.
public type EmailPreferences record {
    # If true, email notifications will be sent on transfer run failures.
    boolean enableFailureEmail?;
};

# Represents a data source parameter with validation rules, so that parameters can be rendered in the UI. These parameters are given to us by supported data sources, and include all needed information for rendering and validation. Thus, whoever uses this api can decide to generate either generic ui, or custom data source specific forms.
public type DataSourceParameter record {
    # All possible values for the parameter.
    string[] allowedValues?;
    # If true, it should not be used in new transfers, and it should not be visible to users.
    boolean deprecated?;
    # Parameter description.
    string description?;
    # Parameter display name in the user interface.
    string displayName?;
    # Deprecated. This field has no effect.
    DataSourceParameter[] fields?;
    # Cannot be changed after initial creation.
    boolean immutable?;
    # For integer and double values specifies maxminum allowed value.
    float maxValue?;
    # For integer and double values specifies minimum allowed value.
    float minValue?;
    # Parameter identifier.
    string paramId?;
    # Deprecated. This field has no effect.
    boolean recurse?;
    # Deprecated. This field has no effect.
    boolean repeated?;
    # Is parameter required.
    boolean required?;
    # Parameter type.
    string 'type?;
    # Description of the requirements for this field, in case the user input does not fulfill the regex pattern or min/max values.
    string validationDescription?;
    # URL to a help document to further explain the naming requirements.
    string validationHelpUrl?;
    # Regular expression which can be used for parameter validation.
    string validationRegex?;
};

# A response to start manual transfer runs.
public type StartManualTransferRunsResponse record {
    # The transfer runs that were created.
    TransferRun[] runs?;
};

# A response indicating whether the credentials exist and are valid.
public type CheckValidCredsResponse record {
    # If set to `true`, the credentials exist and are valid.
    boolean hasValidCreds?;
};

# Represents a data transfer run.
public type TransferRun record {
    # Output only. Data source id.
    string dataSourceId?;
    # Output only. The BigQuery target dataset id.
    string destinationDatasetId?;
    # Represents preferences for sending email notifications for transfer run events.
    EmailPreferences emailPreferences?;
    # Output only. Time when transfer run ended. Parameter ignored by server for input requests.
    string endTime?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status errorStatus?;
    # The resource name of the transfer run. Transfer run names have the form `projects/{project_id}/locations/{location}/transferConfigs/{config_id}/runs/{run_id}`. The name is ignored when creating a transfer run.
    string name?;
    # Output only. Pub/Sub topic where a notification will be sent after this transfer run finishes
    string notificationPubsubTopic?;
    # Output only. Parameters specific to each data source. For more information see the bq tab in the 'Setting up a data transfer' section for each data source. For example the parameters for Cloud Storage transfers are listed here: https://cloud.google.com/bigquery-transfer/docs/cloud-storage-transfer#bq
    record {} params?;
    # For batch transfer runs, specifies the date and time of the data should be ingested.
    string runTime?;
    # Output only. Describes the schedule of this transfer run if it was created as part of a regular schedule. For batch transfer runs that are scheduled manually, this is empty. NOTE: the system might choose to delay the schedule depending on the current load, so `schedule_time` doesn't always match this.
    string schedule?;
    # Minimum time after which a transfer run can be started.
    string scheduleTime?;
    # Output only. Time when transfer run was started. Parameter ignored by server for input requests.
    string startTime?;
    # Data transfer run state. Ignored for input requests.
    string state?;
    # Output only. Last time the data transfer run state was updated.
    string updateTime?;
    # Deprecated. Unique ID of the user on whose behalf transfer is done.
    string userId?;
};

# Represents data source metadata. Metadata is sufficient to render UI and request proper OAuth tokens.
public type DataSource record {
    # Indicates the type of authorization.
    string authorizationType?;
    # Data source client id which should be used to receive refresh token.
    string clientId?;
    # Specifies whether the data source supports automatic data refresh for the past few days, and how it's supported. For some data sources, data might not be complete until a few days later, so it's useful to refresh data automatically.
    string dataRefreshType?;
    # Data source id.
    string dataSourceId?;
    # Default data refresh window on days. Only meaningful when `data_refresh_type` = `SLIDING_WINDOW`.
    int defaultDataRefreshWindowDays?;
    # Default data transfer schedule. Examples of valid schedules include: `1st,3rd monday of month 15:30`, `every wed,fri of jan,jun 13:15`, and `first sunday of quarter 00:00`.
    string defaultSchedule?;
    # User friendly data source description string.
    string description?;
    # User friendly data source name.
    string displayName?;
    # Url for the help document for this data source.
    string helpUrl?;
    # Disables backfilling and manual run scheduling for the data source.
    boolean manualRunsDisabled?;
    # The minimum interval for scheduler to schedule runs.
    string minimumScheduleInterval?;
    # Output only. Data source resource name.
    string name?;
    # Data source parameters.
    DataSourceParameter[] parameters?;
    # Api auth scopes for which refresh token needs to be obtained. These are scopes needed by a data source to prepare data and ingest them into BigQuery, e.g., https://www.googleapis.com/auth/bigquery
    string[] scopes?;
    # Specifies whether the data source supports a user defined schedule, or operates on the default schedule. When set to `true`, user can override default schedule.
    boolean supportsCustomSchedule?;
    # Deprecated. This field has no effect.
    boolean supportsMultipleTransfers?;
    # Deprecated. This field has no effect.
    string transferType?;
    # The number of seconds to wait for an update from the data source before the Data Transfer Service marks the transfer as FAILED.
    int updateDeadlineSeconds?;
};

# The returned list of pipelines in the project.
public type ListTransferConfigsResponse record {
    # Output only. The next-pagination token. For multiple-page list results, this token can be used as the `ListTransferConfigsRequest.page_token` to request the next page of list results.
    string nextPageToken?;
    # Output only. The stored pipeline transfer configurations.
    TransferConfig[] transferConfigs?;
};

# A specification for a time range, this will request transfer runs with run_time between start_time (inclusive) and end_time (exclusive).
public type TimeRange record {
    # End time of the range of transfer runs. For example, `"2017-05-30T00:00:00+00:00"`. The end_time must not be in the future. Creates transfer runs where run_time is in the range between start_time (inclusive) and end_time (exclusive).
    string endTime?;
    # Start time of the range of transfer runs. For example, `"2017-05-25T00:00:00+00:00"`. The start_time must be strictly less than the end_time. Creates transfer runs where run_time is in the range between start_time (inclusive) and end_time (exclusive).
    string startTime?;
};

# Options customizing the data transfer schedule.
public type ScheduleOptions record {
    # If true, automatic scheduling of data transfer runs for this configuration will be disabled. The runs can be started on ad-hoc basis using StartManualTransferRuns API. When automatic scheduling is disabled, the TransferConfig.schedule field will be ignored.
    boolean disableAutoScheduling?;
    # Defines time to stop scheduling transfer runs. A transfer run cannot be scheduled at or after the end time. The end time can be changed at any moment. The time when a data transfer can be trigerred manually is not limited by this option.
    string endTime?;
    # Specifies time to start scheduling transfer runs. The first run will be scheduled at or after the start time according to a recurrence pattern defined in the schedule string. The start time can be changed at any moment. The time when a data transfer can be trigerred manually is not limited by this option.
    string startTime?;
};

# The returned list of pipelines in the project.
public type ListTransferRunsResponse record {
    # Output only. The next-pagination token. For multiple-page list results, this token can be used as the `ListTransferRunsRequest.page_token` to request the next page of list results.
    string nextPageToken?;
    # Output only. The stored pipeline transfer runs.
    TransferRun[] transferRuns?;
};

# A request to schedule transfer runs for a time range.
public type ScheduleTransferRunsRequest record {
    # Required. End time of the range of transfer runs. For example, `"2017-05-30T00:00:00+00:00"`.
    string endTime?;
    # Required. Start time of the range of transfer runs. For example, `"2017-05-25T00:00:00+00:00"`.
    string startTime?;
};

# Represents a user facing message for a particular data transfer run.
public type TransferMessage record {
    # Message text.
    string messageText?;
    # Time when message was logged.
    string messageTime?;
    # Message severity.
    string severity?;
};

# Represents a data transfer configuration. A transfer configuration contains all metadata needed to perform a data transfer. For example, `destination_dataset_id` specifies where data should be stored. When a new transfer configuration is created, the specified `destination_dataset_id` is created when needed and shared with the appropriate data source service account.
public type TransferConfig record {
    # The number of days to look back to automatically refresh the data. For example, if `data_refresh_window_days = 10`, then every day BigQuery reingests data for [today-10, today-1], rather than ingesting data for just [today-1]. Only valid if the data source supports the feature. Set the value to 0 to use the default value.
    int dataRefreshWindowDays?;
    # Data source id. Cannot be changed once data transfer is created.
    string dataSourceId?;
    # Output only. Region in which BigQuery dataset is located.
    string datasetRegion?;
    # The BigQuery target dataset id.
    string destinationDatasetId?;
    # Is this config disabled. When set to true, no runs are scheduled for a given transfer.
    boolean disabled?;
    # User specified display name for the data transfer.
    string displayName?;
    # Represents preferences for sending email notifications for transfer run events.
    EmailPreferences emailPreferences?;
    # The resource name of the transfer config. Transfer config names have the form `projects/{project_id}/locations/{region}/transferConfigs/{config_id}`. Where `config_id` is usually a uuid, even though it is not guaranteed or required. The name is ignored when creating a transfer config.
    string name?;
    # Output only. Next time when data transfer will run.
    string nextRunTime?;
    # Pub/Sub topic where notifications will be sent after transfer runs associated with this transfer config finish.
    string notificationPubsubTopic?;
    # Parameters specific to each data source. For more information see the bq tab in the 'Setting up a data transfer' section for each data source. For example the parameters for Cloud Storage transfers are listed here: https://cloud.google.com/bigquery-transfer/docs/cloud-storage-transfer#bq
    record {} params?;
    # Data transfer schedule. If the data source does not support a custom schedule, this should be empty. If it is empty, the default value for the data source will be used. The specified times are in UTC. Examples of valid format: `1st,3rd monday of month 15:30`, `every wed,fri of jan,jun 13:15`, and `first sunday of quarter 00:00`. See more explanation about the format here: https://cloud.google.com/appengine/docs/flexible/python/scheduling-jobs-with-cron-yaml#the_schedule_format NOTE: the granularity should be at least 8 hours, or less frequent.
    string schedule?;
    # Options customizing the data transfer schedule.
    ScheduleOptions scheduleOptions?;
    # Output only. State of the most recently updated transfer run.
    string state?;
    # Output only. Data transfer modification time. Ignored by server on input.
    string updateTime?;
    # Deprecated. Unique ID of the user on whose behalf transfer is done.
    string userId?;
};

# Returns list of supported data sources and their metadata.
public type ListDataSourcesResponse record {
    # List of supported data sources and their transfer settings.
    DataSource[] dataSources?;
    # Output only. The next-pagination token. For multiple-page list results, this token can be used as the `ListDataSourcesRequest.page_token` to request the next page of list results.
    string nextPageToken?;
};

# A response to schedule transfer runs for a time range.
public type ScheduleTransferRunsResponse record {
    # The transfer runs that were scheduled.
    TransferRun[] runs?;
};

# A request to determine whether the user has valid credentials. This method is used to limit the number of OAuth popups in the user interface. The user id is inferred from the API call context. If the data source has the Google+ authorization type, this method returns false, as it cannot be determined whether the credentials are already valid merely based on the user id.
public type CheckValidCredsRequest record {
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

# A request to start manual transfer runs.
public type StartManualTransferRunsRequest record {
    # Specific run_time for a transfer run to be started. The requested_run_time must not be in the future.
    string requestedRunTime?;
    # A specification for a time range, this will request transfer runs with run_time between start_time (inclusive) and end_time (exclusive).
    TimeRange requestedTimeRange?;
};
