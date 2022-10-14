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

public type Account record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # User recognizable name for the Account. Account.Name attribute must not contain double quotes (") or colon (:).
    string Name?;
    # Version number of the object. It is used to lock an object for use by one app at a time. - As soon as an application modifies an object, its SyncToken is incremented. - Attempts to modify an object specifying an older SyncToken fails. - Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # User-defined account number to help the user in identifying the account within the chart-of-accounts and in deciding what should be posted to the account. The Account.AcctNum attribute must not contain colon (:). * Name must be unique. * For French Locales - - Length must be between 6 and 20 characters - Must start with the account number from the master category list. - Name limited to alpha-numeric characters. * Max length for Account.AcctNum - - AU & CA- 20 characters. - US, UK & IN- 7 characters
    string AcctNum?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Specifies the Parent AccountId if this represents a SubAccount.
    AccountParentref ParentRef?;
    # User entered description for the account, which may include user entered information to guide bookkeepers/accountants in deciding what journal entries to post to the account.
    string Description?;
    # Whether or not active inactive accounts may be hidden from most display purposes and may not be posted to.
    boolean Active?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Specifies whether this object represents a parent (false) or subaccount (true). - Note that accounts of these types - OpeningBalanceEquity, UndepositedFunds, RetainedEarnings, CashReceiptIncome, CashExpenditureExpense, ExchangeGainOrLoss cannot have a sub account and cannot be a sub account of another account.
    boolean SubAccount?;
    # The classification of an account. Not supported for non-posting accounts. - Valid values include- Asset, Equity, Expense, Liability, Revenue
    string Classification?;
    # Fully qualified name of the object; derived from Name and ParentRef. - The fully qualified name prepends the topmost parent, followed by each subaccount separated by colons and takes the form of Parent:Account1:SubAccount1:SubAccount2. System generated. Limited to 5 levels.
    string FullyQualifiedName?;
    # The account location. * Valid values include - WithinFrance - FranceOverseas - OutsideFranceWithEU - OutsideEU * For France locales, only.
    string TxnLocationType?;
    # A detailed account classification that specifies the use of this account. The type is based on the Classification.
    string AccountType?;
    # Specifies the cumulative balance amount for the current Account and all its sub-accounts.
    decimal CurrentBalanceWithSubAccounts?;
    # A user friendly name for the account. - It must be unique across all account categories. - For example, if an account is created under category 211 with AccountAlias of Terrains, then the system does not allow creation of an account with same AccountAlias of Terrains for any other category except 211. - In other words, 211001 and 215001 accounts cannot have same AccountAlias because both belong to different account category. - For France locales, only.
    string AccountAlias?;
    # Reference type
    ReferenceType TaxCodeRef?;
    # The account sub-type classification and is based on the AccountType value.
    string AccountSubType?;
    # Specifies the balance amount for the current Account. Valid for Balance Sheet accounts.
    decimal CurrentBalance?;
};

public type Estimate record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Reference type
    ReferenceType CustomerRef?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Email address
    EmailAddress BillEmail?;
    # The date entered by the user when this transaction occurred. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Physical address
    PhysicalAddress ShipFromAddr?;
    # Date for delivery of goods or services.
    string ShipDate?;
    # Reference type
    ReferenceType ClassRef?;
    # Printing status of the invoice. Valid values- NotSet, NeedToPrint, PrintComplete .
    string PrintStatus?;
    # One of, up to three custom fields for the transaction. Available for custom fields so configured for the company. Check Preferences.SalesFormsPrefs.CustomField and Preferences.VendorAndPurchasesPrefs.POCustomField for custom fields currenly configured. Click here to learn about managing custom fields.
    record {} CustomField?;
    # Reference type
    ReferenceType SalesTermRef?;
    # One of the following status settings- Accepted, Closed, Pending, Rejected, Converted
    string TxnStatus?;
    # Zero or more Invoice objects related to this transaction. Use LinkedTxn.TxnId as the ID in a separate Invoice read request to retrieve details of the linked object.
    LinkedTxn[] LinkedTxn?;
    # TaxExcluded Method in which tax is applied. Allowed values are- TaxExcluded, TaxInclusive, and NotApplicable.
    string GlobalTaxCalculation?;
    # Date estimate was accepted.
    string AcceptedDate?;
    # Date by which estimate must be accepted before invalidation.
    string ExpirationDate?;
    # The account location. Valid values include- - WithinFrance - FranceOverseas - OutsideFranceWithEU - OutsideEU - For France locales, only.
    string TransactionLocationType?;
    # Date when the payment of the transaction is due. If date is not provided, the number of days specified in SalesTermRef added the transaction date will be used.
    string DueDate?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Reference number for the transaction. If not explicitly provided at create time, this field is populated based on the setting of Preferences:CustomTxnNumber as follows- If Preferences:CustomTxnNumber is true a custom value can be provided. If no value is supplied, the resulting DocNumber is null. If Preferences:CustomTxnNumber is false, resulting DocNumber is system generated by incrementing the last number by 1. If Preferences:CustomTxnNumber is false then do not send a value as it can lead to unwanted duplicates. If a DocNumber value is sent for an Update operation, then it just updates that particular invoice and does not alter the internal system DocNumber. Note- DocNumber is an optional field for all locales except France. For France locale if Preferences:CustomTxnNumber is enabled it will not be automatically generated and is a required field.
    string DocNumber?;
    # User entered, organization-private note about the transaction. This note does not appear on the invoice to the customer. This field maps to the Memo field on the Invoice form.
    string PrivateNote?;
    # Individual line items of a transaction. Valid Line types include- SalesItemLine, GroupLine, DescriptionOnlyLine (also used for inline Subtotal lines), DiscountLine and SubTotalLine (used for the overall transaction)
    anydata[] Line?;
    MemoRef CustomerMemo?;
    # Email status of the invoice. Valid values- NotSet, NeedToSend, EmailSent
    string EmailStatus?;
    # This data type provides information for taxes charged on the transaction as a whole. It captures the details sales taxes calculated for the transaction based on the tax codes referenced by the transaction. This can be calculated by QuickBooks business logic or you may supply it when adding a transaction. See Global tax model for more information about this element. If sales tax is disabled (Preferences.TaxPrefs.UsingSalesTax is set to false) then TxnTaxDetail is ignored and not stored.
    record {} TxnTaxDetail?;
    # Name of customer who accepted the estimate.
    string AcceptedBy?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company.
    decimal ExchangeRate?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType DepartmentRef?;
    # Reference type
    ReferenceType ShipMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If false or null, calculate the sales tax first, and then apply the discount. If true, subtract the discount first and then calculate the sales tax.
    boolean ApplyTaxAfterDiscount?;
    # Indicates the total amount of the transaction. This includes the total of all the charges, allowances, and taxes. Calculated by QuickBooks business logic; any value you supply is over-written by QuickBooks.
    decimal TotalAmt?;
    # Reference type
    ReferenceType RecurDataRef?;
    # Reference type
    ReferenceType TaxExemptionRef?;
    # Total amount of the transaction in the home currency. Includes the total of all the charges, allowances and taxes. Calculated by QuickBooks business logic. Value is valid only when CurrencyRef is specified. Applicable if multicurrency is enabled for the company.
    decimal HomeTotalAmt?;
    # Denotes how ShipAddr is stored- formatted or unformatted. The value of this flag is system defined based on format of shipping address at object create time. If set to false, shipping address is returned in a formatted style using City, Country, CountrySubDivisionCode, Postal code. If set to true, shipping address is returned in an unformatted style using Line1 through Line5 attributes.
    boolean FreeFormAddress?;
};

