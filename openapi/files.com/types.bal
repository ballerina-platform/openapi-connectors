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

public type ActionNotificationExportResultEntityArr ActionNotificationExportResultEntity[];

public type ApiKeyEntityArr ApiKeyEntity[];

public type IpAddressEntityArr IpAddressEntity[];

public type DnsRecordEntityArr DnsRecordEntity[];

public type PublicKeyEntityArr PublicKeyEntity[];

public type GroupUserEntityArr GroupUserEntity[];

public type As2KeyEntityArr As2KeyEntity[];

public type UserEntityArr UserEntity[];

public type UserCipherUseEntityArr UserCipherUseEntity[];

public type PermissionEntityArr PermissionEntity[];

public type AppEntityArr AppEntity[];

public type AutomationEntityArr AutomationEntity[];

public type BandwidthSnapshotEntityArr BandwidthSnapshotEntity[];

public type BehaviorEntityArr BehaviorEntity[];

public type BundleEntityArr BundleEntity[];

public type BundleDownloadEntityArr BundleDownloadEntity[];

public type BundleRecipientEntityArr BundleRecipientEntity[];

public type BundleRegistrationEntityArr BundleRegistrationEntity[];

public type ClickwrapEntityArr ClickwrapEntity[];

public type ExternalEventEntityArr ExternalEventEntity[];

public type FileUploadPartEntityArr FileUploadPartEntity[];

public type FileCommentEntityArr FileCommentEntity[];

public type FileEntityArr FileEntity[];

public type FormFieldSetEntityArr FormFieldSetEntity[];

public type GroupEntityArr GroupEntity[];

public type ActionEntityArr ActionEntity[];

public type HistoryExportResultEntityArr HistoryExportResultEntity[];

public type InboxRecipientEntityArr InboxRecipientEntity[];

public type InboxRegistrationEntityArr InboxRegistrationEntity[];

public type InboxUploadEntityArr InboxUploadEntity[];

public type AccountLineItemEntityArr AccountLineItemEntity[];

public type PublicIpAddressEntityArr PublicIpAddressEntity[];

public type LockEntityArr LockEntity[];

public type MessageEntityArr MessageEntity[];

public type MessageCommentEntityArr MessageCommentEntity[];

public type MessageCommentReactionEntityArr MessageCommentReactionEntity[];

public type MessageReactionEntityArr MessageReactionEntity[];

public type NotificationEntityArr NotificationEntity[];

public type ProjectEntityArr ProjectEntity[];

public type RemoteServerEntityArr RemoteServerEntity[];

public type RequestEntityArr RequestEntity[];

public type SettingsChangeEntityArr SettingsChangeEntity[];

public type SsoStrategyEntityArr SsoStrategyEntity[];

public type SyncJobEntityArr SyncJobEntity[];

public type UsageSnapshotEntityArr UsageSnapshotEntity[];

public type UsageDailySnapshotEntityArr UsageDailySnapshotEntity[];

public type UserRequestEntityArr UserRequestEntity[];

# Create Form Field Set
public type PostFormFieldSets record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Title to be displayed
    string title?;
    # Skip validating form email
    boolean skip_email?;
    # Skip validating form name
    boolean skip_name?;
    # Skip validating company
    boolean skip_company?;
    # Form fields
    PatchformfieldsetsFormFields[] form_fields?;
};

# Image entity
public type ImageEntity record {
    # Image name
    string name?;
    # Image URI
    string uri?;
};

# Create Remote Server
public type RemoteServerEntity record {
    # Remote server ID
    int id?;
    # Type of authentication method
    string authentication_method?;
    # Hostname or IP address
    string hostname?;
    # Initial home folder on remote server
    string remote_home_path?;
    # Internal name for your reference
    string name?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Returns link to login with an Oauth provider
    string auth_setup_link?;
    # Either `in_setup` or `complete`
    string auth_status?;
    # Describes the authorized account
    string auth_account_name?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
};

# Create User
public type UserEntity record {
    # User ID
    int id?;
    # User's username
    string username?;
    # List of group IDs of which this user is an administrator
    int[] admin_group_ids?;
    # A list of allowed IPs if applicable. Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Number of api keys associated with this user
    int api_keys_count?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # URL holding the user's avatar
    string avatar_url?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # When this user was created
    string created_at?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # User email address
    string email?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Comma-separated list of group IDs of which this user is a member
    string group_ids?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # User's last login time
    string last_login_at?;
    # The last protocol and cipher used
    string last_protocol_cipher?;
    # Time in the future that the user will no longer be locked out if applicable
    string lockout_expires?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Last time the user's password was set
    string password_set_at?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Number of public keys associated with this user
    int public_keys_count?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # 2FA required setting
    string require_2fa?;
    # Is 2fa active for the user?
    boolean active_2fa?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # Is this user managed by a SsoStrategy?
    boolean externally_managed?;
    # User time zone
    string time_zone?;
    # Type(s) of 2FA methods in use.  Will be either `sms`, `totp`, `u2f`, `yubi`, or multiple values sorted alphabetically and joined by an underscore.
    string type_of_2fa?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
};

# List Messages
public type MessageEntity record {
    # Message ID
    int id?;
    # Message subject.
    string subject?;
    # Message body.
    string body?;
    # List Message Comments
    MessageCommentEntity comments?;
};

# List External Events
public type ExternalEventEntity record {
    # Event ID
    int id?;
    # Type of event being recorded.
    string event_type?;
    # Status of event.
    string status?;
    # Event body
    string body?;
    # External event create date/time
    string created_at?;
    # Link to log file.
    string body_url?;
    # Folder Behavior ID
    int folder_behavior_id?;
    # For sync events, the number of files handled successfully.
    int successful_files?;
    # For sync events, the number of files that encountered errors.
    int errored_files?;
    # For sync events, the total number of bytes synced.
    int bytes_synced?;
    # Associated Remote Server type, if any
    string remote_server_type?;
};

# Show History Export
public type HistoryExportEntity record {
    # History Export ID
    int id?;
    # Version of the history for the export.
    string history_version?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Status of export.  Will be: `building`, `ready`, or `failed`
    string status?;
    # Filter results by this this action type. Valid values: `create`, `read`, `update`, `destroy`, `move`, `login`, `failedlogin`, `copy`, `user_create`, `user_update`, `user_destroy`, `group_create`, `group_update`, `group_destroy`, `permission_create`, `permission_destroy`, `api_key_create`, `api_key_update`, `api_key_destroy`
    string query_action?;
    # Filter results by this this interface type. Valid values: `web`, `ftp`, `robot`, `jsapi`, `webdesktopapi`, `sftp`, `dav`, `desktop`, `restapi`, `scim`, `office`, `mobile`
    string query_interface?;
    # Return results that are actions performed by the user indiciated by this User ID
    string query_user_id?;
    # Return results that are file actions related to the file indicated by this File ID
    string query_file_id?;
    # Return results that are file actions inside the parent folder specified by this folder ID
    string query_parent_id?;
    # Return results that are file actions related to this path.
    string query_path?;
    # Return results that are file actions related to files or folders inside this folder path.
    string query_folder?;
    # Return results that are file moves originating from this path.
    string query_src?;
    # Return results that are file moves with this path as destination.
    string query_destination?;
    # Filter results by this IP address.
    string query_ip?;
    # Filter results by this username.
    string query_username?;
    # If searching for Histories about login failures, this parameter restricts results to failures of this specific type.  Valid values: `expired_trial`, `account_overdue`, `locked_out`, `ip_mismatch`, `password_mismatch`, `site_mismatch`, `username_not_found`, `none`, `no_ftp_permission`, `no_web_permission`, `no_directory`, `errno_enoent`, `no_sftp_permission`, `no_dav_permission`, `no_restapi_permission`, `key_mismatch`, `region_mismatch`, `expired_access`, `desktop_ip_mismatch`, `desktop_api_key_not_used_quickly_enough`, `disabled`, `country_mismatch`
    string query_failure_type?;
    # If searching for Histories about specific objects (such as Users, or API Keys), this paremeter restricts results to objects that match this ID.
    string query_target_id?;
    # If searching for Histories about Users, Groups or other objects with names, this parameter restricts results to objects with this name/username.
    string query_target_name?;
    # If searching for Histories about Permisisons, this parameter restricts results to permissions of this level.
    string query_target_permission?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this user ID.
    string query_target_user_id?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this username.
    string query_target_username?;
    # If searching for Histories about API keys, this parameter restricts results to API keys associated with this platform.
    string query_target_platform?;
    # If searching for Histories about API keys, this parameter restricts results to API keys with this permission set.
    string query_target_permission_set?;
    # If `status` is `ready`, this will be a URL where all the results can be downloaded at once as a CSV.
    string results_url?;
};

# List Behaviors
public type BehaviorEntity record {
    # Folder behavior ID
    int id?;
    # Folder path
    string path?;
    # URL for attached file
    string attachment_url?;
    # Behavior type.
    string behavior?;
    # Settings for this behavior.  See the section above for an example value to provide here.  Formatting is different for each Behavior type.  May be sent as nested JSON or a single JSON-encoded string.  If using XML encoding for the API call, this data must be sent as a JSON-encoded string.
    record  { }  value?;
};

# List Requests
public type RequestEntity record {
    # Request ID
    int id?;
    # Folder path
    string path?;
    # Source filename, if applicable
    string 'source?;
    # Destination filename
    string destination?;
    # ID of automation that created request
    string automation_id?;
    # User making the request (if applicable)
    string user_display_name?;
};

# List Bundle Recipients
public type BundleRecipientEntity record {
    # The recipient's company.
    string company?;
    # The recipient's name.
    string name?;
    # A note sent to the recipient with the bundle.
    string note?;
    # The recipient's email address.
    string recipient?;
    # When the Bundle was shared with this recipient.
    string sent_at?;
};

# List Usage Daily Snapshots
public type UsageDailySnapshotEntity record {
    # ID of the usage record
    int id?;
    # The date of this usage record
    string date?;
    # The quantity of storage held for this site
    int current_storage?;
    # Usage broken down by each top-level folder
    anydata[] usage_by_top_level_dir?;
};

# List Permissions
public type PermissionEntity record {
    # Permission ID
    int id?;
    # Folder path
    string path?;
    # User ID
    int user_id?;
    # User's username
    string username?;
    # Group ID
    int group_id?;
    # Group name if applicable
    string group_name?;
    # Permission type
    string permission?;
    # Does this permission apply to subfolders?
    boolean recursive?;
};

# List Notifications
public type NotificationEntity record {
    # Notification ID
    int id?;
    # Folder path to notify on
    string path?;
    # Notification group id
    int group_id?;
    # Group name if applicable
    string group_name?;
    # Trigger notification on notification user actions?
    boolean notify_user_actions?;
    # Triggers notification when moving or copying files to this path
    boolean notify_on_copy?;
    # Enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated to
    string send_interval?;
    # Is the user unsubscribed from this notification?
    boolean unsubscribed?;
    # The reason that the user unsubscribed
    string unsubscribed_reason?;
    # Notification user ID
    int user_id?;
    # Notification username
    string username?;
    # If true, it means that the recipient at this user's email address has manually unsubscribed from all emails, or had their email "hard bounce", which means that we are unable to send mail to this user's current email address. Notifications will resume if the user changes their email address.
    boolean suppressed_email?;
};

# Create Group User
public type GroupUserEntity record {
    # Group name
    string group_name?;
    # Group ID
    int group_id?;
    # User ID
    int user_id?;
    # Is this user an administrator of this group?
    boolean admin?;
    # A list of usernames for users in this group
    string[] usernames?;
};

# List Public Keys
public type PublicKeyEntity record {
    # Public key ID
    int id?;
    # Public key title
    string title?;
    # Public key created at date/time
    string created_at?;
    # Public key fingerprint
    string fingerprint?;
};

# List Inbox Uploads
public type InboxUploadEntity record {
    # List Inbox Registrations
    InboxRegistrationEntity inbox_registration?;
    # Upload path
    string path?;
    # Upload date/time
    string created_at?;
};

public type Body198 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # raw body text
    string raw_body?;
    # Send the file data as the request body?
    boolean file_as_body?;
    # Send the file data as a named parameter in the request POST body
    string file_form_field?;
    # action for test body
    string action?;
};

public type Body199 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # raw body text
    string raw_body?;
    # Send the file data as the request body?
    boolean file_as_body?;
    # Send the file data as a named parameter in the request POST body
    string file_form_field?;
    # action for test body
    string action?;
};

public type Body196 record {
    # Name of user requested
    string name;
    # Email of user requested
    string email;
    # Details of the user request
    string details;
};

public type Body197 record {
    # Name of user requested
    string name;
    # Email of user requested
    string email;
    # Details of the user request
    string details;
};

public type Body194 record {
    # Logo for custom branding.
    string file;
};

public type Body195 record {
    # Name of user requested
    string name;
    # Email of user requested
    string email;
    # Details of the user request
    string details;
};

public type Body192 record {
    # Logo for custom branding.
    string file;
};

public type Body193 record {
    # Logo for custom branding.
    string file;
};

public type Body190 record {
    # Username to sign in as
    string username?;
    # Password for sign in
    string password?;
    # If this user has a 2FA device, provide its OTP or code here.
    string otp?;
    # Identifier for a partially-completed login
    string partial_session_id?;
};

public type Body191 record {
    # Username to sign in as
    string username?;
    # Password for sign in
    string password?;
    # If this user has a 2FA device, provide its OTP or code here.
    string otp?;
    # Identifier for a partially-completed login
    string partial_session_id?;
};

# Create File Comment Reaction
public type FileCommentReactionEntity record {
    # Reaction ID
    int id?;
    # Emoji used in the reaction.
    string emoji?;
};

