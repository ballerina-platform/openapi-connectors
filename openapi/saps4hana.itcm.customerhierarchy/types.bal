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

public type HierarchyCreationResponse record {
    HierarchyHeader hierarchyHeader?;
    string message?;
    string timestamp?;
};

public type HierarchyNodeAssignment record {
    int CreatorCode?;
    int Instance?;
    string InternalCreationTime?;
    string InternalUpdateTime?;
    int UpdatorCode?;
    int Version?;
    string assignmentType?;
    BusinessObject bo?;
    string businessCodeForMsgReport?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    HierarchyNode hierarchyNode?;
    BusinessObjectIdentifier identifier?;
    string internalId?;
    string objectId?;
    BusinessObjectNode parent?;
    string typeCode?;
};

public type Action record {
    ActionPermissionItem[] actionPermissionItems?;
    boolean enabled?;
    boolean exposed?;
    int implCommandCode?;
    InputParameter[] inputParameters?;
    string name?;
    OutputParameter outputParameter?;
    string permission?;
    string[] requireFullOn?;
    string[] requireReadOn?;
    string requiredPermission?;
    boolean sideEffecting?;
    boolean statical?;
};

public type Element record {
    string name?;
    string 'type?;
};

public type Node record {
    string name?;
    NodeType nodeType?;
    string 'type?;
};

public type HierarchyNodeDescriptionEO record {
    string description?;
    string languageKey?;
};

public type ResponseDeleteMessage record {
    string message?;
    string timestamp?;
};

public type HierarchyNodeResponse record {
    HierarchyNodeDTO[] hierarchyNodeData?;
    string message?;
    string timestamp?;
};

public type BusinessObject record {
    BusinessObject bo?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    Association[] changedAssociations?;
    Property[] changedProperties?;
    int id?;
    BusinessObjectIdentifier identifier?;
    NodeType nodeType?;
    BusinessObjectNode parent?;
    string typeCode?;
};

public type HierarchyNodeDTO record {
    @constraint:String {maxLength: 40}
    string externalId?;
    @constraint:String {maxLength: 40}
    string externalParentId?;
    HierarchyNodeAssignmentDTO[] hierarchyNodeAssignments?;
    HierarchyNodeDescriptionDTO[] hierarchyNodeDescriptions?;
    int nodeLevel?;
};

public type BusinessObjectNode record {
    BusinessObject bo?;
    BusinessObjectIdentifier businessKey?;
    Association[] changedAssociations?;
    Property[] changedProperties?;
    int id?;
    BusinessObjectIdentifier identifier?;
    NodeType nodeType?;
    BusinessObjectNode parent?;
};

public type MetadataRepository record {
    BusinessObjectType[] businessObjectTypes?;
    BusinessServiceType[] businessServices?;
    int 'version?;
};

public type Association record {
    boolean allowCustomizeDefaultValue?;
    boolean allowCustomizeLabel?;
    boolean allowCustomizeValidValues?;
    string column?;
    string defaultValue?;
    string description?;
    boolean descriptionChanged?;
    boolean exposed?;
    string fullName?;
    boolean hasCustomerPersonalData?;
    string implTargetTable?;
    string label?;
    boolean labelChanged?;
    boolean mandatory?;
    string multiplicity?;
    string name?;
    string namespace?;
    string rawLabel?;
    boolean 'readonly?;
    string targetBOName?;
    string targetBONamespace?;
    string targetPropertyName?;
    boolean updatable?;
    boolean userDefined?;
};

public type EnumType record {
    boolean exposed?;
    Member[] members?;
    string name?;
};

public type HierarchyNodeDescriptionDTO record {
    @constraint:String {maxLength: 40}
    string description?;
    @constraint:String {maxLength: 2, minLength: 2}
    string languageKey?;
};

public type HierarchyNodeAssignmentDTO record {
    @constraint:String {maxLength: 4}
    string assignmentType?;
    @constraint:String {maxLength: 40}
    string objectId?;
};

public type HierarchyHeaderEO record {
    int businessSystem?;
    string externalId?;
    HierarchyHeaderDescriptionEO[] hierarchyHeaderDescriptions?;
    HierarchyNodeEO[] hierarchyNodes?;
    string hierarchyType?;
    boolean isDeleted?;
};

public type HierarchyNodeHeaderResponse record {
    HierarchyNodeDTO[] hierarchyNodeData?;
    string message?;
    string timestamp?;
};

public type Member record {
    boolean exposed?;
    string label?;
    string name?;
    string rawLabel?;
    string validValue?;
    int value?;
};

public type Property record {
    boolean allowCustomizeDefaultValue?;
    boolean allowCustomizeDescription?;
    boolean allowCustomizeLabel?;
    boolean allowCustomizeValidValues?;
    boolean allowCustomizeValidationRule?;
    string baseType?;
    string customErrorMessage?;
    boolean customizable?;
    string defaultValue?;
    string description?;
    boolean descriptionChanged?;
    boolean embedded?;
    string embeddedColumnBaseType?;
    boolean exposed?;
    string fullName?;
    boolean globalSearchResult?;
    boolean globalSearchable?;
    string implColumn?;
    string label?;
    boolean labelChanged?;
    boolean mandatory?;
    string name?;
    string namespace?;
    string rawLabel?;
    boolean readOnly?;
    string searchPath?;
    boolean searchable?;
    boolean sensitive?;
    int size?;
    boolean skipValidation?;
    string 'type?;
    boolean unique?;
    boolean updatable?;
    boolean userDefined?;
    ValidValue[] validValues?;
    string validationRule?;
    string valueConverter?;
};

