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

# The status of each account creation, and the **HeldAccount**, if successful.
public type AddHeldAccountResult record {
    # An account covered by a hold. This structure is immutable. It can be an individual account or a Google Group, depending on the service. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
    HeldAccount account?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status status?;
};

# Query options for group holds.
public type HeldGroupsQuery record {
    # The end time for the query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string endTime?;
    # The start time for the query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string startTime?;
    # The [search operators](https://support.google.com/vault/answer/2474474) used to refine the messages covered by the hold.
    string terms?;
};

# The query definition used for search and export.
public type Query record {
    # The accounts to search
    AccountInfo accountInfo?;
    # The Google Workspace service to search.
    string corpus?;
    # The data source to search.
    string dataScope?;
    # Additional options for Drive search
    DriveOptions driveOptions?;
    # The end time for the search query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string endTime?;
    # The Chat spaces to search
    HangoutsChatInfo hangoutsChatInfo?;
    # Additional options for Google Chat search
    HangoutsChatOptions hangoutsChatOptions?;
    # Additional options for Gmail search
    MailOptions mailOptions?;
    # The entity to search. This field replaces **searchMethod** to support shared drives. When **searchMethod** is **TEAM_DRIVE**, the response of this field is **SHARED_DRIVE**.
    string method?;
    # The organizational unit to search
    OrgUnitInfo orgUnitInfo?;
    # The search method to use.
    string searchMethod?;
    # The shared drives to search
    SharedDriveInfo sharedDriveInfo?;
    # The start time for the search query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string startTime?;
    # Team Drives to search
    TeamDriveInfo teamDriveInfo?;
    # Service-specific [search operators](https://support.google.com/vault/answer/2474474) to filter search results.
    string terms?;
    # The time zone name. It should be an IANA TZ name, such as "America/Los_Angeles". For a list of time zone names, see [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). For more information about how Vault uses time zones, see [the Vault help center](https://support.google.com/vault/answer/6092995#time).
    string timeZone?;
    # Additional options for Voice search
    VoiceOptions voiceOptions?;
};

# The organizational unit to search
public type OrgUnitInfo record {
    # The name of the organizational unit to search, as provided by the [Admin SDK Directory API](https://developers.google.com/admin-sdk/directory/).
    string orgUnitId?;
};

# Response for batch create held accounts.
public type AddHeldAccountsResponse record {
    # The list of responses, in the same order as the batch request.
    AddHeldAccountResult[] responses?;
};

# Groups specific count metrics.
public type GroupsCountResult record {
    # Error occurred when querying these accounts.
    AccountCountError[] accountCountErrors?;
    # Subtotal count per matching account that have more than zero messages.
    AccountCount[] accountCounts?;
    # Total number of accounts that can be queried and have more than zero messages.
    string matchingAccountsCount?;
    # When **DataScope** is **HELD_DATA**, these accounts in the request are not queried because they are not on hold. For other data scope, this field is not set.
    string[] nonQueryableAccounts?;
    # Total number of accounts involved in this count operation.
    string queriedAccountsCount?;
};

# Remove a list of accounts from a hold.
public type RemoveHeldAccountsRequest record {
    # The account IDs of the accounts to remove from the hold.
    string[] accountIds?;
};

# The shared drives to search
public type SharedDriveInfo record {
    # A list of shared drive IDs, as provided by the [Drive API](https://developers.google.com/drive).
    string[] sharedDriveIds?;
};

# Definition of the response for method CountArtifacts.
public type CountArtifactsResponse record {
    # Groups specific count metrics.
    GroupsCountResult groupsCountResult?;
    # Gmail and classic Hangouts-specific count metrics.
    MailCountResult mailCountResult?;
    # Total count of messages.
    string totalCount?;
};

# The definition of a saved query. To work with Vault resources, the account must have the [required Vault privileges](https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
public type SavedQuery record {
    # Output only. The server-generated timestamp when the saved query was created.
    string createTime?;
    # The name of the saved query.
    string displayName?;
    # Output only. The matter ID of the matter the saved query is saved in. The server does not use this field during create and always uses matter ID in the URL.
    string matterId?;
    # The query definition used for search and export.
    Query query?;
    # A unique identifier for the saved query.
    string savedQueryId?;
};

