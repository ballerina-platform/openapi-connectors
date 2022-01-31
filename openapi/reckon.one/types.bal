// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# An address to patch.
public type BookAddressPatch record {
    # First line of address.
    string? line1?;
    # Second line of address.
    string? line2?;
    # Third line of address.
    string? line3?;
    # Town of address.
    string? town?;
    # Suburb of address.
    string? suburb?;
    # State of address.
    string? state?;
    # Postcode of address.
    string? postcode?;
    # Country of address.
    string? country?;
};

# Details of an item used on an receipt line item.
public type ReceiptLineItemItemDetailsPatch record {
    # The id or full name of the item that the invoice line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The price of each item including or excluding tax (depending on the invoice's `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# Details of a superfund to create or update.
public type SuperfundDetails record {
    # The superfund provider details
    record {*SuperfundProvider2;} superfundProvider?;
    # The SMSF provider details
    record {*SelfManagedSuperfund;} smsf?;
};

# A customer
public type Customer record {
    # The organisation's unique id.
    string? id;
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # The organisation's notes.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # The organisation's status (Active or Inactive).
    string? status?;
    # List of electronic addresses.
    ElectronicAddress[]? electronicAddresses?;
    # List of phone numbers.
    PhoneNumber[]? phoneNumbers?;
    # List of addresses.
    Address[]? addresses?;
    # The organisation's contacts list.
    ContactRef[]? contacts?;
    # The organisation's current balance.
    decimal? balance?;
    # The organisation's last modified date.
    string? lastModifiedDateTime;
    # The customer's credit limit (null for other types).
    decimal? creditLimit?;
    # The customer's peyment term (null for other types).
    record {*PaymentTermRef;} paymentTerms?;
    # The total number of invoices that have been issued to the organisation.
    int? invoiceCount?;
};

# Details of an address to create or update.
public type AddressInput record {
    # Line 1 of the address.
    string? line1?;
    # Line 2 of the address.
    string? line2?;
    # Line 3 of the address.
    string? line3?;
    # The suburb.
    string? suburb?;
    # The town.
    string? town?;
    # The state.
    string? state?;
    # The post code.
    string? postcode?;
    # The country.
    string? country?;
    # The id or name of the address type.
    string? 'type;
};

# Bank account details.
public type LedgerAccountBankInput record {
    # When the bank account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The bank branch number (BSB in Australia, Sort Code in UK).
    string? bankBranchNumber?;
    # The bank account number.
    string? bankAccountNumber?;
    # The bank account's opening balance.
    decimal? openingBalance?;
    # The id of the financial institution.
    string? financialInstitution?;
    # Whether to include a balancing transaction.
    boolean? includeBalancingTransaction;
    # The APCA number to identify the payer.
    string? payerIdentifier?;
};

# A list of templates.
public type CustomerStatementsTemplates record {
    # The list of items.
    CustomerStatementsTemplate[]? list?;
};

# The billable time transfer settings.
public type TransferBillableTimeSettings record {
    # Indicates whether combines time item and rate when transferring billable time.
    boolean? combineItemAndRate;
    # Indicates whether use time sheet entry note as line item description when transferring billable time separately.
    boolean? transferNotes;
    # Indicates whether use chargeable item description as line item description when transferring billable time separately.
    boolean? transferDescriptions;
};

# Superfund’s details to create or update.
public type SelfManagedSuperfundInput record {
    # The SelfManagedSuperfund (SMSF) Name
    string? fundName?;
    # The electronic address for service
    string? electronicServiceAddress?;
};

# ThDetails of an department to patch.
public type DepartmentPatch record {
    # The department's unique name.
    string? name?;
    # The department's unique code.
    string? code?;
    # The status of a department.
    DepartmentStatus? status?;
    # Notes about the department.
    string? notes?;
};

# A transaction linked to another transaction.
public type TransactionLink record {
    # The link's unique id.
    string? linkId?;
    # Type of transaction linked to an invoice.
    LinkedTransactionType? transactionType;
    # The unique id of the linked transaction.
    string? transactionId;
    # The transaction number of the linked transaction.
    string? transactionNumber?;
    # The transaction's date.
    string? transactionDate?;
    # The transaction's reference.
    string? transactionReference?;
    # The transacion's amount.
    decimal? transactionAmount?;
    # The URL to use to retrieve the linked transaction.
    string? href?;
};

# Item usage details.
public type ItemUse record {
    # The item's price.
    # If the item's `amountTaxStatus` is `Inclusive` then the price includes tax (gross).
    # If the item's `amountTaxStatus` is `Exclusive` then the price excludes tax (net).
    decimal? price?;
    # The accuracy (number of decimal places) of the price.
    int? priceAccuracy?;
    # The ledger account.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The description.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
};

# A list of electronic addresses.
public type Addresses record {
    # The list of items.
    Address[]? list?;
};

# Type status.
public type TypeStatus string?;

# Details of a department.
public type Department record {
    # The department's unique id.
    string? id;
    # The department's unique name.
    string? name?;
    # The department's unique code.
    string? code?;
    # The status of a department.
    DepartmentStatus? status;
    # Notes about the department.
    string? notes?;
    # A list of managers assigned to the department.
    EmployeeRef[]? managers?;
    # A list of employees assigned to the department.
    EmployeeRef[]? employees?;
    # The date and time when the department was created.
    string? createdDateTime;
    # The date and time when the department was last modified.
    string? lastModifiedDateTime;
};

# A list of suppliers.
public type Suppliers record {
    # The list of items.
    Supplier[]? list?;
};

# Details of a customer to patch.
public type CustomerPatch record {
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # If the entity has other entity types.
    record {*EntityTypePatch;} entityTypes?;
    # The customer's credit limit.
    decimal? creditLimit?;
    # The customer's peyment term id.
    string? paymentTerms?;
};

# Details of an item used on a credit note line item.
public type CreditNoteLineItemItemDetailsInput record {
    # The id or full name of the item that the line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item;
    # The price of each item including or excluding tax (depending on the `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
};

# Details of a leave balance item.
public type LeaveBalanceItem record {
    # The pay item.
    record {*PayItemRef;} payItem?;
    # The employee.
    record {*EmployeeRef;} employee?;
    # The leave balance.
    decimal? leaveBalance;
    # The leave loading currency value.
    decimal? leaveLoadingValue;
    # The ordinary time earnings value.
    decimal? oteValue;
    # The total value.
    decimal? totalValue;
};

# Class for the fund details of the superfund provider
public type FundDetails record {
    # The super fund provider's unique id.
    string? id?;
    # The name of the superfund
    string? name?;
};

# Details of a phone number to update.
public type UpdatePhoneNumberInput record {
    # The country code.
    string? countryCode?;
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
    # The extension.
    string? extension?;
};

# The status of an expense claim.
public type ExpenseClaimStatus string?;

# Details of an account used on an invoice line item.
public type InvoiceLineItemAccountDetails record {
    # The id and full name of the ledger account that the line relates to.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The quantity sold.
    decimal? quantity?;
    # The amount.
    decimal? amount?;
};

# Details of a transaction to link to a credit note.
public type CreditNoteTransactionLinkInput record {
    # The unique id of the linked transaction.
    string? transactionId;
    # The transaction's amount.
    decimal? transactionAmount;
    # Type of transaction linked to an invoice.
    LinkedTransactionType? transactionType;
};

# Role permissions for customer statements.
public type RolePermissionsForCustomerStatements record {
    # Whether the role has permission to create.
    boolean? create;
};

# Bank account details.
public type LedgerAccountBankPatch record {
    # When the bank account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The bank branch number (BSB in Australia, Sort Code in UK).
    string? bankBranchNumber?;
    # The bank account number.
    string? bankAccountNumber?;
    # The bank account's opening balance.
    decimal? openingBalance?;
    # The id of the financial institution.
    string? financialInstitution?;
    # Whether to include a balancing transaction.
    boolean? includeBalancingTransaction;
    # The APCA number to identify the payer.
    string? payerIdentifier?;
};

# A list of classifications.
public type Classifications record {
    # The list of items.
    Classification[]? list?;
};

# Details of an item to patch.
public type ItemPatch record {
    # The name of the item.
    string? name?;
    # The parent item if there is one.
    string? parentItem?;
    # The item type.
    ItemType? itemType?;
    # The item code.
    string? itemCode?;
    # The status of an item.
    ItemStatus? status?;
    # Details for the item when it is purchased.
    record {*ItemUsePatch;} purchase?;
    # Details for the item when it is sold.
    record {*ItemUsePatch;} sale?;
    # The tax status of an item's amount.
    ItemAmountTaxStatus? amountTaxStatus?;
};

# Details of an item used on an receipt line item.
public type ReceiptLineItemItemDetailsInput record {
    # The id or full name of the item that the line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item;
    # The price of each item including or excluding tax (depending on the `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# Details on how to contact the business to be patched.
public type ContactDetailPatch record {
    # Name of person who is primary contact within the business.
    string? contactName?;
};

# Reference to a phone type.
public type PhoneTypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# A list of roles.
public type Roles record {
    # The list of items.
    Role[]? list?;
};

# Role permissions for UK VAT.
public type RolePermissionsForVat record {
    # Whether the role has permission to authorise.
    boolean? authorise;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to submit.
    boolean? submit;
    # Whether the role has permission to view.
    boolean? view;
};

# Details of an item used on an invoice line item.
public type InvoiceLineItemItemDetails record {
    # The id and full name of the item that the line relates to.
    record {*ItemRef;} item?;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# Details of an item used on an credit note line item.
public type CreditNoteLineItemItemDetails record {
    # The id and full name of the item that the line relates to.
    record {*ItemRef;} item?;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
};

# A project
public type Project record {
    # The project's unique id.
    string? id;
    # The project's name.
    string? name?;
    # The project's full name.
    string? fullName?;
    # The parent project.
    record {*ProjectRef;} parentProject?;
    # The status of a project.
    ProjectStatus? status;
    # The date the project starts.
    string? startDate?;
    # The date the project ends.
    string? endDate?;
    # A description of the project.
    string? description?;
    # The tax status of an item's amount.
    ProjectAmountTaxStatus? amountTaxStatus;
    # Customers linked to the project.
    ProjectCustomer[]? customers?;
    # Suppliers linked to the project.
    ProjectSupplier[]? suppliers?;
    # Items used in the project.
    ProjectItem[]? items?;
    # Timestamp of when project record was last modified.
    string? lastModifiedDateTime;
};

# Details of an employee.
public type Employee record {
    # The employee's unique id.
    string? id;
    # The employee's display name.
    string? name?;
    # The employee's first name.
    string? firstName?;
    # The employee's last name.
    string? surname?;
    # Additional notes about the employee.
    string? notes?;
    # The employee's business number 1.
    string? businessNumber1?;
    # The employee's business number 2.
    string? businessNumber2?;
    # The employee's addresses.
    Address[]? addresses?;
    # The status of a contact.
    ContactStatus? status;
    # List of electronic addresses.
    ElectronicAddress[]? electronicAddresses?;
    # List of phone numbers
    PhoneNumber[]? phoneNumbers?;
    # A list of other entity types this employee is assigned to.
    EntityType[]? otherEntityTypes?;
    # The UTC date and time when the employee's details were last modified.
    string? lastModifiedDateTime;
};

# Details of a receipt to update.
public type ReceiptPatch record {
    # The customer that is being invoiced.
    string? customer?;
    # The date of the receipt.
    string? receiptDate?;
    # The id or name of the bank/cash/credit account where the money was received.
    string? ledgerAccount?;
    # The id or name of the payment method used.
    string? paymentMethod?;
    # The receipt reference.
    string? reference?;
    # Notes related to the receipt.
    string? notes?;
    # The total amount of the invoice.
    decimal? totalAmount;
    # Reconciliation status.
    ReconciliationStatus? reconciliationStatus?;
    # Internal Notes related to the receipt.
    string? internalNotes?;
    # The classification.
    string? classification?;
};

# Details of an item used on an invoice line item.
public type InvoiceLineItemItemDetailsPatch record {
    # The id or full name of the item that the invoice line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The price of each item including or excluding tax (depending on the invoice's `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# The type of an amount.
public type AmountType string?;

# The details of payroll default bank accounts.
public type PayrollDefaultBankAccounts record {
    # The direct credit payment bank account.
    record {*LedgerAccountRef;} directCreditPaymentsBankAccount?;
    # The cash payments account.
    record {*LedgerAccountRef;} cashPaymentsBankAccount?;
    # The super payment bank account.
    record {*LedgerAccountRef;} superPaymentsBankAccount?;
};

# Response sent when a 403 Forbidden error occurs.
public type ErrorResponseForbidden record {
    # The description of the error.
    string? message?;
    # The HTTP status code of the error.
    int? code;
};

# Details of an invoice to patch.
public type InvoiceLineItemPatch record {
    # The line number.
    int? lineNumber?;
    # The date when the service was provided.
    string? serviceDate?;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an invoice line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*InvoiceLineItemItemDetailsPatch;} itemDetails?;
    # Details of an account used on an invoice line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*InvoiceLineItemAccountDetailsPatch;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# The payroll settings' legal contact details to patch.
public type PayrollLegalContactPatch record {
    # The first name of legal contact.
    string? firstName?;
    # The last name of legal contact.
    string? lastName?;
    # The legal contact's title.
    string? title?;
};

# Details of an item used on a credit note line item.
public type CreditNoteLineItemItemDetailsPatch record {
    # The id or full name of the item that the line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The price of each item including or excluding tax (depending on the `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
};

# Details of a project to patch.
public type ProjectPatch record {
    # Name of project.
    string? name?;
    # The status of a project.
    ProjectStatus? status?;
    # The tax status of an item's amount.
    ProjectAmountTaxStatus? amountTaxStatus?;
    # The parent project.
    string? parentProject?;
    # The date the project starts.
    string? startDate?;
    # The date the project ends.
    string? endDate?;
    # A description of the project.
    string? description?;
};

# A response that contains the resource's id.
public type StringIdResponse record {
    # The resource's id.
    string? id?;
};

# Details of an account used on an receipt line item.
public type ReceiptLineItemAccountDetailsPatch record {
    # The id or full name of the ledger account that the invoice line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount?;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the invoice's `amountTaxStatus`).
    decimal? amount?;
};

# Report categories.
public type ReportCategory string?;

# Details of a credit note to patch.
public type CreditNotePatch record {
    # The customer that the credit note will be issued to.
    string? customer?;
    # The date of the credit note.
    string? creditNoteDate?;
    # The status of a credit note.
    CreditNoteStatus? status?;
    # The credit note reference.
    string? reference?;
    # The accounts receivable ledger account.
    # _Note:_ It is not currently possible to create multiple Accounts Receivable accounts so this field is read-only and will be ignored.
    string? accountsReceivableLedgerAccount?;
    # The classification.
    string? classification?;
    # The template used to print or email the credit note.
    string? template?;
    # Notes related to the credit note.
    string? notes?;
};

# Selected fields to update in a credit note's transaction link.
public type CreditNoteTransactionLinkPatch record {
    # The transaction's amount.
    decimal? transactionAmount;
};

# A file content result.
public type FileContentResult record {
};

# Type reference.
public type BookTypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Phone types.
public type PhoneTypes record {
    # The list of items.
    PhoneType[]? list?;
};

# Details of an expense claim to create or update.
public type ExpenseClaimInput record {
    # The employee who lodged the expense claim.
    string? employee;
    # The date of the expense claim.
    string? claimDate;
    # The reference entered by the employee.
    string? reference?;
    # The project that the expense claim relates to.
    string? project?;
    # The customer that the expense claim relates to.
    string? customer?;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The status of an expense claim.
    ExpenseClaimStatus? status?;
    # The individual items that make up the expense claim.
    ExpenseClaimLineItemInput[]? lineItems?;
    # The notes entered by the employee.
    string? notes?;
};

# Details of the header of a template.
public type TemplateHeader record {
    # Logo of the template's header.
    record {*Logo;} logo?;
    # Is CompanyName included in the template's header.
    boolean? companyName;
    # Is CompanyAddress included in the template's header.
    boolean? companyAddress;
    # Is TaxNumber included in the template's header.
    boolean? taxNumber;
    # Is PhoneNumber included in the template's header.
    boolean? phoneNumber;
    # Is Email included in the template's header.
    boolean? email;
    # Is Website included in the template's header.
    boolean? website;
};

# Role permissions for pay slips.
public type RolePermissionsForPaySlips record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to manage.
    boolean? manage;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to email.
    boolean? email;
};

# Book ownership.
public type BookOwnership string?;

# Details of an account used on an invoice line item.
public type InvoiceLineItemAccountDetailsInput record {
    # The id or full name of the ledger account that the line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the `amountTaxStatus`).
    decimal? amount?;
};

# The system tax type.
public type TaxSystemType string?;

# A list of ledger accounts.
public type LedgerAccounts record {
    # The list of items.
    LedgerAccount[]? list?;
};

# A book's payroll setup.
public type PayrollSetup record {
    # Indicates whether the pay run copies pay items from previous pay (overrides default pay items).
    boolean? copyPayItemsFromPreviousPay;
    # Indicates whether it tracks project cost.
    #             
    boolean? trackProjectCost;
    # Indicates whether it allows editing of pay rates on pay runs.
    boolean? allowPayRatesEditInPayRuns;
    # Indicates whether it enables password protection for emailing pay slips and payment summaries.
    boolean? optionalEmailPasswordProtection;
    # Indicates whether it displays YTD amounts on pay run.
    boolean? displayYTDOnPayrun;
};

# Details of a receipt to create or update.
public type ReceiptInput record {
    # The customer that is being invoiced.
    string? customer;
    # The date of the receipt.
    string? receiptDate;
    # The id or name of the bank/cash/credit account where the money was received.
    string? ledgerAccount?;
    # The id or name of the payment method used.
    string? paymentMethod?;
    # The receipt reference.
    string? reference?;
    # Notes related to the receipt.
    string? notes?;
    # The total amount of the invoice.
    decimal? totalAmount;
    # Reconciliation status.
    ReconciliationStatus? reconciliationStatus?;
    # Internal Notes related to the receipt.
    string? internalNotes?;
    # The accounts receivable ledger account.
    # _Note:_ It is not currently possible to create multiple Accounts Receivable accounts so this field is read-only and will be ignored.
    string? accountsReceivableLedgerAccount?;
    # The classification.
    string? classification?;
    # The individual items that make up the receipt.
    ReceiptLineItemInput[]? lineItems?;
    # Details of transactions that the receipt should be allocated to.
    ReceiptTransactionLinkInput[]? transactionLinks?;
};

# Details of a financial institution.
public type FinancialInstitution record {
    # The financial institution's unique id.
    string? id;
    # The financial institution's unique code.
    string? code?;
    # The financial institution's name.
    string? name?;
};

# The payroll settings' default accounts.
public type PayrollDefaultAccounts record {
    # The expense account.
    record {*LedgerAccountRef;} expenseAccount?;
    # The expense account for company super contributions.
    record {*LedgerAccountRef;} expenseAccountForCompanySuperContributions?;
    # The liability account.
    record {*LedgerAccountRef;} liabilityAccount?;
    # The liability account for withholding amount.
    record {*LedgerAccountRef;} liabilityAccountForWithholdingAmounts?;
    # Indicates whether pays to supplier through accounts payable.
    boolean? payWitholdingAmountToSupplier;
    # Supplier for withholding amounts.
    record {*OrganisationRef;} supplierForWithholdingAmounts?;
};

# A list of tax rates.
public type TaxRates record {
    # The list of items.
    TaxRate[]? list?;
};

# A list of phone numbers.
public type PhoneNumbers record {
    # The list of items.
    PhoneNumber[]? list?;
};

# Details of a credit note to create or update.
public type CreditNoteInput record {
    # The customer that the credit note will be issued to.
    string? customer;
    # The date of the credit note.
    string? creditNoteDate;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The credit note reference.
    string? reference?;
    # The accounts receivable ledger account.
    # _Note:_ It is not currently possible to create multiple Accounts Receivable accounts so this field is read-only and will be ignored.
    string? accountsReceivableLedgerAccount?;
    # The classification.
    string? classification?;
    # The template used to print or email the credit note.
    string? template?;
    # The individual items that make up the credit note.
    CreditNoteLineItemInput[]? lineItems?;
    # Notes related to the credit note.
    string? notes?;
};

# Details of an address to update.
public type AddressPatch record {
    # Line 1 of the address.
    string? line1?;
    # Line 2 of the address.
    string? line2?;
    # Line 3 of the address.
    string? line3?;
    # The suburb.
    string? suburb?;
    # The town.
    string? town?;
    # The state.
    string? state?;
    # The post code.
    string? postcode?;
    # The country.
    string? country?;
};

# The payroll settings' default accounts to patch.
public type PayrollDefaultAccountsPatch record {
    # Indicates whether pays to supplier through accounts payable.
    boolean? payWitholdingAmountToSupplier?;
    # The expense account.
    string? expenseAccount?;
    # The expense account for company super contributions.
    string? expenseAccountForCompanySuperContributions?;
    # The liability account.
    string? liabilityAccount?;
    # The liability account for withholding amount.
    string? liabilityAccountForWithholdingAmounts?;
    # Supplier for withholding amounts.
    string? supplierForWithholdingAmounts?;
};

# A book's payroll setup to patch.
public type PayrollSetupPatch record {
    # Indicates whether the pay run copies pay items from previous pay (overrides default pay items).
    boolean? copyPayItemsFromPreviousPay?;
    # Indicates whether it tracks project cost.
    #             
    boolean? trackProjectCost?;
    # Indicates whether it allows editing of pay rates on pay runs.
    boolean? allowPayRatesEditInPayRuns?;
    # Indicates whether it enables password protection for emailing pay slips and payment summaries.
    boolean? optionalEmailPasswordProtection?;
    # Indicates whether it displays YTD amounts on pay run.
    boolean? displayYTDOnPayrun?;
};

# The details of payroll default payments to patch.
public type PayrollDefaultPaymentsPatch record {
    # Rounding settings of payments.
    decimal? roundToNearest?;
    # Expense account for rounding of cash payments.
    string? expenseAccountForRounding?;
};

# Details of a credit note line item to create or update.
public type CreditNoteLineItemInput record {
    # The line number.
    int? lineNumber;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an invoice line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*CreditNoteLineItemItemDetailsInput;} itemDetails?;
    # Details of an account used on an invoice line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*CreditNoteLineItemAccountDetailsInput;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# A list of electronic addresses.
public type ElectronicAddresses record {
    # The list of items.
    ElectronicAddress[]? list?;
};

# Role permissions for tax settings.
public type RolePermissionsForTaxSettings record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete tax codes and tax groups.
    boolean? canDeleteCodeGroup;
};

# An electronic address.
public type ElectronicAddress record {
    # The electronic address's unique id.
    string? id?;
    # Type of electronic address.
    record {*ElectronicAddressTypeRef;} 'type?;
    # The electronic address.
    string? address?;
};

# Details of an item used on a receipt line item.
public type ReceiptLineItemItemDetails record {
    # The id and full name of the item that the line relates to.
    record {*ItemRef;} item?;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# Role permissions for SuperStream.
public type RolePermissionsForSuperStream record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to lodge SuperStream.
    boolean? canLodge;
};

# Details of a bank account.
public type BankAccount record {
    # When the account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The branch number (BSB or Sort Code).
    string? bankBranchNumber?;
    # The account number.
    string? bankAccountNumber?;
    # The opening balance, if there is one.
    decimal? openingBalance?;
    # Whether the account is cash.
    boolean? isCash;
    # Details of the financial institution.
    record {*FinancialInstitutionRef;} financialInstitution?;
    # Whether to include a balancing transaction.
    boolean? includeBalancingTransaction;
    # The APCA number to identify the payer.
    string? payerIdentifier?;
};

# Details of an account used on an receipt line item.
public type ReceiptLineItemAccountDetailsInput record {
    # The id or full name of the ledger account that the line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the `amountTaxStatus`).
    decimal? amount?;
};

# Time entry approval status.
public type TimeEntryApprovalStatus string?;

# Response sent when an error occurs.
public type ErrorResponse record {
    # The description of the error.
    string? message?;
    # The HTTP status code of the error.
    int? code;
    # An array of specific errors where relevant.
    ErrorDetail[]? errors?;
};

# A list of invoice templates.
public type InvoiceTemplates record {
    # The list of items.
    InvoiceTemplate[]? list?;
};

# Details on how to contact the business.
public type ContactDetail record {
    # Name of person who is primary contact within the business.
    string? contactName?;
    # List of phone numbers.
    BookPhoneNumber[]? phoneNumbers?;
    # List of electronic addresses.
    BookElectronicAddress[]? electronicAddresses?;
};

# Classification status
public type ClassificationStatus string?;

# Role permissions for document storage.
public type RolePermissionsForDocumentStorage record {
    # Whether the role has permission to upload.
    boolean? upload;
    # Whether the role has permission to download.
    boolean? download;
    # Whether the role has permission to delete.
    boolean? delete;
};

# The tax status of an amount.
public type AmountTaxStatus string?;

# A list of contacts.
public type Contacts record {
    # The list of items.
    Contact[]? list?;
};

# Superfund’s details to patch.
public type SelfManagedSuperfundPatch record {
    # The SelfManagedSuperfund (SMSF) Name
    string? fundName?;
    # The electronic address for service
    string? electronicServiceAddress?;
};

# The status of a contact.
public type ContactStatus string?;

# An invoice line item.
public type InvoiceLineItem record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The parent line item's unique id.
    string? parentLineId?;
    # The date when the service was provided.
    string? serviceDate?;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on an invoice line item.
    record {*InvoiceLineItemItemDetails;} itemDetails?;
    # Details of an account used on an invoice line item.
    record {*InvoiceLineItemAccountDetails;} accountDetails?;
    # The description of the item.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # The tax amount.
    decimal? taxAmount?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
    # Details of transactions (e.g. expenses and timesheets) that are linked to the invoice's line items.
    TransactionLink[]? transactionLinks?;
};

# A phone number.
public type PhoneNumber record {
    # The phone number's unique id.
    string? id?;
    # The type of phone number.
    record {*PhoneTypeRef;} 'type?;
    # The country code.
    string? countryCode?;
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
    # The extension.
    string? extension?;
};

# A list of expense claims.
public type ExpenseClaims record {
    # The list of items.
    ExpenseClaim[]? list?;
};

# Details of a payment term to create or update.
public type PaymentTermInput record {
    # The payment term's name.
    string? name;
    # The payment term's description.
    string? description?;
    # The status of a payment term.
    PaymentTermStatus? status?;
    # Whether the payment term is the default for the transaction type.
    boolean? isDefault?;
    # Whether the payment term is used for invoice type transaction.
    boolean? useForInvoice?;
    # Net Due day of the payment term.
    int? netDueDay;
    # Net due date options.
    NetDueDateOptions? netDueDaySelection;
    # Whether the due date falls on weekend. If due date is on a weekend, push due date to the first Monday.
    boolean? isDueDateWeekend?;
    # Whether push invoice issue date to following month if invoice issued within x day(s) of the due date.
    boolean? isIssuedWithinDays?;
    # Invoice issued within x day(s) of the due date
    int? issuedWithinDays?;
};

# Details of an address type.
public type AddressType record {
    # The type's id.
    string? id;
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status;
    # The creation UTC date time.
    string? createdDateTime;
    # The last modified UTC date time.
    string? lastModifiedDateTime;
};

# Details of an account used on a credit note line item.
public type CreditNoteLineItemAccountDetailsPatch record {
    # The id or full name of the ledger account that the line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount?;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the `amountTaxStatus`).
    decimal? amount?;
};

# Meta data for the Payroll Leave Balances and Accrual report.
public type PayrollLeaveBalancesAndAccrualValueMetaData record {
    # The report's unique id.
    string? id;
    # The report's name.
    string? reportName?;
    # The book's name.
    string? bookName?;
    # The company's name.
    string? companyName?;
    # Periods that can be used for the Payroll Leave Balances And Accrual Value report.
    PayrollLeaveBalancesAndAccrualValueReportPeriod? period?;
    # When using AsAtDate, the date that was used.
    string? asAtDate?;
};

# A book's tax settings
public type TaxSettings record {
    # Indicates whether you registered for tax.
    boolean? taxRegistered;
    # The sales figures type of tax.
    AccountingMethodType? reportingBasis;
    # The sales figures type of tax.
    SettingsAmountTaxStatus? amountTaxStatus;
    # Default tax account ledger for sales.
    record {*LedgerAccountRef;} defaultSalesTaxLedgerAccount?;
    # Default tax account ledger for purchases.
    record {*LedgerAccountRef;} defaultPurchasesTaxLedgerAccount?;
    # Indicates whether allows users to edit tax amounts.
    boolean? taxAmountEditable;
    # Indicates whether a user can choose if amounts include or exclude tax.
    boolean? chooseAmountTaxStatus;
    # The BAS reporting preference details.
    record {*BasReportSettings;} basSettings?;
    # The email settings for tax.
    record {*EmailSettings;} emailSettings?;
};

# Tax code reporting location.
public type TaxCodeReportLocationType string?;

# Role permissions for time entries.
public type RolePermissionsForTimeEntries record {
    # Whether the role has permission to approve.
    boolean? approve;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to manage.
    boolean? manage;
    # Whether the role has permission to assign a payroll pay item to a time entry.
    boolean? assignPayItem;
};

# Details of an email.
public type Email record {
    # A list of "To" addresses.
    string[]? toAddresses?;
    # A list of "CC" addresses.
    string[]? ccAddresses?;
    # A list of "BCC" addresses.
    string[]? bccAddresses?;
    # The email subject.
    string? subject?;
    # The email body.
    string? body?;
    # The number of the document that the email relates to.
    string? documentNumber?;
};

# A book's receipt settings.
public type ReceiptSettings record {
    # The receipt prefix.
    string? prefix?;
    # The default invoice bank account.
    record {*LedgerAccountRef;} defaultBankAccount?;
    # Email settings.
    record {*EmailTemplate;} emailSettings?;
};

# Role permissions for employees.
public type RolePermissionsForEmployees record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role can manage payroll employee's details.
    boolean? managePayrollEmployeeDetails;
    # Whether the role can view own employee details.
    boolean? viewOwnDetails;
    # Whether the role can edit own employee details.
    boolean? editOwnDetails;
};