# Create Clickwrap
public type ClickwrapEntity record {
    # Clickwrap ID
    int id?;
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
};

public type Body109 record {
    # Comment body.
    string body;
    # File path.
    string path;
};

public type Body107 record {
    # Comment body.
    string body;
};

public type Body99 record {
    # Move destination path.
    string destination;
};

public type Body108 record {
    # Comment body.
    string body;
    # File path.
    string path;
};

# Show Action Notification Export
public type ActionNotificationExportEntity record {
    # History Export ID
    int id?;
    # Version of the underlying records for the export.
    string export_version?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Status of export.  Valid values: `building`, `ready`, or `failed`
    string status?;
    # Return notifications that were triggered by actions on this specific path.
    string query_path?;
    # Return notifications that were triggered by actions in this folder.
    string query_folder?;
    # Error message associated with the request, if any.
    string query_message?;
    # The HTTP request method used by the webhook.
    string query_request_method?;
    # The target webhook URL.
    string query_request_url?;
    # The HTTP status returned from the server in response to the webhook request.
    string query_status?;
    # true if the webhook request succeeded (i.e. returned a 200 or 204 response status). false otherwise.
    boolean query_success?;
    # If `status` is `ready`, this will be a URL where all the results can be downloaded at once as a CSV.
    string results_url?;
};

# List User Cipher Uses
public type UserCipherUseEntity record {
    # UserCipherUse ID
    int id?;
    # The protocol and cipher employed
    string protocol_cipher?;
    # The earliest recorded use of this combination of interface and protocol and cipher (for this user)
    string created_at?;
    # The interface accessed
    string interface?;
    # The most recent use of this combination of interface and protocol and cipher (for this user)
    string updated_at?;
    # ID of the user who performed this access
    int user_id?;
};

public type Body98 record {
    # Copy destination path.
    string destination;
    # Copy structure only?
    boolean structure?;
};

public type Body105 record {
    # Comment body.
    string body;
};

public type Body97 record {
    # Copy destination path.
    string destination;
    # Copy structure only?
    boolean structure?;
};

public type Body106 record {
    # Comment body.
    string body;
};

public type Body103 record {
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body104 record {
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body101 record {
    # Move destination path.
    string destination;
};

public type Body102 record {
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body100 record {
    # Move destination path.
    string destination;
};

# List Settings Changes
public type SettingsChangeEntity record {
    # Specifics on what changed.
    record  { }  change_details?;
    # The time this change was made
    string created_at?;
    # The user id responsible for this change
    int user_id?;
};

# List Message Comments
public type MessageCommentEntity record {
    # Message Comment ID
    int id?;
    # Comment body.
    string body?;
    # List Message Comment Reactions
    MessageCommentReactionEntity reactions?;
};

# List Usage Snapshots
public type UsageSnapshotEntity record {
    # Site usage ID
    int id?;
    # Site usage report start date/time
    string start_at?;
    # Site usage report end date/time
    string end_at?;
    # Site usage report created at date/time
    string created_at?;
    # Site usage report highest usage in time period
    float high_water_user_count?;
    # Current site usage as of report
    float current_storage?;
    # Site usage report highest usage in time period
    float high_water_storage?;
    # Number of downloads in report time period
    int total_downloads?;
    # Number of uploads in time period
    int total_uploads?;
    # The last time this site usage report was updated
    string updated_at?;
    # A map of root folders to their total usage
    record  { }  usage_by_top_level_dir?;
    # Usage for root folder
    float root_storage?;
    # Usage for files that are deleted but uploaded within last 30 days
    float deleted_files_counted_in_minimum?;
    # Usage for files that are deleted but retained as backups
    float deleted_files_storage?;
};

public type Body89 record {
    # Status of event.
    string status;
    # Event body
    string body;
};

public type Body88 record {
    # Status of event.
    string status;
    # Event body
    string body;
};

public type Body87 record {
    # Status of event.
    string status;
    # Event body
    string body;
};

public type Body86 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

# List site full action history.
public type ActionEntity record {
    # Action ID
    int id?;
    # Path
    string path?;
    # Action occurrence date/time
    string when?;
    # The destination path for this action, if applicable
    string destination?;
    # Friendly displayed output
    string display?;
    # IP Address that performed this action
    string ip?;
    # The source path for this action, if applicable
    string 'source?;
    # Targets
    string[] targets?;
    # User ID
    int user_id?;
    # Username
    string username?;
    # Type of action
    string action?;
    # Failure type.  If action was a user login or session failure, why did it fail?
    string failure_type?;
    # Interface on which this action occurred.
    string interface?;
};

# Create Webhook Test
public type WebhookTestEntity record {
    # Status HTTP code
    int code?;
    # Error message
    string message?;
    # Status message
    string status?;
    # Auto fields.
    AutoEntity data?;
    # The success status of the webhook test
    boolean success?;
};

public type Body92 record {
    # The action to perform.  Can be `append`, `attachment`, `end`, `upload`, `put`, or may not exist
    string action?;
    # etag identifier.
    string[] 'etags\[etag\];
    # Part number.
    int[] 'etags\[part\];
    # Length of file.
    int length?;
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    # User provided modification time.
    string provided_mtime?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Size of file.
    int size?;
    # If copying folder, copy just the structure?
    string structure?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body91 record {
    # The action to perform.  Can be `append`, `attachment`, `end`, `upload`, `put`, or may not exist
    string action?;
    # etag identifier.
    string[] 'etags\[etag\];
    # Part number.
    int[] 'etags\[part\];
    # Length of file.
    int length?;
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    # User provided modification time.
    string provided_mtime?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Size of file.
    int size?;
    # If copying folder, copy just the structure?
    string structure?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body90 record {
    # The action to perform.  Can be `append`, `attachment`, `end`, `upload`, `put`, or may not exist
    string action?;
    # etag identifier.
    string[] 'etags\[etag\];
    # Part number.
    int[] 'etags\[part\];
    # Length of file.
    int length?;
    # Create parent directories if they do not exist?
    boolean mkdir_parents?;
    # Part if uploading a part.
    int part?;
    # How many parts to fetch?
    int parts?;
    # User provided modification time.
    string provided_mtime?;
    string ref?;
    # File byte offset to restart from.
    int restart?;
    # Size of file.
    int size?;
    # If copying folder, copy just the structure?
    string structure?;
    # Allow file rename instead of overwrite?
    boolean with_rename?;
};

public type Body96 record {
    # Copy destination path.
    string destination;
    # Copy structure only?
    boolean structure?;
};

public type Body95 record {
    # Modified time of file.
    string provided_mtime?;
    # Priority/Bookmark color of file.
    string priority_color?;
};

public type Body94 record {
    # Modified time of file.
    string provided_mtime?;
    # Priority/Bookmark color of file.
    string priority_color?;
};

public type Body93 record {
    # Modified time of file.
    string provided_mtime?;
    # Priority/Bookmark color of file.
    string priority_color?;
};

# File preview
public type PreviewEntity record {
    # Preview ID
    int id?;
    # Preview status.  Can be invalid, not_generated, generating, complete, or file_too_large
    string status?;
    # Link to download preview
    string download_uri?;
    # Preview status.  Can be invalid, not_generated, generating, complete, or file_too_large
    string 'type?;
    # Preview size
    int size?;
};

# List Locks by path
public type LockEntity record {
    # Path
    string path?;
    # Lock timeout in seconds
    int timeout?;
    # DEPRECATED: Lock depth
    string depth?;
    # Does lock apply to subfolders?
    boolean recursive?;
    # Owner of the lock.  This can be any arbitrary string.
    string owner?;
    # DEPRECATED: Lock scope
    string scope?;
    # Is lock exclusive?
    boolean exclusive?;
    # Lock token.  Use to release lock.
    string token?;
    # DEPRECATED: Lock type
    string 'type?;
    # Can lock be modified by users other than its creator?
    boolean allow_access_by_any_user?;
    # Lock creator user ID
    int user_id?;
    # Lock creator username
    string username?;
};

# List Message Reactions
public type MessageReactionEntity record {
    # Reaction ID
    int id?;
    # Emoji used in the reaction.
    string emoji?;
};

public type Body78 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Bundle to share.
    int bundle_id;
    # Email addresses to share this bundle with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body77 record {
    # A list of email addresses to share this bundle with. Required unless `recipients` is used.
    string[] to?;
    # Note to include in email.
    string note?;
    # A list of recipients to share this bundle with. Required unless `to` is used.
    record  { } [] recipients?;
};

public type Body76 record {
    # A list of email addresses to share this bundle with. Required unless `recipients` is used.
    string[] to?;
    # Note to include in email.
    string note?;
    # A list of recipients to share this bundle with. Required unless `to` is used.
    record  { } [] recipients?;
};

public type Body75 record {
    # A list of email addresses to share this bundle with. Required unless `recipients` is used.
    string[] to?;
    # Note to include in email.
    string note?;
    # A list of recipients to share this bundle with. Required unless `to` is used.
    record  { } [] recipients?;
};

public type Body200 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # raw body text
    string raw_body?;
    # Send the file data as the request body?
    boolean file_as_body?;
    # Send the file data as a named parameter in the request POST body
    string file_form_field?;
    # action for test body
    string action?;
};

public type Body79 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Bundle to share.
    int bundle_id;
    # Email addresses to share this bundle with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body81 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

public type Body80 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Bundle to share.
    int bundle_id;
    # Email addresses to share this bundle with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body85 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

public type Body84 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

public type Body83 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

public type Body82 record {
    # Name of the Clickwrap agreement (used when selecting from multiple Clickwrap agreements.)
    string name?;
    # Body text of Clickwrap (supports Markdown formatting).
    string body?;
    # Use this Clickwrap for Bundles?
    string use_with_bundles?;
    # Use this Clickwrap for Inboxes?
    string use_with_inboxes?;
    # Use this Clickwrap for User Registrations?  Note: This only applies to User Registrations where the User is invited to your Files.com site using an E-Mail invitation process where they then set their own password.
    string use_with_users?;
};

# Show site DNS configuration.
public type DnsRecordEntity record {
    # Unique label for DNS record; used by Zapier and other integrations.
    string id?;
    # DNS record domain name
    string domain?;
    # DNS record type
    string rrtype?;
    # DNS record value
    string value?;
};

# Create Form Field Set
public type FormFieldSetEntity record {
    # Form field set id
    int id?;
    # Title to be displayed
    string title?;
    # Layout of the form
    int form_layout?;
    # Form fields
    FormFieldEntity form_fields?;
    # Any associated InboxRegistrations or BundleRegistrations can be saved without providing name
    boolean skip_name?;
    # Any associated InboxRegistrations or BundleRegistrations can be saved without providing email
    boolean skip_email?;
    # Any associated InboxRegistrations or BundleRegistrations can be saved without providing company
    boolean skip_company?;
};

# List Bandwidth Snapshots
public type BandwidthSnapshotEntity record {
    # Site bandwidth ID
    int id?;
    # Site bandwidth report bytes received
    float bytes_received?;
    # Site bandwidth report bytes sent
    float bytes_sent?;
    # Site sync bandwidth report bytes received
    float sync_bytes_received?;
    # Site sync bandwidth report bytes sent
    float sync_bytes_sent?;
    # Site bandwidth report get requests
    float requests_get?;
    # Site bandwidth report put requests
    float requests_put?;
    # Site bandwidth report other requests
    float requests_other?;
    # Time the site bandwidth report was logged
    string logged_at?;
    # Site bandwidth report created at date/time
    string created_at?;
    # The last time this site bandwidth report was updated
    string updated_at?;
};

public type Body67 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Folder behaviors path.
    string path;
    # Behavior type.
    string behavior;
};

public type Body66 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Folder behaviors path.
    string path;
    # Behavior type.
    string behavior;
};

# Show File Migration
public type FileMigrationEntity record {
    # File migration ID
    int id?;
    # Source path
    string path?;
    # Destination path
    string dest_path?;
    # Number of files processed
    int files_moved?;
    # Total number of files to process
    int files_total?;
    # The type of operation
    string operation?;
    # Region
    string region?;
    # Status
    string status?;
    # Link to download the log file for this migration.
    string log_url?;
};

public type Body65 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Behavior type.
    string behavior?;
    # Folder behaviors path.
    string path?;
};

