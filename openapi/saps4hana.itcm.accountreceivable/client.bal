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

# This is a generated connector for [SAP Intelligent Trade Claims Management API v1.0.0](https://help.sap.com/viewer/902b9d277dfe48fea582d28849d54935/CURRENT/en-US) OpenAPI specification. 
# A user in SAP Intelligent Trade Claims Management can create and update existing accounts receivable open items within SAP Intelligent Trade Claims Management. Accounts receivable open items contribute to baseline information for claims to be built.
@display {label: "SAPS4HANA ITCM Account Receivable Open Item", iconPath: "resources/saps4hana.itcm.accountreceivable.svg"}
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
    }
    # Create a new AR Open Item
    #
    # + payload - Request payload to create AR Open Item 
    # + return - Success Created. 
    remote isolated function createAROpenItem(ReceivedParamDTO payload) returns ResponseAROpenItemsMessage|error {
        string  path = string `/arOpenItems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResponseAROpenItemsMessage response = check self.clientEp->post(path, request, targetType=ResponseAROpenItemsMessage);
        return response;
    }
    # Get the detail of an AR Open Item by id
    #
    # + id - id 
    # + return - OK. 
    remote isolated function getAROpenItemById(int id) returns ResidualAccountingDocumentItem4ApiDTO|error {
        string  path = string `/arOpenItems/${id}`;
        ResidualAccountingDocumentItem4ApiDTO response = check self.clientEp-> get(path, targetType = ResidualAccountingDocumentItem4ApiDTO);
        return response;
    }
    # Create a Reason Code
    #
    # + payload - Request payload to create reason code 
    # + return - Success Created. 
    remote isolated function batchCreateReasonCode(ReasonCodeMockDTO payload) returns ResponseReasonCodesMessage|error {
        string  path = string `/reasonCodes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResponseReasonCodesMessage response = check self.clientEp->post(path, request, targetType=ResponseReasonCodesMessage);
        return response;
    }
    # Get the detail of a Reason Code by code
    #
    # + code - code 
    # + return - OK. 
    remote isolated function getReasonCodeList(string code) returns ReasonCodeDTO|error {
        string  path = string `/reasonCodes/${code}`;
        ReasonCodeDTO response = check self.clientEp-> get(path, targetType = ReasonCodeDTO);
        return response;
    }
}