# Reference to a type.
public type TypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of the recurring invoice.
public type RecurringInvoiceTemplateDetails record {
    # The customer that will be invoiced.
    record {*ContactRef;} customer?;
    # The address that the invoice will be sent to.
    record {*Address;} billingAddress?;
    # The address that the goods/service will be sent to.
    record {*Address;} shippingAddress?;
    # The total amount of the invoice.
    decimal? totalAmount;
    # The invoice discount amount.
    decimal? invoiceDiscountAmount?;
    # The invoice discount percentage.
    decimal? invoiceDiscountPercent?;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The total tax amount of the invoice.
    decimal? totalTaxAmount?;
    # Payment terms.
    record {*PaymentTermRef;} paymentTerms?;
    # The invoice reference.
    string? reference?;
    # The accounts receivable ledger account.
    record {*LedgerAccountRef;} accountsReceivableLedgerAccount?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # The template used to print or email the invoice.
    record {*TemplateRef;} template?;
    # Details of transactions (e.g. Invoices) that are linked to the recurring template.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the invoice.
    RecurringInvoiceLineItemTemplateDetails[]? lineItems?;
    # Notes related to the invoice.
    string? notes?;
    # Details of how to pay the invoice.
    string? paymentDetails?;
};

# A book's general settings
public type BookSettings record {
    # The book's name.
    string? bookName?;
    # The first day of records for the book.
    string? startDate;
    # Date and time when the book was created.
    string? bookCreatedDateTime;
    # Transactions on or before this date cannot be changed.
    string? lockOffDate?;
    # Day of month the financial year starts on.
    int? financialYearStartDay;
    # Month as a number that the financial year starts in.
    int? financialYearStartMonth;
    # Entity type of business.
    string? entityType?;
    # Industry details of business.
    record {*IndustryTypeDetail;} industryType?;
    # The email address used by clients when replying to emails sent from Reckon One.
    string? replyToEmailAddress?;
    # The displayed name of sender in emails.
    string? showEmailSentFrom?;
    # The number of most recent days bank data is retrieved for.
    int? bankDataRetrievalDays;
    # General company details
    record {*GeneralDetail;} generalDetails?;
    # List of addresses.
    BookAddress[]? addresses?;
    # Business's contact details.
    record {*ContactDetail;} contactDetails?;
};