public type Invoice record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Individual line items of a transaction. Valid Line types include SalesItemLine, GroupLine, DescriptionOnlyLine (also used for inline Subtotal lines), DiscountLine and SubTotalLine (used for the overall transaction)
    anydata[] Line?;
    # Reference type
    ReferenceType CustomerRef?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Reference number for the transaction. If not explicitly provided at create time, this field is populated based on the setting of Preferences:CustomTxnNumber as follows- If Preferences:CustomTxnNumber is true a custom value can be provided. If no value is supplied, the resulting DocNumber is null. If Preferences:CustomTxnNumber is false, resulting DocNumber is system generated by incrementing the last number by 1. If Preferences:CustomTxnNumber is false then do not send a value as it can lead to unwanted duplicates. If a DocNumber value is sent for an Update operation, then it just updates that particular invoice and does not alter the internal system DocNumber. Note- DocNumber is an optional field for all locales except France. For France locale if Preferences:CustomTxnNumber is enabled it will not be automatically generated and is a required field. If a duplicate DocNumber needs to be supplied, add the query parameter name/value pair, include=allowduplicatedocnum to the URI.
    string DocNumber?;
    # Email address
    EmailAddress BillEmail?;
    # The date entered by the user when this transaction occurred. yyyy/MM/dd is the valid date format. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Physical address
    PhysicalAddress ShipFromAddr?;
    # Date for delivery of goods or services.
    string ShipDate?;
    # Shipping provider's tracking number for the delivery of the goods associated with the transaction.
    string TrackingNum?;
    # Reference type
    ReferenceType ClassRef?;
    # Printing status of the invoice. Valid values- NotSet, NeedToPrint, PrintComplete .
    string PrintStatus?;
    # Reference type
    ReferenceType SalesTermRef?;
    # Used internally to specify originating source of a credit card transaction.
    string TxnSource?;
    # Zero or more related transactions to this Invoice object. The following linked relationships are supported- Links to Estimate and TimeActivity objects can be established directly to this Invoice object with UI or with the API. Create, Read, Update, and Query operations are avaialble at the API level for these types of links. Only one link can be made to an Estimate. Progress Invoicing is not supported via the API. Links to expenses incurred on behalf of the customer are returned in the response with LinkedTxn.TxnType set to ReimburseCharge, ChargeCredit or StatementCharge corresponding to billable customer expenses of type Cash, Delayed Credit, and Delayed Charge, respectively. Links to these types of transactions are established within the QuickBooks UI, only, and are available as read-only at the API level. Links to payments applied to an Invoice object are returned in the response with LinkedTxn.TxnType set to Payment. Links to Payment transactions are established within the QuickBooks UI, only, and are available as read-only at the API level. Use LinkedTxn.TxnId as the ID in a separate read request for the specific resource to retrieve details of the linked object.
    anydata[] LinkedTxn?;
    # Reference type
    ReferenceType DepositToAccountRef?;
    # Method in which tax is applied. Allowed values are- TaxExcluded, TaxInclusive, and NotApplicable.
    string GlobalTaxCalculation?;
    # Specifies if this invoice can be paid with online bank transfers and corresponds to the Free bank transfer online payment check box on the QuickBooks UI. Active when Preferences.SalesFormsPrefs.ETransactionPaymentEnabled is set to true. If set to true, allow invoice to be paid with online bank transfers. The Free bank transfer online payment check box is checked on the QuickBooks UI for this invoice. If set to false, online bank transfers are not allowed. The Free bank transfer online payment check box is not checked on the QuickBooks UI for this invoice.
    boolean AllowOnlineACHPayment?;
    # The account location. For France locale valid values include- WithinFrance FranceOverseas OutsideFranceWithEU OutsideEU For UAE, valid values include ABUDHABI AJMAN SHARJAH DUBAI FUJAIRAH RAS_AL_KHAIMAH UMM_AL_QUWAIN OTHER_GCC
    string TransactionLocationType?;
    # Date when the payment of the transaction is due. If date is not provided, the number of days specified in SalesTermRef added the transaction date will be used.
    string DueDate?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # User entered, organization-private note about the transaction. This note does not appear on the invoice to the customer. This field maps to the Statement Memo field on the Invoice form in the QuickBooks Online UI.
    string PrivateNote?;
    # Email address
    EmailAddress BillEmailCc?;
    MemoRef CustomerMemo?;
    # Email status of the invoice. Valid values- NotSet, NeedToSend, EmailSent
    string EmailStatus?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company.
    decimal ExchangeRate?;
    # The deposit made towards this invoice.
    decimal Deposit?;
    # This data type provides information for taxes charged on the transaction as a whole. It captures the details sales taxes calculated for the transaction based on the tax codes referenced by the transaction. This can be calculated by QuickBooks business logic or you may supply it when adding a transaction. See Global tax model for more information about this element. If sales tax is disabled (Preferences.TaxPrefs.UsingSalesTax is set to false) then TxnTaxDetail is ignored and not stored.
    record {} TxnTaxDetail?;
    # Specifies if online credit card payments are allowed for this invoice and corresponds to the Cards online payment check box on the QuickBooks UI. Active when Preferences.SalesFormsPrefs.ETransactionPaymentEnabled is set to true. If set to true, allow invoice to be paid with online credit card payments. The Cards online payment check box is checked on the QuickBooks UI. If set to false, online credit card payments are not allowed. The Cards online payment check box is not checked on the QuickBooks UI.
    boolean AllowOnlineCreditCardPayment?;
    # One of, up to three custom fields for the transaction. Available for custom fields so configured for the company. Check Preferences.SalesFormsPrefs.CustomField and Preferences.VendorAndPurchasesPrefs.POCustomField for custom fields currenly configured. Click here to learn about managing custom fields.
    anydata[] CustomField?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType DepartmentRef?;
    # Email address
    EmailAddress BillEmailBcc?;
    # Reference type
    ReferenceType ShipMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If false or null, calculate the sales tax first, and then apply the discount. If true, subtract the discount first and then calculate the sales tax.
    boolean ApplyTaxAfterDiscount?;
    # Convenience field containing the amount in Balance expressed in terms of the home currency. Calculated by QuickBooks business logic. Value is valid only when CurrencyRef is specified and available when endpoint is evoked with the minorversion=3 query parameter. Applicable if multicurrency is enabled for the company
    decimal HomeBalance?;
    # Email delivery information. Returned when a request has been made to deliver email with the send operation.
    record {} DeliveryInfo?;
    # Indicates the total amount of the transaction. This includes the total of all the charges, allowances, and taxes. Calculated by QuickBooks business logic; any value you supply is over-written by QuickBooks.
    decimal TotalAmt?;
    # Sharable link for the invoice sent to external customers. The link is generated only for invoices with online payment enabled and having a valid customer email address. Include query param `include=invoiceLink` to get the link back on query response.
    string InvoiceLink?;
    # Reference type
    ReferenceType RecurDataRef?;
    # Reference type
    ReferenceType TaxExemptionRef?;
    # The balance reflecting any payments made against the transaction. Initially set to the value of TotalAmt. A Balance of 0 indicates the invoice is fully paid. Calculated by QuickBooks business logic; any value you supply is over-written by QuickBooks.
    decimal Balance?;
    # Total amount of the transaction in the home currency. Includes the total of all the charges, allowances and taxes. Calculated by QuickBooks business logic. Value is valid only when CurrencyRef is specified. Applicable if multicurrency is enabled for the company.
    decimal HomeTotalAmt?;
    # Denotes how ShipAddr is stored- formatted or unformatted. The value of this flag is system defined based on format of shipping address at object create time. If set to false, shipping address is returned in a formatted style using City, Country, CountrySubDivisionCode, Postal code. If set to true, shipping address is returned in an unformatted style using Line1 through Line5 attributes.
    boolean FreeFormAddress?;
};

# Reference to the customer type assigned to a customer. This field is only returned if the customer is assigned a customer type.
public type CustomerTypeRefType record {
    # The unique numeric Id of the customer type. This maps to the CustomerType entity- CustomerType.Id.   
    string value?;
};

