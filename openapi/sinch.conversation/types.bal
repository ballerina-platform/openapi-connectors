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

# The app corresponds to the API user and is a collection of channel credentials allowing access to the underlying messaging channels. The app is tied to a set of webhooks which define the destination for various events coming from the Conversation API.
public type App record {
    # Channel credentials. The order of the credentials defines the app channel priority.
    ConversationChannelCredential[] channel_credentials;
    # Conversation metadata report view.
    ConversationMetadataReportView conversation_metadata_report_view?;
    # Human readable identifier of the app.
    string display_name?;
    # The ID of the app you can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps).
    string id;
    # Rate limits
    RateLimits rate_limits?;
    # Retention policy for messages and conversations
    RetentionPolicy retention_policy?;
};

# Represents a response to a choice message.
public type ChoiceResponseMessage record {
    # The message id containing the choice.
    string message_id;
    # The postback_data defined in the selected choice.
    string postback_data;
};

# A choice is an action the user can take such as buttons for quick replies, call actions etc.
public type Choice record {
    # Message for triggering a call.
    CallMessage call_message?;
    # Message with geo location
    LocationMessage location_message?;
    # Optional. This data will be returned in the ChoiceResponseMessage. The default is message_id_{text, title}.
    string postback_data?;
    # Message containing only text
    TextMessage text_message?;
    # A generic URL message.
    UrlMessage url_message?;
};

# Message for triggering a call.
public type CallMessage record {
    # Phone number in E.164 with leading +.
    string phone_number;
    # Title shown close to the phone number. The title is clickable in some cases.
    string title;
};

# A message on a particular channel.
public type ConversationMessage record {
    # Output only.
    string accept_time?;
    # Message originating from an app
    AppMessage app_message?;
    # A unique identity of message recipient on a particular channel. For example, the channel identity on SMS, WHATSAPP or VIBERBM is a MSISDN phone number.
    ChannelIdentity channel_identity?;
    # Required. The ID of the contact.
    string contact_id?;
    # Message originating from a contact
    ContactMessage contact_message?;
    # Required. The ID of the conversation.
    string conversation_id?;
    # Conversation direction
    ConversationDirection direction?;
    # Required. The ID of the message.
    string id?;
    # Optional. Metadata associated with the contact. Up to 1024 characters long.
    string metadata?;
};

public type RuntimeError record {
    int code?;
    ProtobufAny[] details?;
    string _error?;
    string message?;
    string status?;
};

# Card height
public type CardHeight string;

# It consists of claimed identity and a static token.
public type StaticBearerCredential record {
    # Required. Claimed identity.
    string claimed_identity?;
    # Required. Static bearer token.
    string token?;
};

# Send message request.
public type SendMessageRequest record {
    # The ID of the app sending the message.
    string app_id;
    # Overwrites the default callback url for delivery reports for this message The REST URL should be of the form: http://host[:port]/path
    string callback_url?;
    # Explicitly define the channels and order in which they are tried when sending the message. Note that collection can't contain 'CHANNEL_UNSPECIFIED' value. Which channels the API will try and their priority is defined by: 1. channel_priority_order if available. 2. recipient.identified_by.channel_identities if available. 3. When recipient is a contact_id:
    #   - if a conversation with the contact exists: the active channel of the conversation is tried first.
    #   - the existing channels for the contact are ordered by contact channel preferences if given.
    #   - lastly the existing channels for the contact are ordered by the app priority.
    ConversationChannel[] channel_priority_order?;
    # Channel-specific properties. The key in the map must point to a valid channel property key as defined by the enum ChannelPropertyKeys. The maximum allowed property value length is 1024 characters.
    record {} channel_properties?;
    # Message originating from an app
    AppMessage message;
    # Metadata that should be associated with the message.
    string message_metadata?;
    # The project ID.
    string project_id;
    # Message queue priority.
    MessageQueue queue?;
    # Recipient information
    Recipient recipient;
    # The timeout allotted for sending the message. Passed onto channels which have support for it and emulated by Conversation API for channels without ttl support but with message retract/unsend functionality. Channel failover will not be performed for messages with expired TTL.
    string ttl?;
};

