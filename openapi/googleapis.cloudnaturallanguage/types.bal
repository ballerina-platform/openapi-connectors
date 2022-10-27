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
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# The syntax analysis request message.
public type AnalyzeSyntaxRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
    # The encoding type used by the API to calculate offsets.
    string encodingType?;
};

# Represents a phrase in the text that is a known entity, such as a person, an organization, or location. The API associates information, such as salience and mentions, with entities.
public type Entity record {
    # The mentions of this entity in the input document. The API currently supports proper noun mentions.
    EntityMention[] mentions?;
    # Metadata associated with the entity. For most entity types, the metadata is a Wikipedia URL (`wikipedia_url`) and Knowledge Graph MID (`mid`), if they are available. For the metadata associated with other entity types, see the Type table below.
    record {} metadata?;
    # The representative name for the entity.
    string name?;
    # The salience score associated with the entity in the [0, 1.0] range. The salience score for an entity provides information about the importance or centrality of that entity to the entire document text. Scores closer to 0 are less salient, while scores closer to 1.0 are highly salient.
    float salience?;
    # Represents the feeling associated with the entire text or entities in the text.
    Sentiment sentiment?;
    # The entity type.
    string 'type?;
};

# The entity analysis response message.
public type AnalyzeEntitiesResponse record {
    # The recognized entities in the input document.
    Entity[] entities?;
    # The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language. See Document.language field for more details.
    string language?;
};

# The sentiment analysis response message.
public type AnalyzeSentimentResponse record {
    # Represents the feeling associated with the entire text or entities in the text.
    Sentiment documentSentiment?;
    # The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language. See Document.language field for more details.
    string language?;
    # The sentiment for all the sentences in the document.
    Sentence[] sentences?;
};

# Represents the smallest syntactic building block of the text.
public type Token record {
    # Represents dependency parse tree information for a token. (For more information on dependency labels, see http://www.aclweb.org/anthology/P13-2017
    DependencyEdge dependencyEdge?;
    # [Lemma](https://en.wikipedia.org/wiki/Lemma_%28morphology%29) of the token.
    string lemma?;
    # Represents part of speech information for a token. Parts of speech are as defined in http://www.lrec-conf.org/proceedings/lrec2012/pdf/274_Paper.pdf
    PartOfSpeech partOfSpeech?;
    # Represents an output piece of text.
    TextSpan text?;
};

# The text annotations response message.
public type AnnotateTextResponse record {
    # Categories identified in the input document.
    ClassificationCategory[] categories?;
    # Represents the feeling associated with the entire text or entities in the text.
    Sentiment documentSentiment?;
    # Entities, along with their semantic information, in the input document. Populated if the user enables AnnotateTextRequest.Features.extract_entities.
    Entity[] entities?;
    # The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language. See Document.language field for more details.
    string language?;
    # Sentences in the input document. Populated if the user enables AnnotateTextRequest.Features.extract_syntax.
    Sentence[] sentences?;
    # Tokens, along with their syntactic information, in the input document. Populated if the user enables AnnotateTextRequest.Features.extract_syntax.
    Token[] tokens?;
};

# Represents a category returned from the text classifier.
public type ClassificationCategory record {
    # The classifier's confidence of the category. Number represents how certain the classifier is that this category represents the given text.
    float confidence?;
    # The name of the category representing the document, from the [predefined taxonomy](https://cloud.google.com/natural-language/docs/categories).
    string name?;
};

# ################################################################ # Represents the input to API methods.
public type Document record {
    # The content of the input in string format. Cloud audit logging exempt since it is based on user data.
    string content?;
    # The Google Cloud Storage URI where the file content is located. This URI must be of the form: gs://bucket_name/object_name. For more details, see https://cloud.google.com/storage/docs/reference-uris. NOTE: Cloud Storage object versioning is not supported.
    string gcsContentUri?;
    # The language of the document (if not specified, the language is automatically detected). Both ISO and BCP-47 language codes are accepted. [Language Support](https://cloud.google.com/natural-language/docs/languages) lists currently supported languages for each API method. If the language (either specified by the caller or automatically detected) is not supported by the called API method, an `INVALID_ARGUMENT` error is returned.
    string language?;
    # Required. If the type is not set or is `TYPE_UNSPECIFIED`, returns an `INVALID_ARGUMENT` error.
    string 'type?;
};

