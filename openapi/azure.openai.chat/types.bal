// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/constraint;
import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Provides Auth configurations needed when communicating with a remote HTTP endpoint.
    http:BearerTokenConfig|ApiKeysConfig auth;
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
    # The API key to use. This is the same as your subscription key.
    @display {label: "", kind: "password"}
    string apiKey;
|};

public type ContentFilterIdResult record {
    *ContentFilterResultBase;
    string id?;
};

# Inner error with additional details.
public type InnerError record {
    # Error codes for the inner error object.
    InnerErrorCode code?;
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not. Information about jailbreak content and profanity, if it has been detected, and if it has been filtered or not. And information about customer block list, if it has been filtered and its id.
    ContentFilterPromptResults content_filter_results?;
};

public type ChatCompletionRequestMessage record {
    # The role of the messages author.
    ChatCompletionRequestMessageRole role;
};

# Detected content filtering results
public type ContentFilterDetectedResult record {
    *ContentFilterResultBase;
    # Whether the content filtering category has been detected or not.
    boolean detected?;
};

# Information about the content filtering results.
public type ContentFilterResultsBase record {
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not.
    ContentFilterSeverityResult sexual?;
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not.
    ContentFilterSeverityResult violence?;
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not.
    ContentFilterSeverityResult hate?;
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not.
    ContentFilterSeverityResult self_harm?;
    # Detected content filtering results
    ContentFilterDetectedResult profanity?;
    # Information about custom block list, if it has been filtered and its id.
    ContentFilterIdResult[] custom_blocklists?;
    # Error response object.
    ErrorBase 'error?;
};

# The function that the model called.
public type ChatCompletionMessageToolCall_function record {
    # The name of the function to call.
    string name;
    # The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
    string arguments;
};

public type ChatCompletionRequestMessageSystem record {
    *ChatCompletionRequestMessage;
    # The contents of the message.
    string? content?;
};

public type ChatCompletionRequestMessageUser record {
    *ChatCompletionRequestMessage;
    string|ChatCompletionRequestMessageContentPart[]? content?;
};

# Controls which (if any) function is called by the model. `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function. Specifying a particular function via `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that function.
public type ChatCompletionToolChoiceOption "none"|"auto"|"required"|ChatCompletionNamedToolChoice;

public type Enhancement record {
    # The grounding enhancement that returns the bounding box of the objects detected in the image.
    Enhancement_grounding grounding?;
};

# Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not. Information about third party text and profanity, if it has been detected, and if it has been filtered or not. And information about customer block list, if it has been filtered and its id.
public type ContentFilterChoiceResults record {
    *ContentFilterResultsBase;
    # Detected content filtering results
    ContentFilterDetectedResult protected_material_text?;
    # Detected content filtering results with citation
    ContentFilterDetectedWithCitationResult protected_material_code?;
};

# Error codes for the inner error object.
public type InnerErrorCode "ResponsibleAIPolicyViolation";

# The type of enhancements needed.
public type ExtensionsChatCompletionsRequest_enhancements record {
    # Request object to specify if grounding enhancement is needed.
    ExtensionsChatCompletionsRequest_enhancements_grounding grounding?;
    # Request object to specify if ocr enhancement is needed.
    ExtensionsChatCompletionsRequest_enhancements_ocr ocr?;
};

# The type of the tool. Currently, only `function` is supported.
public type ChatCompletionToolType "function";

# Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not. Information about jailbreak content and profanity, if it has been detected, and if it has been filtered or not. And information about customer block list, if it has been filtered and its id.
public type ContentFilterPromptResults record {
    *ContentFilterResultsBase;
    # Detected content filtering results
    ContentFilterDetectedResult jailbreak?;
};

public type Span_polygon record {
    # The x-coordinate of the point.
    decimal x?;
    # The y-coordinate of the point.
    decimal y?;
};

# Setting to `json_object` enables JSON mode. This guarantees that the message the model generates is valid JSON.
public type ChatCompletionResponseFormat "text"|"json_object";