# If the contact message was a response to a previous App message then this field contains information about that.
public type ReplyTo record {
    # Required. The Id of the message that this is a response to
    string message_id?;
};

public type AppEvent record {
    ComposingEvent composing_event?;
    # Represents a response to a comment event.
    CommentReplyEvent comment_reply_event?;
};

# Contact Message containing media and caption
public type MediaCardMessage record {
    # Optional. Caption for the media on channels, where its supported.
    string caption?;
    # Required. Url to the file.
    string url?;
};

public type SendMessageResponse record {
    # Timestamp when the Conversation API accepted the message for delivery to the referenced contact.
    string accepted_time?;
    # The ID of the message.
    string message_id?;
};

public type ChannelRecipientIdentity record {
    # Channel Identifier
    ConversationChannel 'channel;
    # The channel recipient identity.
    string identity;
};

# MMS channel credential
public type MMSCredentials record {
    # Required. MMS Account ID.
    string account_id?;
    # Required. MMS API Key.
    string api_key?;
    # It consists of a username and a password.
    BasicAuthCredential basic_auth?;
};

# An Opt-Out contains the identity of the recipient which retract its consent to receive messages from Conversation API apps on a given channel.
public type OptOut record {
    # The app for which the Opt-Out is being registered.
    string app_id;
    # The channels covered by this Opt-Out. The default are all the channels for a contact if recipient is contact_id or the channels in the channel_identities list.
    ConversationChannel[] channels;
    # Recipient information
    Recipient recipient?;
};

# An Opt-In contains the identity of the recipient which gave its consent to receive messages from Conversation API apps on a given channel.
public type OptIn record {
    # Required. The app for which the Opt-In is being registered.
    string app_id;
    # Required. The channels covered by this Opt-In. The default are all the channels for a contact if recipient is contact_id or the channels in the channel_identities list.
    ConversationChannel[] channels;
    # Recipient information
    Recipient recipient?;
};

# An CapabilityResponse contains the identity of the recipient for which will be perform a capability lookup.
public type QueryCapabilityResponse record {
    # Required. The ID of the app to use for capability lookup.
    string app_id?;
    # Recipient information
    Recipient recipient?;
    # ID for the asynchronous request, will be generated id if not set in request
    string request_id?;
};

public type TranscodeMessageResponse record {
    # Output only. The transcoded message for the different channels. The keys in the map correspond to channel names, as defined by the type ConversationChannel.
    record {} transcoded_message?;
};

public type ComposingEvent record {
};

# Message containing a list of cards often rendered horizontally on supported channels. Supported types for media are only images, e.g. .png, .jpg, .jpeg extensions.
public type CarouselMessage record {
    # A list of up to 10 cards.
    CardMessage[] cards;
    # Optional. Outer choices on the carousel level. The number of outer choices is limited to 3.
    Choice[] choices?;
};

# A unique identity of message recipient on a particular channel. For example, the channel identity on SMS, WHATSAPP or VIBERBM is a MSISDN phone number.
public type ChannelIdentity record {
    # Optional. The Conversation API's app ID if this is app-scoped channel identity. Currently, FB Messenger and Viber are using app-scoped channel identities which means contacts will have different channel identities for different apps. FB Messenger uses PSIDs (Page-Scoped IDs) as channel identities. The app_id is pointing to the app linked to the FB page for which this PSID is issued.
    string app_id?;
    # Channel Identifier
    ConversationChannel 'channel;
    # Required. The channel identity e.g., a phone number for SMS, WhatsApp and Viber Business.
    string identity;
};

# Geographic coordinates
public type Coordinates record {
    # Required. The latitude.
    float latitude?;
    # Required. The longitude.
    float longitude?;
};

# Recipient information
public type Recipient record {
    # The ID of the receiving contact.
    string contact_id;
    # Channel identities.
    ChannelIdentities identified_by;
};

public type SendEventResponse record {
    # Output only. Accepted timestamp.
    string accepted_time?;
    # Output only. Event id.
    string event_id?;
};

public type QueryCapability record {
    # Required. The ID of the app to use for capability lookup.
    string app_id?;
    # Required. The project ID.
    string project_id?;
    # Recipient information
    Recipient recipient?;
    string request_id?;
};

