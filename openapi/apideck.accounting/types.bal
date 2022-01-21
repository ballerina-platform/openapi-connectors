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

# Reponse metadata
public type Meta record {
    # Cursors to navigate to previous or next pages through the API
    MetaCursors cursors?;
    # Number of items returned in the data property of the response
    int items_on_page?;
};

public type Company record {
    # An ABN Branch (also known as a GST Branch) is used if part of your business needs to account for GST separately from its parent entity.
    string? abn_branch?;
    # An ABN is necessary for operating a business, while a TFN (Tax File Number) is required for any person working in Australia.
    string? abn_or_tfn?;
    # The Australian Company Number (ACN) is a nine digit number with the last digit being a check digit calculated using a modified modulus 10 calculation. ASIC has adopted a convention of always printing and displaying the ACN in the format XXX XXX XXX; three blocks of three characters, each block separated by a blank.
    string? acn?;
    Address[] addresses?;
    # Annual revenue
    string? annual_revenue?;
    BankAccount[] bank_accounts?;
    string created_at?;
    string? created_by?;
    string? currency?;
    CustomField[] custom_fields?;
    boolean deleted?;
    string? description?;
    Email[] emails?;
    string? fax?;
    string id?;
    string? image?;
    # Industry
    string? industry?;
    int? interaction_count?;
    string? last_activity_at?;
    string name;
    # Number of employees
    string? number_of_employees?;
    string owner_id?;
    # Ownership
    string? ownership?;
    # Parent ID
    string parent_id?;
    string? payee_number?;
    PhoneNumber[] phone_numbers?;
    boolean? read_only?;
    string? sales_tax_number?;
    SocialLink[] social_links?;
    string? status?;
    Tags tags?;
    string updated_at?;
    string? updated_by?;
    # VAT number
    string? vat_number?;
    Website[] websites?;
};

public type Email record {
    string email;
    string id?;
    string 'type?;
};

public type Invoice record {
    decimal? balance?;
    Address billing_address?;
    CreatedAt created_at?;
    CreatedBy? created_by?;
    # Indicates the associated currency for an amount of money. Values correspond to [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217).
    Currency? currency?;
    # The customer this invoice is linked to.
    Customer? customer?;
    string? customer_memo?;
    # Date invoice was issued - YYYY-MM-DD
    string date?;
    decimal? deposit?;
    # The invoice due date is the date on which a payment or invoice is scheduled to be received by the seller - YYYY-MM-DD
    string due_date?;
    # The unique Id.
    Id id?;
    InvoiceLineItems[] line_items?;
    string? number?;
    # A PO Number uniquely identifies a purchase order and is generally defined by the buyer. The buyer will match the PO number in the invoice to the Purchase Order.
    string? po_number?;
    Address shipping_address?;
    # Invoice status
    string? status?;
    decimal? sub_total?;
    decimal? total?;
    decimal? total_tax?;
    string? 'type?;
    UpdatedAt updated_at?;
    UpdatedBy? updated_by?;
};

public type Address record {
    # Name of city.
    string? city?;
    # country code according to ISO 3166-1 alpha-2.
    string? country?;
    string? id?;
    string? latitude?;
    # Line 1 of the address e.g. number, street, suite, apt #, etc.
    string? line1?;
    # Line 2 of the address
    string? line2?;
    string? longitude?;
    string? name?;
    # Zip code or equivalent.
    string? postal_code?;
    # Name of state
    string? state?;
    string? 'string?;
    string 'type?;
};