# Show site settings
public type SiteEntity record {
    # Site name
    string name?;
    # Is SMS two factor authentication allowed?
    boolean allowed_2fa_method_sms?;
    # Is TOTP two factor authentication allowed?
    boolean allowed_2fa_method_totp?;
    # Is U2F two factor authentication allowed?
    boolean allowed_2fa_method_u2f?;
    # Is yubikey two factor authentication allowed?
    boolean allowed_2fa_method_yubi?;
    # User ID for the main site administrator
    int admin_user_id?;
    # Are manual Bundle names allowed?
    boolean allow_bundle_names?;
    # Comma seperated list of allowed Country codes
    string allowed_countries?;
    # List of allowed IP addresses
    string allowed_ips?;
    # If false, rename conflicting files instead of asking for overwrite confirmation.  Only applies to web interface.
    boolean ask_about_overwrites?;
    # Site-wide Bundle expiration in days
    int bundle_expiration?;
    # Do Bundles require password protection?
    boolean bundle_password_required?;
    # Do Bundles require recipients for sharing?
    boolean bundle_require_share_recipient?;
    # Page link and button color
    string color2_left?;
    # Top bar link color
    string color2_link?;
    # Page link and button color
    string color2_text?;
    # Top bar background color
    string color2_top?;
    # Top bar text color
    string color2_top_text?;
    # Site main contact name
    string contact_name?;
    # Time this site was created
    string created_at?;
    # Preferred currency
    string currency?;
    # Is this site using a custom namespace for users?
    boolean custom_namespace?;
    # Number of days to keep deleted files
    int days_to_retain_backups?;
    # Site default time zone
    string default_time_zone?;
    # Is the desktop app enabled?
    boolean desktop_app?;
    # Is desktop app session IP pinning enabled?
    boolean desktop_app_session_ip_pinning?;
    # Desktop app session lifetime (in hours)
    int desktop_app_session_lifetime?;
    # Is the mobile app enabled?
    boolean mobile_app?;
    # Is mobile app session IP pinning enabled?
    boolean mobile_app_session_ip_pinning?;
    # Mobile app session lifetime (in hours)
    int mobile_app_session_lifetime?;
    # Comma seperated list of disallowed Country codes
    string disallowed_countries?;
    # Are notifications disabled?
    boolean disable_notifications?;
    # Is password reset disabled?
    boolean disable_password_reset?;
    # Custom domain
    string domain?;
    # Main email for this site
    string email?;
    # Reply-to email for this site
    string reply_to_email?;
    # If true, groups can be manually created / modified / deleted by Site Admins. Otherwise, groups can only be managed via your SSO provider.
    boolean non_sso_groups_allowed?;
    # If true, users can be manually created / modified / deleted by Site Admins. Otherwise, users can only be managed via your SSO provider.
    boolean non_sso_users_allowed?;
    # If true, permissions for this site must be bound to a group (not a user). Otherwise, permissions must be bound to a user.
    boolean folder_permissions_groups_only?;
    # Is there a signed HIPAA BAA between Files.com and this site?
    boolean hipaa?;
    # Image entity
    ImageEntity icon128?;
    # Image entity
    ImageEntity icon16?;
    # Image entity
    ImageEntity icon32?;
    # Image entity
    ImageEntity icon48?;
    # Can files be modified?
    string immutable_files_set_at?;
    # Include password in emails to new users?
    boolean include_password_in_welcome_email?;
    # Site default language
    string language?;
    # Base DN for looking up users in LDAP server
    string ldap_base_dn?;
    # Domain name that will be appended to usernames
    string ldap_domain?;
    # Main LDAP setting: is LDAP enabled?
    boolean ldap_enabled?;
    # Should we sync groups from LDAP server?
    string ldap_group_action?;
    # Comma or newline separated list of group names (with optional wildcards) to exclude when syncing.
    string ldap_group_exclusion?;
    # Comma or newline separated list of group names (with optional wildcards) to include when syncing.
    string ldap_group_inclusion?;
    # LDAP host
    string ldap_host?;
    # LDAP backup host
    string ldap_host_2?;
    # LDAP backup host
    string ldap_host_3?;
    # LDAP port
    int ldap_port?;
    # Use secure LDAP?
    boolean ldap_secure?;
    # LDAP type
    string ldap_type?;
    # Should we sync users from LDAP server?
    string ldap_user_action?;
    # Comma or newline separated list of group names (with optional wildcards) - if provided, only users in these groups will be added or synced.
    string ldap_user_include_groups?;
    # Username for signing in to LDAP server.
    string ldap_username?;
    # LDAP username field
    string ldap_username_field?;
    # Login help text
    string login_help_text?;
    # Image entity
    ImageEntity logo?;
    # Number of prior passwords to disallow
    int max_prior_passwords?;
    # Next billing amount
    float next_billing_amount?;
    # Next billing date
    string next_billing_date?;
    # Allow users to use Office for the web?
    boolean office_integration_available?;
    # Link to scheduling a meeting with our Sales team
    string oncehub_link?;
    # Use servers in the USA only?
    boolean opt_out_global?;
    # Last time the site was notified about an overage
    string overage_notified_at?;
    # Notify site email of overages?
    boolean overage_notify?;
    # Is this site's billing overdue?
    boolean overdue?;
    # Shortest password length for users
    int password_min_length?;
    # Require a letter in passwords?
    boolean password_require_letter?;
    # Require lower and upper case letters in passwords?
    boolean password_require_mixed?;
    # Require a number in passwords?
    boolean password_require_number?;
    # Require special characters in password?
    boolean password_require_special?;
    # Require passwords that have not been previously breached? (see https://haveibeenpwned.com/)
    boolean password_require_unbreached?;
    # Require bundles' passwords, and passwords for other items (inboxes, public shares, etc.) to conform to the same requirements as users' passwords?
    boolean password_requirements_apply_to_bundles?;
    # Number of days password is valid
    int password_validity_days?;
    # Site phone number
    string phone?;
    # Require two-factor authentication for all users?
    boolean require_2fa?;
    # If set, requirement for two-factor authentication has been scheduled to end on this date-time.
    string require_2fa_stop_time?;
    # What type of user is required to use two-factor authentication (when require_2fa is set to `true` for this site)?
    string require_2fa_user_type?;
    # Create user session (log in)
    SessionEntity session?;
    # Are sessions locked to the same IP? (i.e. do users need to log in again if they change IPs?)
    boolean session_pinned_by_ip?;
    # Use user FTP roots also for SFTP?
    boolean sftp_user_root_enabled?;
    # Allow bundle creation
    boolean sharing_enabled?;
    # Show request access link for users without access?  Currently unused.
    boolean show_request_access_link?;
    # Custom site footer text
    string site_footer?;
    # Custom site header text
    string site_header?;
    # SMTP server hostname or IP
    string smtp_address?;
    # SMTP server authentication type
    string smtp_authentication?;
    # From address to use when mailing through custom SMTP
    string smtp_from?;
    # SMTP server port
    int smtp_port?;
    # SMTP server username
    string smtp_username?;
    # Session expiry in hours
    float session_expiry?;
    # Is SSL required?  Disabling this is insecure.
    boolean ssl_required?;
    # Site subdomain
    string subdomain?;
    # If switching plans, when does the new plan take effect?
    string switch_to_plan_date?;
    # Is TLS disabled(site setting)?
    boolean tls_disabled?;
    # Number of days left in trial
    int trial_days_left?;
    # When does this Site trial expire?
    string trial_until?;
    # Last time this Site was updated
    string updated_at?;
    # Allow uploaders to set `provided_modified_at` for uploaded files?
    boolean use_provided_modified_at?;
    # Create User
    UserEntity user?;
    # Will users be locked out after incorrect login attempts?
    boolean user_lockout?;
    # How many hours to lock user out for failed password?
    int user_lockout_lock_period?;
    # Number of login tries within `user_lockout_within` hours before users are locked out
    int user_lockout_tries?;
    # Number of hours for user lockout window
    int user_lockout_within?;
    # Enable User Requests feature
    boolean user_requests_enabled?;
    # Custom text send in user welcome email
    string welcome_custom_text?;
    # Include this email in welcome emails if enabled
    string welcome_email_cc?;
    # Will the welcome email be sent to new users?
    boolean welcome_email_enabled?;
    # Does the welcome screen appear?
    string welcome_screen?;
    # Does FTP user Windows emulation mode?
    boolean windows_mode_ftp?;
    # If greater than zero, users will unable to login if they do not show activity within this number of days.
    int disable_users_from_inactivity_period_days?;
};

public type Body64 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Behavior type.
    string behavior?;
    # Folder behaviors path.
    string path?;
};

# Move file/folder
public type FileActionEntity record {
    # Status of file operation. Possible values: completed, enqueued.
    string status?;
    # If status is enqueued, this is the id of the FileMigration to check for status updates.
    int file_migration_id?;
};

public type Body69 record {
    # A list of paths to include in this bundle.
    string[] paths?;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Public description
    string description?;
    # Bundle expiration date/time
    string expires_at?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Bundle internal note
    string note?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

public type Body68 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Folder behaviors path.
    string path;
    # Behavior type.
    string behavior;
};

# Begin file upload
public type FileUploadPartEntity record {
    # Content-Type and File to send
    record  { }  send?;
    # Type of upload
    string action?;
    # If `true`, this file exists and you may wish to ask the user for overwrite confirmation
    boolean ask_about_overwrites?;
    # Number of parts in the upload
    int available_parts?;
    # Date/time of when this Upload part expires and the URL cannot be used any more
    string expires?;
    # Additional upload headers to provide as part of the upload
    record  { }  headers?;
    # HTTP Method to use for uploading the part, usually `PUT`
    string http_method?;
    # Size in bytes for this part
    int next_partsize?;
    # If `true`, multiple parts may be uploaded in parallel.  If `false`, be sure to only upload one part at a time, in order.
    boolean parallel_parts?;
    # Additional HTTP parameters to send with the upload
    record  { }  parameters?;
    # Number of this upload part
    int part_number?;
    # Size in bytes for the next upload part
    int partsize?;
    # New file path
    string path?;
    # Reference name for this upload part
    string ref?;
    # URI to upload this part to
    string upload_uri?;
};