# A list of templates.
public type Templates record {
    # The list of items.
    Template[]? list?;
};

# A superfund’s details.
public type SelfManagedSuperfund record {
    # The self-managed super fund’s (SMSF) name.
    string? fundName?;
    # The electronic address for service
    string? electronicServiceAddress?;
};

# A payment term's due date
public type PaymentTermDueDate record {
    # The due day of the payment term.
    string? dueDate;
};

# A payment line item.
public type PaymentLineItem record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on a payment line item.
    record {*PaymentLineItemItemDetails;} itemDetails?;
    # Details of an account used on a payment line item.
    record {*PaymentLineItemAccountDetails;} accountDetails?;
    # The description of the item.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # The tax amount.
    decimal? taxAmount?;
};

# Details of a time entry to create or update.
public type TimeEntryInput record {
    # The id or name of the employee that spent the time.
    string? employee;
    # Date of the time entry.
    string? timeEntryDate;
    # The id or full name of the project on which the time was spent on.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # The id or name of the customer for whom the time was spent on.
    string? customer?;
    # The id or name of the classification.
    string? classification?;
    # Whether the time can be billed to a customer.
    boolean? billable?;
    # Time entry approval status.
    TimeEntryApprovalStatus? approvalStatus;
    # The id or full name of the item that the time entry relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The id or full name of the payroll pay item that the time entry relates to.
    string? payrollItem?;
    # Details of the time spent.
    record {*TimeDetailsInput;} time;
    # Notes related to the time entry.
    string? notes?;
    # Reason why time entry approval was declined.
    # Note that this cannot be set via POST.
    string? declineReason?;
};

# Role permissions for a report.
public type RolePermissionsForReport record {
    # Whether the role has permission to view the report.
    boolean? view;
    # Whether the role has permission to export the report.
    boolean? export;
};

# List of permissions.
public type Permissions record {
    # The list of items.
    string[]? list?;
};

# Superfund’s details to patch
public type SuperfundProviderPatch record {
    # The superfund provider id
    string? fund?;
    # APRA type employee number
    string? employerNumber?;
};

# Details of a electronic address to update.
public type ElectronicAddressPatch record {
    # The electronic address.
    string? address?;
};

# A super fund provider.
public type SuperfundProvider record {
    # The super fund provider's unique id.
    string? id;
    # The super fund provider's name.
    string? name?;
    # The super fund provider's ABN.
    string? abn?;
    # The status of a super fund provider.
    SuperfundProviderStatus? status;
};

# Details of a project supplier to patch.
public type ProjectSupplierPatch record {
    # The id or name of the suplier.
    string? supplier?;
};

# Superfund’s details
public type SuperfundProvider2 record {
    # The superfund provider details
    record {*FundDetails;} fund?;
    # APRA type employee number
    string? employerNumber?;
};

# A list of time entries.
public type TimeEntries record {
    # The list of items.
    TimeEntry[]? list?;
};

# Net due date options.
public type NetDueDateOptions string?;

# Time details for a time entry.
public type TimeDetails record {
    # The start time.
    string? startTime?;
    # The end time.
    string? endTime?;
    # The duration in minutes.
    int? duration;
};

# Details of an account used on a credit note line item.
public type CreditNoteLineItemAccountDetailsInput record {
    # The id or full name of the ledger account that the line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the `amountTaxStatus`).
    decimal? amount?;
};

# Role permissions for emails.
public type RolePermissionsForEmails record {
    # Whether the role has permission to view history.
    boolean? viewHistory;
    # Whether the role has permission to resend.
    boolean? resend;
};

# Details of a phone number to create or update.
public type PhoneNumberInput record {
    # The country code.
    string? countryCode?;
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
    # The extension.
    string? extension?;
    # The id or name of the phone number type.
    string? 'type;
};

# A customer linked to a project.
public type ProjectCustomer record {
    # Record identifier.
    string? lineId;
    # The customer.
    record {*ContactRef;} customer?;
    # Weighting.
    decimal? weighting;
};

# Details of a contact to create or update within an existing organisation.
public type LinkedContactInput record {
    # The contact's display name.
    string? name;
    # The salutation to use in communications.
    string? salutation?;
    # The contact's department.
    string? department?;
    # The contact's position.
    string? position?;
    # The status of a contact.
    ContactStatus? status?;
    # Notes for the contact.
    string? notes?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
};

# Details of the payment term to patch.
public type PaymentTermPatch record {
    # The payment term's name.
    string? name?;
    # The payment term's description.
    string? description?;
    # The status of a payment term.
    PaymentTermStatus? status?;
    # Whether the payment term is the default for the transaction type.
    boolean? isDefault?;
    # Whether the payment term is used for invoice type transaction.
    boolean? useForInvoice?;
    # Net Due day of the payment term.
    int? netDueDay?;
    # Net due date options.
    NetDueDateOptions? netDueDaySelection?;
    # Whether the due date falls on weekend. If due date is on a weekend, push due date to the first Monday.
    boolean? isDueDateWeekend?;
    # Whether push invoice issue date to following month if invoice issued within x day(s) of the due date.
    boolean? isIssuedWithinDays?;
    # Invoice issued within x day(s) of the due date
    int? issuedWithinDays?;
};

# Response sent when a 401 Unauthorized error occurs.
public type ErrorResponseUnauthorized record {
    # The description of the error.
    string? message?;
    # The HTTP status code of the error.
    int? code;
};

# Details of an address type to create or update.
public type AddressTypePatch record {
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};

# Details of an account used on an expense claim line item.
public type ExpenseClaimLineItemAccountDetails record {
    # The id and full name of the ledger account that the expense claim line relates to.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The quantity purchased.
    decimal? quantity?;
    # The amount.
    decimal? amount?;
};

# Details of an expense claim to patch.
public type ExpenseClaimPatch record {
    # The employee who lodged the expense claim.
    string? employee?;
    # The date of the expense claim.
    string? claimDate?;
    # The reference entered by the employee.
    string? reference?;
    # The project that the expense claim relates to.
    string? project?;
    # The customer that the expense claim relates to.
    string? customer?;
    # The status of an expense claim.
    ExpenseClaimStatus? status?;
    # The decline reason when the status is set to Declined.
    # This cannot be used with any other status.
    string? declineReason?;
    # The notes entered by the employee.
    string? notes?;
};

# Tax settings to patch.
public type TaxSettingsPatch record {
    # Indicates whether you registered for tax.
    boolean? taxRegistered?;
    # The sales figures type of tax.
    AccountingMethodType? reportingBasis?;
    # The sales figures type of tax.
    SettingsAmountTaxStatus? amountTaxStatus?;
    # Default tax account ledger for sales.
    string? defaultSalesTaxLedgerAccount?;
    # Default tax account ledger for purchases.
    string? defaultPurchasesTaxLedgerAccount?;
    # Indicates whether allows users to edit tax amounts.
    boolean? taxAmountEditable?;
    # Indicates whether a user can choose if amounts include or exclude tax.
    boolean? chooseAmountTaxStatus?;
    # The BAS reporting preference details.
    record {*BasReportSettingsPatch;} basSettings?;
    # The email settings for tax.
    record {*EmailSettingsPatch;} emailSettings?;
};

# A response that contains the resource's type id and name.
public type TypeResponse record {
    # The resource's id.
    string? id?;
    # Reference to a type.
    record {*TypeRef;} 'type?;
};

# Role permissions for REST hooks.
public type RolePermissionsForRestHooks record {
    # Whether the role can modify REST hooks.
    boolean? modify;
};

# A role.
public type Role record {
    # The role's unique id.
    int? id;
    # The role's unique name.
    string? name?;
    # A description of the role.
    string? description?;
    # Whether or not the role is a system role.
    # System roles cannot be modified or deleted.
    boolean? systemRole;
    # The role's detailed permissions.
    record {*RolePermissions;} permissions?;
    # The users that are assigned to the role.
    UserRef[]? users?;
};

# The tax type.
public type TaxType record {
    # The tax type's id.
    string? id;
    # The description of the tax type.
    string? description?;
    # Whether this is a primary tax.
    boolean? isPrimary;
    # The system tax type.
    TaxSystemType? systemType;
};

# Details of a supplier to patch.
public type SupplierPatch record {
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # If the entity has other entity types.
    record {*EntityTypePatch;} entityTypes?;
    # If the supplier is Tpar.
    boolean? isTpar?;
    # The supplier's bank account details.
    record {*SupplierBankDetailsPatch;} bankDetails?;
};

# The email template.
public type EmailTemplate record {
    # Indicates whether includes CC by default when emailing.
    boolean? includeCc;
    # Default CC email address.
    string? ccAddress?;
    # Indicates whether includes BCC by default when emailing.
    boolean? includeBcc;
    # Default BCC email address.
    string? bccAddress?;
    # Default email subject.
    string? emailSubject?;
    # Default email content.
    string? emailContent?;
};

# The status of a payment term.
public type PaymentTermStatus string?;

# Details of a receipt line item to create or update.
public type ReceiptLineItemInput record {
    # The line number.
    int? lineNumber;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an invoice line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*ReceiptLineItemItemDetailsInput;} itemDetails?;
    # Details of an account used on an invoice line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*ReceiptLineItemAccountDetailsInput;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# Types of an invoice to create from, which can be an estimate, sales order and etc.
public type InvoiceConvertFromType string?;

# The sales figures type of tax.
public type SettingsAmountTaxStatus string?;

# Role permissions.
public type RolePermissions record {
    # Permissions for the Account Enquiry report.
    record {*RolePermissionsForReport;} accountEnquiryReport?;
    # Permissions for the Account List report.
    record {*RolePermissionsForReport;} accountListReport?;
    # Permissions for the Chart of Accounts.
    record {*RolePermissionsCommon;} accounts?;
    # Permissions for Activity Statements.
    record {*RolePermissionsWithPrintEmailLodge;} activityStatements?;
    # Permissions for the Aged Creditors summary report.
    record {*RolePermissionsForReport;} agedCreditorsSummaryReport?;
    # Permissions for the Aged Creditors transactions report.
    record {*RolePermissionsForReport;} agedCreditorsTransactionsReport?;
    # Permissions for the Aged Debtors summary report.
    record {*RolePermissionsForReport;} agedDebtorsSummaryReport?;
    # Permissions for the Aged Debtors transactions report.
    record {*RolePermissionsForReport;} agedDebtorsTransactionsReport?;
    # Permissions for the Balance Sheet report.
    record {*RolePermissionsForReport;} balanceSheetReport?;
    # Permissions for bank accounts.
    record {*RolePermissionsForBankAccounts;} bankAccounts?;
    # Permissions for bank payments.
    record {*RolePermissionsCommon;} bankPayments?;
    # Permissions for the Bank Reconciliation report.
    record {*RolePermissionsForReport;} bankReconciliationReport?;
    # Permissions for the Bank Statement report.
    record {*RolePermissionsForReport;} bankStatementReport?;
    # Permissions for bank transfers.
    record {*RolePermissionsCommon;} bankTransfers?;
    # Permissions for the Bill List report.
    record {*RolePermissionsForReport;} billListReport?;
    # Permissions for bills.
    record {*RolePermissionsWithPrintEmailApprove;} bills?;
    # Permissions for book settings.
    record {*RolePermissionsForSettings;} bookSettings?;
    # Permissions for budgets.
    record {*RolePermissionsCommon;} budgets?;
    # Permissions for the Budgets report.
    record {*RolePermissionsForReport;} budgetsReport?;
    # Permissions for classifications.
    record {*RolePermissionsCommon;} classifications?;
    # Permissions for contact detail types.
    record {*RolePermissionsCommon;} contactDetailTypes?;
    # Permissions for contacts.
    record {*RolePermissionsCommon;} contacts?;
    # Permissions for credit notes.
    record {*RolePermissionsWithPrintEmailApprove;} creditNotes?;
    # Permissions for the Customer List report.
    record {*RolePermissionsForReport;} customerListReport?;
    # Permissions for customers.
    record {*RolePermissionsCommon;} customers?;
    # Permissions for customer statements.
    record {*RolePermissionsForCustomerStatements;} customerStatements?;
    # Permssions for the Customer Transactions report.
    record {*RolePermissionsForReport;} customerTransactionsReport?;
    # Permissions for departments.
    record {*RolePermissionsCommon;} departments?;
    # Permissions for document storage.
    record {*RolePermissionsForDocumentStorage;} documentStorage?;
    # Permissions for emails.
    record {*RolePermissionsForEmails;} emails?;
    # Permissions for email settings.
    record {*RolePermissionsForSettings;} emailSettings?;
    # Permissions for employees.
    record {*RolePermissionsForEmployees;} employees?;
    # Permissions for the Employee List report.
    record {*RolePermissionsForReport;} employeeListReport?;
    # Permissions for the Estimate List report.
    record {*RolePermissionsForReport;} estimateListReport?;
    # Permissions for estimates.
    record {*RolePermissionsWithPrintEmail;} estimates?;
    # Permissions for the Expense Claim List report.
    record {*RolePermissionsForReport;} expenseClaimListReport?;
    # Permissions for expense claims.
    record {*RolePermissionsWithPrintEmailApproveManage;} expenseClaims?;
    # Permissions for expense claim settings.
    record {*RolePermissionsForSettings;} expenseClaimSettings?;
    # Permissions for the Expense Claim Transactions report.
    record {*RolePermissionsForReport;} expenseClaimTransactionsReport?;
    # Permissions for the GST Summary report.
    record {*RolePermissionsForReport;} gstSummaryReport?;
    # Permissions for the Invoice List report.
    record {*RolePermissionsForReport;} invoiceListReport?;
    # Permissions for invoices.
    record {*RolePermissionsWithPrintEmailApprove;} invoices?;
    # Permissions for the Item List report.
    record {*RolePermissionsForReport;} itemListReport?;
    # Permissions for items.
    record {*RolePermissionsCommon;} items?;
    # Permissions for the Journal List report.
    record {*RolePermissionsForReport;} journalListReport?;
    # Permissions for journals.
    record {*RolePermissionsWithPrintApprove;} journals?;
    # Permissions for the Ledger Transactions report.
    record {*RolePermissionsForReport;} ledgerTransactionsReport?;
    # Settings for money in settings (invoices, receipts, credit notes etc.).
    record {*RolePermissionsForSettings;} moneyInSettings?;
    # Permissions for money out settings (bills, payments, supplier credit notes etc.).
    record {*RolePermissionsForSettings;} moneyOutSettings?;
    # Permissions for the Payment List report.
    record {*RolePermissionsForReport;} paymentListReport?;
    # Permissions for payments.
    record {*RolePermissionsWithPrintEmail;} payments?;
    # Permissions for payroll adjustments.
    record {*RolePermissionsCommon;} payrollAdjustments?;
    # Permissions for the Payroll Detail report.
    record {*RolePermissionsForReport;} payrollDetailReport?;
    # Permissions for the Payroll Employee List report.
    record {*RolePermissionsForReport;} payrollEmployeeListReport?;
    # Permissions for payroll pay items.
    record {*RolePermissionsCommon;} payrollItems?;
    # Permissions for the Payroll Leave Balances report.
    record {*RolePermissionsForReport;} payrollLeaveBalancesReport?;
    # Permissions for payroll payments.
    record {*RolePermissionsCommon;} payrollPayments?;
    # Permissions for the Payroll Payment Schedule report.
    record {*RolePermissionsForReport;} payrollPaymentScheduleReport?;
    # Permissions for payroll settings.
    record {*RolePermissionsCommon;} payrollSettings?;
    # Permissions for the Payroll Summary report.
    record {*RolePermissionsForReport;} payrollSummaryReport?;
    # Permissions for the Payroll Transaction Summary report.
    record {*RolePermissionsForReport;} payrollTransactionSummaryReport?;
    # Permissions for payroll payment summaries.
    record {*RolePermissionsCommon;} payrollPaymentSummaries?;
    # Permissions for pay runs.
    record {*RolePermissionsWithApproveManage;} payruns?;
    # Permissions for pay slips.
    record {*RolePermissionsForPaySlips;} paySlips?;
    # Permissions for the Profit And Loss report.
    record {*RolePermissionsForReport;} profitAndLossReport?;
    # Permissions for the Project List report.
    record {*RolePermissionsForReport;} projectListReport?;
    # Permissions for projects.
    record {*RolePermissionsCommon;} projects?;
    # Permissions for the Receipts List report.
    record {*RolePermissionsForReport;} receiptListReport?;
    # Permissons for receipts.
    record {*RolePermissionsWithPrintEmail;} receipts?;
    # Permissions for recurring transactions.
    record {*RolePermissionsCommon;} recurringTransactions?;
    # Permissions for settings.
    record {*RolePermissionsForSettings;} reportSettings?;
    # Permissions for REST hooks.
    record {*RolePermissionsForRestHooks;} restHooks?;
    # Permissions for roles.
    record {*RolePermissionsCommon;} roles?;
    # Permissions for the Sales By Item report.
    record {*RolePermissionsForReport;} salesByItemReport?;
    # Permissions for Single Touch Payroll.
    record {*RolePermissionsForStp;} singleTouchPayroll?;
    # Permissions for statements.
    record {*RolePermissionsForSettings;} statementSettings?;
    # Permissions for the Super Contributions By Employee report.
    record {*RolePermissionsForReport;} superContributionsByEmployeeReport?;
    # Permissions for super funds.
    record {*RolePermissionsCommon;} superFunds?;
    # Permissions for SuperStream
    record {*RolePermissionsForSuperStream;} superStream?;
    # Permissions for the Super Transactions report.
    record {*RolePermissionsForReport;} superTransactionsReport?;
    # Permissions for supplier credit notes.
    record {*RolePermissionsWithPrintApprove;} supplierCreditNotes?;
    # Permissions for the Supplier List report.
    record {*RolePermissionsForReport;} supplierListReport?;
    # Permissions for suppliers.
    record {*RolePermissionsCommon;} suppliers?;
    # Permissions for the Supplier Transactions report.
    record {*RolePermissionsForReport;} supplierTransactionsReport?;
    # Permissions for the Tax Code Exception report.
    record {*RolePermissionsForReport;} taxCodeExceptionReport?;
    # Permissions for the Tax Code List report.
    record {*RolePermissionsForReport;} taxCodeListReport?;
    # Permissions for the Tax Code Transactions report.
    record {*RolePermissionsForReport;} taxCodeTransactionsReport?;
    # Permissions for tax settings.
    record {*RolePermissionsForTaxSettings;} taxSettings?;
    # Permissions for payment terms.
    record {*RolePermissionsCommon;} terms?;
    # Permissions for time entries.
    record {*RolePermissionsForTimeEntries;} timeEntries?;
    # Permissions for the Time Entries report.
    record {*RolePermissionsForReport;} timeEntriesReport?;
    # Permissions for time settings.
    record {*RolePermissionsForSettings;} timeSettings?;
    # Permissions for the Top 10 Customers report.
    record {*RolePermissionsForReport;} topCustomersReport?;
    # Permissions for the Top 10 Expense Accounts report.
    record {*RolePermissionsForReport;} topExpenseAccountsReport?;
    # Permissions for the Top 10 Income Accounts report.
    record {*RolePermissionsForReport;} topIncomeAccountsReport?;
    # Permissions for the Top 10 Suppliers report.
    record {*RolePermissionsForReport;} topSuppliersReport?;
    # Permissions for TPAR.
    record {*RolePermissionsWithPrintEmailLodge;} tpar?;
    # Permissions for the Transaction Line Items report.
    record {*RolePermissionsForReport;} transactionLineItemsReport?;
    # Permissions for the Trial Balance report.
    record {*RolePermissionsForReport;} trialBalanceReport?;
    # Permissions for the Uninvoiced Amounts By Customer report.
    record {*RolePermissionsForReport;} uninvoicedAmountsByCustomerReport?;
    # Permissions for the Uninvoiced Amounts By Project report.
    record {*RolePermissionsForReport;} uninvoicedAmountsByProjectReport?;
    # Permissions for the Uninvoiced Amounts By Customer report.
    record {*RolePermissionsForReport;} uninvoicedTransactionsByCustomerReport?;
    # Permissions for the Uninvoiced Amounts By Project report.
    record {*RolePermissionsForReport;} uninvoicedTransactionsByProjectReport?;
    # Permissions for users.
    record {*RolePermissionsForUsers;} users?;
    # Permissions for UK VAT.
    record {*RolePermissionsForVat;} vat?;
};

