import ballerina/http;
import ballerina/constraint;

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
    # Provide your Cognitive Services Azure OpenAI account key here.
    @display {label: "", kind: "password"}
    string apiKey;
|};

# Inner error codes as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type InnerErrorCode string;

# Defines the type of an object.
public type TypeDiscriminator string;

# The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.
public type ScaleSettings record {
    # Defines how scaling operations will be executed.
    ScaleType scale_type;
};

# Defines how scaling operations will be executed.
public type ScaleType string;

# Deployments manage the reserved quota for Azure OpenAI models and make them available for inference requests.
public type Deployment record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The state of a job or item.
    State status?;
    # A timestamp when this job or item was created (in unix epochs).
    int created_at?;
    # A timestamp when this job or item was modified last (in unix epochs).
    int updated_at?;
    # The identity of this item.
    string id?;
    # The OpenAI model identifier (model-id) to deploy. Can be a base model or a fine tune.
    @constraint:String {minLength: 1}
    string model;
    # The owner of this deployment. For Azure OpenAI only "organization-owner" is supported.
    string owner?;
    # The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.
    ScaleSettings scale_settings;
    # Error content as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    Error 'error?;
};

# Error content as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type Error record {
    # Error codes as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    ErrorCode code;
    # The message of this error.
    @constraint:String {minLength: 1}
    string message;
    # The location where the error happened if available.
    string target?;
    # The error details if available.
    Error[] details?;
    # Inner error as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    InnerError innererror?;
};

# Inner error as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type InnerError record {
    # Inner error codes as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    InnerErrorCode code?;
    # Inner error as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    InnerError innererror?;
};

# Error response as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type ErrorResponse record {
    # Error content as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    Error 'error;
};

# Defines changes to the deployment.
public type DeploymentUpdate record {
    # The new OpenAI model identifier (model-id) to be used for this deployment. Can be a base model or a fine tune.
    string model?;
    # The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.
    ScaleSettingsUpdate scale_settings?;
};

# Represents a list of deployments.
public type DeploymentList record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The list of items.
    Deployment[] data?;
};

# The state of a job or item.
public type State string;

# Error codes as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type ErrorCode string;

# The scale settings of a deployment. It defines the modes for scaling and the reserved capacity.
public type ScaleSettingsUpdate record {
    # Defines how scaling operations will be executed.
    ScaleType scale_type;
};
