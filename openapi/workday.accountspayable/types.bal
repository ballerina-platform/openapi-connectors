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

public type StatutoryInvoiceType record {
    *InstanceModelReference;
};

public type ShipToAddress record {
    *InstanceModelReference;
};

public type Company record {
    *InstanceModelReference;
};

public type CreateAttachmentSummary record {
    # File length of the attachment.
    int fileLength?;
    ContentType contentType?;
    # File name of the attachment.
    @constraint:String {maxLength: 255}
    string fileName?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type HandlingCode record {
    *InstanceModelReference;
};

public type ContentType record {
    *InstanceModelReference;
};

public type InvoiceRequestSummary record {
    # The date when a request for a supplier invoice is created.
    string invoiceDate?;
    StatutoryInvoiceType statutoryInvoiceType?;
    # The reference number that is encoded with key payment information on the invoice request document.
    @constraint:String {maxLength: 140}
    string referenceNumber?;
    # Tax amount for the supplier invoice request.
    record {} taxAmount?;
    HandlingCode handlingCode?;
    Status status?;
    # The due date for payment for this Supplier Invoice Request. Example: If the payment terms are Net 30, the Due Date field is 30 days after the invoice date.
    string dueDate?;
    RemitToConnection remitToConnection?;
    PaymentTerms paymentTerms?;
    # The amount entered that should match the total of the line amounts.
    record {} controlTotalAmount?;
    # The memo for the supplier invoice request.
    string memo?;
    # The reference number provided by the supplier for the supplier invoice request.
    string suppliersInvoiceNumber?;
    Currency currency?;
    # The freight amount for the supplier invoice request.
    record {} freightAmount?;
    ShipToAddress shipToAddress?;
    ReferenceType referenceType?;
    # The unique number assigned to the Supplier Invoice Request at the time of creation.
    string requestNumber?;
    # The date the invoice was recieved
    string invoiceReceivedDate?;
    Requester requester?;
    Supplier supplier?;
    Company company?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type CurrencyEmbedded record {
    # The Reference ID to use for lookups within our Workday Web Services. For ~supervisory organizations~, this is also the 'Organization ID'
    string currencyID?;
    # A preview of the instance
    string descriptor?;
};

public type SpendCategory record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse200 record {
    InvoiceRequestSummary[] data?;
    int total?;
};

public type CreateInvoiceRequestSummary record {
    CurrencyInstanceModelRef currency?;
    Company company;
    # Tax amount for the supplier invoice request.
    record {} taxAmount?;
    Requester requester?;
    # The amount entered that should match the total of the line amounts.
    record {} controlTotalAmount?;
    PaymentTerms paymentTerms?;
    ReferenceType referenceType?;
    # The Supplier Invoice Request Lines for a Supplier Invoice Request.
    CreateLineSummary[] lines?;
    StatutoryInvoiceType statutoryInvoiceType?;
    # The reference number provided by the supplier for the supplier invoice request.
    string suppliersInvoiceNumber?;
    # The reference number that is encoded with key payment information on the invoice request document.
    @constraint:String {maxLength: 140}
    string referenceNumber?;
    # The date an invoice is received.
    string invoiceReceivedDate?;
    # Freight amount for the supplier invoice request.
    record {} freightAmount?;
    Supplier supplier;
    HandlingCode handlingCode?;
    ShipToAddress shipToAddress?;
    # The date when a request for a supplier invoice is created.
    string invoiceDate;
    # The memo for the Supplier Invoice Request.
    string memo?;
    RemitToConnection remitToConnection?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type PaymentTerms record {
    *InstanceModelReference;
};

public type LineSplitWorktagSummary record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type ItemTagSummary record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type ReferenceType record {
    *InstanceModelReference;
};

public type Item record {
    *InstanceModelReference;
};

public type Requester record {
    *InstanceModelReference;
};

public type SplitBy record {
    *InstanceModelReference;
};

public type Currency record {
    *CurrencyEmbedded;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string id;
    # A description of the instance
    string descriptor?;
    # A link to the instance
    string href?;
};

public type Supplier record {
    *InstanceModelReference;
};

public type ItemIdentifierSummary record {
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type LinesWorkTagSummary record {
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[] errors?;
};

public type Status record {
    *InstanceModelReference;
};

public type CurrencyInstanceModelRef record {
    *InstanceModelReference;
};

public type UnitOfMeasure record {
    *InstanceModelReference;
};

public type LineSplitSummary record {
    # The percentage specified for the Business Document Line distribution line split.
    int percent?;
    # True if the supplier invoice request line or line split are billable.
    boolean billable?;
    # The memo for a line split
    string memo?;
    # The quantity specified for the Business Document Line distribution line split.
    int quantity?;
    # The amount on the transaction line split. This value displays in the same currency as the business document.
    record {} amount?;
    # The accounting worktags for the line split.
    LineSplitWorktagSummary[] worktags?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type FacetsModelReference FacetsModelReferenceInner[];

public type MultipleInstanceModelReference record {
    int total?;
    InstanceModelReference[] data?;
};

public type AttachmentSummary record {
    # Type of the file extension for an attachment.
    string fileExtension?;
    # File length of the attachment
    int fileLength?;
    # File name of the attachment
    @constraint:String {maxLength: 255}
    string fileName?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type CreateLineSummary record {
    # The unit cost for the document line.
    record {} unitCost?;
    # The internal line memo for the supplier invoice request line.
    string internalMemo?;
    # The description of the item on the document line. This is a text-only value.
    string itemDescription?;
    # Accounting Worktags for Requisition. Used in REST API Only.
    LinesWorkTagSummary[] worktags?;
    # The supplier invoice lines that includes the splits for the requested instance.
    # 
    # Note: Splits occur on a Supplier Invoice when a user decides to divide a line into multiple lines. For instance, if someone has a line which has a quantity of 4 items and they select "Splits" and they may split that line into 2 (so there will now be 2 lines, each of which has a quantity of 2 items)
    LineSplitSummary[] splits?;
    # The order of the lines on a transaction. You can use this field to compare other transactions, such as supplier invoice matching events.
    string 'order?;
    # True if the supplier invoice request line or line split are billable.
    boolean billable?;
    SplitBy splitBy?;
    # The quantity on the transaction line. This value can have 20 integer places, is precise to 2 decimal places, and can be negative.
    int quantity?;
    # The extended amount for the document line.  Excludes extended amount on tax only invoices.
    record {} extendedAmount?;
    SpendCategory spendCategory?;
    UnitOfMeasure unitOfMeasure?;
    # The memo on the document line.
    string memo?;
    # The line type for supplier invoice request line.
    boolean serviceLine?;
    Item item?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type SubmitSupplierInvoiceRequest record {
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

# collection something or other
public type InlineResponse2001 record {
    ViewLineSummary[] data?;
    int total?;
};

public type ViewLineSummary record {
    # Gets the line type for supplier invoice request.
    string 'type?;
    # Contains list of Item Identifiers for Procurement Item on Business Document Line Distribution.
    ItemIdentifierSummary[] itemIdentifiers?;
    UnitOfMeasure unitOfMeasure?;
    # The internal line memo for the supplier invoice request line.
    string internalMemo?;
    # Splits for the Supplier Invoice Request Line instance.
    LineSplitSummary[] splits?;
    # The description of the item on the document line. This is a text-only value.
    string itemDescription?;
    # Returns true if the Supplier Invoice Request Line or Line Split is Billable.
    boolean billable?;
    # The unit cost for the document line.
    record {} unitCost?;
    # The extended amount for the document line.  Excludes Extended Amounts on Tax Only Invoices.
    record {} extendedAmount?;
    SpendCategory spendCategory?;
    # The memo on the document line.
    string memo?;
    # All item tags for a goods delivery run line's item
    ItemTagSummary[] itemTags?;
    Item item?;
    # The quantity on the transaction line. This value can have 20 integer places, is precise to 2 decimal places, and can be negative.
    int quantity?;
    # Accounting Worktags for Requisition. Used in REST API Only.
    LinesWorkTagSummary[] worktags?;
    SplitBy splitBy?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

# collection something or other
public type InlineResponse2002 record {
    AttachmentSummary[] data?;
    int total?;
};

public type RemitToConnection record {
    *InstanceModelReference;
};

# This object represents the possible facets for this resource
public type FacetsModelReferenceInner record {
    # A description of the facet
    string descriptor?;
    # The alias used to select the facet
    string facetParameter?;
    # the facet values
    record {
        # The number of instances returned by this facet
        int count?;
        # wid / id / reference id
        string id;
        # A description of the facet
        string descriptor?;
        # A link to the instance
        string href?;
    }[] values?;
};