public type Customer record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # The name of the person or organization as displayed. Must be unique across all Customer, Vendor, and Employee objects. Cannot be removed with sparse update. If not supplied, the system generates DisplayName by concatenating customer name components supplied in the request from the following list- Title, GivenName, MiddleName, FamilyName, and Suffix.
    string DisplayName?;
    # Title of the person. This tag supports i18n, all locales. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string Title?;
    # Given name or first name of a person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string GivenName?;
    # Middle name of the person. The person can have zero or more middle names. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string MiddleName?;
    # Suffix of the name. For example, Jr. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string Suffix?;
    # Family name or the last name of the person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string FamilyName?;
    # Email address
    EmailAddress PrimaryEmailAddr?;
    # Resale number or some additional info about the customer.
    string ResaleNum?;
    # Also called UTR No. in ( UK ) , CST Reg No. ( IN ) also represents the tax registration number of the Person or Organization. This value is masked in responses, exposing only last five characters. For example, the ID of 123-45-6789 is returned as XXXXXX56789.
    string SecondaryTaxIdentifier?;
    # Reference type
    ReferenceType ARAccountRef?;
    # Reference type
    ReferenceType DefaultTaxCodeRef?;
    # Preferred delivery method. Values are Print, Email, or None.
    string PreferredDeliveryMethod?;
    # GSTIN is an identification number assigned to every GST registered business.
    string GSTIN?;
    # Reference type
    ReferenceType SalesTermRef?;
    # Reference to the customer type assigned to a customer. This field is only returned if the customer is assigned a customer type.
    CustomerTypeRefType CustomerTypeRef?;
    # Telephone number
    TelephoneNumber Fax?;
    # If true, this Customer object is billed with its parent. If false, or null the customer is not to be billed with its parent. This attribute is valid only if this entity is a Job or sub Customer.
    boolean BillWithParent?;
    # Telephone number
    TelephoneNumber Mobile?;
    # Telephone number
    TelephoneNumber PrimaryPhone?;
    # Telephone number
    TelephoneNumber AlternatePhone?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Reference type
    ReferenceType ParentRef?;
    # Website address
    WebSiteAddress WebAddr?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType PaymentMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If true, this is a Job or sub-customer. If false or null, this is a top level customer, not a Job or sub-customer.
    boolean Job?;
    # Cumulative open balance amount for the Customer (or Job) and all its sub-jobs. Cannot be written to QuickBooks.
    decimal BalanceWithJobs?;
    # Date of the Open Balance for the create operation. Write-on-create.
    string OpenBalanceDate?;
    # If true, transactions for this customer are taxable. Default behavior with minor version 10 and above- true, if DefaultTaxCodeRef is defined or false if TaxExemptionReasonId is set.
    boolean Taxable?;
    # Free form text describing the Customer.
    string Notes?;
    # If true, this entity is currently enabled for use by QuickBooks. If there is an amount in Customer.Balance when setting this Customer object to inactive through the QuickBooks UI, a CreditMemo balancing transaction is created for the amount.
    boolean Active?;
    # The name of the company associated with the person or organization.
    string CompanyName?;
    # Specifies the open balance amount or the amount unpaid by the customer. For the create operation, this represents the opening balance for the customer. When returned in response to the query request it represents the current open balance (unpaid amount) for that customer. Write-on-create.
    decimal Balance?;
    # If true, indicates this is a Project.
    boolean IsProject?;
    # The Source type of the transactions created by QuickBooks Commerce. Valid values include  QBCommerce
    string Source?;
    # Also called Tax Reg. No in ( UK ) , ( CA ) , ( IN ) , ( AU ) represents the tax ID of the Person or Organization. This value is masked in responses, exposing only last five characters. For example, the ID of 123-45-6789 is returned as XXXXXX56789.
    string PrimaryTaxIdentifier?;
    # For the filing of GSTR, transactions need to be classified depending on the type of customer to whom the sale is done. To facilitate this, we have introduced a new field as 'GST registration type'. Possible values are listed below- GST_REG_REG GST registered- Regular. Customer who has a business which is registered under GST and has a GSTIN (doesn’t include customers registered under composition scheme, as an SEZ or as EOU's, STP's EHTP's etc.). GST_REG_COMP GST registered-Composition. Customer who has a business which is registered under the composition scheme of GST and has a GSTIN. GST_UNREG GST unregistered. Customer who has a business which is not registered under GST and does not have a GSTIN. CONSUMER Consumer. Customer who is not registered under GST and is the final consumer of the service or product sold. OVERSEAS Overseas. Customer who has a business which is located out of India. SEZ SEZ. Customer who has a business which is registered under GST, has a GSTIN and is located in a SEZ or is a SEZ Developer. DEEMED Deemed exports- EOU's, STP's EHTP's etc. Customer who has a business which is registered under GST and falls in the category of companies (EOU's, STP's EHTP's etc.), to which supplies are made they are termed as deemed exports.
    string GSTRegistrationType?;
    # Name of the person or organization as printed on a check. If not provided, this is populated from DisplayName. Constraints- Cannot be removed with sparse update.
    string PrintOnCheckName?;
    # Fully qualified name of the object. The fully qualified name prepends the topmost parent, followed by each sub element separated by colons. Takes the form of Customer:Job:Sub-job. System generated. Limited to 5 levels.
    string FullyQualifiedName?;
    # Specifies the level of the hierarchy in which the entity is located. Zero specifies the top level of the hierarchy; anything above will be level with respect to the parent. Constraints:up to 5 levels
    int Level?;
    # The tax exemption reason associated with this customer object. Applicable if automated sales tax is enabled (Preferences.TaxPrefs.PartnerTaxEnabled is set to true) for the company. Set TaxExemptionReasonId to one of the following- - Id 	Reason 1.  Federal government 2. 	State government 3. 	Local government 4. 	Tribal government 5. 	Charitable organization 6. 	Religious organization 7. 	Educational organization 8. 	Hospital 9.	Resale 10. Direct pay permit 11. Multiple points of use 12. Direct mail 13. Agricultural production 14. Industrial production / manufacturing 15. Foreign diplomat
    string TaxExemptionReasonId?;
};

public type PaymentCreateObject record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Indicates the total amount of the transaction. This includes the total of all the charges, allowances, and taxes.
    decimal TotalAmt;
    # Reference type
    ReferenceType CustomerRef;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # User entered, organization-private note about the transaction.
    string PrivateNote?;
    # Reference type
    ReferenceType PaymentMethodRef?;
    # Identifies the account to be used for this payment. Query the Account name list resource to determine the appropriate Account object for this reference, where Account.AccountType is Other Current Asset or Bank. Use Account.Id and Account.Name from that object for DepositToAccountRef.value and DepostiToAccountRef.name, respectively. If you do not specify this account, payment is applied to the Undeposited Funds account.
    record {} DepositToAccountRef?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company
    decimal ExchangeRate?;
    # Zero or more transactions accounting for this payment. Values for Line.LinkedTxn.TxnTypecan be one of the following- - Expense--Payment is reimbursement for expense paid by cash made on behalf of the customer - Check--Payment is reimbursement for expense paid by check made on behalf of the customer - CreditCardCredit--Payment is reimbursement for a credit card credit made on behalf of the customer - JournalEntry--Payment is linked to the representative journal entry - CreditMemo--Payment is linked to the credit memo the customer has with the business - Invoice--The invoice to which payment is applied - Use Line.LinkedTxn.TxnId as the ID in a separate read request for the specific resource to retrieve details of the linked object.
    (ItemBasedExpenseLine|AccountBasedExpenseLine)[] Line?;
    # Used internally to specify originating source of a credit card transaction.
    string TxnSource?;
    # Reference type
    ReferenceType ARAccountRef?;
    # The date entered by the user when this transaction occurred. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Information about a payment received by credit card. Inject with data only if the payment was transacted through Intuit Payments API.
    record {} CreditCardPayment?;
    # The account location. Valid values include- WithinFrance FranceOverseas OutsideFranceWithEU OutsideEU For France locales, only.
    string TransactionLocationType?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # The reference number for the payment received. For example, Â Check number for a check, envelope number for a cash donation. Required for France locales.
    string PaymentRefNum?;
};

public type VendorResponse record {
    Vendor Vendor?;
};

# Telephone number
public type TelephoneNumber record {
    # Specifies the telephone number in free form.
    string FreeFormNumber?;
};

public type BillResponse record {
    Bill Bill?;
};

