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

@constraint:String {minLength: 1}
public type PaymentinitiationaddressStreetItemsString string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `PLAID-CLIENT-ID`
    @display {label: "", kind: "password"}
    string plaidClientId;
    # Respresents API Key `PLAID-SECRET`
    @display {label: "", kind: "password"}
    string plaidSecret;
    # Respresents API Key `Plaid-Version`
    @display {label: "", kind: "password"}
    string plaidVersion;
|};

# EmployersSearchRequest defines the request schema for `/employers/search`.
public type EmployersSearchRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The employer name to be searched for.
    string query;
    # The Plaid products the returned employers should support. Currently, this field must be set to `"deposit_switch"`.
    string[] products;
};

# The Plaid `access_token` for the account that will be debited or credited.
public type TransferAccessToken string;

# Used to configure Sandbox test data for the Liabilities product
public type LiabilityOverride record {
    # The type of the liability object, either `credit` or `student`. Mortgages are not currently supported in the custom Sandbox.
    string 'type;
    # The purchase APR percentage value. For simplicity, this is the only interest rate used to calculate interest charges. Can only be set if `type` is `credit`.
    decimal purchase_apr;
    # The cash APR percentage value. Can only be set if `type` is `credit`.
    decimal cash_apr;
    # The balance transfer APR percentage value. Can only be set if `type` is `credit`. Can only be set if `type` is `credit`.
    decimal balance_transfer_apr;
    # The special APR percentage value. Can only be set if `type` is `credit`.
    decimal special_apr;
    # Override the `last_payment_amount` field. Can only be set if `type` is `credit`.
    decimal last_payment_amount;
    # Override the `minimum_payment_amount` field. Can only be set if `type` is `credit` or `student`.
    decimal minimum_payment_amount;
    # Override the `is_overdue` field
    boolean is_overdue;
    # The date on which the loan was initially lent, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format. Can only be set if `type` is `student`.
    string origination_date;
    # The original loan principal. Can only be set if `type` is `student`.
    decimal principal;
    # The interest rate on the loan as a percentage. Can only be set if `type` is `student`.
    decimal nominal_apr;
    # If set, interest capitalization begins at the given number of months after loan origination. By default interest is never capitalized. Can only be set if `type` is `student`.
    decimal interest_capitalization_grace_period_months;
    # Student loan repayment information used to configure Sandbox test data for the Liabilities product
    StudentLoanRepaymentModel repayment_model;
    # Override the `expected_payoff_date` field. Can only be set if `type` is `student`.
    string expected_payoff_date;
    # Override the `guarantor` field. Can only be set if `type` is `student`.
    string guarantor;
    # Override the `is_federal` field. Can only be set if `type` is `student`.
    boolean is_federal;
    # Override the `loan_name` field. Can only be set if `type` is `student`.
    string loan_name;
    # An object representing the status of the student loan
    StudentLoanStatus loan_status;
    # Override the `payment_reference_number` field. Can only be set if `type` is `student`.
    string payment_reference_number;
    # Information about the student's eligibility in the Public Service Loan Forgiveness program. This is only returned if the institution is Fedloan (`ins_116527`). 
    PSLFStatus pslf_status;
    # Override the `repayment_plan.description` field. Can only be set if `type` is `student`.
    string repayment_plan_description;
    # Override the `repayment_plan.type` field. Can only be set if `type` is `student`. Possible values are: `"extended graduated"`, `"extended standard"`, `"graduated"`, `"income-contingent repayment"`, `"income-based repayment"`, `"interest only"`, `"other"`, `"pay as you earn"`, `"revised pay as you earn"`, or `"standard"`.
    string repayment_plan_type;
    # Override the `sequence_number` field. Can only be set if `type` is `student`.
    string sequence_number;
    # A physical mailing address.
    Address servicer_address;
};

# Metadata specifically related to valid Payment Initiation standing order configurations for the institution.
public type PaymentInitiationStandingOrderMetadata record {
    # Indicates whether the institution supports closed-ended standing orders by providing an end date.
    boolean supports_standing_order_end_date;
    # This is only applicable to `MONTHLY` standing orders. Indicates whether the institution supports negative integers (-1 to -5) for setting up a `MONTHLY` standing order relative to the end of the month.
    boolean supports_standing_order_negative_execution_days;
    # A list of the valid standing order intervals supported by the institution.
    PaymentScheduleInterval[] valid_standing_order_intervals;
};

# An object containing identifying numbers used for making electronic transfers to and from the `accounts`. The identifying number type (ACH, EFT, IBAN, or BACS) used will depend on the country of the account. An account may have more than one number type. If a particular identifying number type is not used by any `accounts` for which data has been requested, the array for that type will be empty.
public type AuthGetNumbers record {
    # An array of ACH numbers identifying accounts.
    NumbersACH[] ach;
    # An array of EFT numbers identifying accounts.
    NumbersEFT[] eft;
    # An array of IBAN numbers identifying accounts.
    NumbersInternational[] international;
    # An array of BACS numbers identifying accounts.
    NumbersBACS[] bacs;
};

public type IncomeSummaryFieldNumber record {
    # The value of the field.
    decimal value;
    # The verification status. One of the following:
    # 
    # `"VERIFIED"`: The information was successfully verified.
    # 
    # `"UNVERIFIED"`: The verification has not yet been performed.
    # 
    # `"NEEDS_INFO"`: The verification was attempted but could not be completed due to missing information.
    # 
    # "`UNABLE_TO_VERIFY`": The verification was performed and the information could not be verified.
    # 
    # `"UNKNOWN"`: The verification status is unknown.
    VerificationStatus verification_status;
};

# The amount and currency of a payment
public type PaymentAmount record {
    # The ISO-4217 currency code of the payment. For standing orders, `"GBP"` must be used.
    @constraint:String {maxLength: 3, minLength: 3}
    string currency;
    # The amount of the payment. Must contain at most two digits of precision e.g. `1.23`. Minimum accepted value is `1`.
    decimal value;
};

# An object representing a credit card account.
public type CreditCardLiability record {
    # The ID of the account that this liability belongs to.
    string? account_id;
    # The various interest rates that apply to the account.
    APR[] aprs;
    # true if a payment is currently overdue. Availability for this field is limited.
    boolean? is_overdue;
    # The amount of the last payment.
    decimal last_payment_amount;
    # The date of the last payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). Availability for this field is limited.
    string last_payment_date;
    # The date of the last statement. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string last_statement_issue_date;
    # The minimum payment due for the next billing cycle.
    decimal minimum_payment_amount;
    # The due date for the next payment. The due date is `null` if a payment is not expected. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? next_payment_due_date;
};

# Configuration parameters for EU flows
public type LinkTokenEUConfig record {
    # If `true`, open Link without an initial UI. Defaults to `false`.
    boolean headless?;
};

# Activity that modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer
public type StandaloneInvestmentTransactionTransferType record {
    # Assignment of short option holding
    string assignment?;
    # Increase or decrease in quantity of item
    string adjustment?;
    # Exercise of an option or warrant contract
    string exercise?;
    # Expiration of an option or warrant contract
    string expire?;
    # Stock exchanged at a pre-defined ratio as part of a merger between companies
    string merger?;
    # Inflow of stock from spin-off transaction of an existing holding
    string 'spin\ off?;
    # Inflow of stock from a forward split of an existing holding
    string split?;
    # Movement of assets into or out of an account
    string transfer?;
};

# TransactionsRefreshResponse defines the response schema for `/transactions/refresh`
public type TransactionsRefreshResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Object containing fields describing property address.
public type MortgagePropertyAddress record {
    # The city name.
    string? city;
    # The ISO 3166-1 alpha-2 country code.
    string? country;
    # The five or nine digit postal code.
    string? postal_code;
    # The region or state (example "NC").
    string? region;
    # The full street address (example "564 Main Street, Apt 15").
    string? street;
};

# ItemPublicTokenCreateResponse defines the response schema for `/item/public_token/create`
public type ItemPublicTokenCreateResponse record {
    # A `public_token` for the particular Item corresponding to the specified `access_token`
    string public_token;
    # The RFC 3339 timestamp after which the token will expire.
    string expiration?;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Specifies options for initializing Link for use with the Auth product. This field is currently only required if using the Flexible Auth product (currently in closed beta).
public type LinkTokenCreateRequestAuth record {
    # The optional Auth flow to use. Currently only used to enable Flexible Auth.
    string flow_type;
};

# Contains details about a mortgage account.
public type MortgageLiability record {
    # The ID of the account that this liability belongs to.
    string account_id;
    # The account number of the loan.
    string account_number;
    # The current outstanding amount charged for late payment.
    decimal? current_late_fee;
    # Total amount held in escrow to pay taxes and insurance on behalf of the borrower.
    decimal? escrow_balance;
    # Indicates whether the borrower has private mortgage insurance in effect.
    boolean? has_pmi;
    # Indicates whether the borrower will pay a penalty for early payoff of mortgage.
    boolean? has_prepayment_penalty;
    # Object containing metadata about the interest rate for the mortgage.
    MortgageInterestRate interest_rate;
    # The amount of the last payment.
    decimal? last_payment_amount;
    # The date of the last payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? last_payment_date;
    # Description of the type of loan, for example `conventional`, `fixed`, or `variable`. This field is provided directly from the loan servicer and does not have an enumerated set of possible values.
    string? loan_type_description;
    # Full duration of mortgage as at origination (e.g. `10 year`).
    string? loan_term;
    # Original date on which mortgage is due in full. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? maturity_date;
    # The amount of the next payment.
    decimal? next_monthly_payment;
    # The due date for the next payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? next_payment_due_date;
    # The date on which the loan was initially lent. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? origination_date;
    # The original principal balance of the mortgage.
    decimal? origination_principal_amount;
    # Amount of loan (principal + interest) past due for payment.
    decimal? past_due_amount;
    # Object containing fields describing property address.
    MortgagePropertyAddress property_address;
    # The year to date (YTD) interest paid.
    decimal? ytd_interest_paid;
    # The YTD principal paid.
    decimal? ytd_principal_paid;
};

# AssetReportRemoveRequest defines the request schema for `/asset_report/remove`
public type AssetReportRemoveRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
};

# PaymentInitiationRecipientCreateRequest defines the request schema for `/payment_initiation/recipient/create`
public type PaymentInitiationRecipientCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The name of the recipient
    @constraint:String {minLength: 1}
    string name;
    # The International Bank Account Number (IBAN) for the recipient. If BACS data is not provided, an IBAN is required.
    string? iban?;
    # The account number and sort code of the recipient's account.
    RecipientBACSNullable? bacs?;
    # The optional address of the payment recipient. This object is not currently required to make payments from UK institutions and should not be populated, though may be necessary for future European expansion.
    PaymentInitiationAddress? address?;
};

# Data about the employer.
public type Employer record {
    # Plaid's unique identifier for the employer.
    string employer_id;
    # The name of the employer
    string name;
    # Data about the components comprising an address.
    AddressDataNullable? address;
    # A number from 0 to 1 indicating Plaid's level of confidence in the pairing between the employer and the institution (not yet implemented).
    decimal confidence_score;
};

# Fired when new bank transfer events are available. Receiving this webhook indicates you should fetch the new events from `/bank_transfer/event/sync`.
public type BankTransfersEventsUpdateWebhook record {
    # `BANK_TRANSFERS`
    string webhook_type;
    # `BANK_TRANSFERS_EVENTS_UPDATE`
    string webhook_code;
};

public type SandboxProcessorTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the institution the Item will be associated with
    string institution_id;
    # An optional set of options to be used when configuring the Item. If specified, must not be `null`.
    SandboxProcessorTokenCreateRequestOptions options?;
};

# Fired when the status of a deposit switch request has changed.
public type DepositSwitchStateUpdateWebhook record {
    # `"DEPOSIT_SWITCH"`
    string webhook_type?;
    # `"SWITCH_STATE_UPDATE"`
    string webhook_code?;
    # 
    # The state, or status, of the deposit switch.
    # 
    # `initialized`: The deposit switch has been initialized with the user entering the information required to submit the deposit switch request.
    # 
    # `processing`: The deposit switch request has been submitted and is being processed.
    # 
    # `completed`: The user's employer has fulfilled and completed the deposit switch request.
    # 
    # `error`: There was an error processing the deposit switch request.
    # 
    # For more information, see the [Deposit Switch API reference](/docs/api/products#deposit_switchget).
    string state?;
    # The ID of the deposit switch.
    string deposit_switch_id?;
};

public type SignalEvaluateResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
    SignalScores scores;
    # The core attributes object contains additional data that can be used to assess the ACH return risk, such as past ACH return events, balance/transaction history, the Item’s connection history in the Plaid network, and identity change history.
    SignalEvaluateCoreAttributes core_attributes;
};

# Data about the employee.
public type Employee record {
    # The name of the employee.
    string? name;
    # Add adress of the employer on the paystub.
    PaystubAddress address;
    # Marital status of the employee.
    string? marital_status?;
    # The taxpayer ID
    TaxpayerID taxpayer_id?;
};

# Plaid’s unique identifier for a transfer authorization.
public type TransferAuthorizationID string;

# The name of the employee, as reported on the paystub.
public type EmployeeIncomeSummaryFieldString record {
    *IncomeSummaryFieldString;
};

# AssetReportRefreshRequest defines the request schema for `/asset_report/refresh`
public type AssetReportRefreshRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The `asset_report_token` returned by the original call to `/asset_report/create`
    AssetReportRefreshAssetReportToken asset_report_token;
    # The maximum number of days of history to include in the Asset Report. Must be an integer. If not specified, the value from the original call to `/asset_report/create` will be used.
    @constraint:Int {maxValue: 730}
    int days_requested?;
    # An optional object to filter `/asset_report/refresh` results. If provided, cannot be `null`. If not specified, the `options` from the original call to `/asset_report/create` will be used.
    AssetReportRefreshRequestOptions options?;
};

# Represents a transfer within the Transfers API.
public type Transfer record {
    # Plaid’s unique identifier for a transfer.
    TransferID id;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class;
    # The account ID that should be credited/debited for this transfer.
    string account_id;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    TransferType 'type;
    # The legal name and other information for the account holder.
    TransferUserInResponse user;
    # The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
    TransferAmount amount;
    # The currency of the transfer amount, e.g. "USD"
    string iso_currency_code;
    # The description of the transfer.
    string description;
    # The datetime when this transfer was created. This will be of the form `2006-01-02T15:04:05Z`
    string created;
    # The status of the transfer.
    TransferStatus status;
    # The network or rails used for the transfer. Valid options are `ach` or `same-day-ach`.
    TransferNetwork network;
    # When `true`, you can still cancel this transfer.
    boolean cancellable;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    TransferFailure? failure_reason;
    # A string containing the custom tag provided by the client in the create request. Will be null if not provided.
    string? custom_tag;
    # The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
    # - The JSON values must be Strings (no nested JSON objects allowed)
    # - Only ASCII characters may be used
    # - Maximum of 50 key/value pairs
    # - Maximum key length of 40 characters
    # - Maximum value length of 500 characters
    TransferMetadata? metadata;
    # Plaid’s unique identifier for the origination account that was used for this transfer.
    string origination_account_id;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    TransferDirection? direction;
};

# The request was flagged by Plaid's fraud system, and requires additional verification to ensure they are not a bot.
public type RecaptchaRequiredError record {
    # RECAPTCHA_ERROR
    string error_type;
    # RECAPTCHA_REQUIRED
    string error_code;
    # A user-friendly representation of the error code. null if the error is not related to user action.
    string display_message;
    # 400
    string http_code;
    # Your user will be prompted to solve a Google reCAPTCHA challenge in the Link Recaptcha pane. If they solve the challenge successfully, the user's request is resubmitted and they are directed to the next Item creation step.
    string link_user_experience;
    # Plaid's fraud system detects abusive traffic and considers a variety of parameters throughout Item creation requests. When a request is considered risky or possibly fraudulent, Link presents a reCAPTCHA for the user to solve.
    string common_causes;
    # Link will automatically guide your user through reCAPTCHA verification. As a general rule, we recommend instrumenting basic fraud monitoring to detect and protect your website from spam and abuse.
    # 
    # If your user cannot verify their session, please submit a Support ticket with the following identifiers: `link_session_id` or `request_id`
    string troubleshooting_steps;
};

# A random key provided by the client, per unique bank transfer. Maximum of 50 characters.
# 
# The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a bank transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single bank transfer is created.
@constraint:String {maxLength: 50}
public type BankTransferIdempotencyKey string;

# An optional set of options to be used when configuring the Item. If specified, must not be `null`.
public type SandboxPublicTokenCreateRequestOptions record {
    # Specify a webhook to associate with the new Item.
    string webhook?;
    # Test username to use for the creation of the Sandbox Item. Default value is `user_good`.
    SandboxOverrideUsername? override_username?;
    # Test password to use for the creation of the Sandbox Item. Default value is `pass_good`.
    SandboxOverridePassword? override_password?;
    # SandboxPublicTokenCreateRequestOptionsTransactions is an optional set of parameters corresponding to transactions options.
    SandboxPublicTokenCreateRequestOptionsTransactions transactions?;
};

public type IncomeSummaryFieldString record {
    # The value of the field.
    string value;
    # The verification status. One of the following:
    # 
    # `"VERIFIED"`: The information was successfully verified.
    # 
    # `"UNVERIFIED"`: The verification has not yet been performed.
    # 
    # `"NEEDS_INFO"`: The verification was attempted but could not be completed due to missing information.
    # 
    # "`UNABLE_TO_VERIFY`": The verification was performed and the information could not be verified.
    # 
    # `"UNKNOWN"`: The verification status is unknown.
    VerificationStatus verification_status;
};

# Fired when an Item's historical transaction pull is completed and Plaid has prepared as much historical transaction data as possible for the Item. Once this webhook has been fired, transaction data beyond the most recent 30 days can be fetched for the Item.
public type HistoricalUpdateWebhook record {
    # `TRANSACTIONS`
    string webhook_type;
    # `HISTORICAL_UPDATE`
    string webhook_code;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # The number of new, unfetched transactions available
    decimal new_transactions;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
};

# Defines the response schema for `/processor/bank_transfer/create`
public type ProcessorBankTransferCreateResponse record {
    # Represents a bank transfer within the Bank Transfers API.
    BankTransfer bank_transfer;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The employee's estimated annual salary, as derived from information reported on the paystub.
public type ProjectedIncomeSummaryFieldNumber record {
    *IncomeSummaryFieldNumber;
};

# A filter to apply to `investment`-type accounts
public type InvestmentFilter record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes;
};

# An optional object to be used with the request. If specified, `options` must not be `null`.
public type TransactionsGetRequestOptions record {
    # A list of `account_ids` to retrieve for the Item
    # 
    # Note: An error will be returned if a provided `account_id` is not associated with the Item.
    string[] account_ids?;
    # The number of transactions to fetch.
    @constraint:Int {maxValue: 500}
    int count?;
    # The number of transactions to skip. The default value is 0.
    int offset?;
    # Include the raw unparsed transaction description from the financial institution. This field is disabled by default. If you need this information in addition to the parsed data provided, contact your Plaid Account Manager.
    boolean? include_original_description?;
};

# AssetReportGetResponse defines the response schema for `/asset_report/get`
public type AssetReportGetResponse record {
    # An object representing an Asset Report
    AssetReport report;
    # If the Asset Report generation was successful but identity information cannot be returned, this array will contain information about the errors causing identity information to be missing
    Warning[] warnings;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Object containing metadata about the interest rate for the mortgage.
public type MortgageInterestRate record {
    # Percentage value (interest rate of current mortgage, not APR) of interest payable on a loan.
    decimal? percentage;
    # The type of interest charged (fixed or variable).
    string? 'type;
};

# TransactionsRefreshRequest defines the request schema for `/transactions/refresh`
public type TransactionsRefreshRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
};

# Data about the owner or owners of an account. Any fields not specified will be filled in with default Sandbox information.
public type OwnerOverride record {
    # A list of names associated with the account by the financial institution. These should always be the names of individuals, even for business accounts. Note that the same name data will be used for all accounts associated with an Item.
    string[] names;
    # A list of phone numbers associated with the account.
    PhoneNumber[] phone_numbers;
    # A list of email addresses associated with the account.
    Email[] emails;
    # Data about the various addresses associated with the account.
    Address[] addresses;
};

public type W2Box12 record {
    # W2 Box 12 code.
    string? code?;
    # W2 Box 12 amount.
    string? amount?;
};

# An optional object to filter `/asset_report/refresh` results. If provided, cannot be `null`. If not specified, the `options` from the original call to `/asset_report/create` will be used.
public type AssetReportRefreshRequestOptions record {
    # Client-generated identifier, which can be used by lenders to track loan applications.
    string client_report_id?;
    # URL to which Plaid will send Assets webhooks, for example when the requested Asset Report is ready.
    string webhook?;
    # The user object allows you to provide additional information about the user to be appended to the Asset Report. All fields are optional. The `first_name`, `last_name`, and `ssn` fields are required if you would like the Report to be eligible for Fannie Mae’s Day 1 Certainty™ program.
    AssetReportUser user?;
};

# Information about the matched direct deposit transaction used to verify a user's payroll information.
public type TransactionData record {
    # The description of the transaction.
    string description;
    # The amount of the transaction.
    decimal amount;
    # The date of the transaction, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ("yyyy-mm-dd").
    string date;
    # A unique identifier for the end user's account.
    string account_id;
    # A unique identifier for the transaction.
    string transaction_id;
};

# IdentityGetRequest defines the request schema for `/identity/get`
public type IdentityGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # An optional object to filter `/identity/get` results.
    IdentityGetRequestOptions options?;
};

# Defines the response schema for `/transfer/event/sync`
public type TransferEventSyncResponse record {
    # An array of transfer events in the Transfers API
    TransferEvent[] transfer_events;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Identifying information for transferring money to or from an international bank account via wire transfer.
public type NumbersInternationalNullable record {
    *NumbersInternational;
};

# Identifying information for transferring money to or from an international bank account via wire transfer.
public type NumbersInternational record {
    # The Plaid account ID associated with the account numbers
    string account_id;
    # The International Bank Account Number (IBAN) for the account
    string iban;
    # The Bank Identifier Code (BIC) for the account
    string bic;
};

# TransferAuthorization contains the authorization decision for a proposed transfer
public type TransferAuthorization record {
    # Plaid’s unique identifier for a transfer authorization.
    TransferAuthorizationID id;
    # The datetime representing when the authorization was created, in the format "2006-01-02T15:04:05Z".
    string created;
    # 
    # A decision regarding the proposed transfer.
    # 
    # `approved` – The proposed transfer has received the end user's consent and has been approved for processing. Plaid has also reviewed the proposed transfer and has approved it for processing. 
    # 
    # `permitted` – Plaid was unable to fetch the information required to approve or decline the proposed transfer. You may proceed with the transfer, but further review is recommended. Plaid is awaiting further instructions from the client.
    # 
    # `declined` – Plaid reviewed the proposed transfer and declined processing. Refer to the `code` field in the `decision_rationale` object for details.
    string decision;
    # The rationale for Plaid's decision regarding a proposed transfer. Will be null for `approved` decisions.
    TransferAuthorizationDecisionRationale? decision_rationale;
    # Details regarding the proposed transfer.
    TransferAuthorizationProposedTransfer proposed_transfer;
};

# A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
public type ProductStatus record {
    # `HEALTHY`: the majority of requests are successful
    # `DEGRADED`: only some requests are successful
    # `DOWN`: all requests are failing
    string status;
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) formatted timestamp of the last status change for the institution.
    string last_status_change;
    # A detailed breakdown of the institution's performance for a request type. The values for `success`, `error_plaid`, and `error_institution` sum to 1.
    ProductStatusBreakdown breakdown;
};

# Fees on the account, e.g. commission, bookkeeping, options-related.
public type StandaloneInvestmentTransactionFeeType record {
    # Fees paid for account maintenance
    string 'account\ fee?;
    # Increase or decrease in quantity of item
    string adjustment?;
    # Inflow of cash from a dividend
    string dividend?;
    # Inflow of cash from interest
    string interest?;
    # Inflow of cash from interest receivable
    string 'interest\ receivable?;
    # Long-term capital gain received as cash
    string 'long\-term\ capital\ gain?;
    # Fees paid for legal charges or services
    string 'legal\ fee?;
    # Fees paid for investment management of a mutual fund or other pooled investment vehicle
    string 'management\ fee?;
    # Fees paid for maintaining margin debt
    string 'margin\ expense?;
    # Inflow of cash from a non-qualified dividend
    string 'non\-qualified\ dividend?;
    # Taxes paid on behalf of the investor for non-residency in investment jurisdiction
    string 'non\-resident\ tax?;
    # Inflow of cash from a qualified dividend
    string 'qualified\ dividend?;
    # Repayment of loan principal
    string 'return\ of\ principal?;
    # Short-term capital gain received as cash
    string 'short\-term\ capital\ gain?;
    # Inflow of stock from a distribution
    string 'stock\ distribution?;
    # Taxes paid on behalf of the investor
    string tax?;
    # Taxes withheld on behalf of the customer
    string 'tax\ withheld?;
    # Fees incurred for transfer of a holding or account
    string 'transfer\ fee?;
    # Fees related to adminstration of a trust account
    string 'trust\ fee?;
    # Unqualified capital gain received as cash
    string 'unqualified\ gain?;
};

# Request to list connected applications for a user.
public type ItemApplicationListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# Defines the response schema for `/sandbox/bank_transfer/fire_webhook`
public type SandboxBankTransferFireWebhookResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# A filter to apply to `investment`-type accounts
public type LinktokencreaterequestaccountsubtypesInvestment record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes?;
};

# IncomeVerificationCreateRequest defines the request schema for `/income/verification/create`
public type IncomeVerificationCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The URL endpoint to which Plaid should send webhooks related to the progress of the income verification process.
    string webhook;
};

# ItemApplicationScopesUpdateResponse defines the response schema for `/item/application/scopes/update`
public type ItemApplicationScopesUpdateResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object representing an email address
public type Email record {
    # The email address.
    string data;
    # When `true`, identifies the email address as the primary email on an account.
    boolean primary;
    # The type of email account as described by the financial institution.
    string 'type;
};

# The deposit switch destination account information
public type DepositSwitchTargetAccount record {
    # Account number for deposit switch destination
    string account_number;
    # Routing number for deposit switch destination
    string routing_number;
    # The name of the deposit switch destination account, as it will be displayed to the end user in the Deposit Switch interface. It is not required to match the name used in online banking.
    string account_name;
    # The account subtype of the account, either `checking` or `savings`.
    string account_subtype;
};

# The amount of income earned year to date, as based on paystub data.
public type PaystubYTDDetails record {
    # Year-to-date gross earnings.
    decimal? gross_earnings?;
    # Year-to-date net (take home) earnings.
    decimal? net_earnings?;
};

# A tier corresponding to the projected likelihood that the transaction, if initiated, will be subject to a return.
# 
# In the `customer_initiated_return_risk` object, there are five risk tiers corresponding to the scores:
#   1: Predicted customer-initiated return incidence rate between 0.00% - 0.02%
#   2: Predicted customer-initiated return incidence rate between 0.02% - 0.05%
#   3: Predicted customer-initiated return incidence rate between 0.05% - 0.1%
#   4: Predicted customer-initiated return incidence rate between 0.1% - 0.5%
#   5: Predicted customer-initiated return incidence rate greater than 0.5%
@constraint:Int {minValue: 1, maxValue: 5}
public type CustomerInitiatedRiskTier int;

# Data to populate as test transaction data. If not specified, random transactions will be generated instead.
public type TransactionOverride record {
    # The date of the transaction, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format. Transaction dates in the past or present will result in posted transactions; transaction dates in the future will result in pending transactions. Transactions in Sandbox will move from pending to posted once their transaction date has been reached.
    string date_transacted;
    # The date the transaction posted, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format
    string date_posted;
    # The transaction amount. Can be negative.
    decimal amount;
    # The transaction description.
    string description;
    # The ISO-4217 format currency code for the transaction.
    string currency?;
};

