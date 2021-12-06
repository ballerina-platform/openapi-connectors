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
import ballerina/url;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2ClientCredentialsGrantConfig auth;
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
    }
    # List referrals
    #
    # + cursor - The cursor 
    # + return - listReferralsGet 200 response 
    remote isolated function listReferralsGet(string? cursor = ()) returns ReferralPage|error {
        string  path = string `/v1/referrals`;
        map<anydata> queryParam = {"cursor": cursor};
        path = path + check getPathForQueryParam(queryParam);
        ReferralPage response = check self.clientEp-> get(path, targetType = ReferralPage);
        return response;
    }
    # Creates a referral
    #
    # + payload - Create referral request. 
    # + return - createReferralRequestPost 200 response 
    remote isolated function createReferralRequestPost(CreateReferralRequest payload) returns Referral|error {
        string  path = string `/v1/referrals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Referral response = check self.clientEp->post(path, request, targetType=Referral);
        return response;
    }
    # Gets a referral by ID
    #
    # + id - Referral ID. 
    # + return - getReferralGet 200 response 
    remote isolated function getReferralGet(string id) returns Referral|error {
        string  path = string `/v1/referrals/${id}`;
        Referral response = check self.clientEp-> get(path, targetType = Referral);
        return response;
    }
    # Create a new document upload
    #
    # + id - Referral ID 
    # + payload - Create Document request 
    # + return - createDocumentPost 200 response 
    remote isolated function createDocumentPost(string id, CreateDocumentRequest payload) returns Document|error {
        string  path = string `/v1/referrals/${id}/document_upload`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Document response = check self.clientEp->post(path, request, targetType=Document);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
