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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-API-KEY`
    string xApiKey;
|};

# This is a generated connector for [IRIS Dispute responder API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# IRIS CRM's revolutionary new Dispute Responder offers complete, end-to-end dispute management, including instant online notification of new disputes, electronic response submission, and complete record management for Fiserv merchants, all from right within IRIS CRM.
@display {label: "IRIS Dispute Responder", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Reply To Chargeback Case - Dispute Chargeback Case
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case ID 
    # + payload - Chargeback reply dispute request data 
    # + return - Reply was successfully processed 
    remote isolated function disputeChargeback(int merchantNumber, string caseNumber, ChargebackReplyDisputeRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks/${caseNumber}/dispute_reverse`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Chargeback Case - Credit Issued
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + payload - Chargeback reply credit issued request data 
    # + return - Reply was successfully processed 
    remote isolated function replyToChargebackCaseCreditIssued(int merchantNumber, string caseNumber, ChargebackReplyCreditIssuedRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks/${caseNumber}/credit_issued`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Chargeback Case - Accept Chargeback
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToChargebackCaseAcceptChargeback(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/chargebacks/${caseNumber}/accept`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Retrieval Response
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + payload - Retrieval reply response request data 
    # + return - Merchant has been updated successfully 
    remote isolated function replyToRetrievalCaseRetrievalResponse(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/response`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Retrieval Response with Signature
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + payload - Retrieval reply response request data 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseRetrievalResponseWithSignature(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/response_with_signature`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Unable to Fulfill Retrieval Case Request
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseUnableToFulfillRetrievalCaseRequest(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/unable_to_fulfill_request`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Unable to Locate Retrieval Case
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseUnableToLocateRetrievalCase(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/unable_to_locate_retrieval`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval - Credit Issued
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + payload - Retrieval reply credit issued request data 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCreditIssued(int merchantNumber, string caseNumber, RetrievalReplyCreditIssuedRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/credit_issued`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Imprint and Signature
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Chargeback case number 
    # + payload - Retrieval reply response request data 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseImprintAndSignature(int merchantNumber, string caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/imprint_and_signature`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Responding by Other Means
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseRespondingByOtherMeans(int merchantNumber, string caseNumber) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/responding_by_other_means`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reply To Retrieval Case - Add User Notes/Images
    #
    # + merchantNumber - Merchant number 
    # + caseNumber - Retrieval case number 
    # + payload - Retrieval reply response request 
    # + return - Reply was successfully processed 
    remote isolated function replyToRetrievalCaseAddUserNotesImages(int merchantNumber, int caseNumber, RetrievalReplyResponseRequest payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/merchants/${merchantNumber}/retrievals/${caseNumber}/add_notes_images`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