# The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
public type TransferFailure record {
    # The ACH return code, e.g. `R01`.  A return code will be provided if and only if the transfer status is `reversed`. For a full listing of ACH return codes, see [Bank Transfers errors](https://plaid.com/docs/errors/bank-transfers/#ach-return-codes).
    string? ach_return_code?;
    # A human-readable description of the reason for the failure or reversal.
    string description?;
};

# Activity that modifies a cash position
public type StandaloneInvestmentTransactionCashType record {
    # Fees paid for account maintenance
    string 'account\ fee?;
    # Inflow of assets into a tax-advantaged account
    string contribution?;
    # Inflow of cash into an account
    string deposit?;
    # Inflow of cash from a dividend
    string dividend?;
    # Inflow of stock from a distribution
    string 'stock\ distribution?;
    # Inflow of cash from interest
    string interest?;
    # Fees paid for legal charges or services
    string 'legal\ fee?;
    # Long-term capital gain received as cash
    string 'long\-term\ capital\ gain?;
    # Fees paid for investment management of a mutual fund or other pooled investment vehicle
    string 'management\ fee?;
    # Fees paid for maintaining margin debt
    string 'margin\ expense?;
    # Inflow of cash from a non-qualified dividend
    string 'non\-qualified\ dividend?;
    # Taxes paid on behalf of the investor for non-residency in investment jurisdiction
    string 'non\-resident\ tax?;
    # Pending inflow of cash
    string 'pending\ credit?;
    # Pending outflow of cash
    string 'pending\ debit?;
    # Inflow of cash from a qualified dividend
    string 'qualified\ dividend?;
    # Short-term capital gain received as cash
    string 'short\-term\ capital\ gain?;
    # Taxes paid on behalf of the investor
    string tax?;
    # Taxes withheld on behalf of the customer
    string 'tax\ withheld?;
    # Fees incurred for transfer of a holding or account
    string 'transfer\ fee?;
    # Fees related to adminstration of a trust account
    string 'trust\ fee?;
    # Unqualified capital gain received as cash
    string 'unqualified\ gain?;
    # Outflow of cash from an account
    string withdrawal?;
};

# IncomeVerificationSummaryGetRequest defines the request schema for `/income/verification/summary/get`.
public type IncomeVerificationSummaryGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# An object representing a monetary amount.
public type Pay record {
    # A numerical amount of a specific currency.
    decimal? amount?;
    # Currency code, e.g. USD
    string? currency?;
};

# Defines the response schema for `/transfer/list`
public type TransferListResponse record {
    # An array of objects which represent transfer information
    Transfer[] transfers;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

public type AddressNullable record {
    *Address;
};

# The `item_id` of the Item associated with this webhook, warning, or error
public type ItemId string;

# Fired when an Item was not verified via automated micro-deposits after ten days since the automated micro-deposit was made.
public type VerificationExpiredWebhook record {
    # `AUTH`
    string webhook_type;
    # `VERIFICATION_EXPIRED`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # The `account_id` of the account associated with the webhook
    string account_id;
};

# A filter to apply to `loan`-type accounts
public type LoanFilter record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes;
};

# The account number and sort code of the recipient's account.
public type RecipientBACSNullable record {
    *RecipientBACS;
};

# The schema below describes the various `types` and corresponding `subtypes` that Plaid recognizes and reports for financial institution accounts.
public type StandaloneAccountType record {
    # An account type holding cash, in which funds are deposited. Supported products for `depository` accounts are: Auth, Balance, Transactions, Identity, Payment Initiation, and Assets.
    DepositoryAccount depository;
    # A credit card type account. Supported products for `credit` accounts are: Balance, Transactions, Identity, and Liabilities.
    CreditAccount credit;
    # A loan type account. Supported products for `loan` accounts are: Balance, Liabilities, and Transactions.
    LoanAccount loan;
    # An investment account. Supported products for `investment` accounts are: Balance and Investments.
    InvestmentAccountSubtype investment;
    # Other or unknown account type. Supported products for `other` accounts are: Balance, Transactions, Identity, and Assets.
    string other;
};

# SandboxPublicTokenCreateRequest defines the request schema for `/sandbox/public_token/create`
public type SandboxPublicTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the institution the Item will be associated with
    string institution_id;
    # The products to initially pull for the Item. May be any products that the specified `institution_id`  supports. This array may not be empty.
    @constraint:Array {minLength: 1}
    Products[] initial_products;
    # An optional set of options to be used when configuring the Item. If specified, must not be `null`.
    SandboxPublicTokenCreateRequestOptions options?;
};

# AssetReportCreateResponse defines the response schema for `/asset_report/create`
public type AssetReportCreateResponse record {
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive.
    AssetReportId asset_report_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationPaymentListRequest defines the request schema for `/payment_initiation/payment/list`
public type PaymentInitiationPaymentListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The maximum number of payments to return. If `count` is not specified, a maximum of 10 payments will be returned, beginning with the most recent payment before the cursor (if specified).
    int? count?;
    # A string in RFC 3339 format (i.e. "2019-12-06T22:35:49Z"). Only payments created before the cursor will be returned.
    string? cursor?;
};

# DepositSwitchAltCreateResponse defines the response schema for `/deposit_switch/alt/create`
public type DepositSwitchAltCreateResponse record {
    # ID of the deposit switch. This ID is persisted throughout the lifetime of the deposit switch.
    string deposit_switch_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The status of an institution is determined by the health of its Item logins, Transactions updates, Investments updates, Liabilities updates, Auth requests, Balance requests, Identity requests, Investments requests, and Liabilities requests. A login attempt is conducted during the initial Item add in Link. If there is not enough traffic to accurately calculate an institution's status, Plaid will return null rather than potentially inaccurate data.
# 
# Institution status is accessible in the Dashboard and via the API using the `/institutions/get_by_id` endpoint with the `include_status` option set to true. Note that institution status is not available in the Sandbox environment.
public type InstitutionStatus record {
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus item_logins;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus transactions_updates;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus auth;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus balance;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus identity;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus investments_updates;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus liabilities_updates?;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus liabilities?;
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests, Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and Item logins each have their own status object.
    ProductStatus investments?;
    # Details of recent health incidents associated with the institution.
    HealthIncident[]? health_incidents?;
};

# Fired when an Item's webhook is updated. This will be sent to the newly specified webhook.
public type WebhookUpdateAcknowledgedWebhook record {
    # `ITEM`
    string webhook_type;
    # `WEBHOOK_UPDATE_ACKNOWLEDGED`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # The new webhook URL
    string new_webhook_url;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
};

# ItemImportResponse defines the response schema for `/item/import`
public type ItemImportResponse record {
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Specify the list of investments transactions on the account.
public type InvestmentsTransactionsoverride record {
    # Posting date for the transaction. Must be formatted as an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) date.
    string date;
    # The institution's description of the transaction.
    string name;
    # The number of units of the security involved in this transaction. Must be positive if the type is a buy and negative if the type is a sell.
    decimal quantity;
    # The price of the security at which this transaction occurred.
    decimal price;
    # The combined value of all fees applied to this transaction.
    decimal fees?;
    # The type of the investment transaction. Possible values are:
    # `buy`: Buying an investment
    # `sell`: Selling an investment
    # `cash`: Activity that modifies a cash position
    # `fee`: A fee on the account
    # `transfer`: Activity that modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer
    string 'type;
    # Either a valid `iso_currency_code` or `unofficial_currency_code`
    string currency;
    # Specify the security associated with the holding or investment transaction. When inputting custom security data to the Sandbox, Plaid will perform post-data-retrieval normalization and enrichment. These processes may cause the data returned by the Sandbox to be slightly different from the data you input. An ISO-4217 currency code and a security identifier (`ticker_symbol`, `cusip`, `isin`, or `sedol`) are required.
    SecurityOverride security?;
};

# AssetReportFilterRequest defines the request schema for `/asset_report/filter`
public type AssetReportFilterRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # The accounts to exclude from the Asset Report, identified by `account_id`.
    string[] account_ids_to_exclude;
};

# In the `bank_initiated_return_risk` object, there are eight risk tiers corresponding to the scores:
#   1: Predicted bank-initiated return incidence rate between 0.0% - 0.5%
#   2: Predicted bank-initiated return incidence rate between 0.5% - 1.5%
#   3: Predicted bank-initiated return incidence rate between 1.5% - 3%
#   4: Predicted bank-initiated return incidence rate between 3% - 5%
#   5: Predicted bank-initiated return incidence rate between 5% - 10%
#   6: Predicted bank-initiated return incidence rate between 10% - 15%
#   7: Predicted bank-initiated return incidence rate between 15% and 50%
#   8: Predicted bank-initiated return incidence rate greater than 50%
@constraint:Int {minValue: 1, maxValue: 8}
public type BankInitiatedRiskTier int;

# The `inflow_model` allows you to model a test account that receives regular income or make regular payments on a loan. Any transactions generated by the `inflow_model` will appear in addition to randomly generated test data or transactions specified by `override_accounts`.
public type InflowModel record {
    # Inflow model. One of the following:
    # 
    # `none`: No income
    # `monthly-income`: Income occurs once per month `monthly-balance-payment`: Pays off the balance on a liability account at the given statement day of month
    # `monthly-interest-only-payment`: Makes an interest-only payment on a liability account at the given statement day of month. Note that account types supported by Liabilities will accrue interest in the Sandbox. The types are account_type `credit` with subtype `credit` or `paypal`, and account_type `loan` with subtype `student` or `mortgage`.
    string 'type;
    # Amount of income per month. This value is required if `type` is `monthly-income`.
    decimal income_amount;
    # Number between 1 and 28, or `last` meaning the last day of the month. The day of the month on which the income transaction will appear. The name of the income transaction. This field is required if `type` is `monthly-income`, `monthly-balance-payment` or `monthly-interest-only-payment`.
    decimal payment_day_of_month;
    # The name of the income transaction. This field is required if `type` is `monthly-income`, `monthly-balance-payment` or `monthly-interest-only-payment`.
    string transaction_name;
    # Number between 1 and 28, or `last` meaning the last day of the month. The day of the month on which the balance is calculated for the next payment. The name of the income transaction. This field is required if `type` is `monthly-balance-payment` or `monthly-interest-only-payment`.
    string statement_day_of_month;
};

# ItemAccessTokenInvalidateRequest defines the request schema for `/item/access_token/invalidate`
public type ItemAccessTokenInvalidateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
};

# An account type holding cash, in which funds are deposited. Supported products for `depository` accounts are: Auth, Balance, Transactions, Identity, Payment Initiation, and Assets.
public type DepositoryAccount record {
    # Checking account
    string checking;
    # Savings account
    string savings;
    # Health Savings Account (US only) that can only hold cash
    string hsa;
    # Certificate of deposit account
    string cd;
    # Money market account
    string 'money\ market;
    # PayPal depository account
    string paypal;
    # Prepaid debit card
    string prepaid;
    # A cash management account, typically a cash account at a brokerage
    string 'cash\ management;
    # An Electronic Benefit Transfer (EBT) account, used by certain public assistance programs to distribute funds (US only)
    string ebt;
};

# An optional object to filter `/investments/holdings/get` results. If provided, must not be `null`.
public type InvestmentHoldingsGetRequestOptions record {
    # An array of `account_id`s to retrieve for the Item. An error will be returned if a provided `account_id` is not associated with the Item.
    string[] account_ids?;
};

# ProcessorTokenCreateRequest defines the request schema for `/processor/token/create`
public type ProcessorTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `account_id` value obtained from the `onSuccess` callback in Link
    string account_id;
    # The processor you are integrating with.
    string processor;
};

# ProcessorAuthGetRequest defines the request schema for `/processor/auth/get`
public type ProcessorAuthGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The processor token obtained from the Plaid integration partner. Processor tokens are in the format: `processor-<environment>-<identifier>`
    ProcessorToken processor_token;
};

# A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
public type AssetReportToken string;

# InstitutionsGetByIdRequest defines the request schema for `/institutions/get_by_id`
public type InstitutionsGetByIdRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the institution to get details about
    string institution_id;
    # Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.
    CountryCode[] country_codes;
    # Specifies optional parameters for `/institutions/get_by_id`. If provided, must not be `null`.
    InstitutionsGetByIdRequestOptions options?;
};

# Represents a bank transfer within the Bank Transfers API.
public type BankTransfer record {
    # Plaid’s unique identifier for a bank transfer.
    BankTransferID id;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class;
    # The account ID that should be credited/debited for this bank transfer.
    string account_id;
    # The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    BankTransferType 'type;
    # The legal name and other information for the account holder.
    BankTransferUser user;
    # The amount of the bank transfer (decimal string with two digits of precision e.g. “10.00”).
    BankTransferAmount amount;
    # The currency of the transfer amount, e.g. "USD"
    string iso_currency_code;
    # The description of the transfer.
    string description;
    # The datetime when this bank transfer was created. This will be of the form `2006-01-02T15:04:05Z`
    string created;
    # The status of the transfer.
    BankTransferStatus status;
    # The network or rails used for the transfer. Valid options are `ach`, `same-day-ach`, or `wire`.
    BankTransferNetwork network;
    # When `true`, you can still cancel this bank transfer.
    boolean cancellable;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    BankTransferFailure? failure_reason;
    # A string containing the custom tag provided by the client in the create request. Will be null if not provided.
    string? custom_tag;
    # The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
    # - The JSON values must be Strings (no nested JSON objects allowed)
    # - Only ASCII characters may be used
    # - Maximum of 50 key/value pairs
    # - Maximum key length of 40 characters
    # - Maximum value length of 500 characters
    BankTransferMetadata? metadata;
    # Plaid’s unique identifier for the origination account that was used for this transfer.
    string origination_account_id;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    BankTransferDirection? direction;
};

# The request ID associated with this call.
public type ApplicationGetResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
    # Metadata about the application
    Application application;
};

# Details about the end user initiating the transaction (i.e., the account holder).
public type SignalUser record {
    # The user's legal name
    SignalPersonName? name?;
    # The user's phone number, in E.164 format: +{countrycode}{number}. For example: "+14151234567"
    string? phone_number?;
    # The user's email address.
    string? email_address?;
    # Data about the components comprising an address.
    SignalAddressData? address?;
};

# `investment:` Investment account
# 
# `credit:` Credit card
# 
# `depository:` Depository account
# 
# `loan:` Loan account
# 
# `other:` Non-specified account type
# 
# See the [Account type schema](https://plaid.com/docs/api/accounts#account-type-schema) for a full listing of account types and corresponding subtypes.
public type OverrideAccountType string;

# Defines the response schema for `/bank_transfer/cancel`
public type BankTransferCancelResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# SandboxItemFireWebhookResponse defines the response schema for `/sandbox/item/fire_webhook`
public type SandboxItemFireWebhookResponse record {
    # Value is `true`  if the test` webhook_code`  was successfully fired.
    boolean webhook_fired;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# AuthGetRequest defines the request schema for `/auth/get`
public type AuthGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # An optional object to filter `/auth/get` results.
    AuthGetRequestOptions options?;
};

# Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
public type APIClientID string;

# AssetReportPDFGetRequest defines the request schema for `/asset_report/pdf/get`
public type AssetReportPDFGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
};

# The legal name and other information for the account holder.
public type TransferUserInResponse record {
    # The user's legal name.
    string legal_name;
    # The user's phone number.
    string? phone_number;
    # The user's email address.
    string? email_address;
    # The address associated with the account holder.
    TransferUserAddressInResponse? address;
};

public type SignalDecisionReportResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationPaymentCreateResponse defines the response schema for `/payment_initiation/payment/create`
public type PaymentInitiationPaymentCreateResponse record {
    # A unique ID identifying the payment
    string payment_id;
    # For a payment returned by this endpoint, there is only one possible value:
    # 
    # `PAYMENT_STATUS_INPUT_NEEDED`: The initial phase of the payment
    string status;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Information about the last webhook fired for the Item.
public type ItemStatusLastWebhook record {
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) timestamp of when the webhook was fired.
    string? sent_at?;
    # The last webhook code sent.
    string? code_sent?;
};

# Data about the components comprising an address.
public type AddressData record {
    # The full city name
    string city;
    # The region or state
    # Example: `"NC"`
    string? region;
    # The full street address
    # Example: `"564 Main Street, APT 15"`
    string street;
    # The postal code
    string? postal_code;
    # The ISO 3166-1 alpha-2 country code
    string? country;
};

# The user object allows you to provide additional information about the user to be appended to the Asset Report. All fields are optional. The `first_name`, `last_name`, and `ssn` fields are required if you would like the Report to be eligible for Fannie Mae’s Day 1 Certainty™ program.
public type AssetReportUser record {
    # An identifier you determine and submit for the user.
    string? client_user_id?;
    # The user's first name. Required for the Fannie Mae Day 1 Certainty™ program.
    string? first_name?;
    # The user's middle name
    string? middle_name?;
    # The user's last name.  Required for the Fannie Mae Day 1 Certainty™ program.
    string? last_name?;
    # The user's Social Security Number. Required for the Fannie Mae Day 1 Certainty™ program.
    # 
    # Format: "ddd-dd-dddd"
    string? ssn?;
    # The user's phone number, in E.164 format: +{countrycode}{number}. For example: "+14151234567". Phone numbers provided in other formats will be parsed on a best-effort basis.
    string? phone_number?;
    # The user's email address.
    string? email?;
};

# LinkTokenCreateResponse defines the response schema for `/link/token/create`
public type LinkTokenCreateResponse record {
    # A `link_token`, which can be supplied to Link in order to initialize it and receive a `public_token`, which can be exchanged for an `access_token`.
    string link_token;
    # The expiration date for the `link_token`, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format. A `link_token` created to generate a `public_token` that will be exchanged for a new `access_token` expires after 4 hours. A `link_token` created for an existing Item (such as when updating an existing `access_token` by launching Link in update mode) expires after 30 minutes.
    string expiration;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Fired when the status of a payment has changed.
public type PaymentStatusUpdateWebhook record {
    # `PAYMENT_INITIATION`
    string webhook_type;
    # `PAYMENT_STATUS_UPDATE`
    string webhook_code;
    # The `payment_id` for the payment being updated
    string payment_id;
    # The new status of the payment.
    # 
    # `PAYMENT_STATUS_INPUT_NEEDED`: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.
    # 
    # `PAYMENT_STATUS_PROCESSING`: The payment is currently being processed. The payment will automatically exit this state when processing is complete.
    # 
    # `PAYMENT_STATUS_INITIATED`: The payment has been successfully initiated and is considered complete.
    # 
    # `PAYMENT_STATUS_COMPLETED`: Indicates that the standing order has been successfully established. This state is only used for standing orders.
    # 
    # `PAYMENT_STATUS_INSUFFICIENT_FUNDS`: The payment has failed due to insufficient funds.
    # 
    # `PAYMENT_STATUS_FAILED`: The payment has failed to be initiated. This error is retryable once the root cause is resolved.
    # 
    # `PAYMENT_STATUS_BLOCKED`: The payment has been blocked. This is a retryable error.
    # 
    # `PAYMENT_STATUS_UNKNOWN`: The payment status is unknown.
    string new_payment_status;
    # The previous status of the payment.
    # 
    # `PAYMENT_STATUS_INPUT_NEEDED`: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.
    # 
    # `PAYMENT_STATUS_PROCESSING`: The payment is currently being processed. The payment will automatically exit this state when processing is complete.
    # 
    # `PAYMENT_STATUS_INITIATED`: The payment has been successfully initiated and is considered complete.
    # 
    # `PAYMENT_STATUS_COMPLETED`: Indicates that the standing order has been successfully established. This state is only used for standing orders.
    # 
    # `PAYMENT_STATUS_INSUFFICIENT_FUNDS`: The payment has failed due to insufficient funds.
    # 
    # `PAYMENT_STATUS_FAILED`: The payment has failed to be initiated. This error is retryable once the root cause is resolved.
    # 
    # `PAYMENT_STATUS_BLOCKED`: The payment has been blocked. This is a retryable error.
    # 
    # `PAYMENT_STATUS_UNKNOWN`: The payment status is unknown.
    string old_payment_status;
    # The original value of the reference when creating the payment.
    string? original_reference;
    # The value of the reference sent to the bank after adjustment to pass bank validation rules.
    string? adjusted_reference?;
    # The original value of the `start_date` provided during the creation of a standing order. If the payment is not a standing order, this field will be `null`.
    string? original_start_date;
    # The start date sent to the bank after adjusting for holidays or weekends.  Will be provided in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). If the start date did not require adjustment, or if the payment is not a standing order, this field will be `null`.
    string? adjusted_start_date;
    # The timestamp of the update, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `"2017-09-14T14:42:19.350Z"`
    string timestamp;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
};

# ItemApplicationScopesUpdateRequest defines the request schema for `/item/application/scopes/update`
public type ItemApplicationScopesUpdateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # This field will map to the application ID that is returned from /item/applications/list, or provided to the institution in an oauth redirect.
    ApplicationID application_id;
    # The scopes object
    Scopes scopes;
    # When scopes are updated during enrollment, this field must be populated with the state sent to the partner in the OAuth Login URI. This field is required when the context is `ENROLLMENT`.
    ScopesState state?;
    # An indicator for when scopes are being updated. When scopes are updated via enrollment (i.e. OAuth), the partner must send `ENROLLMENT`. When scopes are updated in a post-enrollment view, the partner must send `PORTAL`.
    ScopesContext context;
};

# IncomeVerificationDocumentsDownloadRequest defines the request schema for `/income/verification/documents/download`.
public type IncomeVerificationDocumentsDownloadRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# IncomeVerificationTaxformsGetResponse defines the response schema for `/income/verification/taxforms/get`
public type IncomeVerificationTaxformsGetResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id?;
    # A list of taxforms.
    Taxform[] taxforms;
    # An array of objects representing metadata from the end user's uploaded document.
    DocumentMetadata[] document_metadata;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
};

# Defines the request schema for `/bank_transfer/list`
public type BankTransferListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? start_date?;
    # The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? end_date?;
    # The maximum number of bank transfers to return.
    @constraint:Int {minValue: 1, maxValue: 25}
    int count?;
    # The number of bank transfers to skip before returning results.
    int offset?;
    # Filter bank transfers to only those originated through the specified origination account.
    string? origination_account_id?;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    BankTransferDirection? direction?;
};

# Identifying information for transferring money to or from a US account via ACH or wire transfer.
public type NumbersACHNullable record {
    *NumbersACH;
};

# AccountsBalanceGetRequest defines the request schema for `/accounts/balance/get`
public type AccountsBalanceGetRequest record {
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # An optional object to filter `/accounts/balance/get` results.
    AccountsBalanceGetRequestOptions options?;
};

# An optional object to filter `/accounts/get` results.
public type AccountsGetRequestOptions record {
    # An array of `account_ids` to retrieve for the Account.
    string[] account_ids?;
};

public type InstitutionsSearchAccountFilter record {
    AccountSubtype[] loan?;
    AccountSubtype[] depository?;
    AccountSubtype[] credit?;
    AccountSubtype[] investment?;
};

# PaymentInitiationRecipientGetResponse defines the response schema for `/payment_initiation/recipient/get`
public type PaymentInitiationRecipientGetResponse record {
    *PaymentInitiationRecipient;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id?;
};

# PaymentInitiationPaymentCreateRequest defines the request schema for `/payment_initiation/payment/create`
public type PaymentInitiationPaymentCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the recipient the payment is for.
    @constraint:String {minLength: 1}
    string recipient_id;
    # A reference for the payment. This must be an alphanumeric string with at most 18 characters and must not contain any special characters (since not all institutions support them).
    @constraint:String {maxLength: 18, minLength: 1}
    string reference;
    # The amount and currency of a payment
    PaymentAmount amount;
    # The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up as a standing order. If no schedule is specified, the payment will be executed only once.
    ExternalPaymentScheduleRequest schedule?;
    # Additional payment options
    ExternalPaymentOptions? options?;
};

# Defines the request schema for `/transfer/list`
public type TransferListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The start datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? start_date?;
    # The end datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? end_date?;
    # The maximum number of transfers to return.
    @constraint:Int {minValue: 1, maxValue: 25}
    int count?;
    # The number of transfers to skip before returning results.
    int offset?;
    # Filter transfers to only those originated through the specified origination account.
    string? origination_account_id?;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    TransferDirection? direction?;
};

# A list of account subtypes to be filtered.
public type AccountFilterSubtypes string[];

# AssetReportGetRequest defines the request schema for `/asset_report/get`
public type AssetReportGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # `true` if you would like to retrieve the Asset Report with Insights, `false` otherwise. This field defaults to `false` if omitted.
    boolean include_insights?;
};

# InstitutionsGetRequest defines the request schema for `/institutions/get`
public type InstitutionsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The total number of Institutions to return.
    @constraint:Int {maxValue: 500}
    int count;
    # The number of Institutions to skip.
    int offset;
    # Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.
    @constraint:Array {minLength: 1}
    CountryCode[] country_codes;
    # An optional object to filter `/institutions/get` results.
    InstitutionsGetRequestOptions options?;
};

public type PaystubDeduction record {
    # The description of the deduction, as provided on the paystub. For example: `"401(k)"`, `"FICA MED TAX"`.
    string? 'type;
    # `true` if the deduction is pre-tax; `false` otherwise.
    boolean? is_pretax;
    # The amount of the deduction.
    decimal? total;
};

# A physical mailing address.
public type Address record {
    # Data about the components comprising an address.
    AddressData data;
    # When `true`, identifies the address as the primary address on an account.
    boolean primary?;
};

# The legal name and other information for the account holder.
public type BankTransferUser record {
    # The account holder’s full legal name. If the transfer description is `ccd`, this should be the business name of the account holder.
    string legal_name;
    # The account holder’s email.
    string? email_address?;
    # The account holder's routing number. This field is only used in response data. Do not provide this field when making requests.
    string routing_number?;
};

# Details relating to a specific financial institution
public type Institution record {
    # Unique identifier for the institution
    string institution_id;
    # The official name of the institution
    string name;
    # A list of the Plaid products supported by the institution. Note that only institutions that support Instant Auth will return `auth` in the product array; institutions that do not list `auth` may still support other Auth methods such as Instant Match or Automated Micro-deposit Verification. For more details, see [Full Auth coverage](https://plaid.com/docs/auth/coverage/).
    Products[] products;
    # A list of the country codes supported by the institution.
    CountryCode[] country_codes;
    # The URL for the institution's website
    string? url?;
    # Hexadecimal representation of the primary color used by the institution
    string? primary_color?;
    # Base64 encoded representation of the institution's logo
    string? logo?;
    # A partial list of routing numbers associated with the institution. This list is provided for the purpose of looking up institutions by routing number. It is not comprehensive and should never be used as a complete list of routing numbers for an institution.
    string[]? routing_numbers;
    # Indicates that the institution has an OAuth login flow. This is primarily relevant to institutions with European country codes.
    boolean oauth;
    # The status of an institution is determined by the health of its Item logins, Transactions updates, Investments updates, Liabilities updates, Auth requests, Balance requests, Identity requests, Investments requests, and Liabilities requests. A login attempt is conducted during the initial Item add in Link. If there is not enough traffic to accurately calculate an institution's status, Plaid will return null rather than potentially inaccurate data.
    # 
    # Institution status is accessible in the Dashboard and via the API using the `/institutions/get_by_id` endpoint with the `include_status` option set to true. Note that institution status is not available in the Sandbox environment.
    InstitutionStatus status?;
    # Metadata that captures what specific payment configurations an institution supports when making Payment Initiation requests.
    PaymentInitiationMetadata? payment_initiation_metadata?;
};

public type Taxform record {
    # The type of tax document.
    string document_type;
    # W2 is an object that represents income data taken from a W2 tax document.
    W2 w2?;
};

# The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
# - The JSON values must be Strings (no nested JSON objects allowed)
# - Only ASCII characters may be used
# - Maximum of 50 key/value pairs
# - Maximum key length of 40 characters
# - Maximum value length of 500 characters
public type TransferMetadata record {
};

