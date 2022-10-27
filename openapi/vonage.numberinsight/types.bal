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
    # You can find your API key in your [account overview](https://dashboard.nexmo.com/account-overview)
    @display {label: "", kind: "password"}
    string apiKey;
    # You can find your API secret in your [account overview](https://dashboard.nexmo.com/account-overview)
    @display {label: "", kind: "password"}
    string apiSecret;
|};

# Information about the network `number` is currently connected to.
public type NiCurrentCarrierProperties record {
    # The [https://en.wikipedia.org/wiki/Mobile_country_code](https://en.wikipedia.org/wiki/Mobile_country_code) for the carrier`number` is associated with. Unreal numbers are marked as`unknown` and the request is rejected altogether if the number is impossible according to the [E.164](https://en.wikipedia.org/wiki/E.164) guidelines.
    string? network_code?;
    # The full name of the carrier that `number` is associated with.
    string? name?;
    # The country that `number` is associated with. This is in ISO 3166-1 alpha-2   format.
    string? country?;
    # The type of network that `number` is associated with.
    string? network_type?;
};

# Information about the network `number` is currently connected to.
public type NiCallerIdentity record {
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string? caller_type?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string? caller_name?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string? first_name?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string? last_name?;
};

# An object indicating whether all information about a phone number has been returned.
public type NiresponsexmladvancedLookupOutcome record {
    # Shows if all information about a phone number has been returned. Possible values:
    # 
    # Code | Text
    # -- | --
    # 0 | Success
    # 1 | Partial success - some fields populated
    # 2 | Failed
    decimal code?;
    # Shows if all information about a phone number has been returned.
    string lookup_outcome_message?;
};

# Code | Text        
# #   -- | --
# #    0 | Success - request accepted for delivery by .
# #    1 | Busy - you have made more requests in the last second than are permitted by your account. Please retry.
# #    3 | Invalid - your request is incomplete and missing some mandatory parameters.
# #    4 | Invalid credentials - the _api_key_ or _api_secret_ you supplied is either not valid or has been disabled.
# #    5 | Internal Error - the format of the recipient address is not valid.
# #    9 | Partner quota exceeded - your account does not have sufficient credit to process this request.
public type NiBasicStatus int;

# Code | Text
# #         -- | --
# #          0 | Success - request accepted for delivery by .
# #          1 | Busy - you have made more requests in the last second than are permitted by your account. Please retry.
# #          3 | Invalid - your request is incomplete and missing some mandatory parameters.
# #          4 | Invalid credentials - the _api_key_ or _api_secret_ you supplied is either not valid or has been disabled.
# #          5 | Internal Error - the format of the recipient address is not valid.
# #          9 | Partner quota exceeded - your account does not have sufficient credit to process this request.
# #         19 | Facility Not Allowed - your request makes use of a facility that is not enabled on your account.
# # 43, 44, 45 | Live mobile lookup not returned. Not all return parameters are available.
# #        999 | Request unparseable.
public type NiStandardAdvancedStatus int;

# Basic
public type NiResponseXmlBasic record {
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id?;
    # The `number` in your request in international format.
    string international_format_number?;
    # An object containing the `number` in your request in the format used by the country the number belongs to.
    NiresponsexmlbasicLocalNumber local_number?;
    # The error code and status of your request
    NiresponsexmlbasicError 'error?;
};

# Information about the roaming status for number. This is applicable to mobile numbers only.
public type NiresponsexmlstandardRoaming record {
    # Roaming status for number
    string status?;
};

# Contains details of the number owner, if `cnam` was set to `true` in the request.
public type NiresponsexmlstandardCallerIdentity record {
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string callerType?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string callerName?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string firstName?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string lastName?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_name?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string last_name?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string first_name?;
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_type?;
};

# If the user has changed carrier for number. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported
public type NiresponsexmlstandardPorted record {
    # If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
    string ported_message?;
};

