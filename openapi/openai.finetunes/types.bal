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

public type OpenAIFile record {
    string id;
    string 'object;
    int bytes;
    int created_at;
    string filename;
    string purpose;
    string status?;
    record {}? status_details = ();
};

public type ListModelsResponse record {
    string 'object;
    Model[] data;
};

public type ListFineTuneEventsResponse record {
    string 'object;
    FineTuneEvent[] data;
};

public type DeleteFileResponse record {
    string id;
    string 'object;
    boolean deleted;
};

public type CreateFineTuneRequest record {
    # The ID of an uploaded file that contains training data.
    # 
    # See [upload file](/docs/api-reference/files/upload) for how to upload a file.
    # 
    # Your dataset must be formatted as a JSONL file, where each training
    # example is a JSON object with the keys "prompt" and "completion".
    # Additionally, you must upload your file with the purpose `fine-tune`.
    # 
    # See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    string training_file;
    # The ID of an uploaded file that contains validation data.
    # 
    # If you provide this file, the data is used to generate validation
    # metrics periodically during fine-tuning. These metrics can be viewed in
    # the [fine-tuning results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    # Your train and validation data should be mutually exclusive.
    # 
    # Your dataset must be formatted as a JSONL file, where each validation
    # example is a JSON object with the keys "prompt" and "completion".
    # Additionally, you must upload your file with the purpose `fine-tune`.
    # 
    # See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    string validation_file?;
    # The name of the base model to fine-tune. You can select one of "ada",
    # "babbage", "curie", "davinci", or a fine-tuned model created after 2022-04-21.
    # To learn more about these models, see the
    # [Models](https://platform.openai.com/docs/models) documentation.
    string? model = "curie";
    # The number of epochs to train the model for. An epoch refers to one
    # full cycle through the training dataset.
    int? n_epochs = 4;
    # The batch size to use for training. The batch size is the number of
    # training examples used to train a single forward and backward pass.
    # 
    # By default, the batch size will be dynamically configured to be
    # ~0.2% of the number of examples in the training set, capped at 256 -
    # in general, we've found that larger batch sizes tend to work better
    # for larger datasets.
    int batch_size?;
    # The learning rate multiplier to use for training.
    # The fine-tuning learning rate is the original learning rate used for
    # pretraining multiplied by this value.
    # 
    # By default, the learning rate multiplier is the 0.05, 0.1, or 0.2
    # depending on final `batch_size` (larger learning rates tend to
    # perform better with larger batch sizes). We recommend experimenting
    # with values in the range 0.02 to 0.2 to see what produces the best
    # results.
    decimal learning_rate_multiplier?;
    # The weight to use for loss on the prompt tokens. This controls how
    # much the model tries to learn to generate the prompt (as compared
    # to the completion which always has a weight of 1.0), and can add
    # a stabilizing effect to training when completions are short.
    # 
    # If prompts are extremely long (relative to completions), it may make
    # sense to reduce this weight so as to avoid over-prioritizing
    # learning the prompt.
    decimal? prompt_loss_weight = 0.01;
    # If set, we calculate classification-specific metrics such as accuracy
    # and F-1 score using the validation set at the end of every epoch.
    # These metrics can be viewed in the [results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    # 
    # In order to compute classification metrics, you must provide a
    # `validation_file`. Additionally, you must
    # specify `classification_n_classes` for multiclass classification or
    # `classification_positive_class` for binary classification.
    boolean? compute_classification_metrics = false;
    # The number of classes in a classification task.
    # 
    # This parameter is required for multiclass classification.
    int classification_n_classes?;
    # The positive class in binary classification.
    # 
    # This parameter is needed to generate precision, recall, and F1
    # metrics when doing binary classification.
    string classification_positive_class?;
    # If this is provided, we calculate F-beta scores at the specified
    # beta values. The F-beta score is a generalization of F-1 score.
    # This is only used for binary classification.
    # 
    # With a beta of 1 (i.e. the F-1 score), precision and recall are
    # given the same weight. A larger beta score puts more weight on
    # recall and less on precision. A smaller beta score puts more weight
    # on precision and less on recall.
    decimal[] classification_betas?;
    # A string of up to 40 characters that will be added to your fine-tuned model name.
    # 
    # For example, a `suffix` of "custom-model-name" would produce a model name like `ada:ft-your-org:custom-model-name-2022-02-15-04-21-04`.
    @constraint:String {maxLength: 40, minLength: 1}
    string suffix?;
};

public type Model record {
    string id;
    string 'object;
    int created;
    string owned_by;
};

public type CreateFileRequest record {|
    # Name of the [JSON Lines](https://jsonlines.readthedocs.io/en/latest/) file to be uploaded.
    # 
    # If the `purpose` is set to "fine-tune", each line is a JSON record with "prompt" and "completion" fields representing your [training examples](/docs/guides/fine-tuning/prepare-training-data).
    record {byte[] fileContent; string fileName;} file;
    # The intended purpose of the uploaded documents.
    # 
    # Use "fine-tune" for [Fine-tuning](/docs/api-reference/fine-tunes). This allows us to validate the format of the uploaded file.
    string purpose;
|};

public type ListFilesResponse record {
    string 'object;
    OpenAIFile[] data;
};

public type DeleteModelResponse record {
    string id;
    string 'object;
    boolean deleted;
};

public type ListFineTunesResponse record {
    string 'object;
    FineTune[] data;
};

public type FineTune record {
    string id;
    string 'object;
    int created_at;
    int updated_at;
    string model;
    string? fine_tuned_model;
    string organization_id;
    string status;
    record {} hyperparams;
    OpenAIFile[] training_files;
    OpenAIFile[] validation_files;
    OpenAIFile[] result_files;
    FineTuneEvent[] events?;
};

public type FineTuneEvent record {
    string 'object;
    int created_at;
    string level;
    string message;
};
