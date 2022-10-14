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
    string tokenUrl = "https://colgate-dev1.authentication.us30.hana.ondemand.com/oauth/token";
|};

# This is a generated connector for [SAP Intelligent Trade Claims Management API v1.0.0](https://help.sap.com/viewer/902b9d277dfe48fea582d28849d54935/CURRENT/en-US) OpenAPI specification. 
# In SAP Intelligent Trade Claims Management, users can group and organize their customers and nodes and assign them to a customer hierarchy.
@display {label: "SAPS4HANA ITCM Customer Hierarchy", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.dev1.e2e.eurekacloud.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create a new Customer Hierarchy
    #
    # + payload - Request payload to create customer hierarchy 
    # + return - Success Created. 
    remote isolated function createCustomerHierarchy(HierarchyHeaderEO payload) returns HierarchyCreationResponse|error {
        string resourcePath = string `/hierarchy/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HierarchyCreationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Customer Hierarchy Nodes with header externalId
    #
    # + externalId - External Id 
    # + return - OK. 
    remote isolated function getAllNodes(string externalId) returns HierarchyNodeHeaderResponse|error {
        string resourcePath = string `/hierarchy/customers/header/${getEncodedUri(externalId)}`;
        HierarchyNodeHeaderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Customer Hierarchy Nodes with externalId
    #
    # + externalId - External Id 
    # + return - OK. 
    remote isolated function getNode(string externalId) returns HierarchyNodeResponse|error {
        string resourcePath = string `/hierarchy/customers/${getEncodedUri(externalId)}`;
        HierarchyNodeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Customer Hierarchy Entity with externalId
    #
    # + headerExternalId - Header external Id 
    # + return - OK. 
    remote isolated function deleteCustomerHierarchy(string headerExternalId) returns ResponseDeleteMessage|error {
        string resourcePath = string `/hierarchy/customers/${getEncodedUri(headerExternalId)}`;
        ResponseDeleteMessage response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