# Information about the network `number` was initially connected to.
public type NiInitialCarrierProperties record {
    # The [https://en.wikipedia.org/wiki/Mobile_country_code](https://en.wikipedia.org/wiki/Mobile_country_code) for the carrier`number` is associated with. Unreal numbers are marked as`unknown` and the request is rejected altogether if the number is impossible according to the [E.164](https://en.wikipedia.org/wiki/E.164) guidelines.
    string? network_code?;
    # The full name of the carrier that `number` is associated with.
    string? name?;
    # The country that `number` is associated with. This is in ISO 3166-1 alpha-2   format.
    string? country?;
    # The type of network that `number` is associated with.
    string? network_type?;
};

# An object containing the `number` in your request in the format used by the country the number belongs to.
public type NiresponsexmlbasicLocalNumber record {
    # Two character country code for `number`. This is in [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) format.
    string country_code?;
    # Three character country code for `number`. This is in [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) format.
    string country_code_iso3?;
    # The full name of the country that `number` is registered in.
    string country_name?;
    # The numeric prefix for the country that `number` is registered in.
    string country_prefix?;
    # The `number` in your request in the format used by the country the number belongs to.
    string number?;
};

public type NiResponseJsonStandard record {
    *NiResponseJsonBasic;
    # The amount in EUR charged to your account.
    string request_price?;
    # If there is an internal lookup error, the `refund_price` will reflect the lookup price. If `cnam` is requested for a non-US number the `refund_price` will reflect the `cnam` price. If both of these conditions occur, `refund_price` is the sum of the lookup price and `cnam` price.
    string refund_price?;
    # Your account balance in EUR after this request.
    string remaining_balance?;
    # Information about the network `number` is currently connected to.
    NiCurrentCarrierProperties current_carrier?;
    # Information about the network `number` was initially connected to.
    NiInitialCarrierProperties original_carrier?;
    # If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
    string ported?;
    NiRoaming|string roaming?;
    # Information about the network `number` is currently connected to.
    NiCallerIdentity caller_identity?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_name?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string last_name?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string first_name?;
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_type?;
};

# Contains details of the number owner, if `cnam` was set to `true` in the request.
public type NiresponsexmladvancedCallerIdentity record {
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string callerType?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string callerName?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string firstName?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string lastName?;
};

# Standard
public type NiResponseXmlStandard record {
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id?;
    # The `number` in your request in international format.
    string international_format_number?;
    # An object containing the `number` in your request in the format used by the country the number belongs to.
    NiresponsexmlbasicLocalNumber local_number?;
    # The error code and status of your request
    NiresponsexmlbasicError 'error?;
    # If there is an internal lookup error, the `refund_price` will reflect the lookup price. If `cnam` is requested for a non-US number the `refund_price` will reflect the `cnam` price. If both of these conditions occur, `refund_price` is the sum of the lookup price and `cnam` price.
    string request_price?;
    # Your account balance in EUR after this request.
    string remaining_balance?;
    # Information about the network `number` is currently connected to.
    NiCurrentCarrierProperties current_carrier?;
    # Information about the network `number` was initially connected to.
    NiInitialCarrierProperties original_carrier?;
    # If the user has changed carrier for number. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported
    NiresponsexmlstandardPorted ported?;
    # Information about the roaming status for number. This is applicable to mobile numbers only.
    NiresponsexmlstandardRoaming roaming?;
    # Contains details of the number owner, if `cnam` was set to `true` in the request.
    NiresponsexmlstandardCallerIdentity caller_identity?;
};

