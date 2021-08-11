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

# The Google Cloud Storage location for the input content.
public type GcsSource record {
    # Required. Source data URI. For example, `gs://my_bucket/my_object`.
    string inputUri?;
};

# Response message for ListGlossaries.
public type ListGlossariesResponse record {
    # The list of glossaries for a project.
    Glossary[] glossaries?;
    # A token to retrieve a page of results. Pass this value in the [ListGlossariesRequest.page_token] field in the subsequent call to `ListGlossaries` method to retrieve the next page of results.
    string nextPageToken?;
};

# Used with unidirectional glossaries.
public type LanguageCodePair record {
    # Required. The BCP-47 language code of the input text, for example, "en-US". Expected to be an exact match for GlossaryTerm.language_code.
    string sourceLanguageCode?;
    # Required. The BCP-47 language code for translation output, for example, "zh-CN". Expected to be an exact match for GlossaryTerm.language_code.
    string targetLanguageCode?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type Operation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status _error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type XxxResponse, where `Xxx` is the original method name. For example, if the original method name is TakeSnapshot(), the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# The response message for Operations.ListOperations.
public type ListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    Operation[] operations?;
};

# The request message for Operations.CancelOperation.
public type CancelOperationRequest record {
};

# Input configuration for BatchTranslateText request.
public type InputConfig record {
    # The Google Cloud Storage location for the input content.
    GcsSource gcsSource?;
    # Optional. Can be "text/plain" or "text/html". For `.tsv`, "text/html" is used if mime_type is missing. For `.html`, this field must be "text/html" or empty. For `.txt`, this field must be "text/plain" or empty.
    string mimeType?;
};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# The request message for Operations.WaitOperation.
public type WaitOperationRequest record {
    # The maximum duration to wait before timing out. If left blank, the wait will be at most the time permitted by the underlying HTTP/RPC protocol. If RPC context deadline is also specified, the shorter one will be used.
    string timeout?;
};

# A single translation response.
public type Translation record {
    # The BCP-47 language code of source text in the initial request, detected automatically, if no source language was passed within the initial request. If the source language was passed, auto-detection of the language does not occur and this field is empty.
    string detectedLanguageCode?;
    # Configures which glossary should be used for a specific target language, and defines options for applying that glossary.
    TranslateTextGlossaryConfig glossaryConfig?;
    # Only present when `model` is present in the request. `model` here is normalized to have project number. For example: If the `model` requested in TranslationTextRequest is `projects/{project-id}/locations/{location-id}/models/general/nmt` then `model` here would be normalized to `projects/{project-number}/locations/{location-id}/models/general/nmt`.
    string model?;
    # Text translated into the target language. If an error occurs during translation, this field might be excluded from the response.
    string translatedText?;
};

# The response message for Locations.ListLocations.
public type ListLocationsResponse record {
    # A list of locations that matches the specified filter in the request.
    Location[] locations?;
    # The standard List next-page token.
    string nextPageToken?;
};

# The response message for language detection.
public type DetectLanguageResponse record {
    # The most probable language detected by the Translation API. For each request, the Translation API will always return only one result.
    DetectedLanguage[] languages?;
};

# The request message for synchronous translation.
public type TranslateTextRequest record {
    # Required. The content of the input in string format. We recommend the total content be less than 30k codepoints. The max length of this field is 1024. Use BatchTranslateText for larger text.
    string[] contents?;
    # Configures which glossary should be used for a specific target language, and defines options for applying that glossary.
    TranslateTextGlossaryConfig glossaryConfig?;
    # Optional. The labels with user-defined metadata for the request. Label keys and values can be no longer than 63 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter. See https://cloud.google.com/translate/docs/advanced/labels for more information.
    record {} labels?;
    # Optional. The format of the source text, for example, "text/html", "text/plain". If left blank, the MIME type defaults to "text/html".
    string mimeType?;
    # Optional. The `model` type requested for this translation. The format depends on model type: - AutoML Translation models: `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}` - General (built-in) models: `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`, For global (non-regionalized) requests, use `location-id` `global`. For example, `projects/{project-number-or-id}/locations/global/models/general/nmt`. If not provided, the default Google model (NMT) will be used
    string model?;
    # Optional. The BCP-47 language code of the input text if known, for example, "en-US" or "sr-Latn". Supported language codes are listed in Language Support. If the source language isn't specified, the API attempts to identify the source language automatically and returns the source language within the response.
    string sourceLanguageCode?;
    # Required. The BCP-47 language code to use for translation of the input text, set to one of the language codes listed in Language Support.
    string targetLanguageCode?;
};

# Configures which glossary should be used for a specific target language, and defines options for applying that glossary.
public type TranslateTextGlossaryConfig record {
    # Required. The `glossary` to be applied for this translation. The format depends on glossary: - User provided custom glossary: `projects/{project-number-or-id}/locations/{location-id}/glossaries/{glossary-id}`
    string glossary?;
    # Optional. Indicates match is case-insensitive. Default value is false if missing.
    boolean ignoreCase?;
};

# The response message for language detection.
public type DetectedLanguage record {
    # The confidence of the detection result for this language.
    float confidence?;
    # The BCP-47 language code of source content in the request, detected automatically.
    string languageCode?;
};