public type ChatCompletionRequestMessageAssistant record {
    *ChatCompletionRequestMessage;
    # The contents of the message.
    string? content?;
    # The tool calls generated by the model, such as function calls.
    ChatCompletionMessageToolCall[] tool_calls?;
};

# Request object to specify if grounding enhancement is needed.
public type ExtensionsChatCompletionsRequest_enhancements_grounding record {
    # If grounding enhancement is enabled.
    boolean enabled?;
};

public type ChatCompletionRequestMessageTool record {
    *ChatCompletionRequestMessage;
    # Tool call that this message is responding to.
    string tool_call_id?;
    # The contents of the message.
    string? content?;
};

# The type of the content part.
public type ChatCompletionRequestMessageContentPartType "text"|"image_url";

# The type of the tool call, in this case `function`.
public type ToolCallType "function";

public type ChatCompletionTool record {
    # The type of the tool. Currently, only `function` is supported.
    ChatCompletionToolType 'type;
    ChatCompletionTool_function 'function;
};

# An object specifying the format that the model must output. Used to enable JSON mode.
public type CreateChatCompletionRequest_response_format record {
    # Setting to `json_object` enables JSON mode. This guarantees that the message the model generates is valid JSON.
    ChatCompletionResponseFormat? 'type?;
};

# The data source to be used for the Azure OpenAI on your data feature.
public type DataSource record {
    # The data source type.
    string 'type;
    # The parameters to be used for the data source in runtime.
    record {} parameters?;
};

# A content line object consisting of an adjacent sequence of content elements, such as words and selection marks.
public type Line record {
    # The text content of the line.
    string text;
    # An array of spans that represent detected objects and its bounding box information.
    Span[] spans;
};

public type ExtensionsChatCompletionChoice record {
    *ChatCompletionChoiceCommon;
    # A chat message.
    Message message?;
    Enhancement enhancements?;
};

# Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not.
public type ContentFilterSeverityResult record {
    *ContentFilterResultBase;
    # The severity level of the content filtering category.
    "safe"|"low"|"medium"|"high" severity?;
};

public type ChatCompletionRequestMessageContentPartImage record {
    *ChatCompletionRequestMessageContentPart;
    # Either a URL of the image or the base64 encoded image data.
    string url?;
    # Specifies the detail level of the image.
    ImageDetailLevel detail?;
};

public type ChatCompletionRequestMessageContentPartText record {
    *ChatCompletionRequestMessageContentPart;
    # The text content.
    string text?;
};

# Specifies a tool the model should use. Use to force the model to call a specific function.
public type ChatCompletionNamedToolChoice record {
    # The type of the tool. Currently, only `function` is supported.
    "function" 'type?;
    # The function that should be called.
    ChatCompletionNamedToolChoice_function 'function?;
};

# A chat message.
public type Message record {
    # The index of the message in the conversation.
    int index?;
    # The role of the author of this message.
    "system"|"user"|"assistant"|"tool" role;
    # The recipient of the message in the format of <namespace>.<operation>. Present if and only if the recipient is tool.
    string recipient?;
    # The contents of the message
    string content;
    # Whether the message ends the turn.
    boolean end_turn?;
    # The conversation context
    Message_context? context?;
};

public type ContentFilterResultBase record {
    boolean filtered;
};

# Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
public type ChatCompletionFunctionCall record {
    # The name of the function to call.
    string name;
    # The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
    string arguments;
};

# A span object that represents a detected object and its bounding box information.
public type Span record {
    # The text content of the span that represents the detected object.
    string text;
    # The character offset within the text where the span begins. This offset is defined as the position of the first character of the span, counting from the start of the text as Unicode codepoints.
    int offset;
    # The length of the span in characters, measured in Unicode codepoints.
    int length;
    # An array of objects representing points in the polygon that encloses the detected object.
    Span_polygon[] polygon;
};

# The role of the messages author.
public type ChatCompletionRequestMessageRole "system"|"user"|"assistant"|"tool"|"function";