# IncomeVerificationTaxformsGetRequest defines the request schema for `/income/verification/taxforms/get`
public type IncomeVerificationTaxformsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# Fired when new transaction data is available for an Item. Plaid will typically check for new transaction data several times a day.
public type DefaultUpdateWebhook record {
    # `TRANSACTIONS`
    string webhook_type;
    # `DEFAULT_UPDATE`
    string webhook_code;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # The number of new transactions detected since the last time this webhook was fired.
    decimal new_transactions;
    # The `item_id` of the Item the webhook relates to.
    string item_id;
};

# An optional object to filter `/asset_report/create` results. If provided, must be non-`null`. The optional `user` object is required for the report to be eligible for Fannie Mae's Day 1 Certainty program.
public type AssetReportCreateRequestOptions record {
    # Client-generated identifier, which can be used by lenders to track loan applications.
    string client_report_id?;
    # URL to which Plaid will send Assets webhooks, for example when the requested Asset Report is ready.
    string webhook?;
    # The user object allows you to provide additional information about the user to be appended to the Asset Report. All fields are optional. The `first_name`, `last_name`, and `ssn` fields are required if you would like the Report to be eligible for Fannie Mae’s Day 1 Certainty™ program.
    AssetReportUser user?;
};

# This field will map to the application ID that is returned from /item/applications/list, or provided to the institution in an oauth redirect.
public type ApplicationID string;

public type SignalScores record {
    # The object contains a risk score and a risk tier that evaluate the transaction return risk of an unauthorized debit. Common return codes in this category include: “R05”, "R07", "R10", "R11", "R29". These returns typically have a return time frame of up to 60 calendar days. During this period, the customer of financial institutions can dispute a transaction as unauthorized.
    CustomerInitiatedReturnRisk customer_initiated_return_risk?;
    # The object contains a risk score and a risk tier that evaluate the transaction return risk because an account is overdrawn or because an ineligible account is used. Common return codes in this category include: "R01", "R02", "R03", "R04", "R06", “R08”,  "R09", "R13", "R16", "R17", "R20", "R23". These returns have a turnaround time of 2 banking days.
    BankInitiatedReturnRisk bank_initiated_return_risk?;
};

# Metadata that captures what specific payment configurations an institution supports when making Payment Initiation requests.
public type PaymentInitiationMetadata record {
    # Indicates whether the institution supports payments from a different country.
    boolean supports_international_payments;
    # A mapping of currency to maximum payment amount (denominated in the smallest unit of currency) supported by the insitution.
    # 
    # Example: `{"GBP": "10000"}`
    record {} maximum_payment_amount;
    # Indicates whether the institution supports returning refund details when initiating a payment.
    boolean supports_refund_details;
    # Metadata specifically related to valid Payment Initiation standing order configurations for the institution.
    PaymentInitiationStandingOrderMetadata? standing_order_metadata;
};

# The rationale for Plaid's decision regarding a proposed transfer. Will be null for `approved` decisions.
public type TransferAuthorizationDecisionRationale record {
    # A code representing the rationale for permitting or declining the proposed transfer. Possible values are:
    # 
    # `NSF` – Transaction likely to result in a return due to insufficient funds.
    # 
    # `RISK` - Transaction is high-risk.
    # 
    # `MANUALLY_VERIFIED_ITEM` – Item created via same-day micro deposits, limited information available. Plaid can only offer `permitted` as a transaction decision.
    # 
    # `LOGIN_REQUIRED` – Unable to collect the account information required for an authorization decision due to Item staleness. Can be rectified using Link update mode.
    # 
    # `ERROR` – Unable to collect the account information required for an authorization decision due to an error.
    string code;
    # A human-readable description of the code associated with a permitted transfer or transfer decline.
    string description;
};

# LinkTokenGetRequest defines the request schema for `/link/token/get`
public type LinkTokenGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A `link_token` from a previous invocation of `/link/token/create`
    string link_token;
};

# Fired when new or updated holdings have been detected on an investment account. The webhook typically fires once per day, after market close, in response to any newly added holdings or price changes to existing holdings.
public type HoldingsDefaultUpdateWebhook record {
    # `HOLDINGS`
    string webhook_type;
    # `DEFAULT_UPDATE`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # The number of new holdings reported since the last time this webhook was fired.
    decimal new_holdings;
    # The number of updated holdings reported since the last time this webhook was fired.
    decimal updated_holdings;
};

# The product access being requested. Used to or disallow product access across all accounts. If unset, defaults to all products allowed.
public type ProductAccess record {
    # Allow access to statements. If unset, defaults to `true`.
    boolean? statements?;
    # Allow access to the Identity product (name, email, phone, address). If unset, defaults to `true`.
    boolean? identity?;
    # Allow access to account number details. If unset, defaults to `true`.
    boolean? auth?;
    # Allow access to transaction details. If unset, defaults to `true`.
    boolean? transactions?;
};

# By default, Link will only display account types that are compatible with all products supplied in the `products` parameter of `/link/token/create`. You can further limit the accounts shown in Link by using `account_filters` to specify the account subtypes to be shown in Link. Only the specified subtypes will be shown. This filtering applies to both the Account Select view (if enabled) and the Institution Select view. Institutions that do not support the selected subtypes will be omitted from Link. To indicate that all subtypes should be shown, use the value `"all"`. If the `account_filters` filter is used, any account type for which a filter is not specified will be entirely omitted from Link.
# 
# For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema).
# 
# For institutions using OAuth, the filter will not affect the list of institutions or accounts shown by the bank in the OAuth window.
public type LinkTokenCreateRequestAccountSubtypes record {
    # A filter to apply to `depository`-type accounts
    LinktokencreaterequestaccountsubtypesDepository depository?;
    # A filter to apply to `credit`-type accounts
    LinktokencreaterequestaccountsubtypesCredit credit?;
    # A filter to apply to `loan`-type accounts
    LinktokencreaterequestaccountsubtypesLoan loan?;
    # A filter to apply to `investment`-type accounts
    LinktokencreaterequestaccountsubtypesInvestment investment?;
};

# PaymentInitiationPaymentListResponse defines the response schema for `/payment_initiation/payment/list`
public type PaymentInitiationPaymentListResponse record {
    # An array of payments that have been created, associated with the given `client_id`.
    PaymentInitiationPayment[] payments;
    # The value that, when used as the optional `cursor` parameter to `/payment_initiation/payment/list`, will return the next unreturned payment as its first payment.
    string? next_cursor;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object representing information about a distribution from the paycheck (for example, the amount distributed to a specific checking account, or to a retirement plan).
public type DistributionDetails record {
    # The account number of the account being deposited to.
    string? account_number?;
    # The type of bank account (e.g. Checking or Savings)
    string? bank_account_type?;
    # The name of the bank that the payment is being deposited to.
    string? bank_name?;
    # An object representing a monetary amount.
    Pay current_pay?;
    # A description of the distribution type.
    string? description?;
};

# A detailed breakdown of the institution's performance for a request type. The values for `success`, `error_plaid`, and `error_institution` sum to 1.
public type ProductStatusBreakdown record {
    # The percentage of login attempts that are successful, expressed as a decimal.
    decimal success;
    # The percentage of logins that are failing due to an internal Plaid issue, expressed as a decimal.
    decimal error_plaid;
    # The percentage of logins that are failing due to an issue in the institution's system, expressed as a decimal.
    decimal error_institution;
    # The `refresh_interval` may be `DELAYED` or `STOPPED` even when the success rate is high. This value is only returned for Transactions status breakdowns.
    string refresh_interval?;
};

# ItemAccessTokenInvalidateResponse defines the response schema for `/item/access_token/invalidate`
public type ItemAccessTokenInvalidateResponse record {
    # The access token associated with the Item data is being requested for.
    AccessToken new_access_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Metadata about the application
public type Application record {
    # This field will map to the application ID that is returned from /item/applications/list, or provided to the institution in an oauth redirect.
    ApplicationID application_id;
    # The name of the application
    string name;
    # The date this application was linked in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format in UTC.
    string created_at;
    # A URL that links to the application logo image.
    string? logo_url;
    # The URL for the application's website
    string? application_url;
    # A string provided by the connected app stating why they use their respective enabled products.
    string? reason_for_access;
};

# AssetReportAuditCopyRemoveResponse defines the response schema for `/asset_report/audit_copy/remove`
public type AssetReportAuditCopyRemoveResponse record {
    # `true` if the Audit Copy was successfully removed.
    boolean removed;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Selling an investment
public type StandaloneInvestmentTransactionSellType record {
    # Outflow of assets from a tax-advantaged account
    string distribution?;
    # Exercise of an option or warrant contract
    string exercise?;
    # Sell to close or decrease an existing holding
    string sell?;
    # Sell to open a short position
    string 'sell\ short?;
};

# ItemRemoveRequest defines the request schema for `/item/remove`
public type ItemRemoveRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
};

# LiabilitiesGetResponse defines the response schema for `/liabilities/get`
public type LiabilitiesGetResponse record {
    # An array of accounts associated with the Item
    AccountBase[] accounts;
    # Metadata about the Item.
    Item item;
    # An object containing liability accounts
    LiabilitiesObject liabilities;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# It is possible for an Asset Report to be returned with missing account owner information. In such cases, the Asset Report will contain warning data in the response, indicating why obtaining the owner information failed.
public type Warning record {
    # The warning type, which will always be `ASSET_REPORT_WARNING`
    string warning_type;
    # The warning code identifies a specific kind of warning. Currently, the only possible warning code is `OWNERS_UNAVAILABLE`, which indicates that account-owner information is not available.
    string warning_code;
    # An error object and associated `item_id` used to identify a specific Item and error when a batch operation operating on multiple Items has encountered an error in one of the Items.
    Cause cause;
};

# An optional object to filter `/institutions/get` results.
public type InstitutionsGetRequestOptions record {
    # Filter the Institutions based on which products they support. 
    Products[] products?;
    # Specify an array of routing numbers to filter institutions. The response will only return institutions that match all of the routing numbers in the array.
    string[] routing_numbers?;
    # Limit results to institutions with or without OAuth login flows. This is primarily relevant to institutions with European country codes.
    boolean oauth?;
    # When `true`, return the institution's homepage URL, logo and primary brand color.
    # 
    # Note that Plaid does not own any of the logos shared by the API, and that by accessing or using these logos, you agree that you are doing so at your own risk and will, if necessary, obtain all required permissions from the appropriate rights holders and adhere to any applicable usage guidelines. Plaid disclaims all express or implied warranties with respect to the logos.
    boolean include_optional_metadata?;
    # When `true`, returns metadata related to the Payment Initiation product indicating which payment configurations are supported.
    boolean include_payment_initiation_metadata?;
};

# WebhookVerificationKeyGetRequest defines the request schema for `/webhook_verification_key/get`
public type WebhookVerificationKeyGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The key ID ( `kid` ) from the JWT header.
    string key_id;
};

# ProcessorIdentityGetRequest defines the request schema for `/processor/identity/get`
public type ProcessorIdentityGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The processor token obtained from the Plaid integration partner. Processor tokens are in the format: `processor-<environment>-<identifier>`
    ProcessorToken processor_token;
};

# The amount of the bank transfer (decimal string with two digits of precision e.g. “10.00”).
public type BankTransferAmount string;

# SandboxPublicTokenCreateRequestOptionsTransactions is an optional set of parameters corresponding to transactions options.
public type SandboxPublicTokenCreateRequestOptionsTransactions record {
    # The earliest date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD.
    string start_date?;
    # The most recent date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD.
    string end_date?;
};

# The account number and sort code of the sender's account, if specified in the `/payment_initiation/payment/create` call.
public type SenderBACSNullable record {
    *RecipientBACS;
};

# The status of the transfer.
public type TransferStatus string;

# Plaid’s unique identifier for a bank transfer.
public type BankTransferID string;

# The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up as a standing order. If no schedule is specified, the payment will be executed only once.
public type ExternalPaymentScheduleRequest record {
    *ExternalPaymentScheduleBase;
};

# The address associated with the account holder.
public type TransferUserAddressInRequest record {
    # The street number and name (i.e., "100 Market St.").
    string street?;
    # Ex. "San Francisco"
    string city?;
    # The state or province (e.g., "California").
    string region?;
    # The postal code (e.g., "94103").
    string postal_code?;
    # A two-letter country code (e.g., "US").
    string country?;
};

# Defines the response schema for `/sandbox/oauth/select_accounts`
public type SandboxOauthSelectAccountsResponse record {
};

# An object representing data extracted from the end user's paystub.
public type Paystub record {
    # An object with the deduction information found on a paystub.
    Deductions deductions?;
    # An identifier of the document referenced by the document metadata.
    string doc_id?;
    # An object representing both a breakdown of earnings on a paystub and the total earnings.
    Earnings earnings?;
    # The information about the employer on the paystub.
    PaystubEmployer employer;
    # Data about the employee.
    Employee employee;
    # An object representing employment details found on a paystub.
    EmploymentDetails employment_details?;
    # An object representing information about the net pay amount on the paystub.
    NetPay net_pay?;
    # Details about the pay period.
    PayPeriodDetails pay_period_details;
    # An object representing details that can be found on the paystub.
    PaystubDetails paystub_details?;
    # Income information
    IncomeBreakdown[] income_breakdown;
    # The amount of income earned year to date, as based on paystub data.
    PaystubYTDDetails ytd_earnings;
};

# InvestmentsHoldingsGetRequest defines the request schema for `/investments/holdings/get`
public type InvestmentsHoldingsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # An optional object to filter `/investments/holdings/get` results. If provided, must not be `null`.
    InvestmentHoldingsGetRequestOptions options?;
};

# BankTransferSweepGetRequest defines the request schema for `/bank_transfer/sweep/get`
public type BankTransferSweepGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Identifier of the sweep.
    int sweep_id;
    # If multiple origination accounts are available, `origination_account_id` must be used to specify the account for which balance will be returned.
    string? origination_account_id?;
};

# Defines the request schema for `/transfer/cancel`
public type TransferCancelRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a transfer.
    TransferID transfer_id;
};

# Defines the response schema for `/transfer/event/list`
public type TransferEventListResponse record {
    # An array of transfer events in the Transfers API
    TransferEvent[] transfer_events;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# IncomeVerificationPaystubGetRequest defines the request schema for `/income/verification/paystub/get`.
# 
# # Deprecated
@deprecated
public type IncomeVerificationPaystubGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification for which to get paystub information.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# The application requires that accounts be limited to a specific cardinality.
# `MULTI_SELECT`: indicates that the user should be allowed to pick multiple accounts.
# `SINGLE_SELECT`: indicates that the user should be allowed to pick only a single account.
# `ALL`: indicates that the user must share all of their accounts and should not be given the opportunity to de-select
public type AccountSelectionCardinality string;

# A filter to apply to `depository`-type accounts
public type DepositoryFilter record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes;
};

# See the [Account type schema](https://plaid.com/docs/api/accounts/#account-type-schema) for a full listing of account types and corresponding subtypes.
public type AccountSubtype string?;

# A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive.
public type AssetReportId string;

# The frequency interval of the payment.
@constraint:String {minLength: 1}
public type PaymentScheduleInterval string;

# Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
public type TransferDirection string?;

# The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up as a standing order. If no schedule is specified, the payment will be executed only once.
public type ExternalPaymentScheduleBase record {
    # The frequency interval of the payment.
    PaymentScheduleInterval interval?;
    # The day of the interval on which to schedule the payment.
    # 
    # If the payment interval is weekly, `interval_execution_day` should be an integer from 1 (Monday) to 7 (Sunday).
    # 
    # If the payment interval is monthly, `interval_execution_day` should be an integer indicating which day of the month to make the payment on. Integers from 1 to 28 can be used to make a payment on that day of the month. Negative integers from -1 to -5 can be used to make a payment relative to the end of the month. To make a payment on the last day of the month, use -1; to make the payment on the second-to-last day, use -2, and so on.
    int interval_execution_day?;
    # A date in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). Standing order payments will begin on the first `interval_execution_day` on or after the `start_date`.
    # 
    # If the first `interval_execution_day` on or after the start date is also the same day that `/payment_initiation/payment/create` was called, the bank *may* make the first payment on that day, but it is not guaranteed to do so.
    string start_date?;
    # A date in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). Standing order payments will end on the last `interval_execution_day` on or before the `end_date`.
    # If the only `interval_execution_day` between the start date and the end date (inclusive) is also the same day that `/payment_initiation/payment/create` was called, the bank *may* make a payment on that day, but it is not guaranteed to do so.
    string? end_date?;
    # The start date sent to the bank after adjusting for holidays or weekends.  Will be provided in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). If the start date did not require adjustment, this field will be `null`.
    string? adjusted_start_date?;
};

# The verification refresh status. One of the following:
# 
# `"VERIFICATION_REFRESH_STATUS_USER_PRESENCE_REQUIRED"` User presence is required to refresh an income verification.
public type VerificationRefreshStatus string;

# A representation of a transaction
public type TransactionBase record {
    # Please use the `payment_channel` field, `transaction_type` will be deprecated in the future.
    # 
    # `digital:` transactions that took place online.
    # 
    # `place:` transactions that were made at a physical location.
    # 
    # `special:` transactions that relate to banks, e.g. fees or deposits.
    # 
    # `unresolved:` transactions that do not fit into the other three types.
    string transaction_type?;
    # The ID of a posted transaction's associated pending transaction, where applicable.
    string? pending_transaction_id?;
    # The ID of the category to which this transaction belongs. See [Categories](https://plaid.com/docs/#category-overview).
    # 
    # If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    string? category_id?;
    # A hierarchical array of the categories to which this transaction belongs. See [Categories](https://plaid.com/docs/#category-overview).
    # 
    # If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    string[]? category?;
    # A representation of where a transaction took place
    Location location?;
    # Transaction information specific to inter-bank transfers. If the transaction was not an inter-bank transfer, all fields will be `null`.
    # 
    # If the `transactions` object was returned by a Transactions endpoint such as `/transactions/get`, the `payment_meta` key will always appear, but no data elements are guaranteed. If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    PaymentMeta payment_meta?;
    # The name of the account owner. This field is not typically populated and only relevant when dealing with sub-accounts.
    string? account_owner?;
    # The merchant name or transaction description.
    # 
    # If the `transactions` object was returned by a Transactions endpoint such as `/transactions/get`, this field will always appear. If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    string name?;
    # The string returned by the financial institution to describe the transaction. For transactions returned by `/transactions/get`, this field is in beta and will be omitted unless the client is both enrolled in the closed beta program and has set `options.include_original_description` to `true`.
    string? original_description?;
    # The ID of the account in which this transaction occurred.
    string account_id;
    # The settled value of the transaction, denominated in the account's currency, as stated in `iso_currency_code` or `unofficial_currency_code`. Positive values when money moves out of the account; negative values when money moves in. For example, debit card purchases are positive; credit card payments, direct deposits, and refunds are negative.
    decimal amount;
    # The ISO-4217 currency code of the transaction. Always `null` if `unofficial_currency_code` is non-null.
    string? iso_currency_code;
    # The unofficial currency code associated with the transaction. Always `null` if `iso_currency_code` is non-`null`. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    string? unofficial_currency_code;
    # For pending transactions, the date that the transaction occurred; for posted transactions, the date that the transaction posted. Both dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DD` ).
    string date;
    # When `true`, identifies the transaction as pending or unsettled. Pending transaction details (name, type, amount, category ID) may change before they are settled.
    boolean pending;
    # The unique ID of the transaction. Like all Plaid identifiers, the `transaction_id` is case sensitive.
    string transaction_id;
};

# A single account at a financial institution.
public type AccountBase record {
    # Plaid’s unique identifier for the account. This value will not change unless Plaid can't reconcile the account with the data returned by the financial institution. This may occur, for example, when the name of the account changes. If this happens a new `account_id` will be assigned to the account.
    # 
    # The `account_id` can also change if the `access_token` is deleted and the same credentials that were used to generate that `access_token` are used to generate a new `access_token` on a later date. In that case, the new `account_id` will be different from the old `account_id`.
    # 
    # If an account with a specific `account_id` disappears instead of changing, the account is likely closed. Closed accounts are not returned by the Plaid API.
    # 
    # Like all Plaid identifiers, the `account_id` is case sensitive.
    string account_id;
    # A set of fields describing the balance for an account. Balance information may be cached unless the balance object was returned by `/accounts/balance/get`.
    AccountBalance balances;
    # The last 2-4 alphanumeric characters of an account's official account number. Note that the mask may be non-unique between an Item's accounts, and it may also not match the mask that the bank displays to the user.
    string? mask;
    # The name of the account, either assigned by the user or by the financial institution itself
    string name;
    # The official name of the account as given by the financial institution
    string? official_name;
    # `investment:` Investment account
    # 
    # `credit:` Credit card
    # 
    # `depository:` Depository account
    # 
    # `loan:` Loan account
    # 
    # `brokerage`: An investment account. Used for `/assets/` endpoints only; other endpoints use `investment`.
    # 
    # `other:` Non-specified account type
    # 
    # See the [Account type schema](https://plaid.com/docs/api/accounts#account-type-schema) for a full listing of account types and corresponding subtypes.
    AccountType 'type;
    # See the [Account type schema](https://plaid.com/docs/api/accounts/#account-type-schema) for a full listing of account types and corresponding subtypes.
    AccountSubtype? subtype;
    # The current verification status of an Auth Item initiated through Automated or Manual micro-deposits.  Returned for Auth Items only.
    # 
    # `pending_automatic_verification`: The Item is pending automatic verification
    # 
    # `pending_manual_verification`: The Item is pending manual micro-deposit verification. Items remain in this state until the user successfully verifies the two amounts.
    # 
    # `automatically_verified`: The Item has successfully been automatically verified	
    # 
    # `manually_verified`: The Item has successfully been manually verified
    # 
    # `verification_expired`: Plaid was unable to automatically verify the deposit within 7 calendar days and will no longer attempt to validate the Item. Users may retry by submitting their information again through Link.
    # 
    # `verification_failed`: The Item failed manual micro-deposit verification because the user exhausted all 3 verification attempts. Users may retry by submitting their information again through Link.	
    # 	
    string verification_status?;
};

# An indicator for when scopes are being updated. When scopes are updated via enrollment (i.e. OAuth), the partner must send `ENROLLMENT`. When scopes are updated in a post-enrollment view, the partner must send `PORTAL`.
public type ScopesContext string;

# The verification status. One of the following:
# 
# `"VERIFIED"`: The information was successfully verified.
# 
# `"UNVERIFIED"`: The verification has not yet been performed.
# 
# `"NEEDS_INFO"`: The verification was attempted but could not be completed due to missing information.
# 
# "`UNABLE_TO_VERIFY`": The verification was performed and the information could not be verified.
# 
# `"UNKNOWN"`: The verification status is unknown.
public type VerificationStatus string;

# A list of products that an institution can support. All Items must be initialized with at least one product. The Balance product is always available and does not need to be specified during initialization.
public type Products string;

# The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
public type BankTransferFailure record {
    # The ACH return code, e.g. `R01`.  A return code will be provided if and only if the transfer status is `reversed`. For a full listing of ACH return codes, see [Bank Transfers errors](https://plaid.com/docs/errors/bank-transfers/#ach-return-codes).
    string? ach_return_code?;
    # A human-readable description of the reason for the failure or reversal.
    string description?;
};

# When scopes are updated during enrollment, this field must be populated with the state sent to the partner in the OAuth Login URI. This field is required when the context is `ENROLLMENT`.
public type ScopesState string;

# Test password to use for the creation of the Sandbox Item. Default value is `pass_good`.
public type SandboxOverridePassword string?;

# The address of the student loan servicer. This is generally the remittance address to which payments should be sent.
public type ServicerAddressData record {
    # The full city name
    string? city;
    # The region or state
    # Example: `"NC"`
    string? region;
    # The full street address
    # Example: `"564 Main Street, APT 15"`
    string? street;
    # The postal code
    string? postal_code;
    # The ISO 3166-1 alpha-2 country code
    string? country;
};

# Data about the components comprising an address.
public type SignalAddressData record {
    # The full city name
    string city?;
    # The region or state
    # Example: `"NC"`
    string? region?;
    # The full street address
    # Example: `"564 Main Street, APT 15"`
    string street?;
    # The postal code
    string? postal_code?;
    # The ISO 3166-1 alpha-2 country code
    string? country?;
};

# An optional object to filter `/institutions/search` results.
public type InstitutionsSearchRequestOptions record {
    # Limit results to institutions with or without OAuth login flows. This is primarily relevant to institutions with European country codes
    boolean oauth?;
    # When true, return the institution's homepage URL, logo and primary brand color.
    boolean include_optional_metadata?;
    # When `true`, returns metadata related to the Payment Initiation product indicating which payment configurations are supported.
    boolean include_payment_initiation_metadata?;
    # Additional options that will be used to filter institutions by various Payment Initiation configurations.
    InstitutionsSearchPaymentInitiationOptions? payment_initiation?;
};

# An optional object used to restrict the accounts used for payments. If provided, the end user will be able to send payments only from the specified bank account.
public type PaymentInitiationOptionalRestrictionBacs record {
    *RecipientBACS;
};

# Year-to-date pre-tax earnings, as reported on the paystub.
public type YTDGrossIncomeSummaryFieldNumber record {
    *IncomeSummaryFieldNumber;
};

# Additional options that will be used to filter institutions by various Payment Initiation configurations.
public type InstitutionsSearchPaymentInitiationOptions record {
    # A unique ID identifying the payment
    string payment_id?;
};

# Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
public type APISecret string;

# Valid values for investment transaction types and subtypes. Note that transactions representing inflow of cash will appear as negative amounts, outflow of cash will appear as positive amounts.
public type StandaloneInvestmentTransactionType record {
    # Buying an investment
    StandaloneInvestmentTransactionBuyType buy;
    # Selling an investment
    StandaloneInvestmentTransactionSellType sell;
    # A cancellation of a pending transaction
    string cancel;
    # Activity that modifies a cash position
    StandaloneInvestmentTransactionCashType cash;
    # Fees on the account, e.g. commission, bookkeeping, options-related.
    StandaloneInvestmentTransactionFeeType fee;
    # Activity that modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer
    StandaloneInvestmentTransactionTransferType transfer;
};

# The frequency at which the employee is paid. Possible values: `MONTHLY`, `BI-WEEKLY`, `WEEKLY`, `SEMI-MONTHLY`.
public type PayFrequency record {
    # The frequency of the pay period.
    string value;
    # The verification status. One of the following:
    # 
    # `"VERIFIED"`: The information was successfully verified.
    # 
    # `"UNVERIFIED"`: The verification has not yet been performed.
    # 
    # `"NEEDS_INFO"`: The verification was attempted but could not be completed due to missing information.
    # 
    # "`UNABLE_TO_VERIFY`": The verification was performed and the information could not be verified.
    # 
    # `"UNKNOWN"`: The verification status is unknown.
    VerificationStatus verification_status;
};

# Scope of required and optional account features or content from a ConnectedApplication.
public type RequestedScopes record {
    # The product access being requested. Used to or disallow product access across all accounts. If unset, defaults to all products allowed.
    ProductAccess required_product_access;
    # The product access being requested. Used to or disallow product access across all accounts. If unset, defaults to all products allowed.
    ProductAccess optional_product_access;
    # Enumerates the account subtypes that the application wishes for the user to be able to select from. For more details refer to Plaid documentation on account filters.
    AccountFilter account_filters?;
    # The application requires that accounts be limited to a specific cardinality.
    # `MULTI_SELECT`: indicates that the user should be allowed to pick multiple accounts.
    # `SINGLE_SELECT`: indicates that the user should be allowed to pick only a single account.
    # `ALL`: indicates that the user must share all of their accounts and should not be given the opportunity to de-select
    AccountSelectionCardinality account_selection_cardinality;
};

# The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
public type BankTransferType string;