# Details of a project to create or update.
public type ProjectInput record {
    # Name of project.
    string? name;
    # The status of a project.
    ProjectStatus? status?;
    # The tax status of an item's amount.
    ProjectAmountTaxStatus? amountTaxStatus?;
    # The parent project.
    string? parentProject?;
    # The date the project starts.
    string? startDate?;
    # The date the project ends.
    string? endDate?;
    # A description of the project.
    string? description?;
    # Items used in the project.
    ProjectItemInput[]? items?;
    # Customers linked to the project.
    ProjectCustomerInput[]? customers?;
    # Suppliers linked to the project.
    ProjectSupplierInput[]? suppliers?;
};

# Status of user employee invitation.
public type UserEmployeeInvitationStatus string?;

# An address.
public type BookAddress record {
    # The address's unique id.
    string? id?;
    # The address type.
    record {*BookTypeRef;} 'type?;
    # First line of address.
    string? line1?;
    # Second line of address.
    string? line2?;
    # Third line of address.
    string? line3?;
    # Town of address.
    string? town?;
    # Suburb of address.
    string? suburb?;
    # State of address.
    string? state?;
    # Postcode of address.
    string? postcode?;
    # Country of address.
    string? country?;
};

# Common role permissions plus print and email actions.
public type RolePermissionsWithPrintEmail record {
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to email.
    boolean? email;
};

# A list of projects.
public type Projects record {
    # The list of items.
    Project[]? list?;
};

# A list of invoices.
public type Invoices record {
    # The list of items.
    Invoice[]? list?;
};

# A list of payment terms.
public type PaymentTerms record {
    # The list of items.
    PaymentTerm[]? list?;
};

# A response that contains the resource's id and display name.
public type IdNameResponse record {
    # The resource's id.
    string? id;
    # The resource's display name.
    string? name?;
};

# Transfer billable time settings to patch.
public type TransferBillableTimeSettingsPatch record {
    # Indicates whether to combine the item and the rate when transferring billable time.
    boolean? combineItemAndRate?;
    # Indicates whether to use time sheet entry notes as line item descriptions when transferring billable time separately.
    boolean? transferNotes?;
    # Indicates whether to use chargeable item descriptions as line item descriptions when transferring billable time separately.
    boolean? transferDescriptions?;
};

# Details of a customer to create or update.
public type CustomerInput record {
    # The organisation's display name.
    string? name;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # The customer's credit limit.
    decimal? creditLimit?;
    # The customer's payment term id.
    string? paymentTerms?;
};

# Details of an item to create or update.
public type ItemInput record {
    # The name of the item.
    string? name;
    # The parent item if there is one.
    string? parentItem?;
    # The item type.
    ItemType? itemType?;
    # The item code.
    string? itemCode?;
    # The status of an item.
    ItemStatus? status?;
    # Details for the item when it is purchased.
    record {*ItemUseInput;} purchase?;
    # Details for the item when it is sold.
    record {*ItemUseInput;} sale?;
    # The tax status of an item's amount.
    ItemAmountTaxStatus? amountTaxStatus;
};

# Details of an electronic address type to create or update.
public type ElectronicAddressTypeInput record {
    # The type's name.
    string? name;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};

# Response sent when a 404 Forbidden error occurs.
public type ErrorResponseNotFound record {
    # The description of the error.
    string? message?;
    # The HTTP status code of the error.
    int? code;
};

# Item usage details.
public type ItemUsePatch record {
    # The item's price.
    # If the item's `amountTaxStatus` is `Inclusive` then the price includes tax (gross).
    # If the item's `amountTaxStatus` is `Exclusive` then the price excludes tax (net).
    decimal? price?;
    # The accuracy (number of decimal places) of the price.
    int? priceAccuracy?;
    # The ledger account.
    string? ledgerAccount?;
    # The description.
    string? description?;
    # The tax rate.
    string? taxRate?;
};

# The payroll settings' ledgal contact details.
public type PayrollLegalContact record {
    # The first name of legal contact.
    string? firstName?;
    # The last name of legal contact.
    string? lastName?;
    # The legal contact's title.
    string? title?;
    # List of phone numbers.
    BookPhoneNumber[]? phoneNumbers?;
    # List of electronic addresses.
    BookElectronicAddress[]? electronicAddresses?;
};

# Reference to a recurring template.
public type RecurringTemplateRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of an invoice to create or update.
public type InvoiceInput record {
    # The customer that is being invoiced.
    string? customer;
    # The date of the invoice.
    string? invoiceDate;
    # The date payment is due by.
    string? dueDate?;
    # The invoice discount amount.
    decimal? invoiceDiscountAmount?;
    # The invoice discount percentage.
    decimal? invoiceDiscountPercent?;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # Payment terms.
    string? paymentTerms?;
    # The invoice reference.
    string? reference?;
    # The accounts receivable ledger account.
    # _Note:_ It is not currently possible to create multiple Accounts Receivable accounts so this field is read-only and will be ignored.
    string? accountsReceivableLedgerAccount?;
    # The classification.
    string? classification?;
    # The template used to print or email the invoice.
    string? template?;
    # The individual items that make up the invoice.
    InvoiceLineItemInput[]? lineItems?;
    # Notes related to the invoice.
    string? notes?;
    # Details of how to pay the invoice.
    string? paymentDetails?;
};

# Reference to a payment method.
public type PaymentMethodRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of a ledger account to create or update.
public type LedgerAccountInput record {
    # The name of the account.
    string? name;
    # The description of the account.
    string? description?;
    # The parent ledger account if there is one.
    string? parentLedgerAccount?;
    # The order in which the user would like to sort the account relative to other accounts.
    int? sortOrder?;
    # The status of a ledger account.
    LedgerAccountStatus? status?;
    # The default tax rate for the account.
    string? defaultTaxRate?;
    # The ledger account type.
    LedgerAccountType? accountType;
    # The account code.
    string? accountCode?;
    # The export code for the account.
    string? exportCode?;
    # The bank account details - **only** when the `accountType` is `CurrentAsset_Bank`.
    record {*LedgerAccountBankInput;} bankAccount?;
    # The credit account details - **only** when the `accountType` is `CurrentLiability_CreditCard`.
    record {*LedgerAccountCreditInput;} creditAccount?;
};

# Details of a superfund to create or update.
public type SuperfundDetailsInput record {
    # The superfundProvider details
    record {*SuperfundProviderInput;} superfundProvider?;
    # The SMSF provider details
    record {*SelfManagedSuperfundInput;} smsf?;
};

# Details of a transaction to link to a receipt.
public type ReceiptTransactionLinkInput record {
    # The unique id of the linked transaction.
    string? transactionId;
    # The transaction's amount.
    decimal? transactionAmount;
    # Type of transaction linked to an invoice.
    LinkedTransactionType? transactionType;
};

# A tax rate.
public type TaxRate record {
    # The tax rate's Id
    string? id;
    # The tax rate's name.
    string? name?;
    # The description of the tax rate.
    string? description?;
    # The rate of tax.
    decimal? rate;
    # The status of an accounting category.
    TaxStatus? status;
    # Whether the tax rate can be used on purchases.
    boolean? useOnPurchases;
    # Whether the tax rate can be used on sales.
    boolean? useOnSales;
};

# Details of a phone type to create or update.
public type PhoneTypePatch record {
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};

# BAS reporting preference details.
public type BasReportSettings record {
    # The BAS reporting period.
    string? reportingPeriodType?;
    # Indicates whether its a simpler BAS. Simpler BAS is only applicable for business reporting GST on Monthly, Annual or quarterly basis (option 1: Calculate GST and report quarterly).
    boolean? simplerBAS;
    # The sales figures type of tax.
    SettingsAmountTaxStatus? amountTaxStatus;
    # Indicates whether Fringe Benefits Tax (FBT) applies to the business.
    boolean? fbt;
    # Indicates whether Fuel Tax Credits (FTC) applies to the business.
    boolean? ftc;
    # Indicates whether Luxury Car Tax (LCT) applies to the business.
    boolean? lct;
    # Indicates whether Pay As You Go Income Tax Instalment (PAYG I) applies to the business. Pay PAYG instalment quarterly.
    boolean? paygiPayQuarterly;
    # Indicates whether Pay As You Go Income Tax Instalment (PAYG I) applies to the business. Calculate PAYG instalment using income times rate.
    boolean? paygiCalculateUsingIncomeTimesRate;
    # Indicates whether Pay As You Go Tax Withheld (PAYG W) applies to the business.
    boolean? paygw;
    # Indicates whether Wine Equalisation Tax (WET) applies to the business.
    boolean? wet;
};

# Business's industry details to patch.
public type IndustryTypeDetailPatch record {
    # Type of industry business belongs to.
    string? industry?;
    # Category of industry.
    string? category?;
    # Type of business activity within specified industry.
    string? businessType?;
};

# Reference to a user.
public type UserRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# A list of super fund providers.
public type SuperfundProviders record {
    # The list of items.
    SuperfundProvider[]? list?;
};

# Frequency end type for a recurring template.
public type FrequencyEndType string?;

# Reference to a tax rate.
public type TaxRateRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of an employee.
public type EmployeeInput record {
    # The employee's display name.
    string? name;
    # The employee's first name.
    string? firstName;
    # The employee's last name.
    string? surname;
    # Additional notes about the employee.
    string? notes?;
    # The employee's business number 1.
    string? businessNumber1?;
    # The employee's business number 2.
    string? businessNumber2?;
    # The status of a contact.
    ContactStatus? status?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
};

# Summary of a book's invoices.
public type InvoicesSummary record {
    # The total number of invoices.
    int? totalInvoiceCount;
    # The total monetary amount of included invoices.
    decimal? totalInvoiceAmount;
    # The total number of unpaid invoices.
    int? unpaidInvoiceCount;
    # The total monetary amount of unpaid invoices.
    decimal? unpaidInvoiceAmount;
    # The total number of unpaid invoices that are overdue.
    int? overdueInvoiceCount;
    # The total monetary amount of unpaid invoices that are overdue.
    decimal? overdueInvoiceAmount;
};

# The department being created or updated.
public type DepartmentInput record {
    # The department's unique name.
    string? name;
    # The department's unique code.
    string? code?;
    # The status of a department.
    DepartmentStatus? status;
    # Notes about the department.
    string? notes?;
    # A list of managers assigned to the department.
    DepartmentManagerInput[]? managers?;
    # A list of employees assigned to the department.
    DepartmentEmployeeInput[]? employees?;
};

# Contact's entity types.
public type EntityTypePatch record {
    # Is the entity a customer.
    boolean? isCustomer?;
    # Is the entity a supplier.
    boolean? isSupplier?;
    # Is the entity an employee.
    boolean? isEmployee?;
    # Is the entity a superfund.
    boolean? isSuperfund?;
};

