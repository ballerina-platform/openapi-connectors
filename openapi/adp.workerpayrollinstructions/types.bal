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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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
    string tokenUrl = "https://accounts.adp.com/auth/oauth/v2/token";
|};

# Bank account info
public type DepositaccounttypeV02 record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 BBAN?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 IBAN?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 UPIC?;
    # An institution, such as a bank, building society, credit union, stock brokerage, or similar business; established primarily to provide financial services and financial transactions
    FinancialpartytypeV02 financialParty?;
    # Bank account info
    FinancialaccounttypeV02 financialAccount?;
};

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
public type WorkergeneraldeductioninstructionstarteventMeta record {
    # The instance resource sequence (number) identifying the first resource returned in the response. The server generates this sequence.  It is used by the client to determine the start sequence of the subsequent Get request
    int startSequence?;
    # Indicates whether the response completes the return of all of the resources of the instance resource set to the requesting system
    boolean completeIndicator?;
    # Number of total instance resources in an instance resource set. Note: An instance resource set is a set of instance resources that is determined by a server to satisfy the sets membership criteria (i.e., selection, filter, expansion and search criteria) of a resource management operation (e.g. GET request) upon a collection resource
    int totalNumber?;
    # Unique identifier of the instance resource set.  It is generated by the server as a result of the original Get request
    string resourceSetID?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    WorkergeneraldeductioninstructionstarteventMetaLinks[] links?;
};

# Actions which the user is allowed to initiate against the related entity
public type ActiontypeV02 record {
    # Identifies the operation of an action
    string operationID?;
    # The URI of the related entity
    UritypeV01 canonicalUri?;
    # Identifies the type of action to be taken to fulfill the request. Action can be a callback to a service to complete the action.  A callback requires the methodCode and uris to be returned.  An external link i.e. open a web page - requires the uris of the external link; An object reference is a reference to a related object within the application. This is a canonical name which represents the object.  Based on this identifier, the application knows what view it needs to open.  The uris returns the data for the view.  For an object reference, the objectRefID, methodCode, and uris are required . modify indicates that a property is being modified
    string actionTypeCode?;
    # Boolean expression
    IndicatordefaulttypeV01 confirmationRequiredIndicator?;
    # Boolean expression
    IndicatordefaulttypeV01 commentAllowedIndicator?;
    # Boolean expression
    IndicatordefaulttypeV01 defaultIndicator?;
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 sequence?;
    # Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true
    AttestationtypeV02 attestation?;
    # Links
    LinktypeV02[] links?;
};

# A simple (string) code.  Can have a code list reference
public type SimplecodetypeV02 string;

public type StringType record {
    IndicatorType readOnly?;
    IndicatorType optional?;
    IndicatorType hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the default value which should be populated by default
    string default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    ValueSetType valueSet?;
    LinktypeV02[] dependencyLinks?;
};

# Communication objects to include various communication mechanisms, e,g, phone, email, etc.
public type CommunicationtypeV02 record {
    # A list of land-line telephone numbers
    CommunicationtypeV02Landlines[] landlines?;
    # A list of mobile telephone numbers
    CommunicationtypeV02Landlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    CommunicationtypeV02Landlines[] faxes?;
    # A list of pager telephone numbers
    CommunicationtypeV02Landlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    CommunicationtypeV02Instantmessages[] instantMessages?;
};

# The simple (string) identifier of an object
public type SimpleidtypeV02 string;

# For any given rate, either the currencyCode or the unitCode is present. In the example 3 bags of rice per month, currencyCode would not be present, and the unitCode would be bags of rice. In the example, 20 percent of annual sales, the unitCode would be percent
public type PayrollinstructiontransformGeneraldeductioninstructionDeductionrateUnitcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The link of the request that generated this response.
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageRequestlink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

# The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
public type WorkergeneraldeductioninstructionchangeeventConfirmmessage record {
    # An identifier for the instance of the confirm message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageConfirmmessageid confirmMessageID?;
    # The date & time that the message instance was generated.; follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string createDateTime?;
    # The date & time that the request submitted by the client was received. Note, this timestamp may not be the same as the time the client actually submitted the request if there is a queuing mechanism between the client and server processing the request; it follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string requestReceiptDateTime?;
    # Protocol-specific response status code.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolstatuscode protocolStatusCode?;
    # Code that identifies the protocol used for the request.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolcode protocolCode?;
    # The identifier of the request that generated this response.
    WorkergeneraldeductioninstructionstarteventConfirmmessageRequestid requestID?;
    # The process results status code for the request.
    ConfirmmessagetypeV01Requeststatuscode requestStatusCode?;
    # The method that was used on the request corresponding to this message instance.
    ConfirmmessagetypeV01Requestmethodcode requestMethodCode?;
    # A session identifier if one is available.
    WorkergeneraldeductioninstructionstarteventConfirmmessageSessionid sessionID?;
    # The entity tag of the entity in the request.
    string requestETag?;
    # The link of the request that generated this response.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageRequestlink requestLink?;
    # Processing status of the related request message.
    ConfirmmessagetypeV01Processingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    WorkergeneraldeductioninstructionchangeeventConfirmmessageProcessmessages[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageResourcemessages[] resourceMessages?;
};

# The process results status code for the request.
public type ConfirmmessagetypeV01Requeststatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

public type LinktypeV02Payloadarguments record {
    # Code value (typically a key field) of the code list item
    string argumentPath?;
    # Code value (typically a key field) of the code list item
    string argumentValue?;
};

# A session identifier if one is available.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageSessionid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# Data which is transformed as a result of the event
public type PayrollinstructiontransformGeneraldeductioninstruction record {
    # The code of the deduction. The code can be user defined or a statutory deduction
    PayrollinstructiontransformGeneraldeductioninstructionDeductioncode deductionCode?;
    # The value of the associated deduction, e.g. the deduction amount
    PayrollinstructiontransformGeneraldeductioninstructionDeductionrate deductionRate?;
    # A deduction goal
    PayrollinstructiontransformGeneraldeductioninstructionDeductiongoal deductionGoal?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessageLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

# The deduction goal
public type DeductiongoaltypeV02 record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 goalStartDate?;
    # A representation of a monetary value
    AmounttypeV02 goalLimitAmount?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 goalID?;
    # A representation of a monetary value
    AmounttypeV02 goalBalanceAmount?;
};

# The coordinates of the location of the actor
public type WorkergeneraldeductioninstructionstarteventActorGeocoordinate record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

# A single query parameter
public type WorkergeneralDeductionInstructionchangeQueryCriterion record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 obligationCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionTypeCode?;
    # The default number value
    decimal defaultNumberValue?;
    # The default string value
    string defaultStringValue?;
    # Maximum number of resource paths supported
    int resourcePathMax?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    # A collection of acceptable resource paths to pass to the query option
    string[] resourcePaths?;
    # A collection of resource paths which may not be passed to the query option.  An example use of this is where you allow all paths except 1 or 2.  You would want to only specify those which are excluded
    string[] excludedResourcePaths?;
    # A reference to the codeList which returns the possible values for the query option
    CodelisttypeV03 queryValueCodeList?;
    # A collection of logical operators
    WorkergeneraldeductioninstructionstarteventmetaMetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record
public type WorkergeneraldeductioninstructionstarteventDataTransformEventstatuscode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Data which is transformed as a result of the event
public type WorkergeneraldeductioninstructionchangeeventDataTransform record {
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation
    WorkergeneraldeductioninstructionstarteventDataTransformEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record
    WorkergeneraldeductioninstructionstarteventDataTransformEventstatuscode eventStatusCode?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
    # True indicates that the requestor wants notifications on the status of the request
    boolean notificationIndicator?;
    # Payroll instruction
    Payrollinstructiontransform1 payrollInstruction?;
};

# Payroll instruction
public type Payrollinstructionoutput1 record {
    # The payroll profile ID
    string payrollProfileID?;
    # The region in which the payroll is processed
    PayrollinstructioneventcontextPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrollinstructioneventcontextPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The unique identifier of the related worker lien within a collection
    string itemID?;
    # Data which is transformed as a result of the event
    GeneralDeductionInstructionOutput generalDeductionInstruction?;
};

public type CodeListType record {
    # Code list title
    string codeListTitle?;
    IndicatorType exclusiveIndicator?;
    CodeListItemType[] listItems?;
    LinktypeV02[] links?;
};

public type PayrollGeneralDeductionInstruction record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 deductionCode?;
    # A representation of a pay rate
    RatetypeV03 deductionRate?;
    # The deduction goal
    DeductiongoaltypeV02 deductionGoal?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 deductionStartDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Actions which the user is allowed to initiate against the related instance.
    ActiontypeV02[] actions?;
};

