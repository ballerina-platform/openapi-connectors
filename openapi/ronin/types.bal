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
    http:CredentialsConfig auth;
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

# Estimates serve as proposals or quotes to be sent to Clients.
public type Estimate record {
    # Tax
    decimal tax?;
    # Invoice number
    string number?;
    # Total cost
    decimal total_cost?;
    # Subtotal
    decimal subtotal?;
    # Title
    string title?;
    # Tax label
    string tax_label?;
    # Compound tax
    boolean compound_tax?;
    # Invoice ID
    int id?;
    # Date
    string date;
    # Client ID
    int client_id?;
    # Note
    string note?;
    # Estimate items
    EstimateItem[] estimate_items?;
    # Secondary tax label
    string tax2_label?;
    # Summary
    string summary?;
    # Secondary tax
    decimal tax2?;
    # Status
    decimal status?;
    # Currency code
    string currency_code;
    # Tertiary tax label
    string tax3_label?;
    # Tertiary tax
    decimal tax3?;
    # Estimate items attributes. estimate_items_attributes.title, estimate_items_attributes.quantity, estimate_items_attributes.price must be provided if any items are added.
    EstimateItemAttribute[] estimate_items_attributes?;
};

# The data required to create a project.
public type CreateProjectRequest record {
    # Projects represent hubs of work, tasks, logged hours, expenses, and invoices related to a Client. budget_type can be 0 (total budgeted hours) or 1 (total budgeted amount). project_type can be 0 (hourly rate project) or 2 (fixed amount project). Rate the total cost of the project in the latter case.
    ProjectRequest project?;
};

# Tasks are TODO items that can be added to projects and assigned to staff members.
public type Task record {
    # Completed at
    string completed_at?;
    # Created at
    string created_at?;
    # The title of the task
    string title;
    # The assignee ID of the task
    int assignee_id?;
    # Updated at
    string updated_at?;
    # The project ID of the task
    int project_id?;
    # The task ID
    int id?;
    # The user ID
    int user_id?;
    # The client ID of the task
    int client_id?;
    # The due date of the task
    string due_date?;
    # The boolean flag to indicate that, task is completed or not
    boolean complete?;
    # The description
    string description?;
};

# Contacts represent individuals belonging to Clients. In many cases, if a Contact is a Client, the Contact is where the email and other important information for the client whereas the Client is just a shell container.
public type ContactRequest record {
    # The name of the contact
    string name;
    # The ext number of the contact
    string ext?;
    # The title of the contact
    string title?;
    # The ID of the client which the contact belongs
    int client_id?;
    # The mobile number of the contact
    string mobile?;
    # The phone number of the contact
    string phone?;
    # The avatar
    string avatar?;
    # The e-mail address of the contact
    string email;
};

# Ronin provides programmatic access to invoices and invoice items.
public type Invoice record {
    # Tax
    decimal tax?;
    # Invoice number
    string number?;
    # Total cost
    decimal total_cost?;
    # Balance
    decimal balance?;
    # Sub total
    decimal subtotal?;
    # Title
    string title?;
    # Tax label
    string tax_label?;
    # Compound tax
    boolean compound_tax?;
    # Invoice ID
    int id?;
    # Date
    string date;
    # Client ID
    int client_id?;
    # A note about payment
    string note?;
    # Due date
    string due_date;
    # Invoice items
    InvoiceItem[] invoice_items?;
    # Secondary tax label
    string? tax2_label?;
    # Summary
    string summary?;
    # Total payments
    decimal total_payments?;
    # Secondary tax
    decimal tax2?;
    # Status
    decimal status?;
    # PO
    string po?;
    # Currency code
    string currency_code;
    # Payments
    Payment[] payments?;
    # Tertiary tax label
    string? tax3_label?;
    # Tertiary tax
    decimal tax3?;
    # Invoice items attributes. invoice_item_attributes.title, invoice_item_attributes.quantity, invoice_item_attributes.price must be provided if any items are added.
    InvoiceItemAttribute[] invoice_items_attributes?;
};

# Invoice item
public type InvoiceItem record {
    # Price
    string|float price?;
    # Title
    string title?;
    # Quantity
    int quantity?;
    # Taxable
    boolean taxable?;
    # Invoice Item ID
    int id?;
};

# The data required to create an invoice.
public type CreateInvoiceRequest record {
    # Ronin provides programmatic access to invoices and invoice items.
    InvoiceRequest invoice?;
};