public type Body70 record {
    # A list of paths to include in this bundle.
    string[] paths?;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Public description
    string description?;
    # Bundle expiration date/time
    string expires_at?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Bundle internal note
    string note?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

public type Body74 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # A list of paths to include in this bundle.
    string[] paths;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # Bundle expiration date/time
    string expires_at?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Public description
    string description?;
    # Bundle internal note
    string note?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

public type Body73 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # A list of paths to include in this bundle.
    string[] paths;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # Bundle expiration date/time
    string expires_at?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Public description
    string description?;
    # Bundle internal note
    string note?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

public type Body72 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # A list of paths to include in this bundle.
    string[] paths;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # Bundle expiration date/time
    string expires_at?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Public description
    string description?;
    # Bundle internal note
    string note?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

# List Bundle Downloads
public type BundleDownloadEntity record {
    # List Bundle Registrations
    BundleRegistrationEntity bundle_registration?;
    # Download method (file or full_zip)
    string download_method?;
    # Download path
    string path?;
    # Download date/time
    string created_at?;
};

public type Body71 record {
    # A list of paths to include in this bundle.
    string[] paths?;
    # Password for this bundle.
    string password?;
    # Id of Form Field Set to use with this bundle
    int form_field_set_id?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Public description
    string description?;
    # Bundle expiration date/time
    string expires_at?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Bundle internal note
    string note?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
};

# Test webhook.
public type StatusEntity record {
    # Status HTTP code
    int code?;
    # Error message
    string message?;
    # Status message
    string status?;
    # Auto fields.
    AutoEntity data?;
    # Error fields.
    ErrorsEntity errors?;
    # Required Clickwrap id
    int clickwrap_id?;
    # Required Clickwrap body
    string clickwrap_body?;
};

# List History Export Results
public type HistoryExportResultEntity record {
    # Action ID
    int id?;
    # When the action happened
    int created_at?;
    # User ID
    int user_id?;
    # File ID related to the action
    int file_id?;
    # ID of the parent folder
    int parent_id?;
    # Path of the related action
    string path?;
    # Folder in which the action occurred
    string folder?;
    # File move originated from this path
    string src?;
    # File moved to this destination folder
    string destination?;
    # Client IP that performed the action
    string ip?;
    # Username of the user that performed the action
    string username?;
    # What action was taken. Valid values: `create`, `read`, `update`, `destroy`, `move`, `login`, `failedlogin`, `copy`, `user_create`, `user_update`, `user_destroy`, `group_create`, `group_update`, `group_destroy`, `permission_create`, `permission_destroy`, `api_key_create`, `api_key_update`, `api_key_destroy`
    string action?;
    # The type of login failure, if applicable.  Valid values: `expired_trial`, `account_overdue`, `locked_out`, `ip_mismatch`, `password_mismatch`, `site_mismatch`, `username_not_found`, `none`, `no_ftp_permission`, `no_web_permission`, `no_directory`, `errno_enoent`, `no_sftp_permission`, `no_dav_permission`, `no_restapi_permission`, `key_mismatch`, `region_mismatch`, `expired_access`, `desktop_ip_mismatch`, `desktop_api_key_not_used_quickly_enough`, `disabled`, `country_mismatch`
    string failure_type?;
    # Inteface through which the action was taken. Valid values: `web`, `ftp`, `robot`, `jsapi`, `webdesktopapi`, `sftp`, `dav`, `desktop`, `restapi`, `scim`, `office`, `mobile`
    string interface?;
    # ID of the object (such as Users, or API Keys) on which the action was taken
    int target_id?;
    # Name of the User, Group or other object with a name related to this action
    string target_name?;
    # Permission level of the action
    string target_permission?;
    # Whether or not the action was recursive
    boolean target_recursive?;
    # If searching for Histories about API keys, this is when the API key will expire
    int target_expires_at?;
    # If searching for Histories about API keys, this represents the permission set of the associated  API key
    string target_permission_set?;
    # If searching for Histories about API keys, this is the platform on which the action was taken
    string target_platform?;
    # If searching for Histories about API keys, this is the username on which the action was taken
    string target_username?;
    # If searching for Histories about API keys, this is the User ID on which the action was taken
    int target_user_id?;
};

# List As2 Keys
public type As2KeyEntity record {
    # AS2 Key ID
    int id?;
    # AS2 Partnership Name
    string as2_partnership_name?;
    # AS2 Key created at date/time
    string created_at?;
    # Public key fingerprint
    string fingerprint?;
};

public type Body56 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body55 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body54 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body149 record {
    # Comment body.
    string body;
};

public type Body53 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body147 record {
    # Comment body.
    string body;
};

public type Body59 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body148 record {
    # Comment body.
    string body;
};

public type Body58 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body145 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

public type Body57 record {
    # Automation type
    string automation;
    # Source Path
    string 'source?;
    # DEPRECATED: Destination Path. Use `destinations` instead.
    string destination?;
    # A list of String destination paths or Hash of folder_path and optional file_path.
    string[] destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # How often to run this automation? One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # A list of user IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs the automation is associated with. If sent as a string, it should be comma-delimited.
    string group_ids?;
    # Custom schedule for running this automation.
    record {} schedule?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string[] trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record {} value?;
};

public type Body146 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

public type Body143 record {
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

# List Payments
public type AccountLineItemEntity record {
    # Line item Id
    int id?;
    # Line item amount
    float amount?;
    # Line item balance
    float balance?;
    # Line item created at
    string created_at?;
    # Line item currency
    string currency?;
    # Line item download uri
    string download_uri?;
    # Associated invoice line items
    InvoiceLineItemEntity invoice_line_items?;
    # Line item payment method
    string method?;
    # Associated payment line items
    PaymentLineItemEntity payment_line_items?;
    # Date/time payment was reversed if applicable
    string payment_reversed_at?;
    # Type of payment if applicable
    string payment_type?;
    # Site name this line item is for
    string site_name?;
    # Type of line item, either payment or invoice
    string 'type?;
    # Line item updated at
    string updated_at?;
};

public type Body144 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

public type Body141 record {
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

# List IP Addresses associated with the current site
public type IpAddressEntity record {
    # Unique label for list; used by Zapier and other integrations.
    string id?;
    # The object that this public IP address list is associated with.
    string associated_with?;
    # Group ID
    int group_id?;
    # A list of IP addresses.
    string[] ip_addresses?;
};

public type Body142 record {
    # Project to which the message should be attached.
    int project_id;
    # Message subject.
    string subject;
    # Message body.
    string body;
};

public type Body63 record {
    # The value of the folder behavior.  Can be a integer, array, or hash depending on the type of folder behavior. See The Behavior Types section for example values for each type of behavior.
    string value?;
    # Certain behaviors may require a file, for instance, the "watermark" behavior requires a watermark image
    string attachment_file?;
    # Behavior type.
    string behavior?;
    # Folder behaviors path.
    string path?;
};

public type Body62 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

public type Body140 record {
    # Allow lock to be updated by any user?
    boolean allow_access_by_any_user?;
    # Is lock exclusive?
    boolean exclusive?;
    # Does lock apply to subfolders?
    string recursive?;
    # Lock timeout length
    int timeout?;
};

# Create user session (log in)
public type SessionEntity record {
    # Session ID
    string id?;
    # Session language
    string language?;
    # Login token. If set, this token will allow your user to log in via browser at the domain in `login_token_domain`.
    string login_token?;
    # Domain to use with `login_token`.
    string login_token_domain?;
    # Maximum number of files to retrieve per folder for a directory listing.  This is based on the user's plan.
    int max_dir_listing_size?;
    # Can access multiple regions?
    boolean multiple_regions?;
    # Is this session read only?
    boolean read_only?;
    # Initial root path to start the user's session in.
    string root_path?;
    # Site ID
    int site_id?;
    # Is SSL required for this user?  (If so, ensure all your communications with this user use SSL.)
    boolean ssl_required?;
    # Is strong TLS disabled for this user? (If this is set to true, the site administrator has signaled that it is ok to use less secure TLS versions for this user.)
    boolean tls_disabled?;
    # If true, this user needs to add a Two Factor Authentication method before performing any further actions.
    boolean two_factor_setup_needed?;
    # Sent only if 2FA setup is needed. Is SMS two factor authentication allowed?
    boolean allowed_2fa_method_sms?;
    # Sent only if 2FA setup is needed. Is TOTP two factor authentication allowed?
    boolean allowed_2fa_method_totp?;
    # Sent only if 2FA setup is needed. Is U2F two factor authentication allowed?
    boolean allowed_2fa_method_u2f?;
    # Sent only if 2FA setup is needed. Is Yubikey two factor authentication allowed?
    boolean allowed_2fa_method_yubi?;
    # Allow the user to provide file/folder modified at dates?  If false, the server will always use the current date/time.
    boolean use_provided_modified_at?;
    # Does this user want to use Windows line-ending emulation?  (CR vs CRLF)
    boolean windows_mode_ftp?;
};

public type Body61 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

public type Body60 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

# List Sync Jobs
public type SyncJobEntity record {
    # Job enqueued at
    string queued_at?;
    # Job updated at
    string updated_at?;
    # Status of the job
    string status?;
    # Most recent reported status of sync worker
    string regional_worker_status?;
    # UUID
    string uuid?;
    # Folder behaviour ID
    int folder_behavior_id?;
};

public type Body45 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body44 record {
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body43 record {
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body138 record {
    # Allow lock to be updated by any user?
    boolean allow_access_by_any_user?;
    # Is lock exclusive?
    boolean exclusive?;
    # Does lock apply to subfolders?
    string recursive?;
    # Lock timeout length
    int timeout?;
};

public type Body42 record {
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body139 record {
    # Allow lock to be updated by any user?
    boolean allow_access_by_any_user?;
    # Is lock exclusive?
    boolean exclusive?;
    # Does lock apply to subfolders?
    string recursive?;
    # Lock timeout length
    int timeout?;
};

# List Automations
public type AutomationEntity record {
    # Automation ID
    int id?;
    # Automation type
    string automation?;
    # How this automation is triggered to run. One of: `realtime`, `daily`, `custom_schedule`, `webhook`, `email`, or `action`.
    string trigger?;
    # If trigger is `daily`, this specifies how often to run this automation.  One of: `day`, `week`, `week_end`, `month`, `month_end`, `quarter`, `quarter_end`, `year`, `year_end`
    string interval?;
    # If trigger is `custom_schedule`, Custom schedule description for when the automation should be run.
    record  { }  schedule?;
    # Source Path
    string 'source?;
    # Destination Path
    string destinations?;
    # If set, this string in the destination path will be replaced with the value in `destination_replace_to`.
    string destination_replace_from?;
    # If set, this string will replace the value `destination_replace_from` in the destination filename. You can use special patterns here.
    string destination_replace_to?;
    # Path on which this Automation runs.  Supports globs.
    string path?;
    # User ID of the Automation's creator.
    int user_id?;
    # IDs of Users for the Automation (i.e. who to Request File from)
    int[] user_ids?;
    # IDs of Groups for the Automation (i.e. who to Request File from)
    int[] group_ids?;
    # If trigger is `webhook`, this is the URL of the webhook to trigger the Automation.
    string webhook_url?;
    # If trigger is `action`, this is the list of action types on which to trigger the automation. Valid actions are create, read, update, destroy, move, copy
    string trigger_actions?;
    # If trigger is `action`, this is the path to watch for the specified trigger actions.
    string trigger_action_path?;
    # A Hash of attributes specific to the automation type.
    record  { }  value?;
};

public type Body49 record {
    # AS2 Partnership Name
    string as2_partnership_name;
};

public type Body136 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Inbox to share.
    int inbox_id;
    # Email address to share this inbox with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body48 record {
    # AS2 Partnership Name
    string as2_partnership_name;
};

public type Body137 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Inbox to share.
    int inbox_id;
    # Email address to share this inbox with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body47 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body134 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Filter results by this this action type. Valid values: `create`, `read`, `update`, `destroy`, `move`, `login`, `failedlogin`, `copy`, `user_create`, `user_update`, `user_destroy`, `group_create`, `group_update`, `group_destroy`, `permission_create`, `permission_destroy`, `api_key_create`, `api_key_update`, `api_key_destroy`
    string query_action?;
    # Filter results by this this interface type. Valid values: `web`, `ftp`, `robot`, `jsapi`, `webdesktopapi`, `sftp`, `dav`, `desktop`, `restapi`, `scim`, `office`, `mobile`
    string query_interface?;
    # Return results that are actions performed by the user indiciated by this User ID
    string query_user_id?;
    # Return results that are file actions related to the file indicated by this File ID
    string query_file_id?;
    # Return results that are file actions inside the parent folder specified by this folder ID
    string query_parent_id?;
    # Return results that are file actions related to this path.
    string query_path?;
    # Return results that are file actions related to files or folders inside this folder path.
    string query_folder?;
    # Return results that are file moves originating from this path.
    string query_src?;
    # Return results that are file moves with this path as destination.
    string query_destination?;
    # Filter results by this IP address.
    string query_ip?;
    # Filter results by this username.
    string query_username?;
    # If searching for Histories about login failures, this parameter restricts results to failures of this specific type.  Valid values: `expired_trial`, `account_overdue`, `locked_out`, `ip_mismatch`, `password_mismatch`, `site_mismatch`, `username_not_found`, `none`, `no_ftp_permission`, `no_web_permission`, `no_directory`, `errno_enoent`, `no_sftp_permission`, `no_dav_permission`, `no_restapi_permission`, `key_mismatch`, `region_mismatch`, `expired_access`, `desktop_ip_mismatch`, `desktop_api_key_not_used_quickly_enough`, `disabled`, `country_mismatch`
    string query_failure_type?;
    # If searching for Histories about specific objects (such as Users, or API Keys), this paremeter restricts results to objects that match this ID.
    string query_target_id?;
    # If searching for Histories about Users, Groups or other objects with names, this parameter restricts results to objects with this name/username.
    string query_target_name?;
    # If searching for Histories about Permisisons, this parameter restricts results to permissions of this level.
    string query_target_permission?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this user ID.
    string query_target_user_id?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this username.
    string query_target_username?;
    # If searching for Histories about API keys, this parameter restricts results to API keys associated with this platform.
    string query_target_platform?;
    # If searching for Histories about API keys, this parameter restricts results to API keys with this permission set.
    string query_target_permission_set?;
};

public type Body46 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body135 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Inbox to share.
    int inbox_id;
    # Email address to share this inbox with.
    string recipient;
    # Name of recipient.
    string name?;
    # Company of recipient.
    string company?;
    # Note to include in email.
    string note?;
    # Set to true to share the link with the recipient upon creation.
    boolean share_after_create?;
};

public type Body132 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Filter results by this this action type. Valid values: `create`, `read`, `update`, `destroy`, `move`, `login`, `failedlogin`, `copy`, `user_create`, `user_update`, `user_destroy`, `group_create`, `group_update`, `group_destroy`, `permission_create`, `permission_destroy`, `api_key_create`, `api_key_update`, `api_key_destroy`
    string query_action?;
    # Filter results by this this interface type. Valid values: `web`, `ftp`, `robot`, `jsapi`, `webdesktopapi`, `sftp`, `dav`, `desktop`, `restapi`, `scim`, `office`, `mobile`
    string query_interface?;
    # Return results that are actions performed by the user indiciated by this User ID
    string query_user_id?;
    # Return results that are file actions related to the file indicated by this File ID
    string query_file_id?;
    # Return results that are file actions inside the parent folder specified by this folder ID
    string query_parent_id?;
    # Return results that are file actions related to this path.
    string query_path?;
    # Return results that are file actions related to files or folders inside this folder path.
    string query_folder?;
    # Return results that are file moves originating from this path.
    string query_src?;
    # Return results that are file moves with this path as destination.
    string query_destination?;
    # Filter results by this IP address.
    string query_ip?;
    # Filter results by this username.
    string query_username?;
    # If searching for Histories about login failures, this parameter restricts results to failures of this specific type.  Valid values: `expired_trial`, `account_overdue`, `locked_out`, `ip_mismatch`, `password_mismatch`, `site_mismatch`, `username_not_found`, `none`, `no_ftp_permission`, `no_web_permission`, `no_directory`, `errno_enoent`, `no_sftp_permission`, `no_dav_permission`, `no_restapi_permission`, `key_mismatch`, `region_mismatch`, `expired_access`, `desktop_ip_mismatch`, `desktop_api_key_not_used_quickly_enough`, `disabled`, `country_mismatch`
    string query_failure_type?;
    # If searching for Histories about specific objects (such as Users, or API Keys), this paremeter restricts results to objects that match this ID.
    string query_target_id?;
    # If searching for Histories about Users, Groups or other objects with names, this parameter restricts results to objects with this name/username.
    string query_target_name?;
    # If searching for Histories about Permisisons, this parameter restricts results to permissions of this level.
    string query_target_permission?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this user ID.
    string query_target_user_id?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this username.
    string query_target_username?;
    # If searching for Histories about API keys, this parameter restricts results to API keys associated with this platform.
    string query_target_platform?;
    # If searching for Histories about API keys, this parameter restricts results to API keys with this permission set.
    string query_target_permission_set?;
};

public type Body133 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Filter results by this this action type. Valid values: `create`, `read`, `update`, `destroy`, `move`, `login`, `failedlogin`, `copy`, `user_create`, `user_update`, `user_destroy`, `group_create`, `group_update`, `group_destroy`, `permission_create`, `permission_destroy`, `api_key_create`, `api_key_update`, `api_key_destroy`
    string query_action?;
    # Filter results by this this interface type. Valid values: `web`, `ftp`, `robot`, `jsapi`, `webdesktopapi`, `sftp`, `dav`, `desktop`, `restapi`, `scim`, `office`, `mobile`
    string query_interface?;
    # Return results that are actions performed by the user indiciated by this User ID
    string query_user_id?;
    # Return results that are file actions related to the file indicated by this File ID
    string query_file_id?;
    # Return results that are file actions inside the parent folder specified by this folder ID
    string query_parent_id?;
    # Return results that are file actions related to this path.
    string query_path?;
    # Return results that are file actions related to files or folders inside this folder path.
    string query_folder?;
    # Return results that are file moves originating from this path.
    string query_src?;
    # Return results that are file moves with this path as destination.
    string query_destination?;
    # Filter results by this IP address.
    string query_ip?;
    # Filter results by this username.
    string query_username?;
    # If searching for Histories about login failures, this parameter restricts results to failures of this specific type.  Valid values: `expired_trial`, `account_overdue`, `locked_out`, `ip_mismatch`, `password_mismatch`, `site_mismatch`, `username_not_found`, `none`, `no_ftp_permission`, `no_web_permission`, `no_directory`, `errno_enoent`, `no_sftp_permission`, `no_dav_permission`, `no_restapi_permission`, `key_mismatch`, `region_mismatch`, `expired_access`, `desktop_ip_mismatch`, `desktop_api_key_not_used_quickly_enough`, `disabled`, `country_mismatch`
    string query_failure_type?;
    # If searching for Histories about specific objects (such as Users, or API Keys), this paremeter restricts results to objects that match this ID.
    string query_target_id?;
    # If searching for Histories about Users, Groups or other objects with names, this parameter restricts results to objects with this name/username.
    string query_target_name?;
    # If searching for Histories about Permisisons, this parameter restricts results to permissions of this level.
    string query_target_permission?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this user ID.
    string query_target_user_id?;
    # If searching for Histories about API keys, this parameter restricts results to API keys created by/for this username.
    string query_target_username?;
    # If searching for Histories about API keys, this parameter restricts results to API keys associated with this platform.
    string query_target_platform?;
    # If searching for Histories about API keys, this parameter restricts results to API keys with this permission set.
    string query_target_permission_set?;
};

public type Body130 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body131 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body52 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

# List Projects
public type ProjectEntity record {
    # Project ID
    int id?;
    # Global access settings
    string global_access?;
};

public type Body51 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body50 record {
    # AS2 Partnership Name
    string as2_partnership_name;
};

public type Body39 record {
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

# List Action Notification Export Results
public type ActionNotificationExportResultEntity record {
    # Notification ID
    int id?;
    # When the notification was sent.
    int created_at?;
    # HTTP status code returned in the webhook response.
    int status?;
    # A message indicating the overall status of the webhook notification.
    string message?;
    # `true` if the webhook succeeded by receiving a 200 or 204 response.
    boolean success?;
    # A JSON-encoded string with headers that were sent with the webhook.
    string request_headers?;
    # The HTTP verb used to perform the webhook.
    string request_method?;
    # The webhook request URL.
    string request_url?;
    # The path to the actual file that triggered this notification.
    string path?;
    # The folder associated with the triggering action for this notification.
    string folder?;
};

# Form fields
public type FormFieldEntity record {
    # Form field id
    int id?;
    # Label to be displayed
    string label?;
    # Is this a required field?
    boolean required?;
    # Help text to be displayed
    string help_text?;
    # Type of Field
    string field_type?;
    # Options to display for radio and dropdown
    string options_for_select?;
    # Default option for radio and dropdown
    string default_option?;
    # Form field set id
    int form_field_set_id?;
};

public type PatchformfieldsetsFormFields record {
    # Id of existing Form Field
    int id?;
    # Label of Field
    string label?;
    # Type of field: text, text_area, dropdown, or radio
    string field_type?;
    # Help text of field
    string help_text?;
    # Is this a required field? (default true)
    boolean required?;
    # List of options for dropdown or radio
    string options_for_select?;
    # Default option to be preselected in the dropdown or radio.
    string default_option?;
};

# List Api Keys
public type ApiKeyEntity record {
    # API Key ID
    int id?;
    # Unique label that describes this API key.  Useful for external systems where you may have API keys from multiple accounts and want a human-readable label for each key.
    string descriptive_label?;
    # Time which API Key was created
    string created_at?;
    # API Key expiration date
    string expires_at?;
    # API Key actual key string
    string 'key?;
    # API Key last used - note this value is only updated once per 3 hour period, so the 'actual' time of last use may be up to 3 hours later than this timestamp.
    string last_use_at?;
    # Internal name for the API Key.  For your use.
    string name?;
    # Folder path restriction for this api key.
    string path?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # If this API key represents a Desktop app, what platform was it created on?
    string platform?;
    # User ID for the owner of this API Key.  May be blank for Site-wide API Keys.
    int user_id?;
};

# Show Style
public type StyleEntity record {
    # Style ID
    int id?;
    # Folder path
    string path?;
    # Image entity
    ImageEntity logo?;
    # Image entity
    ImageEntity thumbnail?;
};

public type Body34 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body129 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body33 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body32 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body127 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body31 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body128 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body38 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body125 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

# List Inbox Registrations
public type InboxRegistrationEntity record {
    # Registration cookie code
    string code?;
    # Registrant name
    string name?;
    # Registrant company name
    string company?;
    # Registrant email address
    string email?;
    # Clickwrap text that was shown to the registrant
    string clickwrap_body?;
    # Id of associated form field set
    int form_field_set_id?;
    # Data for form field set with form field ids as keys and user data as values
    string form_field_data?;
};

public type Body37 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body126 record {
    # Group ID to add user to.
    int group_id;
    # User ID to add to group.
    int user_id;
    # Is the user a group administrator?
    boolean admin?;
};

public type Body36 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body123 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

public type Body35 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body124 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

public type Body121 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

public type Body122 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

public type Body120 record {
    # Group name.
    string name?;
    # Group notes.
    string notes?;
    # A list of user ids. If sent as a string, should be comma-delimited.
    string user_ids?;
    # A list of group admin user ids. If sent as a string, should be comma-delimited.
    string admin_ids?;
};

public type Body41 record {
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body40 record {
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

# Create Bundle
public type BundleEntity record {
    # Bundle code.  This code forms the end part of the Public URL.
    string code?;
    # Public URL of Share Link
    string url?;
    # Public description
    string description?;
    # Is this bundle password protected?
    boolean password_protected?;
    # Restrict users to previewing files only?
    boolean preview_only?;
    # Show a registration page that captures the downloader's name and email address?
    boolean require_registration?;
    # Only allow access to recipients who have explicitly received the share via an email sent through the Files.com UI?
    boolean require_share_recipient?;
    # Legal text that must be agreed to prior to accessing Bundle.
    string clickwrap_body?;
    # Create Form Field Set
    FormFieldSetEntity form_field_set?;
    # Bundle ID
    int id?;
    # Bundle created at date/time
    string created_at?;
    # Bundle expiration date/time
    string expires_at?;
    # Maximum number of times bundle can be accessed
    int max_uses?;
    # Bundle internal note
    string note?;
    # Bundle creator user ID
    int user_id?;
    # Bundle creator username
    string username?;
    # ID of the clickwrap to use with this bundle.
    int clickwrap_id?;
    # ID of the associated inbox, if available.
    int inbox_id?;
    # Does this bundle have an associated inbox?
    boolean has_inbox?;
    # A list of paths in this bundle
    string[] paths?;
};

# List Groups
public type GroupEntity record {
    # Group ID
    int id?;
    # Group name
    string name?;
    # List of user IDs who are group administrators (separated by commas)
    string admin_ids?;
    # Notes about this group
    string notes?;
    # List of user IDs who belong to this group (separated by commas)
    int[] user_ids?;
    # List of usernames who belong to this group (separated by commas)
    string[] usernames?;
};

# Auto fields.
public type AutoEntity record {
    # Dynamic properties
    record  { }  dynamic?;
};

public type Body8 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body9 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

# List Folders by path
public type FileEntity record {
    # File/Folder path
    string path?;
    # File/Folder display name
    string display_name?;
    # Type: `directory` or `file`.
    string 'type?;
    # File/Folder size
    int size?;
    # File last modified date/time, according to the server.  This is the timestamp of the last Files.com operation of the file, regardless of what modified timestamp was sent.
    string mtime?;
    # File last modified date/time, according to the client who set it.  Files.com allows desktop, FTP, SFTP, and WebDAV clients to set modified at times.  This allows Desktop<->Cloud syncing to preserve modified at times.
    string provided_mtime?;
    # File CRC32 checksum. This is sometimes delayed, so if you get a blank response, wait and try again.
    string crc32?;
    # File MD5 checksum. This is sometimes delayed, so if you get a blank response, wait and try again.
    string md5?;
    # MIME Type.  This is determined by the filename extension and is not stored separately internally.
    string mime_type?;
    # Region location
    string region?;
    # A short string representing the current user's permissions.  Can be `r`,`w`,`p`, or any combination
    string permissions?;
    # Are subfolders locked and unable to be modified?
    boolean subfolders_locked?;
    # Link to download file. Provided only in response to a download request.
    string download_uri?;
    # Bookmark/priority color of file/folder
    string priority_color?;
    # File preview ID
    int preview_id?;
    # File preview
    PreviewEntity preview?;
};

public type Body6 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body29 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body7 record {
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body28 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body4 record {
    # API Key expiration date
    string expires_at?;
    # Internal name for the API Key.  For your use.
    string name?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body5 record {
    # API Key expiration date
    string expires_at?;
    # Internal name for the API Key.  For your use.
    string name?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body2 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Error message associated with the request, if any.
    string query_message?;
    # The HTTP request method used by the webhook.
    string query_request_method?;
    # The target webhook URL.
    string query_request_url?;
    # The HTTP status returned from the server in response to the webhook request.
    string query_status?;
    # true if the webhook request succeeded (i.e. returned a 200 or 204 response status). false otherwise.
    boolean query_success?;
    # Return notifications that were triggered by actions on this specific path.
    string query_path?;
    # Return notifications that were triggered by actions in this folder.
    string query_folder?;
};

public type Body3 record {
    # API Key expiration date
    string expires_at?;
    # Internal name for the API Key.  For your use.
    string name?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
};

public type Body23 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body118 record {
    # Is the user a group administrator?
    boolean admin?;
};

public type Body22 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body119 record {
    # Is the user a group administrator?
    boolean admin?;
};

public type Body21 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # Group ID to associate this user with.
    int group_id?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body116 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body20 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body117 record {
    # Is the user a group administrator?
    boolean admin?;
};

public type Body27 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # AS2 Partnership Name
    string as2_partnership_name;
    # Actual contents of Public key.
    string public_key;
};

public type Body114 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

# Update Form Field Set
public type PatchFormFieldSets record {
    # Title to be displayed
    string title?;
    # Skip validating form email
    boolean skip_email?;
    # Skip validating form name
    boolean skip_name?;
    # Skip validating company
    boolean skip_company?;
    # Form fields
    PatchformfieldsetsFormFields[] form_fields?;
};

public type Body26 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body115 record {
    # An image file for your user avatar.
    string avatar_file?;
    # If true, the avatar will be deleted.
    boolean avatar_delete?;
    # Used for changing a password on an existing user.
    string change_password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `change_password`.
    string change_password_confirmation?;
    # User's email.
    string email?;
    # Permission to grant on the user root.  Can be blank or `full`, `read`, `write`, `list`, or `history`.
    string grant_permission?;
    # A list of group ids to associate this user with.  Comma delimited.
    string group_ids?;
    # Pre-calculated hash of the user's password.
    string imported_password_hash?;
    # User password.
    string password?;
    # Optional, but if provided, we will ensure that it matches the value sent in `password`.
    string password_confirmation?;
    # Signifies that the user has read all the announcements in the UI.
    boolean announcements_read?;
    # A list of allowed IPs if applicable.  Newline delimited
    string allowed_ips?;
    # DEPRECATED: Can the user create Bundles (aka Share Links)? Use the bundle permission instead.
    boolean attachments_permission?;
    # Scheduled Date/Time at which user will be deactivated
    string authenticate_until?;
    # How is this user authenticated?
    string authentication_method?;
    # Allow this user to perform operations on the account, payments, and invoices?
    boolean billing_permission?;
    # Exempt this user from being disabled based on inactivity?
    boolean bypass_inactive_disable?;
    # Allow this user to skip site-wide IP blacklists?
    boolean bypass_site_allowed_ips?;
    # Can the user connect with WebDAV?
    boolean dav_permission?;
    # Is user disabled? Disabled users cannot log in, and do not count for billing purposes.  Users can be automatically disabled after an inactivity period via a Site setting.
    boolean disabled?;
    # Can the user access with FTP/FTPS?
    boolean ftp_permission?;
    # Text to display to the user in the header of the UI
    string header_text?;
    # Preferred language
    string language?;
    # Hour of the day at which daily notifications should be sent. Can be in range 0 to 23
    int notification_daily_send_time?;
    # User's full name
    string name?;
    # User's company
    string company?;
    # Any internal notes on the user
    string notes?;
    # Enable integration with Office for the web?
    boolean office_integration_enabled?;
    # Number of days to allow user to use the same password
    int password_validity_days?;
    # Should the user receive admin alerts such a certificate expiration notifications and overages?
    boolean receive_admin_alerts?;
    # Is a password change required upon next user login?
    boolean require_password_change?;
    # Can this user access the REST API?
    boolean restapi_permission?;
    # Does this user manage it's own credentials or is it a shared/bot user?
    boolean self_managed?;
    # Can the user access with SFTP?
    boolean sftp_permission?;
    # Is the user an administrator for this site?
    boolean site_admin?;
    # Skip Welcome page in the UI?
    boolean skip_welcome_screen?;
    # SSL required setting
    string ssl_required?;
    # SSO (Single Sign On) strategy ID for the user, if applicable.
    int sso_strategy_id?;
    # Is the user subscribed to the newsletter?
    boolean subscribe_to_newsletter?;
    # 2FA required setting
    string require_2fa?;
    # User time zone
    string time_zone?;
    # Root folder for FTP (and optionally SFTP if the appropriate site-wide setting is set.)  Note that this is not used for API, Desktop, or Web interface.
    string user_root?;
    # User's username
    string username?;
};

public type Body25 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body112 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # ID of file comment to attach reaction to.
    int file_comment_id;
    # Emoji to react with.
    string emoji;
};

public type Body24 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body113 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # ID of file comment to attach reaction to.
    int file_comment_id;
    # Emoji to react with.
    string emoji;
};

public type Body110 record {
    # Comment body.
    string body;
    # File path.
    string path;
};

public type Body111 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # ID of file comment to attach reaction to.
    int file_comment_id;
    # Emoji to react with.
    string emoji;
};

public type Body30 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

# Create User Request
public type UserRequestEntity record {
    # ID
    int id?;
    # User's full name
    string name?;
    # User email address
    string email?;
    # Details of the user's request
    string details?;
};

# List Sso Strategies
public type SsoStrategyEntity record {
    # SSO Protocol
    string protocol?;
    # Provider name
    string provider?;
    # Custom label for the SSO provider on the login page.
    string label?;
    # URL holding a custom logo for the SSO provider on the login page.
    string logo_url?;
    # ID
    int id?;
    # Identity provider sha256 cert fingerprint if saml_provider_metadata_url is not available.
    string saml_provider_cert_fingerprint?;
    # Identity provider issuer url
    string saml_provider_issuer_url?;
    # Custom identity provider metadata
    string saml_provider_metadata_content?;
    # Metadata URL for the SAML identity provider
    string saml_provider_metadata_url?;
    # Identity provider SLO endpoint
    string saml_provider_slo_target_url?;
    # Identity provider SSO endpoint if saml_provider_metadata_url is not available.
    string saml_provider_sso_target_url?;
    # SCIM authentication type.
    string scim_authentication_method?;
    # SCIM username.
    string scim_username?;
    # SCIM OAuth Access Token.
    string scim_oauth_access_token?;
    # SCIM OAuth Access Token Expiration Time.
    string scim_oauth_access_token_expires_at?;
    # Subdomain
    string subdomain?;
    # Auto-provision users?
    boolean provision_users?;
    # Auto-provision group membership based on group memberships on the SSO side?
    boolean provision_groups?;
    # Auto-deprovision users?
    boolean deprovision_users?;
    # Auto-deprovision group membership based on group memberships on the SSO side?
    boolean deprovision_groups?;
    # Method used for deprovisioning users.
    string deprovision_behavior?;
    # Comma-separated list of group names for groups to automatically add all auto-provisioned users to.
    string provision_group_default?;
    # Comma-separated list of group names for groups (with optional wildcards) that will be excluded from auto-provisioning.
    string provision_group_exclusion?;
    # Comma-separated list of group names for groups (with optional wildcards) that will be auto-provisioned.
    string provision_group_inclusion?;
    # Comma or newline separated list of group names (with optional wildcards) to require membership for user provisioning.
    string provision_group_required?;
    # Comma-separated list of group names whose members will be created with email_signup authentication.
    string provision_email_signup_groups?;
    # Comma-separated list of group names whose members will be created as Site Admins.
    string provision_site_admin_groups?;
    # DEPRECATED: Auto-provisioned users get Sharing permission. Use a Group with the Bundle permission instead.
    boolean provision_attachments_permission?;
    # Auto-provisioned users get WebDAV permission?
    boolean provision_dav_permission?;
    # Auto-provisioned users get FTP permission?
    boolean provision_ftp_permission?;
    # Auto-provisioned users get SFTP permission?
    boolean provision_sftp_permission?;
    # Default time zone for auto provisioned users.
    string provision_time_zone?;
    # Default company for auto provisioned users.
    string provision_company?;
    # Base DN for looking up users in LDAP server
    string ldap_base_dn?;
    # Domain name that will be appended to LDAP usernames
    string ldap_domain?;
    # Is strategy enabled?
    boolean enabled?;
    # LDAP host
    string ldap_host?;
    # LDAP backup host
    string ldap_host_2?;
    # LDAP backup host
    string ldap_host_3?;
    # LDAP port
    int ldap_port?;
    # Use secure LDAP?
    boolean ldap_secure?;
    # Username for signing in to LDAP server.
    string ldap_username?;
    # LDAP username field
    string ldap_username_field?;
};

public type Body1 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Error message associated with the request, if any.
    string query_message?;
    # The HTTP request method used by the webhook.
    string query_request_method?;
    # The target webhook URL.
    string query_request_url?;
    # The HTTP status returned from the server in response to the webhook request.
    string query_status?;
    # true if the webhook request succeeded (i.e. returned a 200 or 204 response status). false otherwise.
    boolean query_success?;
    # Return notifications that were triggered by actions on this specific path.
    string query_path?;
    # Return notifications that were triggered by actions in this folder.
    string query_folder?;
};

# Error fields.
public type ErrorsEntity record {
    # A list of fields where errors occur
    string[] fields?;
    # A list of error messages
    string[] messages?;
};

public type Body19 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body18 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

# List File Comments by path
public type FileCommentEntity record {
    # File Comment ID
    int id?;
    # Comment body.
    string body?;
    # Create File Comment Reaction
    FileCommentReactionEntity reactions?;
};

public type Body17 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

public type Body12 record {
    # Site name
    string name?;
    # Site subdomain
    string subdomain?;
    # Custom domain
    string domain?;
    # Main email for this site
    string email?;
    # Reply-to email for this site
    string reply_to_email?;
    # Are manual Bundle names allowed?
    boolean allow_bundle_names?;
    # Site-wide Bundle expiration in days
    int bundle_expiration?;
    # Notify site email of overages?
    boolean overage_notify?;
    # Will the welcome email be sent to new users?
    boolean welcome_email_enabled?;
    # If false, rename conflicting files instead of asking for overwrite confirmation.  Only applies to web interface.
    boolean ask_about_overwrites?;
    # Show request access link for users without access?  Currently unused.
    boolean show_request_access_link?;
    # Include this email in welcome emails if enabled
    string welcome_email_cc?;
    # Custom text send in user welcome email
    string welcome_custom_text?;
    # Site default language
    string language?;
    # Does FTP user Windows emulation mode?
    boolean windows_mode_ftp?;
    # Site default time zone
    string default_time_zone?;
    # Is the desktop app enabled?
    boolean desktop_app?;
    # Is desktop app session IP pinning enabled?
    boolean desktop_app_session_ip_pinning?;
    # Desktop app session lifetime (in hours)
    int desktop_app_session_lifetime?;
    # Is the mobile app enabled?
    boolean mobile_app?;
    # Is mobile app session IP pinning enabled?
    boolean mobile_app_session_ip_pinning?;
    # Mobile app session lifetime (in hours)
    int mobile_app_session_lifetime?;
    # If true, permissions for this site must be bound to a group (not a user). Otherwise, permissions must be bound to a user.
    boolean folder_permissions_groups_only?;
    # Does the welcome screen appear?
    string welcome_screen?;
    # Allow users to use Office for the web?
    boolean office_integration_available?;
    # Session expiry in hours
    float session_expiry?;
    # Is SSL required?  Disabling this is insecure.
    boolean ssl_required?;
    # Is TLS disabled(site setting)?
    boolean tls_disabled?;
    # Will users be locked out after incorrect login attempts?
    boolean user_lockout?;
    # Number of login tries within `user_lockout_within` hours before users are locked out
    int user_lockout_tries?;
    # Number of hours for user lockout window
    int user_lockout_within?;
    # How many hours to lock user out for failed password?
    int user_lockout_lock_period?;
    # Include password in emails to new users?
    boolean include_password_in_welcome_email?;
    # Comma seperated list of allowed Country codes
    string allowed_countries?;
    # List of allowed IP addresses
    string allowed_ips?;
    # Comma seperated list of disallowed Country codes
    string disallowed_countries?;
    # Number of days to keep deleted files
    int days_to_retain_backups?;
    # Number of prior passwords to disallow
    int max_prior_passwords?;
    # Number of days password is valid
    int password_validity_days?;
    # Shortest password length for users
    int password_min_length?;
    # Require a letter in passwords?
    boolean password_require_letter?;
    # Require lower and upper case letters in passwords?
    boolean password_require_mixed?;
    # Require special characters in password?
    boolean password_require_special?;
    # Require a number in passwords?
    boolean password_require_number?;
    # Require passwords that have not been previously breached? (see https://haveibeenpwned.com/)
    boolean password_require_unbreached?;
    # Use user FTP roots also for SFTP?
    boolean sftp_user_root_enabled?;
    # Is password reset disabled?
    boolean disable_password_reset?;
    # Are files protected from modification?
    boolean immutable_files?;
    # Are sessions locked to the same IP? (i.e. do users need to log in again if they change IPs?)
    boolean session_pinned_by_ip?;
    # Do Bundles require password protection?
    boolean bundle_password_required?;
    # Do Bundles require recipients for sharing?
    boolean bundle_require_share_recipient?;
    # Require bundles' passwords, and passwords for other items (inboxes, public shares, etc.) to conform to the same requirements as users' passwords?
    boolean password_requirements_apply_to_bundles?;
    # Use servers in the USA only?
    boolean opt_out_global?;
    # Allow uploaders to set `provided_modified_at` for uploaded files?
    boolean use_provided_modified_at?;
    # Is this site using a custom namespace for users?
    boolean custom_namespace?;
    # If greater than zero, users will unable to login if they do not show activity within this number of days.
    int disable_users_from_inactivity_period_days?;
    # If true, groups can be manually created / modified / deleted by Site Admins. Otherwise, groups can only be managed via your SSO provider.
    boolean non_sso_groups_allowed?;
    # If true, users can be manually created / modified / deleted by Site Admins. Otherwise, users can only be managed via your SSO provider.
    boolean non_sso_users_allowed?;
    # Allow bundle creation
    boolean sharing_enabled?;
    # Enable User Requests feature
    boolean user_requests_enabled?;
    # Is SMS two factor authentication allowed?
    boolean allowed_2fa_method_sms?;
    # Is U2F two factor authentication allowed?
    boolean allowed_2fa_method_u2f?;
    # Is TOTP two factor authentication allowed?
    boolean allowed_2fa_method_totp?;
    # Is yubikey two factor authentication allowed?
    boolean allowed_2fa_method_yubi?;
    # Require two-factor authentication for all users?
    boolean require_2fa?;
    # What type of user is required to use two-factor authentication (when require_2fa is set to `true` for this site)?
    string require_2fa_user_type?;
    # Top bar background color
    string color2_top?;
    # Page link and button color
    string color2_left?;
    # Top bar link color
    string color2_link?;
    # Page link and button color
    string color2_text?;
    # Top bar text color
    string color2_top_text?;
    # Custom site header text
    string site_header?;
    # Custom site footer text
    string site_footer?;
    # Login help text
    string login_help_text?;
    # SMTP server hostname or IP
    string smtp_address?;
    # SMTP server authentication type
    string smtp_authentication?;
    # From address to use when mailing through custom SMTP
    string smtp_from?;
    # SMTP server username
    string smtp_username?;
    # SMTP server port
    int smtp_port?;
    # Main LDAP setting: is LDAP enabled?
    boolean ldap_enabled?;
    # LDAP type
    string ldap_type?;
    # LDAP host
    string ldap_host?;
    # LDAP backup host
    string ldap_host_2?;
    # LDAP backup host
    string ldap_host_3?;
    # LDAP port
    int ldap_port?;
    # Use secure LDAP?
    boolean ldap_secure?;
    # Username for signing in to LDAP server.
    string ldap_username?;
    # LDAP username field
    string ldap_username_field?;
    # Domain name that will be appended to usernames
    string ldap_domain?;
    # Should we sync users from LDAP server?
    string ldap_user_action?;
    # Should we sync groups from LDAP server?
    string ldap_group_action?;
    # Comma or newline separated list of group names (with optional wildcards) - if provided, only users in these groups will be added or synced.
    string ldap_user_include_groups?;
    # Comma or newline separated list of group names (with optional wildcards) to exclude when syncing.
    string ldap_group_exclusion?;
    # Comma or newline separated list of group names (with optional wildcards) to include when syncing.
    string ldap_group_inclusion?;
    # Base DN for looking up users in LDAP server
    string ldap_base_dn?;
    string icon16_file?;
    # If true, will delete the file stored in icon16
    boolean icon16_delete?;
    string icon32_file?;
    # If true, will delete the file stored in icon32
    boolean icon32_delete?;
    string icon48_file?;
    # If true, will delete the file stored in icon48
    boolean icon48_delete?;
    string icon128_file?;
    # If true, will delete the file stored in icon128
    boolean icon128_delete?;
    string logo_file?;
    # If true, will delete the file stored in logo
    boolean logo_delete?;
    # If set to true, we will begin the process of disabling 2FA on this site.
    boolean disable_2fa_with_delay?;
    # New LDAP password.
    string ldap_password_change?;
    # Confirm new LDAP password.
    string ldap_password_change_confirmation?;
    # Password for SMTP server.
    string smtp_password?;
};

public type Body11 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body10 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal name for the API Key.  For your use.
    string name?;
    # API Key expiration date
    string expires_at?;
    # Permissions for this API Key.  Keys with the `desktop_app` permission set only have the ability to do the functions provided in our Desktop App (File and Share Link operations).  Additional permission sets may become available in the future, such as for a Site Admin to give a key with no administrator privileges.  If you have ideas for permission sets, please let us know.
    string permission_set?;
    # Folder path restriction for this api key.
    string path?;
};