# Advanced
public type NiResponseJsonAdvanced record {
    # Code | Text
    # #         -- | --
    # #          0 | Success - request accepted for delivery by .
    # #          1 | Busy - you have made more requests in the last second than are permitted by your account. Please retry.
    # #          3 | Invalid - your request is incomplete and missing some mandatory parameters.
    # #          4 | Invalid credentials - the _api_key_ or _api_secret_ you supplied is either not valid or has been disabled.
    # #          5 | Internal Error - the format of the recipient address is not valid.
    # #          9 | Partner quota exceeded - your account does not have sufficient credit to process this request.
    # #         19 | Facility Not Allowed - your request makes use of a facility that is not enabled on your account.
    # # 43, 44, 45 | Live mobile lookup not returned. Not all return parameters are available.
    # #        999 | Request unparseable.
    NiStandardAdvancedStatus status;
    # The status description of your request.
    string status_message;
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id;
    # The `number` in your request in international format.
    string international_format_number;
    # The `number` in your request in the format used by the country the number belongs to.
    string national_format_number;
    # Two character country code for `number`. This is in [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) format.
    string country_code;
    # Three character country code for `number`. This is in [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) format.
    string country_code_iso3;
    # The full name of the country that `number` is registered in.
    string country_name;
    # The numeric prefix for the country that `number` is registered in.
    string country_prefix;
    # The amount in EUR charged to your account.
    string request_price?;
    # If there is an internal lookup error, the `refund_price` will reflect the lookup price. If `cnam` is requested for a non-US number the `refund_price` will reflect the `cnam` price. If both of these conditions occur, `refund_price` is the sum of the lookup price and `cnam` price.
    string refund_price?;
    # Your account balance in EUR after this request.
    string remaining_balance?;
    # Information about the network `number` is currently connected to.
    NiCurrentCarrierProperties current_carrier?;
    # Information about the network `number` was initially connected to.
    NiInitialCarrierProperties original_carrier?;
    # If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
    string? ported?;
    NiRoaming|string? roaming?;
    # Information about the network `number` is currently connected to.
    NiCallerIdentity caller_identity?;
    # Shows if all information about a phone number has been returned. Possible values:
    # 
    # Code | Text
    # --- | ---
    # 0 | Success
    # 1 | Partial success - some fields populated
    # 2 | Failed
    int lookup_outcome?;
    # Shows if all information about a phone number has been returned.
    string lookup_outcome_message?;
    # Does `number` exist. `unknown` means the number could not be validated. `valid` means the number is valid. `not_valid` means the number is not valid. `inferred_not_valid` means that the number could not be determined as valid or invalid via an external system and the best guess is that the number is invalid. This is applicable to mobile numbers only.
    string valid_number?;
    # Can you call `number` now. This is applicable to mobile numbers only.
    string? reachable?;
};

# Information about the roaming status for `number`. This is applicable to mobile numbers only.
public type NiRoaming record {
    # Is `number` outside its home carrier network.
    string? status?;
    # If `number` is `roaming`, this is the [code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the country `number` is roaming in.
    string? roaming_country_code?;
    # If `number` is `roaming`, this is the id of the carrier network `number` is roaming in.
    string? roaming_network_code?;
    # If `number` is `roaming`, this is the name of the carrier network `number` is roaming in.
    string? roaming_network_name?;
};

# The error code and status of your request
public type NiresponsexmlbasicError record {
    # The status code
    string code?;
    # The status description of your request.
    string status_text?;
};

public type NiResponseJsonBasic record {
    # Code | Text        
    # #   -- | --
    # #    0 | Success - request accepted for delivery by .
    # #    1 | Busy - you have made more requests in the last second than are permitted by your account. Please retry.
    # #    3 | Invalid - your request is incomplete and missing some mandatory parameters.
    # #    4 | Invalid credentials - the _api_key_ or _api_secret_ you supplied is either not valid or has been disabled.
    # #    5 | Internal Error - the format of the recipient address is not valid.
    # #    9 | Partner quota exceeded - your account does not have sufficient credit to process this request.
    NiBasicStatus status?;
    # The status description of your request.
    string status_message?;
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id?;
    # The `number` in your request in international format.
    string international_format_number?;
    # The `number` in your request in the format used by the country the number belongs to.
    string national_format_number?;
    # Two character country code for `number`. This is in [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) format.
    string country_code?;
    # Three character country code for `number`. This is in [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) format.
    string country_code_iso3?;
    # The full name of the country that `number` is registered in.
    string country_name?;
    # The numeric prefix for the country that `number` is registered in.
    string country_prefix?;
};