public type GetCompanyResponse record {
    Company data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

# Cursors to navigate to previous or next pages through the API
public type MetaCursors record {
    # Cursor to navigate to the current page of results through the API
    string? current?;
    # Cursor to navigate to the next page of results through the API
    string? next?;
    # Cursor to navigate to the previous page of results through the API
    string? previous?;
};

# The customer this invoice is linked to.
public type Customer record {
    # The company name.
    string? company_name?;
    # The unique Id.
    Id id?;
};

public type CreatedAt string;

public type DeleteTaxRateResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type InvoiceTaxRate record {
    string? code?;
    # The unique Id.
    Id id?;
    string? name?;
};

public type DeleteLedgerAccountResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type InlineResponse422 record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type GetContactsResponse record {
    Contact[] data;
    # Links to navigate to previous or next pages through the API
    Links links?;
    # Reponse metadata
    Meta meta?;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type UpdatedBy string?;

# Indicates the associated currency for an amount of money. Values correspond to [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217).
public type Currency string?;

public type CreateLedgerAccountResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type InlineResponseDefault record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type GetTaxRateResponse record {
    TaxRate data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type Tags string[];

public type UpdateCompanyResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type GetLedgerAccountsResponse record {
    LedgerAccount[] data;
    # Links to navigate to previous or next pages through the API
    Links links?;
    # Reponse metadata
    Meta meta?;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CreatedBy string?;

public type GetLedgerAccountResponse record {
    LedgerAccount data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CreateTaxRateResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type UpdateTaxRateResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type InvoiceGeneralLedgerAccount record {
    # The unique Id.
    Id id?;
    string? name?;
};

public type UpdateContactResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type GetTaxRatesResponse record {
    TaxRate[] data;
    # Links to navigate to previous or next pages through the API
    Links links?;
    # Reponse metadata
    Meta meta?;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type LedgeraccountParentAccount record {
    string display_id?;
    string id?;
    string name?;
};

public type LedgeraccountSubAccounts record {
    string account_sub_name?;
    string id?;
};

public type DeleteCompanyResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

# The unique Id.
public type Id string;

public type DeleteInvoiceResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type SocialLink record {
    string? id?;
    string? 'type?;
    string url;
};

public type UnifiedId record {
    string id;
};

public type DeleteContactResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type PipelineStages record {
    int display_order?;
    string id?;
    string name?;
    string value?;
};

public type User record {
    string created_at?;
    string email;
    string? first_name?;
    string id?;
    string? image?;
    string? language?;
    string? last_name?;
    string? parent_id?;
    string password?;
    string? status?;
    string updated_at?;
    string? username?;
};

public type TaxrateComponents record {
    boolean? compound?;
    string name?;
    decimal? rate?;
};

public type GetCompaniesResponse record {
    Company[] data;
    # Links to navigate to previous or next pages through the API
    Links links?;
    # Reponse metadata
    Meta meta?;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type Website record {
    string? id?;
    string 'type?;
    string url;
};

public type InlineResponse401 record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type InlineResponse400 record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type InlineResponse402 record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type InlineResponse404 record {
    # Contains parameter or domain specific information related to the error and why it occured.
    string|record {} detail?;
    # Contains an explanation of the status_code as defined in HTTP/1.1 standard (RFC 7231)
    string _error?;
    # A human-readable message providing more details about the error.
    string message?;
    # Link to documentation of error type
    string ref?;
    # HTTP status code
    decimal status_code?;
    # The type of error returned
    string type_name?;
};

public type GetInvoicesResponse record {
    Invoice[] data;
    # Links to navigate to previous or next pages through the API
    Links links?;
    # Reponse metadata
    Meta meta?;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type LedgerAccount record {
    boolean? active?;
    BankAccount bank_account?;
    string? classification?;
    CreatedAt created_at?;
    CreatedBy? created_by?;
    # Indicates the associated currency for an amount of money. Values correspond to [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217).
    Currency? currency?;
    # The current balance. A positive integer representing the smallest currency unit (e.g., 20000 cents equals $200.00 or 20000 equals ¥20000, a zero-decimal currency)
    decimal? current_balance?;
    string? description?;
    string display_id?;
    string? fully_qualified_name?;
    # The unique Id.
    Id id?;
    # Reconciliation Date means the last calendar day of each Reconciliation Period.
    string last_reconciliation_date?;
    string? level?;
    string? name?;
    string? nominal_code?;
    # The opening balance. A positive integer representing the smallest currency unit (e.g., 100 cents equals $1.00 or 100 equals ¥100, a zero-decimal currency)
    decimal? opening_balance?;
    LedgeraccountParentAccount parent_account?;
    boolean? sub_account?;
    LedgeraccountSubAccounts[] sub_accounts?;
    string? sub_type?;
    string? tax_code?;
    string? tax_type?;
    string? 'type?;
    UpdatedAt updated_at?;
    UpdatedBy? updated_by?;
};

public type Opportunity record {
    string? close_date?;
    string? company_id?;
    string? company_name?;
    string? contact_id?;
    string created_at?;
    string? created_by?;
    string? currency?;
    CustomField[] custom_fields?;
    string? date_last_contacted?;
    string? date_lead_created?;
    string? date_stage_changed?;
    boolean deleted?;
    string? description?;
    # Expected Revenue
    decimal? expected_revenue?;
    string id?;
    decimal? interaction_count?;
    string? last_activity_at?;
    string? lead_id?;
    # Lead source
    string? lead_source?;
    string? loss_reason?;
    string? loss_reason_id?;
    decimal? monetary_amount?;
    string? owner_id?;
    string? pipeline_id?;
    string? pipeline_stage_id?;
    string? primary_contact_id;
    string? priority?;
    string? source_id?;
    string? stage_last_changed_at?;
    string? status?;
    string? status_id?;
    Tags tags?;
    string title;
    string? 'type?;
    string updated_at?;
    string? updated_by?;
    decimal? win_probability?;
    string? won_reason?;
    string? won_reason_id?;
};

public type Lead record {
    Address[] addresses?;
    string? company_id?;
    string? company_name;
    string? contact_id?;
    string created_at?;
    string? currency?;
    CustomField[] custom_fields?;
    string? description?;
    Email[] emails?;
    string? fax?;
    string? first_name?;
    string id?;
    # language code according to ISO 639-1. For the United States - EN
    string? language?;
    string? last_name?;
    string? lead_source?;
    decimal? monetary_amount?;
    string name;
    string owner_id?;
    PhoneNumber[] phone_numbers?;
    string? prefix?;
    SocialLink[] social_links?;
    string? status?;
    Tags tags?;
    string? title?;
    string updated_at?;
    Website[] websites?;
};

public type TaxRate record {
    boolean? active?;
    string? code?;
    TaxrateComponents[]? components?;
    CreatedAt created_at?;
    CreatedBy? created_by?;
    string? description?;
    decimal? effective_tax_rate?;
    # The unique Id.
    Id id?;
    string name?;
    # ID of the original tax rate from which the new tax rate is derived. Helps to understand the relationship between corresponding tax rate entities.
    string? original_tax_rate_id?;
    # Special tax type to handle zero rate taxes. Used with VAT registered Businesses who receive goods/services (acquisitions) from other EU countries, will need to calculate the VAT due, but not paid, on these acquisitions. The rate of VAT payable is the same that would have been paid if the goods had been supplied by a UK supplier.
    string? special_tax_type?;
    # Not compounded sum of the components of a tax rate
    decimal? total_tax_rate?;
    UpdatedAt updated_at?;
    UpdatedBy? updated_by?;
};

public type GetInvoiceResponse record {
    Invoice data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type UpdateInvoiceResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CreateContactResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type BankAccount record {
    # The name which you used in opening your bank account.
    string? account_name?;
    # A bank account number is a number that is tied to your bank account. If you have several bank accounts, such as personal, joint, business (and so on), each account will have a different account number.
    string? account_number?;
    # A bank code is a code assigned by a central bank, a bank supervisory body or a Bankers Association in a country to all its licensed member banks or financial institutions.
    string? bank_code?;
    string? bic?;
    # A BSB is a 6 digit numeric code used for identifying the branch of an Australian or New Zealand bank or financial institution.
    string? bsb_number?;
    string? iban?;
};

public type UpdatedAt string;

public type Contact record {
    boolean? active?;
    Address[] addresses?;
    string? birthday?;
    string? company_id?;
    string? company_name?;
    string created_at?;
    decimal? current_balance?;
    CustomField[] custom_fields?;
    string? department?;
    string? description?;
    Email[] emails?;
    string? fax?;
    string? first_call_at?;
    string? first_email_at?;
    string? first_name?;
    string? gender?;
    string id?;
    string? image?;
    # language code according to ISO 639-1. For the United States - EN
    string? language?;
    string? last_activity_at?;
    string? last_name?;
    string? lead_id?;
    string? lead_source?;
    string? middle_name?;
    string name;
    string? owner_id?;
    PhoneNumber[] phone_numbers?;
    string? prefix?;
    SocialLink[] social_links?;
    string? status?;
    string? suffix?;
    Tags tags?;
    string? title?;
    string? 'type?;
    string updated_at?;
    Website[] websites?;
};

public type Pipeline record {
    boolean archived?;
    string created_at?;
    string currency?;
    int display_order?;
    string id?;
    string name;
    PipelineStages[] stages?;
    string updated_at?;
};

public type GetContactResponse record {
    Contact data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CreateCompanyResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CustomField record {
    string id;
    string|decimal|boolean|string[]? value?;
};

# Links to navigate to previous or next pages through the API
public type Links record {
    # Link to navigate to the current page through the API
    string current?;
    # Link to navigate to the previous page through the API
    string? next?;
    # Link to navigate to the previous page through the API
    string? previous?;
};

public type PhoneNumber record {
    string? id?;
    string number;
    string 'type?;
};

public type UpdateLedgerAccountResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type CreateInvoiceResponse record {
    UnifiedId data;
    # Operation performed
    string operation;
    # Unified API resource name
    string 'resource;
    # Apideck ID of service provider
    string 'service;
    # HTTP Response Status
    string status;
    # HTTP Response Status Code
    int status_code;
};

public type InvoiceLineItems record {
    string? description?;
    int? discount_percentage?;
    InvoiceGeneralLedgerAccount general_ledger_account?;
    # The unique Id.
    Id id?;
    # ID of the linked item
    int? item_id?;
    int? line_number?;
    int? quantity?;
    int? tax_amount?;
    InvoiceTaxRate tax_rate?;
    int? total_amount?;
    string? 'type?;
    int? unit_price?;
};