# The payroll group relevant to payroll processing
public type PayrollinstructioneventcontextPayrollgroupcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
public type WorkergeneraldeductioninstructionstarteventOnbehalfofparty record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
    # A unique identifier of a client employee's organization id
    string organizationOID?;
};

# An instance to capture the initiation of a general deduction.
public type WorkergeneraldeductioninstructionstarteventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventServicecategorycode serviceCategoryCode?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventEventnamecode eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage or Divorce. This is optional and valued as defined by the system of record
    WorkergeneraldeductioninstructionstarteventEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been initiated by the system of record will have an event status code of created. An event that is saved in a work in progress state will have an event status code of inProgress. An event that has been recorded will have an event status code of complete. These values are set by the system of record and valued based on a standard codeslist
    WorkergeneraldeductioninstructionstarteventEventstatuscode eventStatusCode?;
    # This allows the system of record to prioritize events and is valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventPrioritycode priorityCode?;
    # This is the date time the event is recorded in the system of record with an event status code equal to complete. This value is set by the system of record
    string recordDateTime?;
    # This is the date time the event is created. If a system of record creates the event instance, as in the case of an annual enrollment for example, then is sets the creation date time. If a user declares an event, then this is set to the date time when the first call is made to the system of record
    string creationDateTime?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
    # This value is set by the system of record and used to term the life cycle of an event instance. 
    string expirationDateTime?;
    # This value is set by the system of record and allows for the presentation of a date by which the system of record would like the user to complete the event
    string dueDateTime?;
    # An originator is a user, machine or event that triggered the event
    WorkergeneraldeductioninstructionstarteventOriginator originator?;
    # The actor is the party that completed the recording of the event
    WorkergeneraldeductioninstructionstarteventActor actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkergeneraldeductioninstructionstarteventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkergeneraldeductioninstructionstarteventOnbehalfofparty onBehalfOfParty?;
    # Links
    WorkergeneraldeductioninstructionstarteventLinks[] links?;
    # Event Data
    WorkergeneraldeductioninstructionstarteventData data?;
};

# List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
public type DependencyListType record {
};

# Lien funds disbursement information necessary for garnishment processing for payroll
public type WorkerlienoutputFundsdisbursement record {
    # Object describing the details of a party, either person or organization
    PartytypeV02 payee?;
    # Object describing the details of a party, either person or organization
    PartytypeV02 obligee?;
    # Boolean expression
    IndicatortypeV01 paymentToPayeeIndicator?;
    # Denotes when payment should be remitted
    PaymentScheduleLienFundsDisbursement paymentSchedule?;
    # A list of any disbursement fees
    FeetypeV02[] disbursementFees?;
    # A message related to the disbursement, e.g. a message on the check
    WorkerlienoutputFundsdisbursementDisbursementmessages[] disbursementMessages?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 paymentMethodCode?;
    # Bank account info
    DepositaccounttypeV02 depositAccount?;
    # Boolean expression
    IndicatortypeV01 lumpSumWithholdingIndicator?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionstarteventConfirmmessageLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request. For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

# URI type
public type UriType string;

# Process Message instances may be of type: success, warning, error, or info.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageMessagetypecode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# organization address objects / components
public type OrganizationaddresstypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # Attention of Name
    string attentionOfName?;
    # Care Of Name
    string careOfName?;
    # Line One of Street Address Information
    string lineOne?;
    # Line Two of Street Address Information
    string lineTwo?;
    # Line Three of Street Address Information
    string lineThree?;
    # A city in the context of an address
    string cityName?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
    # Line Four of Street Address Information
    string lineFour?;
    # Line Five of Street Address Information
    string lineFive?;
    # The number of a building in the context of a physical address, e.g. House Number
    string buildingNumber?;
    # The name of a building in the context of a physical address, e.g. Rockefeller Center
    string buildingName?;
    # The name the block
    string blockName?;
    # The name of the street
    string streetName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 streetTypeCode?;
    # A unit in the context of an address, e.g. an Apartment Number or an Office
    string unit?;
    # A floor in the context of an address
    string floor?;
    # A reference to a particular staircase in the context of an address
    string stairCase?;
    # A reference to a particular door in the context of an address. e.g. Apartment Number
    string door?;
    # A post office box
    string postOfficeBox?;
    # A way to identify a specific delivery location, e.g. a mail-stop
    string deliveryPoint?;
    # A way to identify a building plot, e.g. a specific building construction site
    string plotID?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
};

public type CodelistitemtypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Additional list item description
    string valueDescription?;
    # Allows for filtering the code list
    string foreignKey?;
    # Boolean expression
    IndicatortypeV01 inactiveIndicator?;
    # Boolean expression
    IndicatortypeV01 defaultIndicator?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionchangeeventMetaLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

public type CodeListItemType record {
    # The code value for the related entity
    string code?;
    # The code name for description of the related code
    string name?;
    # Additional list item description
    string valueDescription?;
    # Allows for specifying the pattern (regex) for validating the list values
    string valuePattern?;
    # Allows for filtering the code list
    string filter?;
    IndicatorType inactiveIndicator?;
    IndicatorType defaultIndicator?;
    LinktypeV02[] links?;
};

public type WorkergeneraldeductioninstructionstopeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
};

public type WorkergeneraldeductioninstructionstarteventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkergeneralDeductionInstructionstartQueryCriterion[] queryCriteria?;
    WorkergeneraldeductioninstructionstarteventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkergeneraldeductioninstructionstarteventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# The scheme code
public type WorkergeneraldeductioninstructionstarteventOriginatorApplicationidSchemecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
public type WorkergeneraldeductioninstructionstarteventConfirmmessage record {
    # An identifier for the instance of the confirm message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageConfirmmessageid confirmMessageID?;
    # The date & time that the message instance was generated.; follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string createDateTime?;
    # The date & time that the request submitted by the client was received. Note, this timestamp may not be the same as the time the client actually submitted the request if there is a queuing mechanism between the client and server processing the request; it follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string requestReceiptDateTime?;
    # Protocol-specific response status code.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolstatuscode protocolStatusCode?;
    # Code that identifies the protocol used for the request.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolcode protocolCode?;
    # The identifier of the request that generated this response.
    WorkergeneraldeductioninstructionstarteventConfirmmessageRequestid requestID?;
    # The process results status code for the request.
    ConfirmmessagetypeV01Requeststatuscode requestStatusCode?;
    # The method that was used on the request corresponding to this message instance.
    ConfirmmessagetypeV01Requestmethodcode requestMethodCode?;
    # A session identifier if one is available.
    WorkergeneraldeductioninstructionstarteventConfirmmessageSessionid sessionID?;
    # The entity tag of the entity in the request.
    string requestETag?;
    # The link of the request that generated this response.
    WorkergeneraldeductioninstructionstarteventConfirmmessageRequestlink requestLink?;
    # Processing status of the related request message.
    ConfirmmessagetypeV01Processingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessages[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcemessages[] resourceMessages?;
};

# Bank account info
public type FinancialaccounttypeV02 record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 accountNumber?;
    # The name of the related account
    string accountName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
};

