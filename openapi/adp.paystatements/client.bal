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
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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
    string tokenUrl = "https://accounts.adp.com/auth/oauth/v2/token";
|};

# This is a generated connector for [ADP Pay Statements API v1](https://developers.adp.com/articles/api/pay-statements-v1-api) OpenAPI specification.
# The ADP Pay Statements API provides the capability to describe the details of a payment made to a payee. 
# These details include the net and gross payment amounts, deductions, earnings, and year-to-date payroll accruals. 
# The Pay Statements APIs can be used to retrieve the list of a specified number of pay statements for an associate or to get details for a specific statement.
@display {label: "ADP Pay Statements", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ADP account](https://www.adp.com/) and obtain tokens by following [this guide](https://developers.adp.com/articles/guide/auth-process-data-conn-request-access-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Request the list of the last n payStatements for an Associate. Default = payStatements from the last 5 pay dates.
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + aoid - Associate OID 
    # + ifNoneMatch - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + numberoflastpaydates - Maximum pay statements which should be returned based on a request. 
    # + return - Pay statements 
    remote isolated function listPayStatements(string roleCode, string aoid, string? ifNoneMatch = (), int? numberoflastpaydates = ()) returns PayStatements|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/pay-statements`;
        map<anydata> queryParam = {"numberoflastpaydates": numberoflastpaydates};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "If-None-Match": ifNoneMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PayStatements response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the details of a specific pay statement
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payStatementId - Pay statement ID 
    # + return - Pay statement 
    remote isolated function getPayStatement(string aoid, string roleCode, string payStatementId) returns PayStatement|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/pay-statements/${getEncodedUri(payStatementId)}`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PayStatement response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the list of the last n client-specific pay statements for an associate. Default = pay statements from the last 5 pay dates.
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + numberoflastpaydates - Maximum pay statements which should be returned based on a request. 
    # + ifNoneMatch - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + return - Pay statements 
    remote isolated function listClientPayStatement(string aoid, string roleCode, int? numberoflastpaydates = (), string? ifNoneMatch = ()) returns PayStatements|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/organizational-pay-statements`;
        map<anydata> queryParam = {"numberoflastpaydates": numberoflastpaydates};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "If-None-Match": ifNoneMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PayStatements response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the details of a single client-specific pay statement.
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payStatementId - Pay statement ID 
    # + return - Pay statement 
    remote isolated function getClientPayStatement(string aoid, string roleCode, string payStatementId) returns PayStatement|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/organizational-pay-statements/${getEncodedUri(payStatementId)}`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PayStatement response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the details of a specific paystatement as an image.
    #
    # + associateoid - Associate ID 
    # + payStatementId - Pay statement ID 
    # + imageId - Pay statement Image ID 
    # + imageExtension - Pay statement Image Extension 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + ifNoneMatch - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + return - Pay statement image 
    remote isolated function getClientPayStatementImage(string associateoid, string payStatementId, string imageId, string imageExtension, string roleCode, string? ifNoneMatch = ()) returns json|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(associateoid)}/organizational-pay-statements/${getEncodedUri(payStatementId)}/images/${getEncodedUri(imageId)}.${getEncodedUri(imageExtension)}`;
        map<any> headerValues = {"roleCode": roleCode, "If-None-Match": ifNoneMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the details of a specific paystatement as an image.
    #
    # + aoid - Associate OID 
    # + projectedPayStatementId - Projected Pay statement ID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Projected pay statement 
    remote isolated function getProjectedPayStatement(string aoid, string projectedPayStatementId, string roleCode) returns ProjectedPayStatement|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/projected-pay-statements/${getEncodedUri(projectedPayStatementId)}`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProjectedPayStatement response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
