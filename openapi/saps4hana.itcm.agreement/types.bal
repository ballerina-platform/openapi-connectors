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

public type AgreementType record {
    boolean canConditionRecordValidityDiffer?;
    @constraint:String {maxLength: 4}
    string externalConditionTypeTableGroup?;
    boolean isEnhancedProcessingVakeyActive?;
    @constraint:String {maxLength: 4}
    string externalFinalSettlementOrderType?;
    @constraint:String {maxLength: 35}
    string language?;
    @constraint:String {maxLength: 4}
    string externalManualAccrualOrderType?;
    @constraint:String {maxLength: 1}
    string externalManualPaymentProcedure?;
    @constraint:String {maxLength: 1}
    string externalMinValueForFinalSettlement?;
    @constraint:String {maxLength: 4}
    string externalPartialSettlementOrderType?;
    @constraint:String {maxLength: 1}
    string externalPaymentMethod?;
    boolean canManualAccrualsBePosted?;
    @constraint:String {maxLength: 4}
    string rebateAgreementType;
    boolean shallManualAccrualsBeReversed?;
    string text?;
};

public type AgreementTextType record {
    @constraint:String {maxLength: 4}
    string externalId?;
    AgreementTextTypeName[] names?;
};

public type AgreementHeaderDTOIncoming record {
    int additionalValueDays?;
    AgreementAccrualDTOIncoming[] accruals?;
    @constraint:String {maxLength: 240}
    string description?;
    @constraint:String {maxLength: 1}
    string externalStatus?;
    AgreementTextDTOOutgoing[] texts?;
    @constraint:String {maxLength: 4}
    string externalType?;
    string validFrom?;
    string validTo?;
    int businessSystem;
    string externalCustomerId?;
    boolean isMarkedForDeletion = false;
    string fixedValueDate?;
    @constraint:String {maxLength: 1}
    string externalPaymentMethod?;
    @constraint:String {maxLength: 4}
    string externalPaymentTerms?;
    string promotionExternalID?;
    @constraint:String {maxLength: 40}
    string reference?;
    SalesArea externalSalesArea?;
    SalesDocument salesHeader;
    boolean isInPrecisionMode?;
};

public type AgreementTextDTOOutgoing record {
    AgreementTextType 'type?;
    @constraint:String {maxLength: 35}
    string language?;
    string text?;
};

public type AgreementTextTypeName record {
    string text?;
    @constraint:String {maxLength: 35}
    string language?;
};

public type AgreementAccrualDTOIncoming record {
    string accrualAttributes?;
    @constraint:String {maxLength: 3}
    string conditionCurrency?;
    string conditionRecordAttributes?;
    @constraint:String {maxLength: 10}
    string conditionRecordNumber?;
    string conditionTypeExternalId?;
    HierarchyNodeKey customerHierarchyNode?;
    @constraint:String {maxLength: 10}
    string customerExternalId?;
    string externalKey;
    Amount maxPayOutAmount?;
    Amount openAccrualAmount?;
    Amount paidOutAmount?;
    HierarchyNodeKey productHierarchyNodeLevel1?;
    HierarchyNodeKey productHierarchyNodeLevel2?;
    HierarchyNodeKey productHierarchyNodeLevel3?;
    @constraint:String {maxLength: 40}
    string externalProductId?;
    Amount rebateAmount?;
    int rebateBaseAmount?;
    @constraint:String {maxLength: 3}
    string rebateBaseUnit?;
    @constraint:Number {maxValue: 100}
    decimal rebatePercentage?;
    SalesArea externalSalesArea?;
};

public type Amount record {
    decimal amount?;
    @constraint:String {maxLength: 3}
    string currencyCode?;
};

public type ResponseAgreementDeletionMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type SalesArea record {
    @constraint:String {maxLength: 2}
    string distributionChannel?;
    @constraint:String {maxLength: 2}
    string salesDivision?;
    @constraint:String {maxLength: 4}
    string salesOrganization?;
};

public type ResponseDeleteMessage record {
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string 'error?;
    string message?;
    string timestamp?;
};

public type HierarchyNodeKey record {
    @constraint:String {maxLength: 20}
    string hierarchyID?;
    @constraint:String {maxLength: 18}
    string hierarchyNodeID?;
    @constraint:String {maxLength: 2}
    string hierarchyTypeCode?;
};

public type ConditionTypeText record {
    @constraint:String {maxLength: 4}
    string externalConditonTypeId?;
    string text?;
    @constraint:String {maxLength: 35}
    string language?;
};

public type SalesDocument record {
    @constraint:String {maxLength: 3}
    string currencyCode?;
    @constraint:String {maxLength: 40}
    string displayID;
};

public type ResponseAgreementMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};