public type PayrollinstructionsPayrollinstructions record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payrollRegionCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payrollGroupCode?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 payrollFileNumber?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 payrollProfileID?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # An array of instructions for general deductions
    PayrollGeneralDeductionInstruction[] generalDeductionInstructions?;
    # An array of instructions for garnishment deductions
    PayrollinstructionsGarnishmentinstructions[] garnishmentInstructions?;
    # An array of instructions for general deductions
    PayrollinstructionsBenefitinstructions[] benefitInstructions?;
    # An array of instructions for retirement plans
    PayrollinstructionsRetirementplaninstructions[] retirementPlanInstructions?;
    LinktypeV02[] links?;
};

# Status to include the status code and effective date (ISO-8601:2000 format)
public type StatustypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

public type WorkerGeneralDeductionInstructionStartEventMeta record {
    WorkergeneraldeductioninstructionstarteventmetaMeta meta?;
};

public type StringCodeListType record {
    # A reference to the codeList which returns the possible values for the query option
    CodelisttypeV03 codeList?;
    IndicatorType readOnly?;
    IndicatorType optional?;
    IndicatorType hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the default value which should be populated by default
    string default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    ValueSetType valueSet?;
    LinktypeV02[] dependencyLinks?;
};

# The coordinates of the location
public type CoordinatetypeV02 record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

public type CommunicationtypeV02Landlines record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country. 
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin).  These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

# Identifies the language used for expressions communicated in this message.
public type ConfirmmessagetypeV01Expressionlanguagecode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Event Data
public type WorkergeneraldeductioninstructionstarteventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkergeneraldeductioninstructionstarteventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkergeneraldeductioninstructionstarteventDataTransform transform?;
    # Result of the event
    WorkergeneraldeductioninstructionstarteventDataOutput output?;
};

# A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
public type CountrysubdivisiontypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of a country sub-division, e.g. state, county
    string subdivisionType?;
};

# Worker lien
public type WorkerLienOutput record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 lienDocumentID?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 lienStatusCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 lienIssuanceDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 lienRegistrationDate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 lienMaritalStatusCode?;
    # The number of employee's exemptions claimed
    int allowanceQuantity?;
    # Additional exemptions, caused by the certification,.e.g. 'Blind' or 'Over 65'
    int additionalAllowanceQuantity?;
    # The sequential number of the lien for a given worker
    int lienNumber?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 lienTypeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 lienSubTypeCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 lienReturnDate?;
    # The court order the lien is based on
    WorkerlienoutputCourtorder courtOrder?;
    # Boolean expression
    IndicatortypeV01 medicalInsuranceOfferedIndicator?;
    # Lien funds disbursement information necessary for garnishment processing for payroll
    WorkerlienoutputFundsdisbursement fundsDisbursement?;
    # A representation of a monetary value
    AmounttypeV02 lienExemptAmount?;
    # A representation of a monetary value
    AmounttypeV02 disposableWagesAmount?;
    # A representation of a monetary value
    AmounttypeV02 stateServiceChargeAmount?;
    # Boolean expression
    IndicatortypeV01 fullServiceClientIndicator?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # A representation of a monetary value
    AmounttypeV02 lienTotalAccumulatedAmount?;
};

# Protocol-specific response status code.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolstatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Simple (string) code identifying the http method used to invoke the API
public type HttpMethodType string;

public type PayrollinstructionsBenefitinstructions record {
    # A representation of a pay rate
    RatetypeV03 deductionRate?;
    # The deduction goal
    DeductiongoaltypeV02 deductionGoal?;
    BenefitInstructionCoverageItem[] benefitCoverages?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 deductionCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 deductionStartDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Actions which the user is allowed to initiate against the related instance.
    ActiontypeV02[] actions?;
};

# The unique identifier of the object in a collection
public type ItemidtypeV01 string;

# The value set item type
public type ValueSetItemType record {
    # The code for the related entity
    string idValue?;
    # Short description of the related code
    string itemDescription?;
    # Indicates if the current value is a default (pre-selected)
    boolean defaultIndicator?;
};

# Object describing the details of a person name
public type PersonnametypeV02 record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
    # A list of preferred salutations
    SalutationtypeV02[] preferredSalutations?;
    # Person title Prefix Codes
    TitleaffixtypeV02[] titlePrefixCodes?;
    # A preferred name, e.g. a nickname
    string nickName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 generationAffixCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualificationAffixCode?;
    # Person titles
    TitleaffixtypeV02[] titleAffixCodes?;
    # Person family name pre-fix
    string familyName1Prefix?;
    # Person family name pre-fix
    string familyName2Prefix?;
    # Person initials
    string initials?;
};

public type DisallowItemType record {
    # A unique identifier of an object within the collection
    ItemIDType itemID?;
};

# The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
public type ConfirmmessagetypeV01 record {
    # The unique identifier of the related entity 
    IdtypeV01 confirmMessageID?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 createDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 requestReceiptDateTime?;
    # The code for the related entity
    CodetypeV01 protocolStatusCode?;
    # The code for the related entity
    CodetypeV01 protocolCode?;
    # The unique identifier of the related entity 
    IdtypeV01 requestID?;
    # The process results status code for the request.
    ConfirmmessagetypeV01Requeststatuscode requestStatusCode?;
    # The method that was used on the request corresponding to this message instance.
    ConfirmmessagetypeV01Requestmethodcode requestMethodCode?;
    # The unique identifier of the related entity 
    IdtypeV01 sessionID?;
    # The entity tag of the entity in the request.
    string requestETag?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 requestLink?;
    # Processing status of the related request message.
    ConfirmmessagetypeV01Processingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessmessageV01[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    ConfirmmessagetypeV01Resourcemessages[] resourceMessages?;
};

# A logical operation
public type WorkergeneraldeductioninstructionstarteventmetaMetaLogicaloperators record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 logicalOperatorCode?;
    # Boolean expression
    IndicatortypeV01 mutuallyExclusiveIndicator?;
    # A list of mutually exclusive operator codes.
    SimplecodetypeV02[] mutuallyExclusiveLogicalOperatorCodes?;
};

# An instance to capture the ending of a general deduction.
public type WorkergeneraldeductioninstructionstopeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventServicecategorycode serviceCategoryCode?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventEventnamecode eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage or Divorce. This is optional and valued as defined by the system of record
    WorkergeneraldeductioninstructionstarteventEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been initiated by the system of record will have an event status code of created. An event that is saved in a work in progress state will have an event status code of inProgress. An event that has been recorded will have an event status code of complete. These values are set by the system of record and valued based on a standard codeslist
    WorkergeneraldeductioninstructionstarteventEventstatuscode eventStatusCode?;
    # This allows the system of record to prioritize events and is valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventPrioritycode priorityCode?;
    # This is the date time the event is recorded in the system of record with an event status code equal to complete. This value is set by the system of record
    string recordDateTime?;
    # This is the date time the event is created. If a system of record creates the event instance, as in the case of an annual enrollment for example, then is sets the creation date time. If a user declares an event, then this is set to the date time when the first call is made to the system of record
    string creationDateTime?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
    # This value is set by the system of record and used to term the life cycle of an event instance. 
    string expirationDateTime?;
    # This value is set by the system of record and allows for the presentation of a date by which the system of record would like the user to complete the event
    string dueDateTime?;
    # An originator is a user, machine or event that triggered the event
    WorkergeneraldeductioninstructionstarteventOriginator originator?;
    # The actor is the party that completed the recording of the event
    WorkergeneraldeductioninstructionstarteventActor actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkergeneraldeductioninstructionstarteventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkergeneraldeductioninstructionstarteventOnbehalfofparty onBehalfOfParty?;
    # Links
    WorkergeneraldeductioninstructionstarteventLinks[] links?;
    # Event Data
    WorkergeneraldeductioninstructionstopeventData data?;
};

