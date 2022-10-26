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
    # To use API you have to sign up and get your own API key. Unify API accounts have sandbox mode and live mode API keys. 
    # To change modes just use the appropriate key to get a live or test object. You can find your API keys on the unify settings of your Apideck app.
    # Your Apideck application_id can also be found on the same page.
    # 
    # Authenticate your API requests by including your test or live secret API key in the request header. 
    # 
    # - Bearer authorization header: `Authorization: Bearer <your-apideck-api-key>`
    # - Application id header: `x-apideck-app-id: <your-apideck-app-id>`
    # 
    # You should use the public keys on the SDKs and the secret keys to authenticate API requests.
    # 
    # **Do not share or include your secret API keys on client side code.** Your API keys carry significant privileges. Please ensure to keep them 100% secure and be sure to not share your secret API keys in areas that are publicly accessible like GitHub.
    # 
    # Learn how to set the Authorization header inside Postman https://learning.postman.com/docs/postman/sending-api-requests/authorization/#api-key
    # 
    # Go to Unify to grab your API KEY https://app.apideck.com/unify/api-keys
    @display {label: "", kind: "password"}
    string authorization;
|};

public type UnifiedId record {
    # Unified ID
    string id;
};

# Reponse metadata
public type Meta record {
    # Number of items returned in the data property of the response
    int items_on_page?;
    # Cursors to navigate to previous or next pages through the API
    MetaCursors cursors?;
};

public type Email record {
    # ID
    string id?;
    # Email address
    string email;
    # Email type
    string 'type?;
};

public type Address record {
    # ID
    string? id?;
    # Address type
    string 'type?;
    # The address string. Some APIs don't provide structured address data.
    string? 'string?;
    # Name
    string? name?;
    # Line 1 of the address e.g. number, street, suite, apt #, etc.
    string? line1?;
    # Line 2 of the address
    string? line2?;
    # Name of city.
    string? city?;
    # Name of state
    string? state?;
    # Zip code or equivalent.
    string? postal_code?;
    # country code according to ISO 3166-1 alpha-2.
    string? country?;
    # Latitude
    string? latitude?;
    # Longitude
    string? longitude?;
};

# Cursors to navigate to previous or next pages through the API
public type MetaCursors record {
    # Cursor to navigate to the previous page of results through the API
    string? previous?;
    # Cursor to navigate to the current page of results through the API
    string? current?;
    # Cursor to navigate to the next page of results through the API
    string? next?;
};

public type PaymentRequired record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Link to documentation of error type
    string ref?;
};

public type InlineResponse201 record {
    # HTTP Response Status Code
    int status_code;
    # HTTP Response Status
    string status;
    # Apideck ID of service provider
    string 'service;
    # Unified API resource name
    string 'resource;
    # Operation performed
    string operation;
    UnifiedId data;
};

public type Website record {
    # ID
    string? id?;
    # Website URL
    @constraint:String {minLength: 1}
    string url;
    # Type
    string 'type?;
};

public type NotImplemented record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Link to documentation of error type
    string ref?;
};

public type InlineResponse200 record {
    # HTTP Response Status Code
    int status_code;
    # HTTP Response Status
    string status;
    # Apideck ID of service provider
    string 'service;
    # Unified API resource name
    string 'resource;
    # Operation performed
    string operation;
    Lead[] data;
    # Reponse metadata
    Meta meta?;
    # Links to navigate to previous or next pages through the API
    Links links?;
};

public type BankAccount record {
    string? iban?;
    string? bic?;
    # A BSB is a 6 digit numeric code used for identifying the branch of an Australian or New Zealand bank or financial institution.
    string? bsb_number?;
    # A bank code is a code assigned by a central bank, a bank supervisory body or a Bankers Association in a country to all its licensed member banks or financial institutions.
    string? bank_code?;
    # A bank account number is a number that is tied to your bank account. If you have several bank accounts, such as personal, joint, business (and so on), each account will have a different account number.
    string? account_number?;
    # The name which you used in opening your bank account.
    string? account_name?;
};

public type BadRequest record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Link to documentation of error type
    string ref?;
};

public type UnexpectedError record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Link to documentation of error type
    string ref?;
};

public type Lead record {
    # Lead ID
    string id?;
    # Lead name
    @constraint:String {minLength: 1}
    string name;
    # Company name
    string? company_name;
    # Owner ID
    string owner_id?;
    # Company ID
    string? company_id?;
    # Contact ID
    string? contact_id?;
    # Lead source
    string? lead_source?;
    # First name
    string? first_name?;
    # Last name
    string? last_name?;
    # Lead description
    string? description?;
    # Salutation
    string? prefix?;
    # Title
    string? title?;
    # language code according to ISO 639-1. For the United States - EN
    string? language?;
    # Comapny status
    string? status?;
    # Monetory amount
    decimal? monetary_amount?;
    # Currency
    string? currency?;
    # Fax number
    string? fax?;
    # Company websites
    Website[] websites?;
    # Company addresses
    Address[] addresses?;
    # Social links
    SocialLink[] social_links?;
    # Phone numbers
    PhoneNumber[] phone_numbers?;
    # Emails
    Email[] emails?;
    # Custom fields
    CustomField[] custom_fields?;
    Tags tags?;
    # Updated date
    string updated_at?;
    # Created date
    string created_at?;
};

public type CustomField record {
    # ID
    string id;
    # Custom value
    string?|decimal?|boolean?|string[] value?;
};

public type InlineResponse2001 record {
    # HTTP Response Status Code
    int status_code;
    # HTTP Response Status
    string status;
    # Apideck ID of service provider
    string 'service;
    # Unified API resource name
    string 'resource;
    # Operation performed
    string operation;
    Lead data;
};

public type PhoneNumber record {
    # ID
    string? id?;
    # Phone number
    @constraint:String {minLength: 1}
    string number;
    # Type
    string 'type?;
};

# Links to navigate to previous or next pages through the API
public type Links record {
    # Link to navigate to the previous page through the API
    string? previous?;
    # Link to navigate to the current page through the API
    string current?;
    # Link to navigate to the previous page through the API
    string? next?;
};

public type Unauthorized record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Link to documentation of error type
    string ref?;
};

public type SocialLink record {
    # ID
    string? id?;
    # Social link
    @constraint:String {minLength: 1}
    string url;
    # Type
    string? 'type?;
};

public type Tags string[];

public type Unprocessable record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Link to documentation of error type
    string ref?;
};

public type NotFoundResponse record {
    # HTTP status code
    decimal status_code?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string 'error?;
    # The type of error returned
    string type_name?;
    # A human-readable message providing more details about the error.
    string message?;
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Link to documentation of error type
    string ref?;
};
