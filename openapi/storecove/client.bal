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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Storcove API v2](https://app.storecove.com/docs) OpenAPI Specification.
# Storecove API  provides the capability to do e-invoice management operations.
@display {label: "Storecove", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [Storcove account](https://www.storecove.com) and obtain tokens by following [this guide](https://app.storecove.com/docs#_getting_started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.storecove.com/api/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Discover Network Participant
    #
    # + payload - The participant to check 
    # + return - Success 
    remote isolated function discoveryReceives(DiscoverableParticipant payload) returns DiscoveredParticipant|error {
        string resourcePath = string `/discovery/receives`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DiscoveredParticipant response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # *** NOTE: Experimental. Only to be used for sending Invoice Response documents. *** Submit a new document.
    #
    # + payload - Document to submit 
    # + return - Success 
    remote isolated function createDocumentSubmission(DocumentSubmission payload) returns DocumentSubmissionResult|error {
        string resourcePath = string `/document_submissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentSubmissionResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Submit a new invoice
    #
    # + payload - Invoice to submit 
    # + return - Success 
    remote isolated function createInvoiceSubmission(InvoiceSubmission payload) returns InvoiceSubmissionResult|error {
        string resourcePath = string `/invoice_submissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InvoiceSubmissionResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Preflight an invoice recipient
    #
    # + payload - The invoice recipient to preflight 
    # + return - Success 
    remote isolated function preflightInvoiceRecipient(InvoiceRecipientPreflight payload) returns PreflightInvoiceRecipientResult|error {
        string resourcePath = string `/invoice_submissions/preflight`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PreflightInvoiceRecipientResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get InvoiceSubmission Evidence
    #
    # + guid - InvoiceSubmission GUID 
    # + return - Success 
    remote isolated function showInvoiceSubmissionEvidence(string guid) returns InvoiceSubmissionEvidence|error {
        string resourcePath = string `/invoice_submissions/${guid}/evidence`;
        InvoiceSubmissionEvidence response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new LegalEntity
    #
    # + payload - LegalEntity to create 
    # + return - Success 
    remote isolated function createLegalEntity(LegalEntityCreate payload) returns LegalEntity|error {
        string resourcePath = string `/legal_entities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LegalEntity response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get LegalEntity
    #
    # + id - legal_entity id 
    # + return - Success 
    remote isolated function getLegalEntity(int id) returns LegalEntity|error {
        string resourcePath = string `/legal_entities/${id}`;
        LegalEntity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete LegalEntity
    #
    # + id - legal_entity id 
    # + return - Success 
    remote isolated function deleteLegalEntity(int id) returns http:Response|error {
        string resourcePath = string `/legal_entities/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update LegalEntity
    #
    # + id - legal_entity id 
    # + payload - LegalEntity updates 
    # + return - Success 
    remote isolated function updateLegalEntity(int id, LegalEntityUpdate payload) returns LegalEntity|error {
        string resourcePath = string `/legal_entities/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LegalEntity response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Create a new Administration
    #
    # + legalEntityId - The id of the LegalEntity for which to create the Administration 
    # + payload - Administration to create 
    # + return - Success 
    remote isolated function createAdministration(int legalEntityId, AdministrationCreate payload) returns Administration|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/administrations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Administration response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Administration
    #
    # + legalEntityId - The id of the LegalEntity the Administration belongs to 
    # + id - The id of the Administration 
    # + return - Success 
    remote isolated function getAdministration(int legalEntityId, int id) returns Administration|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/administrations/${id}`;
        Administration response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Administration
    #
    # + legalEntityId - The id of the LegalEntity the Administration belongs to 
    # + id - The id of the Administration 
    # + return - Success 
    remote isolated function deleteAdministration(int legalEntityId, int id) returns http:Response|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/administrations/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update Administration
    #
    # + legalEntityId - The id of the LegalEntity the Administration belongs to 
    # + id - The id of the Administration to be updated 
    # + payload - Administration to update 
    # + return - Success 
    remote isolated function updateAdministration(int legalEntityId, int id, AdministrationUpdate payload) returns Administration|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/administrations/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Administration response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Create a new PeppolIdentifier
    #
    # + legalEntityId - The id of the LegalEntity for which to create the PeppolIdentifier 
    # + payload - PeppolIdentifier to create 
    # + return - Success 
    remote isolated function createPeppolIdentifier(int legalEntityId, PeppolIdentifierCreate payload) returns PeppolIdentifier|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/peppol_identifiers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PeppolIdentifier response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete PeppolIdentifier
    #
    # + legalEntityId - The id of the LegalEntity this PeppolIdentifier belongs to 
    # + superscheme - The superscheme of the identifier. Should always be "iso6523-actorid-upis". 
    # + scheme - PEPPOL identifier scheme id, e.g. "DE:VAT". For a full list see <<_peppol_participant_identifier_list>>. 
    # + identifier - PEPPOL identifier 
    # + return - Success 
    remote isolated function deletePeppolIdentifier(int legalEntityId, string superscheme, string scheme, string identifier) returns http:Response|error {
        string resourcePath = string `/legal_entities/${legalEntityId}/peppol_identifiers/${superscheme}/${scheme}/${identifier}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get Purchase invoice data as JSON
    #
    # + guid - The guid of the purchase invoice, from the webhook. 
    # + pmv - The PaymentMeans version. The default (and deprecated) version 1.0 will give BankPaymentMean, DirectDebitPaymentMean, CardPaymentMean, NppPaymentMean, SeBankGiroPaymentMean, SePlusGiroPaymentMean, SgCardPaymentMean, SgGiroPaymentMean, SgPaynowPaymentMean. Version 2.0 deprecates BankPaymentMean (now CreditTransferPaymentMean), CardPaymentMean (now CreditCardPaymentMean), NppPaymentMean (now AunzNppPayidPaymentMean), SeBankGiroPaymentMean (now SeBankgiroPaymentMean  -- note the lower 'g' in 'bankgiro'). It also adds OnlinePaymentServicePaymentMean, StandingAgreementPaymentMean, AunzNppPaytoPaymentMean, AunzBpayPaymentMean, AunzPostbillpayPaymentMean, AunzUriPaymentMean. 
    # + return - Success 
    remote isolated function getInvoiceJson(string guid, string pmv = "1.0") returns PurchaseInvoice|error {
        string resourcePath = string `/purchase_invoices/${guid}`;
        map<anydata> queryParam = {"pmv": pmv};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PurchaseInvoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Purchase invoice data as JSON with a Base64-encoded SI-1.2 UBL string
    #
    # + guid - purchase invoice guid 
    # + packaging - How to package the purchase invoice. Use "json" or "ubl"  
    # + return - Success 
    remote isolated function getInvoiceUbl(string guid, string packaging) returns PurchaseInvoiceUbl|error {
        string resourcePath = string `/purchase_invoices/${guid}/${packaging}`;
        PurchaseInvoiceUbl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Purchase invoice data as JSON with a Base64-encoded UBL string in the specified version
    #
    # + guid - purchase invoice guid 
    # + packaging - How to package the purchase invoice. Use "ubl" 
    # + packageVersion - The version of the ubl package. 
    # + return - Success 
    remote isolated function getInvoiceUblVersioned(string guid, string packaging, string packageVersion) returns PurchaseInvoiceUbl|error {
        string resourcePath = string `/purchase_invoices/${guid}/${packaging}/${packageVersion}`;
        PurchaseInvoiceUbl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a WebhookInstance
    #
    # + return - Success 
    remote isolated function getWebhookInstances() returns WebhookInstance|error? {
        string resourcePath = string `/webhook_instances/`;
        WebhookInstance? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a WebhookInstance
    #
    # + guid - WebhookInstance guid 
    # + return - Success 
    remote isolated function deleteWebhookInstance(string guid) returns http:Response|error {
        string resourcePath = string `/webhook_instances/${guid}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