# Ronin provides programmatic access to invoices and invoice items.
public type InvoiceRequest record {
    # Tax
    decimal tax?;
    # Invoice number
    string number?;
    # Total cost
    decimal total_cost?;
    # Balance
    decimal balance?;
    # Sub total
    decimal subtotal?;
    # Title
    string title?;
    # Tax label
    string tax_label?;
    # Compound tax
    boolean compound_tax?;
    # Date
    string date;
    # Client ID
    int client_id?;
    # A note about payment
    string note?;
    # Due date
    string due_date;
    # Invoice items
    InvoiceItem[] invoice_items?;
    # Secondary tax label
    string tax2_label?;
    # Summary
    string summary?;
    # Total payments
    decimal total_payments?;
    # Secondary tax
    decimal tax2?;
    # Status
    decimal status?;
    # PO
    string po?;
    # Currency code
    string currency_code;
    # Payments
    Payment[] payments?;
    # Tertiary tax label
    string tax3_label?;
    # Tertiary tax
    decimal tax3?;
    # Invoice items attributes. invoice_item_attributes.title, invoice_item_attributes.quantity, invoice_item_attributes.price must be provided if any items are added.
    InvoiceItemAttribute[] invoice_items_attributes?;
};

# An object with a property projects which is an array of Project objects.
public type Projects record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Project objects.
    Project[] projects?;
};

# An object with a property invoices which is an array of Invoice objects.
public type Invoices record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Invoice objects.
    Invoice[] invoices?;
};

# Estimate item
public type EstimateItem record {
    # Price
    decimal price?;
    # Title
    string title?;
    # Quantity
    int quantity?;
    # Taxable
    boolean taxable?;
    # Estimate Item ID
    int id?;
};

# The data required to update a task.
public type UpdateTaskRequest record {
    # Tasks are TODO items that can be added to projects and assigned to staff members.
    TaskRequest task?;
};

# Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
public type ClientObject record {
    # The unique number for the client
    string? number?;
    # The name of the client
    string name?;
    # The city of the client
    string city?;
    # The address of the client
    string address?;
    # The zip code of the client
    string zip?;
    # The country of the client
    string country?;
    # Client ID
    int id?;
    # The website of the client
    string? website?;
    # The address2 of the client
    string? address_2?;
    # The description about the client
    string? description?;
    # The state of the client
    string state?;
};

# Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
public type ClientRequest record {
    # The unique number for the client
    string number?;
    # The name of the client
    string name;
    # The city of the client
    string city?;
    # The address of the client
    string address?;
    # The zip code of the client
    string zip?;
    # The country of the client
    string country?;
    # The website of the client
    string website?;
    # The address2 of the client
    string address_2?;
    # The description about the client
    string description?;
    # The state of the client
    string state?;
};

# An object with a property tasks which is an array of Task objects.
public type Tasks record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Task objects.
    Task[] tasks?;
};

# Tasks are TODO items that can be added to projects and assigned to staff members.
public type TaskRequest record {
    # Completed at
    string completed_at?;
    # Created at
    string created_at?;
    # The title of the task
    string title;
    # The assignee ID of the task
    int assignee_id?;
    # Updated at
    string updated_at?;
    # The project ID of the task
    int project_id?;
    # The user ID
    int user_id?;
    # The client ID of the task
    int client_id?;
    # The due date of the task
    string due_date?;
    # The boolean flag to indicate that, task is completed or not
    boolean complete?;
    # The description
    string description?;
};

# An object with a property clients which is an array of Client objects.
public type Clients record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Client objects.
    ClientObject[] clients?;
};

# An object with a property estimates which is an array of Estimate objects.
public type Estimates record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Estimate objects.
    Estimate[] Estimates?;
};

# Contacts represent individuals belonging to Clients. In many cases, if a Contact is a Client, the Contact is where the email and other important information for the client whereas the Client is just a shell container.
public type Contact record {
    # The name of the contact
    string name;
    # The ext number of the contact
    string ext?;
    # The title of the contact
    string title?;
    # Contact ID
    int id?;
    # The ID of the client which the contact belongs
    int client_id?;
    # The mobile number of the contact
    string mobile?;
    # The phone number of the contact
    string phone?;
    # The avatar
    string avatar?;
    # The e-mail address of the contact
    string email;
};