# An optional object to filter `/auth/get` results.
public type AuthGetRequestOptions record {
    # A list of `account_ids` to retrieve for the Item.
    # Note: An error will be returned if a provided `account_id` is not associated with the Item.
    string[] account_ids?;
};

# SandboxItemResetLoginRequest defines the request schema for `/sandbox/item/reset_login`
public type SandboxItemResetLoginRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
};

public type SignalReturnReportResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object containing a BACS account number and sort code. If an IBAN is not provided or if this recipient needs to accept domestic GBP-denominated payments, BACS data is required.
public type RecipientBACS record {
    # The account number of the account. Maximum of 10 characters.
    @constraint:String {maxLength: 10, minLength: 1}
    string account?;
    # The 6-character sort code of the account.
    @constraint:String {maxLength: 6, minLength: 6}
    string sort_code?;
};

# An object representing the repayment plan for the student loan
public type StudentRepaymentPlan record {
    # The description of the repayment plan as provided by the servicer.
    string? description;
    # The type of the repayment plan.
    string? 'type;
};

# Details about the end user's device
public type SignalDevice record {
    # The IP address of the device that initiated the transaction
    string? ip_address?;
    # The user agent of the device that initiated the transaction (e.g. "Mozilla/5.0")
    string? user_agent?;
};

# DepositSwitchAltCreateRequest defines the request schema for `/deposit_switch/alt/create`
public type DepositSwitchAltCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The deposit switch destination account information
    DepositSwitchTargetAccount target_account;
    # The deposit switch destination user information
    DepositSwitchTargetUser target_user;
    # Options to configure the `/deposit_switch/create` request. If provided, cannot be `null`.
    DepositSwitchCreateRequestOptions options?;
    # ISO-3166-1 alpha-2 country code standard.
    string? country_code?;
};

# SandboxItemFireWebhookRequest defines the request schema for `/sandbox/item/fire_webhook`
public type SandboxItemFireWebhookRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The following values for `webhook_code` are supported:
    # 
    # * `DEFAULT_UPDATE`
    string webhook_code;
};

# An optional object to filter `/accounts/balance/get` results.
public type AccountsBalanceGetRequestOptions record {
    # A list of `account_ids` to retrieve for the Item. The default value is `null`.
    # 
    # Note: An error will be returned if a provided `account_id` is not associated with the Item.
    string[] account_ids?;
    # Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:mm:ssZ`) indicating the oldest acceptable balance when making a request to `/accounts/balance/get`.
    # 
    # If the balance that is pulled for `ins_128026` (Capital One) is older than the given timestamp, an `INVALID_REQUEST` error with the code of `LAST_UPDATED_DATETIME_OUT_OF_RANGE` will be returned with the most recent timestamp for the requested account contained in the response.
    # 
    # This field is only used when the institution is `ins_128026` (Capital One), in which case a value must be provided or an `INVALID_REQUEST` error with the code of `INVALID_FIELD` will be returned. For all other institutions, this field is ignored.
    MinLastUpdatedDatetime min_last_updated_datetime?;
};

# CategoriesGetRequest defines the request schema for `/categories/get`
public type CategoriesGetRequest record {
};

# List of unofficial currency codes
public type UnofficialCurrencyCodeList record {
    # Cardano
    string ADA;
    # Basic Attention Token
    string BAT;
    # Bitcoin Cash
    string BCH;
    # Binance Coin
    string BNB;
    # Bitcoin
    string BTC;
    # Bitcoin Gold
    string BTG;
    # Chinese Yuan (offshore)
    string CNH;
    # Dash
    string DASH;
    # Dogecoin
    string DOGE;
    # Ethereum Classic
    string ETC;
    # Ethereum
    string ETH;
    # Pence sterling, i.e. British penny
    string GBX;
    # Lisk
    string LSK;
    # Neo
    string NEO;
    # OmiseGO
    string OMG;
    # Qtum
    string QTUM;
    # TehterUS
    string USDT;
    # Stellar Lumen
    string XLM;
    # Monero
    string XMR;
    # Ripple
    string XRP;
    # Zcash
    string ZEC;
    # 0x
    string ZRX;
};

# Information about the last successful and failed transactions update for the Item.
public type ItemStatusTransactions record {
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) timestamp of the last successful transactions update for the Item. The status will update each time Plaid successfully connects with the institution, regardless of whether any new data is available in the update.
    string? last_successful_update?;
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) timestamp of the last failed transactions update for the Item. The status will update each time Plaid fails an attempt to connect with the institution, regardless of whether any new data is available in the update.
    string? last_failed_update?;
};

# A representation of a transaction
public type Transaction record {
    *TransactionBase;
    # The channel used to make a payment.
    # `online:` transactions that took place online.
    # 
    # `in store:` transactions that were made at a physical location.
    # 
    # `other:` transactions that relate to banks, e.g. fees or deposits.
    # 
    # This field replaces the `transaction_type` field.
    string payment_channel;
    # The merchant name, as extracted by Plaid from the `name` field.
    string? merchant_name;
    # The date that the transaction was authorized. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DD` ).
    string? authorized_date;
    # Date and time when a transaction was authorized in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DDTHH:mm:ssZ` ).
    # 
    # This field is only populated for UK institutions. For institutions in other countries, will be `null`.
    string? authorized_datetime;
    # Date and time when a transaction was posted in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DDTHH:mm:ssZ` ).
    # 
    # This field is only populated for UK institutions. For institutions in other countries, will be `null`.
    string? datetime;
    # The check number of the transaction. This field is only populated for check transactions.
    string? check_number;
    # An identifier classifying the transaction type.
    # 
    # This field is only populated for European institutions. For institutions in the US and Canada, this field is set to `null`.
    # 
    # `adjustment:` Bank adjustment
    # 
    # `atm:` Cash deposit or withdrawal via an automated teller machine
    # 
    # `bank charge:` Charge or fee levied by the institution
    # 
    # `bill payment`: Payment of a bill
    # 
    # `cash:` Cash deposit or withdrawal
    # 
    # `cashback:` Cash withdrawal while making a debit card purchase
    # 
    # `cheque:` Document ordering the payment of money to another person or organization
    # 
    # `direct debit:` Automatic withdrawal of funds initiated by a third party at a regular interval
    # 
    # `interest:` Interest earned or incurred
    # 
    # `purchase:` Purchase made with a debit or credit card
    # 
    # `standing order:` Payment instructed by the account holder to a third party at a regular interval
    # 
    # `transfer:` Transfer of money between accounts
    TransactionCode? transaction_code;
};

# DepositSwitchGetResponse defines the response schema for `/deposit_switch/get`
public type DepositSwitchGetResponse record {
    # The ID of the deposit switch.
    string deposit_switch_id;
    # The ID of the bank account the direct deposit was switched to.
    string? target_account_id;
    # The ID of the Item the direct deposit was switched to.
    string? target_item_id;
    # 
    # The state, or status, of the deposit switch.
    # 
    # - `initialized` – The deposit switch has been initialized with the user entering the information required to submit the deposit switch request.
    # 
    # - `processing` – The deposit switch request has been submitted and is being processed.
    # 
    # - `completed` – The user's employer has fulfilled the deposit switch request.
    # 
    # - `error` – There was an error processing the deposit switch request.
    string state;
    # The method used to make the deposit switch.
    # 
    # - `instant` – User instantly switched their direct deposit to a new or existing bank account by connecting their payroll or employer account.
    # 
    # - `mail` – User requested that Plaid contact their employer by mail to make the direct deposit switch.
    # 
    # - `pdf` – User generated a PDF or email to be sent to their employer with the information necessary to make the deposit switch.'
    string? switch_method?;
    # When `true`, user’s direct deposit goes to multiple banks. When false, user’s direct deposit only goes to the target account. Always `null` if the deposit switch has not been completed.
    boolean? account_has_multiple_allocations;
    # When `true`, the target account is allocated the remainder of direct deposit after all other allocations have been deducted. When `false`, user’s direct deposit is allocated as a percent or amount. Always `null` if the deposit switch has not been completed.
    boolean? is_allocated_remainder;
    # The percentage of direct deposit allocated to the target account. Always `null` if the target account is not allocated a percentage or if the deposit switch has not been completed or if `is_allocated_remainder` is true.
    decimal? percent_allocated;
    # The dollar amount of direct deposit allocated to the target account. Always `null` if the target account is not allocated an amount or if the deposit switch has not been completed.
    decimal? amount_allocated;
    # The name of the employer selected by the user. If the user did not select an employer, the value returned is `null`.
    string? employer_name?;
    # The ID of the employer selected by the user. If the user did not select an employer, the value returned is `null`.
    string? employer_id?;
    # The name of the institution selected by the user. If the user did not select an institution, the value returned is `null`.
    string? institution_name?;
    # The ID of the institution selected by the user. If the user did not select an institution, the value returned is `null`.
    string? institution_id?;
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) date the deposit switch was created.
    string date_created;
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) date the deposit switch was completed. Always `null` if the deposit switch has not been completed.
    string? date_completed;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Defines the request schema for `sandbox/oauth/select_accounts`
public type SandboxOauthSelectAccountsRequest record {
    # OAuth state ID
    string oauth_state_id;
    # The account which needs to be selected
    string[] accounts;
};

# The receiver details if the type of this event is `reciever_pending` or `reciever_posted`. Null value otherwise.
public type TransferReceiverDetails record {
    # The sign of the available balance for the receiver bank account associated with the receiver event at the time the matching transaction was found. Can be `positive`, `negative`, or null if the balance was not available at the time.
    string? available_balance;
};

# Plaid’s unique identifier for a transfer.
public type TransferID string;

public type IncomeVerificationWebhookStatus record {
    string id;
};

# SandboxItemResetLoginResponse defines the response schema for `/sandbox/item/reset_login`
public type SandboxItemResetLoginResponse record {
    # `true` if the call succeeded
    boolean reset_login;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# AssetReportAuditCopyCreateRequest defines the request schema for `/asset_report/audit_copy/get`
public type AssetReportAuditCopyCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # The `auditor_id` of the third party with whom you would like to share the Asset Report.
    string auditor_id;
};

# DepositSwitchCreateResponse defines the response schema for `/deposit_switch/create`
public type DepositSwitchCreateResponse record {
    # ID of the deposit switch. This ID is persisted throughout the lifetime of the deposit switch.
    string deposit_switch_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Specifies the multi-factor authentication settings to use with this test account
public type MFA record {
    # Possible values are `device`, `selections`, or `questions`.
    # 
    # If value is `device`, the MFA answer is `1234`.
    # 
    # If value is `selections`, the MFA answer is always the first option.
    # 
    # If value is `questions`, the MFA answer is  `answer_<i>_<j>` for the j-th question in the i-th round, starting from 0. For example, the answer to the first question in the second round is `answer_1_0`.
    string 'type;
    # Number of rounds of questions. Required if value of `type` is `questions`. 
    decimal question_rounds;
    # Number of questions per round. Required if value of `type` is `questions`. If value of type is `selections`, default value is 2.
    decimal questions_per_round;
    # Number of rounds of selections, used if `type` is `selections`. Defaults to 1.
    decimal selection_rounds;
    # Number of available answers per question, used if `type` is `selection`. Defaults to 2.
    decimal selections_per_question;
};

# Fired when new or canceled transactions have been detected on an investment account.
public type InvestmentsDefaultUpdateWebhook record {
    # `INVESTMENTS_TRANSACTIONS`
    string webhook_type;
    # `DEFAULT_UPDATE`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # The number of new transactions reported since the last time this webhook was fired.
    decimal new_investments_transactions;
    # The number of canceled transactions reported since the last time this webhook was fired.
    decimal canceled_investments_transactions;
};

# Defines the response schema for `/bank_transfer/migrate_account`
public type BankTransferMigrateAccountResponse record {
    # The Plaid `access_token` for the newly created Item.
    string access_token;
    # The Plaid `account_id` for the newly created Item.
    string account_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Account and bank identifier number data used to configure the test account. All values are optional.
public type Numbers record {
    # Will be used for the account number.
    string account?;
    # Must be a valid ACH routing number.
    string ach_routing?;
    # Must be a valid wire transfer routing number.
    string ach_wire_routing?;
    # EFT institution number. Must be specified alongside `eft_branch`.
    string eft_institution?;
    # EFT branch number. Must be specified alongside `eft_institution`.
    string eft_branch?;
    # Bank identifier code (BIC). Must be specified alongside `international_iban`.
    string international_bic?;
    # International bank account number (IBAN). If no account number is specified via `account`, will also be used as the account number by default. Must be specified alongside `international_bic`.
    string international_iban?;
    # BACS sort code
    string bacs_sort_code?;
};

# Defines the request schema for `/bank_transfer/get`
public type BankTransferGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a bank transfer.
    BankTransferID bank_transfer_id;
};

# An object with information about the status of the Item.
public type ItemStatusNullable record {
    *ItemStatus;
};

# AssetReportAuditCopyGetRequest defines the request schema for `/asset_report/audit_copy/get`
public type AssetReportAuditCopyGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The `audit_copy_token` granting access to the Audit Copy you would like to get.
    string audit_copy_token;
};

# A filter to apply to `credit`-type accounts
public type CreditFilter record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes;
};

# The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up as a standing order. If no schedule is specified, the payment will be executed only once.
public type ExternalPaymentScheduleGet record {
    *ExternalPaymentScheduleBase;
};

# Defines the request schema for `/bank_transfer/balance/get`
public type BankTransferBalanceGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # If multiple origination accounts are available, `origination_account_id` must be used to specify the account for which balance will be returned.
    string? origination_account_id?;
};

# ISO-3166-1 alpha-2 country code standard.
public type CountryCode string;

# We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
public type Error record {
    # A broad categorization of the error. Safe for programatic use.
    string error_type;
    # The particular error code. Safe for programmatic use.
    string error_code;
    # A developer-friendly representation of the error code. This may change over time and is not safe for programmatic use.
    string error_message;
    # A user-friendly representation of the error code. `null` if the error is not related to user action.
    # 
    # This may change over time and is not safe for programmatic use.
    string? display_message;
    # A unique ID identifying the request, to be used for troubleshooting purposes. This field will be omitted in errors provided by webhooks.
    string request_id?;
    # In the Assets product, a request can pertain to more than one Item. If an error is returned for such a request, `causes` will return an array of errors containing a breakdown of these errors on the individual Item level, if any can be identified.
    # 
    # `causes` will only be provided for the `error_type` `ASSET_REPORT_ERROR`.
    anydata[] causes?;
    # The HTTP status code associated with the error. This will only be returned in the response body when the error information is provided via a webhook.
    decimal? status?;
    # The URL of a Plaid documentation page with more information about the error
    string documentation_url?;
    # Suggested steps for resolving the error
    string suggested_action?;
};

# The taxpayer ID
public type TaxpayerID record {
    # Type of ID, e.g. 'SSN'
    string? id_type?;
    # Last 4 digits of unique number of ID.
    string? last_4_digits?;
};

# ItemPublicTokenExchangeRequest defines the request schema for `/item/public_token/exchange`
public type ItemPublicTokenExchangeRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Your `public_token`, obtained from the Link `onSuccess` callback or `/sandbox/item/public_token/create`.
    string public_token;
};

# ItemGetRequest defines the request schema for `/item/get`
public type ItemGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
};

# `investment:` Investment account
# 
# `credit:` Credit card
# 
# `depository:` Depository account
# 
# `loan:` Loan account
# 
# `brokerage`: An investment account. Used for `/assets/` endpoints only; other endpoints use `investment`.
# 
# `other:` Non-specified account type
# 
# See the [Account type schema](https://plaid.com/docs/api/accounts#account-type-schema) for a full listing of account types and corresponding subtypes.
public type AccountType string;

# Identifying information for transferring money to or from a UK bank account via BACS.
public type NumbersBACSNullable record {
    *NumbersBACS;
};

# ProcessorIdentityGetResponse defines the response schema for `/processor/identity/get`
public type ProcessorIdentityGetResponse record {
    # Account identity information
    AccountIdentity account;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An optional set of options to be used when configuring the Item. If specified, must not be `null`.
public type SandboxProcessorTokenCreateRequestOptions record {
    # Test username to use for the creation of the Sandbox Item. Default value is `user_good`.
    SandboxOverrideUsername? override_username?;
    # Test password to use for the creation of the Sandbox Item. Default value is `pass_good`.
    SandboxOverridePassword? override_password?;
};

# Defines the request schema for `/sandbox/transfer/simulate`
public type SandboxTransferSimulateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a transfer.
    TransferID transfer_id;
    # The asynchronous event to be simulated. May be: `posted`, `failed`, or `reversed`.
    # 
    # An error will be returned if the event type is incompatible with the current transfer status. Compatible status --> event type transitions include:
    # 
    # `pending` --> `failed`
    # 
    # `pending` --> `posted`
    # 
    # `posted` --> `reversed`
    string event_type;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    TransferFailure? failure_reason?;
};

# ProcessorBalanceGetResponse defines the response schema for `/processor/balance/get`
public type ProcessorBalanceGetResponse record {
    # A single account at a financial institution.
    AccountBase account;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The following currency codes are supported by Plaid.
public type StandaloneCurrencyCodeList record {
    # Plaid supports all ISO 4217 currency codes.
    string iso_currency_code;
    # List of unofficial currency codes
    UnofficialCurrencyCodeList unofficial_currency_code;
};

# An object specifying information about the end user who will be linking their account.
public type LinkTokenCreateRequestUser record {
    # A unique ID representing the end user. Typically this will be a user ID number from your application. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`. It is currently used as a means of searching logs for the given user in the Plaid Dashboard.
    string client_user_id;
    # The user's full legal name. This is an optional field used in the [returning user experience](https://plaid.com/docs/link/returning-user) to associate Items to the user.
    string legal_name?;
    # The user's phone number in [E.164](https://en.wikipedia.org/wiki/E.164) format. This field is optional, but required to enable the [returning user experience](https://plaid.com/docs/link/returning-user).
    string phone_number?;
    # The date and time the phone number was verified in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDThh:mm:ssZ`). This field is optional, but required to enable any [returning user experience](https://plaid.com/docs/link/returning-user).
    # 
    #  Only pass a verification time for a phone number that you have verified. If you have performed verification but don’t have the time, you may supply a signal value of the start of the UNIX epoch.
    # 
    #  Example: `2020-01-01T00:00:00Z`
    string phone_number_verified_time?;
    # The user's email address. This field is optional, but required to enable the [pre-authenticated returning user flow](https://plaid.com/docs/link/returning-user/#enabling-the-returning-user-experience).
    string email_address?;
    # The date and time the email address was verified in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDThh:mm:ssZ`). This is an optional field used in the [returning user experience](https://plaid.com/docs/link/returning-user).
    # 
    #  Only pass a verification time for an email address that you have verified. If you have performed verification but don’t have the time, you may supply a signal value of the start of the UNIX epoch.
    # 
    #  Example: `2020-01-01T00:00:00Z`
    string email_address_verified_time?;
    # To be provided in the format "ddd-dd-dddd". This field is optional and will support not-yet-implemented functionality for new products.
    string ssn?;
    # To be provided in the format "yyyy-mm-dd". This field is optional and will support not-yet-implemented functionality for new products.
    string date_of_birth?;
};

# Allow or disallow product access by account. Unlisted (e.g. missing) accounts will be considered `new_accounts`.
public type AccountAccess record {
    # The unique account identifier for this account. This value must match that returned by the data access API for this account.
    string unique_id;
    # Allow the application to see this account (and associated details, including balance) in the list of accounts. If unset, defaults to `true`.
    boolean? authorized = true;
};

# Allows specifying the metadata of the test account
public type Meta record {
    # The account's name
    string name;
    # The account's official name
    string official_name;
    # The account's limit
    decimal 'limit;
};

# Data returned from the financial institution about the owner or owners of an account. Only the `names` array must be non-empty.
public type Owner record {
    # A list of names associated with the account by the financial institution. These should always be the names of individuals, even for business accounts. If the name of a business is reported, please contact Plaid Support. In the case of a joint account, Plaid will make a best effort to report the names of all account holders.
    # 
    # If an Item contains multiple accounts with different owner names, some institutions will report all names associated with the Item in each account's `names` array.
    string[] names;
    # A list of phone numbers associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution.
    PhoneNumber[] phone_numbers;
    # A list of email addresses associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution.
    Email[] emails;
    # Data about the various addresses associated with the account by the financial institution. May be an empty array if no relevant information is returned from the financial institution.
    Address[] addresses;
};

# Information about the APR on the account.
public type APR record {
    # Annual Percentage Rate applied.
    decimal apr_percentage;
    # The type of balance to which the APR applies.
    string apr_type;
    # Amount of money that is subjected to the APR if a balance was carried beyond payment due date. How it is calculated can vary by card issuer. It is often calculated as an average daily balance.
    decimal? balance_subject_to_apr;
    # Amount of money charged due to interest from last statement.
    decimal? interest_charge_amount;
};

public type SignalEvaluateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `account_id` of the account whose verification status is to be modified
    string account_id;
    # The unique ID that you would like to use to refer to this transaction. For your convenience mapping your internal data, you could use your internal ID/identifier for this transaction. The max length for this field is 36 characters.
    @constraint:String {maxLength: 36}
    string client_transaction_id;
    # The transaction amount, in USD (e.g. `102.05`)
    decimal amount;
    # A unique ID that identifies the end user in your system. This ID is used to correlate requests by a user with multiple Items. The max length for this field is 36 characters.
    @constraint:String {maxLength: 36}
    string client_user_id?;
    # Details about the end user initiating the transaction (i.e., the account holder).
    SignalUser user?;
    # Details about the end user's device
    SignalDevice device?;
};

# AssetReportCreateRequest defines the request schema for `/asset_report/create`
public type AssetReportCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # An array of access tokens corresponding to the Items that will be included in the report. The `assets` product must have been initialized for the Items during link; the Assets product cannot be added after initialization.
    @constraint:Array {maxLength: 99, minLength: 1}
    AccessToken[] access_tokens;
    # The maximum integer number of days of history to include in the Asset Report. If using Fannie Mae Day 1 Certainty, `days_requested` must be at least 61 for new originations or at least 31 for refinancings.
    @constraint:Int {maxValue: 730}
    int days_requested;
    # An optional object to filter `/asset_report/create` results. If provided, must be non-`null`. The optional `user` object is required for the report to be eligible for Fannie Mae's Day 1 Certainty program.
    AssetReportCreateRequestOptions options?;
};

# AssetReportRemoveResponse defines the response schema for `/asset_report/remove`
public type AssetReportRemoveResponse record {
    # `true` if the Asset Report was successfully removed.
    boolean removed;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Fired when transaction(s) for an Item are deleted. The deleted transaction IDs are included in the webhook payload. Plaid will typically check for deleted transaction data several times a day.
public type TransactionsRemovedWebhook record {
    # `TRANSACTIONS`
    string webhook_type;
    # `TRANSACTIONS_REMOVED`
    string webhook_code;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # An array of `transaction_ids` corresponding to the removed transactions
    string[] removed_transactions;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
};

# Additional payment options
public type ExternalPaymentOptions record {
    # When `true`, Plaid will attempt to request refund details from the payee's financial institution.  Support varies between financial institutions and will not always be available.  If refund details could be retrieved, they will be available in the `/payment_initiation/payment/get` response.
    boolean? request_refund_details?;
    # The International Bank Account Number (IBAN) for the payer's account. If provided, the end user will be able to send payments only from the specified bank account.
    string? iban?;
    # An optional object used to restrict the accounts used for payments. If provided, the end user will be able to send payments only from the specified bank account.
    PaymentInitiationOptionalRestrictionBacs? bacs?;
    # The EMI (E-Money Institution) account that this payment is associated with, if any. This EMI account is used as an intermediary account to enable Plaid to reconcile the settlement of funds for Payment Initiation requests.
    string? emi_account_id?;
};

# Information about the device being used to initiate the authorization.
public type TransferAuthorizationDevice record {
    # The IP address of the device being used to initiate the authorization.
    string ip_address?;
    # The user agent of the device being used to initiate the authorization.
    string user_agent?;
};

# Defines the response schema for `/bank_transfer/event/list`
public type BankTransferEventListResponse record {
    # An array of objects representing events in the Bank Transfers API.
    BankTransferEvent[] bank_transfer_events;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Contains details about a student loan account
public type StudentLoan record {
    # The ID of the account that this liability belongs to.
    string? account_id;
    # The account number of the loan. For some institutions, this may be a masked version of the number (e.g., the last 4 digits instead of the entire number).
    string? account_number;
    # The dates on which loaned funds were disbursed or will be disbursed. These are often in the past. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string[]? disbursement_dates;
    # The date when the student loan is expected to be paid off. Availability for this field is limited. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? expected_payoff_date;
    # The guarantor of the student loan.
    string? guarantor;
    # The interest rate on the loan as a percentage.
    decimal interest_rate_percentage;
    # `true` if a payment is currently overdue. Availability for this field is limited.
    boolean? is_overdue;
    # The amount of the last payment.
    decimal? last_payment_amount;
    # The date of the last payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? last_payment_date;
    # The date of the last statement. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? last_statement_issue_date;
    # The type of loan, e.g., "Consolidation Loans".
    string? loan_name;
    # An object representing the status of the student loan
    StudentLoanStatus loan_status;
    # The minimum payment due for the next billing cycle. There are some exceptions:
    # Some institutions require a minimum payment across all loans associated with an account number. Our API presents that same minimum payment amount on each loan. The institutions that do this are: Great Lakes ( `ins_116861`), Firstmark (`ins_116295`), Commonbond Firstmark Services (`ins_116950`), Nelnet (`ins_116528`), EdFinancial Services (`ins_116304`), Granite State (`ins_116308`), and Oklahoma Student Loan Authority (`ins_116945`).
    # Firstmark (`ins_116295` ) will display as $0 if there is an autopay program in effect.
    decimal? minimum_payment_amount;
    # The due date for the next payment. The due date is `null` if a payment is not expected. A payment is not expected if `loan_status.type` is `deferment`, `in_school`, `consolidated`, `paid in full`, or `transferred`. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? next_payment_due_date;
    # The date on which the loan was initially lent. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? origination_date;
    # The original principal balance of the loan.
    decimal? origination_principal_amount;
    # The total dollar amount of the accrued interest balance. For Sallie Mae ( `ins_116944`), this amount is included in the current balance of the loan, so this field will return as `null`.
    decimal? outstanding_interest_amount;
    # The relevant account number that should be used to reference this loan for payments. In the majority of cases, `payment_reference_number` will match a`ccount_number,` but in some institutions, such as Great Lakes (`ins_116861`), it will be different.
    string? payment_reference_number;
    # Information about the student's eligibility in the Public Service Loan Forgiveness program. This is only returned if the institution is Fedloan (`ins_116527`). 
    PSLFStatus pslf_status;
    # An object representing the repayment plan for the student loan
    StudentRepaymentPlan repayment_plan;
    # The sequence number of the student loan. Heartland ECSI (`ins_116948`) does not make this field available.
    string? sequence_number;
    # The address of the student loan servicer. This is generally the remittance address to which payments should be sent.
    ServicerAddressData servicer_address;
    # The year to date (YTD) interest paid. Availability for this field is limited.
    decimal? ytd_interest_paid;
    # The year to date (YTD) principal paid. Availability for this field is limited.
    decimal? ytd_principal_paid;
};

# Defines the response schema for `/bank_transfer/create`
public type BankTransferCreateResponse record {
    # Represents a bank transfer within the Bank Transfers API.
    BankTransfer bank_transfer;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Identifying information for transferring money to or from a Canadian bank account via EFT.
public type NumbersEFT record {
    # The Plaid account ID associated with the account numbers
    string account_id;
    # The EFT account number for the account
    string account;
    # The EFT institution number for the account
    string institution;
    # The EFT branch number for the account
    string branch;
};

# An identifier classifying the transaction type.
# 
# This field is only populated for European institutions. For institutions in the US and Canada, this field is set to `null`.
# 
# `adjustment:` Bank adjustment
# 
# `atm:` Cash deposit or withdrawal via an automated teller machine
# 
# `bank charge:` Charge or fee levied by the institution
# 
# `bill payment`: Payment of a bill
# 
# `cash:` Cash deposit or withdrawal
# 
# `cashback:` Cash withdrawal while making a debit card purchase
# 
# `cheque:` Document ordering the payment of money to another person or organization
# 
# `direct debit:` Automatic withdrawal of funds initiated by a third party at a regular interval
# 
# `interest:` Interest earned or incurred
# 
# `purchase:` Purchase made with a debit or credit card
# 
# `standing order:` Payment instructed by the account holder to a third party at a regular interval
# 
# `transfer:` Transfer of money between accounts
public type TransactionCode string?;

# IncomeVerificationDocumentsDownloadResponse defines the response schema for `/income/verification/documents/download`.
public type IncomeVerificationDocumentsDownloadResponse record {
    # ID for indocme verification document download
    string id;
};

# PaymentInitiationRecipientGetRequest defines the request schema for `/payment_initiation/recipient/get`
public type PaymentInitiationRecipientGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the recipient
    @constraint:String {minLength: 1}
    string recipient_id;
};

# An object representing a breakdown of the different income types on the paystub.
public type IncomeBreakdown record {
    # The type of income. Possible values include:
    #   `"regular"`: regular income
    #   `"overtime"`: overtime income
    #    `"bonus"`: bonus income
    string? 'type;
    # The hourly rate at which the income is paid.
    decimal? rate;
    # The number of hours logged for this income for this pay period.
    decimal? hours;
    # The total pay for this pay period.
    decimal? total;
};

# ProcessorBalanceGetRequest defines the request schema for `/processor/balance/get`
public type ProcessorBalanceGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The processor token obtained from the Plaid integration partner. Processor tokens are in the format: `processor-<environment>-<identifier>`
    ProcessorToken processor_token;
    # An optional object to filter `/processor/balance/get` results.
    ProcessorBalanceGetRequestOptions options?;
};

# Defines the response schema for `/transfer/cancel`
public type TransferCancelResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# AssetReportFilterResponse defines the response schema for `/asset_report/filter`
public type AssetReportFilterResponse record {
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive.
    AssetReportId asset_report_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object representing a balance held by an account in the past
public type HistoricalBalance record {
    # The date of the calculated historical balance, in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD)
    string date;
    # The total amount of funds in the account, calculated from the `current` balance in the `balance` object by subtracting inflows and adding back outflows according to the posted date of each transaction.
    # 
    # If the account has any pending transactions, historical balance amounts on or after the date of the earliest pending transaction may differ if retrieved in subsequent Asset Reports as a result of those pending transactions posting.
    decimal current;
    # The ISO-4217 currency code of the balance. Always `null` if `unofficial_currency_code` is non-`null`.
    string? iso_currency_code;
    # The unofficial currency code associated with the balance. Always `null` if `iso_currency_code` is non-`null`.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    string? unofficial_currency_code;
};

# Information about the student's eligibility in the Public Service Loan Forgiveness program. This is only returned if the institution is Fedloan (`ins_116527`). 
public type PSLFStatus record {
    # The estimated date borrower will have completed 120 qualifying monthly payments. Returned in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? estimated_eligibility_date;
    # The number of qualifying payments that have been made.
    decimal? payments_made;
    # The number of qualifying payments remaining.
    decimal? payments_remaining;
};

public type SignalReturnReportRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Must be the same as the `client_transaction_id` supplied when calling `/signal/evaluate`
    string client_transaction_id;
    # Must be a valid ACH return code (e.g. "R01")
    string return_code;
};

# BankTransferSweep describes a sweep transfer.
public type BankTransferSweep record {
    # Identifier of the sweep.
    int id;
    # Identifier of the sweep transfer.
    string? transfer_id;
    # The datetime when the sweep occurred, in RFC 3339 format.
    string created_at;
    # The amount of the sweep.
    string amount;
    # The currency of the sweep, e.g. "USD".
    string iso_currency_code;
    # The account where the funds are swept to.
    BankTransferSweepAccount sweep_account;
};

# Defines the request schema for `/bank_transfer/migrate_account`
public type BankTransferMigrateAccountRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The user's account number.
    string account_number;
    # The user's routing number.
    string routing_number;
    # The type of the bank account (`checking` or `savings`).
    string account_type;
};

