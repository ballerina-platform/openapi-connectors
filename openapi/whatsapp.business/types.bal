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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

# Represents group invite.
public type GroupInvite record {
    # Group invite link
    string link?;
};

# Contains generic information such as WhatsApp Business API Client version.
public type Meta record {
    # API status
    string api_status?;
    # Version
    string 'version?;
};

# Represents backup setting body
public type BackupSettingsRequestBody record {
    # Used to encrypt backup data for security
    string password;
};

# Represents address
public type Address record {
    # City name
    string city;
    # Full country name
    string country;
    # Two-letter country abbreviation
    string country_code;
    # State abbreviation
    string state;
    # Street number and name
    string street;
    # Standard Values: HOME, WORK
    string 'type;
    # ZIP code
    string zip;
};

# Date/time by component.
public type DateTimeComponent record {
    # The day of month
    int day_of_month?;
    # Both strings and numbers are accepted. If different from the value derived from the date (if specified), use the derived value.
    int day_of_week?;
    # The hour
    int hour?;
    # The minute
    int minute?;
    # The month
    int month?;
    # The year
    int year?;
};

# Request code account
public type RequestCodeAccount record {
    # Decoded name from cert
    string vname?;
};

# Restore settings request body
public type RestoreSettingsRequestBody record {
    # The data that was returned by the /v1/settings/backup API call
    string data;
    # The password you used in the /v1/settings/backup API call to encrypt the backup data
    string password;
};

# Webhook location
public type WebhookLocation record {
    # Address of the location
    string address?;
    # Latitude of location being sent
    decimal latitude?;
    # Longitude of location being sent
    decimal longitude?;
    # Name of the location
    string name?;
    # URL for the website where the user downloaded the location information
    string url?;
};

# Audio by ID
public type AudioById record {
    # Audio ID
    string id;
};

# Represents required parameters to request code
public type RequestCodeRequestBody record {
    # Numerical country code for the phone number you are registering
    string cc;
    # Base64-encoded Verified Name certificate
    string cert;
    # Method of receiving your registration code
    string method;
    # Phone number you are registering, without the country code or plus symbol (+)
    string phone_number;
    # Existing 6-digit PIN — This is only required when two-factor verification is enabled on this account.
    string pin?;
};

# Group admin request body.
public type GroupAdminRequestBody record {
    # The WhatsApp IDs of the people to be added or removed as group admins
    string[] wa_ids;
};

# The media object containing a document.
public type Document DocumentById|DocumentByProvider;

# The media object containing an image.
public type Image ImageById|ImageByProvider;

# Video by ID
public type VideoById record {
    # Caption
    string caption;
    # Video ID
    string id;
};

# Represents currency.
public type Currency record {
    # Amount
    int amount_1000;
    # Currency code
    string currency_code;
};

# Represents user response item
public type UserResponseItem record {
    # Username
    string username?;
};

# Webhook event
public type WebhookEvent record {
    # Webhook contact
    WebhookContact[] contacts?;
    # Error list
    Error[] errors?;
    # Webhook message list
    WebhookMessage[] messages?;
    # Webhook status list
    WebhookStatus[] statuses?;
};

# Webhook video
public type WebhookVideo record {
    # Optional. Only present if specified
    string caption?;
    # Absolute filename and location on media volume. This parameter is deprecated
    string file?;
    # ID of the media. Can be used to delete the media if stored locally on the client
    string id?;
    # Link of the media
    string link?;
    # Mime type of media
    string mime_type?;
    # Checksum
    string sha256?;
};

# Parameters required to check contact.
public type CheckContactRequestBody record {
    # Blocking determines whether the request should wait for the processing to complete (synchronous) or not (asynchronous).
    string blocking = "no_wait";
    # Array of contact phone numbers. The numbers can be in any standard telephone number format.
    string[] contacts;
};

# Request code response
public type RequestCodeResponse record {
    # RequestCodeAccount list
    RequestCodeAccount[] account?;
};

# Create user request body.
public type CreateUserRequestBody record {
    # username
    string password;
    # password
    string username;
};

# Represents business settings
public type BusinessSettingsBusiness record {
    # Represents business profile
    BusinessProfile profile?;
};