# Invoice settings to patch.
public type InvoiceSettingsPatch record {
    # Indicates whether invoice approval is enabled.
    boolean? approvalEnabled;
    # The invoice prefix.
    string? prefix?;
    # The default invoice template.
    string? defaultTemplate?;
    # The number that will be used for the next invoice.
    int? nextInvoiceNumber;
    # The default payment details.
    string? defaultPaymentDetails?;
    # Indicates whether service date can be used on invoices.
    boolean? serviceDateOnInvoice;
    # Email settings.
    record {*EmailTemplatePatch;} emailSettings?;
};

# A payment term
public type PaymentTerm record {
    # The payment term's unique id.
    string? id;
    # The payment term's name.
    string? name?;
    # The payment term's description.
    string? description?;
    # The status of a payment term.
    PaymentTermStatus? status;
    # Whether the payment term is the default for the transaction type.
    boolean? isDefault;
    # Whether the payment term is used for invoice type transaction.
    boolean? useForInvoice;
    # Net Due day of the payment term.
    int? netDueDay;
    # Net due date options.
    NetDueDateOptions? netDueDaySelection;
    # Whether the due date falls on weekend. If due date is on a weekend, push due date to the first Monday.
    boolean? isDueDateWeekend;
    # Whether push invoice issue date to following month if invoice issued within x day(s) of the due date.
    boolean? isIssuedWithinDays;
    # Invoice issued within x day(s) of the due date
    int? issuedWithinDays;
};

# Details of an item used on a payment line item.
public type PaymentLineItemItemDetails record {
    # The id and full name of the item that the line relates to.
    record {*ItemRef;} item?;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# Reference to a financial institution.
public type FinancialInstitutionRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# An item linked to a project.
public type ProjectItem record {
    # Record identifier.
    string? lineId;
    # The item.
    record {*ItemRef;} item?;
    # Description of the linked item.
    string? description?;
    # Rate at which item is usually charged.
    decimal? regularRate?;
    # Rate at which item is charged for this project.
    decimal? projectRate?;
    # Tax rate of item.
    record {*TaxRateRef;} taxRate?;
};

# The book's tax email settings to patch.
public type EmailSettingsPatch record {
    # BAS default email settings.
    record {*EmailTemplatePatch;} bas?;
};

# Details of an item used on an expense claim line item.
public type ExpenseClaimLineItemItemDetailsInput record {
    # The id or full name of the item that the expense claim line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
};

# Details of a electronic address to update.
public type UpdateElectronicAddressInput record {
    # The electronic address.
    string? address?;
};

# Link to an organisation.
public type OrganisationRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# A list of receipts.
public type Receipts record {
    # The list of items.
    Receipt[]? list?;
};

# Details of a report definition.
public type ReportDefinition record {
    # The report's unique id.
    string? id;
    # The reports name.
    string? name?;
    # A description of the report.
    string? description?;
    # Whether the report is a favourite of the user.
    boolean? favourite;
    # Report categories.
    ReportCategory? category;
};

# Reference to an employee.
public type EmployeeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# The status of an item.
public type ItemStatus string?;

# An organisations superfund.
public type Superfund record {
    # The organisation's unique id.
    string? id;
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # The organisation's notes.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # The organisation's status (Active or Inactive).
    string? status?;
    # List of electronic addresses.
    ElectronicAddress[]? electronicAddresses?;
    # List of phone numbers.
    PhoneNumber[]? phoneNumbers?;
    # List of addresses.
    Address[]? addresses?;
    # The organisation's contacts list.
    ContactRef[]? contacts?;
    # The organisation's current balance.
    decimal? balance?;
    # The organisation's last modified date.
    string? lastModifiedDateTime;
    # The superfund's bank account details.
    record {*SuperfundBankDetails;} bankDetails?;
    # The superfund fund details
    record {*SuperfundDetails;} superfundDetails?;
    # The linked employee's.
    SuperfundEmployee[]? employees?;
};

# An invoice
public type Invoice record {
    # The invoice's unique id.
    string? id;
    # The invoice's number.
    string? invoiceNumber?;
    # The customer that was invoiced.
    record {*ContactRef;} customer?;
    # The address that the invoice was sent to.
    record {*Address;} billingAddress?;
    # The address that the invoice was sent to.
    record {*Address;} shippingAddress?;
    # The date of the invoice.
    string? invoiceDate;
    # The date payment is due by.
    string? dueDate?;
    # The total amount of the invoice.
    decimal? totalAmount;
    # The invoice discount amount.
    decimal? invoiceDiscountAmount?;
    # The invoice discount percentage.
    decimal? invoiceDiscountPercent?;
    # The balance that has not yet been paid by the customer.
    decimal? balance;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The total tax amount of the invoice.
    decimal? totalTaxAmount?;
    # The status of an invoice.
    InvoiceStatus? status;
    # Payment terms.
    record {*PaymentTermRef;} paymentTerms?;
    # The invoice reference.
    string? reference?;
    # The accounts receivable ledger account.
    record {*LedgerAccountRef;} accountsReceivableLedgerAccount?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # The template used to print or email the invoice.
    record {*TemplateRef;} template?;
    # Details of the recurring template.
    record {*RecurringTemplateRef;} recurringTemplate?;
    # Details of transactions (e.g. Estimates) that are linked to the invoice.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the invoice.
    InvoiceLineItem[]? lineItems?;
    # Notes related to the invoice.
    string? notes?;
    # Details of how to pay the invoice.
    string? paymentDetails?;
    # The status of an emailed invoice.
    EmailStatus? emailStatus;
};

# An address.
public type Address record {
    # The address's unique id.
    string? id?;
    # The address type.
    record {*AddressTypeRef;} 'type?;
    # Line 1 of the address.
    string? line1?;
    # Line 2 of the address.
    string? line2?;
    # Line 3 of the address.
    string? line3?;
    # The suburb.
    string? suburb?;
    # The town.
    string? town?;
    # The state.
    string? state?;
    # The post code.
    string? postcode?;
    # The country.
    string? country?;
};

# The item type.
public type ItemType string?;

# The status of an emailed invoice.
public type EmailStatus string?;

# A list of payments.
public type Payments record {
    # The list of items.
    Payment[]? list?;
};

# A list of users.
public type Users record {
    # The list of items.
    User[]? list?;
};

# Payment methods.
public type PaymentMethods record {
    # The list of items.
    PaymentMethod[]? list?;
};

# Common role permissions plus print, email and approve actions.
public type RolePermissionsWithPrintEmailApprove record {
    # Whether the role has permission to email.
    boolean? email;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to approve.
    boolean? approve;
};

# Time entry settings to patch.
public type TimeEntrySettingsPatch record {
    # Indicates whether time entry approval is enabled.
    boolean? approvalEnabled?;
    # The start time of a week.
    TimeStartOfWeek? firstDayOfWeek?;
    # The transfer billable time settings.
    record {*TransferBillableTimeSettingsPatch;} transferBillableTimeAs?;
};

# Details of an item.
public type Item record {
    # The item's unique id.
    string? id;
    # The name of the item.
    string? name?;
    # The parent item if there is one.
    record {*ItemRef;} parentItem?;
    # The item type.
    ItemType? itemType;
    # The item code.
    string? itemCode?;
    # The tax status of an item's amount.
    ItemAmountTaxStatus? amountTaxStatus;
    # The status of an item.
    ItemStatus? status;
    # The full name of the item.
    string? fullName?;
    # Details for the item when it is purchased.
    record {*ItemUse;} purchase?;
    # Details for the item when it is sold.
    record {*ItemUse;} sale?;
    # The date and time when the item was created.
    string? createdDateTime;
    # The date and time when the item was last modified.
    string? lastModifiedDateTime;
};

# Details of a contact to create or update.
public type ContactInput record {
    # The contact's display name.
    string? name;
    # The salutation to use in communications.
    string? salutation?;
    # The contact's department.
    string? department?;
    # The contact's position.
    string? position?;
    # The status of a contact.
    ContactStatus? status?;
    # Notes for the contact.
    string? notes?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
    # The id or name of the organisation that the contact is associated with.
    string? organisation?;
};

# Details of a book.
public type Book record {
    # The book's id.
    string? id;
    # The book's name.
    string? name?;
    # A book's status.
    BookStatus? status;
    # Book ownership.
    BookOwnership? ownership;
    # The book's country code.
    string? country?;
    # Whether book creation has been completed.
    boolean? bookCreated;
    # The products that are currently licensed.
    BookProduct[]? products?;
};

# A classification
public type Classification record {
    # The classification's unique id.
    string? id;
    # The classification's name.
    string? name?;
    # The classification's description.
    string? description?;
    # Classification status
    ClassificationStatus? status;
    # Whether the classification is the default for the transaction.
    boolean? isDefault;
};

# Details of a supplier's bank account.
public type SupplierBankDetails record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# A list of super funds.
public type Superfunds record {
    # The list of items.
    Superfund[]? list?;
};

# The sales figures type of tax.
public type AccountingMethodType string?;

# The start time of a week.
public type TimeStartOfWeek string?;

# Details of an electronic address type to create or update.
public type ElectronicAddressTypePatch record {
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};

# Details of an invoice to create from an estimate, sales order and etc.
public type InvoiceConvertFromInput record {
    # The Id of the object that needs to be converted into an invoice.
    string? id;
    # Types of an invoice to create from, which can be an estimate, sales order and etc.
    InvoiceConvertFromType? 'type;
};

# Employee belonging to department.
public type DepartmentEmployeeInput record {
    # An employee's Id.
    string? id;
};

# The status of a ledger account.
public type LedgerAccountStatus string?;

# Details of an estimate template.
public type EstimateTemplate record {
    # The template's id.
    string? id;
    # The template's name.
    string? name?;
    # The template's font.
    string? font?;
    # The template's font size.
    float? fontSize;
    # The header details of the template.
    record {*EstimateTemplateHeader;} header?;
    # The content's details of the template.
    record {*EstimateTemplateContent;} content?;
    # The footer details of the template.
    record {*EstimateTemplateFooter;} footer?;
};

# Details of a ledger account to patch.
public type LedgerAccountPatch record {
    # The name of the account.
    string? name?;
    # The description of the account.
    string? description?;
    # The parent ledger account if there is one.
    string? parentLedgerAccount?;
    # The order in which the user would like to sort the account relative to other accounts.
    int? sortOrder?;
    # The status of a ledger account.
    LedgerAccountStatus? status?;
    # The default tax rate for the account.
    string? defaultTaxRate?;
    # The account code.
    string? accountCode?;
    # The export code for the account.
    string? exportCode?;
    # The bank account details - **only** when the `accountType` is `CurrentAsset_Bank`.
    record {*LedgerAccountBankPatch;} bankAccount?;
    # The credit account details - **only** when the `accountType` is `CurrentLiability_CreditCard`.
    record {*LedgerAccountCreditPatch;} creditAccount?;
};

# A list of estimate templates.
public type EstimateTemplates record {
    # The list of items.
    EstimateTemplate[]? list?;
};

# Role permissions for Single Touch Payroll.
public type RolePermissionsForStp record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to send.
    boolean? send;
};

# Details of a contact to patch.
public type ContactPatch record {
    # The contact's display name.
    string? name?;
    # The salutation to use in communications.
    string? salutation?;
    # The contact's department.
    string? department?;
    # The contact's position.
    string? position?;
    # The id or name of the organisation that the contact is associated with.
    string? organisation?;
    # The status of a contact.
    ContactStatus? status?;
    # Notes for the contact.
    string? notes?;
};

# The tax status of an item's amount.
public type ItemAmountTaxStatus string?;

# The billable status.
public type BillableStatus string?;

# Details of an invoice template.
public type InvoiceTemplate record {
    # The template's id.
    string? id;
    # The template's name.
    string? name?;
    # The template's font.
    string? font?;
    # The template's font size.
    float? fontSize;
    # The header details of the template.
    record {*InvoiceTemplateHeader;} header?;
    # The content's details of the template.
    record {*InvoiceTemplateContent;} content?;
    # The footer details of the template.
    record {*InvoiceTemplateFooter;} footer?;
};

# Details of the header of an invoice template.
public type InvoiceTemplateHeader record {
    # Is CompanyName included in the template's header.
    boolean? companyName;
    # Is CompanyAddress included in the template's header.
    boolean? companyAddress;
    # Is TaxNumber included in the template's header.
    boolean? taxNumber;
    # Is PhoneNumber included in the template's header.
    boolean? phoneNumber;
    # Is Email included in the template's header.
    boolean? email;
    # Is Website included in the template's header.
    boolean? website;
    # Logo of the template's header.
    record {*Logo;} logo?;
    # Is InvoiceTo included in the template's header.
    boolean? invoiceTo;
    # Is ShipTo included in the template's header.
    boolean? shipTo;
    # Is InvoiceDate included in the template's header.
    boolean? invoiceDate;
    # Is InvoiceNumber included in the template's header.
    boolean? invoiceNumber;
    # Is DueDate included in the template's header.
    boolean? dueDate;
    # Is InvoiceDiscount included in the template's header.
    boolean? invoiceDiscount;
    # Is PaymentTerms included in the template's header.
    boolean? paymentTerms;
    # Is reference code included in the template's header.
    boolean? referenceCode;
    # Is custom text included in the template's header.
    boolean? customText;
    # The custom text value of the template's header.
    string? customTextValue?;
};

# Common role permissions plus print, email and lodge actions.
public type RolePermissionsWithPrintEmailLodge record {
    # Whether the role has permission to email.
    boolean? email;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to lodge.
    boolean? lodge;
};

# Credit note settings to patch.
public type CreditNoteSettingsPatch record {
    # The credit note prefix.
    string? prefix?;
    # The default credit note template.
    string? defaultTemplate?;
    # Email settings.
    record {*EmailTemplatePatch;} emailSettings?;
};

# Reference to an item.
public type ItemRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of a supplier's bank account to patch.
public type SupplierBankDetailsPatch record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# A book's payroll settings to patch.
public type PayrollSettingsPatch record {
    # The payroll settings' legal contact.
    record {*PayrollLegalContactPatch;} legalContact?;
    # The payroll setup details.
    record {*PayrollSetupPatch;} payrollSetup?;
    # The default payroll accounts.
    record {*PayrollDefaultAccountsPatch;} defaultAccounts?;
    # The default payroll payments.
    record {*PayrollDefaultPaymentsPatch;} defaultPayments?;
    # Indicates whether makes payroll salary and wages payments when users finish each pay run.
    boolean? automaticPayrollPayments?;
    # The default payroll bank accounts.
    record {*PayrollDefaultBankAccountsPatch;} defaultBankAccounts?;
};

# Details of an account used on a payment line item.
public type PaymentLineItemAccountDetails record {
    # The id and full name of the ledger account that the line relates to.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The quantity sold.
    decimal? quantity?;
    # The amount.
    decimal? amount?;
};

# Details of an account used on an expense claim line item.
public type ExpenseClaimLineItemAccountDetailsPatch record {
    # The id or full name of the ledger account that the expense claim line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount?;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the expense claim's `amountTaxStatus`).
    decimal? amount?;
};

# Receipt settings to patch.
public type ReceiptSettingsPatch record {
    # The receipt prefix.
    string? prefix?;
    # The default bank account.
    string? defaultBankAccount?;
    # Email settings.
    record {*EmailTemplatePatch;} emailSettings?;
};

# A response that contains the outcome of a document attachment request.
public type AddAttachmentResponse record {
    # The name of the document.
    string? fileName?;
    # The HTTP status code for this particular document.
    int? code;
    # The error message if a document could not be attached.
    string? _error?;
    # The attached document's id.
    string? id?;
    # The URL to retrieve the document.
    string? url?;
};

# The status of a department.
public type DepartmentStatus string?;

# The tax status of an item's amount.
public type ProjectAmountTaxStatus string?;

