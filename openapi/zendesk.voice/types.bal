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
    http:CredentialsConfig auth;
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

public type PhoneNumbers record {
    PhonenumbersPhoneNumbers[] phone_numbers?;
    # Next page
    int? next_page?;
    # Previous page
    int? previous_page?;
    # Count of records exists
    int count?;
};

public type Greeting record {
    GreetingGreeting greeting?;
};

public type GreetingcategoriesGreetingCategories record {
    # The greeting category ID
    int? id?;
    # The name of the greeting category
    string? name?;
};

public type GreetingcategoryGreetingCategory record {
    # The greeting category ID
    int? id?;
    # The name of the greeting category
    string? name?;
};

# The greeting information to create
public type GreetingInfo record {
    # The greeting category ID
    string category_id?;
    # The name of greeting
    string name?;
};

public type GreetingGreeting record {
    # The greeting category ID
    int? category_id?;
    # The greeting ID
    int? id?;
    # The name of the greeting category
    string? name?;
};

public type GreetingCategory record {
    GreetingcategoryGreetingCategory greeting_category?;
};

public type GreetingsGreetings record {
    # The greeting category ID
    int? category_id?;
    # The greeting ID
    int? id?;
    # The name of the greeting category
    string? name?;
};

# The phone number information to create
public type PhoneNumberInfo record {
    # Token returned by a search for available numbers.
    string token?;
};

public type GreetingCategories record {
    GreetingcategoriesGreetingCategories[] greeting_categories?;
};

public type PhonenumberPhoneNumber record {
    # The phone number digits
    string? number?;
    # The formatted phone number
    string? display_number?;
    # Whether the number is toll-free or local
    boolean? toll_free?;
    # The number's geographical location. For example, "CA" or "Leeds"
    string? location?;
    # The ISO code of the country for the phone number
    string? country_code?;
    # A generated token unique for each phone number and used when provisioning the number
    string? token?;
    # The monthly cost of the phone number
    string? price?;
    # The type of address that must be supplied when purchasing the phone number. Possible values - "none", "local", "any", or "foreign"
    string? address_requirements?;
};

public type PhonenumbersPhoneNumbers record {
    # What call recording consent is set to
    string? call_recording_consent?;
    # Whether a phone number has mms, sms, or voice capability
    PhonenumbersCapabilities capabilities?;
    # The ISO code of the country for this number
    string? country_code?;
    # The date and time the phone number was created
    string? created_at?;
    # The names of default system greetings associated with the phone number
    string[] default_greeting_ids?;
    # Default group id
    int? default_group_id?;
    # The formatted phone number
    string? display_number?;
    # The external caller id number
    boolean? 'external?;
    # Failover number associated with the phone number
    string? failover_number?;
    # Custom greetings associated with the phone number
    int[] greeting_ids?;
    # An ids of associated groups
    int[] group_ids?;
    # Automatically assigned id upon creation
    int? id?;
    # ID of IVR associated with the phone number
    int? ivr_id?;
    # The type of line associated with the phone number
    string? line_type?;
    # The number's geographical location. For example, "CA" or "Leeds"
    string? location?;
    # The nickname if one is set. Otherwise the display_number
    string? name?;
    # The nickname of the number if one is set
    string? nickname?;
    # The phone number digits
    string? number?;
    # Whether or not the phone number has outbound enabled
    boolean? outbound_enabled?;
    # Level of priority associated with the phone number
    int? priority?;
    # Whether calls for the number are recorded or not
    boolean? recorded?;
    # ID of schedule associated with the phone number
    int? schedule_id?;
    # Whether or not the phone number has sms enabled
    boolean? sms_enabled?;
    # The group associated with this phone number
    int? sms_group_id?;
    # A generated token, unique for each phone number and used when provisioning the number
    string? token?;
    # Whether the number is toll-free or local
    boolean? toll_free?;
    # Whether calls for the number are transcribed or not
    boolean? transcription?;
    # Whether or not the phone number has voice enabled
    boolean? voice_enabled?;
};

public type PhoneNumber record {
    PhonenumberPhoneNumber phone_number?;
};

public type Greetings record {
    GreetingsGreetings[] greetings?;
    # Next page
    int? next_page?;
    # Previous page
    int? previous_page?;
    # Count of records exists
    int count?;
};

# Whether a phone number has mms, sms, or voice capability
public type PhonenumbersCapabilities record {
    # sms
    boolean? sms?;
    # mms
    boolean? mms?;
    # voice
    boolean? voice?;
};
