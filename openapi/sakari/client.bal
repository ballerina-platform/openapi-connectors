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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:OAuth2ClientCredentialsGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.sakari.io/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get token for accessing APIs
    #
    # + payload - Request payload for obtaining token
    # + return - successful operation
    remote isolated function authToken(TokenRequest payload) returns TokenResponse|error {
        string  path = string `/oauth2/token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TokenResponse response = check self.clientEp->post(path, request, targetType=TokenResponse);
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
    remote isolated function contactsFetchall(string accountId, int? offset = (), int? 'limit = (), string? firstName = (), string? lastName = (), string? mobile = (), string? email = (), string? tags = ()) returns ContactsResponse|error {
        string  path = string `/accounts/${accountId}/contacts`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "firstName": firstName, "lastName": lastName, "mobile": mobile, "email": email, "tags": tags};
        path = path + check getPathForQueryParam(queryParam);
        ContactsResponse response = check self.clientEp-> get(path, targetType = ContactsResponse);
        return response;
    }
    # Create contact
    #
    # + accountId - Account to apply operations to
    # + payload - Create contact request payload
    # + mergeStrategy - Determines how existing contacts with matching mobile numbers are treated
    # + return - successful operation
    remote isolated function contactsCreate(string accountId, ContactRequest payload, string? mergeStrategy = ()) returns InlineResponse201|error {
        string  path = string `/accounts/${accountId}/contacts`;
        map<anydata> queryParam = {"mergeStrategy": mergeStrategy};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, targetType=InlineResponse201);
        return response;
    }
    # Fetch contact by ID
    #
    # + accountId - Account to apply operations to
    # + contactId - ID of contact to return
    # + return - successful operation
    remote isolated function contactsFetch(string accountId, string contactId) returns ContactResponse|error {
        string  path = string `/accounts/${accountId}/contacts/${contactId}`;
        ContactResponse response = check self.clientEp-> get(path, targetType = ContactResponse);
        return response;
    }
    # Updates a contact
    #
    # + accountId - Account to apply operations to
    # + contactId - ID of contact
    # + return - successful operation
    remote isolated function contactsUpdate(string accountId, string contactId) returns ContactResponse|error {
        string  path = string `/accounts/${accountId}/contacts/${contactId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ContactResponse response = check self.clientEp-> put(path, request, targetType = ContactResponse);
        return response;
    }
    # Deletes a contact
    #
    # + accountId - Account to apply operations to
    # + contactId - Contact id to delete
    # + return - successful operation
    remote isolated function contactsRemove(string accountId, string contactId) returns InlineResponse200|error {
        string  path = string `/accounts/${accountId}/contacts/${contactId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> delete(path, request, targetType = InlineResponse200);
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
    remote isolated function messagesFetchall(string accountId, int? offset = (), int? 'limit = (), string? contactId = (), string? conversationId = ()) returns MessagesResponse|error {
        string  path = string `/accounts/${accountId}/messages`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "contactId": contactId, "conversationId": conversationId};
        path = path + check getPathForQueryParam(queryParam);
        MessagesResponse response = check self.clientEp-> get(path, targetType = MessagesResponse);
        return response;
    }
    # Send Messages
    #
    # + accountId - Account to apply operations to
    # + payload - Send message request payload
    # + return - successful operation
    remote isolated function messagesSend(string accountId, SendMessagesRequest payload) returns SendMessagesResponse|error {
        string  path = string `/accounts/${accountId}/messages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendMessagesResponse response = check self.clientEp->post(path, request, targetType=SendMessagesResponse);
        return response;
    }
    # Fetch message by id
    #
    # + accountId - Account to apply operations to
    # + messageId - ID of message to return
    # + return - successful operation
    remote isolated function messagesFetch(string accountId, string messageId) returns MessageResponse|error {
        string  path = string `/accounts/${accountId}/messages/${messageId}`;
        MessageResponse response = check self.clientEp-> get(path, targetType = MessageResponse);
        return response;
    }
    # Fetch templates
    #
    # + accountId - Account to apply operations to
    # + offset - Results to skip when paginating through a result set
    # + 'limit - Maximum number of results to return
    # + name - Filter by name or part of
    # + return - successful operation
    remote isolated function templatesFetchall(string accountId, int? offset = (), int? 'limit = (), string? name = ()) returns TemplatesResponse|error {
        string  path = string `/accounts/${accountId}/templates`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        TemplatesResponse response = check self.clientEp-> get(path, targetType = TemplatesResponse);
        return response;
    }
    # Create template
    #
    # + accountId - Account to apply operations to
    # + payload - Create template request payload.
    # + return - successful operation
    remote isolated function templatesCreate(string accountId, TemplateRequest payload) returns TemplatesResponse|error {
        string  path = string `/accounts/${accountId}/templates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TemplatesResponse response = check self.clientEp->post(path, request, targetType=TemplatesResponse);
        return response;
    }
    # Fetch template by ID
    #
    # + accountId - Account to apply operations to
    # + templateId - ID of template to return
    # + return - successful operation
    remote isolated function templatesFetch(string accountId, string templateId) returns TemplateResponse|error {
        string  path = string `/accounts/${accountId}/templates/${templateId}`;
        TemplateResponse response = check self.clientEp-> get(path, targetType = TemplateResponse);
        return response;
    }
    # Updates a template
    #
    # + accountId - Account to apply operations to
    # + templateId - ID of template
    # + return - successful operation
    remote isolated function templatesUpdate(string accountId, string templateId) returns TemplateResponse|error {
        string  path = string `/accounts/${accountId}/templates/${templateId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemplateResponse response = check self.clientEp-> put(path, request, targetType = TemplateResponse);
        return response;
    }
    # Deletes a template
    #
    # + accountId - Account to apply operations to
    # + templateId - Template id to delete
    # + return - successful operation
    remote isolated function templatesRemove(string accountId, string templateId) returns InlineResponse200|error {
        string  path = string `/accounts/${accountId}/templates/${templateId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> delete(path, request, targetType = InlineResponse200);
        return response;
    }
    # Fetch campaigns
    #
    # + accountId - Account to apply operations to
    # + offset - Results to skip when paginating through a result set
    # + 'limit - Maximum number of results to return
    # + name - Filter by name or part of
    # + return - successful operation
    remote isolated function campaignsFetchall(string accountId, int? offset = (), int? 'limit = (), string? name = ()) returns CampaignsResponse|error {
        string  path = string `/accounts/${accountId}/campaigns`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "name": name};
        path = path + check getPathForQueryParam(queryParam);
        CampaignsResponse response = check self.clientEp-> get(path, targetType = CampaignsResponse);
        return response;
    }
    # Create campaign
    #
    # + accountId - Account to apply operations to
    # + payload - Create campaign request payload
    # + return - successful operation
    remote isolated function campaignsCreate(string accountId, CampaignRequest payload) returns CampaignResponse|error {
        string  path = string `/accounts/${accountId}/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CampaignResponse response = check self.clientEp->post(path, request, targetType=CampaignResponse);
        return response;
    }
    # Fetch campaign by ID
    #
    # + accountId - Account to apply operations to
    # + campaignId - ID of campaign to return
    # + return - successful operation
    remote isolated function campaignsFetch(string accountId, string campaignId) returns CampaignResponse|error {
        string  path = string `/accounts/${accountId}/campaigns/${campaignId}`;
        CampaignResponse response = check self.clientEp-> get(path, targetType = CampaignResponse);
        return response;
    }
    # Updates a campaign
    #
    # + accountId - Account to apply operations to
    # + campaignId - ID of campaign
    # + return - successful operation
    remote isolated function campaignsUpdate(string accountId, string campaignId) returns CampaignResponse|error {
        string  path = string `/accounts/${accountId}/campaigns/${campaignId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignResponse response = check self.clientEp-> put(path, request, targetType = CampaignResponse);
        return response;
    }
    # Deletes a campaign
    #
    # + accountId - Account to apply operations to
    # + campaignId - Campaign id to delete
    # + return - successful operation
    remote isolated function campaignsRemove(string accountId, string campaignId) returns InlineResponse200|error {
        string  path = string `/accounts/${accountId}/campaigns/${campaignId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse200 response = check self.clientEp-> delete(path, request, targetType = InlineResponse200);
        return response;
    }
    # Fetch conversations
    #
    # + accountId - Account to apply operations to
    # + offset - Results to skip when paginating through a result set
    # + 'limit - Maximum number of results to return
    # + return - successful operation
    remote isolated function conversationsFetchall(string accountId, int? offset = (), int? 'limit = ()) returns ConversationsResponse|error {
        string  path = string `/accounts/${accountId}/conversations`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        ConversationsResponse response = check self.clientEp-> get(path, targetType = ConversationsResponse);
        return response;
    }
    # Fetch conversation by ID
    #
    # + accountId - Account to apply operations to
    # + conversationId - ID of template to return
    # + return - successful operation
    remote isolated function conversationsFetch(string accountId, string conversationId) returns ConversationResponse|error {
        string  path = string `/accounts/${accountId}/conversations/${conversationId}`;
        ConversationResponse response = check self.clientEp-> get(path, targetType = ConversationResponse);
        return response;
    }
    # Closes a conversation
    #
    # + accountId - Account to apply operations to
    # + conversationId - ID of conversation
    # + return - successful operation
    remote isolated function conversationsClose(string accountId, string conversationId) returns ConversationResponse|error {
        string  path = string `/accounts/${accountId}/conversations/${conversationId}/close`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ConversationResponse response = check self.clientEp-> put(path, request, targetType = ConversationResponse);
        return response;
    }
    # Share file - use to host a file and generate a short link to be used directly in a message or as a link to media for a MMS
    #
    # + payload - Binary form of the file
    # + return - successful operation
    remote isolated function toolsSharefile(string payload) returns ShareFileResponse|error {
        string  path = string `/tools/sharefile`;
        http:Request request = new;
        ShareFileResponse response = check self.clientEp->post(path, request, targetType=ShareFileResponse);
        return response;
    }
    # Fetch active webhooks
    #
    # + accountId - Account to apply operations to
    # + return - successful operation
    remote isolated function webhooksFetchall(string accountId) returns WebhooksResponse|error {
        string  path = string `/accounts/${accountId}/webhooks`;
        WebhooksResponse response = check self.clientEp-> get(path, targetType = WebhooksResponse);
        return response;
    }
    # Subscribe to message events
    #
    # + accountId - Account to apply operations to
    # + payload - Message event subscribe request payload
    # + return - successful operation
    remote isolated function webhooksSubscribe(string accountId, Body1 payload) returns WebhookResponse|error {
        string  path = string `/accounts/${accountId}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookResponse response = check self.clientEp->post(path, request, targetType=WebhookResponse);
        return response;
    }
    # Unsubscribe to message events
    #
    # + accountId - Account to apply operations to
    # + url - Account to apply operations to
    # + return - successful operation
    remote isolated function webhooksUnsubscribe(string accountId, string url) returns http:Response|error {
        string  path = string `/accounts/${accountId}/webhooks/${url}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
