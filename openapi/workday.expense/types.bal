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
    http:BearerTokenConfig auth;
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

public type ErrorModelReference record {
    # A description of the error
    string 'error;
};

public type ReportServiceRepresentation record {
    # Total Amount for the Expense Report
    record {} totalAmount?;
    ExpenseReportStatus expenseReportStatus?;
    # Creation Date label to be used for REST API
    string creationDate?;
    # Memo label to be used for REST API
    string expenseReportMemo?;
    # A preview of the instance
    string descriptor?;
    # A link to the instance
    string href?;
    # Id of the instance
    string id?;
};

public type SubmitExpenseReportRepresentation record {
    ExpenseReport expenseReport?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type Company record {
    *InstanceModelReference;
};

public type CreditCardTransaction record {
    *InstanceModelReference;
};

public type ContentType record {
    *InstanceModelReference;
};

public type WorkTagsRepresentation record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type WorkTag record {
    *WorkTagsRepresentation;
};

# collection something or other
public type InlineResponse200 record {
    ReportServiceRepresentation[] data?;
    int total?;
};

public type ExpenseItemsServiceRepresentation record {
    # A preview of the instance
    string descriptor?;
    # A link to the instance
    string href?;
    # Id of the instance
    string id?;
};

public type Image record {
    *InstanceModelReference;
};

public type ExpenseEntryImage record {
    # File length of the attachment
    int fileLength?;
    # File name of the attachment
    @constraint:String {maxLength: 255}
    string fileName?;
    ContentType contentType?;
    # A preview of the instance
    string descriptor?;
    # A link to the instance
    string href?;
    # Id of the instance
    string id?;
};

public type ReportPostServiceRepresentation record {
    Payee payee?;
    # Memo label to be used for REST API
    string expenseReportMemo?;
    # Creation Date label to be used for REST API
    string creationDate?;
    WorkTag worktag?;
    Company company?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type TravelBookingRecord record {
    *InstanceModelReference;
};

public type QuickExpense record {
    *InstanceModelReference;
};

public type ScanStatus record {
    *InstanceModelReference;
};

public type EntryServicePUTRepresentation record {
    # CRF for Entries REST operation to expose Attachment related to Optical Character Recognition
    ExpenseEntryImage[] attachments?;
    # Amount for Expense Entry
    record {} amount?;
    # Expense Merchant Name
    string merchant?;
    ExpenseItem expenseItem?;
    # Date of Expense Entry
    string date;
    # Memo for the Entry
    string memo?;
    Image image?;
    # A preview of the instance
    string descriptor?;
    # A link to the instance
    string href?;
    # Id of the instance
    string id?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string id;
    # A description of the instance
    string descriptor?;
    # A link to the instance
    string href?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[] errors?;
};

public type ExpenseItem record {
    *InstanceModelReference;
};

public type ExpenseReportStatus record {
    *InstanceModelReference;
};

public type PostExpenseReportLineRepresentation record {
    # Date the Expense Report Line was created
    string date?;
    ExpenseItem expenseItem?;
    TravelBookingRecord travelBookingRecord?;
    # Memo for the Expense Report Line
    string memo?;
    QuickExpense quickExpense?;
    CreditCardTransaction creditCardTransaction?;
    # Total amount to be reimbursed to the requestee
    record {} totalAmount?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type EntryServiceRepresentation record {
    # CRF for Entries REST operation to expose Attachment related to Optical Character Recognition
    ExpenseEntryImage[] attachments?;
    # Boolean value indicating whether the Mobile Expense has an OCR image.
    boolean hasOCRReceipt?;
    # Amount for Expense Entry
    record {} amount?;
    ScanStatus scanStatus?;
    # Memo for the Entry
    string memo?;
    ExpenseItem expenseItem?;
    # Date of Expense Entry
    string date?;
    # Expense Merchant Name
    string merchant?;
    # A preview of the instance
    string descriptor?;
    # A link to the instance
    string href?;
    # Id of the instance
    string id?;
};

public type ItemValues record {
    # The number of instances returned by this facet
    int count?;
    # wid / id / reference id
    string id;
    # A description of the facet
    string descriptor?;
    # A link to the instance
    string href?;
};

public type ExpenseEntryServiceRepresentation record {
    ExpenseEntryStatus expenseEntryStatus?;
    # Amount for Expense Entry
    record {} amount?;
    # Memo for the Entry
    string memo?;
    EntryType entryType?;
    # Date of Expense Entry
    string date?;
    ScanStatus scanStatus?;
    # CRF for Entries REST operation to expose Attachment related to Optical Character Recognition
    ExpenseEntryImage[] attachments?;
    # Expense Merchant Name
    string merchant?;
    ExpenseItem expenseItem?;
    # Boolean value indicating whether the Mobile Expense has an OCR image.
    boolean hasOCRReceipt?;
    # A link to the instance
    string href?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type FacetsModelReference FacetsModelReferenceInner[];

public type MultipleInstanceModelReference record {
    int total?;
    InstanceModelReference[] data?;
};

public type EntryType record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2001 record {
    ExpenseEntryServiceRepresentation[] data?;
    int total?;
};

# collection something or other
public type InlineResponse2002 record {
    ExpenseItemsServiceRepresentation[] data?;
    int total?;
};

public type Payee record {
    *InstanceModelReference;
};

public type ExpenseEntryStatus record {
    *InstanceModelReference;
};

# This object represents the possible facets for this resource
public type FacetsModelReferenceInner record {
    # A description of the facet
    string descriptor?;
    # The alias used to select the facet
    string facetParameter?;
    ItemValues[] values?;
};

public type ExpenseReport record {
    *InstanceModelReference;
};
