// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

@constraint:Array {minLength: 1}
public type PromptItemsArray int[];

public type ChatCompletionResponseMessage record {
    # The role of the author of this message.
    string role;
    # The contents of the message
    string content;
};

public type CreateCompletionResponse_choices record {
    string text?;
    int index?;
    CreateCompletionResponse_logprobs? logprobs?;
    string? finish_reason?;
};

public type CreateChatCompletionRequest record {
    # ID of the model to use. Currently, only `gpt-3.5-turbo` and `gpt-3.5-turbo-0301` are supported.
    string model;
    # The messages to generate chat completions for, in the [chat format](/docs/guides/chat/introduction).
    @constraint:Array {minLength: 1}
    ChatCompletionRequestMessage[] messages;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    # 
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature = 1;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    # 
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p = 1;
    # How many chat completion choices to generate for each input message.
    int? n = 1;
    # If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    boolean? 'stream = false;
    # Up to 4 sequences where the API will stop generating further tokens.
    string|string[]? stop?;
    # The maximum number of tokens allowed for the generated answer. By default, the number of tokens the model can return will be (4096 - prompt tokens).
    int max_tokens?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    # 
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? presence_penalty = 0;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    # 
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? frequency_penalty = 0;
    # Modify the likelihood of specified tokens appearing in the completion.
    # 
    # Accepts a json object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    record {} logit_bias?;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

public type CreateCompletionResponse_logprobs record {
    string[] tokens?;
    decimal[] token_logprobs?;
    record {}[] top_logprobs?;
    int[] text_offset?;
};

public type CreateCompletionRequest record {
    # ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    string model;
    # The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
    # 
    # Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
    string|string[]|int[]|PromptItemsArray[]? prompt = "<|endoftext|>";
    # The suffix that comes after a completion of inserted text.
    string? suffix?;
    # The maximum number of [tokens](/tokenizer) to generate in the completion.
    # 
    # The token count of your prompt plus `max_tokens` cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
    int? max_tokens = 16;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    # 
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature = 1;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    # 
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p = 1;
    # How many completions to generate for each prompt.
    # 
    # **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    int? n = 1;
    # Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    boolean? 'stream = false;
    # Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    # 
    # The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    int? logprobs?;
    # Echo back the prompt in addition to the completion
    boolean? echo = false;
    # Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    string|string[]?? stop?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    # 
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? presence_penalty = 0;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    # 
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? frequency_penalty = 0;
    # Generates `best_of` completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    # 
    # When used with `n`, `best_of` controls the number of candidate completions and `n` specifies how many to return – `best_of` must be greater than `n`.
    # 
    # **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    int? best_of = 1;
    # Modify the likelihood of specified tokens appearing in the completion.
    # 
    # Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    # 
    # As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    record {} logit_bias?;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

public type CreateChatCompletionResponse record {
    string id;
    string 'object;
    int created;
    string model;
    CreateChatCompletionResponse_choices[] choices;
    CreateCompletionResponse_usage usage?;
};

public type CreateCompletionResponse record {
    string id;
    string 'object;
    int created;
    string model;
    CreateCompletionResponse_choices[] choices;
    CreateCompletionResponse_usage usage?;
};

public type CreateChatCompletionResponse_choices record {
    int index?;
    ChatCompletionResponseMessage message?;
    string finish_reason?;
};

public type ChatCompletionRequestMessage record {
    # The role of the author of this message.
    string role;
    # The contents of the message
    string content;
    # The name of the user in a multi-user chat
    string name?;
};

public type CreateCompletionResponse_usage record {
    int prompt_tokens;
    int completion_tokens;
    int total_tokens;
};