public type ChatCompletionRequestMessageFunction record {
    *ChatCompletionRequestMessage;
    # The role of the messages author, in this case `function`.
    "function" role?;
    # The contents of the message.
    string name?;
    # The contents of the message.
    string? content?;
};

public type ChatCompletionChoiceCommon record {
    int index?;
    string finish_reason?;
};

public type ChatCompletionRequestMessageContentPart record {
    # The type of the content part.
    ChatCompletionRequestMessageContentPartType 'type;
};

public type CreateChatCompletionRequest record {
    *ChatCompletionsRequestCommon;
    # A list of messages comprising the conversation so far. [Example Python code](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_format_inputs_to_ChatGPT_models.ipynb).
    @constraint:Array {minLength: 1}
    ChatCompletionRequestMessage[] messages?;
    # How many chat completion choices to generate for each input message.
    int? n?;
    # If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to monitor changes in the backend.
    int? seed?;
    # An object specifying the format that the model must output. Used to enable JSON mode.
    CreateChatCompletionRequest_response_format response_format?;
    # A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for.
    @constraint:Array {minLength: 1}
    ChatCompletionTool[] tools?;
    # Controls which (if any) function is called by the model. `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function. Specifying a particular function via `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that function.
    ChatCompletionToolChoiceOption tool_choice?;
    # Deprecated in favor of `tools`. A list of functions the model may generate JSON inputs for.
    @constraint:Array {maxLength: 128, minLength: 1}
    ChatCompletionFunction[] functions?;
    # Deprecated in favor of `tool_choice`. Controls how the model responds to function calls. "none" means the model does not call a function, and responds to the end-user. "auto" means the model can pick between an end-user or calling a function.  Specifying a particular function via `{"name":\ "my_function"}` forces the model to call that function. "none" is the default when no functions are present. "auto" is the default if functions are present.
    "none"|"auto"|record {
        # The name of the function to call.
        string name;
    } function_call?;
};

public type ChatCompletionsResponseCommon record {
    # A unique identifier for the chat completion.
    string id;
    # The object type.
    ChatCompletionResponseObject 'object;
    # The Unix timestamp (in seconds) of when the chat completion was created.
    int created;
    # The model used for the chat completion.
    string model;
    # Usage statistics for the completion request.
    CompletionUsage usage?;
    # Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
    string? system_fingerprint?;
};

# Error response object.
public type ErrorBase record {
    # Error code.
    string code?;
    # A human-readable representation of the error.
    string message?;
};

public type ChatCompletionsRequestCommon record {
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature?;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p?;
    # If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a `data: [DONE]` message.
    boolean? 'stream?;
    # Up to 4 sequences where the API will stop generating further tokens.
    string|string[]? stop?;
    # The maximum number of tokens allowed for the generated answer. By default, the number of tokens the model can return will be (4096 - prompt tokens).
    int max_tokens?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    @constraint:Number {minValue: -2, maxValue: 2}
    decimal presence_penalty?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    @constraint:Number {minValue: -2, maxValue: 2}
    decimal frequency_penalty?;
    # Modify the likelihood of specified tokens appearing in the completion. Accepts a json object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    record {}? logit_bias?;
    # A unique identifier representing your end-user, which can help Azure OpenAI to monitor and detect abuse.
    string user?;
};

# The role of the author of the response message.
public type ChatCompletionResponseMessageRole "assistant";

# Usage statistics for the completion request.
public type CompletionUsage record {
    # Number of tokens in the prompt.
    int prompt_tokens;
    # Number of tokens in the generated completion.
    int completion_tokens;
    # Total number of tokens used in the request (prompt + completion).
    int total_tokens;
};

# The object type.
public type ChatCompletionResponseObject "chat.completion";

# The response of the extensions chat completions.
public type ExtensionsChatCompletionsResponse record {
    *ChatCompletionsResponseCommon;
    # The chat completion choices.
    ExtensionsChatCompletionChoice[] choices?;
};

# The function that should be called.
public type ChatCompletionNamedToolChoice_function record {
    # The name of the function to call.
    string name;
};