public type VendorCreateObject record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Title of the person. This tag supports i18n, all locales. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes are required during create.
    string Title?;
    # Given name or first name of a person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string GivenName?;
    # Middle name of the person. The person can have zero or more middle names. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string MiddleName?;
    # Suffix of the name. For example, Jr. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string Suffix?;
    # Family name or the last name of the person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string FamilyName?;
    # Email address
    EmailAddress PrimaryEmailAddr?;
    # The name of the vendor as displayed. Must be unique across all Vendor, Customer, and Employee objects. Cannot be removed with sparse update. If not supplied, the system generates DisplayName by concatenating vendor name components supplied in the request from the following list- Title, GivenName, MiddleName, FamilyName, and Suffix.
    string DisplayName?;
    # List of ContactInfo entities of any contact info type.
    record {} OtherContactInfo?;
    # Reference type
    ReferenceType APAccountRef?;
    # Reference type
    ReferenceType TermRef?;
    # The Source type of the transactions created by QuickBooks Commerce. Valid values include- QBCommerce
    string Source?;
    # GSTIN is an identification number assigned to every GST registered business.
    string GSTIN?;
    # True if vendor is T4A eligible. Valid for CA locale
    string T4AEligible?;
    # Telephone number
    TelephoneNumber Fax?;
    # Also called, PAN (in India) is a code that acts as an identification for individuals, families and corporates, especially for those who pay taxes on their income.
    string BusinessNumber?;
    # Indicate if the vendor has TPAR enabled. TPAR stands for Taxable Payments Annual Report. The TPAR is mandated by ATO to get the details payments that businesses make to contractors for providing services. Some government entities also need to report the grants they have paid in a TPAR.
    boolean HasTPAR?;
    # The method in which the supplier tracks their income. Applicable for France companies, only. Available when endpoint is evoked with the minorversion=3 query parameter. Valid values include- Cash and Accrual.
    string TaxReportingBasis?;
    # Telephone number
    TelephoneNumber Mobile?;
    # Telephone number
    TelephoneNumber PrimaryPhone?;
    # If true, this object is currently enabled for use by QuickBooks.
    boolean Active?;
    # Telephone number
    TelephoneNumber AlternatePhone?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # This vendor is an independent contractor; someone who is given a 1099-MISC form at the end of the year. A 1099 vendor is paid with regular checks, and taxes are not withheld on their behalf.
    boolean Vendor1099?;
    # BillRate can be set to specify this vendor's hourly billing rate.
    decimal BillRate?;
    # Website address
    WebSiteAddress WebAddr?;
    # True if vendor is T5018 eligible. Valid for CA locale
    boolean T5018Eligible?;
    # The name of the company associated with the person or organization.
    string CompanyName?;
    # Vendor Payment Bank Detail.
    record {} VendorPaymentBankDetail?;
    # The tax ID of the Person or Organization. The value is masked in responses, exposing only last four characters. For example, the ID of 123-45-6789 is returned as XXXXXXX6789.
    string TaxIdentifier?;
    # Name or number of the account associated with this vendor.
    string AcctNum?;
    # For the filing of GSTR, transactions need to be classified depending on the type of vendor from whom the purchase is made. To facilitate this, we have introduced a new field as 'GST registration type'. Possible values are listed below- GST_REG_REG GST registered- Regular. Customer who has a business which is registered under GST and has a GSTIN (doesn’t include customers registered under composition scheme, as an SEZ or as EOU's, STP's EHTP's etc.). GST_REG_COMP GST registered-Composition. Customer who has a business which is registered under the composition scheme of GST and has a GSTIN. GST_UNREG GST unregistered. Customer who has a business which is not registered under GST and does not have a GSTIN. CONSUMER Consumer. Customer who is not registered under GST and is the final consumer of the service or product sold. OVERSEAS Overseas. Customer who has a business which is located out of India. SEZ SEZ. Customer who has a business which is registered under GST, has a GSTIN and is located in a SEZ or is a SEZ Developer. DEEMED Deemed exports- EOU's, STP's EHTP's etc. Customer who has a business which is registered under GST and falls in the category of companies (EOU's, STP's EHTP's etc.), to which supplies are made they are termed as deemed exports.
    string GSTRegistrationType?;
    # Name of the person or organization as printed on a check. If not provided, this is populated from DisplayName. Cannot be removed with sparse update.
    string PrintOnCheckName?;
    # Physical address
    PhysicalAddress BillAddr?;
};

public type InvoiceCreateObject record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Individual line items of a transaction. Valid Line types include SalesItemLine, GroupLine, DescriptionOnlyLine (also used for inline Subtotal lines), DiscountLine and SubTotalLine (used for the overall transaction)
    anydata[] Line;
    # Reference type
    ReferenceType CustomerRef;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Reference number for the transaction. If not explicitly provided at create time, this field is populated based on the setting of Preferences:CustomTxnNumber as follows- If Preferences:CustomTxnNumber is true a custom value can be provided. If no value is supplied, the resulting DocNumber is null. If Preferences:CustomTxnNumber is false, resulting DocNumber is system generated by incrementing the last number by 1. If Preferences:CustomTxnNumber is false then do not send a value as it can lead to unwanted duplicates. If a DocNumber value is sent for an Update operation, then it just updates that particular invoice and does not alter the internal system DocNumber. Note- DocNumber is an optional field for all locales except France. For France locale if Preferences:CustomTxnNumber is enabled it will not be automatically generated and is a required field. If a duplicate DocNumber needs to be supplied, add the query parameter name/value pair, include=allowduplicatedocnum to the URI.
    string DocNumber?;
    # Email address
    EmailAddress BillEmail?;
    # The date entered by the user when this transaction occurred. yyyy/MM/dd is the valid date format. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Physical address
    PhysicalAddress ShipFromAddr?;
    # Date for delivery of goods or services.
    string ShipDate?;
    # Shipping provider's tracking number for the delivery of the goods associated with the transaction.
    string TrackingNum?;
    # Reference type
    ReferenceType ClassRef?;
    # Printing status of the invoice. Valid values- NotSet, NeedToPrint, PrintComplete .
    string PrintStatus?;
    # Reference type
    ReferenceType SalesTermRef?;
    # Used internally to specify originating source of a credit card transaction.
    string TxnSource?;
    # Zero or more related transactions to this Invoice object. The following linked relationships are supported- Links to Estimate and TimeActivity objects can be established directly to this Invoice object with UI or with the API. Create, Read, Update, and Query operations are avaialble at the API level for these types of links. Only one link can be made to an Estimate. Progress Invoicing is not supported via the API. Links to expenses incurred on behalf of the customer are returned in the response with LinkedTxn.TxnType set to ReimburseCharge, ChargeCredit or StatementCharge corresponding to billable customer expenses of type Cash, Delayed Credit, and Delayed Charge, respectively. Links to these types of transactions are established within the QuickBooks UI, only, and are available as read-only at the API level. Links to payments applied to an Invoice object are returned in the response with LinkedTxn.TxnType set to Payment. Links to Payment transactions are established within the QuickBooks UI, only, and are available as read-only at the API level. Use LinkedTxn.TxnId as the ID in a separate read request for the specific resource to retrieve details of the linked object.
    anydata[] LinkedTxn?;
    # Reference type
    ReferenceType DepositToAccountRef?;
    # Method in which tax is applied. Allowed values are- TaxExcluded, TaxInclusive, and NotApplicable.
    string GlobalTaxCalculation?;
    # Specifies if this invoice can be paid with online bank transfers and corresponds to the Free bank transfer online payment check box on the QuickBooks UI. Active when Preferences.SalesFormsPrefs.ETransactionPaymentEnabled is set to true. If set to true, allow invoice to be paid with online bank transfers. The Free bank transfer online payment check box is checked on the QuickBooks UI for this invoice. If set to false, online bank transfers are not allowed. The Free bank transfer online payment check box is not checked on the QuickBooks UI for this invoice.
    boolean AllowOnlineACHPayment?;
    # The account location. For France locale valid values include- WithinFrance FranceOverseas OutsideFranceWithEU OutsideEU For UAE, valid values include ABUDHABI AJMAN SHARJAH DUBAI FUJAIRAH RAS_AL_KHAIMAH UMM_AL_QUWAIN OTHER_GCC
    string TransactionLocationType?;
    # Date when the payment of the transaction is due. If date is not provided, the number of days specified in SalesTermRef added the transaction date will be used.
    string DueDate?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # User entered, organization-private note about the transaction. This note does not appear on the invoice to the customer. This field maps to the Statement Memo field on the Invoice form in the QuickBooks Online UI.
    string PrivateNote?;
    # Email address
    EmailAddress BillEmailCc?;
    MemoRef CustomerMemo?;
    # Email status of the invoice. Valid values- NotSet, NeedToSend, EmailSent
    string EmailStatus?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company.
    decimal ExchangeRate?;
    # The deposit made towards this invoice.
    decimal Deposit?;
    # This data type provides information for taxes charged on the transaction as a whole. It captures the details sales taxes calculated for the transaction based on the tax codes referenced by the transaction. This can be calculated by QuickBooks business logic or you may supply it when adding a transaction. See Global tax model for more information about this element. If sales tax is disabled (Preferences.TaxPrefs.UsingSalesTax is set to false) then TxnTaxDetail is ignored and not stored.
    record {} TxnTaxDetail?;
    # Specifies if online credit card payments are allowed for this invoice and corresponds to the Cards online payment check box on the QuickBooks UI. Active when Preferences.SalesFormsPrefs.ETransactionPaymentEnabled is set to true. If set to true, allow invoice to be paid with online credit card payments. The Cards online payment check box is checked on the QuickBooks UI. If set to false, online credit card payments are not allowed. The Cards online payment check box is not checked on the QuickBooks UI.
    boolean AllowOnlineCreditCardPayment?;
    # One of, up to three custom fields for the transaction. Available for custom fields so configured for the company. Check Preferences.SalesFormsPrefs.CustomField and Preferences.VendorAndPurchasesPrefs.POCustomField for custom fields currenly configured. Click here to learn about managing custom fields.
    record {} CustomField?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType DepartmentRef?;
    # Email address
    EmailAddress BillEmailBcc?;
    # Reference type
    ReferenceType ShipMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If false or null, calculate the sales tax first, and then apply the discount. If true, subtract the discount first and then calculate the sales tax.
    boolean ApplyTaxAfterDiscount?;
    # Denotes how ShipAddr is stored- formatted or unformatted. The value of this flag is system defined based on format of shipping address at object create time. If set to false, shipping address is returned in a formatted style using City, Country, CountrySubDivisionCode, Postal code. If set to true, shipping address is returned in an unformatted style using Line1 through Line5 attributes.
    boolean FreeFormAddress?;
};