# The request message for language detection.
public type DetectLanguageRequest record {
    # The content of the input stored as a string.
    string content?;
    # Optional. The labels with user-defined metadata for the request. Label keys and values can be no longer than 63 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter. See https://cloud.google.com/translate/docs/advanced/labels for more information.
    record {} labels?;
    # Optional. The format of the source text, for example, "text/html", "text/plain". If left blank, the MIME type defaults to "text/html".
    string mimeType?;
    # Optional. The language detection model to be used. Format: `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/{model-id}` Only one language detection model is currently supported: `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/default`. If not specified, the default model is used.
    string model?;
};

public type TranslateTextResponse record {
    # Text translation responses if a glossary is provided in the request. This can be the same as `translations` if no terms apply. This field has the same length as `contents`.
    Translation[] glossaryTranslations?;
    # Text translation responses with no glossary applied. This field has the same length as `contents`.
    Translation[] translations?;
};

# The response message for discovering supported languages.
public type SupportedLanguages record {
    # A list of supported language responses. This list contains an entry for each language the Translation API supports.
    SupportedLanguage[] languages?;
};

# Used with equivalent term set glossaries.
public type LanguageCodesSet record {
    # The BCP-47 language code(s) for terms defined in the glossary. All entries are unique. The list contains at least two entries. Expected to be an exact match for GlossaryTerm.language_code.
    string[] languageCodes?;
};

# Output configuration for BatchTranslateText request.
public type OutputConfig record {
    # The Google Cloud Storage location for the output content.
    GcsDestination gcsDestination?;
};

# A single supported language response corresponds to information related to one supported language.
public type SupportedLanguage record {
    # Human readable name of the language localized in the display language specified in the request.
    string displayName?;
    # Supported language code, generally consisting of its ISO 639-1 identifier, for example, 'en', 'ja'. In certain cases, BCP-47 codes including language and region identifiers are returned (for example, 'zh-TW' and 'zh-CN')
    string languageCode?;
    # Can be used as source language.
    boolean supportSource?;
    # Can be used as target language.
    boolean supportTarget?;
};

# The batch translation request.
public type BatchTranslateTextRequest record {
    # Optional. Glossaries to be applied for translation. It's keyed by target language code.
    record {} glossaries?;
    # Required. Input configurations. The total number of files matched should be <= 100. The total content size should be <= 100M Unicode codepoints. The files must use UTF-8 encoding.
    InputConfig[] inputConfigs?;
    # Optional. The labels with user-defined metadata for the request. Label keys and values can be no longer than 63 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. Label values are optional. Label keys must start with a letter. See https://cloud.google.com/translate/docs/advanced/labels for more information.
    record {} labels?;
    # Optional. The models to use for translation. Map's key is target language code. Map's value is model name. Value can be a built-in general model, or an AutoML Translation model. The value format depends on model type: - AutoML Translation models: `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}` - General (built-in) models: `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`, If the map is empty or a specific model is not requested for a language pair, then default google model (nmt) is used.
    record {} models?;
    # Output configuration for BatchTranslateText request.
    OutputConfig outputConfig?;
    # Required. Source language code.
    string sourceLanguageCode?;
    # Required. Specify up to 10 language codes here.
    string[] targetLanguageCodes?;
};

# Input configuration for glossaries.
public type GlossaryInputConfig record {
    # The Google Cloud Storage location for the input content.
    GcsSource gcsSource?;
};

# Represents a glossary built from user provided data.
public type Glossary record {
    # Output only. When the glossary creation was finished.
    string endTime?;
    # Output only. The number of entries defined in the glossary.
    int entryCount?;
    # Input configuration for glossaries.
    GlossaryInputConfig inputConfig?;
    # Used with equivalent term set glossaries.
    LanguageCodesSet languageCodesSet?;
    # Used with unidirectional glossaries.
    LanguageCodePair languagePair?;
    # Required. The resource name of the glossary. Glossary names have the form `projects/{project-number-or-id}/locations/{location-id}/glossaries/{glossary-id}`.
    string name?;
    # Output only. When CreateGlossary was called.
    string submitTime?;
};

# The Google Cloud Storage location for the output content.
public type GcsDestination record {
    # Required. The bucket used in 'output_uri_prefix' must exist and there must be no files under 'output_uri_prefix'. 'output_uri_prefix' must end with "/" and start with "gs://". One 'output_uri_prefix' can only be used by one batch translation job at a time. Otherwise an INVALID_ARGUMENT (400) error is returned.
    string outputUriPrefix?;
};

# A resource that represents Google Cloud Platform location.
public type Location record {
    # The friendly name for this location, typically a nearby city name. For example, "Tokyo".
    string displayName?;
    # Cross-service attributes for the location. For example {"cloud.googleapis.com/region": "us-east1"}
    record {} labels?;
    # The canonical id for this location. For example: `"us-east1"`.
    string locationId?;
    # Service-specific metadata. For example the available capacity at the given location.
    record {} metadata?;
    # Resource name for the location, which may vary between implementations. For example: `"projects/example-project/locations/us-east1"`
    string name?;
};
