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

# Id of the account to apply operations to
public type AccountId string;

# Type of the event
public type EventType string;

public type ContactsResponse record {
    *PaginatedResponse;
    Contact[] data?;
};

# Represent error
public type ErrorresponseError record {
    # Error code
    string code?;
    # Error message
    string message?;
};

public type Template record {
    *TemplateRequest;
    string id?;
};

public type ContactuploadresponseData record {
    # Uploaded contacts
    Contact[] contacts?;
    # Contacts that failed validation
    Contact[] errors?;
    int submitted?;
    int inserted?;
    int updated?;
    int success?;
};

# Updated by
public type UpdatedBy record {
    # Id of the update author
    string id?;
    # First name of the update author
    string firstName?;
    # Last name of the update author
    string lastName?;
};

# Pagination response
public type PaginatedResponse record {
    # Success
    boolean success?;
    PaginatedresponsePagination pagination?;
    # Represent an API pagination error
    PaginatedresponseError 'error?;
};

public type SendMessagesRequest record {
    # List of conversation ids to send messages to
    string[] conversations?;
    ContactRequest[] contacts?;
    SendmessagesrequestFilters filters?;
    string template?;
    string 'type?;
    # List of media objects to attach to message
    SendmessagesrequestMedia[] media?;
    string conversationStrategy?;
};

public type SendmessagesresponseData record {
    Message[] messages?;
    string jobId?;
    int queued?;
    decimal estimatedPrice?;
};

public type MessageConversation record {
    string id?;
};

# Get token for accessing the API
public type TokenRequest record {
    # Grant type
    string grant_type?;
    # Client Id
    string client_id?;
    # Client secret
    string client_secret?;
};

public type SendmessagesrequestFilters record {
    string[] tags?;
    record {}[] attributes?;
};

# Represent an API pagination error
public type PaginatedresponseError record {
    # Error code
    string code?;
    # Error message
    string message?;
};

public type MessageMedia record {
    string url?;
    string 'type?;
    string filename?;
};

# Represent resource update details
public type Updated record {
    # Updated date time
    string at?;
    # Updated by
    UpdatedBy 'by?;
};

public type TemplateRequest record {
    string name?;
    string 'type?;
    string template?;
};

public type CampaignResponse record {
    boolean success?;
    Campaign data?;
};

public type MessageEventPayload record {
    # Contact information
    ContactIdentifiers contact?;
    string message?;
    string status?;
    string 'error?;
};

public type MessageResponse record {
    boolean success?;
    Message data?;
};

public type WebhookResponse record {
    boolean success?;
    Webhook data?;
};

public type WebhooksResponse record {
    *PaginatedResponse;
    Webhook[] data?;
};

public type CampaignRequest record {
    CampaignrequestTrigger trigger?;
    CampaignrequestFilters filters?;
    string template?;
};

public type SendMessagesResponse record {
    SendmessagesresponseData data?;
};

public type Campaign record {
    string id?;
};

public type TokenResponse record {
    # Access token
    string access_token?;
    # Token type
    string token_type?;
};

public type PaginatedresponsePagination record {
    # Total record count
    int totalCount?;
    # Per page count
    int 'limit?;
    # Page offset
    int offset?;
};

public type CampaignsResponse record {
    *PaginatedResponse;
    Campaign[] data?;
};

public type AttributeFilter record {
    string name?;
    string comparator?;
    string value?;
};

public type ToolsSharefileBody record {
    string media?;
};

public type ContactRequest record {
    *ContactIdentifiers;
    Tag[] tags?;
    record {} attributes?;
};

public type Message record {
    string id?;
    # Contact information
    ContactIdentifiers contact?;
    MessageConversation conversation?;
    string message?;
    string template?;
    boolean outgoing?;
    string phoneNumber?;
    decimal price?;
    decimal segments?;
    boolean read?;
    string status?;
    # List of media objects attached to message
    MessageMedia[] media?;
    # Represent API error
    Error 'error?;
    # Represent resource update details
    Updated created?;
    # Represent resource update details
    Updated updated?;
};

public type TemplatesResponse record {
    *PaginatedResponse;
    Template[] data?;
};

public type SharefileresponseData record {
    string link?;
    string expires?;
};

public type MessagesResponse record {
    *PaginatedResponse;
    Message[] data?;
};

public type InlineResponse201 ContactsResponse|ContactUploadResponse;

public type InlineResponse200 record {
    boolean success?;
};

public type Conversation record {
    string id?;
    # Contact information
    ContactIdentifiers contact?;
    boolean closed?;
    Message lastMessage?;
    # Phone number resource
    PhoneNumber phoneNumber?;
    string[] unread?;
    # Represent resource update details
    Updated created?;
    # Represent resource update details
    Updated updated?;
};

# Mobile number
public type ContactidentifiersMobile record {
    # Country code
    string country?;
    # Mobile number
    string number?;
};

# Contact information
public type ContactIdentifiers record {
    # Contact information Id
    string id?;
    # Email address
    string email?;
    # First name
    string firstName?;
    # Last name
    string lastName?;
    # Mobile number
    ContactidentifiersMobile mobile?;
};

public type ConversationResponse record {
    boolean success?;
    Conversation data?;
};

public type TemplateResponse record {
    boolean success?;
    Template data?;
};

public type CampaignrequestTrigger record {
    # Campaign type specifies how it sources contacts and what event triggers its execution Sort order
    #   * `M` - Manual
    #   * `S` - Scheduled
    #   * `FU` - File Upload
    string code?;
};

public type AccountEventPayload record {
    decimal balance?;
};

public type CampaignrequestFilters record {
    string[] contacts?;
    string[] tags?;
    string[] attributes?;
};

public type SendmessagesrequestMedia record {
    string url?;
};

public type AccountidWebhooksBody record {
    string url?;
    string[] eventTypes?;
};

# Contact response
public type ContactResponse record {
    # Whether the request is success or not
    boolean success?;
    Contact data?;
};

public type AccountEvent record {
    # Type of the event
    EventType 'type?;
    # Id of the account to apply operations to
    AccountId accountId?;
};

public type ShareFileResponse record {
    boolean success?;
    SharefileresponseData data?;
};

# Represent API error
public type Error record {
    # Error code
    string code?;
    # Error message
    string description?;
};

# Contact upload response
public type ContactUploadResponse record {
    # Whether the request is success
    boolean success?;
    ContactuploadresponseData data?;
};

public type ConversationsResponse record {
    *PaginatedResponse;
    Conversation[] data?;
};

public type Contact record {
    *ContactRequest;
    # Validity
    boolean valid?;
    # Represent API error
    Error 'error?;
    # Represent resource update details
    Updated created?;
    # Represent resource update details
    Updated updated?;
};

# Represent response error
public type ErrorResponse record {
    # Whether the request is success
    boolean success?;
    # Represent error
    ErrorresponseError 'error?;
};

# Phone number resource
public type PhoneNumber record {
    # Country code
    string country?;
    # Phone number
    string number?;
    # Whether phone number is active
    boolean active?;
};

public type Event record {
    string eventId?;
    # Type of the event
    EventType 'type?;
    # Id of the account to apply operations to
    AccountId accountId?;
    AccountEventPayload|MessageEventPayload data?;
};

public type Webhook record {
    string url?;
    string[] eventTypes?;
};

# Filter by tag(s)
public type Tag record {
    # Tag type
    string tag?;
    # Whether visible
    boolean visible?;
};