# Service-specific options for holds.
public type CorpusQuery record {
    # Options for Drive holds.
    HeldDriveQuery driveQuery?;
    # Query options for group holds.
    HeldGroupsQuery groupsQuery?;
    # Options for Chat holds.
    HeldHangoutsChatQuery hangoutsChatQuery?;
    # Query options for Gmail holds.
    HeldMailQuery mailQuery?;
    # Options for Voice holds.
    HeldVoiceQuery voiceQuery?;
};

# Additional options for Drive search
public type DriveOptions record {
    # Set to **true** to include shared drives.
    boolean includeSharedDrives?;
    # Set to true to include Team Drive.
    boolean includeTeamDrives?;
    # Search the current version of the Drive file, but export the contents of the last version saved before 12:00 AM UTC on the specified date. Enter the date in UTC.
    string versionDate?;
};

# Represents a matter. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
public type Matter record {
    # An optional description for the matter.
    string description?;
    # The matter ID, which is generated by the server. Leave blank when creating a matter.
    string matterId?;
    # Lists the users and their permission for the matter. Currently there is no programmer defined limit on the number of permissions a matter can have.
    MatterPermission[] matterPermissions?;
    # The name of the matter.
    string name?;
    # The state of the matter.
    string state?;
};

# Query options for Gmail holds.
public type HeldMailQuery record {
    # The end time for the query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string endTime?;
    # The start time for the query. Specify in GMT. The value is rounded to 12 AM on the specified date.
    string startTime?;
    # The [search operators](https://support.google.com/vault/answer/2474474) used to refine the messages covered by the hold.
    string terms?;
};

# Long running operation metadata for CountArtifacts.
public type CountArtifactsMetadata record {
    # End time of count operation. Available when operation is done.
    string endTime?;
    # The matter ID of the associated matter.
    string matterId?;
    # The query definition used for search and export.
    Query query?;
    # Creation time of count operation.
    string startTime?;
};

# Additional options for exports
public type ExportOptions record {
    # Options for Drive exports.
    DriveExportOptions driveOptions?;
    # Options for Groups exports.
    GroupsExportOptions groupsOptions?;
    # Options for Chat exports.
    HangoutsChatExportOptions hangoutsChatOptions?;
    # Options for Gmail exports.
    MailExportOptions mailOptions?;
    # The requested data region for the export.
    string region?;
    # The options for Voice exports.
    VoiceExportOptions voiceOptions?;
};

# The response message for Operations.ListOperations.
public type ListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    Operation[] operations?;
};

# Options for Drive exports.
public type DriveExportOptions record {
    # To include access level information for users with [indirect access](https://support.google.com/vault/answer/6099459#metadata) to files, set to **true**.
    boolean includeAccessInfo?;
};

# Options for Gmail exports.
public type MailExportOptions record {
    # The file format for exported messages.
    string exportFormat?;
    # To export confidential mode content, set to **true**.
    boolean showConfidentialModeContent?;
};

# Response for batch delete held accounts.
public type RemoveHeldAccountsResponse record {
    # A list of statuses for the deleted accounts. Results have the same order as the request.
    Status[] statuses?;
};

