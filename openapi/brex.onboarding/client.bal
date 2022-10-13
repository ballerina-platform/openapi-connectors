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
public type ClientConfig record {|
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://accounts.brex.com/oauth2/v1/token";
|};

# This is a generated connector for [Brex Onboarding API v0.1](https://developer.brex.com/openapi/onboarding_api/) OpenAPI specification. 
# Onboarding APIs allows partners to refer their customers to Brex to streamline the process of creating new accounts  for these customers. By submitting information for referrals, it removes the need for customers to enter in this information again.
@display {label: "brex.onboarding", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Brex account](https://www.brex.com/) and obtain tokens by following [this guide](https://developer.brex.com/docs/authentication/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://platform.staging.brexapps.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List referrals
    #
    # + cursor - The cursor 
    # + return - listReferralsGet 200 response 
    remote isolated function listReferralsGet(string? cursor = ()) returns ReferralPage|error {
        string resourcePath = string `/v1/referrals`;
        map<anydata> queryParam = {"cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReferralPage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a referral
    #
    # + payload - Create referral request. 
    # + return - createReferralRequestPost 200 response 
    remote isolated function createReferralRequestPost(CreateReferralRequest payload) returns Referral|error {
        string resourcePath = string `/v1/referrals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Referral response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a referral by ID
    #
    # + id - Referral ID. 
    # + return - getReferralGet 200 response 
    remote isolated function getReferralGet(string id) returns Referral|error {
        string resourcePath = string `/v1/referrals/${getEncodedUri(id)}`;
        Referral response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new document upload
    #
    # + id - Referral ID 
    # + payload - Create Document request 
    # + return - createDocumentPost 200 response 
    remote isolated function createDocumentPost(string id, CreateDocumentRequest payload) returns Document|error {
        string resourcePath = string `/v1/referrals/${getEncodedUri(id)}/document_upload`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Document response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
