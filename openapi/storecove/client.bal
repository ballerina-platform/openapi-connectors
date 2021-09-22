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

# Configuration record for Storecove API.
#
# + authConfig - Bearer Token Configuration
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Storecove API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.storecove.com/api/v2") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Discover Network Participant
    #
    # + payload - The participant to check
    # + return - Success
    remote isolated function discoveryReceives(DiscoverableParticipant payload) returns DiscoveredParticipant|error {
        string  path = string `/discovery/receives`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DiscoveredParticipant response = check self.clientEp->post(path, request, targetType=DiscoveredParticipant);
        return response;
    }
    # *** NOTE: Experimental. Only to be used for sending Invoice Response documents. *** Submit a new document.
    #
    # + payload - Document to submit
    # + return - Success
    remote isolated function createDocumentSubmission(DocumentSubmission payload) returns DocumentSubmissionResult|error {
        string  path = string `/document_submissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DocumentSubmissionResult response = check self.clientEp->post(path, request, targetType=DocumentSubmissionResult);
        return response;
    }
    # Submit a new invoice
    #
    # + payload - Invoice to submit
    # + return - Success
    remote isolated function createInvoiceSubmission(InvoiceSubmission payload) returns InvoiceSubmissionResult|error {
        string  path = string `/invoice_submissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InvoiceSubmissionResult response = check self.clientEp->post(path, request, targetType=InvoiceSubmissionResult);
        return response;
    }
    # Preflight an invoice recipient
    #
    # + payload - The invoice recipient to preflight
    # + return - Success
    remote isolated function preflightInvoiceRecipient(InvoiceRecipientPreflight payload) returns PreflightInvoiceRecipientResult|error {
        string  path = string `/invoice_submissions/preflight`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PreflightInvoiceRecipientResult response = check self.clientEp->post(path, request, targetType=PreflightInvoiceRecipientResult);
        return response;
    }
    # Get InvoiceSubmission Evidence
    #
    # + guid - InvoiceSubmission GUID
    # + return - Success
    remote isolated function showInvoiceSubmissionEvidence(string guid) returns InvoiceSubmissionEvidence|error {
        string  path = string `/invoice_submissions/${guid}/evidence`;
        InvoiceSubmissionEvidence response = check self.clientEp-> get(path, targetType = InvoiceSubmissionEvidence);
        return response;
    }
    # Create a new LegalEntity
    #
    # + payload - LegalEntity to create
    # + return - Success
    remote isolated function createLegalEntity(LegalEntityCreate payload) returns LegalEntity|error {
        string  path = string `/legal_entities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LegalEntity response = check self.clientEp->post(path, request, targetType=LegalEntity);
        return response;
    }
    # Get LegalEntity
    #
    # + id - legal_entity id
    # + return - Success
    remote isolated function getLegalEntity(int id) returns LegalEntity|error {
        string  path = string `/legal_entities/${id}`;
        LegalEntity response = check self.clientEp-> get(path, targetType = LegalEntity);
        return response;
    }
    # Delete LegalEntity
    #
    # + id - legal_entity id
    # + return - Success
    remote isolated function deleteLegalEntity(int id) returns http:Response|error {
        string  path = string `/legal_entities/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update LegalEntity
    #
    # + id - legal_entity id
    # + payload - LegalEntity updates
    # + return - Success
    remote isolated function updateLegalEntity(int id, LegalEntityUpdate payload) returns LegalEntity|error {
        string  path = string `/legal_entities/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LegalEntity response = check self.clientEp->patch(path, request, targetType=LegalEntity);
        return response;
    }
    # Create a new Administration
    #
    # + legal_entity_id - The id of the LegalEntity for which to create the Administration
    # + payload - Administration to create
    # + return - Success
    remote isolated function createAdministration(int legal_entity_id, AdministrationCreate payload) returns Administration|error {
        string  path = string `/legal_entities/${legal_entity_id}/administrations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Administration response = check self.clientEp->post(path, request, targetType=Administration);
        return response;
    }
    # Get Administration
    #
    # + legal_entity_id - The id of the LegalEntity the Administration belongs to
    # + id - The id of the Administration
    # + return - Success
    remote isolated function getAdministration(int legal_entity_id, int id) returns Administration|error {
        string  path = string `/legal_entities/${legal_entity_id}/administrations/${id}`;
        Administration response = check self.clientEp-> get(path, targetType = Administration);
        return response;
    }
    # Delete Administration
    #
    # + legal_entity_id - The id of the LegalEntity the Administration belongs to
    # + id - The id of the Administration
    # + return - Success
    remote isolated function deleteAdministration(int legal_entity_id, int id) returns http:Response|error {
        string  path = string `/legal_entities/${legal_entity_id}/administrations/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update Administration
    #
    # + legal_entity_id - The id of the LegalEntity the Administration belongs to
    # + id - The id of the Administration to be updated
    # + payload - Administration to update
    # + return - Success
    remote isolated function updateAdministration(int legal_entity_id, int id, AdministrationUpdate payload) returns Administration|error {
        string  path = string `/legal_entities/${legal_entity_id}/administrations/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Administration response = check self.clientEp->patch(path, request, targetType=Administration);
        return response;
    }
    # Create a new PeppolIdentifier
    #
    # + legal_entity_id - The id of the LegalEntity for which to create the PeppolIdentifier
    # + payload - PeppolIdentifier to create
    # + return - Success
    remote isolated function createPeppolIdentifier(int legal_entity_id, PeppolIdentifierCreate payload) returns PeppolIdentifier|error {
        string  path = string `/legal_entities/${legal_entity_id}/peppol_identifiers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PeppolIdentifier response = check self.clientEp->post(path, request, targetType=PeppolIdentifier);
        return response;
    }
    # Delete PeppolIdentifier
    #
    # + legal_entity_id - The id of the LegalEntity this PeppolIdentifier belongs to
    # + superscheme - The superscheme of the identifier. Should always be "iso6523-actorid-upis".
    # + scheme - PEPPOL identifier scheme id, e.g. "DE:VAT". For a full list see <<_peppol_participant_identifier_list>>.
    # + identifier - PEPPOL identifier
    # + return - Success
    remote isolated function deletePeppolIdentifier(int legal_entity_id, string superscheme, string scheme, string identifier) returns http:Response|error {
        string  path = string `/legal_entities/${legal_entity_id}/peppol_identifiers/${superscheme}/${scheme}/${identifier}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get Purchase invoice data as JSON
    #
    # + guid - The guid of the purchase invoice, from the webhook.
    # + pmv - The PaymentMeans version. The default (and deprecated) version 1.0 will give BankPaymentMean, DirectDebitPaymentMean, CardPaymentMean, NppPaymentMean, SeBankGiroPaymentMean, SePlusGiroPaymentMean, SgCardPaymentMean, SgGiroPaymentMean, SgPaynowPaymentMean.
    # + return - Success
    remote isolated function getInvoiceJson(string guid, string? pmv = "1.0") returns PurchaseInvoice|error {
        string  path = string `/purchase_invoices/${guid}`;
        map<anydata> queryParam = {"pmv": pmv};
        path = path + check getPathForQueryParam(queryParam);
        PurchaseInvoice response = check self.clientEp-> get(path, targetType = PurchaseInvoice);
        return response;
    }
    # Get Purchase invoice data as JSON with a Base64-encoded SI-1.2 UBL string
    #
    # + guid - purchase invoice guid
    # + packaging - How to package the purchase invoice. Use "json" or "ubl" 
    # + return - Success
    remote isolated function getInvoiceUbl(string guid, string packaging) returns PurchaseInvoiceUbl|error {
        string  path = string `/purchase_invoices/${guid}/${packaging}`;
        PurchaseInvoiceUbl response = check self.clientEp-> get(path, targetType = PurchaseInvoiceUbl);
        return response;
    }
    # Get Purchase invoice data as JSON with a Base64-encoded UBL string in the specified version
    #
    # + guid - purchase invoice guid
    # + packaging - How to package the purchase invoice. Use "ubl"
    # + package_version - The version of the ubl package.
    # + return - Success
    remote isolated function getInvoiceUblVersioned(string guid, string packaging, string package_version) returns PurchaseInvoiceUbl|error {
        string  path = string `/purchase_invoices/${guid}/${packaging}/${package_version}`;
        PurchaseInvoiceUbl response = check self.clientEp-> get(path, targetType = PurchaseInvoiceUbl);
        return response;
    }
    # Get a WebhookInstance
    #
    # + return - Success
    remote isolated function getWebhookInstances() returns WebhookInstance|error {
        string  path = string `/webhook_instances/`;
        WebhookInstance response = check self.clientEp-> get(path, targetType = WebhookInstance);
        return response;
    }
    # Delete a WebhookInstance
    #
    # + guid - WebhookInstance guid
    # + return - Success
    remote isolated function deleteWebhookInstance(string guid) returns http:Response|error {
        string  path = string `/webhook_instances/${guid}`;
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