# Represents an event in the Bank Transfers API.
public type BankTransferEvent record {
    # Plaid’s unique identifier for this event. IDs are sequential unsigned 64-bit integers.
    int event_id;
    # The datetime when this event occurred. This will be of the form `2006-01-02T15:04:05Z`.
    string timestamp;
    # The type of event that this bank transfer represents.
    # 
    # `pending`: A new transfer was created; it is in the pending state.
    # 
    # `cancelled`: The transfer was cancelled by the client.
    # 
    # `failed`: The transfer failed, no funds were moved.
    # 
    # `posted`: The transfer has been successfully submitted to the payment network.
    # 
    # `reversed`: A posted transfer was reversed.
    # 
    # `receiver_pending`: The matching transfer was found as a pending transaction in the receiver's account
    # 
    # `receiver_posted`: The matching transfer was found as a posted transaction in the receiver's account
    BankTransferEventType event_type;
    # The account ID associated with the bank transfer.
    string account_id;
    # Plaid’s unique identifier for a bank transfer.
    BankTransferID bank_transfer_id;
    # The ID of the origination account that this balance belongs to.
    string? origination_account_id;
    # The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    BankTransferType bank_transfer_type;
    # The bank transfer amount.
    string bank_transfer_amount;
    # The currency of the bank transfer amount.
    string bank_transfer_iso_currency_code;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    BankTransferFailure? failure_reason;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    BankTransferDirection? direction;
    # The receiver details if the type of this event is `reciever_pending` or `reciever_posted`. Null value otherwise.
    BankTransferReceiverDetails? receiver_details;
};

# EmployersSearchResponse defines the response schema for `/employers/search`.
public type EmployersSearchResponse record {
    # A list of employers matching the search criteria.
    Employer[] employers;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An optional object to filter `/identity/get` results.
public type IdentityGetRequestOptions record {
    # A list of `account_ids` to retrieve for the Item.
    # Note: An error will be returned if a provided `account_id` is not associated with the Item.
    string[] account_ids?;
};

# InstitutionsGetResponse defines the response schema for `/institutions/get`
public type InstitutionsGetResponse record {
    # A list of Plaid Institution
    Institution[] institutions;
    # The total number of institutions available via this endpoint
    int total;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationRecipient defines a payment initiation recipient
public type PaymentInitiationRecipient record {
    # The ID of the recipient.
    string recipient_id;
    # The name of the recipient.
    string name;
    # The optional address of the payment recipient. This object is not currently required to make payments from UK institutions and should not be populated, though may be necessary for future European expansion.
    PaymentInitiationAddress? address?;
    # The International Bank Account Number (IBAN) for the recipient.
    string? iban?;
    # The account number and sort code of the recipient's account.
    RecipientBACSNullable? bacs?;
    # The EMI (E-Money Institution) recipient that this recipient is associated with, if any. This EMI recipient is used as an intermediary account to enable Plaid to reconcile the settlement of funds for Payment Initiation requests.
    string? emi_recipient_id?;
};

# Custom test accounts are configured with a JSON configuration object formulated according to the schema below. All fields are optional. Sending an empty object as a configuration will result in an account configured with random balances and transaction history.
public type UserCustomPassword record {
    # The version of the password schema to use, possible values are 1 or 2. The default value is 2. You should only specify 1 if you know it is necessary for your test suite.
    string? 'version?;
    # A seed, in the form of a string, that will be used to randomly generate account and transaction data, if this data is not specified using the `override_accounts` argument. If no seed is specified, the randomly generated data will be different each time.
    # 
    # Note that transactions data is generated relative to the Item's creation date. Different Items created on different dates with the same seed for transactions data will have different dates for the transactions. The number of days between each transaction and the Item creation will remain constant. For example, an Item created on December 15 might show a transaction on December 14. An Item created on December 20, using the same seed, would show that same transaction occurring on December 19.
    string seed;
    # An array of account overrides to configure the accounts for the Item. By default, if no override is specified, transactions and account data will be randomly generated based on the account type and subtype, and other products will have fixed or empty data.
    OverrideAccounts[] override_accounts;
    # Specifies the multi-factor authentication settings to use with this test account
    MFA mfa;
    # You may trigger a reCAPTCHA in Plaid Link in the Sandbox environment by using the recaptcha field. Possible values are `good` or `bad`. A value of `good` will result in successful Item creation and `bad` will result in a `RECAPTCHA_BAD` error to simulate a failed reCAPTCHA. Both values require the reCAPTCHA to be manually solved within Plaid Link.
    string recaptcha;
    # An error code to force on Item creation. Possible values are:
    # 
    # `"INSTITUTION_NOT_RESPONDING"`
    # `"INSTITUTION_NO_LONGER_SUPPORTED"`
    # `"INVALID_CREDENTIALS"`
    # `"INVALID_MFA"`
    # `"ITEM_LOCKED"`
    # `"ITEM_LOGIN_REQUIRED"`
    # `"ITEM_NOT_SUPPORTED"`
    # `"INVALID_LINK_TOKEN"`
    # `"MFA_NOT_SUPPORTED"`
    # `"NO_ACCOUNTS"`
    # `"PLAID_ERROR"`
    # `"PRODUCTS_NOT_SUPPORTED"`
    # `"USER_SETUP_REQUIRED"`
    string force_error;
};

public type AssetReportPDFGetResponse string;

# An object specifying the arguments originally provided to the `/link/token/create` call.
public type LinkTokenGetMetadataResponse record {
    # The `products` specified in the `/link/token/create` call.
    Products[] initial_products;
    # The `webhook` specified in the `/link/token/create` call.
    string? webhook;
    # The `country_codes` specified in the `/link/token/create` call.
    CountryCode[] country_codes;
    # The `language` specified in the `/link/token/create` call.
    string? language;
    # The `account_filters` specified in the original call to `/link/token/create`.
    AccountFiltersResponse account_filters?;
    # The `redirect_uri` specified in the `/link/token/create` call.
    string? redirect_uri;
    # The `client_name` specified in the `/link/token/create` call.
    string? client_name;
};

# SandboxItemSetVerificationStatusRequest defines the request schema for `/sandbox/item/set_verification_status`
public type SandboxItemSetVerificationStatusRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `account_id` of the account whose verification status is to be modified
    string account_id;
    # The verification status to set the account to.
    string verification_status;
};

# The core attributes object contains additional data that can be used to assess the ACH return risk, such as past ACH return events, balance/transaction history, the Item’s connection history in the Plaid network, and identity change history.
public type SignalEvaluateCoreAttributes record {
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 7 days from the account that will be debited.
    int unauthorized_transactions_count_7d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 30 days from the account that will be debited.
    int unauthorized_transactions_count_30d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 60 days from the account that will be debited.
    int unauthorized_transactions_count_60d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 90 days from the account that will be debited.
    int unauthorized_transactions_count_90d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 7 days from the account that will be debited.
    int nsf_overdraft_transactions_count_7d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 30 days from the account that will be debited.
    int nsf_overdraft_transactions_count_30d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 60 days from the account that will be debited.
    int nsf_overdraft_transactions_count_60d?;
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 90 days from the account that will be debited.
    int nsf_overdraft_transactions_count_90d?;
    # The number of days since the first time the Item was connected to an application via Plaid
    int? days_since_first_plaid_connection?;
    # The number of times the Item has been connected to applications via Plaid over the past 7 days
    int? plaid_connections_count_7d?;
    # The number of times the Item has been connected to applications via Plaid over the past 30 days
    int? plaid_connections_count_30d?;
    # The total number of times the Item has been connected to applications via Plaid
    int? total_plaid_connections_count?;
    # Indicates if the ACH transaction funding account is a savings/money market account
    boolean is_savings_or_money_market_account?;
    # The total credit (inflow) transaction amount over the past 10 days from the account that will be debited
    decimal total_credit_transactions_amount_10d?;
    # The total debit (outflow) transaction amount over the past 10 days from the account that will be debited
    decimal total_debit_transactions_amount_10d?;
    # The 50th percentile of all credit (inflow) transaction amounts over the past 28 days from the account that will be debited
    decimal? p50_credit_transactions_amount_28d?;
    # The 50th percentile of all debit (outflow) transaction amounts over the past 28 days from the account that will be debited
    decimal? p50_debit_transactions_amount_28d?;
    # The 95th percentile of all credit (inflow) transaction amounts over the past 28 days from the account that will be debited
    decimal? p95_credit_transactions_amount_28d?;
    # The 95th percentile of all debit (outflow) transaction amounts over the past 28 days from the account that will be debited
    decimal? p95_debit_transactions_amount_28d?;
    # The number of days within the past 90 days when the account that will be debited had a negative end-of-day available balance
    int? days_with_negative_balance_count_90d?;
    # The 90th percentile of the end-of-day available balance over the past 30 days of the account that will be debited
    decimal? p90_eod_balance_30d?;
    # The 90th percentile of the end-of-day available balance over the past 60 days of the account that will be debited
    decimal? p90_eod_balance_60d?;
    # The 90th percentile of the end-of-day available balance over the past 90 days of the account that will be debited
    decimal? p90_eod_balance_90d?;
    # The 10th percentile of the end-of-day available balance over the past 30 days of the account that will be debited
    decimal? p10_eod_balance_30d?;
    # The 10th percentile of the end-of-day available balance over the past 60 days of the account that will be debited
    decimal? p10_eod_balance_60d?;
    # The 10th percentile of the end-of-day available balance over the past 90 days of the account that will be debited
    decimal? p10_eod_balance_90d?;
    # Available balance, as of the `balance_last_updated` time. The available balance is the current balance less any outstanding holds or debits that have not yet posted to the account.
    decimal? available_balance?;
    # Current balance, as of the `balance_last_updated` time. The current balance is the total amount of funds in the account.
    decimal? current_balance?;
    # Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DDTHH:mm:ssZ) indicating the last time that the balance for the given account has been updated.
    string? balance_last_updated?;
    # The number of times the account's phone numbers on file have changed over the past 28 days
    int? phone_change_count_28d?;
    # The number of times the account's phone numbers on file have changed over the past 90 days
    int? phone_change_count_90d?;
    # The number of times the account's email addresses on file have changed over the past 28 days
    int? email_change_count_28d?;
    # The number of times the account's email addresses on file have changed over the past 90 days
    int? email_change_count_90d?;
    # The number of times the account's addresses on file have changed over the past 28 days
    int? address_change_count_28d?;
    # The number of times the account's addresses on file have changed over the past 90 days
    int? address_change_count_90d?;
};

# IncomeVerificationPaystubsGetResponse defines the response schema for `/income/verification/paystubs/get`.
public type IncomeVerificationPaystubsGetResponse record {
    # An array of objects with information found on a paystubs.
    Paystub[] paystubs;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # An array of objects representing metadata from the end user's uploaded document.
    DocumentMetadata[] document_metadata?;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# ProcessorStripeBankAccountTokenCreateResponse defines the response schema for `/processor/stripe/bank_account/create`
public type ProcessorStripeBankAccountTokenCreateResponse record {
    # A token that can be sent to Stripe for use in making API calls to Plaid
    string stripe_bank_account_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
public type BankTransferDirection string?;

public type IncidentUpdate record {
    # The content of the update.
    string description?;
    # The status of the incident.
    string status?;
    # The date when the update was published, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `"2020-10-30T15:26:48Z"`.
    string updated_date?;
};

# PaymentInitiationRecipientCreateResponse defines the response schema for `/payment_initation/recipient/create`
public type PaymentInitiationRecipientCreateResponse record {
    # A unique ID identifying the recipient
    string recipient_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object representing metadata from the end user's uploaded document.
public type DocumentMetadata record {
    # The name of the document.
    string name?;
    # The processing status of the document.
    string status?;
    # An identifier of the document that is also present in the paystub response.
    string doc_id?;
};

# An object representing both the current pay period and year to date amount for an earning category.
public type EarningsTotal record {
    # Commonly used term to describe the line item.
    string? canonical_description?;
    # Text of the line item as printed on the paystub.
    string? description?;
    # An object representing a monetary amount.
    Pay current_pay?;
    # An object representing a monetary amount.
    Pay ytd_pay?;
    # The hours of work
    string? current_hours?;
    # Current rate of work
    string? current_rate?;
};

# DepositSwitchCreateRequest defines the request schema for `/deposit_switch/create`
public type DepositSwitchCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Access token for the target Item, typically provided in the Import Item response. 
    string target_access_token;
    # Plaid Account ID that specifies the target bank account. This account will become the recipient for a user's direct deposit.
    string target_account_id;
    # ISO-3166-1 alpha-2 country code standard.
    string? country_code?;
    # Options to configure the `/deposit_switch/create` request. If provided, cannot be `null`.
    DepositSwitchCreateRequestOptions options?;
};

# A phone number
public type PhoneNumber record {
    # The phone number.
    string data;
    # When `true`, identifies the phone number as the primary number on an account.
    boolean primary;
    # The type of phone number.
    string 'type;
};

# Defines the response schema for `/sandbox/bank_transfer/simulate`
public type SandboxBankTransferSimulateResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# SandboxIncomeFireWebhookResponse defines the response schema for `/sandbox/income/fire_webhook`
public type SandboxIncomeFireWebhookResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# A score from 0-99 that indicates the transaction return risk: a higher risk score suggests a higher return likelihood.
@constraint:Int {maxValue: 100}
public type SignalScore int;

# A JSON Web Key (JWK) that can be used in conjunction with [JWT libraries](https://jwt.io/#libraries-io) to verify Plaid webhooks
public type JWKPublicKey record {
    # The alg member identifies the cryptographic algorithm family used with the key.
    string alg;
    # The crv member identifies the cryptographic curve used with the key.
    string crv;
    # The kid (Key ID) member can be used to match a specific key. This can be used, for instance, to choose among a set of keys within the JWK during key rollover.
    string kid;
    # The kty (key type) parameter identifies the cryptographic algorithm family used with the key, such as RSA or EC.
    string kty;
    # The use (public key use) parameter identifies the intended use of the public key.
    string use;
    # The x member contains the x coordinate for the elliptic curve point.
    string x;
    # The y member contains the y coordinate for the elliptic curve point.
    string y;
    # The timestamp when the key was created, in Unix time.
    int created_at;
    # The timestamp when the key expired, in Unix time.
    int? expired_at;
};

# Identifying information for transferring money to or from a UK bank account via BACS.
public type NumbersBACS record {
    # The Plaid account ID associated with the account numbers
    string account_id;
    # The BACS account number for the account
    string account;
    # The BACS sort code for the account
    string sort_code;
};

# An object representing employment details found on a paystub.
public type EmploymentDetails record {
    # An object representing a monetary amount.
    Pay annual_salary?;
    # Date on which the employee was hired, in the YYYY-MM-DD format.
    string? hire_date?;
};

# The network or rails used for the transfer. Valid options are `ach`, `same-day-ach`, or `wire`.
public type BankTransferNetwork string;

# Identifying information for transferring money to or from a US account via ACH or wire transfer.
public type NumbersACH record {
    # The Plaid account ID associated with the account numbers
    string account_id;
    # The ACH account number for the account.
    # 
    # Note that when using OAuth with Chase Bank (`ins_56`), Chase will issue "tokenized" routing and account numbers, which are not the user's actual account and routing numbers. These tokenized numbers should work identically to normal account and routing numbers. The digits returned in the mask field will continue to reflect the actual account number, rather than the tokenized account number. If a user revokes their permissions to your app, the tokenized numbers will continue to work for ACH deposits, but not withdrawals.
    string account;
    # The ACH routing number for the account. If the institution is `ins_56`, this may be a tokenized routing number. For more information, see the description of the `account` field.
    string routing;
    # The wire transfer routing number for the account, if available
    string? wire_routing;
};

# The deposit switch destination user information
public type DepositSwitchTargetUser record {
    # The given name (first name) of the user.
    string given_name;
    # The family name (last name) of the user.
    string family_name;
    # The phone number of the user. The endpoint can accept a variety of phone number formats, including E.164.
    string phone;
    # The email address of the user.
    string email;
    # The user's address.
    DepositSwitchAddressData address?;
    # The taxpayer ID of the user, generally their SSN, EIN, or TIN.
    string tax_payer_id?;
};

# ItemRemoveResponse defines the response schema for `/item/remove`
public type ItemRemoveResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# BankTransferSweepGetResponse defines the response schema for `/bank_transfer/sweep/get`
public type BankTransferSweepGetResponse record {
    # BankTransferSweep describes a sweep transfer.
    BankTransferSweep sweep;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Defines the request schema for `/sandbox/bank_transfer/simulate`
public type SandboxBankTransferSimulateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a bank transfer.
    BankTransferID bank_transfer_id;
    # The asynchronous event to be simulated. May be: `posted`, `failed`, or `reversed`.
    # 
    # An error will be returned if the event type is incompatible with the current transfer status. Compatible status --> event type transitions include:
    # 
    # `pending` --> `failed`
    # 
    # `pending` --> `posted`
    # 
    # `posted` --> `reversed`
    string event_type;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    BankTransferFailure? failure_reason?;
};

# An optional object to filter `/investments/transactions/get` results. If provided, must be non-`null`.
public type InvestmentsTransactionsGetRequestOptions record {
    # An array of `account_ids` to retrieve for the Item.
    string[] account_ids?;
    # The number of transactions to fetch.
    @constraint:Int {minValue: 1, maxValue: 500}
    int count?;
    # The number of transactions to skip when fetching transaction history
    int offset?;
};

# Specifies optional parameters for `/institutions/get_by_id`. If provided, must not be `null`.
public type InstitutionsGetByIdRequestOptions record {
    # When `true`, return an institution's logo, brand color, and URL. When available, the bank's logo is returned as a base64 encoded 152x152 PNG, the brand color is in hexadecimal format. The default value is `false`.
    # 
    # Note that Plaid does not own any of the logos shared by the API and that by accessing or using these logos, you agree that you are doing so at your own risk and will, if necessary, obtain all required permissions from the appropriate rights holders and adhere to any applicable usage guidelines. Plaid disclaims all express or implied warranties with respect to the logos.
    boolean include_optional_metadata?;
    # If `true`, the response will include status information about the institution. Default value is `false`.
    boolean include_status?;
    # When `true`, returns metadata related to the Payment Initiation product indicating which payment configurations are supported.
    boolean include_payment_initiation_metadata?;
};

# Defines the request schema for `/bank_transfer/event/list`
public type BankTransferEventListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? start_date?;
    # The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? end_date?;
    # Plaid’s unique identifier for a bank transfer.
    string? bank_transfer_id?;
    # The account ID to get events for all transactions to/from an account.
    string? account_id?;
    # The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into your origination account; a `credit` indicates a transfer of money out of your origination account.
    string? bank_transfer_type?;
    # Filter events by event type.
    BankTransferEventType[] event_types?;
    # The maximum number of bank transfer events to return. If the number of events matching the above parameters is greater than `count`, the most recent events will be returned.
    int? count?;
    # The offset into the list of bank transfer events. When `count`=25 and `offset`=0, the first 25 events will be returned. When `count`=25 and `offset`=25, the next 25 bank transfer events will be returned.
    int? offset?;
    # The origination account ID to get events for transfers from a specific origination account.
    string? origination_account_id?;
    # Indicates the direction of the transfer: `outbound`: for API-initiated transfers
    # `inbound`: for payments received by the FBO account.
    string? direction?;
};

# Defines the request schema for `/bank_transfer/create`
public type BankTransferCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A random key provided by the client, per unique bank transfer. Maximum of 50 characters.
    # 
    # The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a bank transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single bank transfer is created.
    BankTransferIdempotencyKey idempotency_key;
    # The Plaid `access_token` for the account that will be debited or credited.
    BankTransferAccessToken access_token;
    # The Plaid `account_id` for the account that will be debited or credited.
    string account_id;
    # The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    BankTransferType 'type;
    # The network or rails used for the transfer. Valid options are `ach`, `same-day-ach`, or `wire`.
    BankTransferNetwork network;
    # The amount of the bank transfer (decimal string with two digits of precision e.g. “10.00”).
    BankTransferAmount amount;
    # The currency of the transfer amount – should be set to "USD".
    string iso_currency_code;
    # The transfer description. Maximum of 10 characters.
    @constraint:String {maxLength: 10}
    string description;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class?;
    # The legal name and other information for the account holder.
    BankTransferUser user;
    # An arbitrary string provided by the client for storage with the bank transfer. May be up to 100 characters.
    string? custom_tag?;
    # The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
    # - The JSON values must be Strings (no nested JSON objects allowed)
    # - Only ASCII characters may be used
    # - Maximum of 50 key/value pairs
    # - Maximum key length of 40 characters
    # - Maximum value length of 500 characters
    BankTransferMetadata? metadata?;
    # Plaid’s unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified.
    string? origination_account_id?;
};

# Defines the request schema for `/transfer/event/list`
public type TransferEventListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The start datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? start_date?;
    # The end datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    string? end_date?;
    # Plaid’s unique identifier for a transfer.
    string? transfer_id?;
    # The account ID to get events for all transactions to/from an account.
    string? account_id?;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into your origination account; a `credit` indicates a transfer of money out of your origination account.
    string? transfer_type?;
    # Filter events by event type.
    TransferEventType[] event_types?;
    # The maximum number of transfer events to return. If the number of events matching the above parameters is greater than `count`, the most recent events will be returned.
    int? count?;
    # The offset into the list of transfer events. When `count`=25 and `offset`=0, the first 25 events will be returned. When `count`=25 and `offset`=25, the next 25 bank transfer events will be returned.
    int? offset?;
    # The origination account ID to get events for transfers from a specific origination account.
    string? origination_account_id?;
    # Indicates the direction of the transfer: `outbound`: for API-initiated transfers
    # `inbound`: for payments received by the FBO account.
    string? direction?;
};

# Transaction information specific to inter-bank transfers. If the transaction was not an inter-bank transfer, all fields will be `null`.
# 
# If the `transactions` object was returned by a Transactions endpoint such as `/transactions/get`, the `payment_meta` key will always appear, but no data elements are guaranteed. If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
public type PaymentMeta record {
    # The transaction reference number supplied by the financial institution.
    string? reference_number;
    # The ACH PPD ID for the payer.
    string? ppd_id;
    # For transfers, the party that is receiving the transaction.
    string? payee;
    # The party initiating a wire transfer. Will be `null` if the transaction is not a wire transfer.
    string? by_order_of;
    # For transfers, the party that is paying the transaction.
    string? payer;
    # The type of transfer, e.g. 'ACH'
    string? payment_method;
    # The name of the payment processor
    string? payment_processor;
    # The payer-supplied description of the transfer.
    string? reason;
};

# The legal name and other information for the account holder.
public type TransferUserInRequest record {
    # The user's legal name.
    string legal_name;
    # The user's phone number.
    string phone_number?;
    # The user's email address.
    string email_address?;
    # The address associated with the account holder.
    TransferUserAddressInRequest address?;
};

# An object containing liability accounts
public type LiabilitiesObject record {
    # The credit accounts returned.
    CreditCardLiability[]? credit;
    # The mortgage accounts returned.
    MortgageLiability[]? mortgage;
    # The student loan accounts returned.
    StudentLoan[]? student;
};

