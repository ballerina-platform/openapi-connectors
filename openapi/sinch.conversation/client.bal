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

# This is a generated connector for [Sinch Conversation API v1.0](https://www.sinch.com/) OpenAPI specification.
# Send and receive messages globally over SMS, RCS, WhatsApp, Viber Business, Facebook messenger and other popular channels using the Sinch Conversation API.
# The Conversation API endpoint uses built-in transcoding to give you the power of conversation across all supported channels and, if required, full control over channel specific features.
@display {label: "Sinch Conversation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/conversation/api-reference#authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://eu.conversation.api.sinch.com") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Send a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Send message request 
    # + return - A successful response. 
    remote isolated function messagesSendmessage(string projectId, SendMessageRequest payload) returns SendMessageResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/messages:send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendMessageResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageId - The conversation message ID. 
    # + return - A successful response. 
    remote isolated function messagesGetmessage(string projectId, string messageId) returns ConversationMessage|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/messages/${getEncodedUri(messageId)}`;
        ConversationMessage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageId - The conversation message ID. 
    # + return - A successful response. 
    remote isolated function messagesDeletemessage(string projectId, string messageId) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/messages/${getEncodedUri(messageId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List all apps for a given project
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appListapps(string projectId) returns ListAppsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps`;
        ListAppsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The app to create. 
    # + return - A successful response. 
    remote isolated function appCreateapp(string projectId, App payload) returns App|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        App response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appGetapp(string projectId, string appId) returns App|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps/${getEncodedUri(appId)}`;
        App response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appDeleteapp(string projectId, string appId) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps/${getEncodedUri(appId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + updateMaskPaths - The set of field mask paths. 
    # + payload - The updated app. 
    # + return - A successful response. 
    remote isolated function appUpdateapp(string projectId, string appId, App payload, string[]? updateMaskPaths = ()) returns App|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps/${getEncodedUri(appId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        App response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List all webhooks for a given app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function webhooksListwebhooks(string projectId, string appId) returns ListWebhooksResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/apps/${getEncodedUri(appId)}/webhooks`;
        ListWebhooksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Capability lookup
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The query capability request. 
    # + return - A successful response. 
    remote isolated function capabilityQuerycapability(string projectId, QueryCapability payload) returns QueryCapabilityResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/capability:query`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QueryCapabilityResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get contacts
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + pageSize - Optional. The maximum number of contacts to fetch. The default is 10 and the maximum is 20. 
    # + pageToken - Optional. Next page token previously returned if any. 
    # + return - A successful response. 
    remote isolated function contactListcontacts(string projectId, int? pageSize = (), string? pageToken = ()) returns ListContactsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts`;
        map<anydata> queryParam = {"page_size": pageSize, "page_token": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListContactsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Required. The contact to be added. 
    # + return - A successful response. 
    remote isolated function contactCreatecontact(string projectId, Contact payload) returns Contact|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Contact response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + return - A successful response. 
    remote isolated function contactGetcontact(string projectId, string contactId) returns Contact|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts/${getEncodedUri(contactId)}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + return - A successful response. 
    remote isolated function contactDeletecontact(string projectId, string contactId) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts/${getEncodedUri(contactId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + updateMaskPaths - The set of field mask paths. 
    # + payload - The updated contact. 
    # + return - A successful response. 
    remote isolated function contactUpdatecontact(string projectId, string contactId, Contact payload, string[]? updateMaskPaths = ()) returns Contact|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts/${getEncodedUri(contactId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Contact response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Merge two contacts
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + destinationId - The unique ID of the contact that should be kept when merging two contacts. 
    # + payload - Merge contact request. 
    # + return - A successful response. 
    remote isolated function contactMergecontact(string projectId, string destinationId, MergeContactRequest payload) returns Contact|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/contacts/${getEncodedUri(destinationId)}:merge`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Contact response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List conversations
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The ID of the app involved in the conversations. 
    # + contactId - Resource name (ID) of the contact. 
    # + onlyActive - Required. True if only active conversations should be listed. 
    # + pageSize - Optional. The maximum number of conversations to fetch. Defaults to 10 and the maximum is 20. 
    # + pageToken - Optional. Next page token previously returned if any. 
    # + return - A successful response. 
    remote isolated function conversationListconversations(string projectId, boolean onlyActive, string? appId = (), string? contactId = (), int? pageSize = (), string? pageToken = ()) returns ListConversationsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations`;
        map<anydata> queryParam = {"app_id": appId, "contact_id": contactId, "only_active": onlyActive, "page_size": pageSize, "page_token": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListConversationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The conversation to create. ID will be generated for the conversation and any ID in the given conversation will be ignored. 
    # + return - A successful response. 
    remote isolated function conversationCreateconversation(string projectId, Conversation payload) returns Conversation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Conversation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationGetconversation(string projectId, string conversationId) returns Conversation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations/${getEncodedUri(conversationId)}`;
        Conversation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationDeleteconversation(string projectId, string conversationId) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations/${getEncodedUri(conversationId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + updateMaskPaths - The set of field mask paths. 
    # + payload - The updated conversation. 
    # + return - A successful response. 
    remote isolated function conversationUpdateconversation(string projectId, string conversationId, Conversation payload, string[]? updateMaskPaths = ()) returns Conversation|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations/${getEncodedUri(conversationId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Conversation response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Stop conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationStopactiveconversation(string projectId, string conversationId) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations/${getEncodedUri(conversationId)}:stop`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Inject messages
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageConversationId - Required. The ID of the conversation. 
    # + payload - Message to be injected. ID field of the message is ignored and instead generated on the server. 
    # + return - A successful response. 
    remote isolated function conversationInjectmessage(string projectId, string messageConversationId, ConversationMessage payload) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/conversations/${getEncodedUri(messageConversationId)}:inject-message`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Send an event
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Send event request. 
    # + return - A successful response. 
    remote isolated function eventsSendevent(string projectId, SendEventRequest payload) returns SendEventResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/events:send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendEventResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List messages
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - Resource name (ID) of the conversation. 
    # + contactId - Resource name (ID) of the contact. 
    # + pageSize - Optional. Maximum number of messages to fetch. Defaults to 10 and the maximum is 20. 
    # + pageToken - Optional. Next page token previously returned if any. 
    # + view - Conversation message view. 
    # + return - A successful response. 
    remote isolated function conversationListmessages(string projectId, string? conversationId = (), string? contactId = (), int? pageSize = (), string? pageToken = (), ConversationMessagesView? view = ()) returns ListMessagesResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/messages`;
        map<anydata> queryParam = {"conversation_id": conversationId, "contact_id": contactId, "page_size": pageSize, "page_token": pageToken, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListMessagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Transcode a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Transaction code message request. 
    # + return - A successful response. 
    remote isolated function transcodingTranscodemessage(string projectId, TranscodeMessageRequest payload) returns TranscodeMessageResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/messages:transcode`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TranscodeMessageResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Register an opt-in
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + requestId - ID for the asynchronous request, will be generated if not set. Currently this field is not used for idempotency but it will be added in v1. 
    # + payload - OptIn request. 
    # + return - A successful response. 
    remote isolated function optinRegisteroptin(string projectId, OptIn payload, string? requestId = ()) returns OptInResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/optins:register`;
        map<anydata> queryParam = {"request_id": requestId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OptInResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Register an opt-out
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + requestId - ID for the asynchronous request, will be generated if not set. Currently this field is not used for idempotency but it will be added in v1. 
    # + payload - OptOut request 
    # + return - A successful response. 
    remote isolated function optinRegisteroptout(string projectId, OptOut payload, string? requestId = ()) returns OptOutResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/optouts:register`;
        map<anydata> queryParam = {"request_id": requestId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OptOutResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a new webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Required. The Webhook to create 
    # + return - A successful response. 
    remote isolated function webhooksCreatewebhook(string projectId, Webhook payload) returns Webhook|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function webhooksGetwebhook(string projectId, string webhookId, string[]? updateMaskPaths = ()) returns Webhook|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/webhooks/${getEncodedUri(webhookId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Webhook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an existing webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function webhooksDeletewebhook(string projectId, string webhookId, string[]? updateMaskPaths = ()) returns json|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/webhooks/${getEncodedUri(webhookId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update an existing webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + updateMaskPaths - The set of field mask paths. 
    # + payload - Required. The Webhook to update 
    # + return - A successful response. 
    remote isolated function webhooksUpdatewebhook(string projectId, string webhookId, Webhook payload, string[]? updateMaskPaths = ()) returns Webhook|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(projectId)}/webhooks/${getEncodedUri(webhookId)}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        map<Encoding> queryParamEncoding = {"update_mask.paths": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