# An employee linked to a superfund.
public type SuperfundEmployee record {
    # Id of an employee.
    string? id;
    # Name of an employee.
    string? name?;
};

# An expense claim.
public type ExpenseClaim record {
    # The expense claim's unique id.
    string? id;
    # The expense claim's number.
    string? claimNumber?;
    # The employee who lodged the expense claim.
    record {*ContactRef;} employee?;
    # The date of the expense claim.
    string? claimDate;
    # The reference entered by the employee.
    string? reference?;
    # The project that the expense claim relates to.
    record {*ProjectRef;} project?;
    # The customer that the expense claim relates to.
    record {*ContactRef;} customer?;
    # The total amount of the expense claim.
    decimal? totalAmount;
    # The balance that has not yet been reimbursed to the employee.
    decimal? balance;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The total tax amount of the expense claim.
    decimal? totalTaxAmount?;
    # The status of an expense claim.
    ExpenseClaimStatus? status;
    # Details of transactions (e.g. payments) that are linked to the expense claim.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the expense claim.
    ExpenseClaimLineItem[]? lineItems?;
    # The notes entered by the employee.
    string? notes?;
    # When an expense claim has been declined, this field will provide the reason.
    string? declineReason?;
};

# Periods that can be used for the Payroll Leave Balances And Accrual Value report.
public type PayrollLeaveBalancesAndAccrualValueReportPeriod string?;

# Details of a supplier's bank account to create or update.
public type SupplierBankDetailsInput record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# The book's tax email settings.
public type EmailSettings record {
    # BAS default email settings.
    record {*EmailTemplate;} bas?;
};

# A document attachment.
public type DocumentAttachment record {
    # The attachment's unique id.
    string? id;
    # The attachment's name or file name.
    string? name?;
    # The URL to use to retrieve the attachment.
    string? url?;
};

# A list of credit notes.
public type CreditNotes record {
    # The list of items.
    CreditNote[]? list?;
};

# A book's payroll settings
public type PayrollSettings record {
    # The payroll settings' legal contact.
    record {*PayrollLegalContact;} legalContact?;
    # The payroll setup details.
    record {*PayrollSetup;} payrollSetup?;
    # The default payroll accounts.
    record {*PayrollDefaultAccounts;} defaultAccounts?;
    # The default payroll payments.
    record {*PayrollDefaultPayments;} defaultPayments?;
    # Indicates whether makes payroll salary and wages payments when users finish each pay run.
    boolean? automaticPayrollPayments;
    # The default payroll bank accounts.
    record {*PayrollDefaultBankAccounts;} defaultBankAccounts?;
};

# Details of the superfund to patch.
public type SuperfundPatch record {
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # If the entity has other entity types.
    record {*EntityTypePatch;} entityTypes?;
    # The superfund's bank account details.
    record {*SuperfundBankDetailsPatch;} bankDetails?;
    # The superfund's details.
    record {*SuperfundDetailsPatch;} superFundDetails?;
};

# Reference to a recurring transaction.
public type RecurringTransactionRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# The email template to patch.
public type EmailTemplatePatch record {
    # Indicates whether includes CC by default when emailing.
    boolean? includeCc?;
    # Default CC email address.
    string? ccAddress?;
    # Indicates whether includes BCC by default when emailing.
    boolean? includeBcc?;
    # Default BCC email address.
    string? bccAddress?;
    # Default email subject.
    string? emailSubject?;
    # Default email content.
    string? emailContent?;
};

# The status of a credit note.
public type CreditNoteStatus string?;

# Details of an account used on a receipt line item.
public type ReceiptLineItemAccountDetails record {
    # The id and full name of the ledger account that the line relates to.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The quantity sold.
    decimal? quantity?;
    # The amount.
    decimal? amount?;
};

# Details of a superfund's bank account to patch.
public type SuperfundBankDetailsPatch record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# Details of an electronic address type.
public type ElectronicAddressType record {
    # The type's id.
    string? id;
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status;
    # The creation UTC date time.
    string? createdDateTime;
    # The last modified UTC date time.
    string? lastModifiedDateTime;
};

# Reconciliation status.
public type ReconciliationStatus string?;

# Details of the content of an invoice template.
public type InvoiceTemplateContent record {
    # Is Project included in the template's content.
    boolean? project;
    # Is Item included in the template's content.
    boolean? item;
    # Is ItemPrice included in the template's content.
    boolean? itemPrice;
    # Is Description included in the template's content.
    boolean? description;
    # Is Quantity included in the template's content.
    boolean? quantity;
    # Is TaxCode included in the template's content.
    boolean? taxCode;
    # Is Tax included in the template's content.
    boolean? tax;
    # Is Amount included in the template's content.
    boolean? amount;
    # Is ServiceDate included in the template's content.
    boolean? serviceDate;
    # Is Account included in the template's content.
    boolean? account;
    # Is Discount included in the template's content.
    boolean? discount;
};

# Details of a ledger account.
public type LedgerAccount record {
    # The account's unique id.
    string? id;
    # The name of the account.
    string? name?;
    # The description of the account.
    string? description?;
    # The full name of the account.
    string? fullName?;
    # Whether amounts in this account are usually debits.
    boolean? isDebit;
    # The parent ledger account if there is one.
    record {*LedgerAccountRef;} parentLedgerAccount?;
    # The order in which the user would like to sort the account relative to other accounts.
    int? sortOrder;
    # The status of a ledger account.
    LedgerAccountStatus? status;
    # The default tax rate for the account.
    record {*TaxRef;} defaultTaxRate?;
    # The ledger account type.
    LedgerAccountType? accountType;
    # The account code.
    string? accountCode?;
    # The export code for the account.
    string? exportCode?;
    # The bank account details when the `accountType` is `CurrentAsset_Bank`.
    record {*BankAccount;} bankAccount?;
    # The credit account details when the `accountType` is `CurrentLiability_CreditCard`.
    record {*CreditAccount;} creditAccount?;
    # The account's balance as of now.
    decimal? balance?;
    # The date and time when the account was last modified.
    string? lastModifiedDateTime;
};

# Reference to a role.
public type RoleRef record {
    # The unique id.
    int? id?;
    # The unique name.
    string? name?;
};

# A credit note line item.
public type CreditNoteLineItem record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on a credit note line item.
    record {*CreditNoteLineItemItemDetails;} itemDetails?;
    # Details of an account used on a credit note line item.
    record {*CreditNoteLineItemAccountDetails;} accountDetails?;
    # The description of the item.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # The tax amount.
    decimal? taxAmount?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# Details of a superfund's bank account.
public type SuperfundBankDetails record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# Time details for a time entry being patched.
public type TimeDetailsPatch record {
    # The start time. Required if duration is not specified.
    string? startTime?;
    # The end time. Required if duration is not specified.
    string? endTime?;
    # The duration in minutes. Used if specified, otherwise calculated from startTime and endTime.
    int? duration?;
};

# A supplier.
public type Supplier record {
    # The organisation's unique id.
    string? id;
    # The organisation's display name.
    string? name?;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # The organisation's notes.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # The organisation's status (Active or Inactive).
    string? status?;
    # List of electronic addresses.
    ElectronicAddress[]? electronicAddresses?;
    # List of phone numbers.
    PhoneNumber[]? phoneNumbers?;
    # List of addresses.
    Address[]? addresses?;
    # The organisation's contacts list.
    ContactRef[]? contacts?;
    # The organisation's current balance.
    decimal? balance?;
    # The organisation's last modified date.
    string? lastModifiedDateTime;
    # If the supplier is Tpar (null for other types).
    boolean? isTpar?;
    # The total number of bills that have been received from the organisation.
    int? billCount?;
    # The supplier's bank account details.
    record {*SupplierBankDetails;} bankDetails?;
};

# Reference to a contact.
public type ContactRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Credit account details.
public type LedgerAccountCreditInput record {
    # When the credit account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The credit account's opening balance.
    decimal? openingBalance?;
};

# Books.
public type Books record {
    # The list of items.
    Book[]? list?;
};

# Details of an expense claim line item to create or update.
public type ExpenseClaimLineItemInput record {
    # The line number.
    int? lineNumber;
    # The date of the line item.
    string? date;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # The supplier that the line item relates to.
    string? supplier?;
    # The customer that the line item relates to.
    string? customer?;
    # Whether the line item is billable to the customer.
    boolean? isBillable?;
    # The billable status.
    BillableStatus? billableStatus?;
    # Details of an item used on an expense claim line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*ExpenseClaimLineItemItemDetailsInput;} itemDetails?;
    # Details of an account used on an expense claim line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*ExpenseClaimLineItemAccountDetailsInput;} accountDetails?;
    # The description of the expense.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
    # Notes relating to the expense.
    string? notes?;
};

# Basic business details
public type GeneralDetail record {
    # The company's business/trading name.
    string? companyName?;
    # The name of the company that appears on legal documents.
    string? legalName?;
    # The tax number of the company.
    string? taxNumber?;
    # The branch number associated with the tax number.
    string? branchNumber?;
};

# Details of a classification to create or update.
public type ClassificationInput record {
    # The classification's name.
    string? name;
    # The classification's description.
    string? description?;
    # Classification status
    ClassificationStatus? status?;
    # Whether the classification is the default for the transaction.
    boolean? isDefault?;
};

# Details of a project item to create or update.
public type ProjectItemInput record {
    # The id or name of the item.
    string? item;
    # Rate at which item is charged for this project.
    decimal? projectRate?;
};

# Details of a superfund to create or update.
public type SuperfundInput record {
    # The organisation's display name.
    string? name;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # The superfund's bank account details.
    record {*SuperfundBankDetailsInput;} bankDetails?;
    # The superfund's details.
    record {*SuperfundDetailsInput;} superFundDetails?;
};

# The current API status.
public type HeartbeatStatus record {
    # The status of the API.
    string? status?;
    # The current API version.
    string? 'version?;
    # The description of the API.
    string? description?;
};

# Common role permissions plus approve and manage actions.
public type RolePermissionsWithApproveManage record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to approve.
    boolean? approve;
    # Whether the role has permission to manage.
    boolean? manage;
};

# A list of tax groups.
public type TaxGroups record {
    # The list of items.
    TaxGroup[]? list?;
};

# Type of transaction linked to an invoice.
public type LinkedTransactionType string?;

# Business's industry details.
public type IndustryTypeDetail record {
    # Type of industry business belongs to.
    string? industry?;
    # Category of industry.
    string? category?;
    # Type of business activity within specified industry.
    string? businessType?;
};

# Details of the footer of an invoice template.
public type InvoiceTemplateFooter record {
    # Is Note included in the template's footer.
    boolean? note;
    # Is Subtotal included in the template's footer.
    boolean? subtotal;
    # Is TaxAmount included in the template's footer.
    boolean? taxAmount;
    # Is InvoiceDiscount included in the template's footer.
    boolean? invoiceDiscount;
    # Is BalanceDue included in the template's footer.
    boolean? balanceDue;
    # Is TotalExcludingTax included in the template's footer.
    boolean? totalExcludingTax;
    # Is HowToPay included in the template's footer.
    boolean? howToPay;
};

# The details of payroll default payments.
public type PayrollDefaultPayments record {
    # Rounding settings of payments.
    decimal? roundToNearest;
    # Expense account for rounding of cash payments.
    record {*LedgerAccountRef;} expenseAccountForRounding?;
};

# Reference to a payroll pay item.
public type PayItemRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of a superfund's bank account to create or update.
public type SuperfundBankDetailsInput record {
    # The bank account's name.
    string? name?;
    # The bank account's branch number.
    string? bankBranchNumber?;
    # The bank account's number.
    string? bankAccountNumber?;
};

# The status of a project.
public type ProjectStatus string?;

# Common role permissions plus print, email, approve and manage actions.
public type RolePermissionsWithPrintEmailApproveManage record {
    # Whether the role has permission to approve.
    boolean? approve;
    # Whether the role has permission to email.
    boolean? email;
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to manage.
    boolean? manage;
};

# The Payroll Leave Balances and Accrual report.
public type PayrollLeaveBalancesAndAccrualValueReport record {
    # The report's data.
    LeaveBalanceItem[]? data?;
    # Data about the report.
    record {*PayrollLeaveBalancesAndAccrualValueMetaData;} metaData?;
    # A message that might contain warnings or additional information about the report contents.
    string? message?;
};

# A receipt line item.
public type ReceiptLineItem record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on a receipt line item.
    record {*ReceiptLineItemItemDetails;} itemDetails?;
    # Details of an account used on a receipt line item.
    record {*ReceiptLineItemAccountDetails;} accountDetails?;
    # The description of the item.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # The tax amount.
    decimal? taxAmount?;
};

# Reference to a template.
public type TemplateTypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
    # The resource's type.
    string? 'type?;
};

# Recurring template status.
public type RecurringTemplateStatus string?;

# Reference to an electronic address type.
public type ElectronicAddressTypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of a project customer to patch.
public type ProjectCustomerPatch record {
    # The id or name of the customer.
    string? customer?;
};

# Reference to an address type.
public type AddressTypeRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Reference to a template.
public type TemplateRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# The ledger account type.
public type LedgerAccountType string?;

# The status of an invoice.
public type InvoiceStatus string?;

# Details of a project supplier to create or update.
public type ProjectSupplierInput record {
    # Weighting assigned to contact.
    decimal? weighting?;
    # The id or name of the supplier.
    string? supplier;
};

# Details of an electronic address to create or update.
public type ElectronicAddressInput record {
    # The id or name of the electronic address type.
    string? 'type;
    # The electronic address.
    string? address?;
};

# Details of an expense claim line item to patch.
public type ExpenseClaimLineItemPatch record {
    # The line number.
    int? lineNumber?;
    # The date of the line item.
    string? date?;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # The supplier that the line item relates to.
    string? supplier?;
    # The customer that the line item relates to.
    string? customer?;
    # Whether the line item is billable to the customer.
    boolean? isBillable?;
    # The billable status.
    BillableStatus? billableStatus?;
    # Details of an item used on an expense claim line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*ExpenseClaimLineItemItemDetailsPatch;} itemDetails?;
    # Details of an account used on an expense claim line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*ExpenseClaimLineItemAccountDetailsPatch;} accountDetails?;
    # The description of the expense.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
    # Notes relating to the expense.
    string? notes?;
};

# Role permissions for users.
public type RolePermissionsForUsers record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to edit another user's details.
    boolean? editOtherUser;
    # Whether the role has permission to invite a user.
    boolean? invite;
};

# The status of a super fund provider.
public type SuperfundProviderStatus string?;

# Details of the classification to patch.
public type ClassificationPatch record {
    # The classification's name.
    string? name?;
    # The classification's description.
    string? description?;
    # Classification status
    ClassificationStatus? status?;
    # Whether the classification is the default for the transaction.
    boolean? isDefault?;
};

# Details of a project customer to create or update.
public type ProjectCustomerInput record {
    # Weighting assigned to contact.
    decimal? weighting?;
    # The id or name of the customer.
    string? customer;
};

# Details of an address type to create or update.
public type AddressTypeInput record {
    # The type's name.
    string? name;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};

# A credit note.
public type CreditNote record {
    # The credit note's unique id.
    string? id;
    # The credit note's number.
    string? creditNoteNumber?;
    # The customer that the credit note was issued to.
    record {*ContactRef;} customer?;
    # The address that the credit note was sent to.
    record {*Address;} billingAddress?;
    # The address that the credit note was sent to.
    record {*Address;} shippingAddress?;
    # The date of the credit note.
    string? creditNoteDate;
    # The total amount of the credit note.
    decimal? totalAmount;
    # The balance that has not yet been paid by the customer.
    decimal? balance;
    # The tax status of an amount.
    AmountTaxStatus? amountTaxStatus;
    # The total tax amount of the credit note.
    decimal? totalTaxAmount?;
    # The status of a credit note.
    CreditNoteStatus? status;
    # The credit note reference.
    string? reference?;
    # The accounts receivable ledger account.
    record {*LedgerAccountRef;} accountsReceivableLedgerAccount?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # The template used to print or email the credit note.
    record {*TemplateRef;} template?;
    # Details of transactions (e.g. Invoices) that are linked to the credit note.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the credit note.
    CreditNoteLineItem[]? lineItems?;
    # Notes related to the credit note.
    string? notes?;
    # The status of an emailed invoice.
    EmailStatus? emailStatus;
};