# The link of the request that generated this response.
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageResourcelink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

# The court order the lien is based on
public type WorkerlienoutputCourtorder record {
    # The unique identifier of the related entity 
    IdtypeV02 orderID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 supportTypeCode?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 caseNumber?;
    # The court name that issued the lien
    string courtName?;
    # The jurisdiction that issued the lien
    WorkerlienoutputCourtorderIssuingjurisdiction issuingJurisdiction?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 FIPSCode?;
    # Boolean expression
    IndicatortypeV01 multipleSupportOrderIndicator?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 executionNumber?;
    # Boolean expression
    IndicatortypeV01 supportOrderInArrearsIndicator?;
    # Boolean expression
    IndicatortypeV01 orderReleaseIndicator?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 orderReleaseDate?;
    # Boolean expression
    IndicatortypeV01 orderIndexOnlyIndicator?;
};

# Data which is transformed as a result of the event
public type WorkergeneraldeductioninstructionstopeventDataTransform record {
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation
    WorkergeneraldeductioninstructionstarteventDataTransformEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record
    WorkergeneraldeductioninstructionstarteventDataTransformEventstatuscode eventStatusCode?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
};

# Event Data
public type WorkergeneraldeductioninstructionstopeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkergeneraldeductioninstructionstopeventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkergeneraldeductioninstructionstopeventDataTransform transform?;
    # Result of the event
    WorkergeneraldeductioninstructionstarteventDataOutput output?;
};

# Boolean expression
public type IndicatordefaulttypeV01 boolean;

# A single query parameter
public type WorkergeneralDeductionInstructionstartQueryCriterion record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 obligationCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionTypeCode?;
    # The default number value
    decimal defaultNumberValue?;
    # The default string value
    string defaultStringValue?;
    # Maximum number of resource paths supported
    int resourcePathMax?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    # A collection of acceptable resource paths to pass to the query option
    string[] resourcePaths?;
    # A collection of resource paths which may not be passed to the query option.  An example use of this is where you allow all paths except 1 or 2.  You would want to only specify those which are excluded
    string[] excludedResourcePaths?;
    # A reference to the codeList which returns the possible values for the query option
    CodelisttypeV03 queryValueCodeList?;
    # A collection of logical operators
    WorkergeneraldeductioninstructionstarteventmetaMetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type SimpleIDType string;

# A single query parameter
public type WorkergeneralDeductionInstructionstopQueryCriterion record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 obligationCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionTypeCode?;
    # The default number value
    decimal defaultNumberValue?;
    # The default string value
    string defaultStringValue?;
    # Maximum number of resource paths supported
    int resourcePathMax?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    # A collection of acceptable resource paths to pass to the query option
    string[] resourcePaths?;
    # A collection of resource paths which may not be passed to the query option.  An example use of this is where you allow all paths except 1 or 2.  You would want to only specify those which are excluded
    string[] excludedResourcePaths?;
    # A reference to the codeList which returns the possible values for the query option
    CodelisttypeV03 queryValueCodeList?;
    # A collection of logical operators
    WorkergeneraldeductioninstructionstarteventmetaMetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type WorkergeneraldeductioninstructionstarteventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/payrollInstruction?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/longName?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate?;
    NumberType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/rateValue?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/currencyCode?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/longName?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/longName?;
    NumberType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseMultiplierValue?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalStartDate?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount?;
    AmountValueType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount\/amountValue?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount\/currencyCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalID?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalBalanceAmount?;
    AmountValueType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalBalanceAmount\/amountValue?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalBalanceAmount\/currencyCode?;
};

# The actor is the party that completed the recording of the event
public type WorkergeneraldeductioninstructionstarteventActor record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
};

# Data which is transformed as a result of the event
public type GeneralDeductionInstructionEventContext record {
    # The unique identifier of the related worker lien within a collection
    string itemID?;
    # The code of the deduction. The code can be user defined or a statutory deduction
    PayrollinstructiontransformGeneraldeductioninstructionDeductioncode deductionCode?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request. For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

public type PayrollinstructionsRetirementplaninstructions record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 deductionCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 calculationFactorCode?;
    # A representation of a pay rate
    RatetypeV03 contributionRate?;
    # The deduction goal
    DeductiongoaltypeV02 contributionGoal?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 contributionStartDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Actions which the user is allowed to initiate against the related instance.
    ActiontypeV02[] actions?;
};

# An institution, such as a bank, building society, credit union, stock brokerage, or similar business; established primarily to provide financial services and financial transactions
public type FinancialpartytypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
    # The unique identifier of the related entity 
    IdtypeV02 financialPartyID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 SWIFTCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 branchNameCode?;
    # The unique identifier of the related entity 
    IdtypeV02 routingTransitID?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
};

# Each object contains detailed information for a resource referenced in the original request.
public type ConfirmmessagetypeV01Resourcemessages record {
    # The unique identifier of the related entity 
    IdtypeV01 resourceMessageID?;
    # The processing results status code of the resource of the request.
    ResourceMessageResourceStatus resourceStatusCode?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level). Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessMessageWithResourceStatusCode[] processMessages?;
};

public type InternetAddressWithItemID record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# A reference to the codeList which returns the possible values for the query option
public type CodelisttypeV03 record {
    # Code list title
    string codeListTitle?;
    # Boolean expression
    IndicatortypeV01 exclusiveIndicator?;
    # List items
    CodelistitemtypeV02[] listItems?;
    # Links
    LinktypeV02[] links?;
};

# The identifier of the request that generated this response.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageRequestid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

public type SocialNetworkContactCommunicationType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

# The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
public type WorkergeneraldeductioninstructionstarteventActasparty record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
    # A unique identifier of a client employee's organization id
    string organizationOID?;
};

public type WorkerGeneralDeductionInstructionStartEvent record {
    WorkergeneraldeductioninstructionstarteventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    WorkergeneraldeductioninstructionstarteventMeta meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    WorkergeneraldeductioninstructionstarteventConfirmmessage confirmMessage?;
};

public type WorkergeneraldeductioninstructionchangeeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkergeneralDeductionInstructionchangeQueryCriterion[] queryCriteria?;
    WorkergeneraldeductioninstructionchangeeventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkergeneraldeductioninstructionchangeeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
public type DatetimetypeV01 string;

# Processing status of the related request message.
public type ConfirmmessagetypeV01Processingstatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type Processmessagewithresourcestatuscode2 record {
    # An identifier for the instance of the process message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    WorkergeneraldeductioninstructionstarteventConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageLinks1[] links?;
    # Message returned to the user
    WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessage developerMessage?;
    # DEPRECATED - Use messageTypeCode instead. The processing results status code of the resource of the request.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcestatuscode resourceStatusCode?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type Processmessagewithresourcestatuscode1 record {
    # An identifier for the instance of the process message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    WorkergeneraldeductioninstructionstarteventConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionstarteventConfirmmessageLinks1[] links?;
    # Message returned to the user
    WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessage developerMessage?;
    # DEPRECATED - Use messageTypeCode instead. The processing results status code of the resource of the request.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcestatuscode resourceStatusCode?;
};

public type AmountValueType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the minimum amout value required for a property.
    decimal minAmountValue?;
    # Indicates the maximum amount value supported for a property
    decimal maxAmountValue?;
    # Indicates the minimum value required for a property.
    decimal minValue?;
    # Indicates the maximum value supported for a property
    decimal maxValue?;
    # Indicates that the value must be a multiple of this value or divisible by this value.
    decimal multipleOf?;
    # Indicates the default value which should be populated by default
    decimal default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    # Data type of the attribute
    string dataType?;
    # Dependency links
    LinktypeV02[] dependencyLinks?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values. The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageLinks1 record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

public type WorkergeneraldeductioninstructionchangeeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/payrollInstruction?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate?;
    NumberType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/rateValue?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/currencyCode?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/unitCode\/longName?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseUnitCode\/longName?;
    NumberType '\/payrollInstruction\/generalDeductionInstruction\/deductionRate\/baseMultiplierValue?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalStartDate?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount?;
    AmountValueType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount\/amountValue?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionGoal\/goalLimitAmount\/currencyCode?;
};

# The link of the request that generated this response.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageRequestlink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

public type WorkerGeneralDeductionInstructionStopEvent record {
    WorkergeneraldeductioninstructionstopeventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    WorkergeneraldeductioninstructionstarteventMeta meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    WorkergeneraldeductioninstructionstarteventConfirmmessage confirmMessage?;
};

# Representation of a message.
public type MessagetypeV01 record {
    # The code associated with the message description.
    string codeValue?;
    # Title of the message description.
    string title?;
    # The value/content of the message description.
    string messageTxt?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
};

# A representation of a monetary value
public type AmounttypeV02 record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
};

# Data which is transformed as a result of the event
public type GeneralDeductionInstructionTransform record {
    # The value of the associated deduction, e.g. the deduction amount
    PayrollinstructiontransformGeneraldeductioninstructionDeductionrate deductionRate?;
    # A deduction goal
    GeneraldeductioninstructiontransformDeductiongoal deductionGoal?;
};

# Event Data
public type WorkergeneraldeductioninstructionchangeeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkergeneraldeductioninstructionchangeeventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkergeneraldeductioninstructionchangeeventDataTransform transform?;
    # Result of the event
    WorkergeneraldeductioninstructionchangeeventDataOutput output?;
};

public type PayrollInstructions record {
    PayrollinstructionsPayrollinstructions[] payrollInstructions?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    MetatypeV02 meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    ConfirmmessagetypeV01 confirmMessage?;
};

public type WorkergeneraldeductioninstructionstopeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkergeneralDeductionInstructionstopQueryCriterion[] queryCriteria?;
    WorkergeneraldeductioninstructionchangeeventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkergeneraldeductioninstructionstopeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# The code of the deduction. The code can be user defined or a statutory deduction
public type PayrollinstructiontransformGeneraldeductioninstructionDeductioncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Message returned to the user
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessage record {
    # The code associated with the message description.
    string codeValue?;
    # Title of the message description.
    string title?;
    # The value/content of the message description.
    string messageTxt?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessageLinks[] links?;
};

# Worker
public type WorkergeneraldeductioninstructionstarteventDataEventcontextWorker record {
    # A unique identifier of a covered individual when there is an AOID
    string associateOID?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessageLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

# The value that cannot be exceeded - e.g  the targeted goal amount
public type PayrollinstructiontransformGeneraldeductioninstructionDeductiongoalGoallimitamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# The email URI of the related entity
public type EmailuritypeV02 string;

# A government identifier, e.g. a national identity number or a social insurance number
public type GovernmentiditemtypeV02 record {
    # An actual ID
    string idValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 statusCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expirationDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Message returned to the user
public type WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessage record {
    # The code associated with the message description.
    string codeValue?;
    # Title of the message description.
    string title?;
    # The value/content of the message description.
    string messageTxt?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessageLinks[] links?;
};

# Type to include the code and effective date (ISO-8601:2000 format)
public type EffectivedatedamounttypeV02 record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# The unique identifier of the application which originated the event or a process
public type WorkergeneraldeductioninstructionstarteventOriginatorApplicationid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    WorkergeneraldeductioninstructionstarteventOriginatorApplicationidSchemecode schemeCode?;
};

# This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage or Divorce. This is optional and valued as defined by the system of record
public type WorkergeneraldeductioninstructionstarteventEventreasoncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PayrollinstructionsGarnishmentinstructions record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 calculationFactorCode?;
    # The deduction goal
    DeductiongoaltypeV02 garnishmentGoal?;
    # A representation of a monetary value
    AmounttypeV02 garnishmentAmount?;
    # A representation of a monetary value
    PercentagetypeV02 garnishmentPercentage?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 garnishmentStartDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 garnishmentEndDate?;
    # Allows specific earnings to be excluded from the garnishment
    CodetypeV02[] excludedEarningCodes?;
    # Allows specific deductions to be excluded from the garnishment
    CodetypeV02[] excludedDeductionCodes?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 deductionCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Worker lien
    WorkerLienOutput workerLien?;
    # Actions which the user is allowed to initiate against the related instance.
    ActiontypeV02[] actions?;
};

# The region in which the payroll is processed
public type PayrollinstructioneventcontextPayrollregioncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ValueSetMeta record {
    # Code value (typically a key field) of the code list item
    string idValuePath?;
    # Short name field of the code list item
    string itemDescriptionPath?;
};

public type ArgumentType record {
    # Argument name to be passed in
    string argumentName?;
    # The path of the argument to be passed in
    string argumentPath?;
    # The value of the argument name to be passed in
    string argumentValue?;
};

# Payroll instruction
public type PayrollInstructionOutput record {
    # The payroll profile ID
    string payrollProfileID?;
    # The region in which the payroll is processed
    PayrollinstructioneventcontextPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrollinstructioneventcontextPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The payroll agreement id
    string payrollAgreementID?;
    # The unique identifier of the related worker lien within a collection
    string itemID?;
    # Data which is transformed as a result of the event
    GeneralDeductionInstructionOutput generalDeductionInstruction?;
};

# A deduction goal
public type GeneraldeductioninstructiontransformDeductiongoal record {
    # The date when the deduction goal was set
    string goalStartDate?;
    # The value that cannot be exceeded - e.g  the targeted goal amount
    PayrollinstructiontransformGeneraldeductioninstructionDeductiongoalGoallimitamount goalLimitAmount?;
};

# This allows the system of record to prioritize events and is valued based on a standard codelist
public type WorkergeneraldeductioninstructionstarteventPrioritycode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type MetaDataType string;

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionstarteventMetaLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

# An instance of an Associate that is part of the group(s) assigned to the review event.  The actor is the member that actually completes the event.
public type AssignedGroupMember record {
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # Human readable name of the actor
    string formattedName?;
};

# Result of the event
public type WorkergeneraldeductioninstructionchangeeventDataOutput record {
    # Payroll instruction
    Payrollinstructionoutput1 payrollInstruction?;
};

public type CommunicationtypeV02Instantmessages record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

# This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation
public type WorkergeneraldeductioninstructionstarteventDataTransformEventreasoncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# This identifies the status of the event. An event that has been initiated by the system of record will have an event status code of created. An event that is saved in a work in progress state will have an event status code of inProgress. An event that has been recorded will have an event status code of complete. These values are set by the system of record and valued based on a standard codeslist
public type WorkergeneraldeductioninstructionstarteventEventstatuscode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# An originator is a user, machine or event that triggered the event
public type WorkergeneraldeductioninstructionstarteventOriginator record {
    # The unique identifier of the application which originated the event or a process
    WorkergeneraldeductioninstructionstarteventOriginatorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event.
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the event originator
    string formattedName?;
    # The unique identifier of the event instance. This is generated once an event is recorded with an event status code equal to Complete. This value is set by the system of record.
    string eventID?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire
    WorkergeneraldeductioninstructionstarteventOriginatorEventnamecode eventNameCode?;
    # The unique identifier of the device, e.g. a time clock, door entry beam
    string deviceID?;
};

# The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist
public type WorkergeneraldeductioninstructionstarteventServicecategorycode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Schema describing the type of the user or developer message
public type MessagetypecodetypeV01 record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# The processing results status code of the resource of the request.
public type ResourceMessageResourceStatus record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# A representation of a fee amount
public type FeetypeV02 record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 unitTimeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A representation of a monetary value
    PercentagetypeV02 percentage?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 percentageBasisCode?;
};

# Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
public type HelperMessageType record {
    # Message to present to the user.
    string messageTxt?;
    # Links
    LinktypeV02[] links?;
};

# An instance to capture the modification of a general deduction.
public type WorkergeneraldeductioninstructionchangeeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventServicecategorycode serviceCategoryCode?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventEventnamecode eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage or Divorce. This is optional and valued as defined by the system of record
    WorkergeneraldeductioninstructionstarteventEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been initiated by the system of record will have an event status code of created. An event that is saved in a work in progress state will have an event status code of inProgress. An event that has been recorded will have an event status code of complete. These values are set by the system of record and valued based on a standard codeslist
    WorkergeneraldeductioninstructionstarteventEventstatuscode eventStatusCode?;
    # This allows the system of record to prioritize events and is valued based on a standard codelist
    WorkergeneraldeductioninstructionstarteventPrioritycode priorityCode?;
    # This is the date time the event is recorded in the system of record with an event status code equal to complete. This value is set by the system of record
    string recordDateTime?;
    # This is the date time the event is created. If a system of record creates the event instance, as in the case of an annual enrollment for example, then is sets the creation date time. If a user declares an event, then this is set to the date time when the first call is made to the system of record
    string creationDateTime?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
    # This value is set by the system of record and used to term the life cycle of an event instance. 
    string expirationDateTime?;
    # This value is set by the system of record and allows for the presentation of a date by which the system of record would like the user to complete the event
    string dueDateTime?;
    # True indicates that the requestor wants notifications on the status of the request
    boolean notificationIndicator?;
    # An originator is a user, machine or event that triggered the event
    WorkergeneraldeductioninstructionstarteventOriginator originator?;
    # The actor is the party that completed the recording of the event
    WorkergeneraldeductioninstructionchangeeventActor actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkergeneraldeductioninstructionchangeeventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkergeneraldeductioninstructionchangeeventOnbehalfofparty onBehalfOfParty?;
    # Links
    WorkergeneraldeductioninstructionchangeeventLinks[] links?;
    # Event Data
    WorkergeneraldeductioninstructionchangeeventData data?;
};

# Data which is transformed as a result of the event
public type WorkergeneraldeductioninstructionstarteventDataTransform record {
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation
    WorkergeneraldeductioninstructionstarteventDataTransformEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record
    WorkergeneraldeductioninstructionstarteventDataTransformEventstatuscode eventStatusCode?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time
    string effectiveDateTime?;
    # Payroll instruction
    PayrollInstructionTransform payrollInstruction?;
};

public type NumberType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the minimum value required for a property.
    decimal minValue?;
    # Indicates the maximum value supported for a property
    decimal maxValue?;
    # Indicates that the value must be a multiple of this value or divisible by this value.
    decimal multipleOf?;
    # Indicates the default value which should be populated by default
    decimal default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinktypeV02[] dependencyLinks?;
};

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
public type WorkergeneraldeductioninstructionchangeeventMeta record {
    # The instance resource sequence (number) identifying the first resource returned in the response. The server generates this sequence.  It is used by the client to determine the start sequence of the subsequent Get request
    int startSequence?;
    # Indicates whether the response completes the return of all of the resources of the instance resource set to the requesting system
    boolean completeIndicator?;
    # Number of total instance resources in an instance resource set. Note: An instance resource set is a set of instance resources that is determined by a server to satisfy the sets membership criteria (i.e., selection, filter, expansion and search criteria) of a resource management operation (e.g. GET request) upon a collection resource
    int totalNumber?;
    # Unique identifier of the instance resource set.  It is generated by the server as a result of the original Get request
    string resourceSetID?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    WorkergeneraldeductioninstructionchangeeventMetaLinks[] links?;
};

# Denotes when payment should be remitted
public type PaymentScheduleLienFundsDisbursement record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scheduleTypeCode?;
    # A representation of a monetary value
    AmounttypeV02 accruedPaymentAmount?;
    # The numeric value associated to the adjustment, e.g if  scheduleCode is 'paydate + days' and adjustmentValue = 3, then Payment will be remitted on paydate + 3 days
    decimal adjustmentValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 unitTimeCode?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionstarteventLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource. The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

# Each object contains detailed information for a resource referenced in the original request.
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageResourcemessages record {
    # An identifier for the instance of the resource message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcemessageid resourceMessageID?;
    # The processing results status code of the resource of the request.
    ResourceMessageResourceStatus resourceStatusCode?;
    # The link of the request that generated this response.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageResourcelink resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    Processmessagewithresourcestatuscode2[] processMessages?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionchangeeventLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource. The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

# This is the canonical name of the event, e.g. dependent.add, worker.hire
public type WorkergeneraldeductioninstructionstarteventOriginatorEventnamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A representation of a pay rate
public type RatetypeV03 record {
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal rateValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 unitCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 baseUnitCode?;
    # For any given rate, the base rate value is presumed to be 1, e.g. per one hour, per one month. If for example, the rate was 10 US dollars for every widget produced, the base rate value is presumed to be one and there is no need to communicate a baseMultiplierValue. If however, the rate was 10 US Dollars for every 3 widgets produced, the baseMultiplierValue would be 3
    decimal baseMultiplierValue?;
};

# A number which provides the sequence that this property should be presented in relation to other properties.
public type SequenceType int;

public type EmailContactCommunicationType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The email URI of the related entity
    EmailuritypeV02 emailUri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

public type ObjectType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinktypeV02[] dependencyLinks?;
};

# Result of the event
public type WorkergeneraldeductioninstructionstarteventDataOutput record {
    # Payroll instruction
    PayrollInstructionOutput payrollInstruction?;
};

public type WorkerGeneralDeductionInstructionChangeEvent record {
    WorkergeneraldeductioninstructionchangeeventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    WorkergeneraldeductioninstructionchangeeventMeta meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    WorkergeneraldeductioninstructionchangeeventConfirmmessage confirmMessage?;
};

# The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format.
public type DatetimeperiodtypeV01 record {
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 startDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 endDateTime?;
};

public type WorkergeneraldeductioninstructionstarteventmetaMetaDataeventcontext record {
    StringType '\/contextExpressionID?;
    ObjectType '\/worker?;
    StringType '\/worker\/associateOID?;
    ObjectType '\/payrollInstruction?;
    StringCodeListType '\/payrollInstruction\/payrollRegionCode?;
    StringType '\/payrollInstruction\/payrollRegionCode\/codeValue?;
    StringType '\/payrollInstruction\/payrollRegionCode\/shortName?;
    StringType '\/payrollInstruction\/payrollRegionCode\/longName?;
    StringCodeListType '\/payrollInstruction\/payrollGroupCode?;
    StringType '\/payrollInstruction\/payrollGroupCode\/codeValue?;
    StringType '\/payrollInstruction\/payrollGroupCode\/shortName?;
    StringType '\/payrollInstruction\/payrollGroupCode\/longName?;
    StringType '\/payrollInstruction\/payrollFileNumber?;
    StringType '\/payrollInstruction\/payrollProfileID?;
    StringType '\/payrollInstruction\/itemID?;
};

# The string representation of the date value. Follows the ISO-8601:2000 format
public type DatetypeV01 string;

# The unique identifier of the related entity 
public type IdtypeV02 record {
    # An actual ID value
    string idValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 schemeCode?;
};

# The unique identifier of the related entity 
public type IdtypeV01 record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

public type BooleanType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # A number which provides the sequence that this property should be presented in relation to other properties.
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property
    string longLabelName?;
    # Indicates the default value which should be populated by default
    boolean default?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    # Data type of the attribute
    string dataType?;
    LinktypeV02[] dependencyLinks?;
};

# A preferred salutation, e.g. Mr., Dr., etc.
public type SalutationtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 salutationCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 sequenceNumber?;
};