# Represents get profile photo response
public type GetProfilePhotoResponse record {
    # Represents profile photo settings
    ProfilePhotoSettings settings?;
};

# Represents user login response item
public type UserLoginResponseItem record {
    # Token expiration timestamp. By default, this is 7 days.
    string expires_after?;
    # Authentication token to be used for all other WhatsApp Business API calls. The token must be sent in the authorization header in the format:
    # Authorization: Bearer <authentication-token>
    string token?;
};

# Audio by ID.
public type AudioByProvider record {
    # Video link
    string link;
    # Represents provider.
    Provider provider;
};

# Represents application settings.
public type ApplicationSettings record {
    # Backoff delay for a failed callback in milliseconds
    # This setting is used to configure the amount of time the backoff delays before retrying a failed callback. The backoff delay increases linearly by this value each time a callback fails to get a HTTPS 200 OK response. The backoff delay is capped by the max_callback_backoff_delay_ms setting.
    string callback_backoff_delay_ms?;
    # Stores callbacks on disk until they are successfully acknowledged by the Webhook or not. Restart required.
    boolean callback_persist?;
    # Multiconnect: Interval of the Master node monitoring of Coreapp nodes in seconds
    int heartbeat_interval?;
    # Maximum delay for a failed callback in milliseconds
    string max_callback_backoff_delay_ms?;
    # Represents media.
    Media media?;
    # Set to valid WhatsApp Group with users who wish to see alerts for critical errors and messages.
    string on_call_pager?;
    # When true, removes messages from the local database after they are delivered to or read by the recipient. When false, saves all messages on local storage until they are explicitly deleted.
    # When messages are sent, they are stored in a local database. This database is used as the application's history. Since the business keeps its own history, you can specify whether you want message pass_through or not. Restart required.
    boolean pass_through?;
    # Receive a notification that a message is sent to server. When true, you will receive a message indicating that a message has been sent. If false (default), you will not receive notification.
    boolean sent_status?;
    # Multiconnect: Maximum amount of seconds a Master node waits for a Coreapp node to respond to a heartbeat before considering it unhealthy and starting the failover process.
    int unhealthy_interval?;
    # Webhooks
    Webhooks webhooks?;
};

# Represents group invite response
public type GroupInviteResponse record {
    *Response;
    # Group invite list
    GroupInvite[] groups?;
};

# Represents business profile
public type BusinessProfile record {
    # Address of the business
    # Maximum of 256 characters
    string address;
    # Description of the business
    # Maximum of 256 characters
    string description;
    # Email address to contact the business
    # Maximum of 128 characters
    string email;
    # Industry of the business
    # Maximum of 128 characters
    string vertical;
    # URLs associated with business (e.g., website, Facebook page, Instagram)
    # Maximum of 2 websites with a maximum of 256 characters each
    string[] websites;
};

# Represents group
public type Group record {
    # timestamp
    int creation_time?;
    # Group ID
    string id?;
};

# Video by provider
public type VideoByProvider record {
    # Caption
    string caption;
    # Link
    string link;
    # Represents provider.
    Provider provider;
};

# Webhook contact
public type WebhookContact record {
    # Webhook contact profile
    WebhookContactProfile profile?;
    # The WhatsApp ID of the contact
    string wa_id?;
};

# Standard Values: HOME, WORK
public type Url record {
    # Standard Values: HOME, WORK
    string 'type?;
    # URL
    string url?;
};

# Represents login admin request body.
public type LoginAdminRequestBody record {
    # New password
    string new_password;
};

# Date/time by Unix epoch.
public type DateTimeUnixEpoch record {
    # Epoch timestamp in seconds
    int timestamp?;
};

# Represents detailed user response item
public type DetailedUserResponseItem record {
    # Represents user role
    UserRole ROLES?;
    # Username
    string username?;
};

# The Whatsapp Business API Client will attempt to format the date/time based on a specified localization.
public type DateTimeObject record {
    # Date/time by component.
    DateTimeComponent component?;
    # Date/time by Unix epoch.
    DateTimeUnixEpoch unix_epoch?;
};

# Document by ID.
public type DocumentById record {
    # Caption
    string caption;
    # File name
    string filename;
    # ID
    string id;
};

