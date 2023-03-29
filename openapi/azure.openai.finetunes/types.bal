import ballerina/http;
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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

# Represents a list of fine tunes.
public type FineTuneList record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The list of items.
    FineTune[] data?;
};

# Defines how scaling operations will be executed.
public type ScaleType string;

# The life cycle status of a model.
# Note: A model can be promoted from "preview" to "generally-available", but never from "generally-available" to "preview".
public type LifeCycleStatus string;

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

# The verbosity level of an event.
public type LogLevel string;

# Represents a list of models.
public type ModelList record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The list of items.
    Model[] data?;
};

# Defines the dates of deprecation for the different use cases of a model.
# Usually base models support 1 year of fine tuning after creation. Inference is typically supported 2 years after creation of base or
# fine tuned models. The exact dates are specified in the properties.
public type Deprecation record {
    # The end date of fine tune support of this model. Will be `null` for fine tune models.
    int fine_tune?;
    # The end date of inference support of this model.
    int inference;
};

# Fine tuning is a job to tailor a model to specific training data.
public type FineTune record {
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
    # The identifier (model-id) of the base model used for the fine-tune.
    @constraint:String {minLength: 1}
    string model;
    # The identifier (model-id) of the resulting fine tuned model. This property is only populated for successfully completed fine-tune runs.
    # Use this identifier to create a deployment for inferencing.
    string fine_tuned_model?;
    # The file identities (file-id) that are used for training the fine tuned model.
    File[] training_files;
    # The file identities (file-id) that are used to evaluate the fine tuned model during training.
    File[] validation_files?;
    # The result file identities (file-id) containing training and evaluation metrics in csv format.
    # The file is only available for successfully completed fine-tune runs.
    File[] result_files?;
    # The events that show the progress of the fine-tune run including queued, running and completed.
    Event[] events?;
    # The organisation id of this fine tune job. Unused on Azure OpenAI; compatibility for OpenAI only.
    string organisation_id?;
    # The user id of this fine tune job. Unused on Azure OpenAI; compatibility for OpenAI only.
    string user_id?;
    # The hyper parameter settings used in a fine tune job.
    HyperParameters hyperparams?;
    # The suffix used to identify the fine-tuned model.
    string suffix?;
    # Error content as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    Error 'error?;
};

# Defines a document to import from an external content url to be usable with Azure OpenAI.
public type FileImport record {
    # The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning. This allows us to validate the format of the uploaded file.
    Purpose purpose;
    # The name of the [JSON Lines](https://jsonlines.readthedocs.io/en/latest/) file to be uploaded.
    # If the `purpose` is set to "fine-tune", each line is a JSON record with "prompt" and "completion" fields representing your training examples.
    @constraint:String {minLength: 1}
    string filename;
    # The url to download the document from (can be SAS url of a blob or any other external url accessible with a GET request).
    string content_url;
};

# Inner error codes as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type InnerErrorCode string;

# A file is a document usable for training and validation. It can also be a service generated document with result details.
public type FileStatistics record {
    # The number of tokens used in prompts and completions for files of kind "fine-tune" once validation of file content is complete.
    int tokens?;
    # The number of contained training examples in files of kind "fine-tune" once validation of file content is complete.
    int examples?;
};

# The hyper parameter settings used in a fine tune job.
public type HyperParameters record {
    # The batch size to use for training. The batch size is the number of training examples used to train a single forward and backward pass.
    # In general, we've found that larger batch sizes tend to work better for larger datasets.
    # The default value as well as the maximum value for this property are specific to a base model.
    int batch_size?;
    # The learning rate multiplier to use for training. The fine-tuning learning rate is the original learning rate used for pre-training multiplied by this value.
    # Larger learning rates tend to perform better with larger batch sizes.
    # We recommend experimenting with values in the range 0.02 to 0.2 to see what produces the best results.
    decimal learning_rate_multiplier?;
    # The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
    int n_epochs?;
    # The weight to use for loss on the prompt tokens. This controls how much the model tries to learn to generate the prompt
    # (as compared to the completion which always has a weight of 1.0), and can add a stabilizing effect to training when completions are short.
    # If prompts are extremely long (relative to completions), it may make sense to reduce this weight so as to avoid over-prioritizing learning the prompt.
    decimal prompt_loss_weight?;
    # A value indicating whether to compute classification metrics.
    # If set, we calculate classification-specific metrics such as accuracy and F-1 score using the validation set at the end of every epoch.
    # These metrics can be viewed in the results file. In order to compute classification metrics, you must provide a validation_file.Additionally,
    # you must specify classification_n_classes for multiclass classification or classification_positive_class for binary classification.
    boolean compute_classification_metrics?;
    # The number of classes in a classification task.
    # This parameter is required for multiclass classification.
    int classification_n_classes?;
    # The positive class in binary classification.
    # This parameter is needed to generate precision, recall, and F1 metrics when doing binary classification.
    string classification_positive_class?;
    # The classification beta values. If this is provided, we calculate F-beta scores at the specified beta values.
    # The F-beta score is a generalization of F-1 score. This is only used for binary classification.
    # With a beta of 1 (i.e.the F-1 score), precision and recall are given the same weight.
    # A larger beta score puts more weight on recall and less on precision. A smaller beta score puts more weight on precision and less on recall.
    decimal[] classification_betas?;
};

# Defines the type of an object.
public type TypeDiscriminator string;

# Represents a list of files.
public type FileList record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The list of items.
    File[] data?;
};