# It consists of a username and a password.
public type BasicAuthCredential record {
    # Basic auth password.
    string password;
    # Basic auth username.
    string username;
};

#  - UNKNOWN: UNKNOWN is used if no other code can be used to describe the encountered error.
#  - INTERNAL_ERROR: An internal error occurred. Please save the entire callback if you want to
# report an error.
#  - RATE_LIMITED: The message or event was not sent due to rate limiting.
#  - RECIPIENT_INVALID_CHANNEL_IDENTITY: The channel recipient identity was malformed.
#  - RECIPIENT_NOT_REACHABLE: It was not possible to reach the contact, or channel recipient identity,
# on the channel.
#  - RECIPIENT_NOT_OPTED_IN: The contact, or channel recipient identity, has not opt-ed in on the channel.
#  - OUTSIDE_ALLOWED_SENDING_WINDOW: The allowed sending window has expired. See the channel documentation
# for more information about how the sending window works for the different
# channels.
#  - CHANNEL_FAILURE: The channel failed to accept the message. The Conversation API performs
# multiple retries in case of transient errors
#  - CHANNEL_BAD_CONFIGURATION: The configuration of the channel for the used App is wrong. The bad
# configuration caused the channel to reject the message. Please see
# the channel support documentation page for how to set it up correctly.
#  - CHANNEL_CONFIGURATION_MISSING: The configuration of the channel is missing from the used App. Please see
# the channel support documentation page for how to set it up correctly.
#  - MEDIA_TYPE_UNSUPPORTED: Some of the referenced media files is of a unsupported media type. Please
# read the channel support documentation page to find out the limitations
# on media that the different channels impose.
#  - MEDIA_TOO_LARGE: Some of the referenced media files are too large. Please read the channel
# support documentation to find out the limitations on file size that the
# different channels impose.
#  - MEDIA_NOT_REACHABLE: The provided media link was not accessible from the Conversation API or
# from the underlying channels. Please make sure that the media file is
# accessible.
#  - NO_CHANNELS_LEFT: No channels to try to send the message to. This error will occur if one
# attempts to send a message to a channel with no channel identities or if
# all applicable channels have been attempted.
#  - TEMPLATE_NOT_FOUND: The referenced template was not found.
#  - TEMPLATE_INSUFFICIENT_PARAMETERS: Sufficient template parameters was not given. All parameters defined
# in the template must be provided when sending a template message
#  - TEMPLATE_NON_EXISTING_LANGUAGE_OR_VERSION: The selected language, or version, of the referenced template did
# not exist. Please check the available versions and languages of the template
#  - DELIVERY_TIMED_OUT: The message delivery, or event delivery, failed due to a channel-imposed timeout.
# See the channel support documentation page for further details
# about how the different channels behave.
#  - DELIVERY_REJECTED_DUE_TO_POLICY: The message or event was rejected by the channel due to a policy.
# Some channels have specific policies that must be met to send a message.
# See the channel support documentation page for more information about
# when this error will be triggered.
#  - CONTACT_NOT_FOUND: The provided Contact ID did not exist.
#  - BAD_REQUEST: Conversation API validates send requests in two different stages.
# The first stage is right before the message is enqueued.
# If this first validation fails the API responds with 400 Bad Request
# and the request is discarded immediately.
# The second validation kicks in during message processing and
# it normally contains channel specific validation rules.
# Failures during second request validation are
# delivered as callbacks to MESSAGE_DELIVERY (EVENT_DELIVERY) webhooks
# with ReasonCode BAD_REQUEST.
#  - UNKNOWN_APP: The used App is missing. This error may occur when the app is removed
# during message processing.
#  - NO_CHANNEL_IDENTITY_FOR_CONTACT: The contact has no channel identities setup, or the contact has no
# channels setup for the resolved channel priorities.
#  - CHANNEL_REJECT: Generic error for channel permanently rejecting a message.
# Only used if no other better matching error can be used
#  - NO_PERMISSION: No permission to perform action
#  - NO_PROFILE_AVAILABLE: No available profile data for user
#  - UNSUPPORTED_OPERATION: Generic error for channel unsupported operations.
public type ReasonCode string;