# The data required to create a contact.
public type CreateContactRequest record {
    # Contacts represent individuals belonging to Clients. In many cases, if a Contact is a Client, the Contact is where the email and other important information for the client whereas the Client is just a shell container.
    ContactRequest client_user?;
};

# Projects represent hubs of work, tasks, logged hours, expenses, and invoices related to a Client. budget_type can be 0 (total budgeted hours) or 1 (total budgeted amount). project_type can be 0 (hourly rate project) or 2 (fixed amount project). Rate the total cost of the project in the latter case.
public type Project record {
    # The unique identifier for the project
    string number?;
    # The name for the project
    string name;
    # The budget type of the project
    decimal budget_type?;
    # Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
    ClientObject 'client?;
    # The type of the project
    decimal project_type?;
    # Worked hours
    decimal worked_hours?;
    # The billing rate for the project
    decimal rate;
    # Unbilled hours
    decimal unbilled_hours?;
    # Project ID
    int id?;
    # Cost
    decimal cost?;
    # The description about the project
    string description?;
    # The status of the project
    decimal status?;
    # The end date of the project
    string end_date?;
    # The currency code of the project
    string currency_code?;
    # Budget
    decimal budget?;
};

# Estimates serve as proposals or quotes to be sent to Clients.
public type EstimateRequest record {
    # Tax
    decimal tax?;
    # Invoice number
    string number?;
    # Total cost
    decimal total_cost?;
    # Subtotal
    decimal subtotal?;
    # Title
    string title?;
    # Tax label
    string tax_label?;
    # Compound tax
    boolean compound_tax?;
    # Date
    string date;
    # Client ID
    int client_id?;
    # Note
    string note?;
    # Estimate items
    EstimateItem[] estimate_items?;
    # Secondary tax label
    string tax2_label?;
    # Summary
    string summary?;
    # Secondary tax
    decimal tax2?;
    # Status
    decimal status?;
    # Currency code
    string currency_code;
    # Tertiary tax label
    string tax3_label?;
    # Tertiary tax
    decimal tax3?;
    # Estimate items attributes. estimate_items_attributes.title, estimate_items_attributes.quantity, estimate_items_attributes.price must be provided if any items are added.
    EstimateItemAttribute[] estimate_items_attributes?;
};

# Payment details
public type Payment record {
    # Payment received on
    string received_on?;
    # Payment updated at
    string updated_at?;
    # Invoice ID
    int invoice_id?;
    # Payment amount
    decimal amount?;
    # Payment ID
    int id?;
    # Payment note
    string note?;
};

# Estimate item attribute
public type EstimateItemAttribute record {
    # Title
    string title?;
    # Quantity
    int quantity?;
    # Price
    decimal price?;
};

# An object with a property contacts which is an array of Contact objects.
public type Contacts record {
    # The page count
    int page_count?;
    # The page size
    int page_size?;
    # The total count
    int total_count?;
    # An array of Contact objects.
    Contact[] contacts?;
};

# The data required to create a task.
public type CreateTaskRequest record {
    # Tasks are TODO items that can be added to projects and assigned to staff members.
    TaskRequest task?;
};

# The data required to create a client.
public type CreateClientRequest record {
    # Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
    ClientRequest 'client?;
};

# Projects represent hubs of work, tasks, logged hours, expenses, and invoices related to a Client. budget_type can be 0 (total budgeted hours) or 1 (total budgeted amount). project_type can be 0 (hourly rate project) or 2 (fixed amount project). Rate the total cost of the project in the latter case.
public type ProjectRequest record {
    # The unique identifier for the project
    string number?;
    # The name for the project
    string name;
    # The budget type of the project
    decimal budget_type?;
    # Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
    ClientObject 'client?;
    # The type of the project
    decimal project_type?;
    # Worked hours
    decimal worked_hours?;
    # The billing rate for the project
    decimal rate;
    # Unbilled hours
    decimal unbilled_hours?;
    # Cost
    decimal cost?;
    # The description about the project
    string description?;
    # The status of the project
    decimal status?;
    # The end date of the project
    string end_date?;
    # The currency code of the project
    string currency_code?;
    # Budget
    decimal budget?;
};

# The data required to create an estimate.
public type CreateEstimateRequest record {
    # Estimates serve as proposals or quotes to be sent to Clients.
    EstimateRequest estimate?;
};

# Invoice item attribute
public type InvoiceItemAttribute record {
    # Title
    string title?;
    # Quantity
    int quantity?;
    # Price
    decimal price?;
};