# Content filtering results for a single prompt in the request.
public type PromptFilterResult record {
    # The index of the prompt in the request.
    int prompt_index?;
    # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not. Information about jailbreak content and profanity, if it has been detected, and if it has been filtered or not. And information about customer block list, if it has been filtered and its id.
    ContentFilterPromptResults content_filter_results?;
};

# Content filtering results for zero or more prompts in the request. In a streaming request, results for different prompts may arrive at different times or in different orders.
public type PromptFilterResults PromptFilterResult[];

public type CreateChatCompletionResponse record {
    *ChatCompletionsResponseCommon;
    # Content filtering results for zero or more prompts in the request. In a streaming request, results for different prompts may arrive at different times or in different orders.
    PromptFilterResults prompt_filter_results?;
    record {
        *ChatCompletionChoiceCommon;
        # A chat completion message generated by the model.
        ChatCompletionResponseMessage message?;
        # Information about the content filtering category (hate, sexual, violence, self_harm), if it has been detected, as well as the severity level (very_low, low, medium, high-scale that determines the intensity and risk level of harmful content) and if it has been filtered or not. Information about third party text and profanity, if it has been detected, and if it has been filtered or not. And information about customer block list, if it has been filtered and its id.
        ContentFilterChoiceResults content_filter_results?;
    }[] choices?;
};

public type Error ErrorBase;

public type ChatCompletionMessageToolCall record {
    # The ID of the tool call.
    string id;
    # The type of the tool call, in this case `function`.
    ToolCallType 'type;
    # The function that the model called.
    ChatCompletionMessageToolCall_function 'function;
};

public type ErrorResponse record {
    Error 'error?;
};

# Detected content filtering results with citation
public type ContentFilterDetectedWithCitationResult record {
    *ContentFilterDetectedResult;
    # The citation of the detected content.
    ContentFilterDetectedWithCitationResult_citation citation?;
};

# A chat completion message generated by the model.
public type ChatCompletionResponseMessage record {
    # The role of the author of the response message.
    ChatCompletionResponseMessageRole role?;
    # The contents of the message.
    string? content?;
    # The tool calls generated by the model, such as function calls.
    ChatCompletionMessageToolCall[] tool_calls?;
    # Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    ChatCompletionFunctionCall function_call?;
};

# The citation of the detected content.
public type ContentFilterDetectedWithCitationResult_citation record {
    # The URL of the citation of detected content.
    string URL?;
    # The license of the citation of detected content.
    string license?;
};

# The conversation context
public type Message_context record {
    # Messages exchanged between model and extensions prior to final message from model
    Message[]? messages?;
};

# Request object to specify if ocr enhancement is needed.
public type ExtensionsChatCompletionsRequest_enhancements_ocr record {
    # If ocr enhancement is enabled.
    boolean enabled?;
};

# Request for the chat completions using extensions
public type ExtensionsChatCompletionsRequest record {
    *ChatCompletionsRequestCommon;
    # A list of messages comprising the conversation so far.
    Message[] messages?;
    # The data sources to be used for the Azure OpenAI on your data feature.
    DataSource[] dataSources?;
    # The type of enhancements needed.
    ExtensionsChatCompletionsRequest_enhancements enhancements?;
};

# Specifies the detail level of the image.
public type ImageDetailLevel "auto"|"low"|"high";

public type ChatCompletionTool_function record {
    # A description of what the function does, used by the model to choose when and how to call the function.
    string description?;
    # The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
    string name;
    # The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/gpt/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
    ChatCompletionFunctionParameters parameters;
};

public type ChatCompletionFunction record {
    # The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
    string name;
    # The description of what the function does.
    string description?;
    # The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/gpt/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
    ChatCompletionFunctionParameters parameters?;
};

# The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/gpt/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
public type ChatCompletionFunctionParameters record {
};

# The grounding enhancement that returns the bounding box of the objects detected in the image.
public type Enhancement_grounding record {
    # An array of lines that represent the detected objects and its bounding box information.
    Line[] lines;
};
