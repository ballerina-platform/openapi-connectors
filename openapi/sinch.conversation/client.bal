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

import ballerina/http;
import ballerina/url;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2ClientCredentialsGrantConfig|http:CredentialsConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
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
|};

# This is a generated connector for [Sinch Conversation API v1.0](https://www.sinch.com/) OpenAPI specification. 
# The Conversation API endpoint uses built-in transcoding to give you the power of conversation across all supported channels and, if required, full control over channel specific features.
@display {label: "Sinch Conversation", iconPath: "resources/sinch.conversation.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/conversation/api-reference#authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://eu.conversation.api.sinch.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Send a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Send message request 
    # + return - A successful response. 
    remote isolated function messagesSendmessage(string projectId, SendMessageRequest payload) returns SendMessageResponse|error {
        string  path = string `/v1/projects/${projectId}/messages:send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendMessageResponse response = check self.clientEp->post(path, request, targetType=SendMessageResponse);
        return response;
    }
    # Get a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageId - The conversation message ID. 
    # + return - A successful response. 
    remote isolated function messagesGetmessage(string projectId, string messageId) returns ConversationMessage|error {
        string  path = string `/v1/projects/${projectId}/messages/${messageId}`;
        ConversationMessage response = check self.clientEp-> get(path, targetType = ConversationMessage);
        return response;
    }
    # Deletes a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageId - The conversation message ID. 
    # + return - A successful response. 
    remote isolated function messagesDeletemessage(string projectId, string messageId) returns json|error {
        string  path = string `/v1/projects/${projectId}/messages/${messageId}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # List all apps for a given project
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appListapps(string projectId) returns ListAppsResponse|error {
        string  path = string `/v1/projects/${projectId}/apps`;
        ListAppsResponse response = check self.clientEp-> get(path, targetType = ListAppsResponse);
        return response;
    }
    # Creates an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The app to create. 
    # + return - A successful response. 
    remote isolated function appCreateapp(string projectId, App payload) returns App|error {
        string  path = string `/v1/projects/${projectId}/apps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        App response = check self.clientEp->post(path, request, targetType=App);
        return response;
    }
    # Get an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appGetapp(string projectId, string appId) returns App|error {
        string  path = string `/v1/projects/${projectId}/apps/${appId}`;
        App response = check self.clientEp-> get(path, targetType = App);
        return response;
    }
    # Delete an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function appDeleteapp(string projectId, string appId) returns json|error {
        string  path = string `/v1/projects/${projectId}/apps/${appId}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Update an app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The updated app. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function appUpdateapp(string projectId, string appId, App payload, string[]? updateMaskPaths = ()) returns App|error {
        string  path = string `/v1/projects/${projectId}/apps/${appId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        App response = check self.clientEp->patch(path, request, targetType=App);
        return response;
    }
    # List all webhooks for a given app
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + appId - The unique ID of the app. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + return - A successful response. 
    remote isolated function webhooksListwebhooks(string projectId, string appId) returns ListWebhooksResponse|error {
        string  path = string `/v1/projects/${projectId}/apps/${appId}/webhooks`;
        ListWebhooksResponse response = check self.clientEp-> get(path, targetType = ListWebhooksResponse);
        return response;
    }
    # Capability lookup
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The query capability request. 
    # + return - A successful response. 
    remote isolated function capabilityQuerycapability(string projectId, QueryCapability payload) returns QueryCapabilityResponse|error {
        string  path = string `/v1/projects/${projectId}/capability:query`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        QueryCapabilityResponse response = check self.clientEp->post(path, request, targetType=QueryCapabilityResponse);
        return response;
    }
    # Get contacts
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + pageSize - Optional. The maximum number of contacts to fetch. The default is 10 and the maximum is 20. 
    # + pageToken - Optional. Next page token previously returned if any. 
    # + return - A successful response. 
    remote isolated function contactListcontacts(string projectId, int? pageSize = (), string? pageToken = ()) returns ListContactsResponse|error {
        string  path = string `/v1/projects/${projectId}/contacts`;
        map<anydata> queryParam = {"page_size": pageSize, "page_token": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListContactsResponse response = check self.clientEp-> get(path, targetType = ListContactsResponse);
        return response;
    }
    # Create a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Required. The contact to be added. 
    # + return - A successful response. 
    remote isolated function contactCreatecontact(string projectId, Contact payload) returns Contact|error {
        string  path = string `/v1/projects/${projectId}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->post(path, request, targetType=Contact);
        return response;
    }
    # Get a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + return - A successful response. 
    remote isolated function contactGetcontact(string projectId, string contactId) returns Contact|error {
        string  path = string `/v1/projects/${projectId}/contacts/${contactId}`;
        Contact response = check self.clientEp-> get(path, targetType = Contact);
        return response;
    }
    # Delete a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + return - A successful response. 
    remote isolated function contactDeletecontact(string projectId, string contactId) returns json|error {
        string  path = string `/v1/projects/${projectId}/contacts/${contactId}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Update a Contact
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + contactId - The unique ID of the contact. 
    # + payload - The updated contact. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function contactUpdatecontact(string projectId, string contactId, Contact payload, string[]? updateMaskPaths = ()) returns Contact|error {
        string  path = string `/v1/projects/${projectId}/contacts/${contactId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->patch(path, request, targetType=Contact);
        return response;
    }
    # Merge two contacts
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + destinationId - The unique ID of the contact that should be kept when merging two contacts. 
    # + payload - Merge contact request. 
    # + return - A successful response. 
    remote isolated function contactMergecontact(string projectId, string destinationId, MergeContactRequest payload) returns Contact|error {
        string  path = string `/v1/projects/${projectId}/contacts/${destinationId}:merge`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->post(path, request, targetType=Contact);
        return response;
    }
    # List conversations
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + onlyActive - Required. True if only active conversations should be listed. 
    # + appId - The ID of the app involved in the conversations. 
    # + contactId - Resource name (ID) of the contact. 
    # + pageSize - Optional. The maximum number of conversations to fetch. Defaults to 10 and the maximum is 20. 
    # + pageToken - Optional. Next page token previously returned if any. 
    # + return - A successful response. 
    remote isolated function conversationListconversations(string projectId, boolean onlyActive, string? appId = (), string? contactId = (), int? pageSize = (), string? pageToken = ()) returns ListConversationsResponse|error {
        string  path = string `/v1/projects/${projectId}/conversations`;
        map<anydata> queryParam = {"app_id": appId, "contact_id": contactId, "only_active": onlyActive, "page_size": pageSize, "page_token": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListConversationsResponse response = check self.clientEp-> get(path, targetType = ListConversationsResponse);
        return response;
    }
    # Creates a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - The conversation to create. ID will be generated for the conversation and any ID in the given conversation will be ignored. 
    # + return - A successful response. 
    remote isolated function conversationCreateconversation(string projectId, Conversation payload) returns Conversation|error {
        string  path = string `/v1/projects/${projectId}/conversations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Conversation response = check self.clientEp->post(path, request, targetType=Conversation);
        return response;
    }
    # Get a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationGetconversation(string projectId, string conversationId) returns Conversation|error {
        string  path = string `/v1/projects/${projectId}/conversations/${conversationId}`;
        Conversation response = check self.clientEp-> get(path, targetType = Conversation);
        return response;
    }
    # Deletes a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationDeleteconversation(string projectId, string conversationId) returns json|error {
        string  path = string `/v1/projects/${projectId}/conversations/${conversationId}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Update a conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + payload - The updated conversation. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function conversationUpdateconversation(string projectId, string conversationId, Conversation payload, string[]? updateMaskPaths = ()) returns Conversation|error {
        string  path = string `/v1/projects/${projectId}/conversations/${conversationId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Conversation response = check self.clientEp->patch(path, request, targetType=Conversation);
        return response;
    }
    # Stop conversation
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + conversationId - The unique ID of the conversation. This is generated by the system. 
    # + return - A successful response. 
    remote isolated function conversationStopactiveconversation(string projectId, string conversationId) returns json|error {
        string  path = string `/v1/projects/${projectId}/conversations/${conversationId}:stop`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    # Inject messages
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + messageConversationId - Required. The ID of the conversation. 
    # + payload - Message to be injected. ID field of the message is ignored and instead generated on the server. 
    # + return - A successful response. 
    remote isolated function conversationInjectmessage(string projectId, string messageConversationId, ConversationMessage payload) returns json|error {
        string  path = string `/v1/projects/${projectId}/conversations/${messageConversationId}:inject-message`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Send an event
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Send event request. 
    # + return - A successful response. 
    remote isolated function eventsSendevent(string projectId, SendEventRequest payload) returns SendEventResponse|error {
        string  path = string `/v1/projects/${projectId}/events:send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendEventResponse response = check self.clientEp->post(path, request, targetType=SendEventResponse);
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
        string  path = string `/v1/projects/${projectId}/messages`;
        map<anydata> queryParam = {"conversation_id": conversationId, "contact_id": contactId, "page_size": pageSize, "page_token": pageToken, "view": view};
        path = path + check getPathForQueryParam(queryParam);
        ListMessagesResponse response = check self.clientEp-> get(path, targetType = ListMessagesResponse);
        return response;
    }
    # Transcode a message
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Transaction code message request. 
    # + return - A successful response. 
    remote isolated function transcodingTranscodemessage(string projectId, TranscodeMessageRequest payload) returns TranscodeMessageResponse|error {
        string  path = string `/v1/projects/${projectId}/messages:transcode`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TranscodeMessageResponse response = check self.clientEp->post(path, request, targetType=TranscodeMessageResponse);
        return response;
    }
    # Register an opt-in
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - OptIn request. 
    # + requestId - ID for the asynchronous request, will be generated if not set. Currently this field is not used for idempotency but it will be added in v1. 
    # + return - A successful response. 
    remote isolated function optinRegisteroptin(string projectId, OptIn payload, string? requestId = ()) returns OptInResponse|error {
        string  path = string `/v1/projects/${projectId}/optins:register`;
        map<anydata> queryParam = {"request_id": requestId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OptInResponse response = check self.clientEp->post(path, request, targetType=OptInResponse);
        return response;
    }
    # Register an opt-out
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - OptOut request 
    # + requestId - ID for the asynchronous request, will be generated if not set. Currently this field is not used for idempotency but it will be added in v1. 
    # + return - A successful response. 
    remote isolated function optinRegisteroptout(string projectId, OptOut payload, string? requestId = ()) returns OptOutResponse|error {
        string  path = string `/v1/projects/${projectId}/optouts:register`;
        map<anydata> queryParam = {"request_id": requestId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OptOutResponse response = check self.clientEp->post(path, request, targetType=OptOutResponse);
        return response;
    }
    # Create a new webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + payload - Required. The Webhook to create 
    # + return - A successful response. 
    remote isolated function webhooksCreatewebhook(string projectId, Webhook payload) returns Webhook|error {
        string  path = string `/v1/projects/${projectId}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, targetType=Webhook);
        return response;
    }
    # Get a webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function webhooksGetwebhook(string projectId, string webhookId, string[]? updateMaskPaths = ()) returns Webhook|error {
        string  path = string `/v1/projects/${projectId}/webhooks/${webhookId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        Webhook response = check self.clientEp-> get(path, targetType = Webhook);
        return response;
    }
    # Delete an existing webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function webhooksDeletewebhook(string projectId, string webhookId, string[]? updateMaskPaths = ()) returns json|error {
        string  path = string `/v1/projects/${projectId}/webhooks/${webhookId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Update an existing webhook
    #
    # + projectId - The unique ID of the project. You can find this on the [Sinch Dashboard](https://dashboard.sinch.com/convapi/apps). 
    # + webhookId - The unique ID of the webhook. 
    # + payload - Required. The Webhook to update 
    # + updateMaskPaths - The set of field mask paths. 
    # + return - A successful response. 
    remote isolated function webhooksUpdatewebhook(string projectId, string webhookId, Webhook payload, string[]? updateMaskPaths = ()) returns Webhook|error {
        string  path = string `/v1/projects/${projectId}/webhooks/${webhookId}`;
        map<anydata> queryParam = {"update_mask.paths": updateMaskPaths};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->patch(path, request, targetType=Webhook);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