# Reference type
public type ReferenceType record {
    # The ID for the referenced object as found in the Id field of the object payload. The context is set by the type of reference and is specific to the QuickBooks company file.
    string value?;
    # An identifying name for the object being referenced by value and is derived from the field that holds the common name of that object. This varies by context and specific type of object referenced. For example, references to a Customer object use Customer.DisplayName to populate this field. Optionally returned in responses, implementation dependent.
    string name?;
};

public type PaymentResponse record {
    Payment Payment?;
};

public type BillCreateObject record {
    # Reference to the vendor for this transaction. Query the Vendor name list resource to determine the appropriate Vendor object for this reference. Use Vendor.Id and Vendor.Name from that object for VendorRef.value and VendorRef.name, respectively.
    BillcreateobjectVendorref VendorRef;
    # Individual line items of a transaction. Valid Line types include- ItemBasedExpenseLine and AccountBasedExpenseLine
    (ItemBasedExpenseLine|AccountBasedExpenseLine)[] Line;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
};

# Specifies the Parent AccountId if this represents a SubAccount.
public type AccountParentref record {
    # The ID for the referenced object as found in the Id field of the object payload. - The context is set by the type of reference and is specific to the QuickBooks company file.
    string value?;
    # An identifying name for the object being referenced by value and is derived from the field that holds the common name of that object. - This varies by context and specific type of object referenced. - For example, references to a Customer object use Customer.DisplayName to populate this field. - Optionally returned in responses, implementation dependent.
    string name?;
};

# Item Based Expense Line Detail
public type ItemBasedExpenseLineDetail record {
    # The total amount of the line item including tax. Constraints- Available when endpoint is evoked with the minorversion=1query parameter.
    decimal TaxInclusiveAmt?;
    # Reference type
    ReferenceType ItemRef?;
    # Reference type
    ReferenceType CustomerRef?;
    # Reference type
    ReferenceType PriceLevelRef?;
    # Reference type
    ReferenceType ClassRef?;
    # Reference type
    ReferenceType TaxCodeRef?;
    # Reference to the TaxCodefor this item. Query the TaxCode name list resource to determine the appropriate TaxCode object for this reference. Use TaxCode.Id and TaxCode.Name from that object for TaxCodeRef.value and TaxCodeRef.name, respectively.
    record {} MarkupInfo?;
    # The billable status of the expense. Valid values- Billable, NotBillable, HasBeenBilled
    string BillableStatus?;
    # Number of items for the line.
    decimal Qty?;
    # Unit price of the subject item as referenced by ItemRef. Corresponds to the Rate column on the QuickBooks Online UI to specify either unit price, a discount, or a tax rate for item. If used for unit price, the monetary value of the service or product, as expressed in the home currency. If used for a discount or tax rate, express the percentage as a fraction. For example, specify 0.4 for 40% tax.
    decimal UnitPrice?;
};

# ItemBasedExpenseLineDetail
public type AccountBasedExpenseLineDetail record {
    # The total amount of the line item including tax. Constraints- Available when endpoint is evoked with the minorversion=1query parameter.
    decimal TaxInclusiveAmt?;
    # Sales tax paid as part of the expense.
    decimal TaxAmount?;
    # Reference to the Expense account associated with this item. Query the Account name list resource to determine the appropriate Account object for this reference, where Account.AccountType=Expense. Use Account.Id and Account.Name from that object for AccountRef.value and AccountRef.name, respectively. For France locales- The account associated with the referenced Account object is looked up in the account category list. If this account has same location as specified in the transaction by the TransactionLocationType attribute and the same VAT as in the line item TaxCodeRef attribute, then this account is used. If there is a mismatch, then the account from the account category list that matches the transaction location and VAT is used. If this account is not present in the account category list, then a new account is created with the new location, new VAT code, and all other attributes as in the default account.
    AccountbasedexpenselinedetailAccountref AccountRef?;
    # Reference type
    ReferenceType CustomerRef?;
    # Reference type
    ReferenceType PriceLevelRef?;
    # Reference type
    ReferenceType ClassRef?;
    # Reference type
    ReferenceType TaxCodeRef?;
    # Reference to the TaxCodefor this item. Query the TaxCode name list resource to determine the appropriate TaxCode object for this reference. Use TaxCode.Id and TaxCode.Name from that object for TaxCodeRef.value and TaxCodeRef.name, respectively.
    record {} MarkupInfo?;
    # The billable status of the expense. Valid values- Billable, NotBillable, HasBeenBilled
    string BillableStatus?;
};

public type MemoRef record {
    # User-entered message to the customer; this message is visible to the end user on their transactions.
    string value?;
};

# Website address
public type WebSiteAddress record {
    # Uniform Resource Identifier for the web site.
    string URI?;
};

public type AccountCreateObject record {
    # User recognizable name for the Account. Account.Name attribute must not contain double quotes (") or colon (:).
    string Name;
    # User-defined account number to help the user in identifying the account within the chart-of-accounts and in deciding what should be posted to the account. The Account.AcctNum attribute must not contain colon (:). For France locales:Name must be unique. Length must be between 6 and 20 characters. Must start with the account number from the master category list. Name limited to alpha-numeric characters. Required for France locales.
    string AcctNum?;
    # Reference to the default tax code used by this account. Tax codes are referenced by the TaxCode. Id in the TaxCode object. Available when endpoint is invoked with the minorversion=3 query parameter. For global locales, only. Required for France locales
    string TaxCodeRef?;
    # A detailed account classification that specifies the use of this account. The type is based on the Classification.
    string AccountType?;
    # The account sub-type classification and is based on the AccountType value.
    string AccountSubType?;
};

public type EstimateCreateObject record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Reference type
    ReferenceType CustomerRef;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Email address
    EmailAddress BillEmail?;
    # The date entered by the user when this transaction occurred. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Physical address
    PhysicalAddress ShipFromAddr?;
    # Date for delivery of goods or services.
    string ShipDate?;
    # Reference type
    ReferenceType ClassRef?;
    # Printing status of the invoice. Valid values- NotSet, NeedToPrint, PrintComplete .
    string PrintStatus?;
    # One of, up to three custom fields for the transaction. Available for custom fields so configured for the company. Check Preferences.SalesFormsPrefs.CustomField and Preferences.VendorAndPurchasesPrefs.POCustomField for custom fields currenly configured. Click here to learn about managing custom fields.
    record {} CustomField?;
    # Reference type
    ReferenceType SalesTermRef?;
    # One of the following status settings- Accepted, Closed, Pending, Rejected, Converted
    string TxnStatus?;
    # Zero or more Invoice objects related to this transaction. Use LinkedTxn.TxnId as the ID in a separate Invoice read request to retrieve details of the linked object.
    LinkedTxn[] LinkedTxn?;
    # TaxExcluded Method in which tax is applied. Allowed values are- TaxExcluded, TaxInclusive, and NotApplicable.
    string GlobalTaxCalculation?;
    # Date estimate was accepted.
    string AcceptedDate?;
    # Date by which estimate must be accepted before invalidation.
    string ExpirationDate?;
    # The account location. Valid values include- - WithinFrance - FranceOverseas - OutsideFranceWithEU - OutsideEU - For France locales, only.
    string TransactionLocationType?;
    # Date when the payment of the transaction is due. If date is not provided, the number of days specified in SalesTermRef added the transaction date will be used.
    string DueDate?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Reference number for the transaction. If not explicitly provided at create time, this field is populated based on the setting of Preferences:CustomTxnNumber as follows- If Preferences:CustomTxnNumber is true a custom value can be provided. If no value is supplied, the resulting DocNumber is null. If Preferences:CustomTxnNumber is false, resulting DocNumber is system generated by incrementing the last number by 1. If Preferences:CustomTxnNumber is false then do not send a value as it can lead to unwanted duplicates. If a DocNumber value is sent for an Update operation, then it just updates that particular invoice and does not alter the internal system DocNumber. Note- DocNumber is an optional field for all locales except France. For France locale if Preferences:CustomTxnNumber is enabled it will not be automatically generated and is a required field.
    string DocNumber?;
    # User entered, organization-private note about the transaction. This note does not appear on the invoice to the customer. This field maps to the Memo field on the Invoice form.
    string PrivateNote?;
    # Individual line items of a transaction. Valid Line types include- SalesItemLine, GroupLine, DescriptionOnlyLine (also used for inline Subtotal lines), DiscountLine and SubTotalLine (used for the overall transaction)
    anydata[] Line?;
    MemoRef CustomerMemo?;
    # Email status of the invoice. Valid values- NotSet, NeedToSend, EmailSent
    string EmailStatus?;
    # This data type provides information for taxes charged on the transaction as a whole. It captures the details sales taxes calculated for the transaction based on the tax codes referenced by the transaction. This can be calculated by QuickBooks business logic or you may supply it when adding a transaction. See Global tax model for more information about this element. If sales tax is disabled (Preferences.TaxPrefs.UsingSalesTax is set to false) then TxnTaxDetail is ignored and not stored.
    record {} TxnTaxDetail?;
    # Name of customer who accepted the estimate.
    string AcceptedBy?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company.
    decimal ExchangeRate?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType DepartmentRef?;
    # Reference type
    ReferenceType ShipMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If false or null, calculate the sales tax first, and then apply the discount. If true, subtract the discount first and then calculate the sales tax.
    boolean ApplyTaxAfterDiscount?;
    # Denotes how ShipAddr is stored- formatted or unformatted. The value of this flag is system defined based on format of shipping address at object create time. If set to false, shipping address is returned in a formatted style using City, Country, CountrySubDivisionCode, Postal code. If set to true, shipping address is returned in an unformatted style using Line1 through Line5 attributes.
    boolean FreeFormAddress?;
};