public type Body16 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

public type Body15 record {
    # URL for testing the webhook.
    string url;
    # HTTP method(GET or POST).
    string method?;
    # HTTP encoding method.  Can be JSON, XML, or RAW (form data).
    string encoding?;
    # Additional request headers.
    record {} headers?;
    # Additional body parameters.
    record {} body?;
    # action for test body
    string action?;
};

public type Body14 record {
    # Site name
    string name?;
    # Site subdomain
    string subdomain?;
    # Custom domain
    string domain?;
    # Main email for this site
    string email?;
    # Reply-to email for this site
    string reply_to_email?;
    # Are manual Bundle names allowed?
    boolean allow_bundle_names?;
    # Site-wide Bundle expiration in days
    int bundle_expiration?;
    # Notify site email of overages?
    boolean overage_notify?;
    # Will the welcome email be sent to new users?
    boolean welcome_email_enabled?;
    # If false, rename conflicting files instead of asking for overwrite confirmation.  Only applies to web interface.
    boolean ask_about_overwrites?;
    # Show request access link for users without access?  Currently unused.
    boolean show_request_access_link?;
    # Include this email in welcome emails if enabled
    string welcome_email_cc?;
    # Custom text send in user welcome email
    string welcome_custom_text?;
    # Site default language
    string language?;
    # Does FTP user Windows emulation mode?
    boolean windows_mode_ftp?;
    # Site default time zone
    string default_time_zone?;
    # Is the desktop app enabled?
    boolean desktop_app?;
    # Is desktop app session IP pinning enabled?
    boolean desktop_app_session_ip_pinning?;
    # Desktop app session lifetime (in hours)
    int desktop_app_session_lifetime?;
    # Is the mobile app enabled?
    boolean mobile_app?;
    # Is mobile app session IP pinning enabled?
    boolean mobile_app_session_ip_pinning?;
    # Mobile app session lifetime (in hours)
    int mobile_app_session_lifetime?;
    # If true, permissions for this site must be bound to a group (not a user). Otherwise, permissions must be bound to a user.
    boolean folder_permissions_groups_only?;
    # Does the welcome screen appear?
    string welcome_screen?;
    # Allow users to use Office for the web?
    boolean office_integration_available?;
    # Session expiry in hours
    float session_expiry?;
    # Is SSL required?  Disabling this is insecure.
    boolean ssl_required?;
    # Is TLS disabled(site setting)?
    boolean tls_disabled?;
    # Will users be locked out after incorrect login attempts?
    boolean user_lockout?;
    # Number of login tries within `user_lockout_within` hours before users are locked out
    int user_lockout_tries?;
    # Number of hours for user lockout window
    int user_lockout_within?;
    # How many hours to lock user out for failed password?
    int user_lockout_lock_period?;
    # Include password in emails to new users?
    boolean include_password_in_welcome_email?;
    # Comma seperated list of allowed Country codes
    string allowed_countries?;
    # List of allowed IP addresses
    string allowed_ips?;
    # Comma seperated list of disallowed Country codes
    string disallowed_countries?;
    # Number of days to keep deleted files
    int days_to_retain_backups?;
    # Number of prior passwords to disallow
    int max_prior_passwords?;
    # Number of days password is valid
    int password_validity_days?;
    # Shortest password length for users
    int password_min_length?;
    # Require a letter in passwords?
    boolean password_require_letter?;
    # Require lower and upper case letters in passwords?
    boolean password_require_mixed?;
    # Require special characters in password?
    boolean password_require_special?;
    # Require a number in passwords?
    boolean password_require_number?;
    # Require passwords that have not been previously breached? (see https://haveibeenpwned.com/)
    boolean password_require_unbreached?;
    # Use user FTP roots also for SFTP?
    boolean sftp_user_root_enabled?;
    # Is password reset disabled?
    boolean disable_password_reset?;
    # Are files protected from modification?
    boolean immutable_files?;
    # Are sessions locked to the same IP? (i.e. do users need to log in again if they change IPs?)
    boolean session_pinned_by_ip?;
    # Do Bundles require password protection?
    boolean bundle_password_required?;
    # Do Bundles require recipients for sharing?
    boolean bundle_require_share_recipient?;
    # Require bundles' passwords, and passwords for other items (inboxes, public shares, etc.) to conform to the same requirements as users' passwords?
    boolean password_requirements_apply_to_bundles?;
    # Use servers in the USA only?
    boolean opt_out_global?;
    # Allow uploaders to set `provided_modified_at` for uploaded files?
    boolean use_provided_modified_at?;
    # Is this site using a custom namespace for users?
    boolean custom_namespace?;
    # If greater than zero, users will unable to login if they do not show activity within this number of days.
    int disable_users_from_inactivity_period_days?;
    # If true, groups can be manually created / modified / deleted by Site Admins. Otherwise, groups can only be managed via your SSO provider.
    boolean non_sso_groups_allowed?;
    # If true, users can be manually created / modified / deleted by Site Admins. Otherwise, users can only be managed via your SSO provider.
    boolean non_sso_users_allowed?;
    # Allow bundle creation
    boolean sharing_enabled?;
    # Enable User Requests feature
    boolean user_requests_enabled?;
    # Is SMS two factor authentication allowed?
    boolean allowed_2fa_method_sms?;
    # Is U2F two factor authentication allowed?
    boolean allowed_2fa_method_u2f?;
    # Is TOTP two factor authentication allowed?
    boolean allowed_2fa_method_totp?;
    # Is yubikey two factor authentication allowed?
    boolean allowed_2fa_method_yubi?;
    # Require two-factor authentication for all users?
    boolean require_2fa?;
    # What type of user is required to use two-factor authentication (when require_2fa is set to `true` for this site)?
    string require_2fa_user_type?;
    # Top bar background color
    string color2_top?;
    # Page link and button color
    string color2_left?;
    # Top bar link color
    string color2_link?;
    # Page link and button color
    string color2_text?;
    # Top bar text color
    string color2_top_text?;
    # Custom site header text
    string site_header?;
    # Custom site footer text
    string site_footer?;
    # Login help text
    string login_help_text?;
    # SMTP server hostname or IP
    string smtp_address?;
    # SMTP server authentication type
    string smtp_authentication?;
    # From address to use when mailing through custom SMTP
    string smtp_from?;
    # SMTP server username
    string smtp_username?;
    # SMTP server port
    int smtp_port?;
    # Main LDAP setting: is LDAP enabled?
    boolean ldap_enabled?;
    # LDAP type
    string ldap_type?;
    # LDAP host
    string ldap_host?;
    # LDAP backup host
    string ldap_host_2?;
    # LDAP backup host
    string ldap_host_3?;
    # LDAP port
    int ldap_port?;
    # Use secure LDAP?
    boolean ldap_secure?;
    # Username for signing in to LDAP server.
    string ldap_username?;
    # LDAP username field
    string ldap_username_field?;
    # Domain name that will be appended to usernames
    string ldap_domain?;
    # Should we sync users from LDAP server?
    string ldap_user_action?;
    # Should we sync groups from LDAP server?
    string ldap_group_action?;
    # Comma or newline separated list of group names (with optional wildcards) - if provided, only users in these groups will be added or synced.
    string ldap_user_include_groups?;
    # Comma or newline separated list of group names (with optional wildcards) to exclude when syncing.
    string ldap_group_exclusion?;
    # Comma or newline separated list of group names (with optional wildcards) to include when syncing.
    string ldap_group_inclusion?;
    # Base DN for looking up users in LDAP server
    string ldap_base_dn?;
    string icon16_file?;
    # If true, will delete the file stored in icon16
    boolean icon16_delete?;
    string icon32_file?;
    # If true, will delete the file stored in icon32
    boolean icon32_delete?;
    string icon48_file?;
    # If true, will delete the file stored in icon48
    boolean icon48_delete?;
    string icon128_file?;
    # If true, will delete the file stored in icon128
    boolean icon128_delete?;
    string logo_file?;
    # If true, will delete the file stored in logo
    boolean logo_delete?;
    # If set to true, we will begin the process of disabling 2FA on this site.
    boolean disable_2fa_with_delay?;
    # New LDAP password.
    string ldap_password_change?;
    # Confirm new LDAP password.
    string ldap_password_change_confirmation?;
    # Password for SMTP server.
    string smtp_password?;
};