# Person titles, e.g. social, professional, generational, etc.
public type TitleaffixtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 affixCode?;
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 sequenceNumber?;
};

# Each object contains detailed information for a resource referenced in the original request.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageResourcemessages record {
    # An identifier for the instance of the resource message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcemessageid resourceMessageID?;
    # The processing results status code of the resource of the request.
    ResourceMessageResourceStatus resourceStatusCode?;
    # The link of the request that generated this response.
    WorkergeneraldeductioninstructionstarteventConfirmmessageResourcelink resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    Processmessagewithresourcestatuscode1[] processMessages?;
};

# This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist
public type WorkergeneraldeductioninstructionstarteventEventnamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Boolean expression
public type IndicatortypeV01 boolean;

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type WorkergeneraldeductioninstructionchangeeventConfirmmessageProcessmessages record {
    # An identifier for the instance of the process message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    WorkergeneraldeductioninstructionstarteventConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionchangeeventConfirmmessageLinks[] links?;
    # Message returned to the user
    WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    WorkergeneraldeductioninstructionchangeeventConfirmmessageUsermessage developerMessage?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkergeneraldeductioninstructionchangeeventDataEventcontext record {
    # A globally unique (GUID) identifier of the context expression. This conveys the context of the associated data. For example, if the context is set to Germany, the data would adhere to the business rules and formatting rules relevant to Germany
    string contextExpressionID?;
    # Worker
    WorkergeneraldeductioninstructionstarteventDataEventcontextWorker 'worker?;
    # Payroll instruction
    Payrollinstructioneventcontext1 payrollInstruction?;
};

# A representation of a monetary value
public type PercentagetypeV02 record {
    # The percentage value
    decimal percentageValue?;
    # The code for the related entity
    CodetypeV01 basisCode?;
};

# An identifier for the instance of the process message.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type LinkType record {
    # URI type
    UriType canonicalUri?;
    # URI type
    UriType href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # Simple (string) code identifying the http method used to invoke the API
    HttpMethodType method?;
    # Payload arguments
    ArgumentType[] payloadArguments?;
};

# Payroll instruction
public type Payrollinstructioneventcontext2 record {
    # The payroll profile ID
    string payrollProfileID?;
    # The region in which the payroll is processed
    PayrollinstructioneventcontextPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrollinstructioneventcontextPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The payroll agreement id
    string payrollAgreementID?;
    # The unique identifier of the related worker lien within a collection
    string itemID?;
    # Data which is transformed as a result of the event
    GeneralDeductionInstructionEventContext generalDeductionInstruction?;
};

public type WorkergeneraldeductioninstructionchangeeventmetaMetaDataeventcontext record {
    StringType '\/contextExpressionID?;
    ObjectType '\/worker?;
    StringType '\/worker\/associateOID?;
    ObjectType '\/payrollInstruction?;
    StringCodeListType '\/payrollInstruction\/payrollRegionCode?;
    StringType '\/payrollInstruction\/payrollRegionCode\/codeValue?;
    StringType '\/payrollInstruction\/payrollRegionCode\/shortName?;
    StringType '\/payrollInstruction\/payrollRegionCode\/longName?;
    StringCodeListType '\/payrollInstruction\/payrollGroupCode?;
    StringType '\/payrollInstruction\/payrollGroupCode\/codeValue?;
    StringType '\/payrollInstruction\/payrollGroupCode\/shortName?;
    StringType '\/payrollInstruction\/payrollGroupCode\/longName?;
    StringType '\/payrollInstruction\/payrollFileNumber?;
    StringType '\/payrollInstruction\/payrollProfileID?;
    StringType '\/payrollInstruction\/itemID?;
    ObjectType '\/payrollInstruction\/generalDeductionInstruction?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/itemID?;
    StringCodeListType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/codeValue?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/shortName?;
    StringType '\/payrollInstruction\/generalDeductionInstruction\/deductionCode\/longName?;
};

# A deduction goal
public type PayrollinstructiontransformGeneraldeductioninstructionDeductiongoal record {
    # The date when the deduction goal was set
    string goalStartDate?;
    # The value that cannot be exceeded - e.g  the targeted goal amount
    PayrollinstructiontransformGeneraldeductioninstructionDeductiongoalGoallimitamount goalLimitAmount?;
    # The unique identifier of the goal
    string goalID?;
    # The value that has been added to the goal thus far
    PayrollinstructiontransformGeneraldeductioninstructionDeductiongoalGoalbalanceamount goalBalanceAmount?;
};

# Payroll instruction
public type Payrollinstructioneventcontext1 record {
    # The payroll profile ID
    string payrollProfileID?;
    # The region in which the payroll is processed
    PayrollinstructioneventcontextPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrollinstructioneventcontextPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The unique identifier of the related worker lien within a collection
    string itemID?;
    # Data which is transformed as a result of the event
    GeneralDeductionInstructionEventContext generalDeductionInstruction?;
};

# Payroll instruction
public type PayrollInstructionTransform record {
    # Data which is transformed as a result of the event
    PayrollinstructiontransformGeneraldeductioninstruction generalDeductionInstruction?;
};

public type WorkerGeneralDeductionInstructionStopEventMeta record {
    WorkergeneraldeductioninstructionstopeventmetaMeta meta?;
};

public type BenefitInstructionCoverageItem record {
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 benefitAreaCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 coverageLevelCode?;
    # The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format.
    DatetimeperiodtypeV01 effectiveTimePeriod?;
    # Type to include the code and effective date (ISO-8601:2000 format)
    EffectivedatedamounttypeV02 coverageAmount?;
    # List of individuals eligible to be covered in the associated plan offering with the individual coverage amounts
    IndividualCoverageItem[] individualCoverages?;
};

# The actor is the party that completed the recording of the event
public type WorkergeneraldeductioninstructionchangeeventActor record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
};

# The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
public type WorkergeneraldeductioninstructionchangeeventOnbehalfofparty record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
    # A unique identifier of a client employee's organization id
    string organizationOID?;
};

# An identifier for the instance of the resource message.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageResourcemessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type ProcessmessageV01 record {
    # The unique identifier of the related entity 
    IdtypeV01 processMessageID?;
    # Schema describing the type of the user or developer message
    MessagetypecodetypeV01 messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
    # Representation of a message.
    MessagetypeV01 userMessage?;
    # Representation of a message.
    MessagetypeV01 developerMessage?;
};

# Payroll instruction
public type Payrollinstructiontransform1 record {
    # Data which is transformed as a result of the event
    GeneralDeductionInstructionTransform generalDeductionInstruction?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkergeneraldeductioninstructionstopeventDataEventcontext record {
    # A globally unique (GUID) identifier of the context expression. This conveys the context of the associated data. For example, if the context is set to Germany, the data would adhere to the business rules and formatting rules relevant to Germany
    string contextExpressionID?;
    # Worker
    WorkergeneraldeductioninstructionstarteventDataEventcontextWorker 'worker?;
    # Payroll instruction
    Payrollinstructioneventcontext2 payrollInstruction?;
};

public type IndividualCoverageItem record {
    # The unique identifier of the related entity 
    IdtypeV02 individualID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 relationshipTypeCode?;
    # Type to include the code and effective date (ISO-8601:2000 format)
    EffectivedatedamounttypeV02 coverageAmount?;
};

# The value that has been added to the goal thus far
public type PayrollinstructiontransformGeneraldeductioninstructionDeductiongoalGoalbalanceamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# A unique identifier of an object within the collection
public type ItemIDType string;

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
public type MetatypeV02 record {
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 startSequence?;
    # Boolean expression
    IndicatortypeV01 completeIndicator?;
    # Number of total instance resources in an instance resource set. Note: An instance resource set is a set of instance resources that is determined by a server to satisfy the sets membership criteria (i.e., selection, filter, expansion and search criteria) of a resource management operation (e.g. GET request) upon a collection resource
    int totalNumber?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 resourceSetID?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02[] links?;
};

# DEPRECATED - Use messageTypeCode instead. The processing results status code of the resource of the request.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageResourcestatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type MaskingRuleType record {
    IndicatorType authorizationRequiredIndicator?;
    SimpleIDType authorizationResourceID?;
    LinktypeV02[] links?;
};