# Details of a project item to patch.
public type ProjectItemPatch record {
    # The id or name of the item.
    string? item?;
    # Rate at which item is charged for this project.
    decimal? projectRate?;
};

# Details of an item used on an expense claim line item.
public type ExpenseClaimLineItemItemDetails record {
    # The id and full name of the item that the expense claim line relates to.
    record {*ItemRef;} item?;
    # The price of each item.
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
};

# An electronic address.
public type BookElectronicAddress record {
    # The electronic address's unique id.
    string? id?;
    # Type of electronic address.
    record {*BookTypeRef;} 'type?;
    # The electronic address.
    string? address?;
};

# Details of an item used on an expense claim line item.
public type ExpenseClaimLineItemItemDetailsPatch record {
    # The id or full name of the item that the expense claim line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The price of each item.
    decimal? price?;
    # The quantity sold.
    decimal? quantity?;
};

# A book's invoice settings.
public type InvoiceSettings record {
    # Indicates whether invoice approval is enabled.
    boolean? approvalEnabled;
    # The invoice prefix.
    string? prefix?;
    # The default invoice template.
    record {*TemplateRef;} defaultTemplate?;
    # The number that will be used for the next invoice.
    int? nextInvoiceNumber;
    # The default payment details.
    string? defaultPaymentDetails?;
    # Indicates whether service date can be used on invoices.
    boolean? serviceDateOnInvoice;
    # Email settings.
    record {*EmailTemplate;} emailSettings?;
};

# Details of a credit note line item to create or update.
public type CreditNoteLineItemPatch record {
    # The line number.
    int? lineNumber?;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an invoice line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*CreditNoteLineItemItemDetailsPatch;} itemDetails?;
    # Details of an account used on an invoice line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*CreditNoteLineItemAccountDetailsPatch;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# Electronic address types.
public type ElectronicAddressTypes record {
    # The list of items.
    ElectronicAddressType[]? list?;
};

# Details of a template.
public type Template record {
    # The template's id.
    string? id;
    # The template's name.
    string? name?;
    # The header detail of a template.
    record {*TemplateHeader;} header?;
};

# Details of a specific error.
public type ErrorDetail record {
    # The location/path of the source of the error.
    string? location?;
    # The description of what was wrong at this location.
    string? message?;
};

# A phone number.
public type BookPhoneNumber record {
    # The phone number's unique id.
    string? id?;
    # The type of phone number.
    record {*BookTypeRef;} 'type?;
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
};

# Details of a supplier to create or update.
public type SupplierInput record {
    # The organisation's display name.
    string? name;
    # The organisation's name.
    string? organisationName?;
    # The organisation's branch.
    string? branch?;
    # Notes for the organisation.
    string? notes?;
    # The organisation's business number 1.
    string? businessNumber1?;
    # The organisation's business number 2.
    string? businessNumber2?;
    # The status of the organisation. (Active/Inactive)
    string? status?;
    # List of addresses.
    AddressInput[]? addresses?;
    # List of phone numbers.
    PhoneNumberInput[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddressInput[]? electronicAddresses?;
    # The organisation's entity types.
    record {*EntityType;} entityTypes?;
    # If the supplier is Tpar.
    boolean? isTpar;
    # The supplier's bank account details.
    record {*SupplierBankDetailsInput;} bankDetails?;
};

# Common role permissions plus print and approve actions.
public type RolePermissionsWithPrintApprove record {
    # Whether the role has permission to print.
    boolean? print;
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to approve.
    boolean? approve;
};

# Reference to a ledger account.
public type LedgerAccountRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# A list of items.
public type Items record {
    # The list of items.
    Item[]? list?;
};

# Details of an email to send.
public type EmailInput record {
    # A list of "To" addresses.
    string[]? toAddresses?;
    # A list of "CC" addresses.
    string[]? ccAddresses?;
    # A list of "BCC" addresses.
    string[]? bccAddresses?;
    # The email subject.
    string? subject;
    # The email body.
    string? body;
    # The number of the document that the email relates to.
    string? documentNumber?;
};

# Details of a phone number to update.
public type PhoneNumberPatch record {
    # The country code.
    string? countryCode?;
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
    # The extension.
    string? extension?;
};

# Details of a recurring invoice line item.
public type RecurringInvoiceLineItemTemplateDetails record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The parent line item's unique id.
    string? parentLineId?;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on an invoice line item.
    record {*InvoiceLineItemItemDetails;} itemDetails?;
    # Details of an account used on an invoice line item.
    record {*InvoiceLineItemAccountDetails;} accountDetails?;
    # The description of the item.
    string? description?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # The tax amount.
    decimal? taxAmount?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# A response that contains the resource's id.
public type IdResponse record {
    # The resource's id.
    string? id;
};

# A receipt.
public type Receipt record {
    # The receipt's unique id.
    string? id;
    # The receipt's number.
    string? receiptNumber?;
    # The customer that made the payment.
    record {*ContactRef;} customer?;
    # The date of the receipt.
    string? receiptDate;
    # The id of the bank/cash/credit account where the money was received.
    record {*LedgerAccountRef;} ledgerAccount?;
    # Whether the full amount of the receipt has been allocated.
    boolean? allocateFullAmount;
    # The payment method.
    record {*PaymentMethodRef;} paymentMethod?;
    # The receipt reference.
    string? reference?;
    # Notes related to the receipt.
    string? notes?;
    # The total amount of the invoice.
    decimal? totalAmount;
    # Reconciliation status.
    ReconciliationStatus? reconciliationStatus;
    # Internal Notes related to the receipt.
    string? internalNotes?;
    # Details of the recurring transaction.
    record {*RecurringTransactionRef;} recurring?;
    # The accounts receivable ledger account.
    record {*LedgerAccountRef;} accountsReceivableLedgerAccount?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # Details of transactions that the receipt has been allocated to.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the receipt.
    ReceiptLineItem[]? lineItems?;
};

# Details of a credit account.
public type CreditAccount record {
    # When the account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The opening balance, if there is one.
    decimal? openingBalance?;
};

# Details of the content of a template.
public type EstimateTemplateContent record {
    # Is Project included in the template's content.
    boolean? project;
    # Is Item included in the template's content.
    boolean? item;
    # Is ItemPrice included in the template's content.
    boolean? itemPrice;
    # Is Description included in the template's content.
    boolean? description;
    # Is Quantity included in the template's content.
    boolean? quantity;
    # Is TaxCode included in the template's content.
    boolean? taxCode;
    # Is Tax included in the template's content.
    boolean? tax;
    # Is Amount included in the template's content.
    boolean? amount;
};

# Time entry billable status.
public type TimeEntryBillableStatus string?;

# Details of the header of an estimate template.
public type EstimateTemplateHeader record {
    # Is CompanyName included in the template's header.
    boolean? companyName;
    # Is CompanyAddress included in the template's header.
    boolean? companyAddress;
    # Is TaxNumber included in the template's header.
    boolean? taxNumber;
    # Is PhoneNumber included in the template's header.
    boolean? phoneNumber;
    # Is Email included in the template's header.
    boolean? email;
    # Is Website included in the template's header.
    boolean? website;
    # Logo of the template's header.
    record {*Logo;} logo?;
    # Is billing address included in the template's header.
    boolean? billingAddress;
    # Is shipping address included in the template's header.
    boolean? shippingAddress;
    # Is estimate date included in the template's header.
    boolean? estimateDate;
    # Is estimate number included in the template's header.
    boolean? estimateNumber;
    # Is expiry date included in the template's header.
    boolean? expiryDate;
    # Is reference code included in the template's header.
    boolean? referenceCode;
    # Is custom text included in the template's header.
    boolean? customText;
    # The custom text value of the template's header.
    string? customTextValue?;
};

# Tax reporting location.
public type TaxReportingLocation record {
    # The tax reporting location's id.
    string? id;
    # The tax code's id.
    string? taxCodeId?;
    # The tax group's id.
    string? taxGroupId?;
    # The location in the report.
    string? location?;
    # Whether it applies to purchases.
    boolean? appliesToPurchases;
    # Whether it applies to sales.
    boolean? appliesToSales;
    # The type of an amount.
    AmountType? reportAmountType;
    # Tax code reporting location.
    TaxCodeReportLocationType? reportLocationType;
};

# A list of document attachment responses.
public type AddAttachmentResponses record {
    # The list of responses for each document in the request.
    AddAttachmentResponse[]? list?;
};

# Superfund’s details to create or update
public type SuperfundProviderInput record {
    # The superfund provider id
    string? fund?;
    # APRA type employee number
    string? employerNumber?;
};

# Base details of the header of a template.
public type TemplateHeaderBase record {
    # Logo of the template's header.
    record {*Logo;} logo?;
};

# Contact's entity types.
public type EntityType record {
    # Is the entity a customer.
    boolean? isCustomer?;
    # Is the entity a suppleir.
    boolean? isSupplier?;
    # Is the entity an employee.
    boolean? isEmployee?;
    # Is the entity a superfund.
    boolean? isSuperfund?;
};

# A Payment.
public type Payment record {
    # The payments unique id.
    string? id;
    # The payments number.
    string? paymentNumber?;
    # The supplier that made the payment.
    record {*ContactRef;} supplier?;
    # The date of the payment.
    string? paymentDate;
    # The id of the bank/cash/credit account where the money was paid from.
    record {*LedgerAccountRef;} ledgerAccount?;
    # Whether the full amount of the payment has been allocated.
    boolean? allocateFullAmount;
    # The payment method.
    record {*PaymentMethodRef;} paymentMethod?;
    # The payment reference.
    string? reference?;
    # Notes related to the payment.
    string? notes?;
    # The total amount of the bill.
    decimal? totalAmount;
    # Reconciliation status.
    ReconciliationStatus? reconciliationStatus;
    # Internal Notes related to the payment.
    string? internalNotes?;
    # Details of the recurring transaction.
    record {*RecurringTransactionRef;} recurring?;
    # The accounts receivable ledger account.
    record {*LedgerAccountRef;} accountsPayableLedgerAccount?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # Details of transactions that the payment has been allocated to.
    TransactionLink[]? transactionLinks?;
    # The individual items that make up the payment.
    PaymentLineItem[]? lineItems?;
    # The last modified date of the payment
    string? lastModifiedDateTime;
};

# Role permissions for settings.
public type RolePermissionsForSettings record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
};

# Details of a phone type.
public type PhoneType record {
    # The type's id.
    string? id;
    # The type's name.
    string? name?;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status;
    # The creation UTC date time.
    string? createdDateTime;
    # The last modified UTC date time.
    string? lastModifiedDateTime;
};

# BAS report settings to patch.
public type BasReportSettingsPatch record {
    # The BAS reporting period.
    string? reportingPeriodType?;
    # Indicates whether its a simpler BAS. Simpler BAS is only applicable for business reporting GST on Monthly, Annual or quarterly basis (option 1: Calculate GST and report quarterly).
    boolean? simplerBAS?;
    # The sales figures type of tax.
    SettingsAmountTaxStatus? amountTaxStatus?;
    # Indicates whether Fringe Benefits Tax (FBT) applies to the business.
    boolean? fbt?;
    # Indicates whether Fuel Tax Credits (FTC) applies to the business.
    boolean? ftc?;
    # Indicates whether Luxury Car Tax (LCT) applies to the business.
    boolean? lct?;
    # Indicates whether Pay As You Go Income Tax Instalment (PAYG I) applies to the business. Pay PAYG instalment quarterly.
    boolean? paygiPayQuarterly?;
    # Indicates whether Pay As You Go Income Tax Instalment (PAYG I) applies to the business. Calculate PAYG instalment using income times rate.
    boolean? paygiCalculateUsingIncomeTimesRate?;
    # Indicates whether Pay As You Go Tax Withheld (PAYG W) applies to the business.
    boolean? paygw?;
    # Indicates whether Wine Equalisation Tax (WET) applies to the business.
    boolean? wet?;
};

# A list of customers.
public type Customers record {
    # The list of items.
    Customer[]? list?;
};

# A time entry.
public type TimeEntry record {
    # The time entry's id.
    string? id;
    # The employee.
    record {*EmployeeRef;} employee?;
    # The date of the time entry.
    string? timeEntryDate;
    # The project.
    record {*ProjectRef;} project?;
    # The customer.
    record {*OrganisationRef;} customer?;
    # The classification.
    record {*ClassificationRef;} classification?;
    # Whether the time entry is billable.
    boolean? billable;
    # Time entry billable status.
    TimeEntryBillableStatus? billableStatus;
    # Time entry approval status.
    TimeEntryApprovalStatus? approvalStatus;
    # The reason why a time entry has been declined.
    string? declineReason?;
    # The item.
    record {*ItemRef;} item?;
    # The payroll pay item.
    record {*PayItemRef;} payrollItem?;
    # Details of the time.
    record {*TimeDetails;} time?;
    # Notes.
    string? notes?;
    # Transactions linked to the time entry.
    TransactionLink[]? transactionLinks?;
};

# Details of a tax group.
public type TaxGroup record {
    # The tax group's id.
    string? id;
    # The tax group's name.
    string? name?;
    # The description of the tax group.
    string? description?;
    # The rate for the tax group.
    decimal? rate;
    # The export code for the tax group.
    string? exportCode?;
    # The status of an accounting category.
    TaxStatus? status;
    # Whether the tax group is used for purchases.
    boolean? useOnPurchases;
    # Whether the tax group is used for sales.
    boolean? useOnSales;
    # Tax codes assigned to the tax group.
    TaxCode[]? taxCodes?;
    # Locations where the tax group will be included in reports.
    TaxReportingLocation[]? reportingLocations?;
    # Accounts to use for purchases.
    LedgerAccount[]? purchaseTaxLedgerAccounts?;
    # Accounts to use for sales.
    LedgerAccount[]? saleTaxLedgerAccounts?;
    # Timestamp of when tax group record was last modified.
    string? lastModifiedDateTime;
};

# A book's credit note settings.
public type CreditNoteSettings record {
    # The invoice prefix.
    string? prefix?;
    # The default invoice template.
    record {*TemplateRef;} defaultTemplate?;
    # Email settings.
    record {*EmailTemplate;} emailSettings?;
};

# Details of a template.
public type CustomerStatementsTemplate record {
    # The template's id.
    string? id;
    # The template's name.
    string? name?;
    # The header detail of a template.
    record {*TemplateHeaderBase;} header?;
};

# Time details for a time entry being created or updated.
public type TimeDetailsInput record {
    # The start time. Required if duration is not specified.
    string? startTime?;
    # The end time. Required if duration is not specified.
    string? endTime?;
    # The duration in minutes. Used if specified, otherwise calculated from startTime and endTime.
    int? duration?;
};

# Details of a payment method.
public type PaymentMethod record {
    # The payment method's id.
    string? id;
    # The payment method's name.
    string? name?;
};

# Credit account details.
public type LedgerAccountCreditPatch record {
    # When the credit account was opened.
    string? dateOpened?;
    # The date when transactions are locked.
    # Transactions dated on or before this date cannot be amended.
    string? lockoffDate?;
    # The credit account's opening balance.
    decimal? openingBalance?;
};

# The status of an accounting category.
public type TaxStatus string?;