# Message originating from a contact
public type ContactMessage record {
    # Represents a response to a choice message.
    ChoiceResponseMessage choice_response_message?;
    # Fallback message, appears when original contact message can not be handled
    FallbackMessage fallback_message?;
    # Message with geo location
    LocationMessage location_message?;
    # Contact Message containing media and caption
    MediaCardMessage media_card_message?;
    # Message containing media
    MediaMessage media_message?;
    # If the contact message was a response to a previous App message then this field contains information about that.
    ReplyTo reply_to?;
    # Message containing only text
    TextMessage text_message?;
};

# Represents a response to a comment event.
public type CommentReplyEvent record {
    # The text of the comment reply.
    string text;
};

# Message queue priority.
public type MessageQueue string;

# Message containing choices/actions.
public type ChoiceMessage record {
    # The number of choices is limited to 3.
    Choice[] choices;
    # Message containing only text
    TextMessage text_message?;
};

#  - UNSPECIFIED_SUB_CODE: UNSPECIFIED_SUB_CODE is used if no other sub code can be used to describe the encountered error.
#  - ATTACHMENT_REJECTED: The message attachment was rejected by the channel due to a policy.
# Some channels have specific policies that must be met to receive an attachment.
#  - MEDIA_TYPE_UNDETERMINED: The specified media urls media type could not be determined
#  - INACTIVE_SENDER: The used credentials for the underlying channel is inactivated and not allowed to send or receive messages.
public type ReasonSubCode string;

# Webhook target-type
public type WebhookTargetType string;

# Message containing only text
public type TextMessage record {
    # Required. The text to be sent.
    string text?;
};

# Message referring to predefined template
public type TemplateMessage record {
    # Optional. Channel specific template reference with parameters per channel. The channel template if exists overrides the omnichannel template. At least one of channel_template or omni_template needs to be present. The key in the map must point to a valid conversation channel as defined by the enum ConversationChannel.
    record {} channel_template?;
    # The referenced template can be an omnichannel template stored in Conversation API Template Store as AppMessage or it can reference external channel-specific template such as WhatsApp Business Template.
    TemplateReference omni_template?;
};

# Message containing media
public type MediaMessage record {
    # Optional. Will be used where it is natively supported
    string thumbnail_url?;
    # Required. Url to the file.
    string url?;
};

# Rate limits
public type RateLimits record {
    # Output only. The number of inbound messages/events we process per second, from underlying channels to the app.  The default rate limit is 25.
    int inbound?;
    # Output only. The number of messages/events we process per second, from the app to the underlying channels. Note that underlying channels may have other rate limits.  The default rate limit is 25.
    int outbound?;
    # Output only. The rate limit of callbacks sent to the webhooks registered for the app. Note that if you have multiple webhooks with shared triggers, multiple callbacks will be sent out for each triggering event. The default rate limit is 25.
    int webhooks?;
};

# A generic URL message.
public type UrlMessage record {
    # Required. The title shown close to the URL. The title will be clickable in some cases.
    string title?;
    # Required. The url to show.
    string url?;
};

# - `UNSPECIFIED_TRIGGER`: Using this value will cause errors. - `MESSAGE_DELIVERY`: Subscribe to delivery receipts for a message sent. - `EVENT_DELIVERY`: Subscribe to delivery receipts for a event sent. - `MESSAGE_INBOUND`: Subscribe to inbound messages from end users on the underlying channels. - `EVENT_INBOUND`: Subscribe to inbound events from end users on the underlying channels. - `CONVERSATION_START`: Subscribe to an event that is triggered when a new conversation has been started. - `CONVERSATION_STOP`: Subscribe to an event that is triggered when a active conversation has been stopped. - `CONTACT_CREATE`: Subscribe to an event that is triggered when a new contact has been created. - `CONTACT_DELETE`: Subscribe to an event that is triggered when a contact has been deleted. - `CONTACT_MERGE`: Subscribe to an event that is triggered when a two contacts are merged. - `UNSUPPORTED`: Subscribe to callbacks that are not natively supported by the Conversation API. - `OPT_IN`: Subscribe to opt_ins. - `OPT_OUT`: Subscribe to opt_outs. - `CAPABILITY`: Subscribe to see get capability results. - `CONVERSATION_DELETE`: Subscribe to get an event when a conversation is deleted.
public type WebhookTrigger string;

