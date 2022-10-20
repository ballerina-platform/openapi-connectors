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

public type TaxobjectresponseResponse record {
    TaxobjectresponseResponseResult? result?;
};

public type PaymemtListResponse record {
    PaymemtlistresponseResponse? response?;
};

public type Invoice record {
    # ID of creator of invoice. 1 if business admin, other if created by e.g. a contractor
    int? ownerid?;
    # ID of associated estimate, 0 if none
    int? estimateid?;
    # Userid of user who sent the invoice, typically 1 for admin
    int? sentid?;
    # Invoice Status
    int? status?;
    # ID of object this invoice was generated from, 0 if none
    int? parent?;
    # Description of status shown in FreshBooks UI, one of ‘draft’, ‘created’, ‘sent’, ‘viewed’, or ‘outstanding’.
    string? display_status?;
    # One of retry, failed, or success
    string? autobill_status?;
    # description of payment status. One of ‘unpaid’, ‘partial’, ‘paid’, and ‘auto-paid’. See the v3_status table on this page for descriptions of each.
    string? payment_status?;
    # Describes status of last attempted payment
    string? last_order_status?;
    # Description of whether invoice has been disputed.
    string? dispute_status?;
    # description of deposits applied to invoice. One of ‘paid’, ‘unpaid’, ‘partial’, ‘none’, and ‘converted’.
    string? deposit_status?;
    # Whether this invoice has a credit card saved
    boolean? auto_bill?;
    # Description of Invoice Status, see V3 Status Table.
    string? v3_status?;
    # User-specified and visible invoice ID
    string? invoice_number?;
    # Unique-to-this-system client-ID
    int? customerid?;
    # Date invoice was created, YYYY-MM-DD format
    string? create_date?;
    # date invoice generated from object, null if it wasn’t, YYYY-MM-DD if it was
    string? generation_date?;
    # percent amount being discounted from the subtotal, decimal-string amount ranging from 0 to 100
    string? discount_value?;
    # Public note about discount
    string? discount_description?;
    # Reference number for address on invoice.
    string? po_number?;
    # (internal, deprecated) choice of rendering style
    string? template?;
    # Three-letter currency code for invoice
    string? currency_code?;
    # Two-letter language code, e.g. “en”
    string? language?;
    # Terms listed on invoice
    string? terms?;
    # Notes listed on invoice
    string? notes?;
    # First line of address on invoice
    string? address?;
    # Amount required as deposit, null if none
    InvoiceDepositAmount? deposit_amount?;
    # Percent of the invoice’s value required as a deposit
    string? deposit_percentage?;
    # Whether to send via ground mail
    boolean? gmail?;
    # Whether attachments on invoice are rendered
    boolean? show_attachments?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Street for address on invoice
    string? street?;
    # Second line of street for address on invoice.
    string? street2?;
    # City for address on invoice
    string? city?;
    # Province for address on invoice.
    string? province?;
    # Zip code for address on invoice
    string? code?;
    # Country for address on invoice
    string? country?;
    # Name of organization being invoiced.
    string? organization?;
    # First name of Client on invoice
    string? fname?;
    # Last name of client being invoiced
    string? lname?;
    # Value Added Tax name if provided
    string? vat_name?;
    # Value Added Tax number if provided
    string? vat_number?;
    # Number of days from creation that invoice is due. If not set, the due date will default to the date of issue.
    int? due_offset_days?;
    # Lines of the invoice
    InvoiceLines[]? lines?;
    # where invoice logo and styles are defined. See our postman collection for details.
    record {} presentation?;
    # Unique-to-this-system invoice ID
    int? invoiceid?;
    # Unique-to-this-system invoice ID, duplicate of invoiceid
    int? ID?;
    # Unique ID for system
    string? accounting_systemid?;
    # Unique ID for system, repeat of accounting_systemid
    string? accountid?;
    # Total amount of invoice. subfields - amount, code
    InvoiceAmount? amount?;
    # Subfields - amount and code
    InvoicePaid? paid?;
    # Subfields - amount, code
    InvoiceOutstanding? outstanding?;
    # Subfields - amount and code
    InvoiceDiscountTotal? discount_total?;
    # Time the invoice was created, YYYY-MM-DD HH:MM:SS format
    string? created_at?;
    # Name of organization being invoiced — denormalized from client
    string? current_organization?;
    # Date invoice was fully paid, YYYY-MM-DD format
    string? date_paid?;
    # Description of first line of invoice
    string? description?;
    # date invoice is marked as due by, YYYY-MM-DD format, calculated from due_offset_days. If due_offset_days is not set, it will default to the date of issue.
    string? due_date?;
    # Time invoice last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
};

public type PaymemtobjectresponseResponseResult record {
    Payment? payment?;
};

public type ExpensecategoryobjectresponseResponseResult record {
    ExpenseCategory? category?;
};

public type PaymemtCreateObject record {
    Payment? payment?;
};

# Amount paid on invoice
public type PaymentAmount record {
    # string-decimal amount
    string? amount?;
    # three-letter currency code
    string? code?;
};

public type TimeEntryCreate record {
    # True for entries that can be automatically added to an invoice
    boolean? billable?;
    # True for entries that have already been added to an invoice or manually marked as billed
    boolean? billed?;
    # The unique identifier of the client to be billed for this entry
    int? client_id?;
    # The length of time in seconds
    int? duration;
    # True if the time entry is not assigned to a client
    boolean? internal?;
    # False if the time entry is being created from a running timer
    boolean? is_logged;
    # A short description of the work being done during the time
    string? note?;
    # The unique identifier of the project worked on during the time
    int? project_id?;
    # The unique identifier of the project service worked on during the time
    int? service_id?;
    # The date/time in UTC when the work started
    string? started_at;
    # The unique identifier of the teammate or user logging the time entry
    int? identity_id?;
};