# Defines the values of a fine tune job.
public type FineTuneCreation record {
    # The identifier (model-id) of the base model used for this fine-tune.
    @constraint:String {minLength: 1}
    string model;
    # The file identity (file-id) that is used for training this fine tuned model.
    @constraint:String {minLength: 1}
    string training_file;
    # The file identity (file-id) that is used to evaluate the fine tuned model during training.
    string validation_file?;
    # The suffix used to identify the fine-tuned model. The suffix can contain up to 40 characters (a-z, A-Z, 0-9,- and _) that will be added to your fine-tuned model name.
    string suffix?;
    # The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
    int n_epochs?;
    # The batch size to use for training. The batch size is the number of training examples used to train a single forward and backward pass.
    # In general, we've found that larger batch sizes tend to work better for larger datasets.
    # The default value as well as the maximum value for this property are specific to a base model.
    int batch_size?;
    # The learning rate multiplier to use for training. The fine-tuning learning rate is the original learning rate used for pre-training multiplied by this value.
    # Larger learning rates tend to perform better with larger batch sizes.
    # We recommend experimenting with values in the range 0.02 to 0.2 to see what produces the best results.
    decimal learning_rate_multiplier?;
    # The weight to use for loss on the prompt tokens. This controls how much the model tries to learn to generate the prompt
    # (as compared to the completion which always has a weight of 1.0), and can add a stabilizing effect to training when completions are short.
    # If prompts are extremely long (relative to completions), it may make sense to reduce this weight so as to avoid over-prioritizing learning the prompt.
    decimal prompt_loss_weight?;
    # A value indicating whether to compute classification metrics.
    # If set, we calculate classification-specific metrics such as accuracy and F-1 score using the validation set at the end of every epoch.
    # These metrics can be viewed in the results file. In order to compute classification metrics, you must provide a validation_file.Additionally,
    # you must specify classification_n_classes for multiclass classification or classification_positive_class for binary classification.
    boolean compute_classification_metrics?;
    # The number of classes in a classification task.
    # This parameter is required for multiclass classification.
    int classification_n_classes?;
    # The positive class in binary classification.
    # This parameter is needed to generate precision, recall, and F1 metrics when doing binary classification.
    string classification_positive_class?;
    # The classification beta values. If this is provided, we calculate F-beta scores at the specified beta values.
    # The F-beta score is a generalization of F-1 score. This is only used for binary classification.
    # With a beta of 1 (i.e.the F-1 score), precision and recall are given the same weight.
    # A larger beta score puts more weight on recall and less on precision. A smaller beta score puts more weight on precision and less on recall.
    decimal[] classification_betas?;
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

# The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning. This allows us to validate the format of the uploaded file.
public type Purpose string;

public type Files_body record {
    # The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning. This allows us to validate the format of the uploaded file.
    string purpose;
    # Gets or sets the file to upload into Azure OpenAI.
    record {byte[] fileContent; string fileName;} file;
};

# Error response as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type ErrorResponse record {
    # Error content as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    Error 'error;
};

# Represents a list of events.
public type EventList record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # The list of items.
    Event[] data?;
};

# The capabilities of a base or fine tune model.
public type Capabilities record {
    # A value indicating whether a model can be used for fine tuning.
    boolean fine_tune;
    # A value indicating whether a model can be deployed.
    boolean inference;
    # A value indicating whether a model supports completion.
    boolean completion;
    # A value indicating whether a model supports embeddings.
    boolean embeddings;
    # The supported scale types for deployments of this model.
    ScaleType[] scale_types;
};

# The state of a job or item.
public type State string;

# A model is either a base model or the result of a successful fine tune job.
public type Model record {
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
    # The base model identity (model-id) if this is a fine tune model; otherwise `null`.
    string model?;
    # The fine tune job identity (fine-tune-id) if this is a fine tune model; otherwise `null`.
    string fine_tune?;
    # The capabilities of a base or fine tune model.
    Capabilities capabilities;
    # The life cycle status of a model.
    # Note: A model can be promoted from "preview" to "generally-available", but never from "generally-available" to "preview".
    LifeCycleStatus lifecycle_status;
    # Defines the dates of deprecation for the different use cases of a model.
    # Usually base models support 1 year of fine tuning after creation. Inference is typically supported 2 years after creation of base or
    # fine tuned models. The exact dates are specified in the properties.
    Deprecation deprecation;
};

public type Event record {
    # Defines the type of an object.
    TypeDiscriminator 'object?;
    # A timestamp when this event was created (in unix epochs).
    int created_at;
    # The verbosity level of an event.
    LogLevel level;
    # The message describing the event. This can be a change of state, e.g., enqueued, started, failed or completed, or other events like uploaded results.
    @constraint:String {minLength: 1}
    string message;
};

# Error codes as defined in the Microsoft REST guidelines
# (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
public type ErrorCode string;

# A file is a document usable for training and validation. It can also be a service generated document with result details.
public type File record {
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
    # The size of this file when available (can be null). File sizes larger than 2^53-1 are not supported to ensure compatibility
    # with JavaScript integers.
    int bytes?;
    # The intended purpose of the uploaded documents. Use "fine-tune" for fine-tuning. This allows us to validate the format of the uploaded file.
    Purpose purpose;
    # The name of the file.
    @constraint:String {minLength: 1}
    string filename;
    # A file is a document usable for training and validation. It can also be a service generated document with result details.
    FileStatistics statistics?;
    # Error content as defined in the Microsoft REST guidelines
    # (https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#7102-error-condition-responses).
    Error 'error?;
};