public type ListConversationsResponse record {
    # Output only. List of conversations matching the search query.
    Conversation[] conversations?;
    string next_page_token?;
    int total_size?;
};

public type SendEventRequest record {
    # Required. The ID of the app sending the event.
    string app_id?;
    # Overwrites the default callback url for delivery reports for this message The REST URL should be of the form: http://host[:port]/path
    string callback_url?;
    # Optional. Channel priority order that dictates on which channels the Conversation API should try to send the message on. The order provided here overrides any default.
    ConversationChannel[] channel_priority_order?;
    AppEvent event?;
    # Optional. Eventual metadata that should be associated to the event.
    string event_metadata?;
    # Required. The project ID.
    string project_id?;
    # Message queue priority.
    MessageQueue queue?;
    # Recipient information
    Recipient recipient?;
};

# A collection of messages exchanged between a contact and an app. Conversations are normally created on the fly by Conversation API once a message is sent and there is no active conversation already. There can be only one active conversation at any given time between a particular contact and an app.
public type Conversation record {
    # Flag for whether this conversation is active.
    boolean active?;
    # Channel Identifier
    ConversationChannel active_channel?;
    # The ID of the participating app.
    string app_id?;
    # The ID of the participating contact.
    string contact_id?;
    # The ID of the conversation.
    string id?;
    # Output only. The timestamp of the latest message in the conversation. The timestamp will be Thursday January 01, 1970 00:00:00 UTC if the conversation contains no messages.
    string last_received?;
    # An arbitrary data set by the Conversation API clients. Up to 1024 characters long.
    string metadata?;
};

# Static Token Credential
public type StaticTokenCredential record {
    # Required. The static token.
    string token?;
};

# The response received for an Opt-In request.
public type OptInResponse record {
    # An Opt-In contains the identity of the recipient which gave its consent to receive messages from Conversation API apps on a given channel.
    OptIn opt_in?;
    # ID for the asynchronous request, will be generated id if not set in request
    string request_id?;
};

# Enables access to the underlying messaging channel.
public type ConversationChannelCredential record {
    # The secret used to verify the channel callbacks for channels which support callback verification. The callback verification is not needed for Sinch-managed channels because the callbacks are not leaving Sinch internal networks. Max length is 256 characters. Note: leaving channel_callback_secret empty for channels with callback verification will disable the verification.
    string callback_secret?;
    # Channel Identifier
    ConversationChannel 'channel;
    # MMS channel credential
    MMSCredentials mms_credentials?;
    # It consists of claimed identity and a static token.
    StaticBearerCredential static_bearer?;
    # Static Token Credential
    StaticTokenCredential static_token?;
};

public type ProtobufAny record {
    string type_url?;
    string value?;
};