# Export sink for Cloud Storage files.
public type CloudStorageSink record {
    # Output only. The exported files in Cloud Storage.
    CloudStorageFile[] files?;
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

# Remove an account as a matter collaborator.
public type RemoveMatterPermissionsRequest record {
    # The account ID.
    string accountId?;
};

# Additional options for Gmail search
public type MailOptions record {
    # Set to **true** to exclude drafts.
    boolean excludeDrafts?;
};

# Team Drives to search
public type TeamDriveInfo record {
    # List of Team Drive IDs, as provided by the [Drive API](https://developers.google.com/drive).
    string[] teamDriveIds?;
};

# Returns a list of the accounts covered by a hold.
public type ListHeldAccountsResponse record {
    # The held accounts on a hold.
    HeldAccount[] accounts?;
};

# Additional options for Voice search
public type VoiceOptions record {
    # Datatypes to search
    string[] coveredData?;
};

# An error that occurred when querying a specific account
public type AccountCountError record {
    # User's information.
    UserInfo account?;
    # Account query error.
    string errorType?;
};

# The exports for a matter.
public type ListExportsResponse record {
    # The list of exports.
    Export[] exports?;
    # Page token to retrieve the next page of results in the list.
    string nextPageToken?;
};

# An account covered by a hold. This structure is immutable. It can be an individual account or a Google Group, depending on the service. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
public type HeldAccount record {
    # The account ID, as provided by the [Admin SDK](https://developers.google.com/admin-sdk/).
    string accountId?;
    # The primary email address of the account. If used as an input, this takes precedence over **accountId**.
    string email?;
    # Output only. The first name of the account holder.
    string firstName?;
    # Output only. When the account was put on hold.
    string holdTime?;
    # Output only. The last name of the account holder.
    string lastName?;
};

# Add an account with the permission specified. The role cannot be owner. If an account already has a role in the matter, the existing role is overwritten.
public type AddMatterPermissionsRequest record {
    # Only relevant if **sendEmails** is **true**. To CC the requestor in the email message, set to **true**. To not CC requestor, set to **false**.
    boolean ccMe?;
    # Users can be matter owners or collaborators. Each matter has only one owner. All others users who can access the matter are collaborators. When an account is purged, its corresponding MatterPermission resources cease to exist.
    MatterPermission matterPermission?;
    # To send a notification email to the added account, set to **true**. To not send a notification email, set to **false**.
    boolean sendEmails?;
};

# Definition of the response for method ListSaveQuery.
public type ListSavedQueriesResponse record {
    # Page token to retrieve the next page of results in the list. If this is empty, then there are no more saved queries to list.
    string nextPageToken?;
    # List of saved queries.
    SavedQuery[] savedQueries?;
};

# Count artifacts request.
public type CountArtifactsRequest record {
    # The query definition used for search and export.
    Query query?;
    # Sets the granularity of the count results.
    string view?;
};

# Options for Drive holds.
public type HeldDriveQuery record {
    # To include files in shared drives in the hold, set to **true**.
    boolean includeSharedDriveFiles?;
    # To include files in Team Drives in the hold, set to **true**.
    boolean includeTeamDriveFiles?;
};

# User's information.
public type UserInfo record {
    # The displayed name of the user.
    string displayName?;
    # The email address of the user.
    string email?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type Operation record {
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

# Options for Chat holds.
public type HeldHangoutsChatQuery record {
    # To include messages in Chat spaces the user was a member of, set to **true**.
    boolean includeRooms?;
};

# Gmail and classic Hangouts-specific count metrics.
public type MailCountResult record {
    # Errors occurred when querying these accounts.
    AccountCountError[] accountCountErrors?;
    # Subtotal count per matching account that have more than zero messages.
    AccountCount[] accountCounts?;
    # Total number of accounts that can be queried and have more than zero messages.
    string matchingAccountsCount?;
    # When **DataScope** is **HELD_DATA**, the number of accounts in the request that are not queried because they are not on hold. For other data scopes, this field is not set.
    string[] nonQueryableAccounts?;
    # Total number of accounts involved in this count operation.
    string queriedAccountsCount?;
};

# The options for Voice exports.
public type VoiceExportOptions record {
    # The file format for exported text messages.
    string exportFormat?;
};

# The results count for each account.
public type AccountCount record {
    # User's information.
    UserInfo account?;
    # The number of results (messages or files) found for this account.
    string count?;
};

# Progress information for an export.
public type ExportStats record {
    # The number of messages or files already processed for export.
    string exportedArtifactCount?;
    # The size of export in bytes.
    string sizeInBytes?;
    # The number of messages or files to be exported.
    string totalArtifactCount?;
};

# Options for Groups exports.
public type GroupsExportOptions record {
    # The file format for exported messages.
    string exportFormat?;
};

# Users can be matter owners or collaborators. Each matter has only one owner. All others users who can access the matter are collaborators. When an account is purged, its corresponding MatterPermission resources cease to exist.
public type MatterPermission record {
    # The account ID, as provided by the [Admin SDK](https://developers.google.com/admin-sdk/).
    string accountId?;
    # The user's role for the matter.
    string role?;
};

# An export. To work with Vault resources, the account must have the [required Vault privileges](https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
public type Export record {
    # Export sink for Cloud Storage files.
    CloudStorageSink cloudStorageSink?;
    # Output only. The time when the export was created.
    string createTime?;
    # Additional options for exports
    ExportOptions exportOptions?;
    # Output only. The generated export ID.
    string id?;
    # Output only. The matter ID.
    string matterId?;
    # The export name.
    string name?;
    # The query definition used for search and export.
    Query query?;
    # User's information.
    UserInfo requester?;
    # Progress information for an export.
    ExportStats stats?;
    # Output only. The status of the export.
    string status?;
};

# Additional options for Google Chat search
public type HangoutsChatOptions record {
    # For searches by account or organizational unit, set to **true** to include rooms.
    boolean includeRooms?;
};

# The accounts to search
public type AccountInfo record {
    # A set of accounts to search.
    string[] emails?;
};

# Provides the list of matters.
public type ListMattersResponse record {
    # List of matters.
    Matter[] matters?;
    # Page token to retrieve the next page of results in the list.
    string nextPageToken?;
};

# Response to a ReopenMatterRequest.
public type ReopenMatterResponse record {
    # Represents a matter. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
    Matter matter?;
};

# Add a list of accounts to a hold.
public type AddHeldAccountsRequest record {
    # A comma-separated list of the account IDs of the accounts to add to the hold. Specify either **emails** or **account_ids**, but not both.
    string[] accountIds?;
    # A comma-separated list of the emails of the accounts to add to the hold. Specify either **emails** or **account_ids**, but not both.
    string[] emails?;
};

# Options for Voice holds.
public type HeldVoiceQuery record {
    # A list of data types covered by the hold. Should be non-empty. Order does not matter and duplicates are ignored.
    string[] coveredData?;
};

# Options for Chat exports.
public type HangoutsChatExportOptions record {
    # The file format for exported messages.
    string exportFormat?;
};

# The holds for a matter.
public type ListHoldsResponse record {
    # The list of holds.
    Hold[] holds?;
    # Page token to retrieve the next page of results in the list. If this is empty, then there are no more holds to list.
    string nextPageToken?;
};

# Response to a CloseMatterRequest.
public type CloseMatterResponse record {
    # Represents a matter. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
    Matter matter?;
};

# The organizational unit covered by a hold. This structure is immutable.
public type HeldOrgUnit record {
    # When the organizational unit was put on hold. This property is immutable.
    string holdTime?;
    # The organizational unit's immutable ID as provided by the [Admin SDK](https://developers.google.com/admin-sdk/).
    string orgUnitId?;
};

# The export file in Cloud Storage
public type CloudStorageFile record {
    # The name of the Cloud Storage bucket for the export file. You can use this value in the [Cloud Storage JSON or XML APIs](https://cloud.google.com/storage/docs/apis), but not to list the bucket contents. Instead, you can [get individual export files](https://cloud.google.com/storage/docs/json_api/v1/objects/get) by object name.
    string bucketName?;
    # The md5 hash of the file.
    string md5Hash?;
    # The name of the Cloud Storage object for the export file. You can use this value in the [Cloud Storage JSON or XML APIs](https://cloud.google.com/storage/docs/apis).
    string objectName?;
    # The export file size.
    string size?;
};

# The Chat spaces to search
public type HangoutsChatInfo record {
    # A list of Chat spaces IDs, as provided by the [Chat API](https://developers.google.com/hangouts/chat).
    string[] roomId?;
};

# A hold. A hold prevents the specified Google Workspace service from purging data for specific accounts or all members of an organizational unit. To work with Vault resources, the account must have the [required Vault privileges] (https://support.google.com/vault/answer/2799699) and access to the matter. To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
public type Hold record {
    # If set, the hold applies to the specified accounts and **orgUnit** must be empty.
    HeldAccount[] accounts?;
    # The service to be searched.
    string corpus?;
    # The unique immutable ID of the hold. Assigned during creation.
    string holdId?;
    # The name of the hold.
    string name?;
    # The organizational unit covered by a hold. This structure is immutable.
    HeldOrgUnit orgUnit?;
    # Service-specific options for holds.
    CorpusQuery query?;
    # The last time this hold was modified.
    string updateTime?;
};
