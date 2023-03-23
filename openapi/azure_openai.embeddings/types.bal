import ballerina/http;
import ballerina/constraint;

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
    string apiKey;
|};

@constraint:String {minLength: 1}
public type InputItemsString string;

public type ErrorResponse_error record {
    string code?;
    string message?;
    string param?;
    string 'type?;
};

public type Inline_response_200_usage record {
    int prompt_tokens;
    int total_tokens;
};

public type Deploymentid_embeddings_body record {
    # Input text to get embeddings for, encoded as a string. To get embeddings for multiple inputs in a single request, pass an array of strings. Each input must not exceed 2048 tokens in length.
    # Unless you are embedding code, we suggest replacing newlines (\n) in your input with a single space, as we have observed inferior results when newlines are present.
    string|InputItemsString[]? input;
    # A unique identifier representing your end-user, which can help monitoring and detecting abuse.
    string user?;
    # input type of embedding search to use
    string input_type?;
    # ID of the model to use. You can use the Models_List operation to see all of your available models, or see our Models_Get overview for descriptions of them.
    string model?;
};

public type Inline_response_200 record {
    string 'object;
    string model;
    Inline_response_200_data[] data;
    Inline_response_200_usage usage;
};

public type Inline_response_200_data record {
    int index;
    string 'object;
    decimal[] embedding;
};

public type ErrorResponse record {
    ErrorResponse_error 'error?;
};