# Reason
public type Reason record {
    #  - UNKNOWN: UNKNOWN is used if no other code can be used to describe the encountered error.
    #  - INTERNAL_ERROR: An internal error occurred. Please save the entire callback if you want to
    # report an error.
    #  - RATE_LIMITED: The message or event was not sent due to rate limiting.
    #  - RECIPIENT_INVALID_CHANNEL_IDENTITY: The channel recipient identity was malformed.
    #  - RECIPIENT_NOT_REACHABLE: It was not possible to reach the contact, or channel recipient identity,
    # on the channel.
    #  - RECIPIENT_NOT_OPTED_IN: The contact, or channel recipient identity, has not opt-ed in on the channel.
    #  - OUTSIDE_ALLOWED_SENDING_WINDOW: The allowed sending window has expired. See the channel documentation
    # for more information about how the sending window works for the different
    # channels.
    #  - CHANNEL_FAILURE: The channel failed to accept the message. The Conversation API performs
    # multiple retries in case of transient errors
    #  - CHANNEL_BAD_CONFIGURATION: The configuration of the channel for the used App is wrong. The bad
    # configuration caused the channel to reject the message. Please see
    # the channel support documentation page for how to set it up correctly.
    #  - CHANNEL_CONFIGURATION_MISSING: The configuration of the channel is missing from the used App. Please see
    # the channel support documentation page for how to set it up correctly.
    #  - MEDIA_TYPE_UNSUPPORTED: Some of the referenced media files is of a unsupported media type. Please
    # read the channel support documentation page to find out the limitations
    # on media that the different channels impose.
    #  - MEDIA_TOO_LARGE: Some of the referenced media files are too large. Please read the channel
    # support documentation to find out the limitations on file size that the
    # different channels impose.
    #  - MEDIA_NOT_REACHABLE: The provided media link was not accessible from the Conversation API or
    # from the underlying channels. Please make sure that the media file is
    # accessible.
    #  - NO_CHANNELS_LEFT: No channels to try to send the message to. This error will occur if one
    # attempts to send a message to a channel with no channel identities or if
    # all applicable channels have been attempted.
    #  - TEMPLATE_NOT_FOUND: The referenced template was not found.
    #  - TEMPLATE_INSUFFICIENT_PARAMETERS: Sufficient template parameters was not given. All parameters defined
    # in the template must be provided when sending a template message
    #  - TEMPLATE_NON_EXISTING_LANGUAGE_OR_VERSION: The selected language, or version, of the referenced template did
    # not exist. Please check the available versions and languages of the template
    #  - DELIVERY_TIMED_OUT: The message delivery, or event delivery, failed due to a channel-imposed timeout.
    # See the channel support documentation page for further details
    # about how the different channels behave.
    #  - DELIVERY_REJECTED_DUE_TO_POLICY: The message or event was rejected by the channel due to a policy.
    # Some channels have specific policies that must be met to send a message.
    # See the channel support documentation page for more information about
    # when this error will be triggered.
    #  - CONTACT_NOT_FOUND: The provided Contact ID did not exist.
    #  - BAD_REQUEST: Conversation API validates send requests in two different stages.
    # The first stage is right before the message is enqueued.
    # If this first validation fails the API responds with 400 Bad Request
    # and the request is discarded immediately.
    # The second validation kicks in during message processing and
    # it normally contains channel specific validation rules.
    # Failures during second request validation are
    # delivered as callbacks to MESSAGE_DELIVERY (EVENT_DELIVERY) webhooks
    # with ReasonCode BAD_REQUEST.
    #  - UNKNOWN_APP: The used App is missing. This error may occur when the app is removed
    # during message processing.
    #  - NO_CHANNEL_IDENTITY_FOR_CONTACT: The contact has no channel identities setup, or the contact has no
    # channels setup for the resolved channel priorities.
    #  - CHANNEL_REJECT: Generic error for channel permanently rejecting a message.
    # Only used if no other better matching error can be used
    #  - NO_PERMISSION: No permission to perform action
    #  - NO_PROFILE_AVAILABLE: No available profile data for user
    #  - UNSUPPORTED_OPERATION: Generic error for channel unsupported operations.
    ReasonCode code?;
    # A textual description of the reason.
    string description?;
    #  - UNSPECIFIED_SUB_CODE: UNSPECIFIED_SUB_CODE is used if no other sub code can be used to describe the encountered error.
    #  - ATTACHMENT_REJECTED: The message attachment was rejected by the channel due to a policy.
    # Some channels have specific policies that must be met to receive an attachment.
    #  - MEDIA_TYPE_UNDETERMINED: The specified media urls media type could not be determined
    #  - INACTIVE_SENDER: The used credentials for the underlying channel is inactivated and not allowed to send or receive messages.
    ReasonSubCode sub_code?;
};

public type ListContactsResponse record {
    # List of contacts belonging to the specified project.
    Contact[] contacts?;
    # Token that should be included in the next list contacts request to fetch the next page.
    string next_page_token?;
};

public type ListAppsResponse record {
    # List of apps belonging to a specific project ID.
    App[] apps?;
};

# Contact language
public type ContactLanguage string;

public type MergeContactRequest record {
    # Required. The ID of the contact that should be kept.
    string destination_id?;
    # Required. The project ID.
    string project_id?;
    # Required. The ID of the contact that should be removed.
    string source_id?;
    ConversationMergeStrategy strategy?;
};