public type Body189 record {
    # Username to sign in as
    string username?;
    # Password for sign in
    string password?;
    # If this user has a 2FA device, provide its OTP or code here.
    string otp?;
    # Identifier for a partially-completed login
    string partial_session_id?;
};

public type Body13 record {
    # Site name
    string name?;
    # Site subdomain
    string subdomain?;
    # Custom domain
    string domain?;
    # Main email for this site
    string email?;
    # Reply-to email for this site
    string reply_to_email?;
    # Are manual Bundle names allowed?
    boolean allow_bundle_names?;
    # Site-wide Bundle expiration in days
    int bundle_expiration?;
    # Notify site email of overages?
    boolean overage_notify?;
    # Will the welcome email be sent to new users?
    boolean welcome_email_enabled?;
    # If false, rename conflicting files instead of asking for overwrite confirmation.  Only applies to web interface.
    boolean ask_about_overwrites?;
    # Show request access link for users without access?  Currently unused.
    boolean show_request_access_link?;
    # Include this email in welcome emails if enabled
    string welcome_email_cc?;
    # Custom text send in user welcome email
    string welcome_custom_text?;
    # Site default language
    string language?;
    # Does FTP user Windows emulation mode?
    boolean windows_mode_ftp?;
    # Site default time zone
    string default_time_zone?;
    # Is the desktop app enabled?
    boolean desktop_app?;
    # Is desktop app session IP pinning enabled?
    boolean desktop_app_session_ip_pinning?;
    # Desktop app session lifetime (in hours)
    int desktop_app_session_lifetime?;
    # Is the mobile app enabled?
    boolean mobile_app?;
    # Is mobile app session IP pinning enabled?
    boolean mobile_app_session_ip_pinning?;
    # Mobile app session lifetime (in hours)
    int mobile_app_session_lifetime?;
    # If true, permissions for this site must be bound to a group (not a user). Otherwise, permissions must be bound to a user.
    boolean folder_permissions_groups_only?;
    # Does the welcome screen appear?
    string welcome_screen?;
    # Allow users to use Office for the web?
    boolean office_integration_available?;
    # Session expiry in hours
    float session_expiry?;
    # Is SSL required?  Disabling this is insecure.
    boolean ssl_required?;
    # Is TLS disabled(site setting)?
    boolean tls_disabled?;
    # Will users be locked out after incorrect login attempts?
    boolean user_lockout?;
    # Number of login tries within `user_lockout_within` hours before users are locked out
    int user_lockout_tries?;
    # Number of hours for user lockout window
    int user_lockout_within?;
    # How many hours to lock user out for failed password?
    int user_lockout_lock_period?;
    # Include password in emails to new users?
    boolean include_password_in_welcome_email?;
    # Comma seperated list of allowed Country codes
    string allowed_countries?;
    # List of allowed IP addresses
    string allowed_ips?;
    # Comma seperated list of disallowed Country codes
    string disallowed_countries?;
    # Number of days to keep deleted files
    int days_to_retain_backups?;
    # Number of prior passwords to disallow
    int max_prior_passwords?;
    # Number of days password is valid
    int password_validity_days?;
    # Shortest password length for users
    int password_min_length?;
    # Require a letter in passwords?
    boolean password_require_letter?;
    # Require lower and upper case letters in passwords?
    boolean password_require_mixed?;
    # Require special characters in password?
    boolean password_require_special?;
    # Require a number in passwords?
    boolean password_require_number?;
    # Require passwords that have not been previously breached? (see https://haveibeenpwned.com/)
    boolean password_require_unbreached?;
    # Use user FTP roots also for SFTP?
    boolean sftp_user_root_enabled?;
    # Is password reset disabled?
    boolean disable_password_reset?;
    # Are files protected from modification?
    boolean immutable_files?;
    # Are sessions locked to the same IP? (i.e. do users need to log in again if they change IPs?)
    boolean session_pinned_by_ip?;
    # Do Bundles require password protection?
    boolean bundle_password_required?;
    # Do Bundles require recipients for sharing?
    boolean bundle_require_share_recipient?;
    # Require bundles' passwords, and passwords for other items (inboxes, public shares, etc.) to conform to the same requirements as users' passwords?
    boolean password_requirements_apply_to_bundles?;
    # Use servers in the USA only?
    boolean opt_out_global?;
    # Allow uploaders to set `provided_modified_at` for uploaded files?
    boolean use_provided_modified_at?;
    # Is this site using a custom namespace for users?
    boolean custom_namespace?;
    # If greater than zero, users will unable to login if they do not show activity within this number of days.
    int disable_users_from_inactivity_period_days?;
    # If true, groups can be manually created / modified / deleted by Site Admins. Otherwise, groups can only be managed via your SSO provider.
    boolean non_sso_groups_allowed?;
    # If true, users can be manually created / modified / deleted by Site Admins. Otherwise, users can only be managed via your SSO provider.
    boolean non_sso_users_allowed?;
    # Allow bundle creation
    boolean sharing_enabled?;
    # Enable User Requests feature
    boolean user_requests_enabled?;
    # Is SMS two factor authentication allowed?
    boolean allowed_2fa_method_sms?;
    # Is U2F two factor authentication allowed?
    boolean allowed_2fa_method_u2f?;
    # Is TOTP two factor authentication allowed?
    boolean allowed_2fa_method_totp?;
    # Is yubikey two factor authentication allowed?
    boolean allowed_2fa_method_yubi?;
    # Require two-factor authentication for all users?
    boolean require_2fa?;
    # What type of user is required to use two-factor authentication (when require_2fa is set to `true` for this site)?
    string require_2fa_user_type?;
    # Top bar background color
    string color2_top?;
    # Page link and button color
    string color2_left?;
    # Top bar link color
    string color2_link?;
    # Page link and button color
    string color2_text?;
    # Top bar text color
    string color2_top_text?;
    # Custom site header text
    string site_header?;
    # Custom site footer text
    string site_footer?;
    # Login help text
    string login_help_text?;
    # SMTP server hostname or IP
    string smtp_address?;
    # SMTP server authentication type
    string smtp_authentication?;
    # From address to use when mailing through custom SMTP
    string smtp_from?;
    # SMTP server username
    string smtp_username?;
    # SMTP server port
    int smtp_port?;
    # Main LDAP setting: is LDAP enabled?
    boolean ldap_enabled?;
    # LDAP type
    string ldap_type?;
    # LDAP host
    string ldap_host?;
    # LDAP backup host
    string ldap_host_2?;
    # LDAP backup host
    string ldap_host_3?;
    # LDAP port
    int ldap_port?;
    # Use secure LDAP?
    boolean ldap_secure?;
    # Username for signing in to LDAP server.
    string ldap_username?;
    # LDAP username field
    string ldap_username_field?;
    # Domain name that will be appended to usernames
    string ldap_domain?;
    # Should we sync users from LDAP server?
    string ldap_user_action?;
    # Should we sync groups from LDAP server?
    string ldap_group_action?;
    # Comma or newline separated list of group names (with optional wildcards) - if provided, only users in these groups will be added or synced.
    string ldap_user_include_groups?;
    # Comma or newline separated list of group names (with optional wildcards) to exclude when syncing.
    string ldap_group_exclusion?;
    # Comma or newline separated list of group names (with optional wildcards) to include when syncing.
    string ldap_group_inclusion?;
    # Base DN for looking up users in LDAP server
    string ldap_base_dn?;
    string icon16_file?;
    # If true, will delete the file stored in icon16
    boolean icon16_delete?;
    string icon32_file?;
    # If true, will delete the file stored in icon32
    boolean icon32_delete?;
    string icon48_file?;
    # If true, will delete the file stored in icon48
    boolean icon48_delete?;
    string icon128_file?;
    # If true, will delete the file stored in icon128
    boolean icon128_delete?;
    string logo_file?;
    # If true, will delete the file stored in logo
    boolean logo_delete?;
    # If set to true, we will begin the process of disabling 2FA on this site.
    boolean disable_2fa_with_delay?;
    # New LDAP password.
    string ldap_password_change?;
    # Confirm new LDAP password.
    string ldap_password_change_confirmation?;
    # Password for SMTP server.
    string smtp_password?;
};