public type NiResponseAsync record {
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id?;
    # The `number` in your request
    string number?;
    # Your account balance in EUR after this request.
    string remaining_balance?;
    # If there is an internal lookup error, the `refund_price` will reflect the lookup price. If `cnam` is requested for a non-US number the `refund_price` will reflect the `cnam` price. If both of these conditions occur, `refund_price` is the sum of the lookup price and `cnam` price.
    string request_price?;
    # Code | Text
    # #         -- | --
    # #          0 | Success - request accepted for delivery by .
    # #          1 | Busy - you have made more requests in the last second than are permitted by your account. Please retry.
    # #          3 | Invalid - your request is incomplete and missing some mandatory parameters.
    # #          4 | Invalid credentials - the _api_key_ or _api_secret_ you supplied is either not valid or has been disabled.
    # #          5 | Internal Error - the format of the recipient address is not valid.
    # #          9 | Partner quota exceeded - your account does not have sufficient credit to process this request.
    # #         19 | Facility Not Allowed - your request makes use of a facility that is not enabled on your account.
    # # 43, 44, 45 | Live mobile lookup not returned. Not all return parameters are available.
    # #        999 | Request unparseable.
    NiStandardAdvancedStatus status?;
    # The status description of your request. Note: This field is equivalent to `status_message` field in the other endpoints
    string error_text?;
};

# If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
public type NiresponsexmladvancedPorted record {
    # If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
    string ported_message?;
};

# Advanced
public type NiResponseXmlAdvanced record {
    # The unique identifier for your request. This is a alphanumeric string up to 40 characters.
    @constraint:String {maxLength: 40}
    string request_id?;
    # The `number` in your request in international format.
    string international_format_number?;
    # An object containing the `number` in your request in the format used by the country the number belongs to.
    NiresponsexmlbasicLocalNumber local_number?;
    # The error code and status of your request
    NiresponsexmlbasicError 'error?;
    # If there is an internal lookup error, the `refund_price` will reflect the lookup price. If `cnam` is requested for a non-US number the `refund_price` will reflect the `cnam` price. If both of these conditions occur, `refund_price` is the sum of the lookup price and `cnam` price.
    string request_price?;
    # Your account balance in EUR after this request.
    string remaining_balance?;
    # Information about the network `number` is currently connected to.
    NiCurrentCarrierProperties current_carrier?;
    # Information about the network `number` was initially connected to.
    NiInitialCarrierProperties original_carrier?;
    # If the user has changed carrier for `number`. The assumed status means that the information supplier has replied to the request but has not said explicitly that the number is ported.
    NiresponsexmladvancedPorted ported?;
    # Contains details of the number owner, if `cnam` was set to `true` in the request.
    NiresponsexmladvancedCallerIdentity caller_identity?;
    # Full name of the person or business who owns the phone number. `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_name?;
    # Last name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string last_name?;
    # First name of the person who owns the phone number if the owner is an individual. This parameter is only present if `cnam` had a value of `true` within the request.
    string firs_name?;
    # The value will be `business` if the owner of a phone number is a business. If the owner is an individual the value will be `consumer`. The value will be `unknown` if this information is not available. This parameter is only present if `cnam` had a value of `true` within the request.
    string caller_type?;
    # An object indicating whether all information about a phone number has been returned.
    NiresponsexmladvancedLookupOutcome lookup_outcome?;
    # Can you call `number` now. This is applicable to mobile numbers only.
    string reachable?;
    # Information about the roaming status for `number`. This is applicable to mobile numbers only.
    NiRoaming roaming?;
    # Does `number` exist. `unknown` means the number could not be validated. `valid` means the number is valid. `not_valid` means the number is not valid. `inferred_not_valid` means that the number could not be determined as valid or invalid via an external system and the best guess is that the number is invalid. This is applicable to mobile numbers only.
    string valid_number?;
    # This property is deprecated and can safely be ignored.
    string ip_warnings?;
};
