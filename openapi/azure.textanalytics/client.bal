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

# This is a generated connector for [Azure Text Analytics API v1](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/) OpenAPI specification.
# The Text Analytics API is a suite of natural language processing (NLP) services built with best-in-class Microsoft machine learning algorithms.  The API can be used to analyze unstructured text for tasks such as sentiment analysis, key phrase extraction and language detection. Functionality for analysis of text specific to the healthcare domain and personal information are also available in the API. Further documentation can be found in <a href="https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/overview">https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/overview</a>
@display {label: "Azure Text Analytics", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Azure Text Analytics account](https://azure.microsoft.com/en-us/services/cognitive-services/text-analytics/) and obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal).
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
    # Get healthcare analysis job status and results
    #
    # + jobId - Format - uuid. Job ID 
    # + top - (Optional) Set the maximum number of results per task. When both $top and $skip are specified, $skip is applied first. 
    # + skip - (Optional) Set the number of elements to offset in the response. When both $top and $skip are specified, $skip is applied first. 
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + return - OK 
    remote isolated function healthStatus(string jobId, int top = 20, int skip = 0, boolean? showStats = ()) returns HealthcareJobState|error {
        string resourcePath = string `/entities/health/jobs/${jobId}`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "showStats": showStats, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HealthcareJobState response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel healthcare prediction job
    #
    # + jobId - Format - uuid. Job ID 
    # + return - Cancel Job request has been received. 
    remote isolated function cancelHealthJob(string jobId) returns http:Response|error {
        string resourcePath = string `/entities/health/jobs/${jobId}`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Detect Language
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + payload - Collection of documents to analyze for language endpoint. 
    # + return - A successful call results in the detected language with the highest probability for each valid document 
    remote isolated function languages(LanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = ()) returns LanguageResult|error {
        string resourcePath = string `/languages`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LanguageResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Entities containing personal information
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + domain - (Optional) if specified, will set the PII domain to include only a subset of the entity categories. Possible values include: 'PHI', 'none'. 
    # + stringIndexType - (Optional) Specifies the method used to interpret string offsets.  Defaults to Text Elements (Graphemes) according to Unicode v8.0.0. For additional information see https://aka.ms/text-analytics-offsets 
    # + piiCategories - (Optional) describes the PII categories to return 
    # + payload - Collection of documents to analyze. 
    # + return - A successful call results in a list of entities containing personal information returned for each valid document 
    remote isolated function entitiesRecognitionPii(MultiLanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = (), string? domain = (), string stringIndexType = "TextElement_v8", string[]? piiCategories = ()) returns PiiResult|error {
        string resourcePath = string `/entities/recognition/pii`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "domain": domain, "stringIndexType": stringIndexType, "piiCategories": piiCategories, "subscription-key": self.apiKeyConfig.subscriptionKey};
        map<Encoding> queryParamEncoding = {"piiCategories": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PiiResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get analysis status and results
    #
    # + jobId - Job ID for Analyze 
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + top - (Optional) Set the maximum number of results per task. When both $top and $skip are specified, $skip is applied first. 
    # + skip - (Optional) Set the number of elements to offset in the response. When both $top and $skip are specified, $skip is applied first. 
    # + return - Analysis job status and metadata. 
    remote isolated function analyzeStatus(string jobId, boolean? showStats = (), int top = 20, int skip = 0) returns AnalyzeJobState|error {
        string resourcePath = string `/analyze/jobs/${jobId}`;
        map<anydata> queryParam = {"showStats": showStats, "$top": top, "$skip": skip, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AnalyzeJobState response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Key Phrases
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + payload - Collection of documents to analyze. 
    # + return - A successful response results in 0 or more key phrases identified in each valid document 
    remote isolated function keyPhrases(MultiLanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = ()) returns KeyPhraseResult|error {
        string resourcePath = string `/keyPhrases`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KeyPhraseResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Linked entities from a well known knowledge base
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + stringIndexType - (Optional) Specifies the method used to interpret string offsets.  Defaults to Text Elements (Graphemes) according to Unicode v8.0.0. For additional information see https://aka.ms/text-analytics-offsets 
    # + payload - Collection of documents to analyze. 
    # + return - A successful call results in a list of recognized entities with links to a well known knowledge base returned for each valid document 
    remote isolated function entitiesLinking(MultiLanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = (), string stringIndexType = "TextElement_v8") returns EntityLinkingResult|error {
        string resourcePath = string `/entities/linking`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "stringIndexType": stringIndexType, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntityLinkingResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Named Entity Recognition
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + stringIndexType - (Optional) Specifies the method used to interpret string offsets.  Defaults to Text Elements (Graphemes) according to Unicode v8.0.0. For additional information see https://aka.ms/text-analytics-offsets 
    # + payload - Collection of documents to analyze. 
    # + return - A successful call results in a list of recognized entities returned for each valid document. 
    remote isolated function entitiesRecognitionGeneral(MultiLanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = (), string stringIndexType = "TextElement_v8") returns EntitiesResult|error {
        string resourcePath = string `/entities/recognition/general`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "stringIndexType": stringIndexType, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntitiesResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Sentiment
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + showStats - (Optional) if set to true, response will contain request and document level statistics. 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + opinionMining - (Optional) if set to true, response will contain not only sentiment prediction but also opinion mining (aspect-based sentiment analysis) results. 
    # + stringIndexType - (Optional) Specifies the method used to interpret string offsets.  Defaults to Text Elements (Graphemes) according to Unicode v8.0.0. For additional information see https://aka.ms/text-analytics-offsets 
    # + payload - Collection of documents to analyze. 
    # + return - A successful call results in a document sentiment prediction, as well as sentiment scores for each sentiment class (Positive, Negative, and Neutral) 
    remote isolated function sentiment(MultiLanguageBatchInput payload, string? modelVersion = (), boolean? showStats = (), boolean? loggingOptOut = (), boolean? opinionMining = (), string stringIndexType = "TextElement_v8") returns SentimentResponse|error {
        string resourcePath = string `/sentiment`;
        map<anydata> queryParam = {"model-version": modelVersion, "showStats": showStats, "loggingOptOut": loggingOptOut, "opinionMining": opinionMining, "stringIndexType": stringIndexType, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SentimentResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Submit analysis job
    #
    # + payload - Collection of documents to analyze and tasks to execute. 
    # + return - A successful call results with an Operation-Location header used to check the status of the analysis job. 
    remote isolated function analyze(AnalyzeBatchInput payload) returns http:Response|error {
        string resourcePath = string `/analyze`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Submit healthcare analysis job
    #
    # + modelVersion - (Optional) This value indicates which model will be used for scoring. If a model-version is not specified, the API should default to the latest, non-preview version.  
    # + stringIndexType - (Optional) Specifies the method used to interpret string offsets.  Defaults to Text Elements (Graphemes) according to Unicode v8.0.0. For additional information see https://aka.ms/text-analytics-offsets 
    # + loggingOptOut - (Optional) If set to true, you opt-out of having your text input logged for troubleshooting. By default, Text Analytics logs your input text for 48 hours, solely to allow for troubleshooting issues in providing you with the Text Analytics natural language processing functions. Setting this parameter to true, disables input logging and may limit our ability to remediate issues that occur.  Please see Cognitive Services Compliance and Privacy notes at https://aka.ms/cs-compliance for additional details, and Microsoft Responsible AI principles at https://www.microsoft.com/en-us/ai/responsible-ai. 
    # + payload - Collection of documents to analyze. 
    # + return - Accepted - call results in a link where the status of the submitted job can be checked via the GET operation. 
    remote isolated function health(MultiLanguageBatchInput payload, string? modelVersion = (), string stringIndexType = "TextElement_v8", boolean? loggingOptOut = ()) returns http:Response|error {
        string resourcePath = string `/entities/health/jobs`;
        map<anydata> queryParam = {"model-version": modelVersion, "stringIndexType": stringIndexType, "loggingOptOut": loggingOptOut, "subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