# Represents detailed user response.
public type DetailedUserResponse record {
    *Response;
    # Detailed user response item list
    DetailedUserResponseItem[] users?;
};

# Represents profile about settings
public type ProfileAboutSettings record {
    # Represents about in profile settings
    ProfileAboutSettingsProfile profile?;
};

# Text
public type Text record {
    # Body
    string body;
};

# Webhook system
public type WebhookSystem record {
    # Body
    string body?;
    # Status
    string 'type?;
};

# Represents update group info request body.
public type UpdateGroupInfoRequestBody record {
    # Subject
    string subject;
};

# Represents group response
public type GroupResponse record {
    *Response;
    # Group information list
    GroupInfo[] groups?;
};

# Webhook message
public type WebhookMessage record {
    # Webhook audio
    WebhookAudio audio?;
    # Contact list
    Contact[] contacts?;
    # Represents message context.
    MessageContext context?;
    # Webhook document
    WebhookDocument document?;
    # Error list
    Error[] errors?;
    # WhatsApp ID of the sender
    string 'from?;
    # Optional. WhatsApp group ID
    string group_id?;
    # Message ID
    string id?;
    # Webhook image
    WebhookImage image?;
    # Webhook location
    WebhookLocation location?;
    # Webhook system
    WebhookSystem system?;
    # Webhook text
    WebhookText text?;
    # Message received timestamp
    string timestamp?;
    # type of the message
    MessageType 'type?;
    # Webhook video
    WebhookVideo video?;
    # Webhook voice
    WebhookVoice voice?;
};

# Save the data value as that will be used along with your password to restore the information.
public type BackupSettingsResponse record {
    # Represents backup settings
    BackupSettings settings?;
};

# Document by provider.
public type DocumentByProvider record {
    # Caption
    string caption;
    # File name
    string filename;
    # Link
    string link;
    # Represents provider.
    Provider provider;
};

# Webhooks
public type Webhooks record {
    # Configures the maximum number of inflight callback requests that are sent out. Can be set to 6 (default), 12, 18, or 24.
    int max_concurrent_requests?;
    # Inbound and outbound notifications are routed to this URL. A HTTPS-based endpoint is required; HTTP will not work.
    string url?;
};

# Webhook contact profile
public type WebhookContactProfile record {
    # Optional. As of v2.21.4, contains the sender's profile name.
    string name?;
};

# The media object containing audio
public type Audio AudioById|AudioByProvider;

# Represents email.
public type Email record {
    # Email
    string email;
    # Type
    string 'type;
};

# Profile about
public type ProfileAbout record {
    # Text to display in your profile's About section
    # The max length for the string is 139 characters.
    string text;
};

# Represents about in profile settings
public type ProfileAboutSettingsProfile record {
    # Profile about
    ProfileAbout about?;
};

# Represents groups response
public type GroupsResponse record {
    *Response;
    # Group list
    Group[] groups?;
};

# Webhook image
public type WebhookImage record {
    # Optional. Only present if specified.
    string caption?;
    # Absolute filename and location on media volume. This parameter is deprecated.
    string file?;
    # ID of the media. Can be used to delete the media if stored locally on the client.
    string id?;
    # Media link
    string link?;
    # Mime type of media
    string mime_type?;
    # Checksum
    string sha256?;
};

# Webhook text
public type WebhookText record {
    # Message text
    string body?;
};

# Create group request body.
public type CreateGroupRequestBody record {
    # Subject
    string subject;
};

# Full contact name
public type Name record {
    # First name
    string first_name?;
    # Full name as it normally appears
    string formatted_name;
    # Last name
    string last_name?;
    # Name preffix
    string prefix?;
    # Name suffix
    string suffix?;
};

public type RemoveGroupParticipantRequestBody record {
    # Represents remove group participant request body
    string[] wa_ids;
};

# Webhook status
public type WebhookStatus record {
    # Error list
    Error[] errors?;
    # Message ID
    string id?;
    # WhatsApp ID of recipient
    string recipient_id?;
    # Status of message
    string status?;
    # Timestamp of the status message
    string timestamp?;
};

# Represents profile
public type ProfilephotosettingsProfile record {
    # Represents photo
    ProfilephotosettingsProfilePhoto photo?;
};

