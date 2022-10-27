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
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://colgate-dev1.authentication.us30.hana.ondemand.com/oauth/token";
|};

public type ExternalCustomerHierarchyNodeKeyVDTO record {
    @constraint:String {maxLength: 18}
    string customerHierarchyNodeId;
    @constraint:String {maxLength: 2}
    string customerHierarchyTypeCode;
    @constraint:String {maxLength: 20}
    string hierarchyId;
};

public type ResponseNotFoundPromotionDeletionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalPromotionReferenceDTO record {
    @constraint:String {maxLength: 20}
    string documentId?;
    @constraint:String {maxLength: 2}
    string documentType?;
};

public type ResponsePromotionDeleteAllMessage record {
    int count?;
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string message?;
    string uri?;
    string timestamp?;
};

public type InlineResponse400 ResponseInvalidCustomer|ResponseInvalidDate|ResponseInvalidProduct;

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidCustomer record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalProductHierarchyNodeKeyVDTO record {
    @constraint:String {maxLength: 20}
    string hierarchyId;
    @constraint:String {maxLength: 18}
    string productHierarchyNodeId;
    @constraint:String {maxLength: 2}
    string productHierarchyTypeCode;
};

public type ResponsePromotionDeletionMessage record {
    string externalId?;
    string message?;
    string timestamp?;
};

public type ResponseExternalPromotionListMessage record {
    string message?;
    ExternalPromotionDTO[] promotions?;
    string timestamp?;
};

public type ResponseInvalidDate record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type ResponseExternalPromotionMessage record {
    string externalId?;
    string message?;
    int count?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type PromotionTypeCodeV record {
    string promotionTypeCode?;
};

public type ResponsePromotionCreationMessage record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ExternalPromotionCustomerVDTO record {
    @constraint:String {maxLength: 60}
    string customerExternalId?;
    ExternalCustomerHierarchyNodeKeyVDTO customerHierarchyNodeKey?;
};

public type ExternalPromotionDTO record {
    int businessSystem;
    @constraint:String {maxLength: 240}
    string description?;
    ExternalPromotionReferenceDTO[] documentReferences?;
    @constraint:String {maxLength: 36, minLength: 1}
    string externalId;
    ExternalSalesAreaVDTO externalSalesArea?;
    int id?;
    string internalId?;
    boolean isMarkedForDeletion?;
    ExternalPromotionCustomerVDTO promotionCustomer;
    PromotionDateDTO[] promotionDates;
    ExternalPromotionProductDTO[] promotionProducts;
    string status?;
    PromotionTypeCodeV[] types?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidProduct record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalPromotionProductDTO record {
    @constraint:String {maxLength: 40}
    string productExternalId;
    ExternalProductHierarchyNodeKeyVDTO productHierarchyNodeKey;
};

public type PromotionDateDTO record {
    string promotionDateTypeCode;
    string validFrom;
    string validTo;
};

public type ResponseNotFoundPromotionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalSalesAreaVDTO record {
    @constraint:String {maxLength: 2}
    string distributionChannel?;
    @constraint:String {maxLength: 2}
    string salesDivision?;
    @constraint:String {maxLength: 4}
    string salesOrganization?;
};
