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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `Ocp-Apim-Subscription-Key`
    @display {label: "", kind: "password"}
    string ocpApimSubscriptionKey;
    # Represents API Key `subscription-key`
    @display {label: "", kind: "password"}
    string subscriptionKey;
|};

public type LinkedEntity record {
    # Entity Linking formal name.
    string name;
    # List of instances this entity appears in the text.
    Match[] matches;
    # Language used in the data source.
    string language;
    # Unique identifier of the recognized entity from the data source.
    string id?;
    # URL for the entity's page from the data source.
    string url;
    # Data source used to extract entity linking, such as Wiki/Bing etc.
    string dataSource;
    # Bing Entity Search API unique identifier of the recognized entity.
    string bingId?;
};

public type Entity record {
    # Entity text as appears in the request.
    string text;
    # Entity type.
    string category;
    # (Optional) Entity sub type.
    string subcategory?;
    # Start position for the entity text. Use of different 'stringIndexType' values can affect the offset returned.
    int offset;
    # Length for the entity text. Use of different 'stringIndexType' values can affect the length returned.
    int length;
    # Confidence score between 0 and 1 of the extracted entity.
    decimal confidenceScore;
};

public type StringIndexType string;

public type HealthcareAssertion record {
    # Describes any conditionality on the entity.
    string conditionality?;
    # Describes the entities certainty and polarity.
    string certainty?;
    # Describes if the entity is the subject of the text or if it describes someone else.
    string association?;
};

# if showStats=true was specified in the request this field will contain information about the request payload.
public type RequestStatistics record {
    # Number of documents submitted in the request.
    int documentsCount;
    # Number of valid documents. This excludes empty, over-size limit or non-supported languages documents.
    int validDocumentsCount;
    # Number of invalid documents. This includes empty, over-size limit or non-supported languages documents.
    int erroneousDocumentsCount;
    # Number of transactions for the request.
    int transactionsCount;
};

public type InnerError record {
    # Error code.
    string code;
    # Error message.
    string message;
    # Error details.
    record {} details?;
    # Error target.
    string target?;
    InnerError innererror?;
};

public type AnalysisInput record {
    # Contains a set of input documents to be analyzed by the service.
    MultiLanguageBatchInput analysisInput;
};

public type AnalyzeBatchInput record {
    *JobDescriptor;
    *AnalysisInput;
    *JobManifest;
};

public type HealthcareEntity record {
    # Entity text as appears in the request.
    string text;
    # Healthcare Entity Category.
    string category;
    # (Optional) Entity sub type.
    string subcategory?;
    # Start position for the entity text. Use of different 'stringIndexType' values can affect the offset returned.
    int offset;
    # Length for the entity text. Use of different 'stringIndexType' values can affect the length returned.
    int length;
    # Confidence score between 0 and 1 of the extracted entity.
    decimal confidenceScore;
    *HealthcareLinkingProperties;
};

public type Pagination record {
    string '\@nextLink?;
};

