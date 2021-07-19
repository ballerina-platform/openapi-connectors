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

public type AddressForOrganisation record {
    # define the type of address
    string AddressType?;
    # max length = 500
    string AddressLine1?;
    # max length = 500
    string AddressLine2?;
    # max length = 500
    string AddressLine3?;
    # max length = 500
    string AddressLine4?;
    # max length = 255
    string City?;
    # max length = 255
    string Region?;
    # max length = 50
    string PostalCode?;
    # max length = 50, [A-Z], [a-z] only
    string Country?;
    # max length = 255
    string AttentionTo?;
};

public type Account record {
    # Customer defined alpha numeric account code e.g 200 or SALES (max length = 10)
    string Code?;
    # Name of account (max length = 150)
    string Name?;
    # The Xero identifier for an account – specified as a string following  the endpoint name   e.g. /297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string AccountID?;
    # See Account Types
    string Type?;
    # For bank accounts only (Account Type BANK)
    string BankAccountNumber?;
    # Accounts with a status of ACTIVE can be updated to ARCHIVED. See Account Status Codes
    string Status?;
    # Description of the Account. Valid for all types of accounts except bank accounts (max length = 4000)
    string Description?;
    # For bank accounts only. See Bank Account types
    string BankAccountType?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # The tax type from TaxRates
    string TaxType?;
    # Boolean – describes whether account can have payments applied to it
    boolean EnablePaymentsToAccount?;
    # Boolean – describes whether account code is available for use with expense claims
    boolean ShowInExpenseClaims?;
    # See Account Class Types
    string Class?;
    # If this is a system account then this element is returned. See System Account types. Note that non-system accounts may have this element set as either “” or null.
    string SystemAccount?;
    # Shown if set
    string ReportingCode?;
    # Shown if set
    string ReportingCodeName?;
    # boolean to indicate if an account has an attachment (read only)
    boolean HasAttachments?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # Boolean – describes whether the account is shown in the watchlist widget on the dashboard
    boolean AddToWatchlist?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type Invoice record {
    # See Invoice Types
    string Type?;
    Contact Contact?;
    # See LineItems
    LineItem[] LineItems?;
    # Date invoice was issued – YYYY-MM-DD. If the Date element is not specified it will default to the current date based on the timezone setting of the organisation
    string Date?;
    # Date invoice is due – YYYY-MM-DD
    string DueDate?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # ACCREC – Unique alpha numeric code identifying invoice (when missing will auto-generate from your Organisation Invoice Settings) (max length = 255)
    string InvoiceNumber?;
    # ACCREC only – additional reference number
    string Reference?;
    # See BrandingThemes
    string BrandingThemeID?;
    # URL link to a source document – shown as “Go to [appName]” in the Xero app
    string Url?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # The currency rate for a multicurrency invoice. If no rate is specified, the XE.com day rate is used. (max length = [18].[6])
    float CurrencyRate?;
    # See Invoice Status Codes
    string Status?;
    # Boolean to set whether the invoice in the Xero app should be marked as “sent”. This can be set only on invoices that have been approved
    boolean SentToContact?;
    # Shown on sales invoices (Accounts Receivable) when this has been set
    string ExpectedPaymentDate?;
    # Shown on bills (Accounts Payable) when this has been set
    string PlannedPaymentDate?;
    # CIS deduction for UK contractors
    float CISDeduction?;
    # CIS Deduction rate for the organisation
    float CISRate?;
    # Total of invoice excluding taxes
    float SubTotal?;
    # Total tax on invoice
    float TotalTax?;
    # Total of Invoice tax inclusive (i.e. SubTotal + TotalTax). This will be ignored if it doesn’t equal the sum of the LineAmounts
    float Total?;
    # Total of discounts applied on the invoice line items
    float TotalDiscount?;
    # Xero generated unique identifier for invoice
    string InvoiceID?;
    # Xero generated unique identifier for repeating invoices
    string RepeatingInvoiceID?;
    # boolean to indicate if an invoice has an attachment
    boolean HasAttachments?;
    # boolean to indicate if an invoice has a discount
    boolean IsDiscounted?;
    # See Payments
    Payment[] Payments?;
    # See Prepayments
    Prepayment[] Prepayments?;
    # See Overpayments
    Overpayment[] Overpayments?;
    # Amount remaining to be paid on invoice
    float AmountDue?;
    # Sum of payments received for invoice
    float AmountPaid?;
    # The date the invoice was fully paid. Only returned on fully paid invoices
    string FullyPaidOnDate?;
    # Sum of all credit notes, over-payments and pre-payments applied to invoice
    float AmountCredited?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # Details of credit notes that have been applied to an invoice
    CreditNote[] CreditNotes?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
    # A boolean to indicate if a invoice has an validation errors
    boolean HasErrors?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
    # Displays array of warning messages from the API
    ValidationError[] Warnings?;
};

public type Address record {
    # define the type of address
    string AddressType?;
    # max length = 500
    string AddressLine1?;
    # max length = 500
    string AddressLine2?;
    # max length = 500
    string AddressLine3?;
    # max length = 500
    string AddressLine4?;
    # max length = 255
    string City?;
    # max length = 255
    string Region?;
    # max length = 50
    string PostalCode?;
    # max length = 50, [A-Z], [a-z] only
    string Country?;
    # max length = 255
    string AttentionTo?;
};

public type RepeatingInvoices record {
    RepeatingInvoice[] RepeatingInvoices?;
};

public type Payments record {
    Payment[] Payments?;
};

public type Users record {
    User[] Users?;
};

public type ContactPerson record {
    # First name of person
    string FirstName?;
    # Last name of person
    string LastName?;
    # Email address of person
    string EmailAddress?;
    # boolean to indicate whether contact should be included on emails with invoices etc.
    boolean IncludeInEmails?;
};

# A summary of the accounts changes
public type ImportSummaryAccounts record {
    # The total number of accounts in the org
    int Total?;
    # The number of new accounts created
    int New?;
    # The number of accounts updated
    int Updated?;
    # The number of accounts deleted
    int Deleted?;
    # The number of locked accounts
    int Locked?;
    # The number of system accounts
    int System?;
    # The number of accounts that had an error
    int Errored?;
    # The availability of accounts
    boolean Present?;
    # The number of new or updated accounts
    int NewOrUpdated?;
};

# 3 letter alpha code for the currency – see list of currency codes
#
public type CurrencyCode string;

public type Item record {
    # User defined item code (max length = 30)
    string Code;
    # The inventory asset account for the item. The account must be of type INVENTORY. The  COGSAccountCode in PurchaseDetails is also required to create a tracked item
    string InventoryAssetAccountCode?;
    # The name of the item (max length = 50)
    string Name?;
    # Boolean value, defaults to true. When IsSold is true the item will be available on sales transactions in the Xero UI. If IsSold is updated to false then Description and SalesDetails values will be nulled.
    boolean IsSold?;
    # Boolean value, defaults to true. When IsPurchased is true the item is available for purchase transactions in the Xero UI. If IsPurchased is updated to false then PurchaseDescription and PurchaseDetails values will be nulled.
    boolean IsPurchased?;
    # The sales description of the item (max length = 4000)
    string Description?;
    # The purchase description of the item (max length = 4000)
    string PurchaseDescription?;
    Purchase PurchaseDetails?;
    Purchase SalesDetails?;
    # True for items that are tracked as inventory. An item will be tracked as inventory if the InventoryAssetAccountCode and COGSAccountCode are set.
    boolean IsTrackedAsInventory?;
    # The value of the item on hand. Calculated using average cost accounting.
    float TotalCostPool?;
    # The quantity of the item on hand
    float QuantityOnHand?;
    # Last modified date in UTC format
    string UpdatedDateUTC?;
    # The Xero identifier for an Item
    string ItemID?;
    # Status of object
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type SalesTrackingCategory record {
    # The default sales tracking category name for contacts
    string TrackingCategoryName?;
    # The default purchase tracking category name for contacts
    string TrackingOptionName?;
};

public type CISOrgSettings record {
    CISOrgSetting[] CISSettings?;
};

# Balance supplied for each account that has a value as at the conversion date.
public type ConversionBalances record {
    # The account code for a account
    string AccountCode?;
    # The opening balances of the account. Debits are positive, credits are negative values
    float Balance?;
    # An array to specify multiple currency balances of an account
    BalanceDetails[] BalanceDetails?;
};

public type Organisations record {
    Organisation[] Organisations?;
};

public type RequestEmpty record {
    # Need at least one field to create an empty JSON payload
    string Status?;
};

public type Currency record {
    # 3 letter alpha code for the currency – see list of currency codes
    string Code?;
    # Name of Currency
    string Description?;
};

public type TrackingOption record {
    # The Xero identifier for a tracking option e.g. ae777a87-5ef3-4fa0-a4f0-d10e1f13073a
    string TrackingOptionID?;
    # The name of the tracking option e.g. Marketing, East (max length = 100)
    string Name?;
    # The status of a tracking option
    string Status?;
    # Filter by a tracking category e.g. 297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string TrackingCategoryID?;
};

public type ValidationError record {
    # Validation error message
    string Message?;
};

public type Budgets record {
    Budget[] Budgets?;
};

public type ContactGroups record {
    ContactGroup[] ContactGroups?;
};

public type HistoryRecords record {
    HistoryRecord[] HistoryRecords?;
};

public type Actions record {
    Action[] Actions?;
};

public type Prepayments record {
    Prepayment[] Prepayments?;
};

# The raw AccountsReceivable(sales invoices) and AccountsPayable(bills) outstanding and overdue amounts, not converted to base currency (read only)
public type Balances record {
    # The balance of money for goods or services delivered or used but not yet paid for by customers.
    AccountsReceivable AccountsReceivable?;
    # The amounts for goods or services received that have not yet been paid for.
    AccountsPayable AccountsPayable?;
};

public type ReportWithRows record {
    ReportWithRow[] Reports?;
};

# Timezone specifications
#
public type TimeZone string;

public type Employee record {
    # The Xero identifier for an employee e.g. 297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string EmployeeID?;
    # Current status of an employee – see contact status types
    string Status?;
    # First name of an employee (max length = 255)
    string FirstName?;
    # Last name of an employee (max length = 255)
    string LastName?;
    ExternalLink ExternalLink?;
    string UpdatedDateUTC?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type ReportWithRow record {
    # ID of the Report
    string ReportID?;
    # Name of the report
    string ReportName?;
    # Title of the report
    string ReportTitle?;
    # The type of report (BalanceSheet,ProfitLoss, etc)
    string ReportType?;
    # Report titles array (3 to 4 strings with the report name, orgnisation name and time frame of report)
    string[] ReportTitles?;
    # Date of report
    string ReportDate?;
    ReportRows[] Rows?;
    # Updated Date
    string UpdatedDateUTC?;
    ReportFields[] Fields?;
};

public type CISOrgSetting record {
    # true or false - Boolean that describes if the organisation is a CIS Contractor
    boolean CISContractorEnabled?;
    # true or false - Boolean that describes if the organisation is a CIS SubContractor
    boolean CISSubContractorEnabled?;
    # CIS Deduction rate for the organisation
    float Rate?;
};

public type Journals record {
    Journal[] Journals?;
};

public type Bill record {
    # Day of Month (0-31)
    int Day?;
    PaymentTermType Type?;
};

public type Overpayments record {
    Overpayment[] Overpayments?;
};

public type ReportCell record {
    string Value?;
    ReportAttribute[] Attributes?;
};

# The date when the organisation starts using Xero
public type ConversionDate record {
    # The month the organisation starts using Xero. Value is an integer between 1 and 12
    int Month?;
    # The year the organisation starts using Xero. Value is an integer greater than 2006
    int Year?;
};

public type ExpenseClaim record {
    # Xero generated unique identifier for an expense claim
    string ExpenseClaimID?;
    # Current status of an expense claim – see status types
    string Status?;
    # See Payments
    Payment[] Payments?;
    User User?;
    Receipt[] Receipts?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # The total of an expense claim being paid
    float Total?;
    # The amount due to be paid for an expense claim
    float AmountDue?;
    # The amount still to pay for an expense claim
    float AmountPaid?;
    # The date when the expense claim is due to be paid YYYY-MM-DD
    string PaymentDueDate?;
    # The date the expense claim will be reported in Xero YYYY-MM-DD
    string ReportingDate?;
    # The Xero identifier for the Receipt e.g. e59a2c7f-1306-4078-a0f3-73537afcbba9
    string ReceiptID?;
};

public type BrandingThemes record {
    BrandingTheme[] BrandingThemes?;
};

# A summary of the organization changes
public type ImportSummaryOrganisation record {
    # A summary of the organization changes at present
    boolean Present?;
};

public type Quotes record {
    Quote[] Quotes?;
};

public type CreditNotes record {
    CreditNote[] CreditNotes?;
};

public type PaymentDelete record {
    # The status of the payment.
    string Status;
};

public type BudgetLine record {
    # See Accounts
    string AccountID?;
    # See Accounts
    string AccountCode?;
    BudgetBalance[] BudgetBalances?;
};

public type BudgetBalance record {
    # Period the amount applies to (e.g. “2019-08”)
    string Period?;
    # LineItem Quantity
    int Amount?;
    # Budgeted amount
    int UnitAmount?;
    # Any footnotes associated with this balance
    string Notes?;
};

public type TrackingOptions record {
    TrackingOption[] Options?;
};

public type BatchPayments record {
    BatchPayment[] BatchPayments?;
};

public type Budget record {
    # Xero identifier
    string BudgetID?;
    # Type of Budget. OVERALL or TRACKING
    string Type?;
    # The Budget description
    string Description?;
    # UTC timestamp of last update to budget
    string UpdatedDateUTC?;
    BudgetLine[] BudgetLines?;
    TrackingCategory[] Tracking?;
};

public type LineItemTracking record {
    # The Xero identifier for a tracking category
    string TrackingCategoryID?;
    # The Xero identifier for a tracking category option
    string TrackingOptionID?;
    # The name of the tracking category
    string Name?;
    # See Tracking Options
    string Option?;
};

public type Overpayment record {
    # See Overpayment Types
    string Type?;
    Contact Contact?;
    # The date the overpayment is created YYYY-MM-DD
    string Date?;
    # See Overpayment Status Codes
    string Status?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # See Overpayment Line Items
    LineItem[] LineItems?;
    # The subtotal of the overpayment excluding taxes
    float SubTotal?;
    # The total tax on the overpayment
    float TotalTax?;
    # The total of the overpayment (subtotal + total tax)
    float Total?;
    # UTC timestamp of last update to the overpayment
    string UpdatedDateUTC?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # Xero generated unique identifier
    string OverpaymentID?;
    # The currency rate for a multicurrency overpayment. If no rate is specified, the XE.com day rate is used
    float CurrencyRate?;
    # The remaining credit balance on the overpayment
    float RemainingCredit?;
    # See Allocations
    Allocation[] Allocations?;
    # The amount of applied to an invoice
    float AppliedAmount?;
    # See Payments
    Payment[] Payments?;
    # boolean to indicate if a overpayment has an attachment
    boolean HasAttachments?;
    # See Attachments
    Attachment[] Attachments?;
};

public type TaxRates record {
    TaxRate[] TaxRates?;
};

public type PaymentServices record {
    PaymentService[] PaymentServices?;
};

# Bank details for use on a batch payment stored with each contact
public type BatchPaymentDetails record {
    # Bank account number for use with Batch Payments
    string BankAccountNumber?;
    # Name of bank for use with Batch Payments
    string BankAccountName?;
    # (Non-NZ Only) These details are sent to the org’s bank as a reference for the batch payment transaction. They will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement imported into Xero. Maximum field length = 18
    string Details?;
    # (NZ Only) Optional references for the batch payment transaction. It will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement you import into Xero.
    string Code?;
    # (NZ Only) Optional references for the batch payment transaction. It will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement you import into Xero.
    string Reference?;
};

public type ManualJournal record {
    # Description of journal being posted
    string Narration;
    # See JournalLines
    ManualJournalLine[] JournalLines?;
    # Date journal was posted – YYYY-MM-DD
    string Date?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # See Manual Journal Status Codes
    string Status?;
    # Url link to a source document – shown as “Go to [appName]” in the Xero app
    string Url?;
    # Boolean – default is true if not specified
    boolean ShowOnCashBasisReports?;
    # Boolean to indicate if a manual journal has an attachment
    boolean HasAttachments?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # The Xero identifier for a Manual Journal
    string ManualJournalID?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of warning messages from the API
    ValidationError[] Warnings?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
};

public type Currencies record {
    Currency[] Currencies?;
};

# Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
#
public type LineAmountTypes string;

public type Contacts record {
    Contact[] Contacts?;
};

public type ExpenseClaims record {
    ExpenseClaim[] ExpenseClaims?;
};

public type PurchaseOrder record {
    Contact Contact?;
    # See LineItems
    LineItem[] LineItems?;
    # Date purchase order was issued – YYYY-MM-DD. If the Date element is not specified then it will default to the current date based on the timezone setting of the organisation
    string Date?;
    # Date the goods are to be delivered – YYYY-MM-DD
    string DeliveryDate?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # Unique alpha numeric code identifying purchase order (when missing will auto-generate from your Organisation Invoice Settings)
    string PurchaseOrderNumber?;
    # Additional reference number
    string Reference?;
    # See BrandingThemes
    string BrandingThemeID?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # See Purchase Order Status Codes
    string Status?;
    # Boolean to set whether the purchase order should be marked as “sent”. This can be set only on purchase orders that have been approved or billed
    boolean SentToContact?;
    # The address the goods are to be delivered to
    string DeliveryAddress?;
    # The person that the delivery is going to
    string AttentionTo?;
    # The phone number for the person accepting the delivery
    string Telephone?;
    # A free text feild for instructions (500 characters max)
    string DeliveryInstructions?;
    # The date the goods are expected to arrive.
    string ExpectedArrivalDate?;
    # Xero generated unique identifier for purchase order
    string PurchaseOrderID?;
    # The currency rate for a multicurrency purchase order. If no rate is specified, the XE.com day rate is used.
    float CurrencyRate?;
    # Total of purchase order excluding taxes
    float SubTotal?;
    # Total tax on purchase order
    float TotalTax?;
    # Total of Purchase Order tax inclusive (i.e. SubTotal + TotalTax)
    float Total?;
    # Total of discounts applied on the purchase order line items
    float TotalDiscount?;
    # boolean to indicate if a purchase order has an attachment
    boolean HasAttachments?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
    # Displays array of warning messages from the API
    ValidationError[] Warnings?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
};

public type Prepayment record {
    # See Prepayment Types
    string Type?;
    Contact Contact?;
    # The date the prepayment is created YYYY-MM-DD
    string Date?;
    # See Prepayment Status Codes
    string Status?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # See Prepayment Line Items
    LineItem[] LineItems?;
    # The subtotal of the prepayment excluding taxes
    float SubTotal?;
    # The total tax on the prepayment
    float TotalTax?;
    # The total of the prepayment(subtotal + total tax)
    float Total?;
    # Returns Invoice number field. Reference field isn't available.
    string Reference?;
    # UTC timestamp of last update to the prepayment
    string UpdatedDateUTC?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # Xero generated unique identifier
    string PrepaymentID?;
    # The currency rate for a multicurrency prepayment. If no rate is specified, the XE.com day rate is used
    float CurrencyRate?;
    # The remaining credit balance on the prepayment
    float RemainingCredit?;
    # See Allocations
    Allocation[] Allocations?;
    # See Payments
    Payment[] Payments?;
    # The amount of applied to an invoice
    float AppliedAmount?;
    # boolean to indicate if a prepayment has an attachment
    boolean HasAttachments?;
    # See Attachments
    Attachment[] Attachments?;
};

public type Accounts record {
    Account[] Accounts?;
};

public type LinkedTransactions record {
    LinkedTransaction[] LinkedTransactions?;
};

public type ReportRow record {
    RowType RowType?;
    string Title?;
    ReportCell[] Cells?;
};

public type CreditNote record {
    # See Credit Note Types
    string Type?;
    Contact Contact?;
    # The date the credit note is issued YYYY-MM-DD. If the Date element is not specified then it will default to the current date based on the timezone setting of the organisation
    string Date?;
    # Date invoice is due – YYYY-MM-DD
    string DueDate?;
    # See Credit Note Status Codes
    string Status?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # See Invoice Line Items
    LineItem[] LineItems?;
    # The subtotal of the credit note excluding taxes
    float SubTotal?;
    # The total tax on the credit note
    float TotalTax?;
    # The total of the Credit Note(subtotal + total tax)
    float Total?;
    # CIS deduction for UK contractors
    float CISDeduction?;
    # CIS Deduction rate for the organisation
    float CISRate?;
    # UTC timestamp of last update to the credit note
    string UpdatedDateUTC?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # Date when credit note was fully paid(UTC format)
    string FullyPaidOnDate?;
    # Xero generated unique identifier
    string CreditNoteID?;
    # ACCRECCREDIT – Unique alpha numeric code identifying credit note (when missing will auto-generate from your Organisation Invoice Settings)
    string CreditNoteNumber?;
    # ACCRECCREDIT only – additional reference number
    string Reference?;
    # boolean to indicate if a credit note has been sent to a contact via  the Xero app (currently read only)
    boolean SentToContact?;
    # The currency rate for a multicurrency invoice. If no rate is specified, the XE.com day rate is used
    float CurrencyRate?;
    # The remaining credit balance on the Credit Note
    float RemainingCredit?;
    # See Allocations
    Allocation[] Allocations?;
    # The amount of applied to an invoice
    float AppliedAmount?;
    # See Payments
    Payment[] Payments?;
    # See BrandingThemes
    string BrandingThemeID?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # boolean to indicate if a credit note has an attachment
    boolean HasAttachments?;
    # A boolean to indicate if a credit note has an validation errors
    boolean HasErrors?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
    # Displays array of warning messages from the API
    ValidationError[] Warnings?;
};

public type Attachment record {
    # Unique ID for the file
    string AttachmentID?;
    # Name of the file
    string FileName?;
    # URL to the file on xero.com
    string Url?;
    # Type of file
    string MimeType?;
    # Length of the file content
    int ContentLength?;
    # Include the file with the online invoice
    boolean IncludeOnline?;
};

public type Journal record {
    # Xero identifier
    string JournalID?;
    # Date the journal was posted
    string JournalDate?;
    # Xero generated journal number
    int JournalNumber?;
    # Created date UTC format
    string CreatedDateUTC?;
    # reference field for additional indetifying information
    string Reference?;
    # The identifier for the source transaction (e.g. InvoiceID)
    string SourceID?;
    # The journal source type. The type of transaction that created the journal
    string SourceType?;
    # See JournalLines
    JournalLine[] JournalLines?;
};

public type BatchPayment record {
    Account Account?;
    # (NZ Only) Optional references for the batch payment transaction. It will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement you import into Xero.
    string Reference?;
    # (NZ Only) Optional references for the batch payment transaction. It will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement you import into Xero.
    string Particulars?;
    # (NZ Only) Optional references for the batch payment transaction. It will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement you import into Xero.
    string Code?;
    # (Non-NZ Only) These details are sent to the org’s bank as a reference for the batch payment transaction. They will also show with the batch payment transaction in the bank reconciliation Find & Match screen. Depending on your individual bank, the detail may also show on the bank statement imported into Xero. Maximum field length = 18
    string Details?;
    # (UK Only) Only shows on the statement line in Xero. Max length =18
    string Narrative?;
    # The Xero generated unique identifier for the bank transaction (read-only)
    string BatchPaymentID?;
    # Date the payment is being made (YYYY-MM-DD) e.g. 2009-09-06
    string DateString?;
    # Date the payment is being made (YYYY-MM-DD) e.g. 2009-09-06
    string Date?;
    # The amount of the payment. Must be less than or equal to the outstanding amount owing on the invoice e.g. 200.00
    float Amount?;
    # An array of payments
    Payment[] Payments?;
    # PAYBATCH for bill payments or RECBATCH for sales invoice payments (read-only)
    string Type?;
    # AUTHORISED or DELETED (read-only). New batch payments will have a status of AUTHORISED. It is not possible to delete batch payments via the API.
    string Status?;
    # The total of the payments that make up the batch (read-only)
    string TotalAmount?;
    # UTC timestamp of last update to the payment
    string UpdatedDateUTC?;
    # Booelan that tells you if the batch payment has been reconciled (read-only)
    string IsReconciled?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

# Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
#
public type QuoteLineAmountTypes string;

# The status of the quote.
#
public type QuoteStatusCodes string;

public type OnlineInvoice record {
    # the URL to an online invoice
    string OnlineInvoiceUrl?;
};

public type Items record {
    Item[] Items?;
};

public type Setup record {
    # The date when the organisation starts using Xero
    ConversionDate ConversionDate?;
    # Balance supplied for each account that has a value as at the conversion date.
    ConversionBalances[] ConversionBalances?;
    Account[] Accounts?;
};

public type OnlineInvoices record {
    OnlineInvoice[] OnlineInvoices?;
};

public type JournalLine record {
    # Xero identifier for Journal
    string JournalLineID?;
    # See Accounts
    string AccountID?;
    # See Accounts
    string AccountCode?;
    # See Account Types
    string AccountType?;
    # See AccountCodes
    string AccountName?;
    # The description from the source transaction line item. Only returned if populated.
    string Description?;
    # Net amount of journal line. This will be a positive value for a debit and negative for a credit
    float NetAmount?;
    # Gross amount of journal line (NetAmount + TaxAmount).
    float GrossAmount?;
    # Total tax on a journal line
    float TaxAmount?;
    # The tax type from TaxRates
    string TaxType?;
    # see TaxRates
    string TaxName?;
    # Optional Tracking Category – see Tracking. Any JournalLine can have a maximum of 2 <TrackingCategory> elements.
    TrackingCategory[] TrackingCategories?;
};

public type ReportRows record {
    RowType RowType?;
    string Title?;
    ReportCell[] Cells?;
    ReportRow[] Rows?;
};

public type Receipt record {
    # Date of receipt – YYYY-MM-DD
    string Date?;
    Contact Contact?;
    LineItem[] LineItems?;
    User User?;
    # Additional reference number
    string Reference?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # Total of receipt excluding taxes
    float SubTotal?;
    # Total tax on receipt
    float TotalTax?;
    # Total of receipt tax inclusive (i.e. SubTotal + TotalTax)
    float Total?;
    # Xero generated unique identifier for receipt
    string ReceiptID?;
    # Current status of receipt – see status types
    string Status?;
    # Xero generated sequence number for receipt in current claim for a given user
    string ReceiptNumber?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # boolean to indicate if a receipt has an attachment
    boolean HasAttachments?;
    # URL link to a source document – shown as “Go to [appName]” in the Xero app
    string Url?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
    # Displays array of warning messages from the API
    ValidationError[] Warnings?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
};

public type PurchaseOrders record {
    PurchaseOrder[] PurchaseOrders?;
};

# The amounts for goods or services received that have not yet been paid for.
public type AccountsPayable record {
    # total amount that should be given to other organization but not yet given
    float Outstanding?;
    # KPI that indicates payments that are yet to be given by the organization.
    float Overdue?;
};

public type ManualJournalLine record {
    # total for line. Debits are positive, credits are negative value
    float LineAmount?;
    # See Accounts
    string AccountCode?;
    # See Accounts
    string AccountID?;
    # Description for journal line
    string Description?;
    # The tax type from TaxRates
    string TaxType?;
    # Optional Tracking Category – see Tracking. Any JournalLine can have a maximum of 2 <TrackingCategory> elements.
    TrackingCategory[] Tracking?;
    # The calculated tax amount based on the TaxType and LineAmount
    float TaxAmount?;
    # is the line blank
    boolean IsBlank?;
};

public type CISSettings record {
    CISSetting[] CISSettings?;
};

public type PaymentTermType string;

public type ExternalLink record {
    # See External link types
    string LinkType?;
    # URL for service e.g. http://twitter.com/xeroapi
    string Url?;
    string Description?;
};

# See Tax Types – can only be used on update calls
#
public type TaxType string;

public type Payment record {
    Invoice Invoice?;
    CreditNote CreditNote?;
    Prepayment Prepayment?;
    Overpayment Overpayment?;
    # Number of invoice or credit note you are applying payment to e.g.INV-4003
    string InvoiceNumber?;
    # Number of invoice or credit note you are applying payment to e.g. INV-4003
    string CreditNoteNumber?;
    Account Account?;
    # Code of account you are using to make the payment e.g. 001 (note- not all accounts have a code value)
    string Code?;
    # Date the payment is being made (YYYY-MM-DD) e.g. 2009-09-06
    string Date?;
    # Exchange rate when payment is received. Only used for non base currency invoices and credit notes e.g. 0.7500
    float CurrencyRate?;
    # The amount of the payment. Must be less than or equal to the outstanding amount owing on the invoice e.g. 200.00
    float Amount?;
    # An optional description for the payment e.g. Direct Debit
    string Reference?;
    # An optional parameter for the payment. A boolean indicating whether you would like the payment to be created as reconciled when using PUT, or whether a payment has been reconciled when using GET
    boolean IsReconciled?;
    # The status of the payment.
    string Status?;
    # See Payment Types.
    string PaymentType?;
    # UTC timestamp of last update to the payment
    string UpdatedDateUTC?;
    # The Xero identifier for an Payment e.g. 297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string PaymentID?;
    # Present if the payment was created as part of a batch.
    string BatchPaymentID?;
    # The suppliers bank account number the payment is being made to
    string BankAccountNumber?;
    # The suppliers bank account number the payment is being made to
    string Particulars?;
    # The information to appear on the supplier's bank account
    string Details?;
    # A boolean to indicate if a contact has an validation errors
    boolean HasAccount?;
    # A boolean to indicate if a contact has an validation errors
    boolean HasValidationErrors?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type CISSetting record {
    # Boolean that describes if the contact is a CIS Subcontractor
    boolean CISEnabled?;
    # CIS Deduction rate for the contact if he is a subcontractor. If the contact is not CISEnabled, then the rate is not returned
    float Rate?;
};

public type BankTransfer record {
    Account FromBankAccount;
    Account ToBankAccount;
    # amount of the transaction
    float Amount;
    # The date of the Transfer YYYY-MM-DD
    string Date?;
    # The identifier of the Bank Transfer
    string BankTransferID?;
    # The currency rate
    float CurrencyRate?;
    # The Bank Transaction ID for the source account
    string FromBankTransactionID?;
    # The Bank Transaction ID for the destination account
    string ToBankTransactionID?;
    # Boolean to indicate if a Bank Transfer has an attachment
    boolean HasAttachments?;
    # UTC timestamp of creation date of bank transfer
    string CreatedDateUTC?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

# The balance of money for goods or services delivered or used but not yet paid for by customers.
public type AccountsReceivable record {
    # Total amount currently owed or promised to the organization but not yet received.
    float Outstanding?;
    # KPI that indicates payments that are yet to be received by the organization.
    float Overdue?;
};

public type LinkedTransaction record {
    # Filter by the SourceTransactionID. Get all the linked transactions created from a particular ACCPAY invoice
    string SourceTransactionID?;
    # The line item identifier from the source transaction.
    string SourceLineItemID?;
    # Filter by the combination of ContactID and Status. Get all the linked transactions that have been assigned to a particular customer and have a particular status e.g. GET /LinkedTransactions?ContactID=4bb34b03-3378-4bb2-a0ed-6345abf3224e&Status=APPROVED.
    string ContactID?;
    # Filter by the TargetTransactionID. Get all the linked transactions  allocated to a particular ACCREC invoice
    string TargetTransactionID?;
    # The line item identifier from the target transaction. It is possible  to link multiple billable expenses to the same TargetLineItemID.
    string TargetLineItemID?;
    # The Xero identifier for an Linked Transaction e.g./LinkedTransactions/297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string LinkedTransactionID?;
    # Filter by the combination of ContactID and Status. Get all the linked transactions that have been assigned to a particular customer and have a particular status e.g. GET /LinkedTransactions?ContactID=4bb34b03-3378-4bb2-a0ed-6345abf3224e&Status=APPROVED.
    string Status?;
    # This will always be BILLABLEEXPENSE. More types may be added in future.
    string Type?;
    # The last modified date in UTC format
    string UpdatedDateUTC?;
    # The Type of the source tranasction. This will be ACCPAY if the linked transaction was created from an invoice and SPEND if it was created from a bank transaction.
    string SourceTransactionTypeCode?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

# An array to specify multiple currency balances of an account
public type BalanceDetails record {
    # The opening balances of the account. Debits are positive, credits are negative values
    float Balance?;
    # The currency of the balance (Not required for base currency)
    string CurrencyCode?;
    # (Optional) Exchange rate to base currency when money is spent or received. If not specified, XE rate for the day is applied
    float CurrencyRate?;
};

public type TrackingCategory record {
    # The Xero identifier for a tracking category e.g. 297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string TrackingCategoryID?;
    # The Xero identifier for a tracking option e.g. dc54c220-0140-495a-b925-3246adc0075f
    string TrackingOptionID?;
    # The name of the tracking category e.g. Department, Region (max length = 100)
    string Name?;
    # The option name of the tracking option e.g. East, West (max length = 100)
    string Option?;
    # The status of a tracking category
    string Status?;
    # See Tracking Options
    TrackingOption[] Options?;
};

public type BankTransactions record {
    BankTransaction[] BankTransactions?;
};

public type Allocations record {
    Allocation[] Allocations?;
};

public type Action record {
    # Name of the actions for this organisation
    string Name?;
    # Status of the action for this organisation
    string Status?;
};

public type User record {
    # Xero identifier
    string UserID?;
    # Email address of user
    string EmailAddress?;
    # First name of user
    string FirstName?;
    # Last name of user
    string LastName?;
    # Timestamp of last change to user
    string UpdatedDateUTC?;
    # Boolean to indicate if user is the subscriber
    boolean IsSubscriber?;
    # User role that defines permissions in Xero and via API (READONLY, INVOICEONLY, STANDARD, FINANCIALADVISER, etc)
    string OrganisationRole?;
};

public type RepeatingInvoice record {
    # See Invoice Types
    string Type?;
    Contact Contact?;
    Schedule Schedule?;
    # See LineItems
    LineItem[] LineItems?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # ACCREC only – additional reference number
    string Reference?;
    # See BrandingThemes
    string BrandingThemeID?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # One of the following - DRAFT or AUTHORISED – See Invoice Status Codes
    string Status?;
    # Total of invoice excluding taxes
    float SubTotal?;
    # Total tax on invoice
    float TotalTax?;
    # Total of Invoice tax inclusive (i.e. SubTotal + TotalTax)
    float Total?;
    # Xero generated unique identifier for repeating invoice template
    string RepeatingInvoiceID?;
    # Xero generated unique identifier for repeating invoice template
    string ID?;
    # boolean to indicate if an invoice has an attachment
    boolean HasAttachments?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
};

# A summary of the import from setup endpoint
public type ImportSummary record {
    # A summary of the accounts changes
    ImportSummaryAccounts Accounts?;
    # A summary of the organization changes
    ImportSummaryOrganisation Organisation?;
};

public type Element record {
    # Array of Validation Error message
    ValidationError[] ValidationErrors?;
    # Unique ID for batch payment object with validation error
    string BatchPaymentID?;
    string BankTransactionID?;
    string CreditNoteID?;
    string ContactID?;
    string InvoiceID?;
    string ItemID?;
    string PurchaseOrderID?;
};

public type Employees record {
    Employee[] Employees?;
};

public type RowType string;

public type Invoices record {
    Invoice[] Invoices?;
};

public type HistoryRecord record {
    # details
    string Details?;
    # Name of branding theme
    string Changes?;
    # has a value of 0
    string User?;
    # UTC timestamp of creation date of branding theme
    string DateUTC?;
};

public type Attachments record {
    Attachment[] Attachments?;
};

public type BankTransaction record {
    # See Bank Transaction Types
    string Type;
    Contact Contact?;
    # See LineItems
    LineItem[] LineItems;
    Account BankAccount;
    # Boolean to show if transaction is reconciled
    boolean IsReconciled?;
    # Date of transaction – YYYY-MM-DD
    string Date?;
    # Reference for the transaction. Only supported for SPEND and RECEIVE transactions.
    string Reference?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # Exchange rate to base currency when money is spent or received. e.g.0.7500 Only used for bank transactions in non base currency. If this isn’t specified for non base currency accounts then either the user-defined rate (preference) or the XE.com day rate will be used. Setting currency is only supported on overpayments.
    float CurrencyRate?;
    # URL link to a source document – shown as “Go to App Name”
    string Url?;
    # See Bank Transaction Status Codes
    string Status?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # Total of bank transaction excluding taxes
    float SubTotal?;
    # Total tax on bank transaction
    float TotalTax?;
    # Total of bank transaction tax inclusive
    float Total?;
    # Xero generated unique identifier for bank transaction
    string BankTransactionID?;
    # Xero generated unique identifier for a Prepayment. This will be returned on BankTransactions with a Type of SPEND-PREPAYMENT or RECEIVE-PREPAYMENT
    string PrepaymentID?;
    # Xero generated unique identifier for an Overpayment. This will be returned on BankTransactions with a Type of SPEND-OVERPAYMENT or RECEIVE-OVERPAYMENT
    string OverpaymentID?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # Boolean to indicate if a bank transaction has an attachment
    boolean HasAttachments?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type InvoiceReminders record {
    InvoiceReminder[] InvoiceReminders?;
};

public type BankTransfers record {
    BankTransfer[] BankTransfers?;
};

public type ReportAttribute record {
    string Id?;
    string Value?;
};

public type TaxComponent record {
    # Name of Tax Component
    string Name?;
    # Tax Rate (up to 4dp)
    float Rate?;
    # Boolean to describe if Tax rate is compounded.
    boolean IsCompound?;
    # Boolean to describe if tax rate is non-recoverable. Non-recoverable rates are only applicable to Canadian organisations
    boolean IsNonRecoverable?;
};

public type Allocation record {
    Invoice Invoice;
    Overpayment Overpayment?;
    Prepayment Prepayment?;
    CreditNote CreditNote?;
    # the amount being applied to the invoice
    float Amount;
    # the date the allocation is applied YYYY-MM-DD.
    string Date;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type Phone record {
    string PhoneType?;
    # max length = 50
    string PhoneNumber?;
    # max length = 10
    string PhoneAreaCode?;
    # max length = 20
    string PhoneCountryCode?;
};

public type ManualJournals record {
    ManualJournal[] ManualJournals?;
};

public type TrackingCategories record {
    TrackingCategory[] TrackingCategories?;
};

public type TaxRate record {
    # Name of tax rate
    string Name?;
    # The tax type
    string TaxType?;
    # See TaxComponents
    TaxComponent[] TaxComponents?;
    # See Status Codes
    string Status?;
    # See ReportTaxTypes
    string ReportTaxType?;
    # Boolean to describe if tax rate can be used for asset accounts i.e.  true,false
    boolean CanApplyToAssets?;
    # Boolean to describe if tax rate can be used for equity accounts i.e true,false
    boolean CanApplyToEquity?;
    # Boolean to describe if tax rate can be used for expense accounts  i.e. true,false
    boolean CanApplyToExpenses?;
    # Boolean to describe if tax rate can be used for liability accounts  i.e. true,false
    boolean CanApplyToLiabilities?;
    # Boolean to describe if tax rate can be used for revenue accounts i.e. true,false
    boolean CanApplyToRevenue?;
    # Tax Rate (decimal to 4dp) e.g 12.5000
    float DisplayTaxRate?;
    # Effective Tax Rate (decimal to 4dp) e.g 12.5000
    float EffectiveRate?;
};

public type CountryCode string;

public type PaymentService record {
    # Xero identifier
    string PaymentServiceID?;
    # Name of payment service
    string PaymentServiceName?;
    # The custom payment URL
    string PaymentServiceUrl?;
    # The text displayed on the Pay Now button in Xero Online Invoicing. If this is not set it will default to Pay by credit card
    string PayNowText?;
    # This will always be CUSTOM for payment services created via the API.
    string PaymentServiceType?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type BrandingTheme record {
    # Xero identifier
    string BrandingThemeID?;
    # Name of branding theme
    string Name?;
    # The location of the image file used as the logo on this branding theme
    string LogoUrl?;
    # Always INVOICE
    string Type?;
    # Integer – ranked order of branding theme. The default branding theme has a value of 0
    int SortOrder?;
    # UTC timestamp of creation date of branding theme
    string CreatedDateUTC?;
};

public type ReportFields record {
    string FieldID?;
    string Description?;
    string Value?;
};

public type Purchase record {
    # Unit Price of the item. By default UnitPrice is rounded to two decimal places. You can use 4 decimal places by adding the unitdp=4 querystring parameter to your request.
    float UnitPrice?;
    # Default account code to be used for purchased/sale. Not applicable to the purchase details of tracked items
    string AccountCode?;
    # Cost of goods sold account. Only applicable to the purchase details of tracked items.
    string COGSAccountCode?;
    # The tax type from TaxRates
    string TaxType?;
};

public type Organisation record {
    # Unique Xero identifier
    string OrganisationID?;
    # Display a unique key used for Xero-to-Xero transactions
    string APIKey?;
    # Display name of organisation shown in Xero
    string Name?;
    # Organisation name shown on Reports
    string LegalName?;
    # Boolean to describe if organisation is registered with a local tax authority i.e. true, false
    boolean PaysTax?;
    # See Version Types
    string Version?;
    # Organisation Type
    string OrganisationType?;
    # 3 letter alpha code for the currency – see list of currency codes
    string BaseCurrency?;
    string CountryCode?;
    # Boolean to describe if organisation is a demo company.
    boolean IsDemoCompany?;
    # Will be set to ACTIVE if you can connect to organisation via the Xero API
    string OrganisationStatus?;
    # Shows for New Zealand, Australian and UK organisations
    string RegistrationNumber?;
    # Shown if set. US Only.
    string EmployerIdentificationNumber?;
    # Shown if set. Displays in the Xero UI as Tax File Number (AU), GST Number (NZ), VAT Number (UK) and Tax ID Number (US & Global).
    string TaxNumber?;
    # Calendar day e.g. 0-31
    int FinancialYearEndDay?;
    # Calendar Month e.g. 1-12
    int FinancialYearEndMonth?;
    # The accounting basis used for tax returns. See Sales Tax Basis
    string SalesTaxBasis?;
    # The frequency with which tax returns are processed. See Sales Tax Period
    string SalesTaxPeriod?;
    # The default for LineAmountTypes on sales transactions
    string DefaultSalesTax?;
    # The default for LineAmountTypes on purchase transactions
    string DefaultPurchasesTax?;
    # Shown if set. See lock dates
    string PeriodLockDate?;
    # Shown if set. See lock dates
    string EndOfYearLockDate?;
    # Timestamp when the organisation was created in Xero
    string CreatedDateUTC?;
    # Timezone specifications
    string Timezone?;
    # Organisation Entity Type
    string OrganisationEntityType?;
    # A unique identifier for the organisation. Potential uses.
    string ShortCode?;
    # Organisation Classes describe which plan the Xero organisation is on (e.g. DEMO, TRIAL, PREMIUM)
    string Class?;
    # BUSINESS or PARTNER. Partner edition organisations are sold exclusively through accounting partners and have restricted functionality (e.g. no access to invoicing)
    string Edition?;
    # Description of business type as defined in Organisation settings
    string LineOfBusiness?;
    # Address details for organisation – see Addresses
    AddressForOrganisation[] Addresses?;
    # Phones details for organisation – see Phones
    Phone[] Phones?;
    # Organisation profile links for popular services such as Facebook,Twitter, GooglePlus and LinkedIn. You can also add link to your website here. Shown if Organisation settings  is updated in Xero. See ExternalLinks below
    ExternalLink[] ExternalLinks?;
    PaymentTerm PaymentTerms?;
};

public type Report record {
    # See Prepayment Types
    string ReportName?;
    # See Prepayment Types
    string ReportType?;
    # See Prepayment Types
    string ReportTitle?;
    # Date of report
    string ReportDate?;
    # Updated Date
    string UpdatedDateUTC?;
    TenNinetyNineContact[] Contacts?;
};

public type TenNinetyNineContact record {
    # Box 1 on 1099 Form
    float Box1?;
    # Box 2 on 1099 Form
    float Box2?;
    # Box 3 on 1099 Form
    float Box3?;
    # Box 4 on 1099 Form
    float Box4?;
    # Box 5 on 1099 Form
    float Box5?;
    # Box 6 on 1099 Form
    float Box6?;
    # Box 7 on 1099 Form
    float Box7?;
    # Box 8 on 1099 Form
    float Box8?;
    # Box 9 on 1099 Form
    float Box9?;
    # Box 10 on 1099 Form
    float Box10?;
    # Box 11 on 1099 Form
    float Box11?;
    # Box 13 on 1099 Form
    float Box13?;
    # Box 14 on 1099 Form
    float Box14?;
    # Contact name on 1099 Form
    string Name?;
    # Contact Fed Tax ID type
    string FederalTaxIDType?;
    # Contact city on 1099 Form
    string City?;
    # Contact zip on 1099 Form
    string Zip?;
    # Contact State on 1099 Form
    string State?;
    # Contact email on 1099 Form
    string Email?;
    # Contact address on 1099 Form
    string StreetAddress?;
    # Contact tax id on 1099 Form
    string TaxID?;
    # Contact contact id
    string ContactId?;
};

public type LineItem record {
    # LineItem unique ID
    string LineItemID?;
    # Description needs to be at least 1 char long. A line item with just a description (i.e no unit amount or quantity) can be created by specifying just a <Description> element that contains at least 1 character
    string Description?;
    # LineItem Quantity
    float Quantity?;
    # LineItem Unit Amount
    float UnitAmount?;
    # See Items
    string ItemCode?;
    # See Accounts
    string AccountCode?;
    # The associated account ID related to this line item
    string AccountID?;
    # The tax type from TaxRates
    string TaxType?;
    # The tax amount is auto calculated as a percentage of the line amount (see below) based on the tax rate. This value can be overriden if the calculated <TaxAmount> is not correct.
    float TaxAmount?;
    # If you wish to omit either of the <Quantity> or <UnitAmount> you can provide a LineAmount and Xero will calculate the missing amount for you. The line amount reflects the discounted price if a DiscountRate has been used . i.e LineAmount = Quantity * Unit Amount * ((100 – DiscountRate)/100)
    float LineAmount?;
    # Optional Tracking Category – see Tracking.  Any LineItem can have a  maximum of 2 <TrackingCategory> elements.
    LineItemTracking[] Tracking?;
    # Percentage discount being applied to a line item (only supported on  ACCREC invoices – ACC PAY invoices and credit notes in Xero do not support discounts
    float DiscountRate?;
    # Discount amount being applied to a line item. Only supported on ACCREC invoices - ACCPAY invoices and credit notes in Xero do not support discounts.
    float DiscountAmount?;
    # The Xero identifier for a Repeating Invoice
    string RepeatingInvoiceID?;
};

public type Reports record {
    Report[] Reports?;
};

public type Error record {
    # Exception number
    int ErrorNumber?;
    # Exception type
    string Type?;
    # Exception message
    string Message?;
    # Array of Elements of validation Errors
    Element[] Elements?;
};

public type PaymentTerm record {
    Bill Bills?;
    Bill Sales?;
};

# See Account Types
#
public type AccountType string;

public type Contact record {
    # Xero identifier
    string ContactID?;
    # This can be updated via the API only i.e. This field is read only on the Xero contact screen, used to identify contacts in external systems (max length = 50). If the Contact Number is used, this is displayed as Contact Code in the Contacts UI in Xero.
    string ContactNumber?;
    # A user defined account number. This can be updated via the API and the Xero UI (max length = 50)
    string AccountNumber?;
    # Current status of a contact – see contact status types
    string ContactStatus?;
    # Full name of contact/organisation (max length = 255)
    string Name?;
    # First name of contact person (max length = 255)
    string FirstName?;
    # Last name of contact person (max length = 255)
    string LastName?;
    # Email address of contact person (umlauts not supported) (max length  = 255)
    string EmailAddress?;
    # Skype user name of contact
    string SkypeUserName?;
    # See contact persons
    ContactPerson[] ContactPersons?;
    # Bank account number of contact
    string BankAccountDetails?;
    # Tax number of contact – this is also known as the ABN (Australia), GST Number (New Zealand), VAT Number (UK) or Tax ID Number (US and global) in the Xero UI depending on which regionalized version of Xero you are using (max length = 50)
    string TaxNumber?;
    # The tax type from TaxRates
    string AccountsReceivableTaxType?;
    # The tax type from TaxRates
    string AccountsPayableTaxType?;
    # Store certain address types for a contact – see address types
    Address[] Addresses?;
    # Store certain phone types for a contact – see phone types
    Phone[] Phones?;
    # true or false – Boolean that describes if a contact that has any AP  invoices entered against them. Cannot be set via PUT or POST – it is automatically set when an accounts payable invoice is generated against this contact.
    boolean IsSupplier?;
    # true or false – Boolean that describes if a contact has any AR invoices entered against them. Cannot be set via PUT or POST – it is automatically set when an accounts receivable invoice is generated against this contact.
    boolean IsCustomer?;
    # 3 letter alpha code for the currency – see list of currency codes
    string DefaultCurrency?;
    # Store XeroNetworkKey for contacts.
    string XeroNetworkKey?;
    # The default sales account code for contacts
    string SalesDefaultAccountCode?;
    # The default purchases account code for contacts
    string PurchasesDefaultAccountCode?;
    # The default sales tracking categories for contacts
    SalesTrackingCategory[] SalesTrackingCategories?;
    # The default purchases tracking categories for contacts
    SalesTrackingCategory[] PurchasesTrackingCategories?;
    # The name of the Tracking Category assigned to the contact under SalesTrackingCategories and PurchasesTrackingCategories
    string TrackingCategoryName?;
    # The name of the Tracking Option assigned to the contact under SalesTrackingCategories and PurchasesTrackingCategories
    string TrackingCategoryOption?;
    PaymentTerm PaymentTerms?;
    # UTC timestamp of last update to contact
    string UpdatedDateUTC?;
    # Displays which contact groups a contact is included in
    ContactGroup[] ContactGroups?;
    # Website address for contact (read only)
    string Website?;
    BrandingTheme BrandingTheme?;
    # Bank details for use on a batch payment stored with each contact
    BatchPaymentDetails BatchPayments?;
    # The default discount rate for the contact (read only)
    float Discount?;
    # The raw AccountsReceivable(sales invoices) and AccountsPayable(bills) outstanding and overdue amounts, not converted to base currency (read only)
    Balances Balances?;
    # Displays array of attachments from the API
    Attachment[] Attachments?;
    # A boolean to indicate if a contact has an attachment
    boolean HasAttachments?;
    # Displays validation errors returned from the API
    ValidationError[] ValidationErrors?;
    # A boolean to indicate if a contact has an validation errors
    boolean HasValidationErrors?;
    # Status of object
    string StatusAttributeString?;
};

public type Quote record {
    # QuoteID GUID is automatically generated and is returned after create or GET.
    string QuoteID?;
    # Unique alpha numeric code identifying a quote (Max Length = 255)
    string QuoteNumber?;
    # Additional reference number
    string Reference?;
    # Terms of the quote
    string Terms?;
    string Contact?;
    # See LineItems
    LineItem[] LineItems?;
    # Date quote was issued – YYYY-MM-DD. If the Date element is not specified it will default to the current date based on the timezone setting of the organisation
    string Date?;
    # Date the quote was issued (YYYY-MM-DD)
    string DateString?;
    # Date the quote expires – YYYY-MM-DD.
    string ExpiryDate?;
    # Date the quote expires – YYYY-MM-DD.
    string ExpiryDateString?;
    # The status of the quote.
    string Status?;
    # 3 letter alpha code for the currency – see list of currency codes
    string CurrencyCode?;
    # The currency rate for a multicurrency quote
    float CurrencyRate?;
    # Total of quote excluding taxes.
    float SubTotal?;
    # Total tax on quote
    float TotalTax?;
    # Total of Quote tax inclusive (i.e. SubTotal + TotalTax). This will be ignored if it doesn’t equal the sum of the LineAmounts
    float Total?;
    # Total of discounts applied on the quote line items
    float TotalDiscount?;
    # Title text for the quote
    string Title?;
    # Summary text for the quote
    string Summary?;
    # See BrandingThemes
    string BrandingThemeID?;
    # Last modified date UTC format
    string UpdatedDateUTC?;
    # Line amounts are exclusive of tax by default if you don’t specify this element. See Line Amount Types
    string LineAmountTypes?;
    # A string to indicate if a invoice status
    string StatusAttributeString?;
    # Displays array of validation error messages from the API
    ValidationError[] ValidationErrors?;
};

public type InvoiceReminder record {
    # setting for on or off
    boolean Enabled?;
};

public type ImportSummaryObject record {
    # A summary of the import from setup endpoint
    ImportSummary ImportSummary?;
};

public type Schedule record {
    # Integer used with the unit e.g. 1 (every 1 week), 2 (every 2 months)
    int Period?;
    # One of the following - WEEKLY or MONTHLY
    string Unit?;
    # Integer used with due date type e.g 20 (of following month), 31 (of current month)
    int DueDate?;
    # the payment terms
    string DueDateType?;
    # Date the first invoice of the current version of the repeating schedule was generated (changes when repeating invoice is edited)
    string StartDate?;
    # The calendar date of the next invoice in the schedule to be generated
    string NextScheduledDate?;
    # Invoice end date – only returned if the template has an end date set
    string EndDate?;
};

public type ContactGroup record {
    # The Name of the contact group. Required when creating a new contact  group
    string Name?;
    # The Status of a contact group. To delete a contact group update the status to DELETED. Only contact groups with a status of ACTIVE are returned on GETs.
    string Status?;
    # The Xero identifier for an contact group – specified as a string following the endpoint name. e.g. /297c2dc5-cc47-4afd-8ec8-74990b8761e9
    string ContactGroupID?;
    # The ContactID and Name of Contacts in a contact group. Returned on GETs when the ContactGroupID is supplied in the URL.
    Contact[] Contacts?;
};

public type Receipts record {
    Receipt[] Receipts?;
};