# Reference to a project.
public type ProjectRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# An expense claim line item.
public type ExpenseClaimLineItem record {
    # The line number.
    int? lineNumber;
    # The line item's unique id.
    string? lineId;
    # The date of the line item.
    string? date;
    # The id and full name of the project that the line item relates to.
    record {*ProjectRef;} project?;
    # Details of an item used on an expense claim line item.
    record {*ExpenseClaimLineItemItemDetails;} itemDetails?;
    # Details of an account used on an expense claim line item.
    record {*ExpenseClaimLineItemAccountDetails;} accountDetails?;
    # The supplier that the line item relates to.
    record {*ContactRef;} supplier?;
    # The customer that the line item relates to.
    record {*ContactRef;} customer?;
    # Whether the line item is billable to the customer.
    boolean? isBillable?;
    # The billable status.
    BillableStatus? billableStatus;
    # The description of the expense.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    record {*TaxRateRef;} taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
    # Notes relating to the expense.
    string? notes?;
    # Document attachments related to the expense.
    DocumentAttachment[]? attachments?;
};

# A user.
public type User record {
    # Then user's unique id.
    string? id;
    # The user's name.
    string? name?;
    # The user's email address.
    string? email?;
    # The user's unique Reckon Id.
    string? portalUserId?;
    # The user's employee reference.
    record {*EmployeeRef;} employee?;
    # List of roles user is assigned to.
    RoleRef[]? roles?;
    # Indicates whether this is the currently logged in user.
    boolean? currentUser;
    # The last time the user logged in.
    string? lastLoggedInDateTime?;
    # Status of user employee invitation.
    UserEmployeeInvitationStatus? invitationStatus;
};

# Details of an employee.
public type EmployeePatch record {
    # The employee's display name.
    string? name?;
    # The employee's first name.
    string? firstName?;
    # The employee's last name.
    string? surname?;
    # Additional notes about the employee.
    string? notes?;
    # The employee's business number 1.
    string? businessNumber1?;
    # The employee's business number 2.
    string? businessNumber2?;
    # The status of a contact.
    ContactStatus? status?;
};

# A list of employees.
public type Employees record {
    # The list of items.
    Employee[]? list?;
};

# Details of an account used on a credit note line item.
public type CreditNoteLineItemAccountDetails record {
    # The id and full name of the ledger account that the line relates to.
    record {*LedgerAccountRef;} ledgerAccount?;
    # The quantity sold.
    decimal? quantity?;
    # The amount.
    decimal? amount?;
};

# Response sent when a 415 Unsupported media type error occurs.
public type ErrorResponseUnsupportedMediaType record {
    # The description of the error.
    string? message?;
    # The HTTP status code of the error.
    int? code;
};

# Details of the footer of an estimate template.
public type EstimateTemplateFooter record {
    # Is Note included in the template's footer.
    boolean? note;
    # Is Subtotal included in the template's footer.
    boolean? subtotal;
    # Is TaxAmount included in the template's footer.
    boolean? taxAmount;
    # Is total excluding tax included in the template's footer.
    boolean? totalExcludingTax;
    # Is total included in the template's footer.
    boolean? total;
    # Is terms and conditions included in the template's footer.
    boolean? termsAndConditions;
    # Is payment notes included in the template's footer.
    boolean? paymentNotes;
    # Is signature included in the template's footer.
    boolean? signature;
};

# A super fund provider's product.
public type SuperfundProviderProduct record {
    # The super fund provider product's unique id.
    string? id;
    # The super fund provider product's name.
    string? name?;
    # The unique superannuation identifier (USI).
    string? usi?;
    # The superannuation product identification number (SPIN).
    string? spin?;
};

# Reference to a payment term.
public type PaymentTermRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of an account used on an expense claim line item.
public type ExpenseClaimLineItemAccountDetailsInput record {
    # The id or full name of the ledger account that the expense claim line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the expense claim's `amountTaxStatus`).
    decimal? amount?;
};

# Details of an account used on an invoice line item.
public type InvoiceLineItemAccountDetailsPatch record {
    # The id or full name of the ledger account that the invoice line relates to.
    # Note that the full name includes the name(s) of any parent account(s) separated by colons.
    string? ledgerAccount?;
    # The quantity purchased.
    decimal? quantity?;
    # The amount including or excluding tax (depending on the invoice's `amountTaxStatus`).
    decimal? amount?;
};

# Details of an item used on an invoice line item.
public type InvoiceLineItemItemDetailsInput record {
    # The id or full name of the item that the line relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item;
    # The price of each item including or excluding tax (depending on the `amountTaxStatus`).
    decimal? price?;
    # The quantity purchased.
    decimal? quantity?;
    # The total discount for the line item.
    decimal? discountAmount?;
    # The discount percentage for the line item.
    decimal? discountPercent?;
};

# The details of payroll default bank accounts to patch.
public type PayrollDefaultBankAccountsPatch record {
    # The direct credit payment bank account.
    string? directCreditPaymentsBankAccount?;
    # The cash payments account.
    string? cashPaymentsBankAccount?;
    # The super payment bank account.
    string? superPaymentsBankAccount?;
};

# Details of a tax code.
public type TaxCode record {
    # The tax code's id.
    string? id;
    # The tax code's name.
    string? name?;
    # The description of the tax code.
    string? description?;
    # The rate for the tax code.
    decimal? rate;
    # The ledger account to use for purchases.
    record {*LedgerAccount;} purchaseTaxLedgerAccount?;
    # The ledger account to use for sales.
    record {*LedgerAccount;} saleTaxLedgerAccount?;
    # Type of tax.
    record {*TaxType;} taxType?;
    # Whether the tax code is used for purchases.
    boolean? useCodeOnPurchases;
    # Whether the tax code is used for sales.
    boolean? useCodeOnSales;
    # Whether the tax code is used for European community goods (UK only).
    boolean? isCodeForEuropeanCommunityGoods?;
    # Whether the whole amount is tax.
    boolean? isWholeAmountTax;
};

# Role permissions for bank accounts.
public type RolePermissionsForBankAccounts record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
    # Whether the role has permission to import bank data.
    boolean? 'import;
    # Whether the role has permission to reconcile a bank account.
    boolean? reconcile;
};

# The parameters for the Payroll Leave Balances And Accrual Value report.
public type PayrollLeaveBalancesAndAccrualValueReportParameters record {
    # Periods that can be used for the Payroll Leave Balances And Accrual Value report.
    PayrollLeaveBalancesAndAccrualValueReportPeriod? period?;
    # When using AsAtDate, the date to use.
    string? asAtDate?;
    # A list of leave item IDs to include in the report.
    # If omitted, all leave items will be included.
    string[]? leaveItems?;
    # A list of employee IDs to include in the report.
    # If omitted, all employees will be included.
    string[]? employees?;
};

# Details of an address to update.
public type UpdateAddressInput record {
    # Line 1 of the address.
    string? line1?;
    # Line 2 of the address.
    string? line2?;
    # Line 3 of the address.
    string? line3?;
    # The suburb.
    string? suburb?;
    # The town.
    string? town?;
    # The state.
    string? state?;
    # The post code.
    string? postcode?;
    # The country.
    string? country?;
};

# Common role permissions.
public type RolePermissionsCommon record {
    # Whether the role has permission to view.
    boolean? view;
    # Whether the role has permission to create.
    boolean? create;
    # Whether the role has permission to edit/update/modify.
    boolean? edit;
    # Whether the role has permission to delete.
    boolean? delete;
};

# Details of an invoice line item to create or update.
public type InvoiceLineItemInput record {
    # The line number.
    int? lineNumber;
    # The date when the service was provided.
    string? serviceDate?;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an invoice line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*InvoiceLineItemItemDetailsInput;} itemDetails?;
    # Details of an account used on an invoice line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*InvoiceLineItemAccountDetailsInput;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
    # Whether the tax amount has been modified.
    boolean? taxIsModified?;
};

# Basic business details to patch.
public type GeneralDetailPatch record {
    # The company's business/trading name.
    string? companyName?;
    # The name of the company that appears on legal documents.
    string? legalName?;
    # The tax number of the company.
    string? taxNumber?;
    # The branch number associated with the tax number.
    string? branchNumber?;
};

# Details of a receipt line item to update.
public type ReceiptLineItemPatch record {
    # The line number.
    int? lineNumber?;
    # The id or full name of the project that the line item relates to.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # Details of an item used on an receipt line item.
    # This must be omitted if `accountDetails` have been provided.
    record {*ReceiptLineItemItemDetailsPatch;} itemDetails?;
    # Details of an account used on an receipt line item.
    # This must be omitted if `itemDetails` have been provided.
    record {*ReceiptLineItemAccountDetailsPatch;} accountDetails?;
    # The description of the line.
    string? description?;
    # The tax amount.
    decimal? taxAmount?;
    # The tax rate.
    string? taxRate?;
};

# A list of departments.
public type Departments record {
    # The list of items.
    Department[]? list?;
};

# A book's time entry settings.
public type TimeEntrySettings record {
    # Indicates whether time entry approval is enabled.
    boolean? approvalEnabled;
    # The start time of a week.
    TimeStartOfWeek? firstDayOfWeek;
    # The transfer billable time settings.
    record {*TransferBillableTimeSettings;} transferBillableTimeAs?;
};

# Selected fields to update in receipt's transaction link.
public type ReceiptTransactionLinkPatch record {
    # The transaction's amount.
    decimal? transactionAmount;
};

# A supplier linked to a project.
public type ProjectSupplier record {
    # Record identifier.
    string? lineId;
    # The supplier.
    record {*ContactRef;} supplier?;
    # Weighting.
    decimal? weighting;
};

# A list of a super fund provider's products.
public type SuperfundProviderProducts record {
    # The list of items.
    SuperfundProviderProduct[]? list?;
};

# Reports
public type Reports record {
    # The list of items.
    ReportDefinition[]? list?;
};

# Frequency period for a recurring template.
public type FrequencyPeriod string?;

# Manager belonging to department.
public type DepartmentManagerInput record {
    # A manager's Id.
    string? id;
};

# Reference to a tax rate.
public type TaxRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# A contact.
public type Contact record {
    # The contact's unique id.
    string? id;
    # The contact's display name.
    string? name?;
    # The salutation to use in communications.
    string? salutation?;
    # The contact's department.
    string? department?;
    # The contact's position.
    string? position?;
    # The organisation that the contact is associated with.
    record {*OrganisationRef;} organisation?;
    # The status of a contact.
    ContactStatus? status;
    # Notes for the contact.
    string? notes?;
    # List of addresses.
    Address[]? addresses?;
    # List of phone numbers.
    PhoneNumber[]? phoneNumbers?;
    # List of electronic addresses.
    ElectronicAddress[]? electronicAddresses?;
};

# Details of a logo.
public type Logo record {
    # Name of the logo.
    string? name?;
    # Url of the logo.
    string? url?;
};

# A book's status.
public type BookStatus string?;

# Details of a time entry to patch.
public type TimeEntryPatch record {
    # The id or name of the employee that spent the time.
    string? employee?;
    # Date of the time entry.
    string? timeEntryDate;
    # The id or full name of the project on which the time was spent on.
    # Note that the full name includes the name(s) of any parent project(s) separated by colons.
    string? project?;
    # The id or name of the customer for whom the time was spent on.
    string? customer?;
    # The id or name of the classification.
    string? classification?;
    # Whether the time can be billed to a customer.
    boolean? billable?;
    # Time entry approval status.
    TimeEntryApprovalStatus? approvalStatus;
    # The id or full name of the item that the time entry relates to.
    # Note that the full name includes the name(s) of any parent item(s) separated by colons.
    string? item?;
    # The id or full name of the payroll pay item that the time entry relates to.
    string? payrollItem?;
    # Details of the time spent.
    record {*TimeDetailsPatch;} time?;
    # Notes related to the time entry.
    string? notes?;
    # Reason why time entry approval was declined.
    string? declineReason?;
};

# A phone number.
public type BookPhoneNumberPatch record {
    # The area code.
    string? areaCode?;
    # The number.
    string? number?;
};

# An electronic address.
public type BookElectronicAddressPatch record {
    # The electronic address.
    string? address?;
};

# Address types.
public type AddressTypes record {
    # The list of items.
    AddressType[]? list?;
};

# Details of a book product.
public type BookProduct record {
    # The products's id.
    string? id;
    # The product's name.
    string? name?;
    # The Portal's product id.
    string? portalProductId?;
};

# A list of financial institutions.
public type FinancialInstitutions record {
    # The list of financial institutions.
    FinancialInstitution[]? list?;
};

# Details of a superfund to patch.
public type SuperfundDetailsPatch record {
    # The superfundProvider details
    record {*SuperfundProviderPatch;} superfundProvider?;
    # The SMSF provider details
    record {*SelfManagedSuperfundPatch;} smsf?;
};

# Details of an invoice to patch.
public type InvoicePatch record {
    # The customer that is being invoiced.
    string? customer?;
    # The date of the invoice.
    string? invoiceDate?;
    # The date payment is due by.
    string? dueDate?;
    # The invoice discount amount.
    decimal? invoiceDiscountAmount?;
    # The invoice discount percentage.
    decimal? invoiceDiscountPercent?;
    # The status of an invoice.
    InvoiceStatus? status?;
    # Payment terms.
    string? paymentTerms?;
    # The invoice reference.
    string? reference?;
    # The accounts receivable ledger account.
    # _Note:_ It is not currently possible to create multiple Accounts Receivable accounts so this field is read-only and will be ignored.
    string? accountsReceivableLedgerAccount?;
    # The classification.
    string? classification?;
    # The template used to print or email the invoice.
    string? template?;
    # Notes related to the invoice.
    string? notes?;
    # Details of how to pay the invoice.
    string? paymentDetails?;
};

# Recurring invoice template.
public type RecurringInvoiceTemplate record {
    # The recurring template's unique id.
    string? id;
    # The recurring template's name.
    string? name?;
    # The number of days, weeks or months between each occurrence.
    int? frequencyQuantity;
    # Frequency period for a recurring template.
    FrequencyPeriod? frequencyPeriod;
    # The date of the first occurrence.
    string? startDate;
    # Frequency end type for a recurring template.
    FrequencyEndType? endOfSchedule;
    # Ends once the defined number of occurrences have occurred.
    int? endAfterOccurrences?;
    # Ends once the defined date has been reached.
    string? endAfterDate?;
    # Whether to always use the last day of each month for each occurrence.
    boolean? useLastDayOfEachMonth;
    # The number of occurrences remaining.
    int? numberOfOccurrencesRemaining?;
    # The date of the next occurrence.
    string? nextTransactionDate?;
    # Recurring template status.
    RecurringTemplateStatus? status;
    # Whether to automatically email each occurrence.
    boolean? emailAutomatically;
    # Details of the recurring invoice.
    record {*RecurringInvoiceTemplateDetails;} invoice?;
};

# Details of a book's general settings to patch.
public type BookSettingsPatch record {
    # The first day of records for the book.
    string? startDate?;
    # Transactions on or before this date cannot be changed.
    string? lockOffDate?;
    # Entity type of business.
    string? entityType?;
    # Industry details of business.
    record {*IndustryTypeDetailPatch;} industryType?;
    # The email address used by clients when replying to emails sent from Reckon One.
    string? replyToEmailAddress?;
    # The displayed name of sender in emails.
    string? showEmailSentFrom?;
    # The number of most recent days bank data is retrieved for.
    int? bankDataRetrievalDays?;
    # General company details
    record {*GeneralDetailPatch;} generalDetails?;
    # Business's contact details.
    record {*ContactDetailPatch;} contactDetails?;
};

# Item usage details.
public type ItemUseInput record {
    # The item's price.
    # If the item's `amountTaxStatus` is `Inclusive` then the price includes tax (gross).
    # If the item's `amountTaxStatus` is `Exclusive` then the price excludes tax (net).
    decimal? price?;
    # The accuracy (number of decimal places) of the price.
    int? priceAccuracy?;
    # The ledger account.
    string? ledgerAccount;
    # The description.
    string? description?;
    # The tax rate.
    string? taxRate?;
};

# Reference to a classification.
public type ClassificationRef record {
    # The unique id.
    string? id?;
    # The unique name.
    string? name?;
};

# Details of a phone type to create or update.
public type PhoneTypeInput record {
    # The type's name.
    string? name;
    # The type's description.
    string? description?;
    # Type status.
    TypeStatus? status?;
};