public type DocumentLanguage record {
    # Unique, non-empty document identifier.
    string id;
    DetectedLanguage detectedLanguage;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

public type TargetRelation record {
    # The type related to the target.
    string relationType;
    # The JSON pointer indicating the linked object.
    string ref;
};

public type HealthcareJobState record {
    *JobMetadata;
    *HealthcareTaskResult;
    *Pagination;
};

# (Optional) describes the PII categories to return
public type PiiCategories string[];

public type DocumentEntities record {
    # Unique, non-empty document identifier.
    string id;
    # Recognized entities in the document.
    Entity[] entities;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

public type PiiTask record {
    PiitaskParameters parameters?;
    string taskName?;
};

public type EntityLinkingTaskResult record {
    EntityLinkingResult results?;
};

# Contains a set of input documents to be analyzed by the service.
public type MultiLanguageBatchInput record {
    # The set of documents to process as part of this batch.
    MultiLanguageInput[] documents;
};

# Represents the confidence scores between 0 and 1 across all sentiment classes: positive, neutral, negative.
public type SentimentConfidenceScorePerLabel record {
    # Positive value
    decimal positive;
    # Nuetral value
    decimal neutral;
    # Negative value
    decimal negative;
};

public type JobManifest record {
    # The set of tasks to execute on the input documents. Cannot specify the same task more than once.
    JobmanifestTasks tasks;
};

public type PiiTaskResult record {
    PiiResult results?;
};

public type PiitaskParameters record {
    string domain?;
    string 'model\-version?;
    boolean loggingOptOut?;
    # (Optional) describes the PII categories to return
    PiiCategories piiCategories?;
    StringIndexType stringIndexType?;
};

public type AnalyzeJobMetadata record {
    *JobMetadata;
    *AnalyzeJobDisplayName;
};

# Represents the confidence scores across all sentiment classes: positive, neutral, negative.
public type TargetConfidenceScoreLabel record {
    # Positive
    decimal positive;
    # Negative
    decimal negative;
};

public type HealthcareTaskResult record {
    HealthcareResult results?;
    TextAnalyticsError[] errors?;
};

public type EntityLinkingResult record {
    # Response by document
    DocumentLinkedEntities[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type DetectedLanguage record {
    # Long name of a detected language (e.g. English, French).
    string name;
    # A two letter representation of the detected language according to the ISO 639-1 standard (e.g. en, fr).
    string iso6391Name;
    # A confidence score between 0 and 1. Scores close to 1 indicate 100% certainty that the identified language is true.
    decimal confidenceScore;
};

public type TasksState record {
    TasksstateTasks tasks;
};

public type AnalyzeJobErrorsAndStatistics record {
    TextAnalyticsError[] errors?;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
};

public type DocumentError record {
    # Document Id.
    string id;
    TextAnalyticsError 'error;
};

public type TextAnalyticsError record {
    # Error code.
    string code;
    # Error message.
    string message;
    # Error target.
    string target?;
    InnerError innererror?;
    # Details about specific errors that led to this reported error.
    TextAnalyticsError[] details?;
};

public type HealthcareRelationEntity record {
    # Reference link object, using a JSON pointer RFC 6901 (URI Fragment Identifier Representation), pointing to the entity .
    string ref;
    # Role of entity in the relationship. For example: 'CD20-positive diffuse large B-cell lymphoma' has the following entities with their roles in parenthesis:  CD20 (GeneOrProtein), Positive (Expression), diffuse large B-cell lymphoma (Diagnosis).
    string role;
};

public type KeyPhrasesTask record {
    KeyphrasestaskParameters parameters?;
    string taskName?;
};

public type LanguageBatchInput record {
    LanguageInput[] documents;
};

public type AnalyzeJobState record {
    *AnalyzeJobMetadata;
    *TasksState;
    *AnalyzeJobErrorsAndStatistics;
    *Pagination;
};

public type TextAnalyticsWarning record {
    # Error code.
    string code;
    # Warning message.
    string message;
    # A JSON pointer reference indicating the target object.
    string targetRef?;
};

public type JobMetadata record {
    string createdDateTime;
    string expirationDateTime?;
    string jobId;
    string lastUpdateDateTime;
    string status;
};

public type LanguageResult record {
    # Response by document
    DocumentLanguage[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type JobDescriptor record {
    # Optional display name for the analysis job.
    string displayName?;
};

public type TasksstateTasks record {
    int completed;
    int failed;
    int inProgress;
    int total;
    record {*TaskState; *EntitiesTaskResult;}[] entityRecognitionTasks?;
    record {*TaskState; *PiiTaskResult;}[] entityRecognitionPiiTasks?;
    record {*TaskState; *KeyPhraseTaskResult;}[] keyPhraseExtractionTasks?;
    record {*TaskState; *EntityLinkingTaskResult;}[] entityLinkingTasks?;
    record {*TaskState; *SentimentTaskResult;}[] sentimentAnalysisTasks?;
};

public type HealthcareLinkingProperties record {
    HealthcareAssertion assertion?;
    # Preferred name for the entity. Example: 'histologically' would have a 'name' of 'histologic'.
    string name?;
    # Entity references in known data sources.
    HealthcareEntityLink[] links?;
};

public type SentenceTarget record {
    # Targeted sentiment in the sentence.
    string sentiment;
    # Represents the confidence scores across all sentiment classes: positive, neutral, negative.
    TargetConfidenceScoreLabel confidenceScores;
    # The target offset from the start of the sentence.
    int offset;
    # The length of the target.
    int length;
    # The target text detected.
    string text;
    # The array of either assessment or target objects which is related to the target.
    TargetRelation[] relations;
};

public type PiiDocumentEntities record {
    # Unique, non-empty document identifier.
    string id;
    # Returns redacted text.
    string redactedText;
    # Recognized entities in the document.
    Entity[] entities;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

public type EntitiesTask record {
    EntitiestaskParameters parameters?;
    string taskName?;
};

public type Match record {
    # If a well known item is recognized, a decimal number denoting the confidence level between 0 and 1 will be returned.
    decimal confidenceScore;
    # Entity text as appears in the request.
    string text;
    # Start position for the entity match text.
    int offset;
    # Length for the entity match text.
    int length;
};

# Every relation is an entity graph of a certain relationType, where all entities are connected and have specific roles within the relation context.
public type HealthcareRelation record {
    # Type of relation. Examples include: `DosageOfMedication` or 'FrequencyOfMedication', etc.
    string relationType;
    # The entities in the relation.
    HealthcareRelationEntity[] entities;
};

public type EntitiesTaskResult record {
    EntitiesResult results?;
};

public type SentimentResponse record {
    # Sentiment analysis per document.
    DocumentSentiment[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type SentenceSentiment record {
    # The sentence text.
    string text;
    # The predicted Sentiment for the sentence.
    string sentiment;
    # Represents the confidence scores between 0 and 1 across all sentiment classes: positive, neutral, negative.
    SentimentConfidenceScorePerLabel confidenceScores;
    # The sentence offset from the start of the document.
    int offset;
    # The length of the sentence.
    int length;
    # The array of sentence targets for the sentence.
    SentenceTarget[] targets?;
    # The array of assessments for the sentence.
    SentenceAssessment[] assessments?;
};

public type DocumentSentiment record {
    # Unique, non-empty document identifier.
    string id;
    # Predicted sentiment for document (Negative, Neutral, Positive, or Mixed).
    string sentiment;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
    # Represents the confidence scores between 0 and 1 across all sentiment classes: positive, neutral, negative.
    SentimentConfidenceScorePerLabel confidenceScores;
    # Sentence level sentiment analysis.
    SentenceSentiment[] sentences;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
};

public type DocumentLinkedEntities record {
    # Unique, non-empty document identifier.
    string id;
    # Recognized well known entities in the document.
    LinkedEntity[] entities;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

public type DocumentHealthcareEntities record {
    # Unique, non-empty document identifier.
    string id;
    # Healthcare entities.
    HealthcareEntity[] entities;
    # Healthcare entity relations.
    HealthcareRelation[] relations;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

# The set of tasks to execute on the input documents. Cannot specify the same task more than once.
public type JobmanifestTasks record {
    # Array of EntityRecognitionTasks records
    EntitiesTask[] entityRecognitionTasks?;
    # Array of EntityRecognitionPiiTasks records
    PiiTask[] entityRecognitionPiiTasks?;
    # Array of EntityRecognitionTasks records
    KeyPhrasesTask[] keyPhraseExtractionTasks?;
    # Array of EntityLinkingTasks records
    EntityLinkingTask[] entityLinkingTasks?;
    # Array of SentimentAnalysisTasks records
    SentimentAnalysisTask[] sentimentAnalysisTasks?;
};

public type AnalyzeJobDisplayName record {
    string displayName?;
};

public type KeyphrasestaskParameters record {
    string 'model\-version?;
    boolean loggingOptOut?;
};

public type KeyPhraseResult record {
    # Response by document
    DocumentKeyPhrases[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type LanguageInput record {
    # Unique, non-empty document identifier.
    string id;
    string text;
    string countryHint?;
};

# if showStats=true was specified in the request this field will contain information about the document payload.
public type DocumentStatistics record {
    # Number of text elements recognized in the document.
    int charactersCount;
    # Number of transactions for the document.
    int transactionsCount;
};

public type EntitiestaskParameters record {
    string 'model\-version?;
    boolean loggingOptOut?;
    StringIndexType stringIndexType?;
};

public type SentimentTaskResult record {
    SentimentResponse results?;
};

public type SentimentanalysistaskParameters record {
    string 'model\-version?;
    boolean loggingOptOut?;
    boolean opinionMining?;
    StringIndexType stringIndexType?;
};

public type DocumentKeyPhrases record {
    # Unique, non-empty document identifier.
    string id;
    # A list of representative words or phrases. The number of key phrases returned is proportional to the number of words in the input document.
    string[] keyPhrases;
    # Warnings encountered while processing document.
    TextAnalyticsWarning[] warnings;
    # if showStats=true was specified in the request this field will contain information about the document payload.
    DocumentStatistics statistics?;
};

public type SentimentAnalysisTask record {
    SentimentanalysistaskParameters parameters?;
    string taskName?;
};

public type ErrorResponse record {
    TextAnalyticsError 'error;
};

public type SentenceAssessment record {
    # Assessment sentiment in the sentence.
    string sentiment;
    # Represents the confidence scores across all sentiment classes: positive, neutral, negative.
    TargetConfidenceScoreLabel confidenceScores;
    # The assessment offset from the start of the sentence.
    int offset;
    # The length of the assessment.
    int length;
    # The assessment text detected.
    string text;
    # The indicator representing if the assessment is negated.
    boolean isNegated;
};

public type EntitiesResult record {
    # Response by document
    DocumentEntities[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type KeyPhraseTaskResult record {
    KeyPhraseResult results?;
};

public type PiiResult record {
    # Response by document
    PiiDocumentEntities[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

public type HealthcareEntityLink record {
    # Entity Catalog. Examples include: UMLS, CHV, MSH, etc.
    string dataSource;
    # Entity id in the given source catalog.
    string id;
};

public type EntityLinkingTask record {
    EntitiestaskParameters parameters?;
    string taskName?;
};

public type HealthcareResult record {
    # Response by document
    DocumentHealthcareEntities[] documents;
    # Errors by document id.
    DocumentError[] errors;
    # if showStats=true was specified in the request this field will contain information about the request payload.
    RequestStatistics statistics?;
    # This field indicates which model is used for scoring.
    string modelVersion;
};

# Contains an input document to be analyzed by the service.
public type MultiLanguageInput record {
    # A unique, non-empty document identifier.
    string id;
    # The input text to process.
    string text;
    # (Optional) This is the 2 letter ISO 639-1 representation of a language. For example, use "en" for English; "es" for Spanish etc. If not set, use "en" for English as default.
    string language?;
};

public type TaskState record {
    string lastUpdateDateTime;
    string taskName?;
    string status;
};
