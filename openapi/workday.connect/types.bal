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

public type ErrorModelReference record {
    # A description of the error
    string 'error;
};

public type LastUpdatedBy record {
    *InstanceModelReference;
};

public type CommID record {
    *InstanceModelReference;
};

public type CreatedBy record {
    *InstanceModelReference;
};

public type PushDetailRef record {
    # The URL to launch the appropriate mobile app upon acknowledgement.
    string redirectURL?;
    # Message content of a push notification.
    string message;
    # Id of the instance
    string id?;
};

public type Recipients record {
    *RecipientsDetail;
};

public type EmailDetailRef record {
    # Email Configuration Data container for REST API.
    string name?;
    # Message content of the email.
    string body;
    # Email subject line.
    string subject;
    # Reply To
    string replyTo?;
};

public type MessageTemplateDetailRef record {
    CreatedBy createdBy?;
    EmailDetail emailDetail?;
    string lastUpdated?;
    PushDetail pushDetail?;
    # Count of instances using this Message Template
    int usageCount?;
    # Gives the date that the instance was originally created.
    string createdOn?;
    NotificationType notificationType;
    # Message Template Name
    string name;
    LastUpdatedBy lastUpdatedBy?;
    # The Reference ID to use for lookups within our Workday Web Services. For ~supervisory organizations~, this is also the 'Organization ID'
    string referenceID?;
    # Indicates template is active or has been disabled.
    boolean inactive?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type SenderOverride record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse200 record {
    NotificationCategoryDetail[] data?;
    int total?;
};

public type MultipleInstanceModelReference record {
    int total?;
    InstanceModelReference[] data?;
};

public type NotificationCategoryDetail record {
    ParentCategory parentCategory?;
    string name?;
    # The Reference ID to use for lookups within our Workday Web Services. For ~supervisory organizations~, this is also the 'Organization ID'
    string referenceID?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type EmailDetail record {
    *EmailDetailRef;
};

public type ParentCategory record {
    *InstanceModelReference;
};

public type MessageTemplate record {
    *InstanceModelReference;
};

public type PushDetail record {
    *PushDetailRef;
};

public type ConnectSubscriberRepresentation record {
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type NotificationType record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2001 record {
    MessageTemplateDetailRef[] data?;
    int total?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string id;
    # A description of the instance
    string descriptor?;
    # A link to the instance
    string href?;
};

public type MessageDetail record {
    SenderOverride senderOverride?;
    CommID commID?;
    EmailDetail emailDetail?;
    Recipients recipients?;
    MessageTemplate messageTemplate?;
    NotificationType notificationType?;
    PushDetail pushDetail?;
};

public type RecipientsDetail record {
    # Recipients for the Send Message.  This CRF supports any instance of type superclass Workday Connect Subscriber, 1$17306.
    ConnectSubscriberRepresentation[] contacts?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[] errors?;
};