# Defines the response schema for `/bank_transfer/balance/get`
public type BankTransferBalanceGetResponse record {
    # The information about the available balance in your bank transfer account.
    BankTransferBalance balance;
    # The ID of the origination account that this balance belongs to.
    string? origination_account_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The `USER_PERMISSION_REVOKED` webhook is fired to when an end user has used the [my.plaid.com portal](https://my.plaid.com) to revoke the permission that they previously granted to access an Item. Once access to an Item has been revoked, it cannot be restored. If the user subsequently returns to your application, a new Item must be created for the user.
public type UserPermissionRevokedWebhook record {
    # `ITEM`
    string webhook_type;
    # `USER_PERMISSION_REVOKED`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
};

# The object contains a risk score and a risk tier that evaluate the transaction return risk of an unauthorized debit. Common return codes in this category include: “R05”, "R07", "R10", "R11", "R29". These returns typically have a return time frame of up to 60 calendar days. During this period, the customer of financial institutions can dispute a transaction as unauthorized.
public type CustomerInitiatedReturnRisk record {
    # A score from 0-99 that indicates the transaction return risk: a higher risk score suggests a higher return likelihood.
    SignalScore score;
    # A tier corresponding to the projected likelihood that the transaction, if initiated, will be subject to a return.
    # 
    # In the `customer_initiated_return_risk` object, there are five risk tiers corresponding to the scores:
    #   1: Predicted customer-initiated return incidence rate between 0.00% - 0.02%
    #   2: Predicted customer-initiated return incidence rate between 0.02% - 0.05%
    #   3: Predicted customer-initiated return incidence rate between 0.05% - 0.1%
    #   4: Predicted customer-initiated return incidence rate between 0.1% - 0.5%
    #   5: Predicted customer-initiated return incidence rate greater than 0.5%
    CustomerInitiatedRiskTier risk_tier;
};

# The information about the employer on the paystub.
public type PaystubEmployer record {
    # The name of the employer on the paystub.
    string? name;
    # Add adress of the employer on the paystub.
    PaystubAddress address?;
};

# Details about the pay period.
public type PayPeriodDetails record {
    # The pay period start date, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format: "yyyy-mm-dd".
    string? start_date;
    # The pay period end date, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format: "yyyy-mm-dd".
    string? end_date;
    # The date on which the paystub was issued, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ("yyyy-mm-dd").
    string? pay_day;
    # Total earnings before tax.
    decimal? gross_earnings;
    # The net amount of the paycheck.
    decimal? check_amount;
};

# Specifies options for initializing Link for use with the Deposit Switch (beta) product. This field is required if `deposit_switch` is included in the `products` array.
public type LinkTokenCreateRequestDepositSwitch record {
    # The `deposit_switch_id` provided by the `/deposit_switch/create` endpoint.
    string deposit_switch_id;
};

# Identifying information for transferring money to or from a Canadian bank account via EFT.
public type NumbersEFTNullable record {
    *NumbersEFT;
};

# The date on which the transaction took place, in IS0 8601 format.
public type AssetReportTransaction record {
    *TransactionBase;
    string? date_transacted?;
};

# The name of the employer, as reported on the paystub.
public type EmployerIncomeSummaryFieldString record {
    *IncomeSummaryFieldString;
};

# The account where the funds are swept to.
public type BankTransferSweepAccount record {
    # Account number
    string account_number;
    # Routing number
    string routing_number;
};

# IncomeVerificationCreateResponse defines the response schema for `/income/verification/create`.
public type IncomeVerificationCreateResponse record {
    # ID of the verification. This ID is persisted throughout the lifetime of the verification.
    string income_verification_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# W2 is an object that represents income data taken from a W2 tax document.
public type W2 record {
    # The information about the employer on the paystub.
    PaystubEmployer employer?;
    # Data about the employee.
    Employee employee?;
    # The tax year of the W2 document.
    string? tax_year?;
    # An employee identification number or EIN.
    string? employer_id_number?;
    # Wages from tips and other compensation.
    string? wages_tips_other_comp?;
    # Federal income tax withheld for the tax year.
    string? federal_income_tax_withheld?;
    # Wages from social security.
    string? social_security_wages?;
    # Social security tax withheld for the tax year.
    string? social_security_tax_withheld?;
    # Wages and tips from medicare.
    string? medicare_wages_and_tips?;
    # Medicare tax withheld for the tax year.
    string? medicare_tax_withheld?;
    # Tips from social security.
    string? social_security_tips?;
    # Allocated tips.
    string? allocated_tips?;
    # Contents from box 9 on the W2.
    string? box_9?;
    # Dependent care benefits.
    string? dependent_care_benefits?;
    # Nonqualified plans.
    string? nonqualified_plans?;
    # Contents from box 12 on the W2.
    W2Box12[] box_12?;
    # Statutory employee.
    string? statutory_employee?;
    # Retirement plan.
    string? retirement_plan?;
    # Third party sick pay.
    string? third_party_sick_pay?;
    # Other.
    string? other?;
    # State and local wages
    W2StateAndLocalWages[] state_and_local_wages?;
};

# The optional address of the payment recipient. This object is not currently required to make payments from UK institutions and should not be populated, though may be necessary for future European expansion.
public type PaymentInitiationAddress record {
    # An array of length 1-2 representing the street address where the recipient is located. Maximum of 70 characters.
    @constraint:Array {minLength: 1}
    PaymentinitiationaddressStreetItemsString[] street;
    # The city where the recipient is located. Maximum of 35 characters.
    @constraint:String {maxLength: 35, minLength: 1}
    string city;
    # The postal code where the recipient is located. Maximum of 16 characters.
    @constraint:String {maxLength: 16, minLength: 1}
    string postal_code;
    # The ISO 3166-1 alpha-2 country code where the recipient is located.
    @constraint:String {maxLength: 2, minLength: 2}
    string country;
};

# The network or rails used for the transfer. Valid options are `ach` or `same-day-ach`.
public type TransferNetwork string;

# Defines the request schema for `/bank_transfer/cancel`
public type BankTransferCancelRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a bank transfer.
    BankTransferID bank_transfer_id;
};

# ApplicationGetResponse defines the schema for `/application/get`
public type ApplicationGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret;
    # This field will map to the application ID that is returned from /item/applications/list, or provided to the institution in an oauth redirect.
    ApplicationID application_id;
};

# DepositSwitchGetRequest defines the request schema for `/deposit_switch/get`
public type DepositSwitchGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the deposit switch
    string deposit_switch_id;
};

# User authentication parameters, for clients making a request without an `access_token`. This is only allowed for select clients and will not be supported in the future. Most clients should call /item/import to obtain an access token before making a request.
public type ItemApplicationListUserAuth record {
    # Account username.
    string? user_id?;
    # Account username hashed by FI.
    string? fi_username_hash?;
};

# Information about the last successful and failed investments update for the Item.
public type ItemStatusInvestments record {
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) timestamp of the last successful investments update for the Item. The status will update each time Plaid successfully connects with the institution, regardless of whether any new data is available in the update.
    string? last_successful_update?;
    # [ISO 8601](https://wikipedia.org/wiki/ISO_8601) timestamp of the last failed investments update for the Item. The status will update each time Plaid fails an attempt to connect with the institution, regardless of whether any new data is available in the update.
    string? last_failed_update?;
};

# The webhook_type `LIABILITIES` and code `DEFAULT_UPDATE` will be fired when new or updated liabilities have been detected on a liabilities item.
public type LiabilitiesDefaultUpdateWebhook record {
    # `LIABILITIES`
    string webhook_type;
    # `DEFAULT_UPDATE`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error;
    # An array of `account_id`'s for accounts that contain new liabilities.
    string[] account_ids_with_new_liabilities;
    # An object with keys of `account_id`'s that are mapped to their respective liabilities fields that changed.
    # 
    # Example: `{ "XMBvvyMGQ1UoLbKByoMqH3nXMj84ALSdE5B58": ["past_amount_due"] }`
    record {} account_ids_with_updated_liabilities;
};

# Fired when Asset Report generation has failed. The resulting `error` will have an `error_type` of `ASSET_REPORT_ERROR`.
public type AssetsErrorWebhook record {
    # `ASSETS`
    string webhook_type;
    # `ERROR`
    string webhook_code;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error;
    # The ID associated with the Asset Report.
    string asset_report_id;
};

# Defines the response schema for `/transfer/authorization/create`
public type TransferAuthorizationCreateResponse record {
    # TransferAuthorization contains the authorization decision for a proposed transfer
    TransferAuthorization authorization;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# ItemImportRequest defines the request schema for `/item/import`
public type ItemImportRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Array of product strings
    @constraint:Array {minLength: 1}
    Products[] products;
    # Object of user ID and auth token pair, permitting Plaid to aggregate a user’s accounts
    ItemImportRequestUserAuth user_auth;
    # An optional object to configure `/item/import` request.
    ItemImportRequestOptions options?;
};

# SandboxIncomeFireWebhookRequest defines the request schema for `/sandbox/income/fire_webhook`
public type SandboxIncomeFireWebhookRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification.
    string income_verification_id;
    # The URL to which the webhook should be sent.
    string webhook;
    # `VERIFICATION_STATUS_PROCESSING_COMPLETE`: The income verification status processing has completed.
    # 
    # `VERIFICATION_STATUS_DOCUMENT_REJECTED`: The documentation uploaded by the end user was recognized as a supported file format, but not recognized as a valid paystub.
    # 
    # `VERIFICATION_STATUS_PROCESSING_FAILED`: A failure occurred when attempting to process the verification documentation.
    string verification_status;
};

# An object representing the status of the student loan
public type StudentLoanStatus record {
    # The date until which the loan will be in its current status. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    string? end_date;
    # The status type of the student loan
    string? 'type;
};

# A set of fields describing the balance for an account. Balance information may be cached unless the balance object was returned by `/accounts/balance/get`.
public type AccountBalance record {
    # The amount of funds available to be withdrawn from the account, as determined by the financial institution.
    # 
    # For `credit`-type accounts, the `available` balance typically equals the `limit` less the `current` balance, less any pending outflows plus any pending inflows.
    # 
    # For `depository`-type accounts, the `available` balance typically equals the `current` balance less any pending outflows plus any pending inflows. For `depository`-type accounts, the `available` balance does not include the overdraft limit.
    # 
    # For `investment`-type accounts, the `available` balance is the total cash available to withdraw as presented by the institution.
    # 
    # Note that not all institutions calculate the `available`  balance. In the event that `available` balance is unavailable, Plaid will return an `available` balance value of `null`.
    # 
    # Available balance may be cached and is not guaranteed to be up-to-date in realtime unless the value was returned by `/accounts/balance/get`.
    decimal? available;
    # The total amount of funds in or owed by the account.
    # 
    # For `credit`-type accounts, a positive balance indicates the amount owed; a negative amount indicates the lender owing the account holder.
    # 
    # For `loan`-type accounts, the current balance is the principal remaining on the loan, except in the case of student loan accounts at Sallie Mae (`ins_116944`). For Sallie Mae student loans, the account's balance includes both principal and any outstanding interest.
    # 
    # For `investment`-type accounts, the current balance is the total value of assets as presented by the institution.
    # 
    # Note that balance information may be cached unless the value was returned by `/accounts/balance/get`; if the Item is enabled for Transactions, the balance will be at least as recent as the most recent Transaction update. If you require realtime balance information, use the `available` balance as provided by `/accounts/balance/get`.
    decimal? current;
    # For `credit`-type accounts, this represents the credit limit.
    # 
    # For `depository`-type accounts, this represents the pre-arranged overdraft limit, which is common for current (checking) accounts in Europe.
    # 
    # In North America, this field is typically only available for `credit`-type accounts.
    decimal? 'limit;
    # The ISO-4217 currency code of the balance. Always null if `unofficial_currency_code` is non-null.
    string? iso_currency_code;
    # The unofficial currency code associated with the balance. Always null if `iso_currency_code` is non-null. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `unofficial_currency_code`s.
    string? unofficial_currency_code;
    # Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:mm:ssZ`) indicating the last time that the balance for the given account has been updated
    # 
    # This is currently only provided when the `min_last_updated_datetime` is passed when calling `/accounts/balance/get` for `ins_128026` (Capital One).
    string? last_updated_datetime?;
};

# The status of the transfer.
public type BankTransferStatus string;

# Options to configure the `/deposit_switch/create` request. If provided, cannot be `null`.
public type DepositSwitchCreateRequestOptions record {
    # The URL registered to receive webhooks when the status of a deposit switch request has changed.
    string? webhook?;
    # An array of access tokens corresponding to transaction items to use when attempting to match the user to their Payroll Provider. These tokens must be created by the same client id as the one creating the switch, and have access to the transactions product.
    @constraint:Array {maxLength: 99, minLength: 1}
    AccessToken[] transaction_item_access_tokens?;
};

# ProcessorApexProcessorTokenCreateRequest defines the request schema for `/processor/apex/processor_token/create`
public type ProcessorApexProcessorTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `account_id` value obtained from the `onSuccess` callback in Link
    string account_id;
};

# A filter to apply to `credit`-type accounts
public type LinktokencreaterequestaccountsubtypesCredit record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes?;
};

# AssetReportAuditCopyRemoveRequest defines the request schema for `/asset_report/audit_copy/remove`
public type AssetReportAuditCopyRemoveRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The `audit_copy_token` granting access to the Audit Copy you would like to revoke.
    string audit_copy_token;
};

# The scopes object
public type ScopesNullable record {
    *Scopes;
};

public type AccountAssets record {
    *AccountBase;
    # The duration of transaction history available for this Item, typically defined as the time since the date of the earliest transaction in that account. Only returned by Assets endpoints.
    decimal days_available;
    # Transaction history associated with the account. Only returned by Assets endpoints. Transaction history returned by endpoints such as `/transactions/get` or `/investments/transactions/get` will be returned in the top-level `transactions` field instead.
    AssetReportTransaction[] transactions;
    # Data returned by the financial institution about the account owner or owners. Only returned by Identity or Assets endpoints. Multiple owners on a single account will be represented in the same `owner` object, not in multiple owner objects within the array.
    Owner[] owners;
    # Calculated data about the historical balances on the account. Only returned by Assets endpoints.
    HistoricalBalance[] historical_balances;
};

# Data to use to set values of test accounts. Some values cannot be specified in the schema and will instead will be calculated from other test data in order to achieve more consistent, realistic test data.
public type OverrideAccounts record {
    # `investment:` Investment account
    # 
    # `credit:` Credit card
    # 
    # `depository:` Depository account
    # 
    # `loan:` Loan account
    # 
    # `other:` Non-specified account type
    # 
    # See the [Account type schema](https://plaid.com/docs/api/accounts#account-type-schema) for a full listing of account types and corresponding subtypes.
    OverrideAccountType 'type;
    # See the [Account type schema](https://plaid.com/docs/api/accounts/#account-type-schema) for a full listing of account types and corresponding subtypes.
    AccountSubtype? subtype;
    # If provided, the account will start with this amount as the current balance.
    decimal starting_balance;
    # If provided, the account will always have this amount as its  available balance, regardless of current balance or changes in transactions over time.
    decimal force_available_balance;
    # ISO-4217 currency code. If provided, the account will be denominated in the given currency. Transactions will also be in this currency by default.
    string currency;
    # Allows specifying the metadata of the test account
    Meta meta;
    # Account and bank identifier number data used to configure the test account. All values are optional.
    Numbers numbers;
    # Specify the list of transactions on the account.
    TransactionOverride[] transactions;
    # Specify the holdings on the account.
    HoldingsOverride holdings?;
    # Specify the list of investments transactions on the account.
    InvestmentsTransactionsoverride investment_transactions?;
    # Data about the owner or owners of an account. Any fields not specified will be filled in with default Sandbox information.
    OwnerOverride identity;
    # Used to configure Sandbox test data for the Liabilities product
    LiabilityOverride liability;
    # The `inflow_model` allows you to model a test account that receives regular income or make regular payments on a loan. Any transactions generated by the `inflow_model` will appear in addition to randomly generated test data or transactions specified by `override_accounts`.
    InflowModel inflow_model;
};

# Fired when an Item is verified via automated micro-deposits. We recommend communicating to your users when this event is received to notify them that their account is verified and ready for use.
public type AutomaticallyVerifiedWebhook record {
    # `AUTH`
    string webhook_type;
    # `AUTOMATICALLY_VERIFIED`
    string webhook_code;
    # The `account_id` of the account associated with the webhook
    string account_id;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
};

# AccountsGetRequest defines the request schema for `/accounts/get`
public type AccountsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # An optional object to filter `/accounts/get` results.
    AccountsGetRequestOptions options?;
};

# A securities holding at an institution.
public type Holding record {
    # The Plaid `account_id` associated with the holding.
    string account_id;
    # The Plaid `security_id` associated with the holding.
    string security_id;
    # The last price given by the institution for this security.
    decimal institution_price;
    # The date at which `institution_price` was current.
    string? institution_price_as_of;
    # The value of the holding, as reported by the institution.
    decimal institution_value;
    # The cost basis of the holding.
    decimal? cost_basis;
    # The total quantity of the asset held, as reported by the financial institution. If the security is an option, `quantity` will reflect the total number of options (typically the number of contracts multiplied by 100), not the number of contracts.
    decimal quantity;
    # The ISO-4217 currency code of the holding. Always `null` if `unofficial_currency_code` is non-`null`.
    string? iso_currency_code;
    # The unofficial currency code associated with the holding. Always `null` if `iso_currency_code` is non-`null`. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    string? unofficial_currency_code;
};

# The verified fields from a paystub verification. All fields are provided as reported on the paystub.
public type IncomeSummary record {
    # The name of the employer, as reported on the paystub.
    EmployerIncomeSummaryFieldString employer_name;
    # The name of the employee, as reported on the paystub.
    EmployeeIncomeSummaryFieldString employee_name;
    # Year-to-date pre-tax earnings, as reported on the paystub.
    YTDGrossIncomeSummaryFieldNumber ytd_gross_income;
    # Year-to-date earnings after any tax withholdings, benefit payments or deductions, as reported on the paystub.
    YTDNetIncomeSummaryFieldNumber ytd_net_income;
    # The frequency at which the employee is paid. Possible values: `MONTHLY`, `BI-WEEKLY`, `WEEKLY`, `SEMI-MONTHLY`.
    PayFrequency? pay_frequency;
    # The employee's estimated annual salary, as derived from information reported on the paystub.
    ProjectedIncomeSummaryFieldNumber projected_wage;
    # Information about the matched direct deposit transaction used to verify a user's payroll information.
    TransactionData? verified_transaction;
};

# The `asset_report_token` returned by the original call to `/asset_report/create`
public type AssetReportRefreshAssetReportToken string;

# ItemPublicTokenCreateRequest defines the request schema for `/item/public_token/create`
public type ItemPublicTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
};

# Enumerates the account subtypes that the application wishes for the user to be able to select from. For more details refer to Plaid documentation on account filters.
public type AccountFilter record {
    # A list of account subtypes to be filtered.
    AccountFilterSubtypes depository?;
    # A list of account subtypes to be filtered.
    AccountFilterSubtypes credit?;
    # A list of account subtypes to be filtered.
    AccountFilterSubtypes loan?;
    # A list of account subtypes to be filtered.
    AccountFilterSubtypes investment?;
};

# Account identity information
public type AccountIdentity record {
    *AccountBase;
    # Data returned by the financial institution about the account owner or owners. Only returned by Identity or Assets endpoints. Multiple owners on a single account will be represented in the same `owner` object, not in multiple owner objects within the array.
    Owner[] owners;
};

# An object containing identifying numbers used for making electronic transfers to and from the `account`. The identifying number type (ACH, EFT, IBAN, or BACS) used will depend on the country of the account. An account may have more than one number type. If a particular identifying number type is not used by the `account` for which auth data has been requested, a null value will be returned.
public type ProcessorNumber record {
    # Identifying information for transferring money to or from a US account via ACH or wire transfer.
    NumbersACHNullable? ach?;
    # Identifying information for transferring money to or from a Canadian bank account via EFT.
    NumbersEFTNullable? eft?;
    # Identifying information for transferring money to or from an international bank account via wire transfer.
    NumbersInternationalNullable? international?;
    # Identifying information for transferring money to or from a UK bank account via BACS.
    NumbersBACSNullable? bacs?;
};

# Object of user ID and auth token pair, permitting Plaid to aggregate a user’s accounts
public type ItemImportRequestUserAuth record {
    # Opaque user identifier
    string user_id;
    # Authorization token Plaid will use to aggregate this user’s accounts
    string auth_token;
};

# The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
# - The JSON values must be Strings (no nested JSON objects allowed)
# - Only ASCII characters may be used
# - Maximum of 50 key/value pairs
# - Maximum key length of 40 characters
# - Maximum value length of 500 characters
public type BankTransferMetadata record {
};

# Details regarding the proposed transfer.
public type TransferAuthorizationProposedTransfer record {
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class;
    # The Plaid `account_id` for the account that will be debited or credited.
    string account_id;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    TransferType 'type;
    # The legal name and other information for the account holder.
    TransferUserInResponse user;
    # The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
    TransferAmount amount;
    # The currency of the transfer amount.
    string iso_currency_code;
    # A description of the proposed transfer.
    string description;
    # The network or rails used for the transfer.
    string network;
    # Plaid's unique identifier for the origination account that was used for this transfer.
    string origination_account_id;
};

# The address associated with the account holder.
public type TransferUserAddressInResponse record {
    # The street number and name (i.e., "100 Market St.").
    string? street;
    # Ex. "San Francisco"
    string? city;
    # The state or province (e.g., "California").
    string? region;
    # The postal code (e.g., "94103").
    string? postal_code;
    # A two-letter country code (e.g., "US").
    string? country;
};

# 
public type SandboxProcessorTokenCreateResponse record {
    # A processor token that can be used to call the `/processor/` endpoints.
    string processor_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# IncomeVerificationRequestResponse defines the response schema for `/income/verification/refresh`
public type IncomeVerificationRefreshResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
    # The verification refresh status. One of the following:
    # 
    # `"VERIFICATION_REFRESH_STATUS_USER_PRESENCE_REQUIRED"` User presence is required to refresh an income verification.
    VerificationRefreshStatus verification_refresh_status;
};

# IncomeVerificationPaystubsGetRequest defines the request schema for `/income/verification/paystubs/get`.
public type IncomeVerificationPaystubsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification for which to get paystub information.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# Student loan repayment information used to configure Sandbox test data for the Liabilities product
public type StudentLoanRepaymentModel record {
    # The only currently supported value for this field is `standard`.
    string 'type;
    # Configures the number of months before repayment starts.
    decimal non_repayment_months;
    # Configures the number of months of repayments before the loan is paid off.
    decimal repayment_months;
};

# A representation of where a transaction took place
public type Location record {
    # The street address where the transaction occurred.
    string? address;
    # The city where the transaction occurred.
    string? city;
    # The region or state where the transaction occurred.
    string? region;
    # The postal code where the transaction occurred.
    string? postal_code;
    # The ISO 3166-1 alpha-2 country code where the transaction occurred.
    string? country;
    # The latitude where the transaction occurred.
    decimal? lat;
    # The longitude where the transaction occurred.
    decimal? lon;
    # The merchant defined store number where the transaction occurred.
    string? store_number;
};

# CategoriesGetResponse defines the response schema for `/categories/get`
public type CategoriesGetResponse record {
    # An array of all of the transaction categories used by Plaid.
    Category[] categories;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# IdentityGetResponse defines the response schema for `/identity/get`
public type IdentityGetResponse record {
    # The accounts for which Identity data has been requested
    AccountIdentity[] accounts;
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object with information about the status of the Item.
public type ItemStatus record {
    # Information about the last successful and failed investments update for the Item.
    ItemStatusInvestments? investments?;
    # Information about the last successful and failed transactions update for the Item.
    ItemStatusTransactions? transactions?;
    # Information about the last webhook fired for the Item.
    ItemStatusLastWebhook? last_webhook?;
};

# A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
public type RequestID string;

# Defines the request schema for `/transfer/get`
public type TransferGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Plaid’s unique identifier for a transfer.
    TransferID transfer_id;
};

# Contains details about a security
public type Security record {
    # A unique, Plaid-specific identifier for the security, used to associate securities with holdings. Like all Plaid identifiers, the `security_id` is case sensitive.
    string security_id;
    # 12-character ISIN, a globally unique securities identifier.
    string? isin;
    # 9-character CUSIP, an identifier assigned to North American securities.
    string? cusip;
    # 7-character SEDOL, an identifier assigned to securities in the UK.
    string? sedol;
    # An identifier given to the security by the institution
    string? institution_security_id;
    # If `institution_security_id` is present, this field indicates the Plaid `institution_id` of the institution to whom the identifier belongs.
    string? institution_id;
    # In certain cases, Plaid will provide the ID of another security whose performance resembles this security, typically when the original security has low volume, or when a private security can be modeled with a publicly traded security.
    string? proxy_security_id;
    # A descriptive name for the security, suitable for display.
    string? name;
    # The security’s trading symbol for publicly traded securities, and otherwise a short identifier if available.
    string? ticker_symbol;
    # Indicates that a security is a highly liquid asset and can be treated like cash.
    boolean? is_cash_equivalent;
    # The security type of the holding. Valid security types are:
    # 
    # `cash`: Cash, currency, and money market funds
    # 
    # `derivative`: Options, warrants, and other derivative instruments
    # 
    # `equity`: Domestic and foreign equities
    # 
    # `etf`: Multi-asset exchange-traded investment funds
    # 
    # `fixed income`: Bonds and certificates of deposit (CDs)
    # 
    # `loan`: Loans and loan receivables.
    # 
    # `mutual fund`: Open- and closed-end vehicles pooling funds of multiple investors.
    # 
    # `other`: Unknown or other investment types
    string? 'type;
    # Price of the security at the close of the previous trading session. `null` for non-public securities. If the security is a foreign currency or a cryptocurrency this field will be updated daily and will be priced in USD.
    decimal? close_price;
    # Date for which `close_price` is accurate. Always `null` if `close_price` is `null`.
    string? close_price_as_of;
    # The ISO-4217 currency code of the price given. Always `null` if `unofficial_currency_code` is non-`null`.
    string? iso_currency_code;
    # The unofficial currency code associated with the security. Always `null` if `iso_currency_code` is non-`null`. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    string? unofficial_currency_code;
};

# Defines the response schema for `/transfer/get`
public type TransferGetResponse record {
    # Represents a transfer within the Transfers API.
    Transfer transfer;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# IncomeVerificationRefreshRequest defines the request schema for `/income/verification/refresh`
public type IncomeVerificationRefreshRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the verification.
    string? income_verification_id?;
    # The access token associated with the Item data is being requested for.
    AccessTokenNullable? access_token?;
};

# A filter to apply to `depository`-type accounts
public type LinktokencreaterequestaccountsubtypesDepository record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes?;
};

# The access token associated with the Item data is being requested for.
public type AccessTokenNullable string?;

# Specifies options for initializing Link for use with the Income (beta) product. This field is required if `income_verification` is included in the `products` array.
public type LinkTokenCreateRequestIncomeVerification record {
    # The `income_verification_id` of the verification instance, as provided by `/income/verification/create`.
    string income_verification_id;
    # The `asset_report_id` of an asset report associated with the user, as provided by `/asset_report/create`. Providing an `asset_report_id` is optional and can be used to verify the user through a streamlined flow. If provided, the bank linking flow will be skipped.
    string asset_report_id?;
};

# Metadata about the Item.
public type Item record {
    # The Plaid Item ID. The `item_id` is always unique; linking the same account at the same institution twice will result in two Items with different `item_id` values. Like all Plaid identifiers, the `item_id` is case-sensitive.
    string item_id;
    # The Plaid Institution ID associated with the Item. Field is `null` for Items created via Same Day Micro-deposits.
    string? institution_id?;
    # The URL registered to receive webhooks for the Item.
    string? webhook;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error;
    # A list of products available for the Item that have not yet been accessed.
    Products[] available_products;
    # A list of products that have been billed for the Item. Note - `billed_products` is populated in all environments but only requests in Production are billed.
    Products[] billed_products;
    # The RFC 3339 timestamp after which the consent provided by the end user will expire. Upon consent expiration, the item will enter the `ITEM_LOGIN_REQUIRED` error state. To circumvent the `ITEM_LOGIN_REQUIRED` error and maintain continuous consent, the end user can reauthenticate via Link’s update mode in advance of the consent expiration time.
    # 
    # Note - This is only relevant for certain OAuth-based institutions. For all other institutions, this field will be null.
    string? consent_expiration_time;
    # Indicates whether an Item requires user interaction to be updated, which can be the case for Items with some forms of two-factor authentication.
    # 
    # `background` - Item can be updated in the background
    # 
    # `user_present_required` - Item requires user interaction to be updated
    string update_type;
};