# Subfields - business_id, name, ID
public type ProjectServices record {
    # Unique ID for business
    int? business_id?;
    # The name of the service
    string? name?;
    # Service ID
    int? ID?;
};

public type Expense record {
    # ID of related expense category
    int? categoryid?;
    # String-decimal, note of percent to mark expense up
    string? markup_percent?;
    # ID of related project if applicable
    int? projectid?;
    # ID of related client if applicable
    int? clientid?;
    # tax amount – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount1
    string|decimal? taxPercent1?;
    # Name of first tax
    string? taxName1?;
    # string-decimal tax amount for second tax – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount2
    string? taxPercent2?;
    # Name of second tax
    string? taxName2?;
    # True/false is duplicated expense
    boolean? isduplicate?;
    # ID of related profile if applicable
    int? profileid?;
    # Name of related account if applicable
    string? account_name?;
    # ID of related transaction if applicable
    int? transactionid?;
    # ID of related invoice if applicable
    int? invoiceid?;
    # Duplicate of expenseid
    int? ID?;
    # The total for first tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount1? taxAmount1?;
    # The total for second tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount2? taxAmount2?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Expense status
    int? status?;
    # Name of bank expense was imported from, if applicable
    string? bank_name?;
    # Time invoice last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Name of vendor
    string? vendor?;
    # ID of related contractor system if applicable
    int? ext_systemid?;
    # ID of related staff member if applicable
    int? staffid?;
    # Date of expense, YYYY-MM-DD format
    string? date?;
    # True/false has receipt attached
    boolean? has_receipt?;
    # Unique ID for system
    string? accounting_systemid?;
    # (internal) ID for related background job if applicable
    int? background_jobid?;
    # Notes about expense
    string? notes?;
    # ID of related contractor invoice if applicable
    int? ext_invoiceid?;
    # Total amount of the expense
    ExpensecreateAmount? amount?;
    # Unique to this business ID for expense
    int? expenseid?;
    # ID of expense account if applicable
    int? accountid?;
};

public type ExpensecategorylistresponseResponseResult record {
    ExpenseCategory[]? categories?;
};

public type TaxCreate record {
    # Unique identifier of business tax exists on
    string? 'accounting\ \_systemid?;
    # Date object was last updated, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Identifiable name for your tax, e.g. “GST”
    string? name;
    # An external number that identifies your tax submission
    string? number?;
    # Unique identifier of this tax within this business
    int? taxid?;
    # String-decimal representing percentage value of tax
    decimal? amount?;
    # Compound taxes are calculated on top of primary taxes
    boolean? compound?;
    # Unique ID to look this tax up later
    int? ID?;
};

public type InvoicelistresponseResponse record {
    InvoicelistresponseResponseResult? result?;
};

public type EstimateListResponse record {
    EstimatelistresponseResponse? response?;
};

# amount total of an invoice line, calculated with unit cost, quantity and tax. subfields - amount and code
public type InvoicelinesAmount record {
    # Amount of invoice line item account, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type ExpenseobjectresponseResponse record {
    ExpenseobjectresponseResponseResult? result?;
};

public type TaxUpdate record {
    # Unique identifier of business tax exists on
    string? 'accounting\ \_systemid?;
    # Date object was last updated, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Identifiable name for your tax, e.g. “GST”
    string? name;
    # An external number that identifies your tax submission
    string? number?;
    # Unique identifier of this tax within this business
    int? taxid?;
    # String-decimal representing percentage value of tax
    decimal? amount?;
    # Compound taxes are calculated on top of primary taxes
    boolean? compound?;
    # Unique ID to look this tax up later
    int? ID?;
};

public type InvoiceUpdateObject record {
    InvoiceUpdate? invoice?;
};

public type TimeEntryUpdate record {
    # True for entries that can be automatically added to an invoice
    boolean? billable?;
    # True for entries that have already been added to an invoice or manually marked as billed
    boolean? billed?;
    # The unique identifier of the client to be billed for this entry
    int? client_id?;
    # The length of time in seconds
    int? duration?;
    # True if the time entry is not assigned to a client
    boolean? internal?;
    # False if the time entry is being created from a running timer
    boolean? is_logged?;
    # A short description of the work being done during the time
    string? note?;
    # The unique identifier of the project worked on during the time
    int? project_id?;
    # The unique identifier of the project service worked on during the time
    int? service_id?;
    # The date/time in UTC when the work started
    string? started_at?;
    # The unique identifier of the teammate or user logging the time entry
    int? identity_id?;
};

public type ExpenselistresponseResponseResult record {
    Expense[]? expenses?;
};

public type TimeEntryObjectResponse record {
    TimeEntry? time_entry?;
};

public type ClientCreate record {
    # First name
    string? fname?;
    # Last name
    string? lname?;
    # Email address
    string? email?;
    # Name for client’s business
    string? organization?;
    # Value Added Tax name
    string? vat_name?;
    # Value Added Tax number
    string? vat_number?;
    # Status
    boolean? status?;
    # Notes kept by admin about client
    string? note?;
    # Home phone number
    string? home_phone?;
    # Duplicate of ID
    int? userid?;
    # Source
    string? 'source?;
    # Highlight string
    string? highlight_string?;
    # Billing city
    string? p_city?;
    # Billing postal code
    string? p_code?;
    # Billing country
    string? p_country?;
    # Billing province
    string? p_province?;
    # Billing street address
    string? p_street?;
    # Billing street address second part
    string? p_street2?;
    # Three letter shortcode for preferred currency
    string? currency_code?;
    # Shortcode indicating user language e.g. “en”
    string? language?;
    # Last client activity action
    string? last_activity?;
    # Face
    string? face?;
    # Late fee
    string? late_fee?;
    anydata[]? late_reminders?;
    Contact[]? contacts?;
};

