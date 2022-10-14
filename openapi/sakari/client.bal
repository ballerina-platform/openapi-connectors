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
public type ClientConfig record {|
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://api.sakari.io/oauth2/token";
|};

# This is a generated connector from [Sakari](https://sakari.io/) OpenAPI Specification.
# Sakari provides an advanced platform to drive large scale customized SMS communication
# To find out more about our product offering, please visit [https://sakari.io](https://sakari.io).
@display {label: "Sakari", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Sakari account](https://api.sakari.io) and obtain tokens following [this guide](https://developer.sakari.io/docs#section/Finding-your-client-id-client-secret-and-account-id)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.sakari.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get token for accessing APIs
    #
    # + payload - Request payload for obtaining token 
    # + return - successful operation 
    remote isolated function authToken(TokenRequest payload) returns TokenResponse|error {
        string resourcePath = string `/oauth2/token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TokenResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch contacts
    #
    # + accountId - Account to apply operations to 
    # + offset - Results to skip when paginating through a result set 
    # + 'limit - Maximum number of results to return 
    # + firstName - Filter by first name or part of 
    # + lastName - Filter by last name or part of 
    # + mobile - Filter by mobile or part of 
    # + email - Filter by email or part of 
    # + tags - Filter by tag(s) 
    # + return - successful operation 
    remote isolated function fetchAllContacts(string accountId, int? offset = (), int? 'limit = (), string? firstName = (), string? lastName = (), string? mobile = (), string? email = (), string? tags = ()) returns ContactsResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/contacts`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "firstName": firstName, "lastName": lastName, "mobile": mobile, "email": email, "tags": tags};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create contact
    #
    # + accountId - Account to apply operations to 
    # + mergeStrategy - Determines how existing contacts with matching mobile numbers are treated 
    # + payload - Create contact request payload 
    # + return - successful operation 
    remote isolated function createContact(string accountId, ContactRequest payload, string? mergeStrategy = ()) returns InlineResponse201|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/contacts`;
        map<anydata> queryParam = {"mergeStrategy": mergeStrategy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch contact by ID
    #
    # + accountId - Account to apply operations to 
    # + contactId - ID of contact to return 
    # + return - successful operation 
    remote isolated function fetchContact(string accountId, string contactId) returns ContactResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        ContactResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a contact
    #
    # + accountId - Account to apply operations to 
    # + contactId - ID of contact 
    # + return - successful operation 
    remote isolated function contactsUpdate(string accountId, string contactId) returns ContactResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ContactResponse response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Deletes a contact
    #
    # + accountId - Account to apply operations to 
    # + contactId - Contact id to delete 
    # + return - successful operation 
    remote isolated function removeContact(string accountId, string contactId) returns InlineResponse200|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        InlineResponse200 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Fetch messages
    #
    # + accountId - Account to apply operations to 
    # + offset - Results to skip when paginating through a result set 
    # + 'limit - Maximum number of results to return 
    # + contactId - ID of contact 
    # + conversationId - ID of conversation 
    # + return - successful operation 
    remote isolated function fetchAllMessages(string accountId, int? offset = (), int? 'limit = (), string? contactId = (), string? conversationId = ()) returns MessagesResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/messages`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "contactId": contactId, "conversationId": conversationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MessagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Send Messages
    #
    # + accountId - Account to apply operations to 
    # + payload - Send message request payload 
    # + return - successful operation 
    remote isolated function sendMessage(string accountId, SendMessagesRequest payload) returns SendMessagesResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/messages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendMessagesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch message by id
    #
    # + accountId - Account to apply operations to 
    # + messageId - ID of message to return 
    # + return - successful operation 
    remote isolated function fetchMessages(string accountId, string messageId) returns MessageResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/messages/${getEncodedUri(messageId)}`;
        MessageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch templates
    #
    # + accountId - Account to apply operations to 
    # + offset - Results to skip when paginating through a result set 
    # + 'limit - Maximum number of results to return 
    # + name - Filter by name or part of 
    # + return - successful operation 
    remote isolated function fetchAllTemplates(string accountId, int? offset = (), int? 'limit = (), string? name = ()) returns TemplatesResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/templates`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplatesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create template
    #
    # + accountId - Account to apply operations to 
    # + payload - Create template request payload. 
    # + return - successful operation 
    remote isolated function createTemplate(string accountId, TemplateRequest payload) returns TemplatesResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/templates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplatesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch template by ID
    #
    # + accountId - Account to apply operations to 
    # + templateId - ID of template to return 
    # + return - successful operation 
    remote isolated function fetchTemplate(string accountId, string templateId) returns TemplateResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        TemplateResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a template
    #
    # + accountId - Account to apply operations to 
    # + templateId - ID of template 
    # + return - successful operation 
    remote isolated function updateTemplate(string accountId, string templateId) returns TemplateResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemplateResponse response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Deletes a template
    #
    # + accountId - Account to apply operations to 
    # + templateId - Template id to delete 
    # + return - successful operation 
    remote isolated function removeTemplate(string accountId, string templateId) returns InlineResponse200|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        InlineResponse200 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Fetch campaigns
    #
    # + accountId - Account to apply operations to 
    # + offset - Results to skip when paginating through a result set 
    # + 'limit - Maximum number of results to return 
    # + name - Filter by name or part of 
    # + return - successful operation 
    remote isolated function fetchAllCampaigns(string accountId, int? offset = (), int? 'limit = (), string? name = ()) returns CampaignsResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/campaigns`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CampaignsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create campaign
    #
    # + accountId - Account to apply operations to 
    # + payload - Create campaign request payload 
    # + return - successful operation 
    remote isolated function createCampaigns(string accountId, CampaignRequest payload) returns CampaignResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch campaign by ID
    #
    # + accountId - Account to apply operations to 
    # + campaignId - ID of campaign to return 
    # + return - successful operation 
    remote isolated function fetchCampaign(string accountId, string campaignId) returns CampaignResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/campaigns/${getEncodedUri(campaignId)}`;
        CampaignResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a campaign
    #
    # + accountId - Account to apply operations to 
    # + campaignId - ID of campaign 
    # + return - successful operation 
    remote isolated function updateCampaign(string accountId, string campaignId) returns CampaignResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/campaigns/${getEncodedUri(campaignId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignResponse response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Deletes a campaign
    #
    # + accountId - Account to apply operations to 
    # + campaignId - Campaign id to delete 
    # + return - successful operation 
    remote isolated function removeCampaign(string accountId, string campaignId) returns InlineResponse200|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/campaigns/${getEncodedUri(campaignId)}`;
        InlineResponse200 response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Fetch conversations
    #
    # + accountId - Account to apply operations to 
    # + offset - Results to skip when paginating through a result set 
    # + 'limit - Maximum number of results to return 
    # + return - successful operation 
    remote isolated function fetchAllConversations(string accountId, int? offset = (), int? 'limit = ()) returns ConversationsResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/conversations`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConversationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch conversation by ID
    #
    # + accountId - Account to apply operations to 
    # + conversationId - ID of template to return 
    # + return - successful operation 
    remote isolated function fetchConversation(string accountId, string conversationId) returns ConversationResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/conversations/${getEncodedUri(conversationId)}`;
        ConversationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Closes a conversation
    #
    # + accountId - Account to apply operations to 
    # + conversationId - ID of conversation 
    # + return - successful operation 
    remote isolated function closeConversation(string accountId, string conversationId) returns ConversationResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/conversations/${getEncodedUri(conversationId)}/close`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ConversationResponse response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Share file - use to host a file and generate a short link to be used directly in a message or as a link to media for a MMS
    #
    # + payload - Binary form of the file 
    # + return - successful operation 
    remote isolated function shareFile(byte[] payload) returns ShareFileResponse|error {
        string resourcePath = string `/tools/sharefile`;
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        ShareFileResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch active webhooks
    #
    # + accountId - Account to apply operations to 
    # + return - successful operation 
    remote isolated function fetchAllWebhooks(string accountId) returns WebhooksResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/webhooks`;
        WebhooksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Subscribe to message events
    #
    # + accountId - Account to apply operations to 
    # + payload - Message event subscribe request payload 
    # + return - successful operation 
    remote isolated function subscribeWebhooks(string accountId, AccountidWebhooksBody payload) returns WebhookResponse|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhookResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unsubscribe to message events
    #
    # + accountId - Account to apply operations to 
    # + url - Account to apply operations to 
    # + return - successful operation 
    remote isolated function unsubscribeWebhooks(string accountId, string url) returns http:Response|error {
        string resourcePath = string `/accounts/${getEncodedUri(accountId)}/webhooks/${getEncodedUri(url)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