public type LinkedTxn record {
    # Transaction Id of the related transaction.
    string TxnId?;
    # Transaction type of the linked object.
    string TxnType?;
    # Required for Deposit and Bill entities. -The line number of a specific line of the linked transaction. - If supplied, the TxnId and TxnType attributes of the linked transaction must also be populated.
    string TxnLineId?;
};

public type InvoiceResponse record {
    Invoice Invoice?;
};

public type ItemBasedExpenseLine record {
    # The Id of the line item. Its use in requests is as folllows - - If Id is greater than zero and exists for the company, the request is considered an update operation for a line item. - If no Id is provided, the Idprovided is less than or equal to zero, or the Idprovided is greater than zero and does not exist for the company then the request is considered a create operation for a line item. - Available in all objects that use lines and support the update operation.
    string Id?;
    # The amount of the line item.
    decimal Amount?;
    # Set to ItemBasedExpenseLineDetail for this type of line.
    string DetailType?;
    # Item Based Expense Line Detail
    ItemBasedExpenseLineDetail ItemBasedExpenseLineDetail?;
    # Zero or more PurchaseOrder transactions linked to this Bill object. The LinkedTxn.TxnType should always be set to PurchaseOrder. Use LinkedTxn.TxnId as the ID of the PurchaseOrder. When updating an existing Bill to link to a PurchaseOrder a new Line must be created. This behavior matches the QuickBooks UI as it does not allow the linking of an existing line, but rather a new line must be added to link the PurchaseOrder. Over the API this is achieved by simply updating the Bill Line.Id to something new. This will ensure old bill line is deleted and the new line is linked to the PurchaseOrder.
    LinkedTxn[] LinkedTxn?;
    # Free form text description of the line item that appears in the printed record.
    string Description?;
    # Specifies the position of the line in the collection of transaction lines. Positive Integer.
    decimal LineNum?;
};

# Modification metadata
public type ModificationMetaData record {
    # Time the entity was created in the source domain.
    string CreateTime?;
    # Time the entity was last updated in the source domain.
    string LastUpdatedTime?;
};

# Physical address
public type PhysicalAddress record {
    # Unique identifier of the QuickBooks object for the address, used for modifying the address.
    string Id?;
    # Postal code. For example, zip code for USA and Canada
    string PostalCode?;
    # City name.
    string City?;
    # Country name. For international addresses - countries should be passed as 3 ISO alpha-3 characters or the full name of the country.
    string Country?;
    # Fifth line of the address.
    string Line5?;
    # Fourth line of the address.
    string Line4?;
    # Third line of the address.
    string Line3?;
    # Second line of the address.
    string Line2?;
    # First line of the address.
    string Line1?;
    # Latitude coordinate of Geocode (Geospacial Entity Object Code). INVALIDis returned for invalid addresses.
    string Lat?;
    # Longitude coordinate of Geocode (Geospacial Entity Object Code). INVALIDis returned for invalid addresses.
    string Long?;
    # Region within a country. For example, state name for USA, province name for Canada.
    string CountrySubDivisionCode?;
};

public type Vendor record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Title of the person. This tag supports i18n, all locales. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes are required during create.
    string Title?;
    # Given name or first name of a person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string GivenName?;
    # Middle name of the person. The person can have zero or more middle names. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string MiddleName?;
    # Suffix of the name. For example, Jr. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string Suffix?;
    # Family name or the last name of the person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required for object create.
    string FamilyName?;
    # Email address
    EmailAddress PrimaryEmailAddr?;
    # The name of the vendor as displayed. Must be unique across all Vendor, Customer, and Employee objects. Cannot be removed with sparse update. If not supplied, the system generates DisplayName by concatenating vendor name components supplied in the request from the following list- Title, GivenName, MiddleName, FamilyName, and Suffix.
    string DisplayName?;
    # List of ContactInfo entities of any contact info type.
    record {} OtherContactInfo?;
    # Reference type
    ReferenceType APAccountRef?;
    # Reference type
    ReferenceType TermRef?;
    # The Source type of the transactions created by QuickBooks Commerce. Valid values include- QBCommerce
    string Source?;
    # GSTIN is an identification number assigned to every GST registered business.
    string GSTIN?;
    # True if vendor is T4A eligible. Valid for CA locale
    string T4AEligible?;
    # Telephone number
    TelephoneNumber Fax?;
    # Also called, PAN (in India) is a code that acts as an identification for individuals, families and corporates, especially for those who pay taxes on their income.
    string BusinessNumber?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # Indicate if the vendor has TPAR enabled. TPAR stands for Taxable Payments Annual Report. The TPAR is mandated by ATO to get the details payments that businesses make to contractors for providing services. Some government entities also need to report the grants they have paid in a TPAR.
    boolean HasTPAR?;
    # The method in which the supplier tracks their income. Applicable for France companies, only. Available when endpoint is evoked with the minorversion=3 query parameter. Valid values include- Cash and Accrual.
    string TaxReportingBasis?;
    # Telephone number
    TelephoneNumber Mobile?;
    # Telephone number
    TelephoneNumber PrimaryPhone?;
    # If true, this object is currently enabled for use by QuickBooks.
    boolean Active?;
    # Telephone number
    TelephoneNumber AlternatePhone?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # This vendor is an independent contractor; someone who is given a 1099-MISC form at the end of the year. A 1099 vendor is paid with regular checks, and taxes are not withheld on their behalf.
    boolean Vendor1099?;
    # BillRate can be set to specify this vendor's hourly billing rate.
    decimal BillRate?;
    # Website address
    WebSiteAddress WebAddr?;
    # True if vendor is T5018 eligible. Valid for CA locale
    boolean T5018Eligible?;
    # The name of the company associated with the person or organization.
    string CompanyName?;
    # Vendor Payment Bank Detail.
    record {} VendorPaymentBankDetail?;
    # The tax ID of the Person or Organization. The value is masked in responses, exposing only last four characters. For example, the ID of 123-45-6789 is returned as XXXXXXX6789.
    string TaxIdentifier?;
    # Name or number of the account associated with this vendor.
    string AcctNum?;
    # For the filing of GSTR, transactions need to be classified depending on the type of vendor from whom the purchase is made. To facilitate this, we have introduced a new field as 'GST registration type'. Possible values are listed below- GST_REG_REG GST registered- Regular. Customer who has a business which is registered under GST and has a GSTIN (doesn’t include customers registered under composition scheme, as an SEZ or as EOU's, STP's EHTP's etc.). GST_REG_COMP GST registered-Composition. Customer who has a business which is registered under the composition scheme of GST and has a GSTIN. GST_UNREG GST unregistered. Customer who has a business which is not registered under GST and does not have a GSTIN. CONSUMER Consumer. Customer who is not registered under GST and is the final consumer of the service or product sold. OVERSEAS Overseas. Customer who has a business which is located out of India. SEZ SEZ. Customer who has a business which is registered under GST, has a GSTIN and is located in a SEZ or is a SEZ Developer. DEEMED Deemed exports- EOU's, STP's EHTP's etc. Customer who has a business which is registered under GST and falls in the category of companies (EOU's, STP's EHTP's etc.), to which supplies are made they are termed as deemed exports.
    string GSTRegistrationType?;
    # Name of the person or organization as printed on a check. If not provided, this is populated from DisplayName. Cannot be removed with sparse update.
    string PrintOnCheckName?;
    # Physical address
    PhysicalAddress BillAddr?;
    # Specifies the open balance amount or the amount unpaid by the customer. For the create operation, this represents the opening balance for the customer. When returned in response to the query request it represents the current open balance (unpaid amount) for that customer. Write-on-create, read-only otherwise.
    decimal Balance?;
};