public type Project record {
    # Date of projected completion.
    string? due_date?;
    # used for flat-rate projects. Represents the amount being charged to the client for the project
    string? fixed_price?;
    # Subfields - pending_invitations, ID, members
    ProjectGroup? group?;
    # Description of project
    string? description?;
    # Whether the project is completed or not
    boolean? complete?;
    # The project’s title
    string? title?;
    # Type of project - fixed_price, hourly_rate
    string? project_type?;
    # Budget for project
    int? budget?;
    # The time the project was last updated
    string? updated_at?;
    # Subfields - business_id, name, ID
    ProjectServices? services?;
    # The hourly rate of the project. Only applies to hourly_rate projects
    string? rate?;
    # Unique ID of the client being billed for the project
    int? client_id?;
    # The date/time the project was created
    string? created_at?;
    # The time logged for the project in seconds
    int? logged_duration?;
    # Unique ID for the project
    int? ID?;
    # The method of payment for the project
    string? billing_method?;
    # clarifies that the project is internally within the company (client is the company)
    boolean? internal?;
};

public type TaxObjectResponse record {
    TaxobjectresponseResponse? response?;
};

public type EstimateobjectresponseResponseResult record {
    Estimate? estimate?;
};

public type ExpenseCategoryObjectResponse record {
    ExpensecategoryobjectresponseResponse? response?;
};

public type ExpenseobjectresponseResponseResult record {
    Expense? expense?;
};

public type ClientobjectresponseResponse record {
    ClientobjectresponseResponseResult? result?;
};

public type EstimatelistresponseResponseResult record {
    Estimate[]? estimates?;
    # Record count per page
    int? per_page?;
    # Total records
    int? total?;
    # Number of pages
    int? pages?;
    # Page
    int? page?;
};

public type TimeEntryCreateObject record {
    TimeEntryCreate? time_entry?;
};

public type Estimate record {
    # Unique-to-this-system estimate ID
    int? estimateid?;
    # Unique-to-this-system estimate ID, duplicate of estimateid
    int? ID?;
    # Unique ID for system
    string? accounting_systemid?;
    # UI status fields give a descriptive name to states which can be used in filters, and apply to many invoices, estimates, and recurring profiles
    string? ui_status?;
    # Estimate status
    int? status?;
    # Total amount of estimate, to two decimal places
    EstimateAmount? amount?;
    # Zip code for address on estimate
    string? code?;
    # Subfields - Amount and code
    EstimateupdateDiscountTotal? discount_total?;
    # Description of first line of estimate
    string? description?;
    # Name of organization being estimated — denormalized from client
    string? current_organization?;
    # Indicator of whether this estimate has been converted to an invoice that was sent
    boolean? invoiced?;
    # ID of creator of estimate. 1 if business admin, other if created by e.g. a contractor
    int? ownerid?;
    # Userid of user who sent the estimate, typically 1 for admin
    int? sentid?;
    # Time the estimate was created, YYYY-MM-DD HH:MM:SS format
    string? created_at?;
    # Time estimate last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Description of status shown in FreshBooks UI, one of ‘draft’, ‘sent’, or ‘viewed’
    string? display_status?;
    # User-specified and visible estimate ID
    string? estimate_number?;
    # Unique-to-this-system client-ID
    int? customerid?;
    # Date estimate was created, YYYY-MM-DD format
    string? create_date?;
    # Decimal-string amount
    string? discount_value?;
    # Post Office box number for address on estimate
    string? po_number?;
    # Three-letter currency code for estimate
    string? currency_code?;
    # Two-letter language code, e.g. “en”
    string? language?;
    # Terms listed on estimate
    string? terms?;
    # Notes listed on estimate
    string? notes?;
    # First line of address on estimate
    string? address?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Street for address on estimate
    string? street?;
    # Second line of street for address on estimate
    string? street2?;
    # City for address on estimate
    string? city?;
    # Province for address on estimate
    string? province?;
    # Country for address on estimate
    string? country?;
    # Name of organization being estimated
    string? organization?;
    # First name of Client on estimate
    string? fname?;
    # Last name of client being estimated
    string? lname?;
    # Value Added Tax name if provided
    string? vat_name?;
    # Value Added Tax number if provided
    string? vat_number?;
    # Lines of the estimate
    EstimateLines[]? lines?;
};

public type ExpenseUpdate record {
    # ID of related expense category
    int? categoryid?;
    # String-decimal, note of percent to mark expense up
    string? markup_percent?;
    # ID of related project if applicable
    int? projectid?;
    # ID of related client if applicable
    int? clientid?;
    # tax amount – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount1
    string|decimal? taxPercent1?;
    # Name of first tax
    string? taxName1?;
    # string-decimal tax amount for second tax – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount2
    string? taxPercent2?;
    # Name of second tax
    string? taxName2?;
    # True/false is duplicated expense
    boolean? isduplicate?;
    # ID of related profile if applicable
    int? profileid?;
    # Name of related account if applicable
    string? account_name?;
    # ID of related transaction if applicable
    int? transactionid?;
    # ID of related invoice if applicable
    int? invoiceid?;
    # Duplicate of expenseid
    int? ID?;
    # The total for first tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount1? taxAmount1?;
    # The total for second tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount2? taxAmount2?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Expense statuses are not directly modifiable. Each is a description of the status of the expense
    int? status?;
    # Name of bank expense was imported from, if applicable
    string? bank_name?;
    # Time invoice last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Name of vendor
    string? vendor?;
    # ID of related contractor system if applicable
    int? ext_systemid?;
    # ID of related staff member if applicable
    int? staffid?;
    # Date of expense, YYYY-MM-DD format
    string? date?;
    # True/false has receipt attached
    boolean? has_receipt?;
    # Unique ID for system
    string? accounting_systemid?;
    # (internal) ID for related background job if applicable
    int? background_jobid?;
    # Notes about expense
    string? notes?;
    # ID of related contractor invoice if applicable
    int? ext_invoiceid?;
    # Total amount of the expense
    ExpensecreateAmount? amount?;
    # Unique to this business ID for expense
    int? expenseid?;
    # ID of expense account if applicable
    int? accountid?;
};