# Conversation direction
public type ConversationDirection string;

public type ConversationMergeStrategy string;

# Channel Identifier
public type ConversationChannel string;

# The response received for an Opt-Out request.
public type OptOutResponse record {
    # An Opt-Out contains the identity of the recipient which retract its consent to receive messages from Conversation API apps on a given channel.
    OptOut opt_out?;
    # ID for the asynchronous request, will be generated id if not set in request
    string request_id?;
};

# Message with geo location
public type LocationMessage record {
    # Geographic coordinates
    Coordinates coordinates?;
    # Optional. Label or name for the position.
    string label?;
    # Required. The title is shown close to the button or link that leads to a map showing the location. The title is clickable in some cases.
    string title?;
};

# Conversation message view.
public type ConversationMessagesView string;

# Retention policy for messages and conversations
public type RetentionPolicy record {
    #  - MESSAGE_EXPIRE_POLICY: The default retention policy where messages older than
    # ttl_days are automatically deleted from Conversation API database.
    #  - CONVERSATION_EXPIRE_POLICY: The conversation expire policy only considers the last message in a conversation.
    # If the last message is older that ttl_days the entire conversation is deleted.
    # The difference with MESSAGE_EXPIRE_POLICY is that messages with accept_time
    # older than ttl_days are persisted as long as there is a newer message in the
    # same conversation.
    #  - PERSIST_RETENTION_POLICY: Persist policy does not delete old messages or conversations.
    # Please note that message storage might be subject to additional charges
    # in the future.
    RetentionPolicyType retention_type?;
    # Optional. The days before a message or conversation is eligible for deletion. Default value is 180. The ttl_days value has no effect when retention_type is PERSIST_RETENTION_POLICY. The valid values for this field are [1 - 3650]. Note that retention cleanup job runs once every twenty-four hours which can lead to delay i.e., messages and conversations are not deleted on the minute they become eligible for deletion.
    int ttl_days?;
};

# The referenced template can be an omnichannel template stored in Conversation API Template Store as AppMessage or it can reference external channel-specific template such as WhatsApp Business Template.
public type TemplateReference record {
    # Optional. The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier. English is the default language_code.
    string language_code?;
    # Optional. Required if the template has parameters. Concrete values must be present for all defined parameters in the template. Parameters can be different for different versions and/or languages of the template.
    record {} parameters?;
    # Required. The ID of the template.
    string template_id?;
    # Required. Used to specify what version of a template to use. This will be used in conjunction with language_code.
    string 'version?;
};

#  - MESSAGE_EXPIRE_POLICY: The default retention policy where messages older than
# ttl_days are automatically deleted from Conversation API database.
#  - CONVERSATION_EXPIRE_POLICY: The conversation expire policy only considers the last message in a conversation.
# If the last message is older that ttl_days the entire conversation is deleted.
# The difference with MESSAGE_EXPIRE_POLICY is that messages with accept_time
# older than ttl_days are persisted as long as there is a newer message in the
# same conversation.
#  - PERSIST_RETENTION_POLICY: Persist policy does not delete old messages or conversations.
# Please note that message storage might be subject to additional charges
# in the future.
public type RetentionPolicyType string;

# A participant in a conversation typically representing a person. It is associated with a collection of channel identities.
public type Contact record {
    # List of channel identities.
    ChannelIdentity[] channel_identities?;
    # List of channels defining the channel priority.
    ConversationChannel[] channel_priority?;
    # Optional. The display name. A default 'Unknown' will be assigned if left empty.
    string display_name?;
    # Optional. Email of the contact.
    string email?;
    # Optional. Contact identifier in an external system.
    string external_id?;
    # The ID of the contact.
    string id;
    # Contact language
    ContactLanguage language;
    # Optional. Metadata associated with the contact. Up to 1024 characters long.
    string metadata?;
};

# Conversation metadata report view.
public type ConversationMetadataReportView string;

public type ListMessagesResponse record {
    # Output only. List of messages associated to the referenced conversation.
    ConversationMessage[] messages?;
    string next_page_token?;
};