# Represents register account request body.
public type RegisterAccountRequestBody record {
    # Code
    string code;
};

# Webhook voice
public type WebhookVoice record {
    # Optional. Only present if specified.
    string caption?;
    # Absolute filename and location on media volume. This parameter is deprecated.
    string file?;
    # ID of the media. Can be used to delete the media if stored locally on the client.
    string id?;
    # Media link
    string link?;
    # Mime type of media
    string mime_type?;
    # Checksum
    string sha256?;
};

# Image by provider
public type ImageByProvider record {
    # Caption
    string caption;
    # Link
    string link;
    # Represents provider.
    Provider provider;
};

# Represents upload media
public type UploadMedia record {
    # Media ID
    string id?;
};

# Send message request body
public type SendMessageRequestBody record {
    # The media object containing audio
    Audio audio?;
    # Contacts list
    Contact[] contacts?;
    # The media object containing a document.
    Document document?;
    # The containing element for the message content — Indicates that the message is highly structured. Parameters contained within provide the structure.
    Hsm hsm?;
    # The media object containing an image.
    Image image?;
    # Represents location.
    Location location?;
    # Specifying preview_url in the request is optional when not including a URL in your message.
    # To include a URL preview, set preview_url to true in the message body and make sure the URL begins with http:// or https://. For more information, see the Sending URLs in Text Messages section.
    boolean preview_url?;
    # Determines whether the recipient is an individual or a group
    # Specifying recipient_type in the request is optional when the value is individual.
    # However, recipient_type is required when using group. If sending a text message to a group, see the Sending Group Messages documentation.
    string recipient_type = "individual";
    # Text
    Text text?;
    # When recipient_type is individual, this field is the WhatsApp ID (phone number) returned from contacts endpoint. When recipient_type is group, this field is the WhatsApp group ID.
    string to;
    # TTL
    record {} ttl?;
    # type of the message
    MessageType 'type?;
    # The media object containing a video
    Video video?;
};

# type of the message
public type MessageType string;

# The containing element for the message content — Indicates that the message is highly structured. Parameters contained within provide the structure.
public type Hsm record {
    # The element name that indicates which template to use within the namespace
    string element_name;
    # Language
    Language language;
    # This field is an array of values to apply to variables in the template
    LocalizableParam[] localizable_params;
    # The namespace that will be used
    string namespace;
};

# Represents group information.
public type GroupInfo record {
    # Group administrators
    # Lists IDs of the creator of the group and any administrators added
    string[] admins?;
    # Group creation time
    int creation_time?;
    # ID of the creator of this group
    string creator?;
    # Participants of the group
    # This is an array of all the IDs of the participants in the group. Initially, this will be the creator of the group.
    string[] participants?;
    # Subject of the group
    string subject?;
};

# Represents message response
public type MessageResponse record {
    *Response;
    # Message list
    Message[] messages?;
};

# Represents media.
public type Media record {
    # An array specifying which types of media to automatically download.
    string[] auto_download;
};

# Webhook document
public type WebhookDocument record {
    # Optional. Only present if specified.
    string caption?;
    # Absolute filename and location on media volume. This parameter is deprecated.
    string file?;
    # Filename on the sender's device. This will only be present in audio and document media messages.
    string filename?;
    # ID of the media. Can be used to delete the media if stored locally on the client.
    string id?;
    # Link of the media.
    string link?;
    # Mime type of media
    string mime_type?;
    # Checksum
    string sha256?;
};

# Represents profile photo settings
public type ProfilePhotoSettings record {
    # Represents profile
    ProfilephotosettingsProfile profile?;
};

# Represents get about profile response.
public type GetProfileAboutResponse record {
    # Represents profile about settings
    ProfileAboutSettings settings?;
};

# The media object containing a video
public type Video VideoById|VideoByProvider;

# Check contact response
public type CheckContactResponse record {
    *Response;
    # Contact list
    CheckContact[] contacts?;
};

# Represents mark message as read request body.
public type MarkMessageAsReadRequestBody record {
    # Status
    string status;
};

# Image by ID
public type ImageById record {
    # Caption
    string caption;
    # ID
    string id;
};

