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
    # Represents API Key `Ocp-Apim-Subscription-Key`
    string ocpApimSubscriptionKey;
    # Represents API Key `subscription-key`
    string subscriptionKey;
|};

# This is a generated connector for [Azure QnA Maker API v4](https://docs.microsoft.com/en-us/rest/api/cognitiveservices-qnamaker/QnAMaker4.0/) OpenAPI specification.
# The Azure QnA Maker API is a cloud-based Natural Language Processing (NLP) service that allows you to create a natural conversational layer over your data.  It is used to find the most appropriate answer for any input from your custom knowledge base (KB) of information. QnA Maker is commonly used to build conversational client applications,  which include social media applications, chat bots, and speech-enabled desktop applications.
# QnA Maker REST API V4.0
@display {label: "Azure QnA Maker", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Azure Text Analytics account](https://azure.microsoft.com/en-us/services/cognitive-services/text-analytics/) and  obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get Knowledgebase Details
    #
    # + kbId - Knowledgebase id. 
    # + return - Details of the knowledgebase. 
    remote isolated function getKnowledgebaseDetail(string kbId) returns KnowledgebaseDTO|error {
        string  path = string `/knowledgebases/${kbId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        KnowledgebaseDTO response = check self.clientEp-> get(path, accHeaders, targetType = KnowledgebaseDTO);
        return response;
    }
    # Replace Knowledgebase
    #
    # + kbId - Knowledgebase id 
    # + payload - An instance of ReplaceKbDTO which contains list of qnas to be uploaded 
    # + return - HTTP 204 No content. 
    remote isolated function replaceKnowledgebase(string kbId, ReplaceKbDTO payload) returns http:Response|error {
        string  path = string `/knowledgebases/${kbId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Publish Knowledgebase
    #
    # + kbId - Knowledgebase id 
    # + return - HTTP 204 No content. 
    remote isolated function publishKnowledgebase(string kbId) returns http:Response|error {
        string  path = string `/knowledgebases/${kbId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete Knowledgebase
    #
    # + kbId - Knowledgebase id. 
    # + return - HTTP 204 No content. 
    remote isolated function deleteKnowledgebase(string kbId) returns http:Response|error {
        string  path = string `/knowledgebases/${kbId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Update Knowledgebase
    #
    # + kbId - Knowledgebase id 
    # + payload - Post body of the request. 
    # + return - Details of the asynchronous operation. 
    remote isolated function updateKnowledgebase(string kbId, UpdateKbOperationDTO payload) returns Operation|error {
        string  path = string `/knowledgebases/${kbId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Operation);
        return response;
    }
    # Download Knowledgebase
    #
    # + kbId - Knowledgebase id 
    # + environment - Specifies whether environment is Test or Prod. 
    # + return - Collection of all Q-A in the knowledgebase. 
    remote isolated function downloadKnowledgebase(string kbId, string environment) returns QnADocumentsDTO|error {
        string  path = string `/knowledgebases/${kbId}/${environment}/qna`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        QnADocumentsDTO response = check self.clientEp-> get(path, accHeaders, targetType = QnADocumentsDTO);
        return response;
    }
    # Get Endpoint Keys
    #
    # + return - response with endpoint info in it. 
    remote isolated function getEndpointKeys() returns EndpointKeysDTO|error {
        string  path = string `/endpointkeys`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EndpointKeysDTO response = check self.clientEp-> get(path, accHeaders, targetType = EndpointKeysDTO);
        return response;
    }
    # Get Knowledgebases for user
    #
    # + return - Collection of knowlegebases. 
    remote isolated function getKnowledgebaseDetails() returns KnowledgebasesDTO|error {
        string  path = string `/knowledgebases`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        KnowledgebasesDTO response = check self.clientEp-> get(path, accHeaders, targetType = KnowledgebasesDTO);
        return response;
    }
    # Get Operation Details
    #
    # + operationId - Operation id. 
    # + return - Details of the long running operation. 
    remote isolated function getOperationDetails(string operationId) returns Operation|error {
        string  path = string `/operations/${operationId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Operation response = check self.clientEp-> get(path, accHeaders, targetType = Operation);
        return response;
    }
    # Refresh Endpoint Keys
    #
    # + keyType - type of Key 
    # + return - Details of the endpoint keys generated. 
    remote isolated function refreshEndpointKeys(string keyType) returns EndpointKeysDTO|error {
        string  path = string `/endpointkeys/${keyType}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        EndpointKeysDTO response = check self.clientEp-> patch(path, request, headers = accHeaders, targetType = EndpointKeysDTO);
        return response;
    }
    # Download Alterations
    #
    # + return - Alterations data. 
    remote isolated function downloadAlterations() returns WordAlterationsDTO|error {
        string  path = string `/alterations`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WordAlterationsDTO response = check self.clientEp-> get(path, accHeaders, targetType = WordAlterationsDTO);
        return response;
    }
    # Replace Alterations
    #
    # + payload - New alterations data. 
    # + return - HTTP 204 No Content. 
    remote isolated function replaceAlterations(WordAlterationsDTO payload) returns http:Response|error {
        string  path = string `/alterations`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Create Knowledgebase
    #
    # + payload - Post body of the request. 
    # + return - Details of the asynchronous operation. 
    remote isolated function createKnowledgebase(CreateKbDTO payload) returns Operation|error {
        string  path = string `/knowledgebases/create`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Operation);
        return response;
    }
    # Get Endpoint Settings
    #
    # + return - response with endpoint settings info in it. 
    remote isolated function getEndpointSettings() returns EndpointSettingsDTO|error {
        string  path = string `/endpointsettings`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        EndpointSettingsDTO response = check self.clientEp-> get(path, accHeaders, targetType = EndpointSettingsDTO);
        return response;
    }
    # Update Endpoint Settings
    #
    # + payload - PATCH body of the request. 
    # + return - HTTP 204 No content. 
    remote isolated function updateEndpointSettings(EndpointSettingsDTO payload) returns http:Response|error {
        string  path = string `/endpointsettings`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
}