# PaymentInitiationPayment defines a payment initiation payment
public type PaymentInitiationPayment record {
    # The ID of the payment. Like all Plaid identifiers, the `payment_id` is case sensitive.
    string payment_id;
    # The amount and currency of a payment
    PaymentAmount amount;
    # The status of the payment.
    # 
    # `PAYMENT_STATUS_INPUT_NEEDED`: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.
    # 
    # `PAYMENT_STATUS_PROCESSING`: The payment is currently being processed. The payment will automatically exit this state when processing is complete.
    # 
    # `PAYMENT_STATUS_INITIATED`: The payment has been successfully initiated and is considered complete.
    # 
    # `PAYMENT_STATUS_COMPLETED`: Indicates that the standing order has been successfully established. This state is only used for standing orders.
    # 
    # `PAYMENT_STATUS_INSUFFICIENT_FUNDS`: The payment has failed due to insufficient funds.
    # 
    # `PAYMENT_STATUS_FAILED`: The payment has failed to be initiated. This error is retryable once the root cause is resolved.
    # 
    # `PAYMENT_STATUS_BLOCKED`: The payment has been blocked. This is a retryable error.
    # 
    # `PAYMENT_STATUS_UNKNOWN`: The payment status is unknown.
    string status;
    # The ID of the recipient
    string recipient_id;
    # A reference for the payment.
    string reference;
    # The value of the reference sent to the bank after adjustment to pass bank validation rules.
    string? adjusted_reference?;
    # The date and time of the last time the `status` was updated, in IS0 8601 format
    string last_status_update;
    # The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up as a standing order. If no schedule is specified, the payment will be executed only once.
    ExternalPaymentScheduleGet? schedule?;
    # External payment refund details.
    ExternalPaymentRefundDetails? refund_details?;
    # The account number and sort code of the sender's account, if specified in the `/payment_initiation/payment/create` call.
    SenderBACSNullable? bacs;
    # The International Bank Account Number (IBAN) for the sender, if specified in the `/payment_initiation/payment/create` call.
    string? iban;
    # The EMI (E-Money Institution) account that this payment is associated with, if any. This EMI account is used as an intermediary account to enable Plaid to reconcile the settlement of funds for Payment Initiation requests.
    string? emi_account_id?;
};

