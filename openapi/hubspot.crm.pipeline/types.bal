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
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

public type CollectionResponsePipelineStage record {
    PipelineStage[] results;
    Paging paging?;
};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

# An input used to update some properties on a pipeline definition.
public type PipelineStagePatchInput record {
    # A label used to organize pipeline stages in HubSpot's UI. Each pipeline stage's label must be unique within that pipeline.
    string label?;
    # Whether the pipeline is archived.
    boolean archived?;
    # The order for displaying this pipeline stage. If two pipeline stages have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder?;
    # A JSON object containing properties that are not present on all object pipelines.
    # 
    # For `deals` pipelines, the `probability` field is required (`{ "probability": 0.5 }`), and represents the likelihood a deal will close. Possible values are between 0.0 and 1.0 in increments of 0.1.
    # 
    # For `tickets` pipelines, the `ticketState` field is optional (`{ "ticketState": "OPEN" }`), and represents whether the ticket remains open or has been closed by a member of your Support team. Possible values are `OPEN` or `CLOSED`.
    record {} metadata;
};

# An input used to update some properties on a pipeline definition.
public type PipelinePatchInput record {
    # A unique label used to organize pipelines in HubSpot's UI
    string label?;
    # The order for displaying this pipeline. If two pipelines have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder?;
    # Whether the pipeline is archived. This property should only be provided when restoring an archived pipeline. If it's provided in any other call, the request will fail and a `400 Bad Request` will be returned.
    boolean archived?;
};

# A pipeline stage definition.
public type PipelineStage record {
    # The date the pipeline stage was created. The stages on default pipelines will have createdAt = 0.
    string createdAt;
    # The date the pipeline was archived. `archivedAt` will only be present if the pipeline is archived.
    string archivedAt?;
    # The date the pipeline stage was last updated.
    string updatedAt;
    # Whether the pipeline is archived.
    boolean archived;
    # A label used to organize pipeline stages in HubSpot's UI. Each pipeline stage's label must be unique within that pipeline.
    string label;
    # The order for displaying this pipeline stage. If two pipeline stages have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder;
    # A JSON object containing properties that are not present on all object pipelines.
    # 
    # For `deals` pipelines, the `probability` field is required (`{ "probability": 0.5 }`), and represents the likelihood a deal will close. Possible values are between 0.0 and 1.0 in increments of 0.1.
    # 
    # For `tickets` pipelines, the `ticketState` field is optional (`{ "ticketState": "OPEN" }`), and represents whether the ticket remains open or has been closed by a member of your Support team. Possible values are `OPEN` or `CLOSED`.
    record {} metadata;
    # A unique identifier generated by HubSpot that can be used to retrieve and update the pipeline stage.
    string id;
};

# An input used to create or replace a pipeline stage's definition.
public type PipelineStageInput record {
    # A label used to organize pipeline stages in HubSpot's UI. Each pipeline stage's label must be unique within that pipeline.
    string label;
    # The order for displaying this pipeline stage. If two pipeline stages have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder;
    # A JSON object containing properties that are not present on all object pipelines.
    # 
    # For `deals` pipelines, the `probability` field is required (`{ "probability": 0.5 }`), and represents the likelihood a deal will close. Possible values are between 0.0 and 1.0 in increments of 0.1.
    # 
    # For `tickets` pipelines, the `ticketState` field is optional (`{ "ticketState": "OPEN" }`), and represents whether the ticket remains open or has been closed by a member of your Support team. Possible values are `OPEN` or `CLOSED`.
    record {} metadata;
};

public type Paging record {
    NextPage next?;
};

# An input used to create or replace a pipeline's definition.
public type PipelineInput record {
    # Pipeline stage inputs used to create the new or replacement pipeline.
    PipelineStageInput[] stages;
    # A unique label used to organize pipelines in HubSpot's UI
    string label;
    # The order for displaying this pipeline. If two pipelines have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

public type CollectionResponsePipeline record {
    Pipeline[] results;
    Paging paging?;
};

public type NextPage record {
    string after;
    string link?;
};

# A pipeline definition.
public type Pipeline record {
    # The stages associated with the pipeline. They can be retrieved and updated via the pipeline stages endpoints.
    PipelineStage[] stages;
    # The date the pipeline was created. The default pipelines will have createdAt = 0.
    string createdAt;
    # The date the pipeline was archived. `archivedAt` will only be present if the pipeline is archived.
    string archivedAt?;
    # The date the pipeline was last updated.
    string updatedAt;
    # Whether the pipeline is archived.
    boolean archived;
    # A unique label used to organize pipelines in HubSpot's UI
    string label;
    # The order for displaying this pipeline. If two pipelines have a matching `displayOrder`, they will be sorted alphabetically by label.
    int displayOrder;
    # A unique identifier generated by HubSpot that can be used to retrieve and update the pipeline.
    string id;
};
