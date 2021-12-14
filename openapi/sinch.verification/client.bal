// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Sinch Verification API v2.0](https://www.sinch.com/) OpenAPI specification.
# Verify users with SMS, flash calls (missed calls), a regular call, or data verification.
@display {label: "sinch.verification", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/verification/api-reference/authentication/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://verificationapi-v1.sinch.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Start verification
    #
    # + payload - Start verification request payload. 
    # + return - A successful response. 
    remote isolated function startVerification(InitiateVerificationResource payload) returns InitiateVerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InitiateVerificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Report back on a started verification
    #
    # + 'type - Currently only `number` type is supported. 
    # + endpoint - For `number` use a [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537)-compatible phone number. 
    # + payload - Verification report request payload. 
    # + return - A successful response. 
    remote isolated function reportVerificationByIdentity(string 'type, string endpoint, VerificationReportRequestResource payload) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/${'type}/${endpoint}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get verification by ID
    #
    # + id - The ID of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusById(string id) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/id/${id}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Report back on a started verification
    #
    # + id - The ID of the verification. 
    # + payload - Verification report request resource payload. 
    # + return - A sucessful response. 
    remote isolated function reportVerificationById(string id, VerificationReportRequestResource payload) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/id/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get verification by Identity
    #
    # + 'type - Currently only `number` type is supported. 
    # + endpoint - For `number` use a [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537)-compatible phone number. 
    # + method - The method of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusByIdentity(string 'type, string endpoint, string method) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/${method}/${'type}/${endpoint}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get verification by Reference
    #
    # + reference - The custom reference of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusByReference(string reference) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/reference/${reference}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