# Defines the response schema for `/bank_transfer/event/sync`
public type BankTransferEventSyncResponse record {
    # An array of objects representing events in the Bank Transfers API.
    BankTransferEvent[] bank_transfer_events;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# TransactionsGetResponse defines the response schema for `/transactions/get`
public type TransactionsGetResponse record {
    # An array containing the `accounts` associated with the Item for which transactions are being returned. Each transaction can be mapped to its corresponding account via the `account_id` field.
    AccountBase[] accounts;
    # An array containing transactions from the account. Transactions are returned in reverse chronological order, with the most recent at the beginning of the array. The maximum number of transactions returned is determined by the `count` parameter.
    Transaction[] transactions;
    # The total number of transactions available within the date range specified. If `total_transactions` is larger than the size of the `transactions` array, more transactions are available and can be fetched via manipulating the `offset` parameter.
    int total_transactions;
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The type of event that this transfer represents.
# 
# `pending`: A new transfer was created; it is in the pending state.
# 
# `cancelled`: The transfer was cancelled by the client.
# 
# `failed`: The transfer failed, no funds were moved.
# 
# `posted`: The transfer has been successfully submitted to the payment network.
# 
# `reversed`: A posted transfer was reversed.
# 
# `receiver_pending`: The matching transfer was found as a pending transaction in the receiver's account
# 
# `receiver_posted`: The matching transfer was found as a posted transaction in the receiver's account
public type TransferEventType string;

# Specify the security associated with the holding or investment transaction. When inputting custom security data to the Sandbox, Plaid will perform post-data-retrieval normalization and enrichment. These processes may cause the data returned by the Sandbox to be slightly different from the data you input. An ISO-4217 currency code and a security identifier (`ticker_symbol`, `cusip`, `isin`, or `sedol`) are required.
public type SecurityOverride record {
    # 12-character ISIN, a globally unique securities identifier.
    string isin?;
    # 9-character CUSIP, an identifier assigned to North American securities.
    string cusip?;
    # 7-character SEDOL, an identifier assigned to securities in the UK.
    string sedol?;
    # A descriptive name for the security, suitable for display.
    string name?;
    # The security’s trading symbol for publicly traded securities, and otherwise a short identifier if available.
    string ticker_symbol?;
    # Either a valid `iso_currency_code` or `unofficial_currency_code`
    string currency?;
};

# External payment refund details.
public type ExternalPaymentRefundDetails record {
    # The name of the account holder.
    string name;
    # The International Bank Account Number (IBAN) for the account.
    string? iban;
    # The account number and sort code of the recipient's account.
    RecipientBACSNullable? bacs;
};

# An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
public type AccountSubtypes AccountSubtype[];

# The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
public type TransferAmount string;

# An object representing information about the net pay amount on the paystub.
public type NetPay record {
    # An array of objects representing information about a distribution from the paycheck (for example, the amount distributed to a specific checking account, or to a retirement plan).
    DistributionDetails[] distribution_details?;
    # An object representing both the current pay period and year to date amount for a category.
    Total total?;
};

# InstitutionsSearchRequest defines the request schema for `/institutions/search`
public type InstitutionsSearchRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The search query. Institutions with names matching the query are returned
    string query;
    # Filter the Institutions based on whether they support all products listed in `products`. Provide `null` to get institutions regardless of supported products. Note that when `auth` is specified as a product, if you are enabled for Instant Match or Automated Micro-deposits, institutions that support those products will be returned even if `auth` is not present in their product array.
    @constraint:Array {minLength: 1}
    Products[] products;
    # Specify an array of Plaid-supported country codes this institution supports, using the ISO-3166-1 alpha-2 country code standard.
    CountryCode[] country_codes;
    # An optional object to filter `/institutions/search` results.
    InstitutionsSearchRequestOptions options?;
};

# Fired once Plaid calculates income from an Item.
public type ItemProductReadyWebhook record {
    # `INCOME`
    string webhook_type;
    # `PRODUCT_READY`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
};

# InvestmentsHoldingsGetResponse defines the response schema for `/investments/holdings/get`
public type InvestmentsHoldingsGetResponse record {
    # The accounts associated with the Item
    AccountBase[] accounts;
    # The holdings belonging to investment accounts associated with the Item. Details of the securities in the holdings are provided in the `securities` field. 
    Holding[] holdings;
    # Objects describing the securities held in the accounts associated with the Item. 
    Security[] securities;
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationPaymentGetRequest defines the request schema for `/payment_initiation/payment/get`
public type PaymentInitiationPaymentGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The `payment_id` returned from `/payment_initiation/payment/create`.
    @constraint:String {minLength: 1}
    string payment_id;
};

# PaymentInitiationPaymentTokenCreateResponse defines the response schema for `/payment_initiation/payment/token/create`
public type PaymentInitiationPaymentTokenCreateResponse record {
    # A `payment_token` that can be provided to Link initialization to enter the payment initiation flow
    string payment_token;
    # The date and time at which the token will expire, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format. A `payment_token` expires after 15 minutes.
    string payment_token_expiration_time;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# ProcessorTokenCreateResponse defines the response schema for `/processor/token/create` and `/processor/apex/processor_token/create`
public type ProcessorTokenCreateResponse record {
    # The `processor_token` that can then be used by the Plaid partner to make API requests
    string processor_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Describes the connected application for a particular end user.
public type ItemApplicationListResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id?;
    # A list of connected applications.
    ConnectedApplication[] applications;
};

# LinkTokenCreateRequest defines the request schema for `/link/token/create`
public type LinkTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The name of your application, as it should be displayed in Link. Maximum length of 30 characters.
    string client_name;
    # The language that Link should be displayed in.
    # 
    # Supported languages are:
    # - English (`'en'`)
    # - French (`'fr'`)
    # - Spanish (`'es'`)
    # - Dutch (`'nl'`)
    # 
    # When using a Link customization, the language configured here must match the setting in the customization, or the customization will not be applied.
    string language;
    # Specify an array of Plaid-supported country codes using the ISO-3166-1 alpha-2 country code standard. Institutions from all listed countries will be shown.  Supported country codes are: `US`, `CA`, `ES`, `FR`, `GB`, `IE`, `NL`.
    # 
    # If Link is launched with multiple country codes, only products that you are enabled for in all countries will be used by Link. Note that while all countries are enabled by default in Sandbox and Development, in Production only US and Canada are enabled by default. To gain access to European institutions in the Production environment, [file a product access Support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access) via the Plaid dashboard. If you initialize with a European country code, your users will see the European consent panel during the Link flow.
    # 
    # If using a Link customization, make sure the country codes in the customization match those specified in `country_codes`. If both `country_codes` and a Link customization are used, the value in `country_codes` may override the value in the customization.
    # 
    # If using the Auth features Instant Match, Same-day Micro-deposits, or Automated Micro-deposits, `country_codes` must be set to `['US']`.
    @constraint:Array {minLength: 1}
    CountryCode[] country_codes;
    # An object specifying information about the end user who will be linking their account.
    LinkTokenCreateRequestUser user;
    # List of Plaid product(s) you wish to use. If launching Link in update mode, should be omitted; required otherwise. Valid products are:
    # 
    # `transactions`, `auth`, `identity`, `assets`, `investments`, `liabilities`, `payment_initiation`, `deposit_switch`, `income_verification`
    # 
    # `balance` is *not* a valid value, the Balance product does not require explicit initalization and will automatically be initialized when any other product is initialized.
    # 
    # Only institutions that support *all* requested products will be shown in Link; to maximize the number of institutions listed, it is recommended to initialize Link with the minimal product set required for your use case. Additional products can be added after Link initialization by calling the relevant endpoints. For details and exceptions, see [Choosing when to initialize products](https://plaid.com/docs/link/best-practices/#choosing-when-to-initialize-products).
    # 
    # Note that, unless you have opted to disable Instant Match support, institutions that support Instant Match will also be shown in Link if `auth` is specified as a product, even though these institutions do not contain `auth` in their product array.
    # 
    # In Production, you will be billed for each product that you specify when initializing Link. Note that a product cannot be removed from an Item once the Item has been initialized with that product. To stop billing on an Item for subscription-based products, such as Liabilities, Investments, and Transactions, remove the Item via `/item/remove`.
    Products[] products?;
    # The destination URL to which any webhooks should be sent.
    string webhook?;
    # The `access_token` associated with the Item to update, used when updating or modifying an existing `access_token`. Used when launching Link in update mode, when completing the Same-day (manual) Micro-deposit flow, or (optionally) when initializing Link as part of the Payment Initiation (UK and Europe) flow.
    string access_token?;
    # The name of the Link customization from the Plaid Dashboard to be applied to Link. If not specified, the `default` customization will be used. When using a Link customization, the language in the customization must match the language selected via the `language` parameter, and the countries in the customization should match the country codes selected via `country_codes`.
    string link_customization_name?;
    # A URI indicating the destination where a user should be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or via a webview. The `redirect_uri` should not contain any query parameters. When used in Production or Development, must be an https URI. To specify any subdomain, use `*` as a wildcard character, e.g. `https://*.example.com/oauth.html`. If `android_package_name` is specified, this field should be left blank.  Note that any redirect URI must also be added to the Allowed redirect URIs list in the [developer dashboard](https://dashboard.plaid.com/team/api).
    string redirect_uri?;
    # The name of your app's Android package. Required if using the `link_token` to initialize Link on Android. When creating a `link_token` for initializing Link on other platforms, this field must be left blank. Any package name specified here must also be added to the Allowed Android package names setting on the [developer dashboard](https://dashboard.plaid.com/team/api). 
    string android_package_name?;
    # By default, Link will provide limited account filtering: it will only display Institutions that are compatible with all products supplied in the `products` parameter of `/link/token/create`, and, if `auth` is specified in the `products` array, will also filter out accounts other than `checking` and `savings` accounts on the Account Select pane. You can further limit the accounts shown in Link by using `account_filters` to specify the account subtypes to be shown in Link. Only the specified subtypes will be shown. This filtering applies to both the Account Select view (if enabled) and the Institution Select view. Institutions that do not support the selected subtypes will be omitted from Link. To indicate that all subtypes should be shown, use the value `"all"`. If the `account_filters` filter is used, any account type for which a filter is not specified will be entirely omitted from Link. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema).
    # 
    # For institutions using OAuth, the filter will not affect the list of accounts shown by the bank in the OAuth window.
    LinkTokenAccountFilters account_filters?;
    # Configuration parameters for EU flows
    LinkTokenEUConfig eu_config?;
    # Used for certain Europe-only configurations, as well as certain legacy use cases in other regions.
    string institution_id?;
    # Specifies options for initializing Link for use with the Payment Initiation (Europe) product. This field is required if `payment_initiation` is included in the `products` array.
    LinkTokenCreateRequestPaymentInitiation payment_initiation?;
    # Specifies options for initializing Link for use with the Deposit Switch (beta) product. This field is required if `deposit_switch` is included in the `products` array.
    LinkTokenCreateRequestDepositSwitch deposit_switch?;
    # Specifies options for initializing Link for use with the Income (beta) product. This field is required if `income_verification` is included in the `products` array.
    LinkTokenCreateRequestIncomeVerification income_verification?;
    # Specifies options for initializing Link for use with the Auth product. This field is currently only required if using the Flexible Auth product (currently in closed beta).
    LinkTokenCreateRequestAuth auth?;
};

# An object representing details that can be found on the paystub.
public type PaystubDetails record {
    # Beginning date of the pay period on the paystub in the 'YYYY-MM-DD' format.
    string? pay_period_start_date?;
    # Ending date of the pay period on the paystub in the 'YYYY-MM-DD' format.
    string? pay_period_end_date?;
    # Pay date on the paystub in the 'YYYY-MM-DD' format.
    string? pay_date?;
    # The name of the payroll provider that generated the paystub, e.g. ADP
    string? paystub_provider?;
    # The frequency at which the employee is paid. Possible values: `MONTHLY`, `BI-WEEKLY`, `WEEKLY`, `SEMI-MONTHLY`.
    string? pay_frequency?;
};

# Describes the connected application for a particular end user.
public type ConnectedApplication record {
    # This field will map to the application ID that is returned from /item/applications/list, or provided to the institution in an oauth redirect.
    ApplicationID application_id;
    # The name of the application
    string name;
    # A URL that links to the application logo image (will be deprecated in the future, please use logo_url).
    string? logo;
    # A URL that links to the application logo image.
    string? logo_url;
    # The URL for the application's website
    string? application_url;
    # A string provided by the connected app stating why they use their respective enabled products.
    string? reason_for_access;
    # The date this application was linked in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format in UTC.
    string created_at;
    # (Deprecated) A list of enums representing the data collected and products enabled for this connected application.
    string[] product_data_types;
    # The scopes object
    ScopesNullable? scopes?;
    # Scope of required and optional account features or content from a ConnectedApplication.
    RequestedScopes requested_scopes?;
};

# AuthGetResponse defines the response schema for `/auth/get`
public type AuthGetResponse record {
    # The `accounts` for which numbers are being retrieved.
    AccountBase[] accounts;
    # An object containing identifying numbers used for making electronic transfers to and from the `accounts`. The identifying number type (ACH, EFT, IBAN, or BACS) used will depend on the country of the account. An account may have more than one number type. If a particular identifying number type is not used by any `accounts` for which data has been requested, the array for that type will be empty.
    AuthGetNumbers numbers;
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The information about the available balance in your bank transfer account.
public type BankTransferBalance record {
    # The total available balance - the sum of all successful debit transfer amounts minus all credit transfer amounts.
    string available;
    # The transactable balance shows the amount in your account that you are able to use for transfers, and is essentially your available balance minus your minimum balance.
    string transactable;
};

# The object contains a risk score and a risk tier that evaluate the transaction return risk because an account is overdrawn or because an ineligible account is used. Common return codes in this category include: "R01", "R02", "R03", "R04", "R06", “R08”,  "R09", "R13", "R16", "R17", "R20", "R23". These returns have a turnaround time of 2 banking days.
public type BankInitiatedReturnRisk record {
    # A score from 0-99 that indicates the transaction return risk: a higher risk score suggests a higher return likelihood.
    SignalScore score;
    # In the `bank_initiated_return_risk` object, there are eight risk tiers corresponding to the scores:
    #   1: Predicted bank-initiated return incidence rate between 0.0% - 0.5%
    #   2: Predicted bank-initiated return incidence rate between 0.5% - 1.5%
    #   3: Predicted bank-initiated return incidence rate between 1.5% - 3%
    #   4: Predicted bank-initiated return incidence rate between 3% - 5%
    #   5: Predicted bank-initiated return incidence rate between 5% - 10%
    #   6: Predicted bank-initiated return incidence rate between 10% - 15%
    #   7: Predicted bank-initiated return incidence rate between 15% and 50%
    #   8: Predicted bank-initiated return incidence rate greater than 50%
    BankInitiatedRiskTier risk_tier;
};

public type W2StateAndLocalWages record {
    # State associated with the wage.
    string? state?;
    # State identification number of the employer.
    string? employer_state_id_number?;
    # Wages and tips from the specified state.
    string? state_wages_tips?;
    # Income tax from the specified state.
    string? state_income_tax?;
    # Wages and tips from the locality.
    string? local_wages_tips?;
    # Income tax from the locality.
    string? local_income_tax?;
    # Name of the locality.
    string? locality_name?;
};

# IncomeVerificationSummaryGetResponse defines the response schema for `/income/verification/summary/get`.
public type IncomeVerificationSummaryGetResponse record {
    # A list of income summaries.
    IncomeSummary[] income_summaries;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error?;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Fired when the status of an income verification instance has changed. It will typically take several minutes for this webhook to fire after the end user has uploaded their documents in the Document Income flow.
public type IncomeVerificationStatusWebhook record {
    # `"INCOME"`
    string webhook_type;
    # `income_verification`
    string webhook_code;
    # The `income_verification_id` of the verification instance whose status is being reported.
    string income_verification_id;
    # `VERIFICATION_STATUS_PROCESSING_COMPLETE`: The income verification status processing has completed.
    # 
    # `VERIFICATION_STATUS_UPLOAD_ERROR`: An upload error occurred when the end user attempted to upload their verification documentation.
    # 
    # `VERIFICATION_STATUS_INVALID_TYPE`: The end user attempted to upload verification documentation in an unsupported file format.
    # 
    # `VERIFICATION_STATUS_DOCUMENT_REJECTED`: The documentation uploaded by the end user was recognized as a supported file format, but not recognized as a valid paystub.
    # 
    # `VERIFICATION_STATUS_PROCESSING_FAILED`: A failure occurred when attempting to process the verification documentation.
    string verification_status;
};

# An optional object to configure `/item/import` request.
public type ItemImportRequestOptions record {
    # Specifies a webhook URL to associate with an Item. Plaid fires a webhook if credentials fail.
    string webhook?;
};

# A filter to apply to `loan`-type accounts
public type LinktokencreaterequestaccountsubtypesLoan record {
    # An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema). 
    AccountSubtypes account_subtypes?;
};

# LiabilitiesGetRequest defines the request schema for `/liabilities/get`
public type LiabilitiesGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # An optional object to filter `/liabilities/get` results. If provided, `options` cannot be null.
    LiabilitiesGetRequestOptions options?;
};

# A JWT Header, used for webhook validation
public type JWTHeader record {
    # Id of the JWT header
    string id;
};

# Represents an event in the Transfers API.
public type TransferEvent record {
    # Plaid’s unique identifier for this event. IDs are sequential unsigned 64-bit integers.
    int event_id;
    # The datetime when this event occurred. This will be of the form `2006-01-02T15:04:05Z`.
    string timestamp;
    # The type of event that this transfer represents.
    # 
    # `pending`: A new transfer was created; it is in the pending state.
    # 
    # `cancelled`: The transfer was cancelled by the client.
    # 
    # `failed`: The transfer failed, no funds were moved.
    # 
    # `posted`: The transfer has been successfully submitted to the payment network.
    # 
    # `reversed`: A posted transfer was reversed.
    # 
    # `receiver_pending`: The matching transfer was found as a pending transaction in the receiver's account
    # 
    # `receiver_posted`: The matching transfer was found as a posted transaction in the receiver's account
    TransferEventType event_type;
    # The account ID associated with the transfer.
    string account_id;
    # Plaid’s unique identifier for a transfer.
    TransferID transfer_id;
    # The ID of the origination account that this balance belongs to.
    string? origination_account_id;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    TransferType transfer_type;
    # The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
    TransferAmount transfer_amount;
    # The currency of the transfer amount.
    string transfer_iso_currency_code;
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    TransferFailure? failure_reason;
    # Indicates the direction of the transfer: `outbound` for API-initiated transfers, or `inbound` for payments received by the FBO account.
    TransferDirection? direction;
    # The receiver details if the type of this event is `reciever_pending` or `reciever_posted`. Null value otherwise.
    TransferReceiverDetails? receiver_details;
};

# LinkTokenGetResponse defines the response schema for `/link/token/get`
public type LinkTokenGetResponse record {
    # A `link_token`, which can be supplied to Link in order to initialize it and receive a `public_token`, which can be exchanged for an `access_token`.
    string link_token;
    # The creation timestamp for the `link_token`, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format.
    string? created_at;
    # The expiration timestamp for the `link_token`, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format.
    string? expiration;
    # An object specifying the arguments originally provided to the `/link/token/create` call.
    LinkTokenGetMetadataResponse metadata;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# SandboxPublicTokenCreateResponse defines the response schema for `/sandbox/public_token/create`
public type SandboxPublicTokenCreateResponse record {
    # A public token that can be exchanged for an access token using `/item/public_token/exchange`
    string public_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Year-to-date earnings after any tax withholdings, benefit payments or deductions, as reported on the paystub.
public type YTDNetIncomeSummaryFieldNumber record {
    *IncomeSummaryFieldNumber;
};

# Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:mm:ssZ`) indicating the oldest acceptable balance when making a request to `/accounts/balance/get`.
# 
# If the balance that is pulled for `ins_128026` (Capital One) is older than the given timestamp, an `INVALID_REQUEST` error with the code of `LAST_UPDATED_DATETIME_OUT_OF_RANGE` will be returned with the most recent timestamp for the requested account contained in the response.
# 
# This field is only used when the institution is `ins_128026` (Capital One), in which case a value must be provided or an `INVALID_REQUEST` error with the code of `INVALID_FIELD` will be returned. For all other institutions, this field is ignored.
public type MinLastUpdatedDatetime string;

# WebhookVerificationKeyGetResponse defines the response schema for `/webhook_verification_key/get`
public type WebhookVerificationKeyGetResponse record {
    # A JSON Web Key (JWK) that can be used in conjunction with [JWT libraries](https://jwt.io/#libraries-io) to verify Plaid webhooks
    JWKPublicKey 'key;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An object representing both a breakdown of earnings on a paystub and the total earnings.
public type Earnings record {
    # An array of objects representing both the current pay period and year to date amount for an earning category.
    EarningsTotal[] subtotals?;
    # An array of objects representing both the current pay period and year to date amount for an earning category.
    EarningsTotal[] totals?;
};

# ItemPublicTokenExchangeResponse defines the response schema for `/item/public_token/exchange`
public type ItemPublicTokenExchangeResponse record {
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `item_id` value of the Item associated with the returned `access_token`
    string item_id;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# ProcessorStripeBankAccountTokenCreateRequest defines the request schema for `/processor/stripe/bank_account/create`
public type ProcessorStripeBankAccountTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The `account_id` value obtained from the `onSuccess` callback in Link
    string account_id;
};

# Defines the request schema for `/transfer/authorization/create`
public type TransferAuthorizationCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The Plaid `access_token` for the account that will be debited or credited.
    TransferAccessToken access_token;
    # The Plaid `account_id` for the account that will be debited or credited.
    string account_id;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    TransferType 'type;
    # The network or rails used for the transfer. Valid options are `ach` or `same-day-ach`.
    TransferNetwork network;
    # The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
    TransferAmount amount;
    # The currency of the transfer amount – should be set to "USD".
    string iso_currency_code;
    # The authorization description. Maximum of 10 characters.
    @constraint:String {maxLength: 10}
    string description;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class;
    # The legal name and other information for the account holder.
    TransferUserInRequest user;
    # Information about the device being used to initiate the authorization.
    TransferAuthorizationDevice device?;
    # Plaid's unique identifier for the origination account for this authorization. If not specified, the default account will be used.
    string origination_account_id?;
};

# A representation of an Item within an Asset Report.
public type AssetReportItem record {
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # The full financial institution name associated with the Item.
    string institution_name;
    # The id of the financial institution associated with the Item.
    string institution_id;
    # The date and time when this Item’s data was last retrieved from the financial institution, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format.
    string date_last_updated;
    # Data about each of the accounts open on the Item.
    AccountAssets[] accounts;
};

# A transaction within an investment account.
public type InvestmentTransaction record {
    # The ID of the Investment transaction, unique across all Plaid transactions. Like all Plaid identifiers, the `investment_transaction_id` is case sensitive.
    string investment_transaction_id;
    # A legacy field formerly used internally by Plaid to identify certain canceled transactions.
    string? cancel_transaction_id?;
    # The `account_id` of the account against which this transaction posted.
    string account_id;
    # The `security_id` to which this transaction is related.
    string? security_id;
    # The [ISO 8601](https://wikipedia.org/wiki/ISO_8601) posting date for the transaction, or transacted date for pending transactions.
    string date;
    # The institution’s description of the transaction.
    string name;
    # The number of units of the security involved in this transaction.
    decimal quantity;
    # The complete value of the transaction. Positive values when cash is debited, e.g. purchases of stock; negative values when cash is credited, e.g. sales of stock. Treatment remains the same for cash-only movements unassociated with securities.
    decimal amount;
    # The price of the security at which this transaction occurred.
    decimal price;
    # The combined value of all fees applied to this transaction
    decimal? fees;
    # Value is one of the following:
    # `buy`: Buying an investment
    # `sell`: Selling an investment
    # `cancel`: A cancellation of a pending transaction
    # `cash`: Activity that modifies a cash position
    # `fee`: A fee on the account
    # `transfer`: Activity which modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer
    # 
    # For descriptions of possible transaction types and subtypes, see the [Investment transaction types schema](https://plaid.com/docs/api/accounts/#investment-transaction-types-schema).
    string 'type;
    # For descriptions of possible transaction types and subtypes, see the [Investment transaction types schema](https://plaid.com/docs/api/accounts/#investment-transaction-types-schema).
    string subtype;
    # The ISO-4217 currency code of the transaction. Always `null` if `unofficial_currency_code` is non-`null`.
    string? iso_currency_code;
    # The unofficial currency code associated with the holding. Always `null` if `iso_currency_code` is non-`null`. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    # 
    # See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    string? unofficial_currency_code;
};

# An object representing an Asset Report
public type AssetReport record {
    # A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive.
    AssetReportId asset_report_id;
    # An identifier you determine and submit for the Asset Report.
    string client_report_id;
    # The date and time when the Asset Report was created, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (e.g. "2018-04-12T03:32:11Z").
    string date_generated;
    # The duration of transaction history you requested
    decimal days_requested;
    # The user object allows you to provide additional information about the user to be appended to the Asset Report. All fields are optional. The `first_name`, `last_name`, and `ssn` fields are required if you would like the Report to be eligible for Fannie Mae’s Day 1 Certainty™ program.
    AssetReportUser user;
    # Data returned by Plaid about each of the Items included in the Asset Report.
    AssetReportItem[] items;
};

# Defines the request schema for `/processor/bank_transfer/create`
public type ProcessorBankTransferCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A random key provided by the client, per unique bank transfer. Maximum of 50 characters.
    # 
    # The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a bank transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single bank transfer is created.
    BankTransferIdempotencyKey idempotency_key;
    # The processor token obtained from the Plaid integration partner. Processor tokens are in the format: `processor-<environment>-<identifier>`
    ProcessorToken processor_token;
    # The type of bank transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    BankTransferType 'type;
    # The network or rails used for the transfer. Valid options are `ach`, `same-day-ach`, or `wire`.
    BankTransferNetwork network;
    # The amount of the bank transfer (decimal string with two digits of precision e.g. “10.00”).
    BankTransferAmount amount;
    # The currency of the transfer amount – should be set to "USD".
    string iso_currency_code;
    # The transfer description. Maximum of 10 characters.
    @constraint:String {maxLength: 10}
    string description;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class?;
    # The legal name and other information for the account holder.
    BankTransferUser user;
    # An arbitrary string provided by the client for storage with the bank transfer. May be up to 100 characters.
    string? custom_tag?;
    # The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
    # - The JSON values must be Strings (no nested JSON objects allowed)
    # - Only ASCII characters may be used
    # - Maximum of 50 key/value pairs
    # - Maximum key length of 40 characters
    # - Maximum value length of 500 characters
    BankTransferMetadata? metadata?;
    # Plaid’s unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified.
    string? origination_account_id?;
};

# A loan type account. Supported products for `loan` accounts are: Balance, Liabilities, and Transactions.
public type LoanAccount record {
    # Auto loan
    string auto;
    # Business loan
    string business;
    # Commercial loan
    string commercial;
    # Construction loan
    string construction;
    # Consumer loan
    string consumer;
    # Home Equity Line of Credit (HELOC)
    string 'home\ equity;
    # General loan
    string loan;
    # Mortgage loan
    string mortgage;
    # Pre-approved overdraft account, usually tied to a checking account
    string overdraft;
    # Pre-approved line of credit
    string 'line\ of\ credit;
    # Student loan
    string student;
    # Other loan type or unknown loan type
    string other;
};

# The user's legal name
public type SignalPersonName record {
    # The user's name prefix (e.g. "Mr.")
    string? prefix?;
    # The user's given name. If the user has a one-word name, it should be provided in this field.
    string? given_name?;
    # The user's middle name
    string? middle_name?;
    # The user's family name / surname
    string? family_name?;
    # The user's name suffix (e.g. "II")
    string? suffix?;
};

# AccountsGetResponse defines the response schema for `/accounts/get` and `/accounts/balance/get`.
public type AccountsGetResponse record {
    # An array of financial institution accounts associated with the Item.
    # If `/accounts/balance/get` was called, each account will include real-time balance information.
    AccountBase[] accounts;
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The processor token obtained from the Plaid integration partner. Processor tokens are in the format: `processor-<environment>-<identifier>`
public type ProcessorToken string;

# PaymentInitiationPaymentGetResponse defines the response schema for `/payment_initation/payment/get`
public type PaymentInitiationPaymentGetResponse record {
    *PaymentInitiationPayment;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id?;
};

# Defines the request schema for `/bank_transfer/event/sync`
public type BankTransferEventSyncRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The latest (largest) `event_id` fetched via the sync endpoint, or 0 initially.
    int after_id;
    # The maximum number of bank transfer events to return.
    int? count = 25;
};

public type HealthIncident record {
    # The start date of the incident, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `"2020-10-30T15:26:48Z"`.
    string start_date;
    # The end date of the incident, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `"2020-10-30T15:26:48Z"`.
    string end_date?;
    # The title of the incident
    string title;
    # Updates on the health incident.
    IncidentUpdate[] incident_updates;
};

# The access token associated with the Item data is being requested for.
public type AccessToken string;

# An error object and associated `item_id` used to identify a specific Item and error when a batch operation operating on multiple Items has encountered an error in one of the Items.
public type Cause record {
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error;
};

# ItemWebhookUpdateRequest defines the request schema for `/item/webhook/update`
public type ItemWebhookUpdateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The new webhook URL to associate with the Item.
    string webhook;
};

# InvestmentsTransactionsGetResponse defines the response schema for `/investments/transactions/get`
public type InvestmentsTransactionsGetResponse record {
    # Metadata about the Item.
    Item item;
    # The accounts for which transaction history is being fetched.
    AccountBase[] accounts;
    # All securities for which there is a corresponding transaction being fetched.
    Security[] securities;
    # The transactions being fetched
    InvestmentTransaction[] investment_transactions;
    # The total number of transactions available within the date range specified. If `total_investment_transactions` is larger than the size of the `transactions` array, more transactions are available and can be fetched via manipulating the `offset` parameter.'
    int total_investment_transactions;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationRecipientListRequest defines the request schema for `/payment_initiation/recipient/list`
public type PaymentInitiationRecipientListRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
};

# Specifies the use case of the transfer.  Required for transfers on an ACH network.
# 
# `"arc"` - Accounts Receivable Entry
# 
# `"cbr`" - Cross Border Entry
# 
# `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
# 
# `"cie"` - Customer Initiated Entry
# 
# `"cor"` - Automated Notification of Change
# 
# `"ctx"` - Corporate Trade Exchange
# 
# `"iat"` - International
# 
# `"mte"` - Machine Transfer Entry
# 
# `"pbr"` - Cross Border Entry
# 
# `"pop"` - Point-of-Purchase Entry
# 
# `"pos"` - Point-of-Sale Entry
# 
# `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
# 
# `"rck"` - Re-presented Check Entry
# 
# `"tel"` - Telephone-Initiated Entry
# 
# `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
public type ACHClass string;

# Fired when an Item’s access consent is expiring in 7 days. Some Items have explicit expiration times and we try to relay this when possible to reduce service disruption. This can be resolved by having the user go through Link’s update mode.
public type PendingExpirationWebhook record {
    # `ITEM`
    string webhook_type;
    # `PENDING_EXPIRATION`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # The date and time at which the Item's access consent will expire, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format
    string consent_expiration_time;
};

# SandboxItemSetVerificationStatusResponse defines the response schema for `/sandbox/item/set_verification_status`
public type SandboxItemSetVerificationStatusResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# A credit card type account. Supported products for `credit` accounts are: Balance, Transactions, Identity, and Liabilities.
public type CreditAccount record {
    # Bank-issued credit card
    string 'credit\ card;
    # PayPal-issued credit card
    string paypal;
};

# Defines the response schema for `/bank_transfer/get`
public type BankTransferGetResponse record {
    # Represents a bank transfer within the Bank Transfers API.
    BankTransfer bank_transfer;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# TransactionsGetRequest defines the request schema for `/transactions/get`
public type TransactionsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # An optional object to be used with the request. If specified, `options` must not be `null`.
    TransactionsGetRequestOptions options?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The earliest date for which data should be returned. Dates should be formatted as YYYY-MM-DD.
    string start_date;
    # The latest date for which data should be returned. Dates should be formatted as YYYY-MM-DD.
    string end_date;
};

# Buying an investment
public type StandaloneInvestmentTransactionBuyType record {
    # Assignment of short option holding
    string assignment?;
    # Inflow of assets into a tax-advantaged account
    string contribution?;
    # Purchase to open or increase a position
    string buy?;
    # Purchase to close a short position
    string 'buy\ to\ cover?;
    # Purchase using proceeds from a cash dividend
    string 'dividend\ reinvestment?;
    # Purchase using proceeds from a cash interest payment
    string 'interest\ reinvestment?;
    # Purchase using long-term capital gain cash proceeds
    string 'long\-term\ capital\ gain\ reinvestment?;
    # Purchase using short-term capital gain cash proceeds
    string 'short\-term\ capital\ gain\ reinvestment?;
};

# Defines the request schema for `/sandbox/bank_transfer/fire_webhook`
public type SandboxBankTransferFireWebhookRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The URL to which the webhook should be sent.
    string webhook;
};

# DepositSwitchTokenCreateResponse defines the response schema for `/deposit_switch/token/create`
public type DepositSwitchTokenCreateResponse record {
    # Deposit switch token, used to initialize Link for the Deposit Switch product
    string deposit_switch_token;
    # Expiration time of the token, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format
    string deposit_switch_token_expiration_time;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The Plaid `access_token` for the account that will be debited or credited.
public type BankTransferAccessToken string;

# Defines the response schema for `/transfer/create`
public type TransferCreateResponse record {
    # Represents a transfer within the Transfers API.
    Transfer transfer;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Fired when an Item's initial transaction pull is completed. Once this webhook has been fired, transaction data for the most recent 30 days can be fetched for the Item.
public type InitialUpdateWebhook record {
    # `TRANSACTIONS`
    string webhook_type;
    # `INITIAL_UPDATE`
    string webhook_code;
    # The error code associated with the webhook.
    string? 'error?;
    # The number of new, unfetched transactions available.
    decimal new_transactions;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
};

# AssetReportRefreshResponse defines the response schema for `/asset_report/refresh`
public type AssetReportRefreshResponse record {
    # A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive.
    AssetReportId asset_report_id;
    # A token that can be provided to endpoints such as `/asset_report/get` or `/asset_report/pdf/get` to fetch or update an Asset Report.
    AssetReportToken asset_report_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# InstitutionsSearchResponse defines the response schema for `/institutions/search`
public type InstitutionsSearchResponse record {
    # An array of institutions matching the search criteria
    Institution[] institutions;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Specifies options for initializing Link for use with the Payment Initiation (Europe) product. This field is required if `payment_initiation` is included in the `products` array.
public type LinkTokenCreateRequestPaymentInitiation record {
    # The `payment_id` provided by the `/payment_initiation/payment/create` endpoint.
    @constraint:String {minLength: 1}
    string payment_id;
};

# The type of event that this bank transfer represents.
# 
# `pending`: A new transfer was created; it is in the pending state.
# 
# `cancelled`: The transfer was cancelled by the client.
# 
# `failed`: The transfer failed, no funds were moved.
# 
# `posted`: The transfer has been successfully submitted to the payment network.
# 
# `reversed`: A posted transfer was reversed.
# 
# `receiver_pending`: The matching transfer was found as a pending transaction in the receiver's account
# 
# `receiver_posted`: The matching transfer was found as a posted transaction in the receiver's account
public type BankTransferEventType string;

# Defines the response schema for `/bank_transfer/list`
public type BankTransferListResponse record {
    # An array of objects which represent a bank transfer within the Bank Transfers API.
    BankTransfer[] bank_transfers;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# PaymentInitiationPaymentTokenCreateRequest defines the request schema for `/payment_initiation/payment/token/create`
public type PaymentInitiationPaymentTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The `payment_id` returned from `/payment_initiation/payment/create`.
    @constraint:String {minLength: 1}
    string payment_id;
};

# AssetReportAuditCopyCreateResponse defines the response schema for `/asset_report/audit_copy/get`
public type AssetReportAuditCopyCreateResponse record {
    # A token that can be shared with a third party auditor to allow them to obtain access to the Asset Report. This token should be stored securely.
    string audit_copy_token;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Defines the request schema for `/transfer/create`
public type TransferCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # A random key provided by the client, per unique transfer. Maximum of 50 characters.
    # 
    # The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single transfer is created.
    TransferCreateIdempotencyKey idempotency_key;
    # The Plaid `access_token` for the account that will be debited or credited.
    TransferAccessToken access_token;
    # The Plaid `account_id` for the account that will be debited or credited.
    string account_id;
    # Plaid’s unique identifier for a transfer authorization.
    TransferAuthorizationID authorization_id;
    # The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
    TransferType 'type;
    # The network or rails used for the transfer. Valid options are `ach` or `same-day-ach`.
    TransferNetwork network;
    # The amount of the transfer (decimal string with two digits of precision e.g. “10.00”).
    TransferAmount amount;
    # The currency of the transfer amount – should be set to "USD".
    string iso_currency_code;
    # The transfer description. Maximum of 10 characters.
    @constraint:String {maxLength: 10}
    string description;
    # Specifies the use case of the transfer.  Required for transfers on an ACH network.
    # 
    # `"arc"` - Accounts Receivable Entry
    # 
    # `"cbr`" - Cross Border Entry
    # 
    # `"ccd"` - Corporate Credit or Debit - fund transfer between two corporate bank accounts
    # 
    # `"cie"` - Customer Initiated Entry
    # 
    # `"cor"` - Automated Notification of Change
    # 
    # `"ctx"` - Corporate Trade Exchange
    # 
    # `"iat"` - International
    # 
    # `"mte"` - Machine Transfer Entry
    # 
    # `"pbr"` - Cross Border Entry
    # 
    # `"pop"` - Point-of-Purchase Entry
    # 
    # `"pos"` - Point-of-Sale Entry
    # 
    # `"ppd"` - Prearranged Payment or Deposit - the transfer is part of a pre-existing relationship with a consumer, eg. bill payment
    # 
    # `"rck"` - Re-presented Check Entry
    # 
    # `"tel"` - Telephone-Initiated Entry
    # 
    # `"web"` - Internet-Initiated Entry - debits from a consumer’s account where their authorization is obtained over the Internet
    ACHClass ach_class?;
    # The legal name and other information for the account holder.
    TransferUserInRequest user;
    # An arbitrary string provided by the client for storage with the transfer. May be up to 100 characters.
    string? custom_tag?;
    # The Metadata object is a mapping of client-provided string fields to any string value. The following limitations apply:
    # - The JSON values must be Strings (no nested JSON objects allowed)
    # - Only ASCII characters may be used
    # - Maximum of 50 key/value pairs
    # - Maximum key length of 40 characters
    # - Maximum value length of 500 characters
    TransferMetadata? metadata?;
    # Plaid’s unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified.
    string? origination_account_id?;
};

# InvestmentsTransactionsGetRequest defines the request schema for `/investments/transactions/get`
public type InvestmentsTransactionsGetRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The access token associated with the Item data is being requested for.
    AccessToken access_token;
    # The earliest date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD.
    string start_date;
    # The most recent date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD.
    string end_date;
    # An optional object to filter `/investments/transactions/get` results. If provided, must be non-`null`.
    InvestmentsTransactionsGetRequestOptions options?;
};

# The `account_filters` specified in the original call to `/link/token/create`.
public type AccountFiltersResponse record {
    # A filter to apply to `depository`-type accounts
    DepositoryFilter depository?;
    # A filter to apply to `credit`-type accounts
    CreditFilter credit?;
    # A filter to apply to `loan`-type accounts
    LoanFilter loan?;
    # A filter to apply to `investment`-type accounts
    InvestmentFilter investment?;
};

# An investment account. Supported products for `investment` accounts are: Balance and Investments.
public type InvestmentAccountSubtype record {
    # Tax-advantaged college savings and prepaid tuition 529 plans (US)
    string '529;
    # Employer-sponsored money-purchase 401(a) retirement plan (US)
    string '401a;
    # Standard 401(k) retirement account (US)
    string '401k;
    # 403(b) retirement savings account for non-profits and schools (US)
    string '403b;
    # Tax-advantaged deferred-compensation 457(b) retirement plan for governments and non-profits (US)
    string '457b;
    # Standard brokerage account
    string brokerage;
    # Individual Savings Account (ISA) that pays interest tax-free (UK)
    string 'cash\ isa;
    # Tax-advantaged Coverdell Education Savings Account (ESA) (US)
    string 'education\ savings\ account;
    # Fixed annuity
    string 'fixed\ annuity;
    # Guaranteed Investment Certificate (Canada)
    string gic;
    # Tax-advantaged Health Reimbursement Arrangement (HRA) benefit plan (US)
    string 'health\ reimbursement\ arrangement;
    # Non-cash tax-advantaged medical Health Savings Account (HSA) (US)
    string hsa;
    # Traditional Invididual Retirement Account (IRA) (US)
    string ira;
    # Non-cash Individual Savings Account (ISA) (UK)
    string isa;
    # Keogh self-employed retirement plan (US)
    string keogh;
    # Life Income Fund (LIF) retirement account (Canada)
    string lif;
    # Life insurance account
    string 'life\ insurance;
    # Locked-in Retirement Account (LIRA) (Canada)
    string lira;
    # Locked-in Retirement Income Fund (LRIF) (Canada)
    string lrif;
    # Locked-in Retirement Savings Plan (Canada)
    string lrsp;
    # Mutual fund account
    string 'mutual\ fund;
    # A non-taxable brokerage account that is not covered by a more specific subtype
    string 'non\-taxable\ brokerage\ account;
    # An account whose type could not be determined
    string other;
    # An annuity account not covered by other subtypes
    string 'other\ annuity;
    # An insurance account not covered by other subtypes
    string 'other\ insurance;
    # Standard pension account
    string pension;
    # Prescribed Registered Retirement Income Fund (Canada)
    string prif;
    # Plan that gives employees share of company profits
    string 'profit\ sharing\ plan;
    # Qualifying share account
    string qshr;
    # Registered Disability Savings Plan (RSDP) (Canada)
    string rdsp;
    # Registered Education Savings Plan (Canada)
    string resp;
    # Retirement account not covered by other subtypes
    string retirement;
    # Restricted Life Income Fund (RLIF) (Canada)
    string rlif;
    # Roth IRA (US)
    string roth;
    # Employer-sponsored Roth 401(k) plan (US)
    string 'roth\ 401k;
    # Registered Retirement Income Fund (RRIF) (Canada)
    string rrif;
    # Registered Retirement Savings Plan (Canadian, similar to US 401(k))
    string rrsp;
    # Salary Reduction Simplified Employee Pension Plan (SARSEP), discontinued retirement plan (US)
    string sarsep;
    # Simplified Employee Pension IRA (SEP IRA), retirement plan for small businesses and self-employed (US)
    string 'sep\ ira;
    # Savings Incentive Match Plan for Employees IRA, retirement plan for small businesses (US)
    string 'simple\ ira;
    # Self-Invested Personal Pension (SIPP) (UK)
    string sipp;
    # Standard stock plan account
    string 'stock\ plan;
    # Tax-Free Savings Account (TFSA), a retirement plan similar to a Roth IRA (Canada)
    string tfsa;
    # Account representing funds or assets held by a trustee for the benefit of a beneficiary. Includes both revocable and irrevocable trusts.
    string trust;
    # 'Uniform Gift to Minors Act' (brokerage account for minors, US)
    string ugma;
    # 'Uniform Transfers to Minors Act' (brokerage account for minors, US)
    string utma;
    # Tax-deferred capital accumulation annuity contract
    string 'variable\ annuity?;
};

# Defines the request schema for `/transfer/event/sync`
public type TransferEventSyncRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The latest (largest) `event_id` fetched via the sync endpoint, or 0 initially.
    int after_id;
    # The maximum number of transfer events to return.
    int? count = 25;
};

# Information describing a transaction category
public type Category record {
    # An identifying number for the category. `category_id` is a Plaid-specific identifier and does not necessarily correspond to merchant category codes.
    string category_id;
    # `place` for physical transactions or `special` for other transactions such as bank charges.
    string group;
    # A hierarchical array of the categories to which this `category_id` belongs.
    string[] hierarchy;
};

# An optional object to filter `/liabilities/get` results. If provided, `options` cannot be null.
public type LiabilitiesGetRequestOptions record {
    # A list of accounts to retrieve for the Item.
    # 
    # An error will be returned if a provided `account_id` is not associated with the Item
    string[] account_ids?;
};

# ItemWebhookUpdateResponse defines the response schema for `/item/webhook/update`
public type ItemWebhookUpdateResponse record {
    # Metadata about the Item.
    Item item;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# The receiver details if the type of this event is `reciever_pending` or `reciever_posted`. Null value otherwise.
public type BankTransferReceiverDetails record {
    # The sign of the available balance for the receiver bank account associated with the receiver event at the time the matching transaction was found. Can be `positive`, `negative`, or null if the balance was not available at the time.
    string? available_balance;
};

# ProcessorAuthGetResponse defines the response schema for `/processor/auth/get`
public type ProcessorAuthGetResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
    # An object containing identifying numbers used for making electronic transfers to and from the `account`. The identifying number type (ACH, EFT, IBAN, or BACS) used will depend on the country of the account. An account may have more than one number type. If a particular identifying number type is not used by the `account` for which auth data has been requested, a null value will be returned.
    ProcessorNumber numbers;
    # A single account at a financial institution.
    AccountBase account;
};

# A random key provided by the client, per unique transfer. Maximum of 50 characters.
# 
# The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a transfer fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single transfer is created.
@constraint:String {maxLength: 50}
public type TransferCreateIdempotencyKey string;

# Defines the response schema for `/sandbox/transfer/simulate`
public type SandboxTransferSimulateResponse record {
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Fired when the Asset Report has been generated and `/asset_report/get` is ready to be called.  If you attempt to retrieve an Asset Report before this webhook has fired, you’ll receive a response with the HTTP status code 400 and a Plaid error code of `PRODUCT_NOT_READY`.
public type AssetsProductReadyWebhook record {
    # `ASSETS`
    string webhook_type;
    # `PRODUCT_READY`
    string webhook_code;
    # The `asset_report_id` that can be provided to `/asset_report/get` to retrieve the Asset Report.
    string asset_report_id;
};

# InstitutionsGetByIdResponse defines the response schema for `/institutions/get_by_id`
public type InstitutionsGetByIdResponse record {
    # Details relating to a specific financial institution
    Institution institution;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

public type SignalDecisionReportRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # Must be the same as the `client_transaction_id` supplied when calling `/signal/evaluate`
    string client_transaction_id;
    # `true` if the ACH transaction was initiated, `false` otherwise.
    boolean initiated;
};

# Specify the holdings on the account.
public type HoldingsOverride record {
    # The last price given by the institution for this security
    decimal institution_price;
    # The date at which `institution_price` was current. Must be formatted as an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) date.
    string institution_price_as_of?;
    # The average original value of the holding. Multiple cost basis values for the same security purchased at different prices are not supported.
    decimal cost_basis?;
    # The total quantity of the asset held, as reported by the financial institution.
    decimal quantity;
    # Either a valid `iso_currency_code` or `unofficial_currency_code`
    string currency;
    # Specify the security associated with the holding or investment transaction. When inputting custom security data to the Sandbox, Plaid will perform post-data-retrieval normalization and enrichment. These processes may cause the data returned by the Sandbox to be slightly different from the data you input. An ISO-4217 currency code and a security identifier (`ticker_symbol`, `cusip`, `isin`, or `sedol`) are required.
    SecurityOverride security;
};

# DepositSwitchTokenCreateRequest defines the request schema for `/deposit_switch/token/create`
public type DepositSwitchTokenCreateRequest record {
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    APIClientID client_id?;
    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    APISecret secret?;
    # The ID of the deposit switch
    string deposit_switch_id;
};

# Test username to use for the creation of the Sandbox Item. Default value is `user_good`.
public type SandboxOverrideUsername string?;

# ItemGetResponse defines the response schema for `/item/get` and `/item/webhook/update`
public type ItemGetResponse record {
    # Metadata about the Item.
    Item item;
    # An object with information about the status of the Item.
    ItemStatusNullable? status?;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# An optional object to filter `/processor/balance/get` results.
public type ProcessorBalanceGetRequestOptions record {
    # Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:mm:ssZ`) indicating the oldest acceptable balance when making a request to `/accounts/balance/get`.
    # 
    # If the balance that is pulled for `ins_128026` (Capital One) is older than the given timestamp, an `INVALID_REQUEST` error with the code of `LAST_UPDATED_DATETIME_OUT_OF_RANGE` will be returned with the most recent timestamp for the requested account contained in the response.
    # 
    # This field is only used when the institution is `ins_128026` (Capital One), in which case a value must be provided or an `INVALID_REQUEST` error with the code of `INVALID_FIELD` will be returned. For all other institutions, this field is ignored.
    MinLastUpdatedDatetime min_last_updated_datetime?;
};

# Add adress of the employer on the paystub.
public type PaystubAddress record {
    # The full city name.
    string? city?;
    # The listed street address.
    string? street?;
    # Street address line 1.
    string? line1?;
    # Street address line 2.
    string? line2?;
    # 5 digit postal code.
    string? postal_code?;
    # The region or state
    # Example: `"NC"`
    string? region?;
    # The region or state
    # Example: `"NC"`
    string? state_code?;
    # The country of the address.
    string? country?;
};

# The type of transfer. This will be either `debit` or `credit`.  A `debit` indicates a transfer of money into the origination account; a `credit` indicates a transfer of money out of the origination account.
public type TransferType string;

# The user's address.
public type DepositSwitchAddressData record {
    # The full city name
    string city;
    # The region or state
    # Example: `"NC"`
    string region;
    # The full street address
    # Example: `"564 Main Street, APT 15"`
    string street;
    # The postal code
    string postal_code;
    # The ISO 3166-1 alpha-2 country code
    string country;
};

# PaymentInitiationRecipientListResponse defines the response schema for `/payment_initiation/recipient/list`
public type PaymentInitiationRecipientListResponse record {
    # An array of payment recipients created for Payment Initiation
    PaymentInitiationRecipient[] recipients;
    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    RequestID request_id;
};

# Data about the components comprising an address.
public type AddressDataNullable record {
    *AddressData;
};

# The scopes object
public type Scopes record {
    # The product access being requested. Used to or disallow product access across all accounts. If unset, defaults to all products allowed.
    ProductAccess product_access?;
    # Allow or disallow product access by account. Unlisted (e.g. missing) accounts will be considered `new_accounts`
    AccountAccess[] accounts?;
    # Allow access to newly opened accounts as they are opened. If unset, defaults to `true`.
    boolean? new_accounts?;
};

# An object representing both the current pay period and year to date amount for a category.
public type Total record {
    # Commonly used term to describe the line item.
    string? canonical_description?;
    # Text of the line item as printed on the paystub.
    string? description?;
    # An object representing a monetary amount.
    Pay current_pay?;
    # An object representing a monetary amount.
    Pay ytd_pay?;
};

# Fired when an error is encountered with an Item. The error can be resolved by having the user go through Link’s update mode.
public type ItemErrorWebhook record {
    # `ITEM`
    string webhook_type;
    # `ERROR`
    string webhook_code;
    # The `item_id` of the Item associated with this webhook, warning, or error
    ItemId item_id;
    # We use standard HTTP response codes for success and failure notifications, and our errors are further classified by `error_type`. In general, 200 HTTP codes correspond to success, 40X codes are for developer- or user-related failures, and 50X codes are for Plaid-related issues.  Error fields will be `null` if no error has occurred.
    Error? 'error;
};

# An object with the deduction information found on a paystub.
public type Deductions record {
    # An array of objects representing both the current pay period and year to date amount for a category.
    Total[] subtotals?;
    # An array of objects representing both the current pay period and year to date amount for a category.
    Total[] totals?;
};

# By default, Link will provide limited account filtering: it will only display Institutions that are compatible with all products supplied in the `products` parameter of `/link/token/create`, and, if `auth` is specified in the `products` array, will also filter out accounts other than `checking` and `savings` accounts on the Account Select pane. You can further limit the accounts shown in Link by using `account_filters` to specify the account subtypes to be shown in Link. Only the specified subtypes will be shown. This filtering applies to both the Account Select view (if enabled) and the Institution Select view. Institutions that do not support the selected subtypes will be omitted from Link. To indicate that all subtypes should be shown, use the value `"all"`. If the `account_filters` filter is used, any account type for which a filter is not specified will be entirely omitted from Link. For a full list of valid types and subtypes, see the [Account schema](https://plaid.com/docs/api/accounts#accounts-schema).
# 
# For institutions using OAuth, the filter will not affect the list of accounts shown by the bank in the OAuth window.
public type LinkTokenAccountFilters record {
    # A filter to apply to `depository`-type accounts
    DepositoryFilter depository?;
    # A filter to apply to `credit`-type accounts
    CreditFilter credit?;
    # A filter to apply to `loan`-type accounts
    LoanFilter loan?;
    # A filter to apply to `investment`-type accounts
    InvestmentFilter investment?;
};