# Message containing text, media and choices.
public type CardMessage record {
    # Optional. The number of choices is limited to 3.
    Choice[] choices?;
    # Optional.
    string description?;
    # Card height
    CardHeight height?;
    # Message containing media
    MediaMessage media_message?;
    # Required.
    string title?;
};

public type TranscodeMessageRequest record {
    # Required. The ID of the app used to transcode the message.
    string app_id?;
    # Message originating from an app
    AppMessage app_message?;
    # Required. The list of channels for which the message shall be transcoded to.
    ConversationChannel[] channels?;
    # Optional.
    string 'from?;
    # Required. The project ID.
    string project_id?;
    # Optional.
    string to?;
};

# Channel identities.
public type ChannelIdentities record {
    # A list of specific channel identities. The API will use these identities when sending to specific channels.
    ChannelRecipientIdentity[] channel_identities;
};

# Represents a destination for receiving callbacks from the Conversation API.
public type Webhook record {
    # The app that this webhook belongs to.
    string app_id;
    # Client credentials
    ClientCredentials client_credentials?;
    # Output only. The ID of the webhook.
    string id?;
    # Optional secret be used to sign contents of webhooks sent by the Conversation API. You can then use the secret to verify the signature.
    string secret?;
    # The target url where events should be sent to. Maximum URL length is 742.
    string target;
    # Webhook target-type
    WebhookTargetType target_type?;
    # An array of triggers that should trigger the webhook and result in a event being sent to the target url. - `UNSPECIFIED_TRIGGER`: Using this value will cause errors. - `MESSAGE_DELIVERY`: Subscribe to delivery receipts for a message sent. - `EVENT_DELIVERY`: Subscribe to delivery receipts for a event sent. - `MESSAGE_INBOUND`: Subscribe to inbound messages from end users on the underlying channels. - `EVENT_INBOUND`: Subscribe to inbound events from end users on the underlying channels. - `CONVERSATION_START`: Subscribe to an event that is triggered when a new conversation has been started. - `CONVERSATION_STOP`: Subscribe to an event that is triggered when a active conversation has been stopped. - `CONTACT_CREATE`: Subscribe to an event that is triggered when a new contact has been created. - `CONTACT_DELETE`: Subscribe to an event that is triggered when a contact has been deleted. - `CONTACT_MERGE`: Subscribe to an event that is triggered when a two contacts are merged. - `UNSUPPORTED`: Subscribe to callbacks that are not natively supported by the Conversation API. - `OPT_IN`: Subscribe to opt_ins. - `OPT_OUT`: Subscribe to opt_outs. - `CAPABILITY`: Subscribe to see get capability results. - `CONVERSATION_DELETE`: Subscribe to get an event when a conversation is deleted.
    WebhookTrigger[] triggers;
};

# Message originating from an app
public type AppMessage record {
    # Message containing text, media and choices.
    CardMessage card_message?;
    # Message containing a list of cards often rendered horizontally on supported channels. Supported types for media are only images, e.g. .png, .jpg, .jpeg extensions.
    CarouselMessage carousel_message?;
    # Message containing choices/actions.
    ChoiceMessage choice_message?;
    # Optional. Channel specific messages, overriding any transcoding. The key in the map must point to a valid conversation channel as defined by the enum ConversationChannel.
    record {} explicit_channel_message?;
    # Message with geo location
    LocationMessage location_message?;
    # Message containing media
    MediaMessage media_message?;
    # Message referring to predefined template
    TemplateMessage template_message?;
    # Message containing only text
    TextMessage text_message?;
};

# Fallback message, appears when original contact message can not be handled
public type FallbackMessage record {
    # Optional. The raw fallback message if provided by the channel.
    string raw_message?;
    # Reason
    Reason reason?;
};

# Client credentials
public type ClientCredentials record {
    # The Client ID that will be used in the Client Credentials flow.
    string client_id;
    # The Client Secret that will be used in the Client Credentials flow.
    string client_secret;
    # The endpoint that will be used in the Client Credentials flow.
    string endpoint;
};

public type ListWebhooksResponse record {
    Webhook[] webhooks?;
};