public type EstimateResponse record {
    Estimate Estimate?;
};

# Email address
public type EmailAddress record {
    # An email address. The address format must follow the RFC 822 standard.
    string Address?;
};

# Reference to the Expense account associated with this item. Query the Account name list resource to determine the appropriate Account object for this reference, where Account.AccountType=Expense. Use Account.Id and Account.Name from that object for AccountRef.value and AccountRef.name, respectively. For France locales- The account associated with the referenced Account object is looked up in the account category list. If this account has same location as specified in the transaction by the TransactionLocationType attribute and the same VAT as in the line item TaxCodeRef attribute, then this account is used. If there is a mismatch, then the account from the account category list that matches the transaction location and VAT is used. If this account is not present in the account category list, then a new account is created with the new location, new VAT code, and all other attributes as in the default account.
public type AccountbasedexpenselinedetailAccountref record {
    # The ID for the referenced object as found in the Id field of the object payload. The context is set by the type of reference and is specific to the QuickBooks company file.
    string value?;
    # An identifying name for the object being referenced by value and is derived from the field that holds the common name of that object. This varies by context and specific type of object referenced. For example, references to a Customer object use Customer.DisplayName to populate this field. Optionally returned in responses, implementation dependent.
    string name?;
};

public type Payment record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Indicates the total amount of the transaction. This includes the total of all the charges, allowances, and taxes.
    decimal TotalAmt?;
    # Reference type
    ReferenceType CustomerRef?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # User entered, organization-private note about the transaction.
    string PrivateNote?;
    # Reference type
    ReferenceType PaymentMethodRef?;
    # Indicates the amount that has not been applied to pay amounts owed for sales transactions.
    decimal UnappliedAmt?;
    # Identifies the account to be used for this payment. Query the Account name list resource to determine the appropriate Account object for this reference, where Account.AccountType is Other Current Asset or Bank. Use Account.Id and Account.Name from that object for DepositToAccountRef.value and DepostiToAccountRef.name, respectively. If you do not specify this account, payment is applied to the Undeposited Funds account.
    record {} DepositToAccountRef?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company
    decimal ExchangeRate?;
    # Zero or more transactions accounting for this payment. Values for Line.LinkedTxn.TxnTypecan be one of the following- - Expense--Payment is reimbursement for expense paid by cash made on behalf of the customer - Check--Payment is reimbursement for expense paid by check made on behalf of the customer - CreditCardCredit--Payment is reimbursement for a credit card credit made on behalf of the customer - JournalEntry--Payment is linked to the representative journal entry - CreditMemo--Payment is linked to the credit memo the customer has with the business - Invoice--The invoice to which payment is applied - Use Line.LinkedTxn.TxnId as the ID in a separate read request for the specific resource to retrieve details of the linked object.
    (ItemBasedExpenseLine|AccountBasedExpenseLine)[] Line?;
    # Used internally to specify originating source of a credit card transaction.
    string TxnSource?;
    # Reference type
    ReferenceType ARAccountRef?;
    # The date entered by the user when this transaction occurred. For posting transactions, this is the posting date that affects the financial statements. If the date is not supplied, the current date on the server is used. Sort order is ASC by default.
    string TxnDate?;
    # Information about a payment received by credit card. Inject with data only if the payment was transacted through Intuit Payments API.
    record {} CreditCardPayment?;
    # The account location. Valid values include- WithinFrance FranceOverseas OutsideFranceWithEU OutsideEU For France locales, only.
    string TransactionLocationType?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # The reference number for the payment received. For example, Â Check number for a check, envelope number for a cash donation. Required for France locales.
    string PaymentRefNum?;
    # Reference type
    ReferenceType TaxExemptionRef?;
};

public type AccountBasedExpenseLine record {
    # The Id of the line item. Its use in requests is as folllows - - If Id is greater than zero and exists for the company, the request is considered an update operation for a line item. - If no Id is provided, the Idprovided is less than or equal to zero, or the Idprovided is greater than zero and does not exist for the company then the request is considered a create operation for a line item. - Available in all objects that use lines and support the update operation.
    string Id?;
    # The amount of the line item.
    decimal Amount?;
    # Set to AccountBasedExpenseLineDetailfor this type of line.
    string DetailType?;
    # ItemBasedExpenseLineDetail
    AccountBasedExpenseLineDetail AccountBasedExpenseLineDetail?;
    # Zero or more PurchaseOrder transactions linked to this Bill object. The LinkedTxn.TxnType should always be set to PurchaseOrder. Use LinkedTxn.TxnId as the ID of the PurchaseOrder. When updating an existing Bill to link to a PurchaseOrder a new Line must be created. This behavior matches the QuickBooks UI as it does not allow the linking of an existing line, but rather a new line must be added to link the PurchaseOrder. Over the API this is achieved by simply updating the Bill Line.Id to something new. This will ensure old bill line is deleted and the new line is linked to the PurchaseOrder.
    LinkedTxn[] LinkedTxn?;
    # Free form text description of the line item that appears in the printed record.
    string Description?;
    # Specifies the position of the line in the collection of transaction lines. Positive Integer.
    decimal LineNum?;
};

# Reference to the vendor for this transaction. Query the Vendor name list resource to determine the appropriate Vendor object for this reference. Use Vendor.Id and Vendor.Name from that object for VendorRef.value and VendorRef.name, respectively.
public type BillcreateobjectVendorref record {
    # The ID for the referenced object as found in the Id field of the object payload. The context is set by the type of reference and is specific to the QuickBooks company file.
    string value?;
    # An identifying name for the object being referenced by value and is derived from the field that holds the common name of that object. This varies by context and specific type of object referenced. For example, references to a Customer object use Customer.DisplayName to populate this field. Optionally returned in responses, implementation dependent.
    string name?;
};

# Currency reference type
public type CurrencyRefType record {
    # A three letter string representing the ISO 4217 code for the currency. For example, USD, AUD, EUR, and so on.
    string value?;
    # The full name of the currency.
    string name?;
};

public type Bill record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Reference type
    ReferenceType VendorRef?;
    # Individual line items of a transaction. Valid Line types include- ItemBasedExpenseLine and AccountBasedExpenseLine
    (ItemBasedExpenseLine|AccountBasedExpenseLine)[] Line?;
    # Version number of the object. It is used to lock an object for use by one app at a time. - As soon as an application modifies an object, its SyncToken is incremented. - Attempts to modify an object specifying an older SyncToken fails. - Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # Currency reference type
    CurrencyRefType CurrencyRef?;
    # The date entered by the user when this transaction occurred. - For posting transactions, this is the posting date that affects the financial statements. - If the date is not supplied, the current date on the server is used. - Sort order is ASC by default.
    string TxnDate?;
    # Reference type
    ReferenceType APAccountRef?;
    # Reference type
    ReferenceType SalesTermRef?;
    # Zero or more transactions linked to this Bill object. The LinkedTxn.TxnType can be set to PurchaseOrder, BillPaymentCheck or if using Minor Version 55 and above ReimburseCharge. Use LinkedTxn.TxnId as the ID of the transaction.
    LinkedTxn[] LinkedTxn?;
    # Method in which tax is applied. Allowed values are- TaxExcluded, TaxInclusive, and NotApplicable.
    string GlobalTaxCalculation?;
    # Indicates the total amount of the transaction. This includes the total of all the charges, allowances, and taxes. Calculated by QuickBooks business logic; any value you supply is over-written by QuickBooks.
    decimal TotalAmt?;
    # The account location. Valid values include- - WithinFrance - FranceOverseas - OutsideFranceWithEU - OutsideEU * For France locales, only.
    string TransactionLocationType?;
    # Date when the payment of the transaction is due. If date is not provided, the number of days specified in SalesTermRef added the transaction date will be used.
    string DueDate?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Reference number for the transaction. If not explicitly provided at create time, a custom value can be provided. - If no value is supplied, the resulting DocNumber is null. Throws an error when duplicate DocNumber is sent in the request. - Recommended best practice- check the setting of Preferences:OtherPrefs before setting DocNumber. - If a duplicate DocNumber needs to be supplied, add the query parameter name/value pair, include=allowduplicatedocnum to the URI. - Sort order is ASC by default.
    string DocNumber?;
    # User entered, organization-private note about the transaction. This note does not appear on the invoice to the customer. This field maps to the Memo field on the Invoice form.
    string PrivateNote?;
    # This data type provides information for taxes charged on the transaction as a whole. - It captures the details of all taxes calculated for the transaction based on the tax codes referenced by the transaction. - This can be calculated by QuickBooks business logic or you may supply it when adding a transaction. - If sales tax is disabled (Preferences.TaxPrefs.UsingSalesTax is set to false) then TxnTaxDetail is ignored and not stored.
    record {} TxnTaxDetail?;
    # The number of home currency units it takes to equal one unit of currency specified by CurrencyRef. Applicable if multicurrency is enabled for the company.
    decimal ExchangeRate?;
    # Reference type
    ReferenceType DepartmentRef?;
    # Include the supplier in the annual TPAR. TPAR stands for Taxable Payments Annual Report. The TPAR is mandated by ATO to get the details payments that businesses make to contractors for providing services. Some government entities also need to report the grants they have paid in a TPAR.
    boolean IncludeInAnnualTPAR?;
    # Convenience field containing the amount in Balance expressed in terms of the home currency. Calculated by QuickBooks business logic. Value is valid only when CurrencyRef is specified and available when endpoint is evoked with the minorversion=3 query parameter. Applicable if multicurrency is enabled for the company.
    decimal HomeBalance?;
    # Reference type
    ReferenceType RecurDataRef?;
    # The balance reflecting any payments made against the transaction. Initially set to the value of TotalAmt. A Balance of 0 indicates the bill is fully paid. Calculated by QuickBooks business logic; any value you supply is over-written by QuickBooks.
    decimal Balance?;
};

