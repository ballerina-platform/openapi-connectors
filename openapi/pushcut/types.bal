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

public type InlineResponse200Arr InlineResponse200[];

public type InlineResponse2001Arr InlineResponse2001[];

public type SubscriptionDataArr SubscriptionData[];

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
    # API-Keys can be managed in the Account view of the Pushcut app.
    @display {label: "", kind: "password"}
    string apiKey;
|};

public type NotificationactionUrlbackgroundoptionsHttpheader record {
    string 'key?;
    string value?;
};

# Configuration for a web request.
public type NotificationactionUrlbackgroundoptions record {
    # HTTP Method (GET, POST, PUT)
    string httpMethod?;
    # HTTP Content Type
    string httpContentType?;
    # Request body
    string httpBody?;
    # HTTP Headers
    NotificationactionUrlbackgroundoptionsHttpheader[] httpHeader?;
};

public type NotificationAction record {
    # Name of the action.
    string name;
    # Value that will be passed as input to this action when executed.
    string input?;
    # URL that will be opened.
    string url?;
    # HomeKit scene that will be set.
    string homekit?;
    # If true, run the Shortcut or HomeKit scenes on the Automation Server.
    boolean runOnServer?;
    # Online Action that will be executed.
    string online?;
    # Configuration for a web request.
    NotificationactionUrlbackgroundoptions urlBackgroundOptions?;
    # Shortcut that will be run.
    string shortcut?;
    # If true, this action will not dismiss the notification
    boolean keepNotification?;
};

public type Execute record {
    # Value that is passed as input to the shortcut.
    string input?;
};

public type SubscriptionData record {
    # ID of the subscription.
    string id?;
    # Name of the service that registered it.
    string serviceName?;
    # Identifier of the online action.
    string actionName?;
    # URL of the registered webhook
    string url?;
    # True if the URL should be triggered locally.
    boolean isLocalUrl?;
};

public type InlineResponse2001 record {
    # Name of the notification definition
    string id?;
    # Title of the notification
    string title?;
};

public type InlineResponse200 record {
    # Name of the device
    string id?;
};

public type InlineResponse2002 record {
    # ID of the subscription
    string id?;
};

public type Subscription record {
    # A unique name to identify the online action.
    string actionName;
    # The URL to which EventData will be posted to.
    string url;
    # If set to true, the device will call the webhook on its local network.
    boolean isLocalUrl?;
};

public type GeneralError record {
    # Error message
    string 'error?;
};

public type Notification record {
    # Text that is used instead of the one defined in the app.
    string text?;
    # Title that is used instead of the one defined in the app.
    string title?;
    # Value that is passed as input to the notification action.
    string input?;
    NotificationAction defaultAction?;
    # Name of importet image, or URL to an image. (https or local network)
    string image?;
    # Name of a sound that is used to the notification.
    string sound?;
    # List of dynamic actions that will added or merged with the static ones.
    NotificationAction[] actions?;
    # List of devices this notification is sent to. (default is all devices)
    string[] devices?;
};

public type EventData record {
    # Unique id of trigger event
    string id?;
    # Name of the triggered action.
    string actionName?;
    # Input passed with the action.
    string input?;
    # Timestamp of the event
    decimal timestamp?;
};