public type HierarchyNodeEO record {
    string externalId?;
    string externalNodeIdPath?;
    string externalParentId?;
    HierarchyNodeAssignmentEO[] hierarchyNodeAssignments?;
    HierarchyNodeDescriptionEO[] hierarchyNodeDescriptions?;
    string internalNodeIdPath?;
    boolean leafNode?;
    int nodeLevel?;
};

public type InputParameter record {
    string name?;
    string 'type?;
};

public type HierarchyNode record {
    int CreatorCode?;
    int Instance?;
    string InternalCreationTime?;
    string InternalUpdateTime?;
    int UpdatorCode?;
    int Version?;
    BusinessObject bo?;
    string businessCodeForMsgReport?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    string externalId?;
    string externalIdNodePath?;
    string externalParentId?;
    HierarchyHeader hierarchyHeader?;
    string hierarchyId?;
    HierarchyNodeAssignment[] hierarchyNodeAssignments?;
    HierarchyNodeDescription[] hierarchyNodeDescriptions?;
    int id?;
    BusinessObjectIdentifier identifier?;
    string internalNodeId?;
    boolean leafNode?;
    int nodeLevel?;
    string nodePath?;
    BusinessObjectNode parent?;
    string parentId?;
    string typeCode?;
};

public type OutputParameter record {
    string 'type?;
};

public type ValidValue record {
    boolean deletable?;
    string description?;
    string rawDescription?;
    boolean systemPredefined?;
    string value?;
};

public type IterableNodetype record {
};

public type HierarchyNodeDescription record {
    int CreatorCode?;
    int Instance?;
    string InternalCreationTime?;
    string InternalUpdateTime?;
    int UpdatorCode?;
    int Version?;
    BusinessObject bo?;
    string businessCodeForMsgReport?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    string description?;
    HierarchyNode hierarchyNode?;
    BusinessObjectIdentifier identifier?;
    string internalId?;
    string languageKey?;
    BusinessObjectNode parent?;
    string typeCode?;
};

public type HierarchyNodeAssignmentEO record {
    string assignmentType?;
    string objectId?;
};

public type HierarchyHeaderDescription record {
    int CreatorCode?;
    int Instance?;
    string InternalCreationTime?;
    string InternalUpdateTime?;
    int UpdatorCode?;
    int Version?;
    BusinessObject bo?;
    string businessCodeForMsgReport?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    string description?;
    HierarchyHeader hierarchyHeader?;
    int id?;
    BusinessObjectIdentifier identifier?;
    string internalId?;
    string languageKey?;
    BusinessObjectNode parent?;
    string typeCode?;
};

public type BusinessServiceType record {
    Action[] actions?;
    string fullyQualifiedName?;
    string namespace?;
    string serviceName?;
    boolean userDefined?;
};

public type ActionPermissionItem record {
    string id?;
    string permissionId?;
    string value?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type BusinessObjectType record {
    Action[] actions?;
    boolean analysable?;
    string boSetName?;
    ComplexType[] complexTypes?;
    boolean creatable?;
    boolean customizable?;
    boolean deletable?;
    EnumType[] enumerations?;
    boolean exposed?;
    string fullName?;
    string label?;
    string lastModified?;
    MetadataRepository metadataRepository?;
    string name?;
    string namespace?;
    IterableNodetype nodeTypes?;
    OnBOChange[] onBOChanges?;
    string pluralLabel?;
    string rawLabel?;
    string rawPluralLabel?;
    boolean readable?;
    NodeType rootNode?;
    boolean updatable?;
    boolean userDefined?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type HierarchyHeader record {
    int CreatorCode?;
    int Instance?;
    string InternalCreationTime?;
    string InternalUpdateTime?;
    int UpdatorCode?;
    int Version?;
    BusinessObject bo?;
    string businessCodeForMsgReport?;
    BusinessObjectIdentifier businessKey?;
    record {} businessKeyValue?;
    BusinessObjectType businessObjectType?;
    int businessSystem?;
    string externalId?;
    HierarchyHeaderDescription[] hierarchyHeaderDescriptions?;
    HierarchyNode[] hierarchyNodes?;
    string hierarchyType?;
    BusinessObjectIdentifier identifier?;
    string internalId?;
    boolean isDeleted?;
    BusinessObjectNode parent?;
    string typeCode?;
};

public type ParentRef record {
    string column?;
    string name?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type NodeType record {
    Association[] associations?;
    string[] businessKey?;
    BusinessObjectType businessObjectType?;
    string[] displayName?;
    boolean exposed?;
    Property[] exposedProperties?;
    string extTable?;
    string fullName?;
    string implTable?;
    string label?;
    string name?;
    string nodeSetName?;
    Node[] nodes?;
    ParentRef parentKey?;
    string pluralLabel?;
    string[] primaryKey?;
    Property[] properties?;
    string rawLabel?;
    string rawPluralLabel?;
    boolean rootNodeType?;
    string[][] uniqueConstraints?;
    boolean userDefined?;
    Property[] userFieldsMeta?;
};

public type BusinessObjectIdentifier record {
    string boName?;
    string boNamespace?;
    string boNodeTypeName?;
    record {} keyValues?;
    boolean valid?;
};

public type OnBOChange record {
    string bindingPath?;
    string name?;
};

public type ComplexType record {
    Element[] elements?;
    string name?;
};

public type HierarchyHeaderDescriptionEO record {
    string description?;
    string languageKey?;
};