# Object describing the details of a party, either person or organization
public type PartytypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
    # The unique identifier of the related entity 
    IdtypeV02 partyID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 partyTypeCode?;
    # A list of government identifiers
    GovernmentiditemtypeV02[] governmentIDs?;
    # The name of the party
    string legalName?;
    # Object describing the details of a person name
    PersonnametypeV02 contactName?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 contactCommunication?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type LinktypeV02 record {
    # The URI of the related entity
    UritypeV01 href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # The URI of the related entity
    UritypeV01 canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body
    string schema?;
    # Payload arguments
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

# The link of the request that generated this response.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageResourcelink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

# Data which is transformed as a result of the event
public type GeneralDeductionInstructionOutput record {
    # The code of the deduction. The code can be user defined or a statutory deduction
    PayrollinstructiontransformGeneraldeductioninstructionDeductioncode deductionCode?;
    # The value of the associated deduction, e.g. the deduction amount
    PayrollinstructiontransformGeneraldeductioninstructionDeductionrate deductionRate?;
    # A deduction goal
    PayrollinstructiontransformGeneraldeductioninstructionDeductiongoal deductionGoal?;
    # The unique identifier of the item within a collection
    string itemID?;
};

# Code that identifies the protocol used for the request.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageProtocolcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Sequence of a related entity when included in the collection or a group
public type SequencetypeV01 int;

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values. The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkergeneraldeductioninstructionstarteventConfirmmessageLinks1 record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

public type WorkerGeneralDeductionInstructionChangeEventMeta record {
    WorkergeneraldeductioninstructionchangeeventmetaMeta meta?;
};

# An identifier for the instance of the confirm message.
public type WorkergeneraldeductioninstructionstarteventConfirmmessageConfirmmessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# The value of the associated deduction, e.g. the deduction amount
public type PayrollinstructiontransformGeneraldeductioninstructionDeductionrate record {
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal rateValue?;
    # List of standard currency codes ISO 4217 For any given rate, either the currencyCode or the unitCode is present. In the example 5 US dollars per hour, the unitCode would not be present, and the currency code would be USD
    string currencyCode?;
    # For any given rate, either the currencyCode or the unitCode is present. In the example 3 bags of rice per month, currencyCode would not be present, and the unitCode would be bags of rice. In the example, 20 percent of annual sales, the unitCode would be percent
    PayrollinstructiontransformGeneraldeductioninstructionDeductionrateUnitcode unitCode?;
    # For any given rate, the baseUnitCode is used to define the denominator of the rate, or rate over what. In the example 5 US dollars per hour, the baseUnitCode is hour. In the example 3 bags of rice per month, the baseUnitCode is month. If for example, the rate was 10 US dollars for every widget produced, the baseUnitCode would be widget. In the example, 20 percent of annual sales, the baseUnitCode would equate to annual sales
    PayrollinstructiontransformGeneraldeductioninstructionDeductionrateBaseunitcode baseUnitCode?;
    # For any given rate, the base rate value is presumed to be 1, e.g. per one hour, per one month. If for example, the rate was 10 US dollars for every widget produced, the base rate value is presumed to be one and there is no need to communicate a baseMultiplierValue. If however, the rate was 10 US Dollars for every 3 widgets produced, the baseMultiplierValue would be 3
    decimal baseMultiplierValue?;
};

# The unique identifier of the application which originated the event.
public type WorkergeneraldeductioninstructionstarteventActorApplicationid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    WorkergeneraldeductioninstructionstarteventOriginatorApplicationidSchemecode schemeCode?;
};

# The URI of the related entity
public type UritypeV01 string;

public type IndicatorType boolean;

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessages record {
    # An identifier for the instance of the process message.
    WorkergeneraldeductioninstructionstarteventConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    WorkergeneraldeductioninstructionstarteventConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    WorkergeneraldeductioninstructionstarteventConfirmmessageLinks[] links?;
    # Message returned to the user
    WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    WorkergeneraldeductioninstructionstarteventConfirmmessageUsermessage developerMessage?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkergeneraldeductioninstructionstarteventDataEventcontext record {
    # A globally unique (GUID) identifier of the context expression. This conveys the context of the associated data. For example, if the context is set to Germany, the data would adhere to the business rules and formatting rules relevant to Germany
    string contextExpressionID?;
    # Worker
    WorkergeneraldeductioninstructionstarteventDataEventcontextWorker 'worker?;
    # Payroll instruction
    PayrollInstructionEventContext payrollInstruction?;
};

# The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
public type CodetypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The code for the related entity
public type CodetypeV01 record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ValueSetType record {
    ValueSetMeta meta?;
    ValueSetItemType[] valueSetListItems?;
    LinktypeV02[] links?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type ProcessMessageWithResourceStatusCode record {
    # The unique identifier of the related entity 
    IdtypeV01 processMessageID?;
    # Schema describing the type of the user or developer message
    MessagetypecodetypeV01 messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
    # Representation of a message.
    MessagetypeV01 userMessage?;
    # Representation of a message.
    MessagetypeV01 developerMessage?;
    # The code for the related entity
    CodetypeV01 resourceStatusCode?;
};

# The method that was used on the request corresponding to this message instance.
public type ConfirmmessagetypeV01Requestmethodcode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Payroll instruction
public type PayrollInstructionEventContext record {
    # The payroll profile ID
    string payrollProfileID?;
    # The region in which the payroll is processed
    PayrollinstructioneventcontextPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrollinstructioneventcontextPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The payroll agreement id
    string payrollAgreementID?;
    # The unique identifier of the related worker lien within a collection
    string itemID?;
};

# For any given rate, the baseUnitCode is used to define the denominator of the rate, or rate over what. In the example 5 US dollars per hour, the baseUnitCode is hour. In the example 3 bags of rice per month, the baseUnitCode is month. If for example, the rate was 10 US dollars for every widget produced, the baseUnitCode would be widget. In the example, 20 percent of annual sales, the baseUnitCode would equate to annual sales
public type PayrollinstructiontransformGeneraldeductioninstructionDeductionrateBaseunitcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type WorkerlienoutputFundsdisbursementDisbursementmessages record {
    # The text entered by the user
    string textValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 messageTypeCode?;
    # Boolean expression
    IndicatortypeV01 showOnCheckIndicator?;
};

# The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
public type WorkergeneraldeductioninstructionchangeeventActasparty record {
    # The unique identifier of the application which originated the event.
    WorkergeneraldeductioninstructionstarteventActorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event or a process
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkergeneraldeductioninstructionstarteventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event or process
    string deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
    # A unique identifier of a client employee's organization id
    string organizationOID?;
};

public type AssignedGroup record {
    # The unique identifier of the group
    string groupID?;
    # The name of the group
    string groupName?;
    # Associates that are part of the group(s) assigned to the review event.  The actor is the member that actually completes the event.
    AssignedGroupMember[] assignedGroupMembers?;
};

# Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true
public type AttestationtypeV02 record {
    # Boolean expression
    IndicatordefaulttypeV01 actionBlockIndicator?;
    # Message to present to the user.  This is mutuallly exclusive with the messageUri which is an external link to the message.  If the text is sizable and fairly static then it should be an external link which may be cached
    string messageTxt?;
    # The URI of the related entity
    UritypeV01 messageUri?;
};

# The jurisdiction that issued the lien
public type WorkerlienoutputCourtorderIssuingjurisdiction record {
    # A city in the context of an address
    string cityName?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 postalCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 jurisdictionCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 jurisdictionTypeCode?;
};