public type Body187 record {
    # Folder path on which to request the file.
    string path;
    # Destination filename (without extension) to request.
    string destination;
    # A list of user IDs to request the file from. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs to request the file from. If sent as a string, it should be comma-delimited.
    string group_ids?;
};

public type Body188 record {
    # Folder path on which to request the file.
    string path;
    # Destination filename (without extension) to request.
    string destination;
    # A list of user IDs to request the file from. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs to request the file from. If sent as a string, it should be comma-delimited.
    string group_ids?;
};

public type Body185 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

public type Body186 record {
    # Folder path on which to request the file.
    string path;
    # Destination filename (without extension) to request.
    string destination;
    # A list of user IDs to request the file from. If sent as a string, it should be comma-delimited.
    string user_ids?;
    # A list of group IDs to request the file from. If sent as a string, it should be comma-delimited.
    string group_ids?;
};

public type Body183 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

public type Body184 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

public type Body181 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

public type Body182 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

public type Body180 record {
    # AWS Access Key.
    string aws_access_key?;
    # AWS secret key.
    string aws_secret_key?;
    # Password if needed.
    string password?;
    # Private key if needed.
    string private_key?;
    # SSL client certificate.
    string ssl_certificate?;
    # A JSON file that contains the private key. To generate see https://cloud.google.com/storage/docs/json_api/v1/how-tos/authorizing#APIKey
    string google_cloud_storage_credentials_json?;
    # Wasabi access key.
    string wasabi_access_key?;
    # Wasabi secret key.
    string wasabi_secret_key?;
    # Backblaze B2 Cloud Storage keyID.
    string backblaze_b2_key_id?;
    # Backblaze B2 Cloud Storage applicationKey.
    string backblaze_b2_application_key?;
    # Rackspace API key from the Rackspace Cloud Control Panel.
    string rackspace_api_key?;
    # Reset authenticated account
    boolean reset_authentication?;
    # Azure Blob Storage secret key.
    string azure_blob_storage_access_key?;
    # Hostname or IP address
    string hostname?;
    # Internal name for your reference
    string name?;
    # Max number of parallel connections.  Ignored for S3 connections (we will parallelize these as much as possible).
    int max_connections?;
    # Port for remote server.  Not needed for S3.
    int port?;
    # S3 bucket name
    string s3_bucket?;
    # S3 region
    string s3_region?;
    # Remote server certificate
    string server_certificate?;
    # Remote server SSH Host Key. If provided, we will require that the server host key matches the provided key. Uses OpenSSH format similar to what would go into ~/.ssh/known_hosts
    string server_host_key?;
    # Remote server type.
    string server_type?;
    # Should we require SSL?
    string ssl?;
    # Remote server username.  Not needed for S3 buckets.
    string username?;
    # Google Cloud Storage bucket name
    string google_cloud_storage_bucket?;
    # Google Cloud Project ID
    string google_cloud_storage_project_id?;
    # Backblaze B2 Cloud Storage Bucket name
    string backblaze_b2_bucket?;
    # Backblaze B2 Cloud Storage S3 Endpoint
    string backblaze_b2_s3_endpoint?;
    # Wasabi Bucket name
    string wasabi_bucket?;
    # Wasabi region
    string wasabi_region?;
    # Rackspace username used to login to the Rackspace Cloud Control Panel.
    string rackspace_username?;
    # Three letter airport code for Rackspace region. See https://support.rackspace.com/how-to/about-regions/
    string rackspace_region?;
    # The name of the container (top level directory) where files will sync.
    string rackspace_container?;
    # Either personal or business_other account types
    string one_drive_account_type?;
    # Azure Blob Storage Account name
    string azure_blob_storage_account?;
    # Azure Blob Storage Container name
    string azure_blob_storage_container?;
    # S3-compatible Bucket name
    string s3_compatible_bucket?;
    # S3-compatible Bucket name
    string s3_compatible_region?;
    # S3-compatible endpoint
    string s3_compatible_endpoint?;
    # `true` if remote server only accepts connections from dedicated IPs
    boolean enable_dedicated_ips?;
    # S3-compatible access key
    string s3_compatible_access_key?;
    # S3-compatible secret key
    string s3_compatible_secret_key?;
};