# Represents the feeling associated with the entire text or entities in the text.
public type Sentiment record {
    # A non-negative number in the [0, +inf) range, which represents the absolute magnitude of sentiment regardless of score (positive or negative).
    float magnitude?;
    # Sentiment score between -1.0 (negative sentiment) and 1.0 (positive sentiment).
    float score?;
};

# The syntax analysis response message.
public type AnalyzeSyntaxResponse record {
    # The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language. See Document.language field for more details.
    string language?;
    # Sentences in the input document.
    Sentence[] sentences?;
    # Tokens, along with their syntactic information, in the input document.
    Token[] tokens?;
};

# Represents an output piece of text.
public type TextSpan record {
    # The API calculates the beginning offset of the content in the original document according to the EncodingType specified in the API request.
    int beginOffset?;
    # The content of the output text.
    string content?;
};

# The entity analysis request message.
public type AnalyzeEntitiesRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
    # The encoding type used by the API to calculate offsets.
    string encodingType?;
};

# Represents a mention for an entity in the text. Currently, proper noun mentions are supported.
public type EntityMention record {
    # Represents the feeling associated with the entire text or entities in the text.
    Sentiment sentiment?;
    # Represents an output piece of text.
    TextSpan text?;
    # The type of the entity mention.
    string 'type?;
};

# The entity-level sentiment analysis request message.
public type AnalyzeEntitySentimentRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
    # The encoding type used by the API to calculate offsets.
    string encodingType?;
};

# The request message for the text annotation API, which can perform multiple analysis types (sentiment, entities, and syntax) in one call.
public type AnnotateTextRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
    # The encoding type used by the API to calculate offsets.
    string encodingType?;
    # All available features for sentiment, syntax, and semantic analysis. Setting each one to true will enable that specific analysis for the input.
    Features features?;
};

# The document classification response message.
public type ClassifyTextResponse record {
    # Categories representing the input document.
    ClassificationCategory[] categories?;
};

# All available features for sentiment, syntax, and semantic analysis. Setting each one to true will enable that specific analysis for the input.
public type Features record {
    # Classify the full document into categories.
    boolean classifyText?;
    # Extract document-level sentiment.
    boolean extractDocumentSentiment?;
    # Extract entities.
    boolean extractEntities?;
    # Extract entities and their associated sentiment.
    boolean extractEntitySentiment?;
    # Extract syntax information.
    boolean extractSyntax?;
};

# Represents part of speech information for a token. Parts of speech are as defined in http://www.lrec-conf.org/proceedings/lrec2012/pdf/274_Paper.pdf
public type PartOfSpeech record {
    # The grammatical aspect.
    string aspect?;
    # The grammatical case.
    string case?;
    # The grammatical form.
    string form?;
    # The grammatical gender.
    string gender?;
    # The grammatical mood.
    string mood?;
    # The grammatical number.
    string number?;
    # The grammatical person.
    string person?;
    # The grammatical properness.
    string proper?;
    # The grammatical reciprocity.
    string reciprocity?;
    # The part of speech tag.
    string tag?;
    # The grammatical tense.
    string tense?;
    # The grammatical voice.
    string voice?;
};

# The sentiment analysis request message.
public type AnalyzeSentimentRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
    # The encoding type used by the API to calculate sentence offsets.
    string encodingType?;
};

# The document classification request message.
public type ClassifyTextRequest record {
    # ################################################################ # Represents the input to API methods.
    Document document?;
};

# Represents dependency parse tree information for a token. (For more information on dependency labels, see http://www.aclweb.org/anthology/P13-2017
public type DependencyEdge record {
    # Represents the head of this token in the dependency tree. This is the index of the token which has an arc going to this token. The index is the position of the token in the array of tokens returned by the API method. If this token is a root token, then the `head_token_index` is its own index.
    int headTokenIndex?;
    # The parse label for the token.
    string label?;
};

# Represents a sentence in the input document.
public type Sentence record {
    # Represents the feeling associated with the entire text or entities in the text.
    Sentiment sentiment?;
    # Represents an output piece of text.
    TextSpan text?;
};

# The entity-level sentiment analysis response message.
public type AnalyzeEntitySentimentResponse record {
    # The recognized entities in the input document with associated sentiments.
    Entity[] entities?;
    # The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language. See Document.language field for more details.
    string language?;
};