public type CustomerCreateObject record {
    # Unique identifier for this object. Sort order is ASC by default.
    string Id?;
    # Version number of the object. It is used to lock an object for use by one app at a time. As soon as an application modifies an object, its SyncToken is incremented. Attempts to modify an object specifying an older SyncToken fails. Only the latest version of the object is maintained by QuickBooks Online.
    string SyncToken?;
    # The name of the person or organization as displayed. Must be unique across all Customer, Vendor, and Employee objects. Cannot be removed with sparse update. If not supplied, the system generates DisplayName by concatenating customer name components supplied in the request from the following list- Title, GivenName, MiddleName, FamilyName, and Suffix.
    string DisplayName?;
    # Title of the person. This tag supports i18n, all locales. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string Title?;
    # Given name or first name of a person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string GivenName?;
    # Middle name of the person. The person can have zero or more middle names. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string MiddleName?;
    # Suffix of the name. For example, Jr. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string Suffix?;
    # Family name or the last name of the person. The DisplayName attribute or at least one of Title, GivenName, MiddleName, FamilyName, or Suffix attributes is required.
    string FamilyName?;
    # Email address
    EmailAddress PrimaryEmailAddr?;
    # Resale number or some additional info about the customer.
    string ResaleNum?;
    # Also called UTR No. in ( UK ) , CST Reg No. ( IN ) also represents the tax registration number of the Person or Organization. This value is masked in responses, exposing only last five characters. For example, the ID of 123-45-6789 is returned as XXXXXX56789.
    string SecondaryTaxIdentifier?;
    # Reference type
    ReferenceType ARAccountRef?;
    # Reference type
    ReferenceType DefaultTaxCodeRef?;
    # Preferred delivery method. Values are Print, Email, or None.
    string PreferredDeliveryMethod?;
    # GSTIN is an identification number assigned to every GST registered business.
    string GSTIN?;
    # Reference type
    ReferenceType SalesTermRef?;
    # Reference to the customer type assigned to a customer. This field is only returned if the customer is assigned a customer type.
    CustomerTypeRefType CustomerTypeRef?;
    # Telephone number
    TelephoneNumber Fax?;
    # If true, this Customer object is billed with its parent. If false, or null the customer is not to be billed with its parent. This attribute is valid only if this entity is a Job or sub Customer.
    boolean BillWithParent?;
    # Telephone number
    TelephoneNumber Mobile?;
    # Telephone number
    TelephoneNumber PrimaryPhone?;
    # Telephone number
    TelephoneNumber AlternatePhone?;
    # Modification metadata
    ModificationMetaData MetaData?;
    # Reference type
    ReferenceType ParentRef?;
    # Website address
    WebSiteAddress WebAddr?;
    # Physical address
    PhysicalAddress ShipAddr?;
    # Reference type
    ReferenceType PaymentMethodRef?;
    # Physical address
    PhysicalAddress BillAddr?;
    # If true, this is a Job or sub-customer. If false or null, this is a top level customer, not a Job or sub-customer.
    boolean Job?;
    # Cumulative open balance amount for the Customer (or Job) and all its sub-jobs. Cannot be written to QuickBooks.
    decimal BalanceWithJobs?;
    # Date of the Open Balance for the create operation. Write-on-create.
    string OpenBalanceDate?;
    # If true, transactions for this customer are taxable. Default behavior with minor version 10 and above- true, if DefaultTaxCodeRef is defined or false if TaxExemptionReasonId is set.
    boolean Taxable?;
    # Free form text describing the Customer.
    string Notes?;
    # If true, this entity is currently enabled for use by QuickBooks. If there is an amount in Customer.Balance when setting this Customer object to inactive through the QuickBooks UI, a CreditMemo balancing transaction is created for the amount.
    boolean Active?;
    # The name of the company associated with the person or organization.
    string CompanyName?;
    # Specifies the open balance amount or the amount unpaid by the customer. For the create operation, this represents the opening balance for the customer. When returned in response to the query request it represents the current open balance (unpaid amount) for that customer. Write-on-create.
    decimal Balance?;
    # The Source type of the transactions created by QuickBooks Commerce. Valid values include  QBCommerce
    string Source?;
    # Also called Tax Reg. No in ( UK ) , ( CA ) , ( IN ) , ( AU ) represents the tax ID of the Person or Organization. This value is masked in responses, exposing only last five characters. For example, the ID of 123-45-6789 is returned as XXXXXX56789.
    string PrimaryTaxIdentifier?;
    # For the filing of GSTR, transactions need to be classified depending on the type of customer to whom the sale is done. To facilitate this, we have introduced a new field as 'GST registration type'. Possible values are listed below- GST_REG_REG GST registered- Regular. Customer who has a business which is registered under GST and has a GSTIN (doesn’t include customers registered under composition scheme, as an SEZ or as EOU's, STP's EHTP's etc.). GST_REG_COMP GST registered-Composition. Customer who has a business which is registered under the composition scheme of GST and has a GSTIN. GST_UNREG GST unregistered. Customer who has a business which is not registered under GST and does not have a GSTIN. CONSUMER Consumer. Customer who is not registered under GST and is the final consumer of the service or product sold. OVERSEAS Overseas. Customer who has a business which is located out of India. SEZ SEZ. Customer who has a business which is registered under GST, has a GSTIN and is located in a SEZ or is a SEZ Developer. DEEMED Deemed exports- EOU's, STP's EHTP's etc. Customer who has a business which is registered under GST and falls in the category of companies (EOU's, STP's EHTP's etc.), to which supplies are made they are termed as deemed exports.
    string GSTRegistrationType?;
    # Name of the person or organization as printed on a check. If not provided, this is populated from DisplayName. Constraints- Cannot be removed with sparse update.
    string PrintOnCheckName?;
    # Specifies the level of the hierarchy in which the entity is located. Zero specifies the top level of the hierarchy; anything above will be level with respect to the parent. Constraints:up to 5 levels
    int Level?;
    # The tax exemption reason associated with this customer object. Applicable if automated sales tax is enabled (Preferences.TaxPrefs.PartnerTaxEnabled is set to true) for the company. Set TaxExemptionReasonId to one of the following- - Id 	Reason 1.  Federal government 2. 	State government 3. 	Local government 4. 	Tribal government 5. 	Charitable organization 6. 	Religious organization 7. 	Educational organization 8. 	Hospital 9.	Resale 10. Direct pay permit 11. Multiple points of use 12. Direct mail 13. Agricultural production 14. Industrial production / manufacturing 15. Foreign diplomat
    string TaxExemptionReasonId?;
};

public type AccountResponse record {
    Account Account?;
};

public type CustomerResponse record {
    Customer Customer?;
};
