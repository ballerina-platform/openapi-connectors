// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [SAP S/4HANA Integration with External Tax Calculation Engine API- Tax Determination and Calculation via Integration Flow API v1.0.0](https://api.sap.com/api/taxquote/overview) OpenAPI specification. 
# Your external tax engine sends tax calculation results to the SAP S/4HANA Cloud system via communication scenario SAP_COM_0249.
# This API is consumed by the [SAP S/4HANA Integration with External Tax Calculation Engines Integration Package](https://api.sap.com/package/SAPS4HANAIntegrationwithExternalTaxCalculationEngines) endpoint.
@display {label: "SAPS4HANA Tax Determination and Calculation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Determines and calculates indirect taxes.
    #
    # + xCorrelationid - An ID that uniquely identifies an HTTP request. The SAP Cloud Integration generates a new correlation ID when you do not send the X-CorrelationID parameter on the HTTP request header. 
    # + xRoutingKey - The tax engine that you want to use to calculate taxes in a certain transaction (if you have configured multiple engines). 
    # + payload - The request payload as per the model schema provided. 
    # + return - OK 
    remote isolated function taxquote1(ApiV0SchemaTaxrequest payload, string? xCorrelationid = (), string? xRoutingKey = ()) returns ApiV0SchemaTaxresponse|error {
        string resourcePath = string `/quote`;
        map<any> headerValues = {"X-CorrelationID": xCorrelationid, "X-Routing-Key": xRoutingKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiV0SchemaTaxresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
