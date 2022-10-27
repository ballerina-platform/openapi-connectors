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

# This is a generated connector for [IRIS Subscriptions API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the Subscriptions API to create, view, and manage your event notification subscriptions.  
# A webhook listener URL is required from you to be able to create the subscription and receive notifications.
# Learn about API updates and new endpoints by subscribing to the [api.updated](https://iriscrm.com/api/#/paths/~1subscriptions~1sample~1api.updated/get) event.
# Receive alerts in real-time including lead status changes, e-signature document actions, and helpdesk ticket changes.
# Subscription API responses provide you with detailed information on a silver platter to avoid sorting through data unnecessarily.
@display {label: "IRIS Subscriptions", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Return a list of subscriptions
    #
    # + page - Page Number 
    # + perPage - Count of records per page 
    # + return - A JSON array of subscriptions 
    remote isolated function getSubscriptions(int? page = (), int? perPage = ()) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/subscriptions`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a subscription
    #
    # + payload - Subscription details 
    # + return - Subscription has been created successfully 
    remote isolated function createSubscription(BriefSubscriptionInfo payload) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/api/v1/subscriptions`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefSubscriptionInfo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Return a subscription by its id
    #
    # + subscriptionId - Subscription Id 
    # + return - Subscription 
    remote isolated function getSubscriptionsById(int subscriptionId) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/api/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BriefSubscriptionInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a subscription
    #
    # + subscriptionId - Subscription Id 
    # + return - Subscription (1) has been deleted successfully 
    remote isolated function deleteSubscription(int subscriptionId) returns InlineResponse2001|error {
        string resourcePath = string `/api/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a subscription
    #
    # + subscriptionId - Subscription Id 
    # + payload - Subscription details 
    # + return - Subscription has been updated successfully 
    remote isolated function updateSubscription(int subscriptionId, BriefSubscriptionInfo payload) returns BriefSubscriptionInfo|error {
        string resourcePath = string `/api/v1/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefSubscriptionInfo response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Test payload for checking server response
    #
    # + return - Response 
    remote isolated function testPayloadForCheckingServerResponse() returns TestSubscription|error {
        string resourcePath = string `/api/v1/subscriptions/sample/subscription.test`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TestSubscription response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when this API is updated
    #
    # + return - API details 
    remote isolated function receiveNotificationWhenApiUpdated() returns ApiUpdated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/api.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead is created in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadCreated() returns LeadCreatedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.created`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadCreatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's campaign, status, group, or field values are updated in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadUpdated() returns LeadUpdatedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadUpdatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead in this CRM is deleted
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadDeleted() returns LeadDeletedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.deleted`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadDeletedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a deleted lead is restored in this CRM
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadRestored() returns LeadRestoredEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.restored`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadRestoredEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's status is updated in this CRM, with the option to only receive a notification when a lead is moved to or from the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadStatusUpdated() returns LeadStatusUpdatedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.status.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadStatusUpdatedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is generated
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureGenerated() returns SignatureGenerated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.signature.generated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureGenerated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is opened by the recipient
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureOpened() returns SignatureOpened|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.signature.opened`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureOpened response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead's e-signature document is signed by the recipient
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEsignatureSigned() returns SignatureSigned|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.signature.signed`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SignatureSigned response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead in this CRM has a note posted, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadNoteAdded() returns LeadNoteAddedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.note.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadNoteAddedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a lead document is uploaded
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadDocumentUploaded() returns LeadDocumentUploadedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.document.uploaded`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadDocumentUploadedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when an email message is received on a lead in this CRM, with the option to only receive a notification when a lead is in the status(es) specified here
    #
    # + return - Lead details 
    remote isolated function receiveNotificationWhenLeadEmailReceived() returns LeadEmailReceivedEventInfo|error {
        string resourcePath = string `/api/v1/subscriptions/sample/lead.email.received`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadEmailReceivedEventInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a TurboApp is submitted to a processor
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppSubmitted() returns TurboAppSubmited|error {
        string resourcePath = string `/api/v1/subscriptions/sample/turboapp.submitted`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppSubmited response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when the underwriting status is updated
    #
    # + return - Application account details 
    remote isolated function receiveNotificationWhenTurboAppUpdated() returns TurboAppUpdated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/turboapp.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a merchant is approved
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppApproved() returns TurboAppApproved|error {
        string resourcePath = string `/api/v1/subscriptions/sample/turboapp.approved`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppApproved response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a merchant is declined
    #
    # + return - Application details 
    remote isolated function receiveNotificationWhenTurboAppDeclined() returns TurboAppDeclined|error {
        string resourcePath = string `/api/v1/subscriptions/sample/turboapp.declined`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TurboAppDeclined response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is created
    #
    # + return - Ticket created 
    remote isolated function receiveNotificationWhenTurboAppCreated() returns TicketCreated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/ticket.created`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketCreated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is updated
    #
    # + return - Ticket updated 
    remote isolated function receiveNotificationWhenTicketUpdated() returns TicketUpdated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/ticket.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket is resolved
    #
    # + return - Ticket resolved 
    remote isolated function receiveNotificationWhenTicketResolved() returns TicketResolved|error {
        string resourcePath = string `/api/v1/subscriptions/sample/ticket.resolved`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketResolved response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket comment is added
    #
    # + return - Ticket commented 
    remote isolated function receiveNotificationWhenTicketCommented() returns TicketCommented|error {
        string resourcePath = string `/api/v1/subscriptions/sample/ticket.commented`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketCommented response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a ticket comment is edited
    #
    # + return - Ticket comment edited 
    remote isolated function receiveNotificationWhenTicketCommentEdited() returns SubscriptionCommentEdited|error {
        string resourcePath = string `/api/v1/subscriptions/sample/ticket.comment.edited`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionCommentEdited response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a residuals report is published
    #
    # + return - Report details 
    remote isolated function receiveNotificationWhenReportPublished() returns ReportPublished|error {
        string resourcePath = string `/api/v1/subscriptions/sample/residuals.report.published`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportPublished response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a residuals line item is added
    #
    # + return - Line item details 
    remote isolated function receiveNotificationWhenLineItemAdded() returns LineItemAdded|error {
        string resourcePath = string `/api/v1/subscriptions/sample/residuals.lineitem.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LineItemAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a new chargeback case created
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationWhenChargebackAdded() returns ChargebackAdded|error {
        string resourcePath = string `/api/v1/subscriptions/sample/chargeback.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when chargeback case status changed
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationWhenChargebackUpdated() returns ChargebackUpdated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/chargeback.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification in 7/3/1 days before the chargeback case due date
    #
    # + return - Chargeback case details 
    remote isolated function receiveNotificationForChargebackReminder() returns ChargebackReminder|error {
        string resourcePath = string `/api/v1/subscriptions/sample/chargeback.reminder`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChargebackReminder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when a new retrieval case created
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationWhenRetrievalAdded() returns RetrievalAdded|error {
        string resourcePath = string `/api/v1/subscriptions/sample/retrieval.added`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalAdded response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification when retrieval case status changed
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationWhenRetrievalUpdated() returns RetrievalUpdated|error {
        string resourcePath = string `/api/v1/subscriptions/sample/retrieval.updated`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalUpdated response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Receive a notification in 7/3/1 days before the retrieval case due date
    #
    # + return - Retrieval case details 
    remote isolated function receiveNotificationForRetrievalReminder() returns RetrievalReminder|error {
        string resourcePath = string `/api/v1/subscriptions/sample/retrieval.reminder`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RetrievalReminder response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