public type ExpenselistresponseResponse record {
    ExpenselistresponseResponseResult? result?;
};

public type InvoiceLinesWritable record {
    # invoice line type, 0 for normal invoice line, 1 for rebilling expense line
    int? 'type?;
    # ID of unbilled expense, required when invoice line type is 1, otherwise should be excluded
    int? expenseid?;
    # Quantity of the invoice line unit, multiplied against unit_cost
    int? qty?;
    # Unit cost of the line item. subfields - amount and code
    InvoicelinesUnitCost? unit_cost?;
    # Description for the invoice line item
    string? description?;
    # Name for the invoice line item
    string? name?;
    # Name for the first tax on the invoice line
    string? taxName1?;
    # First tax amount, in percentage, up to 3 decimal places
    string? taxAmount1?;
    # Name for the second tax on the invoice line
    string? taxName2?;
    # Second tax amount, in percentage, up to 3 decimal places
    string? taxAmount2?;
};

# Amount required as deposit, null if none
public type InvoiceDepositAmount record {
    # Total amount of invoice, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

# subfields - first_name, last_name, role, identity_id, active, company, ID, email
public type ProjectGroupMembers record {
    # First name of the identity
    string? first_name?;
    # Last name of the identity
    string? last_name?;
    # Named role identity holds in group
    string? role?;
    # The unique ID for the identity
    int? identity_id?;
    # Whether the project is active or not
    boolean? active?;
    # The name of the business
    string? company?;
    # Unique ID for the membership
    int? ID?;
    # Email of identity
    string? email?;
};

public type EstimateLinesWritable record {
    # Estimate line type, 0 for normal estimate line
    int? 'type?;
    # Quantity of the estimate line unit, multiplied against unit_cost
    int? qty?;
    # Unit cost of the line item. subfields - amount and code
    InvoicelinesUnitCost? unit_cost?;
    # Description for the estimate line item
    string? description?;
    # Name for the estimate line item
    string? name?;
    # Name for the first tax on the estimate line
    string? taxName1?;
    # First tax amount, in percentage, up to 3 decimal places
    string? taxAmount1?;
    # Name for the second tax on the estimate line
    string? taxName2?;
    # Second tax amount, in percentage, up to 3 decimal places
    string? taxAmount2?;
};

# Unit cost of the line item. subfields - amount and code
public type InvoicelinesUnitCost record {
    # Unit cost amount, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type EstimateUpdate record {
    # Unique-to-this-system estimate ID
    int? estimateid?;
    # Unique-to-this-system estimate ID, duplicate of estimateid
    int? ID?;
    # Unique ID for system
    string? accounting_systemid?;
    # See Estimate UI Status table
    string? ui_status?;
    # See Estimate Status table
    string? status?;
    # Amount total of an estimate line, calculated with unit cost, quantity and tax. subfields - amount and code
    EstimateupdateAmount? amount?;
    # Subfields - Amount and code
    EstimateupdateDiscountTotal? discount_total?;
    # Description of first line of estimate
    string? description?;
    # Name of organization being estimated — denormalized from client
    string? current_organization?;
    # Indicator of whether this estimate has been converted to an invoice that was sent
    boolean? invoiced?;
    # ID of creator of estimate. 1 if business admin, other if created by e.g. a contractor
    int? ownerid?;
    # Userid of user who sent the estimate, typically 1 for admin
    int? sentid?;
    # Time the estimate was created, YYYY-MM-DD HH:MM:SS format
    string? created_at?;
    # Time estimate last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Description of status shown in FreshBooks UI, one of ‘draft’, ‘sent’, or ‘viewed’
    string? display_status?;
    # User-specified and visible estimate ID
    string? estimate_number?;
    # Unique-to-this-system client-ID
    int? customerid;
    # Date estimate was created, YYYY-MM-DD format
    string? create_date;
    # Decimal-string amount
    string? discount_value?;
    # Post Office box number for address on estimate
    string? po_number?;
    # Three-letter currency code for estimate
    string? currency_code?;
    # Two-letter language code, e.g. “en”
    string? language?;
    # Terms listed on estimate
    string? terms?;
    # Notes listed on estimate
    string? notes?;
    # First line of address on estimate
    string? address?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Street for address on estimate
    string? street?;
    # Second line of street for address on estimate
    string? street2?;
    # City for address on estimate
    string? city?;
    # Province for address on estimate
    string? province?;
    # Country for address on estimate
    string? country?;
    # Name of organization being estimated
    string? organization?;
    # First name of Client on estimate
    string? fname?;
    # Last name of client being estimated
    string? lname?;
    # Value Added Tax name if provided
    string? vat_name?;
    # Value Added Tax number if provided
    string? vat_number?;
    # Lines of the estimate
    EstimateLinesWritable[]? lines?;
};

public type ExpenseObjectResponse record {
    ExpenseobjectresponseResponse? response?;
};

public type TimeentrylistresponseResponse record {
    TimeentrylistresponseResponseResult? result?;
};

public type TaxlistresponseResponseResult record {
    Tax[]? taxes?;
};

# Subfields - amount, code
public type InvoiceOutstanding record {
    # Amount outstanding on invoice, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type InvoiceUpdate record {
    # ID of creator of invoice. 1 if business admin, other if created by e.g. a contractor
    int? ownerid?;
    # ID of associated estimate, 0 if none
    int? estimateid?;
    # Userid of user who sent the invoice, typically 1 for admin
    int? sentid?;
    # See Invoice Status table.
    string? status?;
    # ID of object this invoice was generated from, 0 if none
    int? parent?;
    # Description of status shown in FreshBooks UI, one of ‘draft’, ‘created’, ‘sent’, ‘viewed’, or ‘outstanding’.
    string? display_status?;
    # One of retry, failed, or success
    string? autobill_status?;
    # description of payment status. One of ‘unpaid’, ‘partial’, ‘paid’, and ‘auto-paid’. See the v3_status table on this page for descriptions of each.
    string? payment_status?;
    # Describes status of last attempted payment
    string? last_order_status?;
    # Description of whether invoice has been disputed.
    string? dispute_status?;
    # description of deposits applied to invoice. One of ‘paid’, ‘unpaid’, ‘partial’, ‘none’, and ‘converted’.
    string? deposit_status?;
    # Whether this invoice has a credit card saved
    boolean? auto_bill?;
    # Description of Invoice Status, see V3 Status Table.
    string? v3_status?;
    # User-specified and visible invoice ID
    string? invoice_number?;
    # Unique-to-this-system client-ID
    int? customerid?;
    # Date invoice was created, YYYY-MM-DD format
    string? create_date?;
    # date invoice generated from object, null if it wasn’t, YYYY-MM-DD if it was
    string? generation_date?;
    # percent amount being discounted from the subtotal, decimal-string amount ranging from 0 to 100
    string? discount_value?;
    # Public note about discount
    string? discount_description?;
    # Reference number for address on invoice.
    string? po_number?;
    # (internal, deprecated) choice of rendering style
    string? template?;
    # Three-letter currency code for invoice
    string? currency_code?;
    # Two-letter language code, e.g. “en”
    string? language?;
    # Terms listed on invoice
    string? terms?;
    # Notes listed on invoice
    string? notes?;
    # First line of address on invoice
    string? address?;
    # Amount required as deposit, null if none
    InvoiceDepositAmount? deposit_amount?;
    # Percent of the invoice’s value required as a deposit
    string? deposit_percentage?;
    # Whether to send via ground mail
    boolean? gmail?;
    # Whether attachments on invoice are rendered
    boolean? show_attachments?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Street for address on invoice
    string? street?;
    # Second line of street for address on invoice.
    string? street2?;
    # City for address on invoice
    string? city?;
    # Province for address on invoice.
    string? province?;
    # Zip code for address on invoice
    string? code?;
    # Country for address on invoice
    string? country?;
    # Name of organization being invoiced.
    string? organization?;
    # First name of Client on invoice
    string? fname?;
    # Last name of client being invoiced
    string? lname?;
    # Value Added Tax name if provided
    string? vat_name?;
    # Value Added Tax number if provided
    string? vat_number?;
    # Number of days from creation that invoice is due. If not set, the due date will default to the date of issue.
    int? due_offset_days?;
    # Lines of the invoice
    InvoiceLinesWritable[]? lines?;
    # where invoice logo and styles are defined. See our postman collection for details.
    record {} presentation?;
};

public type TaxobjectresponseResponseResult record {
    Project? tax?;
};

public type InvoiceLines record {
    # Unique-to-this-invoice line ID
    int? lineid?;
    # amount total of an invoice line, calculated with unit cost, quantity and tax. subfields - amount and code
    InvoicelinesAmount? amount?;
    # Time invoice line last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # invoice line type, 0 for normal invoice line, 1 for rebilling expense line
    int? 'type?;
    # ID of unbilled expense, required when invoice line type is 1, otherwise should be excluded
    int? expenseid?;
    # Quantity of the invoice line unit, multiplied against unit_cost
    int? qty?;
    # Unit cost of the line item. subfields - amount and code
    InvoicelinesUnitCost? unit_cost?;
    # Description for the invoice line item
    string? description?;
    # Name for the invoice line item
    string? name?;
    # Name for the first tax on the invoice line
    string? taxName1?;
    # First tax amount, in percentage, up to 3 decimal places
    string? taxAmount1?;
    # Name for the second tax on the invoice line
    string? taxName2?;
    # Second tax amount, in percentage, up to 3 decimal places
    string? taxAmount2?;
};

public type EstimateObjectResponse record {
    EstimateobjectresponseResponse? response?;
};

public type TaxCreateObject record {
    TaxCreate? tax?;
};

public type ExpenseUpdateObject record {
    ExpenseUpdate? expense?;
};

public type PaymemtlistresponseResponse record {
    PaymemtlistresponseResponseResult? result?;
};

public type TimeEntryListResponse record {
    TimeentrylistresponseResponse? response?;
};

# Subfields - pending_invitations, ID, members
public type ProjectGroup record {
    # the pending invites to employees and contractors within the project
    string[]? pending_invitations?;
    # Unique ID of group membership
    int? ID?;
    # subfields - first_name, last_name, role, identity_id, active, company, ID, email
    ProjectGroupMembers? members?;
};

# Subfields - amount and code
public type InvoicePaid record {
    # Amount paid on invoice, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type ProjectCreate record {
    # Date of projected completion.
    string? due_date?;
    # used for flat-rate projects. Represents the amount being charged to the client for the project
    string? fixed_price?;
    # Subfields - pending_invitations, ID, members
    ProjectGroup? group?;
    # Description of project
    string? description?;
    # Whether the project is completed or not
    boolean? complete?;
    # The project’s title
    string? title;
    # Type of project - fixed_price, hourly_rate
    string? project_type?;
    # Budget for project
    int? budget?;
    # The time the project was last updated
    string? updated_at?;
    # Subfields - business_id, name, ID
    ProjectServices? services?;
    # The hourly rate of the project. Only applies to hourly_rate projects
    string? rate?;
    # Unique ID of the client being billed for the project
    int? client_id?;
    # The date/time the project was created
    string? created_at?;
    # The time logged for the project in seconds
    int? logged_duration?;
    # Unique ID for the project
    int? ID?;
    # The method of payment for the project
    string? billing_method?;
    # clarifies that the project is internally within the company (client is the company)
    boolean? internal?;
};

public type InvoiceobjectresponseResponse record {
    InvoiceobjectresponseResponseResult? result?;
};

public type Tax record {
    # Unique identifier of business tax exists on
    string? 'accounting\ \_systemid?;
    # Date object was last updated, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Identifiable name for your tax, e.g. “GST”
    string? name?;
    # An external number that identifies your tax submission
    string? number?;
    # Unique identifier of this tax within this business
    int? taxid?;
    # String-decimal representing percentage value of tax
    decimal? amount?;
    # Compound taxes are calculated on top of primary taxes
    boolean? compound?;
    # Unique ID to look this tax up later
    int? ID?;
};

public type InvoiceobjectresponseResponseResult record {
    Invoice? invoice?;
};

public type ProjectCreateObject record {
    ProjectCreate? project?;
};

public type ClientListResponse record {
    ClientlistresponseResponse? response?;
};

public type ClientCreateObject record {
    ClientCreate? 'client?;
};

public type ExpensecategorylistresponseResponse record {
    ExpensecategorylistresponseResponseResult? result?;
};

public type ClientlistresponseResponse record {
    ClientlistresponseResponseResult? result?;
};

# The total for second tax applied to the subtotal amount of the expense
public type ExpensecreateTaxamount2 record {
    # String-decimal amount
    string? amount?;
    # 3-letter currency code
    string? code?;
};

# The total for first tax applied to the subtotal amount of the expense
public type ExpensecreateTaxamount1 record {
    # String-decimal amount
    string? amount?;
    # 3-letter currency code
    string? code?;
};

public type ExpenseCreate record {
    # ID of related expense category
    int? categoryid;
    # String-decimal, note of percent to mark expense up
    string? markup_percent?;
    # ID of related project if applicable
    int? projectid?;
    # ID of related client if applicable
    int? clientid?;
    # tax amount – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount1
    string|decimal? taxPercent1?;
    # Name of first tax
    string? taxName1?;
    # string-decimal tax amount for second tax – indicates the maximum tax percentage for this expense, this does not add tax to the expense, instead use taxAmount2
    string? taxPercent2?;
    # Name of second tax
    string? taxName2?;
    # True/false is duplicated expense
    boolean? isduplicate?;
    # ID of related profile if applicable
    int? profileid?;
    # Name of related account if applicable
    string? account_name?;
    # ID of related transaction if applicable
    int? transactionid?;
    # ID of related invoice if applicable
    int? invoiceid?;
    # Duplicate of expenseid
    int? ID?;
    # The total for first tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount1? taxAmount1?;
    # The total for second tax applied to the subtotal amount of the expense
    ExpensecreateTaxamount2? taxAmount2?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Expense statuses are not directly modifiable. Each is a description of the status of the expense
    int? status?;
    # Name of bank expense was imported from, if applicable
    string? bank_name?;
    # Time invoice last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Name of vendor
    string? vendor?;
    # ID of related contractor system if applicable
    int? ext_systemid?;
    # ID of related staff member if applicable
    int? staffid;
    # Date of expense, YYYY-MM-DD format
    string? date;
    # True/false has receipt attached
    boolean? has_receipt?;
    # Unique ID for system
    string? accounting_systemid?;
    # (internal) ID for related background job if applicable
    int? background_jobid?;
    # Notes about expense
    string? notes?;
    # ID of related contractor invoice if applicable
    int? ext_invoiceid?;
    # Total amount of the expense
    ExpensecreateAmount? amount;
    # Unique to this business ID for expense
    int? expenseid?;
    # ID of expense account if applicable
    int? accountid?;
};

public type ClientObject record {
    # Allow late notifications
    boolean? allow_late_notifications?;
    # Unique identifier of business client exists on
    string? accounting_systemid?;
    # Business phone number
    string? bus_phone?;
    # Description of industry client is in
    string? company_industry?;
    # Size of client’s company
    string? company_size?;
    # Three letter shortcode for preferred currency
    string? currency_code?;
    # Email address
    string? email?;
    # Fax number
    string? fax?;
    # First name
    string? fname?;
    # Home phone number
    string? home_phone?;
    # Unique to this business ID for client
    int? ID?;
    # Shortcode indicating user language e.g. “en”
    string? language?;
    # Last client activity action
    string? last_activity?;
    # Last login time
    string? last_login?;
    # Last name
    string? lname?;
    # Mobile phone number
    string? mob_phone?;
    # Notes kept by admin about client
    string? note?;
    # Number of logins
    int? num_logins?;
    # Name for client’s business
    string? organization?;
    # Billing city
    string? p_city?;
    # Billing postal code
    string? p_code?;
    # Billing country
    string? p_country?;
    # Billing province
    string? p_province?;
    # Billing street address
    string? p_street?;
    # Billing street address second part
    string? p_street2?;
    # Prefers email over ground mail
    boolean? pref_email?;
    # Prefers ground mail over email
    boolean? pref_gmail?;
    # Shipping address city
    string? s_city?;
    # Shipping postal code
    string? s_code?;
    # Shipping country
    string? s_country?;
    # Short form for province
    string? s_province?;
    # Shipping street address
    string? s_street?;
    # Shipping address second street info
    string? s_street2?;
    # Time of user signup
    string? signup_date?;
    # Unused in the new FreshBooks
    string? subdomain?;
    # Time of last modification to resource
    string? updated?;
    # Duplicate of ID
    int? userid?;
    # Value Added Tax name
    string? vat_name?;
    # Value Added Tax number
    string? vat_number?;
    # “visibility state”, active, deleted, or archived
    int? vis_state?;
};

# Total amount of the expense
public type ExpensecreateAmount record {
    # String-decimal amount of the expense
    string? amount?;
    # 3-letter currency code
    string? code?;
};

public type EstimateUpdateObject record {
    EstimateUpdate? estimate?;
};

public type TaxListResponse record {
    TaxlistresponseResponse? response?;
};

public type ProjectObjectResponse record {
    Project? project?;
};

public type TimeEntryUpdateObject record {
    TimeEntryUpdate? time_entry?;
};

public type ExpensecategoryobjectresponseResponse record {
    ExpensecategoryobjectresponseResponseResult? result?;
};

public type ExpenseCategoryListResponse record {
    ExpensecategorylistresponseResponse? response?;
};

public type PaymemtlistresponseResponseResult record {
    Payment[]? payments?;
};

public type Payment record {
    # Unique identifier of business client exists on
    string? 'accounting\ \_systemid?;
    # Amount paid on invoice
    PaymentAmount? amount?;
    int? bulk_paymentid?;
    # ID of client who made the payment
    int? clientid?;
    # ID of related credit
    int? creditid?;
    # Date the payment was made, YYYY-MM-DD format
    string? date?;
    # Whether or not the payment was converted from a Credit on a Client’s account
    boolean? from_credit?;
    # The payment processor used, if any
    string? gateway?;
    # Unique ID (across this business) for payment
    int? ID?;
    # ID of related invoice
    int? invoiceid;
    # Duplicate of ID
    int? logid?;
    # Notes on payment, often used for credit card reference number
    string? note?;
    # ID of related orderid
    int? orderid?;
    # ID of related overpayment if relevant
    int? overpaymentid?;
    # Whether to send the client a notification of this payment
    boolean? send_client_notification?;
    # Transaction ID
    int? transactionid?;
    # “Check”, “Credit”, “Cash”, etc.
    string? 'type?;
    # Date payment was last updated, YYYY-MM-DD
    string? updated?;
    # 0 for active, 1 for deleted
    int? vis_state?;
};

public type TimeEntry record {
    # True for entries that can be automatically added to an invoice
    boolean? billable?;
    # True for entries that have already been added to an invoice or manually marked as billed
    boolean? billed?;
    # The unique identifier of the client to be billed for this entry
    int? client_id?;
    # The length of time in seconds
    int? duration?;
    # True if the time entry is not assigned to a client
    boolean? internal?;
    # False if the time entry is being created from a running timer
    boolean? is_logged?;
    # A short description of the work being done during the time
    string? note?;
    # The unique identifier of the project worked on during the time
    int? project_id?;
    # The unique identifier of the project service worked on during the time
    int? service_id?;
    # The date/time in UTC when the work started
    string? started_at?;
    # The unique identifier of the teammate or user logging the time entry
    int? identity_id?;
};

public type ExpenseListResponse record {
    ExpenselistresponseResponse? response?;
};

# Subfields - Amount and code
public type EstimateupdateDiscountTotal record {
    # Unit cost amount, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type TimeentrylistresponseResponseResult record {
    TimeEntry[]? time_entries?;
};

# Total amount of invoice. subfields - amount, code
public type InvoiceAmount record {
    # Total amount of invoice, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type TaxUpdateObject record {
    TaxUpdate? tax?;
};

public type InvoiceListResponse record {
    InvoicelistresponseResponse? response?;
};

public type ClientlistresponseResponseResult record {
    ClientObject[]? clients?;
    # Record count per page
    int? per_page?;
    # Total records
    int? total?;
    # Number of pages
    int? pages?;
    # Page
    int? page?;
};

public type InvoiceCreateObject record {
    InvoiceCreate? invoice?;
};

public type InvoiceCreate record {
    # ID of creator of invoice. 1 if business admin, other if created by e.g. a contractor
    int? ownerid?;
    # ID of associated estimate, 0 if none
    int? estimateid?;
    # Userid of user who sent the invoice, typically 1 for admin
    int? sentid?;
    # See Invoice Status table.
    string? status?;
    # ID of object this invoice was generated from, 0 if none
    int? parent?;
    # Description of status shown in FreshBooks UI, one of ‘draft’, ‘created’, ‘sent’, ‘viewed’, or ‘outstanding’.
    string? display_status?;
    # One of retry, failed, or success
    string? autobill_status?;
    # description of payment status. One of ‘unpaid’, ‘partial’, ‘paid’, and ‘auto-paid’. See the v3_status table on this page for descriptions of each.
    string? payment_status?;
    # Describes status of last attempted payment
    string? last_order_status?;
    # Description of whether invoice has been disputed.
    string? dispute_status?;
    # description of deposits applied to invoice. One of ‘paid’, ‘unpaid’, ‘partial’, ‘none’, and ‘converted’.
    string? deposit_status?;
    # Whether this invoice has a credit card saved
    boolean? auto_bill?;
    # Description of Invoice Status, see V3 Status Table.
    string? v3_status?;
    # User-specified and visible invoice ID
    string? invoice_number?;
    # Unique-to-this-system client-ID
    int? customerid;
    # Date invoice was created, YYYY-MM-DD format
    string? create_date;
    # date invoice generated from object, null if it wasn’t, YYYY-MM-DD if it was
    string? generation_date?;
    # percent amount being discounted from the subtotal, decimal-string amount ranging from 0 to 100
    string? discount_value?;
    # Public note about discount
    string? discount_description?;
    # Reference number for address on invoice.
    string? po_number?;
    # (internal, deprecated) choice of rendering style
    string? template?;
    # Three-letter currency code for invoice
    string? currency_code?;
    # Two-letter language code, e.g. “en”
    string? language?;
    # Terms listed on invoice
    string? terms?;
    # Notes listed on invoice
    string? notes?;
    # First line of address on invoice
    string? address?;
    # Amount required as deposit, null if none
    InvoiceDepositAmount? deposit_amount?;
    # Percent of the invoice’s value required as a deposit
    string? deposit_percentage?;
    # Whether to send via ground mail
    boolean? gmail?;
    # Whether attachments on invoice are rendered
    boolean? show_attachments?;
    # 0 for active, 1 for deleted
    int? vis_state?;
    # Street for address on invoice
    string? street?;
    # Second line of street for address on invoice.
    string? street2?;
    # City for address on invoice
    string? city?;
    # Province for address on invoice.
    string? province?;
    # Zip code for address on invoice
    string? code?;
    # Country for address on invoice
    string? country?;
    # Name of organization being invoiced.
    string? organization?;
    # First name of Client on invoice
    string? fname?;
    # Last name of client being invoiced
    string? lname?;
    # Value Added Tax name if provided
    string? vat_name?;
    # Value Added Tax number if provided
    string? vat_number?;
    # Number of days from creation that invoice is due. If not set, the due date will default to the date of issue.
    int? due_offset_days?;
    # Lines of the invoice
    InvoiceLinesWritable[]? lines?;
    # where invoice logo and styles are defined. See our postman collection for details.
    record {} presentation?;
};

public type EstimateobjectresponseResponse record {
    EstimateobjectresponseResponseResult? result?;
};

public type PaymemtobjectresponseResponse record {
    PaymemtobjectresponseResponseResult? result?;
};

# Total amount of estimate, to two decimal places
public type EstimateAmount record {
    # Estimate amount, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type DeletionResponse record {
};

public type ClientObjectResponse record {
    ClientobjectresponseResponse? response?;
};

public type InvoicelistresponseResponseResult record {
    Invoice[]? invoices?;
};

public type EstimatelistresponseResponse record {
    EstimatelistresponseResponseResult? result?;
};

public type TaxlistresponseResponse record {
    TaxlistresponseResponseResult? result?;
};

public type PaymemtObjectResponse record {
    PaymemtobjectresponseResponse? response?;
};

public type ClientobjectresponseResponseResult record {
    ClientObject? 'client?;
};

public type Contact record {
    # First name
    string? fname?;
    # Last name
    string? lname?;
    # Email address
    string? email?;
    # Duplicate of ID
    int? userid?;
    # Face
    string? face?;
};

# Subfields - amount and code
public type InvoiceDiscountTotal record {
    # Amount of discount, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

# Amount total of an estimate line, calculated with unit cost, quantity and tax. subfields - amount and code
public type EstimateupdateAmount record {
    # Amount of estimate line item account, to two decimal places
    string? amount?;
    # Three-letter currency code
    string? code?;
};

public type ExpenseCategory record {
    # Name for this category, e.g. “Advertising”
    string? category?;
    # Unique to this business ID for this category
    int? categoryid?;
    # Duplicate of categoryid
    int? ID?;
    # True/false can be edited
    boolean? is_editable?;
    # True/false represents cost of goods sold
    boolean? is_cogs?;
    # Categorid of parent category
    int? parentid?;
    # 0 for active, 1 for deleted
    int? vis_state?;
};

public type ExpenseCreateObject record {
    ExpenseCreate? expense?;
};

public type EstimateLines record {
    # Unique-to-this-estimate line ID
    int? lineid?;
    # Amount total of an estimate line, calculated with unit cost, quantity and tax. subfields - amount and code
    EstimateupdateAmount? amount?;
    # Time estimate line last updated at, YYYY-MM-DD HH:MM:SS format
    string? updated?;
    # Estimate line type, 0 for normal estimate line
    int? 'type?;
    # Quantity of the estimate line unit, multiplied against unit_cost
    int? qty?;
    # Unit cost of the line item. subfields - amount and code
    InvoicelinesUnitCost? unit_cost?;
    # Description for the estimate line item
    string? description?;
    # Name for the estimate line item
    string? name?;
    # Name for the first tax on the estimate line
    string? taxName1?;
    # First tax amount, in percentage, up to 3 decimal places
    string? taxAmount1?;
    # Name for the second tax on the estimate line
    string? taxName2?;
    # Second tax amount, in percentage, up to 3 decimal places
    string? taxAmount2?;
};

public type InvoiceObjectResponse record {
    InvoiceobjectresponseResponse? response?;
};

public type DeleteBody record {
    string? vis_state?;
};