# Represents message.
public type Message record {
    # Message ID
    string id?;
};

# Contact organization information
public type Org record {
    # Name of the contact's company
    string company;
    # Name of the contact's department
    string department?;
    # Contact's business title
    string title?;
};

# Represents business settings
public type BusinessSettings record {
    # Represents business settings
    BusinessSettingsBusiness business?;
};

# Language
public type Language record {
    # The code of the language or locale to use — Accepts both language and language_locale formats (e.g., en and en_US).
    string code;
    # The language policy the message should follow
    string policy;
};

# Represents user login response
public type UserLoginResponse record {
    *Response;
    # User login response item list
    UserLoginResponseItem[] users?;
};

# Phone
public type Phone record {
    # Phone number
    string phone?;
    # Standard Values: CELL, MAIN, IPHONE, HOME, WORK
    string 'type?;
    # WhatsApp ID
    string wa_id?;
};

# Represents message context.
public type MessageContext record {
    # Sender Whatsapp id of context-message
    string 'from?;
    # GroupId of context message
    string group_id?;
    # message id
    string id?;
    # Whats app ids
    string[] mentions?;
};

# Localisable parameters.
public type LocalizableParam record {
    # Represents currency.
    Currency currency?;
    # The Whatsapp Business API Client will attempt to format the date/time based on a specified localization.
    DateTimeObject date_time?;
    # Default text if localization fails
    string default;
};

# Represents backup settings
public type BackupSettings record {
    # The data that has been backed up, encrypted for security.
    string data?;
};

# Webhook audio
public type WebhookAudio record {
    # Optional. Only present if specified.
    string caption?;
    # Absolute filename and location on media volume. This parameter is deprecated.
    string file?;
    # Filename on the sender's device. This will only be present in audio and document media messages.
    string filename?;
    # ID of the media. Can be used to delete the media if stored locally on the client.
    string id?;
    # Media link
    string link?;
    # Mime type of media
    string mime_type?;
    # Checksum
    string sha256?;
};

# Represents error.
public type Error record {
    # See the https://developers.facebook.com/docs/whatsapp/api/errors for more information.
    int code?;
    # error detail
    string details?;
    # location for error detail
    string href?;
    # error title
    string title?;
};

# Set shards request body
public type SetShardsRequestBody record {
    # CC
    string cc;
    # Phone number
    string phone_number;
    # Pin
    string pin;
    # Shards
    int shards;
};

# Contact
public type Contact record {
    # Full contact address(es)
    Address[] addresses?;
    # YYYY-MM-DD formatted string
    string birthday?;
    # Contact email address(es)
    Email[] emails?;
    # Full contact name
    Name name?;
    # Contact organization information
    Org org?;
    # Contact phone number(s)
    Phone[] phones?;
    # Contact URL(s)
    Url[] urls?;
};

# Represents provider.
public type Provider record {
    # Name
    string name;
};

# Response
public type Response record {
    # Only returned with a failed request. Contains an array of error objects that are present when there is an error. 
    Error[] errors?;
    # Contains generic information such as WhatsApp Business API Client version.
    Meta meta?;
};

# Represents user response
public type UserResponse record {
    *Response;
    # User response item list
    UserResponseItem[] users?;
};

# Represents photo
public type ProfilephotosettingsProfilePhoto record {
    # Photo link
    string link?;
};

# Update user request body.
public type UpdateUserRequestBody record {
    # Password
    string password;
};

# Represents user role
public type UserRole string;

# Check contact
public type CheckContact record {
    # The value you sent in the contacts field of the JSON request.
    string input?;
    # Status of the user.
    string status?;
    # WhatsApp user identifier that can be used in other API calls. Only returned if the status is valid.
    string wa_id?;
};

# Represents get business profile response
public type GetBusinessProfileResponse record {
    *Response;
    # Represents business settings
    BusinessSettings settings?;
};

# Enable two step request body
public type EnableTwoStepRequestBody record {
    # Pin
    string pin;
};

# Represents location.
public type Location record {
    # Address of the location. Only displayed if name is present.
    string address;
    # Latitude of the location
    string latitude;
    # Longitude of the location
    string longitude;
    # Name of the location
    string name;
};