# Associated payment line items
public type PaymentLineItemEntity record {
    # Payment line item amount
    float amount?;
    # Payment line item created at date/time
    string created_at?;
    # Invoice ID
    int invoice_id?;
    # Payment ID
    int payment_id?;
    # Payment line item updated at date/time
    string updated_at?;
};

public type Body178 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body179 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body176 record {
    # Internal reference for key.
    string title;
};

public type Body177 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Internal reference for key.
    string title;
    # Actual contents of SSH key.
    string public_key;
};

public type Body174 record {
    # Internal reference for key.
    string title;
};

public type Body175 record {
    # Internal reference for key.
    string title;
};

public type Body172 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

public type Body173 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

public type Body170 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

public type Body171 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

# Associated invoice line items
public type InvoiceLineItemEntity record {
    # Invoice line item amount
    float amount?;
    # Invoice line item created at date/time
    string created_at?;
    # Invoice line item description
    string description?;
    # Invoice line item type
    string 'type?;
    # Invoice line item service end date/time
    string service_end_at?;
    # Invoice line item service start date/time
    string service_start_at?;
    # Invoice line item updated date/time
    string updated_at?;
    # Plan name
    string plan?;
    # Site name
    string site?;
};

# List Inbox Recipients
public type InboxRecipientEntity record {
    # The recipient's company.
    string company?;
    # The recipient's name.
    string name?;
    # A note sent to the recipient with the inbox.
    string note?;
    # The recipient's email address.
    string recipient?;
    # When the Inbox was shared with this recipient.
    string sent_at?;
};

# List all possible public IP addresses
public type PublicIpAddressEntity record {
    # The public IP address.
    string ip_address?;
    # The name of the frontend server.
    string server_name?;
};

public type Body169 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

public type Body167 record {
    # Group ID
    int group_id?;
    # Folder path
    string path?;
    #  Permission type.  Can be `admin`, `full`, `readonly`, `writeonly`, `list`, or `history`
    string permission?;
    # Apply to subfolders recursively?
    boolean recursive?;
    # User ID.  Provide `username` or `user_id`
    int user_id?;
    # User username.  Provide `username` or `user_id`
    string username?;
};

public type Body168 record {
    # Global permissions.  Can be: `none`, `anyone_with_read`, `anyone_with_full`.
    string global_access;
};

public type Body165 record {
    # Group ID
    int group_id?;
    # Folder path
    string path?;
    #  Permission type.  Can be `admin`, `full`, `readonly`, `writeonly`, `list`, or `history`
    string permission?;
    # Apply to subfolders recursively?
    boolean recursive?;
    # User ID.  Provide `username` or `user_id`
    int user_id?;
    # User username.  Provide `username` or `user_id`
    string username?;
};

public type Body166 record {
    # Group ID
    int group_id?;
    # Folder path
    string path?;
    #  Permission type.  Can be `admin`, `full`, `readonly`, `writeonly`, `list`, or `history`
    string permission?;
    # Apply to subfolders recursively?
    boolean recursive?;
    # User ID.  Provide `username` or `user_id`
    int user_id?;
    # User username.  Provide `username` or `user_id`
    string username?;
};

public type Body163 record {
    # The id of the user to notify. Provide `user_id`, `username` or `group_id`.
    int user_id?;
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
    # The ID of the group to notify.  Provide `user_id`, `username` or `group_id`.
    int group_id?;
    # Path
    string path?;
    # The username of the user to notify.  Provide `user_id`, `username` or `group_id`.
    string username?;
};

public type Body164 record {
    # The id of the user to notify. Provide `user_id`, `username` or `group_id`.
    int user_id?;
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
    # The ID of the group to notify.  Provide `user_id`, `username` or `group_id`.
    int group_id?;
    # Path
    string path?;
    # The username of the user to notify.  Provide `user_id`, `username` or `group_id`.
    string username?;
};

public type Body161 record {
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
};

public type Body162 record {
    # The id of the user to notify. Provide `user_id`, `username` or `group_id`.
    int user_id?;
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
    # The ID of the group to notify.  Provide `user_id`, `username` or `group_id`.
    int group_id?;
    # Path
    string path?;
    # The username of the user to notify.  Provide `user_id`, `username` or `group_id`.
    string username?;
};

public type Body160 record {
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
};

# List Bundle Registrations
public type BundleRegistrationEntity record {
    # Registration cookie code
    string code?;
    # Registrant name
    string name?;
    # Registrant company name
    string company?;
    # Registrant email address
    string email?;
    # Registrant IP Address
    string ip?;
    # InboxRegistration cookie code, if there is an associated InboxRegistration
    string inbox_code?;
    # Clickwrap text that was shown to the registrant
    string clickwrap_body?;
    # Id of associated form field set
    int form_field_set_id?;
    # Data for form field set with form field ids as keys and user data as values
    string form_field_data?;
};

# List Message Comment Reactions
public type MessageCommentReactionEntity record {
    # Reaction ID
    int id?;
    # Emoji used in the reaction.
    string emoji?;
};

public type Body record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Start date/time of export range.
    string start_at?;
    # End date/time of export range.
    string end_at?;
    # Error message associated with the request, if any.
    string query_message?;
    # The HTTP request method used by the webhook.
    string query_request_method?;
    # The target webhook URL.
    string query_request_url?;
    # The HTTP status returned from the server in response to the webhook request.
    string query_status?;
    # true if the webhook request succeeded (i.e. returned a 200 or 204 response status). false otherwise.
    boolean query_success?;
    # Return notifications that were triggered by actions on this specific path.
    string query_path?;
    # Return notifications that were triggered by actions in this folder.
    string query_folder?;
};

# List Apps
public type AppEntity record {
    # Name of the App
    string name?;
    # Long form description of the App
    string extended_description?;
    # Short description of the App
    string short_description?;
    # Collection of named links to documentation
    string documentation_links?;
    # App icon
    string icon_url?;
    # Full size logo for the App
    string logo_url?;
    # Screenshots of the App
    string screenshot_list_urls?;
    # Logo thumbnail for the App
    string logo_thumbnail_url?;
    # Associated SSO Strategy type, if any
    string sso_strategy_type?;
    # Associated Remote Server type, if any
    string remote_server_type?;
    # Associated Folder Behavior type, if any
    string folder_behavior_type?;
    # Link to external homepage
    string external_homepage_url?;
    # Marketing video page
    string marketing_youtube_url?;
    # Tutorial video page
    string tutorial_youtube_url?;
    # The type of the App
    string app_type?;
    # Is featured on the App listing?
    boolean featured?;
};

public type Body158 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body159 record {
    # If `true`, copying or moving resources into this path will trigger a notification, in addition to just uploads.
    boolean notify_on_copy?;
    # If `true` actions initiated by the user will still result in a notification
    boolean notify_user_actions?;
    # If `true`, enable notifications for each subfolder in this path
    boolean recursive?;
    # The time interval that notifications are aggregated by.  Can be `five_minutes`, `fifteen_minutes`, `hourly`, or `daily`.
    string send_interval?;
};

public type Body156 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body157 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body154 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body155 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body152 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Comment body.
    string body;
};

public type Body153 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Emoji to react with.
    string emoji;
};

public type Body150 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Comment body.
    string body;
};

public type Body151 record {
    # User ID.  Provide a value of `0` to operate the current session's user.
    int user_id?;
    # Comment body.
    string body;
};
