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

public type AccountModelArr AccountModel[];

public type ErrorDetailArr ErrorDetail[];

public type AccountConfigurationModelArr AccountConfigurationModel[];

public type AccountLicenseKeyModelArr AccountLicenseKeyModel[];

public type AvaFileFormModelArr AvaFileFormModel[];

public type BatchModelArr BatchModel[];

public type CertExpressInvitationStatusModelArr CertExpressInvitationStatusModel[];

public type CertificateModelArr CertificateModel[];

public type CompanyModelArr CompanyModel[];

public type FundingConfigurationModelArr FundingConfigurationModel[];

public type CompanyParameterDetailModelArr CompanyParameterDetailModel[];

public type CompanyConfigurationModelArr CompanyConfigurationModel[];

public type FundingStatusModelArr FundingStatusModel[];

public type ContactModelArr ContactModel[];

public type CustomerModelArr CustomerModel[];

public type DataSourceModelArr DataSourceModel[];

public type CompanyDistanceThresholdModelArr CompanyDistanceThresholdModel[];

public type CompanyReturnSettingModelArr CompanyReturnSettingModel[];

public type ItemModelArr ItemModel[];

public type ItemClassificationOutputModelArr ItemClassificationOutputModel[];

public type ItemParameterModelArr ItemParameterModel[];

public type ItemTagDetailModelArr ItemTagDetailModel[];

public type JurisdictionOverrideModelArr JurisdictionOverrideModel[];

public type LocationModelArr LocationModel[];

public type LocationParameterModelArr LocationParameterModel[];

public type NexusModelArr NexusModel[];

public type NexusParameterDetailModelArr NexusParameterDetailModel[];

public type NexusByAddressModelArr NexusByAddressModel[];

public type NotificationModelArr NotificationModel[];

public type ReportModelArr ReportModel[];

public type SettingModelArr SettingModel[];

public type SubscriptionModelArr SubscriptionModel[];

public type TaxCodeModelArr TaxCodeModel[];

public type TaxRuleModelArr TaxRuleModel[];

public type UPCModelArr UPCModel[];

public type UserModelArr UserModel[];

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

# Represents a tax type
public type TaxTypeModel record {
    # The unique ID number of this tax type.
    int id?;
    # The name of this tax type.
    string taxType?;
    # The description of this tax type.
    string description?;
};

# Options for expiring a filing calendar.
public type CycleExpireOptionModel record {
    # The period start date for the customer's first transaction in the jurisdiction being expired.
    string transactionalPeriodStart?;
    # The period end date for the customer's last transaction in the jurisdiction being expired.
    string transactionalPeriodEnd?;
    # The jurisdiction-assigned due date for the form.
    string filingDueDate?;
    # A descriptive name of the cycle and due date of the form.
    string cycleName?;
};

# A MultiDocument transaction represents a sale or purchase that occurred between more than two companies.
#             
# A traditional transaction requires exactly two parties: a seller and a buyer.  MultiDocument transactions can
# involve a marketplace of vendors, each of which contributes some portion of the final transaction.  Within
# a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
# document.  This separation of documents allows each seller to file their taxes separately.
public type CreateMultiDocumentModel record {
    # The transaction code of the MultiDocument transaction.
    #             
    # All individual transactions within this MultiDocument object will have this code as a prefix.
    #             
    # If you leave the `code` field blank, a GUID will be assigned.
    @constraint:String {maxLength: 45}
    string code?;
    # Lines that will appear on the invoice.
    #             
    # For a MultiDocument transaction, each line may represent a different company or reporting location code.  AvaTax
    # will separate this MultiDocument transaction object into many different transactions, one for each pair of legal
    # entities, so that each legal entity can file their transactional taxes correctly.
    MultiDocumentLineItemModel[] lines;
    # Set this value to true to allow this API call to adjust the MultiDocument model if one already exists.
    #             
    # If you omit this field, or if the value is `null`, you will receive an error if you try to create two MultiDocument
    # objects with the same `code`.
    boolean allowAdjust?;
    # Specifies the type of document to create.  A document type ending with `Invoice` is a permanent transaction
    # that will be recorded in AvaTax.  A document type ending with `Order` is a temporary estimate that will not
    # be preserved.
    #             
    # If you omit this value, the API will assume you want to create a `SalesOrder`.
    string 'type?;
    # Company Code - Specify the code of the company creating this transaction here.  If you leave this value null,
    # your account's default company will be used instead.
    @constraint:String {maxLength: 50}
    string companyCode?;
    # Transaction Date - The date on the invoice, purchase order, etc.
    #             
    # By default, this date will be used to calculate the tax rates for the transaction.  If you wish to use a
    # different date to calculate tax rates, please specify a `taxOverride` of type `taxDate`.
    string date;
    # Salesperson Code - The client application salesperson reference code.
    @constraint:String {maxLength: 25}
    string salespersonCode?;
    # Customer Code - The client application customer reference code.
    # Note: This field is case sensitive. To have exemption certificates apply, this value should
    # be the same as the one passed to create a customer.
    @constraint:String {maxLength: 50}
    string customerCode;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use entityUseCode instead.
    # Customer Usage Type - The client application customer or usage type.
    @constraint:String {maxLength: 25}
    string customerUsageType?;
    # Entity Use Code - The client application customer or usage type.  For a list of
    # available usage types, use [ListEntityUseCodes](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListEntityUseCodes/) API.
    @constraint:String {maxLength: 25}
    string entityUseCode?;
    # Discount - The discount amount to apply to the document.  This value will be applied only to lines
    # that have the `discounted` flag set to true.  If no lines have `discounted` set to true, this discount
    # cannot be applied.
    decimal discount?;
    # Purchase Order Number for this document.
    #             
    # This is required for single use exemption certificates to match the order and invoice with the certificate.
    @constraint:String {maxLength: 50}
    string purchaseOrderNo?;
    # Exemption Number for this document.
    #             
    # If you specify an exemption number for this document, this document will be considered exempt, and you
    # may be asked to provide proof of this exemption certificate in the event that you are asked by an auditor
    # to verify your exemptions.
    # Note: This is same as 'exemptNo' in TransactionModel.
    @constraint:String {maxLength: 25}
    string exemptionNo?;
    # Information about all the addresses involved in this transaction.
    #             
    # For a physical in-person transaction at a retail point-of-sale location, please specify only one address using
    # the `singleLocation` field.
    #             
    # For a transaction that was shipped, delivered, or provided from an origin location such as a warehouse to
    # a destination location such as a customer, please specify the `shipFrom` and `shipTo` addresses.
    #             
    # In the United States, some jurisdictions recognize the address types `pointOfOrderOrigin` and `pointOfOrderAcceptance`.
    # These address types affect the sourcing models of some transactions.
    #             
    # If latitude and longitude information is provided for any of these addresses along with line, city, region, country and postal code information,
    # we will be using only latitude and longitude and will discard line, city, region, country and postal code information for the transaction.
    # Please ensure that you have the correct latitude/longitude information for the addresses prior to using the API.
    # If you provide either latitude or longitude information but not both, we will be using the line, city, region, country and postal code information for the addresses.
    AddressesModel addresses?;
    # Special parameters for this transaction.
    #             
    # To get a full list of available parameters, please use the [ListParameters](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListParameters/) endpoint.
    TransactionParameterModel[] parameters?;
    # Custom user fields/flex fields for this transaction.
    TransactionUserDefinedFieldModel[] userDefinedFields?;
    # Customer-provided Reference Code with information about this transaction.
    #             
    # This field could be used to reference the original document for a return invoice, or for any other
    # reference purpose.
    @constraint:String {maxLength: 1024}
    string referenceCode?;
    # Sets the sale location code (Outlet ID) for reporting this document to the tax authority.
    #             
    # This value is used by Avalara Managed Returns to group documents together by reporting locations
    # for tax authorities that require location-based reporting.
    @constraint:String {maxLength: 50}
    string reportingLocationCode?;
    # Causes the document to be committed if true.  This option is only applicable for invoice document
    # types, not orders.
    boolean 'commit?;
    # BatchCode for batch operations.
    @constraint:String {maxLength: 25}
    string batchCode?;
    # Represents a tax override for a transaction
    TaxOverrideModel taxOverride?;
    # The three-character ISO 4217 currency code for this transaction.
    @constraint:String {maxLength: 3}
    string currencyCode?;
    # Specifies whether the tax calculation is handled Local, Remote, or Automatic (default).  This only
    # applies when using an AvaLocal server.
    string serviceMode?;
    # Currency exchange rate from this transaction to the company base currency.
    #             
    # This only needs to be set if the transaction currency is different than the company base currency.
    # It defaults to 1.0.
    decimal exchangeRate?;
    # Effective date of the exchange rate.
    string exchangeRateEffectiveDate?;
    # Optional three-character ISO 4217 reporting exchange rate currency code for this transaction. The default value is USD.
    @constraint:String {maxLength: 3}
    string exchangeRateCurrencyCode?;
    # Sets the Point of Sale Lane Code sent by the User for this document.
    @constraint:String {maxLength: 50}
    string posLaneCode?;
    # VAT business identification number for the customer for this transaction.  This number will be used for all lines
    # in the transaction, except for those lines where you have defined a different business identification number.
    #             
    # If you specify a VAT business identification number for the customer in this transaction and you have also set up
    # a business identification number for your company during company setup, this transaction will be treated as a
    # business-to-business transaction for VAT purposes and it will be calculated according to VAT tax rules.
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # Specifies if the transaction should have value-added and cross-border taxes calculated with the seller as the importer of record.
    #             
    # Some taxes only apply if the seller is the importer of record for a product.  In cases where companies are working together to
    # ship products, there may be mutual agreement as to which company is the entity designated as importer of record.  The importer
    # of record will then be the company designated to pay taxes marked as being obligated to the importer of record.
    #             
    # Set this value to `true` to consider your company as the importer of record and collect these taxes.
    #             
    # This value may also be set at the Nexus level.  See `NexusModel` for more information.
    boolean isSellerImporterOfRecord?;
    # User-supplied description for this transaction.
    @constraint:String {maxLength: 2048}
    string description?;
    # User-supplied email address relevant for this transaction.
    @constraint:String {maxLength: 50}
    string email?;
    # If the user wishes to request additional debug information from this transaction, specify a level higher than `normal`.
    string debugLevel?;
    # The name of the supplier / exporter / seller.
    # For sales doctype enter the name of your own company for which you are reporting.
    # For purchases doctype enter the name of the supplier you have purchased from.
    @constraint:String {maxLength: 200}
    string customerSupplierName?;
    # The Id of the datasource from which this transaction originated.
    # This value will be overridden by the system to take the datasource Id from the call header.
    int dataSourceId?;
    # The Delivery Terms is a field used in conjunction with Importer of Record to influence whether AvaTax includes Import Duty and Tax values in the transaction totals or not.
    # Delivered at Place (DAP) and Delivered Duty Paid (DDP) are two delivery terms that  indicate that Import Duty and Tax should be included in the transaction total.
    # This field is also used for reports.
    # This field is used for future feature support. This field is not currently in use.
    string deliveryTerms?;
};

# Represents a service or a subscription type.
public type SubscriptionTypeModel record {
    # The unique ID number of this subscription type.
    int id?;
    # The friendly name of the service this subscription type represents.
    @constraint:String {maxLength: 255}
    string description;
};

# Identifies all nexus that match a particular tax form
public type NexusByTaxFormModel record {
    # The code of the tax form that was requested
    string formCode?;
    # The company ID of the company that was used to load the companyNexus array.  If this value is null, no company data was loaded.
    int companyId?;
    # A list of all Avalara-defined nexus that are relevant to this tax form
    NexusModel[] nexusDefinitions?;
    # A list of all currently-defined company nexus that are related to this tax form
    NexusModel[] companyNexus?;
};

# Model for Advanced Rules when full details are requested
public type AdvancedRuleFullDetailsModel record {
    # The code script for the rule
    string script;
    # Script run for validating customer data
    string customerDataValidatorScript?;
    # Has the rule been approved
    boolean isApproved?;
    # Creator of the rule
    string createdBy?;
    # When the rule was created
    string createdOn?;
    # Last updater of the rule
    string modifiedBy?;
    # When the rule was last updated
    string modifiedOn?;
    # Approver of the rule
    string approvedBy?;
    # Is this a system rule as opposed to customer-facing
    boolean isSystemRule?;
    # Is the rule displayed in the CUP UI
    boolean isVisibleInCUP?;
    # Is this a rule created for testing
    boolean isTest?;
    # The JSON schema for customer data if it is required for the rule
    string customerDataSchema?;
    # The version of the rule
    int 'version?;
    # Account Ids the rule is visible for in CUP, when IsVisibleInCUP = false
    int[] accountsVisibleFor?;
    # Unique identifier for a rule
    string ruleId?;
    # Rule name
    string name;
    # Description of the rule
    string description?;
    # Advance Rules limited availability
    boolean arEntitlementRequired?;
    # Execution position. Both, Before or After
    string executionPosition?;
};

# This object represents a single transaction; for example, a sales invoice or purchase order.
public type TransactionModel record {
    # The unique ID number of this transaction.
    int id?;
    # A unique customer-provided code identifying this transaction.
    string code?;
    # The unique ID number of the company that recorded this transaction.
    int companyId?;
    # The date on which this transaction occurred.
    string date?;
    # DEPRECATED - Date: 07/25/2018, Version: 18.7, Message: This field is deprecated and will return null till its removed.
    # The date when payment was made on this transaction.  By default, this should be the same as the date of the transaction.
    string paymentDate?;
    # The status of the transaction.
    string status?;
    # The type of the transaction.
    #             
    # Transactions of type `SalesOrder`, `ReturnOrder`, and so on are temporary estimates and will not be saved.
    #             
    # Transactions of type `SalesInvoice, `ReturnInvoice`, and so on are permanent transactions that can be reported to tax authorities
    # if they are in status `Committed`.
    #             
    # A sales transaction represents a sale from the company to a customer.  A purchase transaction represents a purchase made by the company.
    # A return transaction represents a customer who decided to request a refund after purchasing a product from the company.  An inventory
    # transfer transaction represents goods that were moved from one location of the company to another location without changing ownership.
    string 'type?;
    # If this transaction was created as part of a batch, this code indicates which batch.
    string batchCode?;
    # The three-character ISO 4217 currency code that was used for payment for this transaction.
    string currencyCode?;
    # The three-character ISO 4217 exchange rate currency code that was used for payment for this transaction.
    string exchangeRateCurrencyCode?;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use entityUseCode instead.
    # The customer usage type for this transaction.  Customer usage types often affect exemption or taxability rules.
    string customerUsageType?;
    # The entity use code for this transaction.  Entity use codes often affect exemption or taxability rules.
    string entityUseCode?;
    # DEPRECATED - Date: 3/1/2018, Version: 18.3, Message: Please use `customerCode`
    # This field has been renamed to `customerCode` to match documentation for other APIs related to exemption customers.
    string customerVendorCode?;
    # Unique code identifying the customer that requested this transaction.
    #             
    # When you specify a `customerCode`, AvaTax will look to see if a customer exists with this code in the exemption certificate system.
    # If that customer exists, and if that customer has uploaded an exemption certificate that applies to this transaction, the relevant
    # parts of this transaction that can use the exemption certificate will be treated as exempt.
    string customerCode?;
    # The customer Tax Id Number (tax_number) associated with a certificate - Sales tax calculation requests first determine if there is an applicable
    # ECMS entry available, and will utilize it for exemption processing. If no applicable ECMS entry is available, the AvaTax service
    # will determine if an Exemption Number field is populated or an Entity/Use Code is included in the sales tax calculation request,
    # and will perform exemption processing using either of those two options.
    string exemptNo?;
    # If this transaction has been reconciled against the company's ledger, this value is set to true.
    boolean reconciled?;
    # DEPRECATED - Date: 3/1/2018, Version: 18.3, Message: In order to ensure consistency of field names, Please use reportingLocationCode instead.
    # This field has been replaced by the reportingLocationCode field
    string locationCode?;
    # For customers who use [location-based tax reporting](https://developer.avalara.com/avatax/dev-guide/locations/location-based-reporting),
    # this field controls how this transaction will be filed for multi-location tax filings.
    #             
    # If you specify a non-null value for this field, AvaTax will ensure that this transaction is reported on the tax return associated
    # with the [LocationModel](https://developer.avalara.com/api-reference/avatax/rest/v2/models/LocationModel/) identified by this code.
    #             
    # This field does not affect any addresses for the transaction.  It only controls the tax filing behavior of this transaction.
    #             
    # If you are looking for information about how to set up addresses for a transaction, please see [Using Address Types](https://developer.avalara.com/avatax/dev-guide/customizing-transaction/address-types/)
    # in the AvaTax Developer Guide.
    string reportingLocationCode?;
    # The customer-supplied purchase order number of this transaction.
    string purchaseOrderNo?;
    # A user-defined reference code for this transaction.
    string referenceCode?;
    # The salesperson who provided this transaction.  Not required.
    string salespersonCode?;
    # If a tax override was applied to this transaction, indicates what type of tax override was applied.
    string taxOverrideType?;
    # If a tax override was applied to this transaction, indicates the amount of tax that was requested by the customer.
    decimal taxOverrideAmount?;
    # If a tax override was applied to this transaction, indicates the reason for the tax override.
    string taxOverrideReason?;
    # The total amount of this transaction.
    decimal totalAmount?;
    # The amount of this transaction that was exempt.
    decimal totalExempt?;
    # The total amount of discounts applied to all lines within this transaction.
    decimal totalDiscount?;
    # The total tax for all lines in this transaction.
    #             
    # If you used a `taxOverride` of type `taxAmount` for any lines in this transaction, this value
    # may be different than the amount of tax calculated by AvaTax.  The amount of tax calculated by
    # AvaTax will be stored in the `totalTaxCalculated` field, whereas this field will contain the
    # total tax that was charged on the transaction.
    #             
    # You can compare the `totalTax` and `totalTaxCalculated` fields to check for any discrepancies
    # between an external tax calculation provider and the calculation performed by AvaTax.
    decimal totalTax?;
    # The portion of the total amount of this transaction that was taxable.
    decimal totalTaxable?;
    # The amount of tax that AvaTax calculated for the transaction.
    #             
    # If you used a `taxOverride` of type `taxAmount` for any lines in this transaction, this value
    # will represent the amount that AvaTax calculated for this transaction without applying the override.
    # The field `totalTax` will be the total amount of tax after all overrides are applied.
    #             
    # You can compare the `totalTax` and `totalTaxCalculated` fields to check for any discrepancies
    # between an external tax calculation provider and the calculation performed by AvaTax.
    decimal totalTaxCalculated?;
    # If this transaction was adjusted, indicates the unique ID number of the reason why the transaction was adjusted.
    string adjustmentReason?;
    # If this transaction was adjusted, indicates a description of the reason why the transaction was adjusted.
    string adjustmentDescription?;
    # If this transaction has been reported to a tax authority, this transaction is considered locked and may not be adjusted after reporting.
    boolean locked?;
    # The two-or-three character ISO region code of the region for this transaction.
    string region?;
    # The two-character ISO 3166 code of the country for this transaction.
    @constraint:String {maxLength: 2, minLength: 2}
    string country?;
    # If this transaction was adjusted, this indicates the version number of this transaction.  Incremented each time the transaction
    # is adjusted.
    int 'version?;
    # The software version used to calculate this transaction.
    string softwareVersion?;
    # The unique ID number of the origin address for this transaction.
    int originAddressId?;
    # The unique ID number of the destination address for this transaction.
    int destinationAddressId?;
    # If this transaction included foreign currency exchange, this is the date as of which the exchange rate was calculated.
    string exchangeRateEffectiveDate?;
    # If this transaction included foreign currency exchange, this is the exchange rate that was used.
    decimal exchangeRate?;
    # By default, the value is null, when the value is null, the value can be set at nexus level and used.
    # If the value is not null, it will override the value at nexus level.
    #             
    # If true, this seller was considered the importer of record of a product shipped internationally.
    #             
    # If this transaction is not an international transaction, this field may be left blank.
    #             
    # The "importer of record" is liable to pay customs and import duties for products shipped internationally.  If
    # you specify that the seller is the importer of record, then estimates of customs and import duties will be added
    # as tax details to the transaction.  Otherwise, the buyer is considered the importer of record, and customs
    # and import duties will not be added to the tax details for this transaction.
    boolean isSellerImporterOfRecord?;
    # Description of this transaction.  Field permits unicode values.
    string description?;
    # Email address associated with this transaction.
    string email?;
    # VAT business identification number used for this transaction.
    string businessIdentificationNo?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # Tax date for this transaction
    string taxDate?;
    # A list of line items in this transaction.  To fetch this list, add the query string `?$include=Lines` or `?$include=Details` to your URL.
    TransactionLineModel[] lines?;
    # A list of line items in this transaction.  To fetch this list, add the query string `?$include=Addresses` to your URL.
    #             
    # For more information about transaction addresses, please see [Using Address Types](https://developer.avalara.com/avatax/dev-guide/customizing-transaction/address-types/)
    # in the AvaTax Developer Guide.
    TransactionAddressModel[] addresses?;
    # A list of location types in this transaction.  To fetch this list, add the query string `?$include=Addresses` to your URL.
    TransactionLocationTypeModel[] locationTypes?;
    # Contains a summary of tax on this transaction.
    TransactionSummary[] summary?;
    # Contains the tax details per tax type
    TaxDetailsByTaxType[] taxDetailsByTaxType?;
    # Contains a list of extra parameters that were set when the transaction was created.
    TransactionParameterModel[] parameters?;
    # Custom user fields/flex fields for this transaction.
    TransactionUserDefinedFieldModel[] userDefinedFields?;
    # List of informational and warning messages regarding this API call.  These messages are only relevant to the current API call.
    AvaTaxMessage[] messages?;
    # Invoice messages associated with this document. Currently, this stores legally-required VAT messages.
    InvoiceMessageModel[] invoiceMessages?;
    # The name of the supplier / exporter / seller.
    # For sales doctype this will be the name of your own company for which you are reporting.
    # For purchases doctype this will be the name of the supplier you have purchased from.
    string customerSupplierName?;
    # The Id of the datasource from which this transaction originated.
    # This value will be overridden by the system to take the datasource Id from the call header.
    int dataSourceId?;
    # The Delivery Terms is a field used in conjunction with Importer of Record to influence whether AvaTax includes Import Duty and Tax values in the transaction totals or not.
    # Delivered at Place (DAP) and Delivered Duty Paid (DDP) are two delivery terms that  indicate that Import Duty and Tax should be included in the transaction total.
    # This field is also used for reports.
    # This field is used for future feature support. This field is not currently in use.
    string deliveryTerms?;
};

# Model representing a lookup file for a company
public type AdvancedRuleLookupFileModel record {
    # LookupFile unique identifier
    string lookupFileId?;
    # CompanyLookupFile unique identifier
    string id?;
    # Name of lookup file
    @constraint:String {maxLength: 100}
    string name;
    # Content of the lookup file.
    string content;
    # File extension (e.g. CSV).
    @constraint:String {maxLength: 10}
    string fileExtension;
    # Is this a lookup file created for testing
    boolean isTest?;
    # Is this a lookup file in use for any rule
    boolean inUse?;
    # Lookup file version
    int 'version?;
    # Lookup file CreatedDate
    string createdDate?;
    # Lookup file ModifiedDate
    string modifiedDate?;
};

# Tax Authority Model
public type NoticeCustomerFundingOptionModel record {
    # The unique ID number of this tax notice customer FundingOption.
    int id;
    # The description name of this tax authority FundingOption.
    string description;
    # A flag if the FundingOption is active
    boolean activeFlag?;
    # sort order of the FundingOptions
    int sortOrder?;
};

public type ParameterUsageModelFetchResult record {
    int '\@recordsetCount?;
    ParameterUsageModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a Jurisdiction with applicable TaxType, TaxSubType and RateType.
public type JurisdictionRateTypeTaxTypeMappingModel record {
    # The unique ID number of this Jurisdiction RateType TaxType Mapping.
    int id?;
    # Name or ISO 3166 code identifying the country of this jurisdiction.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Name or ISO 3166 code identifying the region of this jurisdiction.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string state?;
    # Jurisdiction TypeId
    string jurisdictionType?;
    # Jurisdiction Code
    string jurisdictionCode?;
    # Jurisdiction long name
    string longName?;
    # Tax Type to which this jurisdiction is applicable
    string taxTypeId?;
    # Tax Type to which this jurisdiction is applicable
    string taxSubTypeId?;
    # Tax Type Group to which this jurisdiction is applicable
    string taxTypeGroupId?;
    # Rate Type to which this jurisdiction is applicable
    string rateTypeId?;
    # The date this jurisdiction starts to take effect on tax calculations
    string effectiveDate?;
    # The date this jurisdiction stops to take effect on tax calculations
    string endDate?;
};

# 
public type CompanyUserDefinedFieldModel record {
    # The id of the datasource.
    int id?;
    # The id of the company to which the datasource belongs to.
    int companyId?;
    # The extractor/connector id.
    @constraint:String {maxLength: 50}
    string name;
    # The unique ID number of this connection.
    @constraint:String {maxLength: 4096}
    string friendlyName;
    # The unique ID number of this connection.
    string dataType?;
    # The category of user defined type For Example: Document level or Line level UDF.
    string userDefinedFieldType?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date when this record was created.
    string createdDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
};

# Represents an address to resolve.
public type AddressLocationInfo record {
    # If you wish to use the address of an existing location for this company, specify the address here.
    # Otherwise, leave this value empty.
    #             
    # The `locationCode` field on this object allows you to quickly use the address of an existing `locationModel` object instead
    # of having to retype the address completely.
    #             
    # This field does not affect the behavior of transactions that must be filed on location-based tax returns.  To specify how a
    # transaction will be reported on location-based tax returns, please see the `reportingLocationCode` field
    # on the [CreateTransactionModel](https://developer.avalara.com/api-reference/avatax/rest/v2/models/CreateTransactionModel/) element.
    string locationCode?;
    # First line of the street address
    @constraint:String {maxLength: 100}
    string line1?;
    # Second line of the street address
    @constraint:String {maxLength: 100}
    string line2?;
    # Third line of the street address
    @constraint:String {maxLength: 100}
    string line3?;
    # City component of the address
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Postal Code / Zip Code component of the address.
    @constraint:String {maxLength: 11}
    string postalCode?;
    # Geospatial latitude measurement, in Decimal Degrees floating point format.
    decimal latitude?;
    # Geospatial longitude measurement, in Decimal Degrees floating point format.
    decimal longitude?;
};

# The tax rate model.
public type ComplianceTaxRateModel record {
    # The unique id of the rate.
    int id?;
    # The tax rate.
    decimal rate?;
    # The id of the jurisdiction.
    int jurisdictionId?;
    # The id of the tax region.
    int taxRegionId?;
    # The date this rate is starts to take effect.
    string effectiveDate?;
    # The date this rate is no longer active.
    string endDate?;
    # The rate type.
    string rateTypeId?;
    # The tax type.
    string taxTypeId?;
    # The name of the tax.
    string taxName?;
    # The unit of basis.
    int unitOfBasisId?;
    # The rate type tax type mapping id.
    int rateTypeTaxTypeMappingId?;
};

# Represents an ISO 3166 recognized country
public type IsoCountryModel record {
    # The two character ISO 3166 country code
    string code?;
    # The three character ISO 3166 country code
    string alpha3Code?;
    # The full name of this country in uppercase.
    #             
    # For names in proper or formal case, or for names in other languages, please examine the `localizedNames` element for an appropriate name.
    string name?;
    # True if this country is a member of the European Union
    boolean isEuropeanUnion?;
    # A list of localized names in a variety of languages.
    #             
    # This list is maintained by the International Standards Organization.
    IsoLocalizedName[] localizedNames?;
    # Whether or not this country requires a region in postal addresses.
    boolean addressesRequireRegion?;
};

public type NoticeFinanceModelFetchResult record {
    int '\@recordsetCount?;
    NoticeFinanceModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type NoticeStatusModelFetchResult record {
    int '\@recordsetCount?;
    NoticeStatusModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Use this object to provide an address and date range where your company does business.
# This address will be used to determine what jurisdictions you should declare nexus and
# calculate tax.
public type DeclareNexusByAddressModel record {
    # The earliest date on which your company does business at this address.  If you omit
    # a value in this field, nexus will be declared at the earliest possible date for this
    # jurisdiction.
    string effectiveDate?;
    # The date on which your company stopped doing business at this address, or empty if
    # your company has no plans to stop doing business at this address.
    string endDate?;
    # First line of the street address
    @constraint:String {maxLength: 50}
    string line1?;
    # Specify the text case for the validated address result.  If not specified, will return uppercase.
    string textCase?;
    # Second line of the street address
    @constraint:String {maxLength: 100}
    string line2?;
    # Third line of the street address
    @constraint:String {maxLength: 100}
    string line3?;
    # City component of the address
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Postal Code / Zip Code component of the address.
    @constraint:String {maxLength: 11}
    string postalCode?;
    # Geospatial latitude measurement, in Decimal Degrees floating point format.
    decimal latitude?;
    # Geospatial longitude measurement, in Decimal Degrees floating point format.
    decimal longitude?;
};

# Informational or warning messages returned by AvaTax with a transaction
public type AvaTaxMessage record {
    # A brief summary of what this message tells us
    string summary?;
    # Detailed information that explains what the summary provided
    string details?;
    # Information about what object in your request this message refers to
    string refersTo?;
    # A category that indicates how severely this message affects the results
    string severity?;
    # The name of the code or service that generated this message
    string 'source?;
};

# Represents a language-specific localized name of a particular geographic entity such
# as a country or a region.
public type IsoLocalizedName record {
    # The two-character alphanumeric code identifying the language in which this name is used.
    #             
    # Note that languageAlpha2Code and language3AlphaCode refer to the same language.
    string languageAlpha2Code?;
    # The three-character alphanumeric code identifying the language in which this name is used.
    #             
    # Note that languageAlpha2Code and language3AlphaCode refer to the same language.
    string languageAlpha3Code?;
    # The name of this geographic entity as known in this language.
    string name?;
};

public type ReturnsParameterUsageModelFetchResult record {
    int '\@recordsetCount?;
    ReturnsParameterUsageModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type TaxCodeModelFetchResult record {
    int '\@recordsetCount?;
    TaxCodeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Cycle Safe Expiration results.
public type FilingsCheckupAuthorityModel record {
    # Unique ID of the tax authority
    int taxAuthorityId?;
    # Location Code of the tax authority
    string locationCode?;
    # Name of the tax authority
    string taxAuthorityName?;
    # Type Id of the tax authority
    int taxAuthorityTypeId?;
    # Jurisdiction Id of the tax authority
    int jurisdictionId?;
    # Amount of tax collected in this tax authority
    decimal tax?;
    # Tax Type collected in the tax authority
    string taxTypeId?;
    # Suggested forms to file due to tax collected
    FilingsCheckupSuggestedFormModel[] suggestedForms?;
};

public type NoticeRootCauseDetailModelFetchResult record {
    int '\@recordsetCount?;
    NoticeRootCauseDetailModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Model that has the matching count for an errorcode
public type ErrorCodeOutputModel record {
    # Name of the error code
    string errorCode?;
    # Number of error code recorded
    int count?;
};

# 
public type EcmsDetailTaxCodeModel record {
    # Id of the exempt certificate detail tax code
    int exemptCertDetailTaxCodeId?;
    # exempt certificate detail id
    int exemptCertDetailId?;
    # tax code id
    int taxCodeId?;
};

# A preferred program is a customs and/or duty program that can be used to handle cross-border transactions.
# Customers who sign up for a preferred program may obtain better terms for their customs and duty payments.
#             
# To indicate that your company has signed up for a preferred program, specify the `code` value from this
# object as the value for the `AvaTax.LC.PreferredProgram` parameter in your transaction.
public type PreferredProgramModel record {
    # The unique ID number representing this preferred program.
    int id?;
    # A code that identifies this preferred program.  To select this program, specify this code
    # value in the `AvaTax.LC.PreferredProgram` parameter.
    string code?;
    # The ISO 3166 country code for the origin permitted by this program
    string originCountry?;
    # The ISO 3166 country code for the destination permitted by this program
    string destinationCountry?;
    # The earliest date for which this preferred program can be used in AvaTax.  If `null`, this preferred program
    # is valid for all dates earlier than `endDate`.
    string effectiveDate?;
    # The latest date for which this preferred program can be used in AvaTax.  If `null`, this preferred program
    # is valid for all dates later than `effectiveDate`.
    string endDate?;
};

# Response model of error transaction batch delete
public type DeleteErrorTransactionsResponseModel record {
    # The individual result of each error transaction in the request batch
    DeleteErrorTransactionResponseModel[] results?;
};

public type AdvancedRuleLookupFileModelFetchResult record {
    int '\@recordsetCount?;
    AdvancedRuleLookupFileModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Tax Notice Status Model
public type NoticeStatusModel record {
    # The unique ID number of this tax authority type.
    int id;
    # The description name of this tax authority type.
    string description;
    # True if a tax notice in this status is considered 'open' and has more work expected to be done before it is closed.
    boolean isOpen?;
    # If a list of status values is to be displayed in a dropdown, they should be displayed in this numeric order.
    int sortOrder?;
};

# Address Resolution Model
public type AddressResolutionModel record {
    # Represents a base address element.
    AddressInfo address?;
    # The validated address or addresses
    ValidatedAddressInfo[] validatedAddresses?;
    # Coordinate Info
    CoordinateInfo coordinates?;
    # The resolution quality of the geospatial coordinates
    string resolutionQuality?;
    # List of informational and warning messages regarding this address
    TaxAuthorityInfo[] taxAuthorities?;
    # List of informational and warning messages regarding this address
    AvaTaxMessage[] messages?;
};

public type SubscriptionModelFetchResult record {
    int '\@recordsetCount?;
    SubscriptionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Model to create a new tax notice responsibility type.
public type CreateNoticeResponsibilityTypeModel record {
    # The description name of this notice responsibility
    string description?;
    # Defines if the responsibility is active
    boolean isActive?;
    # The sort order of this responsibility
    int sortOrder?;
};

# Tax Notice Reason Model
public type NoticeReasonModel record {
    # The unique ID number of this tax notice customer type.
    int id;
    # The description name of this tax authority type.
    string description;
    # A flag if the type is active
    boolean activeFlag?;
    # sort order of the types
    int sortOrder?;
};

# Represents an ECMS record, used internally by AvaTax to track information about exemptions.
public type EcmsDetailModel record {
    # Unique, system-assigned identifier of a ExemptCertDetail record.
    int exemptCertDetailId;
    # The calc_id associated with a certificate in CertCapture.
    int exemptCertId;
    # State FIPS
    @constraint:String {maxLength: 2}
    string stateFips;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region;
    # The customer Tax Id Number (tax_number) associated with a certificate. This is same as exemptionNo in Transactions.
    @constraint:String {maxLength: 100}
    string idNo?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # End date of this exempt certificate
    string endDate?;
    # The type of idNo (tax_number) associated with a certificate.
    # Example: Driver's Licence Number, Permit Number.
    @constraint:String {maxLength: 50}
    string idType?;
    # Is the tax code list an exculsion list?
    int isTaxCodeListExclusionList?;
    # optional: list of tax code associated with this exempt certificate detail
    EcmsDetailTaxCodeModel[] taxCodes?;
};

# NoticeRootCause Model
public type NoticeRootCauseModel record {
    # The unique ID number of this notice RootCause.
    int id?;
    # The description name of this notice RootCause
    string description?;
    # Defines if the RootCause is active
    boolean isActive?;
    # The sort order of this RootCause
    int sortOrder?;
};

# Contains information about the general tangible personal property sales tax rates for this jurisdiction.
#             
# This rate is calculated by making assumptions about the tax calculation process.  It does not account for:
#             
# * Sourcing rules, such as origin-and-destination based transactions.
# * Product taxability rules, such as different tax rates for different product types.
# * Nexus declarations, where some customers are not obligated to collect tax in specific jurisdictions.
# * Tax thresholds and rate differences by amounts.
# * And many more custom use cases.
#             
# To upgrade to a fully-featured and accurate tax process that handles these scenarios correctly, please
# contact Avalara to upgrade to AvaTax!
public type TaxRateModel record {
    # The total sales tax rate for general tangible personal property sold at a retail point of presence
    # in this jurisdiction on this date.
    decimal totalRate?;
    # The list of individual rate elements for general tangible personal property sold at a retail
    # point of presence in this jurisdiction on this date.
    RateModel[] rates?;
};

public type CustomerAttributeModelFetchResult record {
    int '\@recordsetCount?;
    CustomerAttributeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type AdvancedRuleExecutionModelFetchResult record {
    int '\@recordsetCount?;
    AdvancedRuleExecutionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# One line item on this transaction.
public type TransactionLineModel record {
    # The unique ID number of this transaction line item.
    int id?;
    # The unique ID number of the transaction to which this line item belongs.
    int transactionId?;
    # The line number or code indicating the line on this invoice or receipt or document.
    string lineNumber?;
    # The unique ID number of the boundary override applied to this line item.
    int boundaryOverrideId?;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use entityUseCode instead.
    # The customer usage type for this line item.  Usage type often affects taxability rules.
    string customerUsageType?;
    # The entity use code for this line item.  Usage type often affects taxability rules.
    string entityUseCode?;
    # A description of the item or service represented by this line.
    string description?;
    # The unique ID number of the destination address where this line was delivered or sold.
    # In the case of a point-of-sale transaction, the destination address and origin address will be the same.
    # In the case of a shipped transaction, they will be different.
    int destinationAddressId?;
    # The unique ID number of the origin address where this line was delivered or sold.
    # In the case of a point-of-sale transaction, the origin address and destination address will be the same.
    # In the case of a shipped transaction, they will be different.
    int originAddressId?;
    # The amount of discount that was applied to this line item.  This represents the difference between list price and sale price of the item.
    # In general, a discount represents money that did not change hands; tax is calculated on only the amount of money that changed hands.
    decimal discountAmount?;
    # The type of discount, if any, that was applied to this line item.
    int discountTypeId?;
    # The amount of this line item that was exempt.
    decimal exemptAmount?;
    # The unique ID number of the exemption certificate that applied to this line item. It is the calc_id associated with a certificate in CertCapture.
    int exemptCertId?;
    # The CertCapture Certificate ID
    string certificateId?;
    # The customer Tax Id Number (tax_number) associated with a certificate - Sales tax calculation requests first determine if there is an applicable
    # ECMS entry available, and will utilize it for exemption processing. If no applicable ECMS entry is available, the AvaTax service
    # will determine if an Exemption Number field is populated or an Entity/Use Code is included in the sales tax calculation request,
    # and will perform exemption processing using either of those two options.
    string exemptNo?;
    # True if this item is taxable.
    boolean isItemTaxable?;
    # True if this item is a Streamlined Sales Tax line item.
    boolean isSSTP?;
    # The code string of the item represented by this line item.
    string itemCode?;
    # The total amount of the transaction, including both taxable and exempt.  This is the total price for all items.
    # To determine the individual item price, divide this by quantity.
    decimal lineAmount?;
    # The quantity of products sold on this line item.
    decimal quantity?;
    # A user-defined reference identifier for this transaction line item.
    string ref1?;
    # A user-defined reference identifier for this transaction line item.
    string ref2?;
    # The date when this transaction should be reported.  By default, all transactions are reported on the date when the actual transaction took place.
    # In some cases, line items may be reported later due to delayed shipments or other business reasons.
    string reportingDate?;
    # The revenue account number for this line item.
    string revAccount?;
    # Indicates whether this line item was taxed according to the origin or destination.
    string sourcing?;
    # The tax for this line in this transaction.
    #             
    # If you used a `taxOverride` of type `taxAmount` for this line, this value
    # will represent the amount of your override.  AvaTax will still attempt to calculate the correct tax
    # for this line and will store that calculated value in the `taxCalculated` field.
    #             
    # You can compare the `tax` and `taxCalculated` fields to check for any discrepancies
    # between an external tax calculation provider and the calculation performed by AvaTax.
    decimal tax?;
    # The taxable amount of this line item.
    decimal taxableAmount?;
    # The amount of tax that AvaTax calculated for the transaction.
    #             
    # If you used a `taxOverride` of type `taxAmount`, there may be a difference between
    # the `tax` field which applies your override, and the `taxCalculated` field which
    # represents the amount of tax that AvaTax calculated without the override.
    #             
    # You can compare the `tax` and `taxCalculated` fields to check for any discrepancies
    # between an external tax calculation provider and the calculation performed by AvaTax.
    decimal taxCalculated?;
    # The code string for the tax code that was used to calculate this line item.
    string taxCode?;
    # The unique ID number for the tax code that was used to calculate this line item.
    int taxCodeId?;
    # The date that was used for calculating tax amounts for this line item.  By default, this date should be the same as the document date.
    # In some cases, for example when a consumer returns a product purchased previously, line items may be calculated using a tax date in the past
    # so that the consumer can receive a refund for the correct tax amount that was charged when the item was originally purchased.
    string taxDate?;
    # The tax engine identifier that was used to calculate this line item.
    string taxEngine?;
    # If a tax override was specified, this indicates the type of tax override.
    string taxOverrideType?;
    # VAT business identification number used for this transaction.
    string businessIdentificationNo?;
    # If a tax override was specified, this indicates the amount of tax that was requested.
    decimal taxOverrideAmount?;
    # If a tax override was specified, represents the reason for the tax override.
    string taxOverrideReason?;
    # Indicates whether the `amount` for this line already includes tax.
    #             
    # If this value is `true`, the final price of this line including tax will equal the value in `amount`.
    #             
    # If this value is `null` or `false`, the final price will equal `amount` plus whatever taxes apply to this line.
    boolean taxIncluded?;
    # DEPRECATED - Date: 04/15/2021, Version: 21.4, Message: Please use merchantSellerIdentifier instead.
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    int merchantSellerId?;
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    string merchantSellerIdentifier?;
    # This field will identify who is remitting Marketplace or Seller. This field must be populated by Marketplace.
    string marketplaceLiabilityType?;
    # The transaction's original ID in its origination system
    string originationDocumentId?;
    # Synonym of Marketplace Origination. Name of the Marketplace where the transaction originated from.
    string originationSite?;
    # Optional: A list of tax details for this line item.
    #             
    # Tax details represent taxes being charged by various tax authorities. Taxes that appear in the `details` collection are intended to be
    # displayed to the customer and charged as a 'tax' on the invoice.
    #             
    # To fetch this list, add the query string `?$include=Details` to your URL.
    TransactionLineDetailModel[] details?;
    # Optional: A list of non-passthrough tax details for this line item.
    #             
    # Tax details represent taxes being charged by various tax authorities. Taxes that appear in the `nonPassthroughDetails` collection are
    # taxes that must be paid directly by the company and not shown to the customer.
    TransactionLineDetailModel[] nonPassthroughDetails?;
    # Optional: A list of location types for this line item.  To fetch this list, add the query string "?$include=LineLocationTypes" to your URL.
    TransactionLineLocationTypeModel[] lineLocationTypes?;
    # Contains a list of extra parameters that were set when the transaction was created.
    TransactionLineParameterModel[] parameters?;
    # Custom user fields/flex fields for this transaction.
    TransactionLineUserDefinedFieldModel[] userDefinedFields?;
    # The cross-border harmonized system code (HSCode) used to calculate tariffs and duties for this line item.
    # For a full list of HS codes, see `ListCrossBorderCodes()`.
    string hsCode?;
    # Indicates the cost of insurance and freight for this line.
    decimal costInsuranceFreight?;
    # Indicates the VAT code for this line item.
    string vatCode?;
    # Indicates the VAT number type for this line item.
    int vatNumberTypeId?;
    # Contains a list of TaxType that are to be overridden with their respective TaxOverrideAmount.
    TransactionLineTaxAmountByTaxTypeModel[] taxAmountByTaxTypes?;
    # Deemed Supplier field indicates which party on the marketplace transaction is liable for collecting and reporting the VAT. This is based on the 2021 E-commerce legislative reforms in EU and UK. This field will not be used until after July 1, 2021.
    string deemedSupplier?;
    # Product category breadcrumbs. This is the full path to the category where item is included. Categories should be separated by “ > “.  Multiple category paths per item are accepted. In this case, category paths should be separated by “;”.
    string category?;
    # A long description of the product.
    string summary?;
};

# Frequency Available object
public type FrequencyAvailableModel record {
    # Frequency Code
    string frequencyCode?;
    # Frequency Name
    string frequencyName?;
    # Reason
    string reason?;
    # Expired Calendar End Date
    AvailableCycleModel[] availableCycles?;
};

# Error Transaction Model
public type ErrorTransactionOutputModel record {
    # Error code of the error result from transaction creation
    string errorCode?;
    # Error message of the error result from transaction creation
    string errorMessage?;
    # The full JSON of the error result from transaction creation
    string avataxErrorJson?;
    # The full JSON of the transaction creation request
    string avataxCreateTransactionJson?;
    # The datasource instance that made the transaction creation call
    string datasource?;
    # The date of the document
    string documentDate?;
    # The date that this ErrorTransaction will be automatically purged from the detabase.
    string expiresAt?;
    # The amount of the transaction.
    decimal amount?;
    # The Datasource source of the transaction creation call.
    string datasourceSource?;
    # The country of the ship to address for the transaction creation call.
    string shipToCountry?;
    # The region of the ship to address for the transaction creation call.
    string shipToRegion?;
    # Type of transaction of the error transaction
    string documentType;
    # The internal reference code (used by the client application) of the error transaction
    @constraint:String {maxLength: 50}
    string documentCode;
};

# Response model used as output for InspectLine API.
public type InspectResponseModel record {
    # A list of determination factors for a line that is being inspected through the InspectLine API.
    DeterminationFactorModel[] determinationFactors?;
};

# The parameter associated with a company location.
public type LocationParameterModel record {
    # The ID number of the parameter.
    int id?;
    # The parameter's name.
    string name;
    # The parameter's value.
    string unit?;
    # The value of the parameter.
    string value;
    # The ID of the company location the parameter associated with.
    int locationId?;
};

# FilingFrequency Model
public type FilingFrequencyModel record {
    # The unique ID number of this filing frequency.
    int id;
    # The description name of this filing frequency
    string description;
};

# Coordinate Info
public type CoordinateInfo record {
    # Latitude
    decimal latitude?;
    # Longitude
    decimal longitude?;
};

# Marketplace Location Output model
public type MarketplaceLocationModel record {
    # Marketplace Location State
    string region?;
    # Marketplace Location Country
    string country?;
    # Marketplace Location Id
    string marketplaceId?;
    # Marketplace Location
    string marketplace?;
    # Marketplace Location Adoption Date
    string marketplaceAdoptionDate?;
    # Marketplace Location End Date
    string marketplaceEndDate?;
    # Marketplace Location Legislative Effective Date
    string legislativeEffectiveDate?;
    # Marketplace Location Enforcement Date
    string enforcementDate?;
    # Marketplace Location Created Date
    string createdDate?;
    # Marketplace Location Modified Date
    string modifiedDate?;
};

public type NoticeCustomerFundingOptionModelFetchResult record {
    int '\@recordsetCount?;
    NoticeCustomerFundingOptionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Base model class for single error transaction delete request
public type ErrorTransactionModelBase record {
    # Type of transaction of the error transaction
    string documentType;
    # The internal reference code (used by the client application) of the error transaction
    @constraint:String {maxLength: 50}
    string documentCode;
};

# Represents information about a newly created account
public type NewAccountModel record {
    # This is the ID number of the account that was created
    int accountId?;
    # This is the email address to which credentials were mailed
    string accountDetailsEmailedTo?;
    # The date and time when this account was created
    string createdDate?;
    # The date and time when account information was emailed to the user
    string emailedDate?;
    # If this account includes any limitations, specify them here
    string limitations?;
    # The license key of the account that was created
    string licenseKey?;
    # The payment url where the payment method can be set up
    string paymentUrl?;
};

public type CompanyModelFetchResult record {
    int '\@recordsetCount?;
    CompanyModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents one file in a batch upload.
public type BatchFileModel record {
    # The unique ID number assigned to this batch file.
    int id?;
    # The unique ID number of the batch that this file belongs to.
    int batchId?;
    # Logical Name of file (e.g. "Input" or "Error").
    @constraint:String {maxLength: 50}
    string name?;
    # Content of the batch file.
    string content;
    # Size of content, in bytes.
    int contentLength?;
    # Content mime type (e.g. text/csv).  This is used for HTTP downloading.
    @constraint:String {maxLength: 100}
    string contentType?;
    # File extension (e.g. CSV).
    @constraint:String {maxLength: 10}
    string fileExtension?;
    # Path to the file - name/S3 key
    string filePath?;
    # Number of errors that occurred when processing this file.
    int errorCount?;
};

# 
public type CompanyReturnSettingModel record {
    # The unique ID of this CompanyReturnsSetting
    int id?;
    # The CompanyReturn Id
    int companyReturnId;
    # The TaxFormCatalog filingQuestionId.
    int filingQuestionId;
    # Filing question code as defined in TaxFormCatalog.
    @constraint:String {maxLength: 255}
    string filingQuestionCode?;
    # The value of this setting
    string value?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# A model for return adjustments.
public type FilingAdjustmentModel record {
    # The unique ID number for the adjustment.
    int id?;
    # The filing return id that this applies too
    int filingId?;
    # The adjustment amount.
    decimal amount;
    # The filing period the adjustment is applied to.
    string period;
    # The type of the adjustment.
    string 'type;
    # Whether or not the adjustment has been calculated.
    boolean isCalculated?;
    # The account type of the adjustment.
    string accountType;
    # A descriptive reason for creating this adjustment.
    string reason?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# 
public type UnitOfBasisModel record {
    # UnitOfBasisId
    int unitOfBasisId?;
    # UnitOfBasis Name
    string unitOfBasis?;
};

# Rebuild a set of filings.
public type RebuildFilingsModel record {
    # Set this value to true in order to rebuild the filings.
    boolean rebuild;
};

# Represents a purchase order number for a transaction
public type PoNumberModel record {
    # Unique ID number
    int id?;
    # Purchase order number.
    string poNumber?;
};

# The CoverLetter model represents a message sent along with an invitation to use CertExpress to
# upload certificates.  An invitation allows customers to use CertExpress to upload their exemption
# certificates directly; this cover letter explains why the invitation was sent.
public type CoverLetterModel record {
    # A unique ID number representing a cover letter sent with a CertExpress invitation.
    int id?;
    # The unique ID number of the AvaTax company that received this certificate.
    int companyId?;
    # The title used when sending the cover letter.
    string title?;
    # The subject message used when sending the cover letter via email.
    string subject?;
    # A full description of the cover letter's contents and message.
    string description?;
    # The date when this record was created.
    string createdDate?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # Is this cover letter active
    boolean active?;
    # How many pages this cover letter encompasses
    int pageCount?;
    # The file name of the cover letter template
    string templateFilename?;
    # The version number of the template
    int 'version?;
};

# 
public type FilingAnswerModel record {
    # The ID number for a filing question
    int filingQuestionId;
    # The value of the answer for the filing question identified by filingQuestionId
    record {} answer?;
};

# Settle this transaction with your ledger by verifying its amounts.
# If the transaction is not yet committed, you may specify the "commit" value to commit it to the ledger and allow it to be reported.
# You may also optionally change the transaction's code by specifying the "newTransactionCode" value.
public type ChangeTransactionCodeModel record {
    # To change the transaction code for this transaction, specify the new transaction code here.
    @constraint:String {maxLength: 50}
    string newCode;
};

public type DataSourceModelFetchResult record {
    int '\@recordsetCount?;
    DataSourceModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Rate type Model
public type RateTypeModel record {
    # The unique ID number of this rate type.
    string id?;
    # Description of this rate type.
    string description?;
    # Country code for this rate type
    string country?;
};

# Information about Avalara-defined tax code types.
# This list is used when creating tax codes and tax rules.
public type TaxCodeTypesModel record {
    # The list of Avalara-defined tax code types.
    record {} types?;
};

# Filing Returns Model
public type FilingReturnModel record {
    # The unique ID number of this filing return.
    int id?;
    # The region id that this return belongs too
    int filingRegionId?;
    # The unique ID number of the filing calendar associated with this return.
    int filingCalendarId?;
    # The resourceFileId of the return.  Will be null if not available.
    int resourceFileId?;
    # Tax Authority ID of this return
    int taxAuthorityId?;
    # The current status of the filing return.
    string status?;
    # The filing frequency of the return.
    string filingFrequency?;
    # The date the return was filed by Avalara.
    string filedDate?;
    # The start date of this return
    string startPeriod?;
    # The end date of this return
    string endPeriod?;
    # The sales amount.
    decimal salesAmount?;
    # The filing type of the return.
    string filingType?;
    # The name of the form.
    string formName?;
    # The remittance amount of the return.
    decimal remitAmount?;
    # The unique code of the form.
    string formCode?;
    # A description for the return.
    string description?;
    # The taxable amount.
    decimal taxableAmount?;
    # The tax amount.
    decimal taxAmount?;
    # The amount collected by avalara for this return
    decimal collectAmount?;
    # The tax due amount.
    decimal taxDueAmount?;
    # The non-taxable amount.
    decimal nonTaxableAmount?;
    # The non-taxable due amount.
    decimal nonTaxableDueAmount?;
    # Consumer use tax liability during the period.
    decimal consumerUseTaxAmount?;
    # Consumer use tax liability accrued during the period.
    decimal consumerUseTaxDueAmount?;
    # Consumer use non-taxable amount.
    decimal consumerUseNonTaxableAmount?;
    # Consumer use taxable amount.
    decimal consumerUseTaxableAmount?;
    # Total amount of adjustments on this return
    decimal totalAdjustments?;
    # The amount of sales excluded from the liability calculation
    decimal excludedSalesAmount?;
    # The amount of non-taxable sales excluded from the liability calculation
    decimal excludedNonTaxableAmount?;
    # The amount of tax excluded from the liability calculation
    decimal excludedTaxAmount?;
    # The amount of carry over sales applied to the liability calculation
    decimal carryOverSalesAmount?;
    # The amount of carry over non taxable sales applied to the liability calculation
    decimal carryOverNonTaxableAmount?;
    # The amount of carry over sales tax applied to the liability calculation
    decimal carryOverTaxAmount?;
    # The amount of carry over consumer use tax applied to the liability calculation
    decimal carryOverConsumerUseTaxAmount?;
    # The total amount of total tax accrued in the current active period
    decimal taxAccrualAmount?;
    # The total amount of sales accrued in the current active period
    decimal salesAccrualAmount?;
    # The total amount of nontaxable sales accrued in the current active period
    decimal nonTaxableAccrualAmount?;
    # The total amount of taxable sales accrued in the current active period
    decimal taxableAccrualAmount?;
    # The total amount of sales tax accrued in the current active period
    decimal salesTaxAccrualAmount?;
    # The total amount of sellers use tax accrued in the current active period
    decimal sellersUseTaxAccrualAmount?;
    # The total amount of consumer use tax accrued in the current active period
    decimal consumerUseTaxAccrualAmount?;
    # The total amount of consumer use taxable sales accrued in the current active period
    decimal consumerUseTaxableAccrualAmount?;
    # The total amount of consumer use non taxable sales accrued in the current active period
    decimal consumerUseNonTaxableAccrualAmount?;
    # The Adjustments for this return.
    FilingAdjustmentModel[] adjustments?;
    # Total amount of augmentations on this return
    decimal totalAugmentations?;
    # The Augmentations for this return.
    FilingAugmentationModel[] augmentations?;
    # Total amount of payments on this return
    decimal totalPayments?;
    # The payments for this return.
    FilingPaymentModel[] payments?;
    # Accrual type of the return
    string accrualType?;
    # The month of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int month?;
    # The year of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int year?;
    # The FilingTaskType for this return.
    string 'type?;
    # The attachments for this return.
    FilingAttachmentModel[] attachments?;
    # An attachment associated with a filing return
    FilingReturnCreditModel excludedCarryOverCredits?;
    # An attachment associated with a filing return
    FilingReturnCreditModel appliedCarryOverCredits?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
};

public type FirmClientLinkageOutputModelFetchResult record {
    int '\@recordsetCount?;
    FirmClientLinkageOutputModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Contains information about a company's exemption certificate status.
#             
# This model can be used to determine if your company is able to use the Customers, Certificates, and
# CertExpressInvites APIs within AvaTax.
public type ProvisionStatusModel record {
    # The status of exemption certificate setup for this company.
    #             
    # If this value is `Finished`, this company will then be able to use the Customers, Certificates, and
    # CertExpressInvites APIs within AvaTax.
    string status?;
    # The accountId of the company represented by this status
    int accountId?;
    # The AvaTax company represented by this status
    int companyId?;
};

# Contains information about nexus jurisdictions that were declared
# as a result of a call to `DeclareNexusByAddress`.  For each address,
# this object model contains a list of the nexus objects that were declared
# according to the geocoding that corresponds to this address.
public type NexusByAddressModel record {
    # Use this object to provide an address and date range where your company does business.
    # This address will be used to determine what jurisdictions you should declare nexus and
    # calculate tax.
    DeclareNexusByAddressModel address?;
    # List of all nexus objects that were affected by declaring nexus at the address specified
    # by `address`.
    NexusModel[] declaredNexus?;
};

# Represents a license key reset request.
public type ResetLicenseKeyModel record {
    # The primary key of the account ID to reset
    int accountId;
    # Set this value to true to reset the license key for this account.
    # This license key reset function will only work when called using the credentials of the account administrator of this account.
    boolean confirmResetLicenseKey;
};

# Represents a bulk upload input model.
public type ItemBulkUploadInputModel record {
    # List of items
    ItemModel[] items?;
};

public type NoticeResponsibilityModelFetchResult record {
    int '\@recordsetCount?;
    NoticeResponsibilityModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a request for a free trial account for AvaTax.
# Free trial accounts are only available on the Sandbox environment.
public type FreeTrialRequestModel record {
    # The first or given name of the user requesting a free trial.
    @constraint:String {maxLength: 50}
    string firstName;
    # The last or family name of the user requesting a free trial.
    @constraint:String {maxLength: 50}
    string lastName;
    # The email address of the user requesting a free trial.
    @constraint:String {maxLength: 50}
    string email;
    # The company or organizational name for this free trial.  If this account is for personal use, it is acceptable
    # to use your full name here.
    string company;
    # The phone number of the person requesting the free trial.
    string phone;
    # Campaign identifier for Notification purpose
    string campaign?;
    # Company Address Information
    CompanyAddress companyAddress;
    # Website of the company or user requesting a free trial
    @constraint:String {maxLength: 50}
    string website?;
    # Read Avalara's terms and conditions is necessary for a free trial account
    boolean haveReadAvalaraTermsAndConditions;
    # Accept Avalara's terms and conditions is necessary for a free trial
    boolean acceptAvalaraTermsAndConditions;
};

# An input model for executing a report detailed to the document line level
public type ExportDocumentLineModel record {
    # The file format.
    string format?;
    # The start date filter for report execution. If no date provided, same date of last month will be used as the startDate.
    # Accepts date in short format yyyy-mm-dd as well as date time stamp
    string startDate?;
    # The end date filter for report execution. If no date provided, today's date will be used as the endDate.
    # Accepts date in short format yyyy-mm-dd as well as date time stamp
    string endDate?;
    # The transactions in the country you wish to run a report.
    # Use "ALL" for all countries
    # Use "ALL Non-US" for all international countries
    # Or use a single 2-char ISO country code
    string country?;
    # The state associated with the transactions you wish to run a report.
    # Use "ALL" for all states or 2-char state code.
    string state?;
    # The type of date to filter your transactions
    string dateFilter?;
    # The transaction type you want to run a report on
    string docType?;
    # The currency your report is displayed in.
    # Accepts "USD" or leave this blank to get all the documents with all the currencies
    string currencyCode?;
    # Number of partitions (2 - 250) to split the report into.
    # If a value is provided for this property, a value must also be provided for the partition property.
    int numberOfPartitions?;
    # The zero-based partition number to retrieve in this export request.
    # If a value is provided for this property, a value must also be provided for the numberOfPartitions property.
    int partition?;
    # If true, include only documents that are locked.
    # If false, include only documents that are not locked.
    # Defaults to false if not specified.
    boolean isLocked?;
    # If set, include only documents associated with these merchantSellerIds.Multiple merchantSellerIds should be sent by comma separated values.
    string merchantSellerIdentifier?;
    # DocumentStatus
    # For documentStatus, accepted values are: Saved, Posted, Committed, Cancelled
    string documentStatus?;
    # Use this parameter when dateFilter = ModifiedDate.
    # For dateFilter = DocumentDate, PaymentDate, TaxDate or ReportingDate, the isModifiedDateSameAsDocumentDate parameter is ignored.
    # Set this parameter to true when you would like to get Documents which have the Document Date same as Modified Date.
    # Defaults to false if not specified.
    boolean isModifiedDateSameAsDocumentDate?;
    # TaxGroup is required to support Sales tax (Sales + SellersUse) and VAT (Input+ Output).
    # TaxTypes, such as Lodging, Bottle, LandedCost, Ewaste, BevAlc, etc
    string taxGroup?;
    # The description of the tax
    string taxName?;
    # The AvaTax tax code or customer tax code associated with the item or SKU in the transaction
    string taxCode?;
    # The code your business application uses to identify a customer or vendor
    string customerVendorCode?;
    # Defines the individual taxes associated with a TaxType category, such as Lodging TaxType which supports numerous TaxSubTypes, including Hotel, Occupancy, ConventionCenter, Accommotations, etc.
    string taxSubType?;
};

# The tax region model.
public type TaxRegionModel record {
    # The id of the tax region.
    int id?;
    # The code of the tax region.
    string code?;
    # The name of the tax region.
    string name?;
    # The name of the county.
    string county?;
    # The name of the city.
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country of this jurisdiction.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # The ser code.
    string serCode?;
    # The tax region signature code.
    string signatureCode?;
    # The date this tax region starts to take effect.
    string effectiveDate?;
    # The date this tax region stops to take effect.
    string endDate?;
    # Is Acm flag.
    boolean isAcm?;
    # Is SST flag.
    boolean isSst?;
    # List of jurisdictions associated with this tax region.
    DenormalizedJurisModel[] jurisdictions?;
};

# Describes an element in the harmonized tariff system.
#             
# According to the [United States International Trade Commission](https://www.usitc.gov), the harmonized tariff schedule is defined as follows:
#             
# The HTS is a U.S. nomenclature system used to classify traded goods based on their material composition, product name, and/or intended
# function. The HTS is designed so that each article falls into only one category. It is divided into chapters, each of which has a 2-digit
# number. Each product category within the various chapters is designated by 4, 6, 8, or 10 digits. The 4-digit categories are called
# "headings." The 6-, 8- and 10-digit classifications are called "subheadings."
#             
# Within AvaTax, the `HsCodeModel` object can refer to sections, chapters, headings, subheadings, or articles.  Each object represents one
# classification.  Many of these objects have child objects underneath them; these child objects are more specific than their parent objects.
public type HsCodeModel record {
    # The harmonized tariff system code for this section and chapter.
    #             
    # A full HS code contains more than six characters.  Partial HS codes with two, four, or six characters may have child codes underneath them.
    # A child code is one that contains greater specificity than a parent code.  It is recommended that when you identify a product you use
    # the most detailed code available to identify it.
    #             
    # Top level sections do not have HS Codes.
    @constraint:String {maxLength: 25}
    string hsCode?;
    # A unique identifier for this harmonized tariff system code.
    #             
    # To search for a list of child codes underneath a specific HS code, search for codes where the child's `parentHsCodeId` value matches the parent's `id` value.
    int id;
    # The unique ID number of the parent HS code or HS code prefix.
    #             
    # To search for a list of child codes underneath a specific HS code, search for codes where the child's `parentHsCodeId` value matches the parent's `id` value.
    int parentHsCodeId?;
    # A human readable description that identifies Code descriptive text for this Section, Chapter, Heading, or Subheading.
    string description;
    # The system to which this HS code belongs.
    string system?;
    # The destination country identified with this HS Code.  This value applies when certain products are classified in specific ways by
    # bilateral trade agreements.
    string destinationCountry?;
    # For codes that have been expired or defined on specific dates, this value indicates the earliest
    # date for which this code is considered valid.
    #             
    # If this value is null, this code can be used for any valid date earlier than its end date.
    string effDate?;
    # For codes that have been expired or defined on specific dates, this value indicates the latest
    # date for which this code is considered valid.
    #             
    # If this value is null, this code can be used for any valid date later than its effective date.
    string endDate?;
};

# An AvaTax account.
public type AccountModel record {
    # The unique ID number assigned to this account.
    int id;
    # For system registrar use only.
    @constraint:String {maxLength: 100}
    string crmid?;
    # The name of this account.
    @constraint:String {maxLength: 50}
    string name;
    # The earliest date on which this account may be used.
    string effectiveDate?;
    # If this account has been closed, this is the last date the account was open.
    string endDate?;
    # The current status of this account.
    string accountStatusId?;
    # The type of this account.
    string accountTypeId?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # Optional: A list of subscriptions granted to this account.  To fetch this list, add the query string "?$include=Subscriptions" to your URL.
    SubscriptionModel[] subscriptions?;
    # Optional: A list of all the users belonging to this account.  To fetch this list, add the query string "?$include=Users" to your URL.
    UserModel[] users?;
    # Is Saml based authentication used by this account for user to login via AI.
    boolean isSamlEnabled?;
};

# Information about a tax authority relevant for an address.
public type TaxAuthorityInfo record {
    # A unique ID number assigned by Avalara to this tax authority.
    string avalaraId?;
    # The friendly jurisdiction name for this tax authority.
    @constraint:String {maxLength: 128}
    string jurisdictionName;
    # The type of jurisdiction referenced by this tax authority.
    string jurisdictionType?;
    # An Avalara-assigned signature code for this tax authority.
    @constraint:String {maxLength: 4}
    string signatureCode?;
};

# Response when checking if a company has a POA on file with Avalara
public type PowerOfAttorneyCheckModel record {
    # companyId of the request
    int companyId?;
    # Country POA is for
    string country?;
    # Region POA is for
    string region?;
    # Notes if there is an actice POA
    boolean activePoa?;
    # Effective Date of the POA
    string effectiveDate?;
    # End Date of POA
    string expirationDate?;
    # Represents everything downloaded from resource files
    ResourceFileDownloadResult availablePoa?;
};

public type HsCodeModelFetchResult record {
    int '\@recordsetCount?;
    HsCodeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a single notification.
#             
# A notification is a message from Avalara that may have relevance to your business.  You may want
# to regularly review notifications and then dismiss them when you are certain that you have addressed
# any relevant concerns raised by this notification.
#             
# An example of a notification would be a message about new software, or a change to AvaTax that may
# affect you, or a potential issue with your company's tax profile.
public type NotificationModel record {
    # The unique id of the notification.
    int id?;
    # The unique ID number of the account that received this notification.
    int accountId?;
    # If this notification was tied to a specific company, this will be the
    # unique ID number of the company that received the notification.  Notifications that
    # are tied to accounts will have a `NULL` value for `companyId`.
    int companyId?;
    # The type name of object referred to by this notification, if any.
    #             
    # Some notifications may include information about a related data object.
    #             
    # For example, if this notification was related to a nexus declaration, the `referenceObject` field would
    # be  `Nexus` and the `referenceId` field would be the unique ID number of that nexus.
    @constraint:String {maxLength: 20}
    string referenceObject?;
    # The unique reference Id number of the object referred to by this notification, if any.
    #             
    # Some notifications may include information about a related data object.
    #             
    # For example, if this notification was related to a nexus declaration, the `referenceObject` field would
    # be  `Nexus` and the `referenceId` field would be the unique ID number of that nexus.
    int referenceId?;
    # The severity level of the notification.
    string severityLevelId;
    # The category of this notification.
    #             
    # Notification categories are a useful way to group related notifications together. Category names may change
    # over time.
    #             
    # For Example: "Backdated Transactions" or "Nexus Jurisdiction Alerts", or "Certificate Expiration".
    @constraint:String {maxLength: 50}
    string category?;
    # The topic of this notification.
    #             
    # Notification topics contain information about the notification.  They are a summary of the issue and can
    # help you decide what type of action to take.
    #             
    # For Example: "Backdated Transactions" or "Nexus Jurisdiction Alerts", or "Certificate Expiration".
    @constraint:String {maxLength: 250}
    string topic?;
    # The message for this notification.  This is a friendly description of the notification and any relevant
    # information that can help you decide what kind of action, if any, to take in response.
    string message;
    # If this notification object requires user action to resolve, this value will be set to true.
    boolean needsAction?;
    # If there is a specific action suggested by this notification, this is the name of the action.
    #             
    # An action is a suggested next step such as "Review Your Tax Profile."  If an action is suggested,
    # you should give the viewer a hyperlink to the location referred to by `actionLink` and give the
    # hyperlink the name `actionName`.
    @constraint:String {maxLength: 250}
    string actionName?;
    # If there is a specific action suggested by this notification, this is the URL of the action.
    #             
    # An action is a suggested next step such as "Review Your Tax Profile."  If an action is suggested,
    # you should give the viewer a hyperlink to the location referred to by `actionLink` and give the
    # hyperlink the name `actionName`.
    @constraint:String {maxLength: 250}
    string actionLink?;
    # If there is a specific action suggested by this notification, and if this action is requested
    # by a specific due date, this value will be the due date for the action.
    #             
    # An action is a suggested next step such as "Review Your Tax Profile."  If an action is suggested,
    # you should give the viewer a hyperlink to the location referred to by `actionLink` and give the
    # hyperlink the name `actionName`.
    #             
    # For actions that have deadlines, such as "Confirm your tax registration before filing", this value
    # will be set to the deadline date for the action.  Otherwise, this value will be null.
    string actionDueDate?;
    # When a user has finished reviewing a notification, they may opt to dismiss it by calling the
    # `DismissNotification` API.  This API marks the notification as dismissed, and dismissed notifications
    # will generally not appear in most user interfaces.
    boolean dismissed?;
    # If this notification has been dismissed, this indicates the unique ID number of the user that
    # dismissed the notification.
    int dismissedByUserId?;
    # If this notification has been dismissed, this indicates the timestamp (in UTC time) when the user
    # dismissed the notification.
    string dismissedDate?;
    # If this notification is time sensitive, this is the latest date when the notification should be
    # displayed to the user.
    string expireDate;
    # The unique ID number of the user who created the notification.
    int createdUserId?;
    # The UTC timestamp of the time when this notification was created.
    string createdDate?;
    # The unique ID number of the user who most recently modified this notification.
    int modifiedUserId?;
    # The UTC timestamp of the time when this notification was last modified.
    string modifiedDate?;
};

# A custom field provides extra information about a customer or certificate.
#             
# Custom fields are provided to permit you to store additional information about an exemption certificate or customer.  They are available to
# support additional use cases beyond that supported directly by Avalara's exemption certificate software.
#             
# For more information about custom fields, see the [Avalara Help Center article about custom fields](https://help.avalara.com/0021_Avalara_CertCapture/All_About_CertCapture/Edit_or_Remove_Details_about_Customers).
public type CustomFieldModel record {
    # The name of the custom field.
    string name?;
    # The value of the custom field.
    string value?;
};

# Company Address Information
public type CompanyAddress record {
    # Address Line1
    @constraint:String {maxLength: 100}
    string line;
    # City
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # Postal Code
    @constraint:String {maxLength: 10}
    string postalCode;
};

# Represents a validated address
public type ValidatedAddressInfo record {
    # Address type code. One of:
    # * Firm or company address
    # * General Delivery address
    # * High-rise or business complex
    # * PO Box address
    # * Rural route address
    # * Street or residential address
    string addressType?;
    # First line of the street address
    @constraint:String {maxLength: 50}
    string line1?;
    # Second line of the street address
    @constraint:String {maxLength: 100}
    string line2?;
    # Third line of the street address
    @constraint:String {maxLength: 100}
    string line3?;
    # City component of the address
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Postal Code / Zip Code component of the address.
    @constraint:String {maxLength: 11}
    string postalCode?;
    # Geospatial latitude measurement, in Decimal Degrees floating point format.
    decimal latitude?;
    # Geospatial longitude measurement, in Decimal Degrees floating point format.
    decimal longitude?;
};

public type LocationParameterModelFetchResult record {
    int '\@recordsetCount?;
    LocationParameterModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type NoticeTypeModelFetchResult record {
    int '\@recordsetCount?;
    NoticeTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# An exemption reason defines why a certificate allows a customer to be exempt
# for purposes of tax calculation.  For a full list of defined exemption reasons,
# please call the `ListCertificateExemptionReasons` API.
public type ExemptionReasonModel record {
    # A unique ID number representing this exemption reason.
    int id?;
    # A friendly name describing this exemption reason.
    string name?;
};

# Model to add specific lines to exising transaction
public type AddTransactionLineModel record {
    # company code
    string companyCode;
    # document code for the transaction to add lines
    string transactionCode;
    # document type
    string documentType?;
    # List of lines to be added
    LineItemModel[] lines;
    # Option to renumber lines after add. After renumber, the line number becomes: "1", "2", "3", ...
    boolean renumber?;
};

public type UnitOfBasisModelFetchResult record {
    int '\@recordsetCount?;
    UnitOfBasisModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type IsoRegionModelFetchResult record {
    int '\@recordsetCount?;
    IsoRegionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type FilingReturnModelBasicFetchResult record {
    int '\@recordsetCount?;
    FilingReturnModelBasic[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type FilingRequestModelFetchResult record {
    int '\@recordsetCount?;
    FilingRequestModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type NotificationModelFetchResult record {
    int '\@recordsetCount?;
    NotificationModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# A flattened model for jurisdictions and rates.
public type ComplianceJurisdictionRateModel record {
    # The id of the jurisdiction.
    int jurisdictionId?;
    # Name or ISO 3166 code identifying the country of this jurisdiction.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # The name of the jurisdiction.
    string name?;
    # The type of the jurisdiction, indicating whether it is a country, state/region, city, for example.
    string jurisdictionTypeId?;
    # The compontent rate.
    decimal rate?;
    # The rate type.
    string rateTypeId?;
    # The tax type.
    string taxTypeId?;
    # The date this rate is starts to take effect.
    string effectiveDate?;
    # The date this rate is no longer active.
    string endDate?;
    # The state assigned code.
    string stateAssignedCode?;
    # The id of the tax authority.
    int taxAuthorityId?;
};

# Indicates the customer's exemption status in a specific country and region.
public type ExemptionStatusModel record {
    # The exemption status of this customer in this country/region.
    string status?;
    # A certificate is a document stored in either AvaTax Exemptions or CertCapture.  The certificate document
    # can contain information about a customer's eligibility for exemption from sales or use taxes based on
    # criteria you specify when you store the certificate.  To view or manage your certificates directly, please
    # log onto the administrative website for the product you purchased.
    CertificateModel certificate?;
};

# Represents everything downloaded from resource files
public type ResourceFileDownloadResult record {
    # True if this download succeeded
    boolean success?;
    # Bytes of the file
    string bytes?;
    # Original filename
    string filename?;
    # Mime content type
    string contentType?;
};

public type ProductClassificationSystemModelFetchResult record {
    int '\@recordsetCount?;
    ProductClassificationSystemModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# usage of system defined parameters.
public type ParameterUsageModel record {
    # The unique ID number of this property.
    int id?;
    # The id of the parameter.
    int parameterId?;
    # Product code for the parameter usage item.
    string productCode?;
    # The country for the parameter usage item.
    string country?;
    # The state for the parameter usage item.
    string region?;
    # System Id for the parameter usage item
    int systemId?;
    # tax type for the parameter usage item.
    string taxTypeId?;
    # The type of parameter as determined by its application, e.g. Product, Transaction, Calculated
    string attributeType?;
    # The name of the property.  To use this property, add a field on the `parameters` object of a [CreateTransaction](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/) call.
    string name?;
    # The data type of the property.
    string dataType?;
    # Help text to be shown to the user when they are filling out this parameter.  Help text may include HTML links to additional
    # content with more information about a parameter.
    string helpText?;
    # Label that helps the user to identify a parameter
    string label?;
    # A help url that provides more information about the parameter
    string helpUrl?;
    # If the parameter is of enumeration data type, then this list will be populated with all of the possible enumeration values.
    string[] values?;
    # The unit of measurement type of the parameter
    string measurementType?;
};

# Model to create a new tax notice root cause type.
public type CreateNoticeRootCauseTypeModel record {
    # The description name of this notice RootCause
    string description?;
    # Defines if the RootCause is active
    boolean isActive?;
    # The sort order of this RootCause
    int sortOrder?;
};

public type LocationQuestionModelFetchResult record {
    int '\@recordsetCount?;
    LocationQuestionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a classification for a given item.
public type ClassificationModel record {
    # The product code of an item in a given system.
    @constraint:String {maxLength: 25}
    string productCode;
    # The system code in which the product belongs.
    @constraint:String {maxLength: 25}
    string systemCode?;
};

# Model with options for adding a new filing calendar
public type CycleAddOptionModel record {
    # True if this form can be added and filed for the current cycle. "Current cycle" is considered one month before the month of today's date.
    boolean available?;
    # The period start date for the customer's first transaction in the jurisdiction being added
    string transactionalPeriodStart?;
    # The period end date for the customer's last transaction in the jurisdiction being added
    string transactionalPeriodEnd?;
    # The jurisdiction-assigned due date for the form
    string filingDueDate?;
    # A descriptive name of the cycle and due date of form.
    string cycleName?;
    # The filing frequency of the form
    string frequencyName?;
    # A code assigned to the filing frequency
    string filingFrequencyCode?;
    # The filing frequency of the request
    string filingFrequencyId?;
    # An explanation for why this form cannot be added for the current cycle
    string cycleUnavailableReason?;
    # A list of outlet codes that can be assigned to this form for the current cycle
    string[] availableLocationCodes?;
};

# Represents a parameter associated with a company.
public type CompanyParameterDetailModel record {
    # Identifier for company parameter
    int id?;
    # CompanyId associated with the parameter
    int companyId?;
    # The parameter's name
    string name;
    # The value of the parameter
    string value;
    # The unit of measurement code for the parameter
    string unit?;
};

# Nexus summary model
public type NexusSummaryModel record {
    # Company Id
    int companyId?;
    # Nexus summary for this company
    NexusTaxTypeGroupCountModel[] nexusSummary?;
};

# Represents one line item in a MultiDocument transaction
public type MultiDocumentLineItemModel record {
    # Specify the code of the company for this line of transaction.
    #             
    # If you leave this value null, the `companyCode` at the root level will be used instead.
    string companyCode?;
    # Sets the sale location code (Outlet ID) for reporting this document to the tax authority.
    #             
    # If you leave this value `null`, the `reportingLocationCode` at the root level will be used instead.
    string reportingLocationCode?;
    # The line number of this line within the document.  This can be any text that is useful to you, such as numeric line numbers, alphabetic line numbers, or other text.
    @constraint:String {maxLength: 50}
    string number?;
    # Quantity of items in this line.  This quantity value should always be a positive value representing the quantity of product that changed hands, even when handling returns or refunds.
    #             
    # If not provided, or if set to zero, the quantity value is assumed to be one (1).
    decimal quantity?;
    # Total amount for this line.  The amount represents the net currency value that changed hands from the customer (represented by the `customerCode` field) to the company (represented by the `companyCode`) field.
    #             
    # For sale transactions, this value must be positive.  It indicates the amount of money paid by the customer to the company.
    #             
    # For refund or return transactions, this value must be negative.
    decimal amount;
    # Information about all the addresses involved in this transaction.
    #             
    # For a physical in-person transaction at a retail point-of-sale location, please specify only one address using
    # the `singleLocation` field.
    #             
    # For a transaction that was shipped, delivered, or provided from an origin location such as a warehouse to
    # a destination location such as a customer, please specify the `shipFrom` and `shipTo` addresses.
    #             
    # In the United States, some jurisdictions recognize the address types `pointOfOrderOrigin` and `pointOfOrderAcceptance`.
    # These address types affect the sourcing models of some transactions.
    #             
    # If latitude and longitude information is provided for any of these addresses along with line, city, region, country and postal code information,
    # we will be using only latitude and longitude and will discard line, city, region, country and postal code information for the transaction.
    # Please ensure that you have the correct latitude/longitude information for the addresses prior to using the API.
    # If you provide either latitude or longitude information but not both, we will be using the line, city, region, country and postal code information for the addresses.
    AddressesModel addresses?;
    # Tax Code - System or Custom Tax Code.
    #             
    # You can use your own tax code mapping or standard Avalara tax codes.  For a full list of tax codes, see `ListTaxCodes`.
    @constraint:String {maxLength: 25}
    string taxCode?;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use `entityUseCode` instead.
    @constraint:String {maxLength: 25}
    string customerUsageType?;
    # Entity Use Code - The client application customer or usage type.  This field allows you to designate a type of usage that
    # may make this transaction considered exempt by reason of exempt usage.
    #             
    # For a list of entity use codes, see the Definitions API `ListEntityUseCodes`.
    @constraint:String {maxLength: 25}
    string entityUseCode?;
    # Item Code (SKU).  If you provide an `itemCode` field, the AvaTax API will look up the item you created with the `CreateItems` API call
    # and use all the information available about that item for this transaction.
    @constraint:String {maxLength: 50}
    string itemCode?;
    # The customer Tax Id Number (tax_number) associated with a certificate - Sales tax calculation requests first determine if there is an applicable
    # ECMS entry available, and will utilize it for exemption processing. If no applicable ECMS entry is available, the AvaTax service
    # will determine if an Exemption Number field is populated or an Entity/Use Code is included in the sales tax calculation request,
    # and will perform exemption processing using either of those two options.
    # Note: This is same as 'exemptNo' in TransactionModel.
    string exemptionCode?;
    # True if the document discount should be applied to this line.  If this value is false, or not provided, discounts will not be
    # applied to this line even if they are specified on the root `discount` element.
    boolean discounted?;
    # Indicates whether the `amount` for this line already includes tax.
    #             
    # If this value is `true`, the final price of this line including tax will equal the value in `amount`.
    #             
    # If this value is `null` or `false`, the final price will equal `amount` plus whatever taxes apply to this line.
    boolean taxIncluded?;
    # Revenue Account (Customer Defined Field).
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 50}
    string revenueAccount?;
    # Ref1 (Customer Defined Field)
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 250}
    string ref1?;
    # Ref2 (Customer Defined Field)
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 250}
    string ref2?;
    # Item description.
    #             
    # For Streamlined Sales Tax (SST) customers, this field is required if an unmapped `itemCode` is used.
    @constraint:String {maxLength: 2096}
    string description?;
    # VAT business identification number for the customer for this line item.  If you leave this field empty,
    # this line item will use whatever business identification number you provided at the transaction level.
    #             
    # If you specify a VAT business identification number for the customer in this transaction and you have also set up
    # a business identification number for your company during company setup, this transaction will be treated as a
    # business-to-business transaction for VAT purposes and it will be calculated according to VAT tax rules.
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # Represents a tax override for a transaction
    TaxOverrideModel taxOverride?;
    # Special parameters that apply to this line within this transaction.
    #             
    # To get a full list of available parameters, please use the `ListParameters` API.
    TransactionLineParameterModel[] parameters?;
    # Custom user fields/flex fields for this line.
    TransactionLineUserDefinedFieldModel[] userDefinedFields?;
    # The Item code for Custom Duty / Global Import tax determination
    # Harmonized Tariff System code for this transaction.
    #             
    # For a list of harmonized tariff codes, see the Definitions API for harmonized tariff codes.
    @constraint:String {maxLength: 25}
    string hsCode?;
    # DEPRECATED - Date: 04/15/2021, Version: 21.4, Message: Please use merchantSellerIdentifier instead.
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    int merchantSellerId?;
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    @constraint:String {maxLength: 100}
    string merchantSellerIdentifier?;
    # This field will identify who is remitting Marketplace or Seller. This field must be populated by Marketplace.
    string marketplaceLiabilityType?;
    # The transaction's original ID in its origination system
    @constraint:String {maxLength: 50}
    string originationDocumentId?;
    # Synonym of Marketplace Origination. Name of the Marketplace where the transaction originated from.
    @constraint:String {maxLength: 60}
    string originationSite?;
    # Product category breadcrumbs. This is the full path to the category where item is included. Categories should be separated by “ > “.  Multiple category paths per item are accepted. In this case, category paths should be separated by “;”.
    @constraint:String {maxLength: 4000}
    string category?;
    # A long description of the product.
    @constraint:String {maxLength: 4000}
    string summary?;
};

public type CompanyUserDefinedFieldModelFetchResult record {
    int '\@recordsetCount?;
    CompanyUserDefinedFieldModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ExposureZoneModelFetchResult record {
    int '\@recordsetCount?;
    ExposureZoneModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# usage of system defined parameters.
public type ClassificationParameterUsageMapModel record {
    # The unique ID number of this property.
    int id?;
    # The id of the parameter.
    int parameterId?;
    # tax type group id for the classification parameter usage item.
    string taxTypeGroupId?;
    # This defines if the parameter is recommeded ,optional or mandatory
    string visibility?;
    # The type of parameter as determined by its application, e.g. Product, Transaction, Calculated
    string attributeType?;
    # The name of the property.  To use this property, add a field on the `parameters` object of a [CreateTransaction](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/) call.
    string name?;
    # The data type of the property.
    string dataType?;
    # Help text to be shown to the user when they are filling out this parameter.  Help text may include HTML links to additional
    # content with more information about a parameter.
    string helpText?;
    # Label that helps the user to identify a parameter
    string label?;
    # A help url that provides more information about the parameter
    string helpUrl?;
    # If the parameter is of enumeration data type, then this list will be populated with all of the possible enumeration values.
    string[] values?;
    # The unit of measurement type of the parameter
    string measurementType?;
};

# Represents a System Country.
public type ProductSystemCountryModel record {
    # Its Integer SystemCountryId value for SystemCountry
    int systemCountryId?;
    # Its Integer SystemId value for SystemCountry
    int systemId?;
    # string value of country code for SystemCountry
    string country?;
    # DateTime as EffDate for SystemCountry
    string effDate?;
    # DateTime as EffDate for SystemCountry
    string endDate?;
};

public type TaxAuthorityModelFetchResult record {
    int '\@recordsetCount?;
    TaxAuthorityModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a parameter associated with a company.
public type CustomerSupplierCountryParamModel record {
    # Identifier for company parameter
    int id?;
    # CompanyId associated with the parameter
    int companyId?;
    # Identifier for company parameter
    int customerId?;
    # 
    string customerCode?;
    # 
    string country;
    # 
    boolean isEstablished?;
    # 
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # 
    boolean isRegisteredThroughFiscalRep?;
};

# Commit this transaction as permanent
public type LockTransactionModel record {
    # Set this value to be true to commit this transaction.
    # Committing a transaction allows it to be reported on a tax return.  Uncommitted transactions will not be reported.
    boolean isLocked;
};

# Represents a change request for filing status for a company
public type FilingStatusChangeModel record {
    # Indicates the filing status you are requesting for this company
    string requestedStatus?;
};

public type AuditModelFetchResult record {
    int '\@recordsetCount?;
    AuditModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents an invitation for a customer to use CertExpress to self-report their own certificates.
# This invitation is delivered by your choice of method, or you can present a hyperlink to the user
# directly in your connector.  Your customer will be redirected to https://app.certexpress.com/ where
# they can follow a step-by-step guide to enter information about their exemption certificates.  The
# certificates entered will be recorded and automatically linked to their customer record.
public type CertExpressInvitationModel record {
    # A unique ID number representing this CertExpress invitation.
    int id?;
    # The unique ID number of the AvaTax company that sent this invitation.
    int companyId?;
    # The email address to which this invitation was sent.  If this invitation was presented as a weblink, this value will be null.
    string recipient?;
    # The unique code of the customer that received this invitation.
    # Note: This field is case sensitive. To have exemption certificates apply, this value should
    # be the same as the one passed to create a customer.
    string customerCode?;
    # Represents a customer to whom you sell products and/or services.
    CustomerModel customer?;
    # The CoverLetter model represents a message sent along with an invitation to use CertExpress to
    # upload certificates.  An invitation allows customers to use CertExpress to upload their exemption
    # certificates directly; this cover letter explains why the invitation was sent.
    CoverLetterModel coverLetter?;
    # The status of the emails associated with this invitation.  If this invitation was sent via email,
    # this value will change to `Sent` when the email message has been sent.
    string emailStatus?;
    # True if this invitation contained a cover letter only.
    boolean coverLettersOnly?;
    # When an invitation is sent, it contains a list of exposure zones for which the customer is invited to upload
    # their exemption certificates.  This list contains the ID numbers of the exposure zones identified.
    #             
    # For a list of exposure zones, please call `ListCertificateExposureZones`.
    int[] exposureZones?;
    # The list of exemption reasons identified by this CertExpress invitation.
    #             
    # For a list of reason codes, please call `ListCertificateExemptReasons`.
    int[] exemptReasons?;
    # Indicates the method that was used to deliver this CertExpress invitation.
    string deliveryMethod?;
    # The custom message delivered with this invitation.
    string message?;
    # The date of the invitation.
    string date?;
    # The web link (URL) that a customer can click on or visit to begin using this CertExpress invitation.
    #             
    # This value is only usable if the status of this invitation is `Ready` and the request was created with type `Download`.
    # NOTE: This link usually takes a few minutes to be available.
    string requestLink?;
};

# Represents a item upload error model.
public type ItemUploadErrorModel record {
    # Row index of an item
    int rowIndex?;
    # Item code
    string itemCode?;
    # List of errors for against given item code
    string[] errors?;
};

public type NexusParameterDetailModelFetchResult record {
    int '\@recordsetCount?;
    NexusParameterDetailModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type FilingCalendarModelFetchResult record {
    int '\@recordsetCount?;
    FilingCalendarModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a tax override for a transaction
public type TaxOverrideModel record {
    # Identifies the type of tax override
    string 'type?;
    # Indicates a total override of the calculated tax on the document.  AvaTax will distribute
    # the override across all the lines.
    #             
    # Tax will be distributed on a best effort basis.  It may not always be possible to override all taxes.  Please consult
    # your account manager for information about overrides.
    decimal taxAmount?;
    # The override tax date to use
    #             
    # This is used when the tax has been previously calculated
    # as in the case of a layaway, return or other reason indicated by the Reason element.
    # If the date is not overridden, then it should be set to the same as the DocDate.
    string taxDate?;
    # This provides the reason for a tax override for audit purposes.  It is required for types 2-4.
    #             
    # Typical reasons include:
    # "Return"
    # "Layaway"
    string reason?;
    # Indicates a total override of the calculated tax on the line with TaxType.
    # AvaTax will distribute the override across all the line details for that TaxType.
    #             
    # TaxAmountByTaxType can be used only at the Line level.
    TransactionLineTaxAmountByTaxTypeModel[] taxAmountByTaxTypes?;
};

# Gets the response for the offer request
public type OfferModel record {
    # Id of the transaction
    string id?;
    # Message indicating what action took place
    string offerMessage?;
};

# Represents a commitment to file a tax return on a recurring basis.
# Only used if you subscribe to Avalara Returns.
public type FilingRequestDataModel record {
    # The company return ID if requesting an update.
    int companyReturnId?;
    # DEPRECATED - Date: 9/13/2018, Version: 18.10, Message: Please use `taxFormCode` instead.
    # The legacy return name of the requested calendar.
    string returnName?;
    # The Avalara standard tax form code of the tax form for this filing calendar.  The first two characters of the tax form code
    # are the ISO 3166 country code of the country that issued this form.
    string taxFormCode?;
    # The filing frequency of the request
    string filingFrequencyId;
    # State registration ID of the company requesting the filing calendar.
    string registrationId?;
    # The months of the request
    int months;
    # The start period of a fiscal year for this form/company
    int fiscalYearStartMonth?;
    # The type of tax to report on this return.
    string taxTypeId?;
    # Location code of the request
    string locationCode?;
    # Filing cycle effective date of the request
    string effDate;
    # Filing cycle end date of the request
    string endDate?;
    # Flag if the request is a clone of a current filing calendar
    boolean isClone?;
    # The two character ISO 3166 country code of the country that issued the tax form for this filing calendar.
    string country?;
    # The two or three character ISO 3166 code of the region / state / province that issued the tax form for this filing calendar.
    string region?;
    # The tax authority id of the return
    int taxAuthorityId?;
    # The tax authority name on the return
    string taxAuthorityName?;
    # Filing question answers
    FilingAnswerModel[] answers?;
};

# An AvaTax account.
public type AccountMigrationStatusModel record {
    # The unique ID number assigned to this account.
    int accountId;
    # The name of this account.
    string accountName?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The Tss Read Write Mode.
    int accountMigrationStatusId?;
};

# The tax region jurisdiction model.
public type TaxRegionJurisdictionModel record {
    # The id of the jurisdiction.
    int jurisdictionId?;
    # The id of the tax region.
    int taxRegionId?;
    # The id of the jurisdiction level.
    int jurisdictionLevelId?;
    # The rock name.
    string rockName?;
    # The report level.
    int reportLevel?;
    # The state assigned code.
    string stateAssignedCode?;
    # The id of the tax authority.
    int taxAuthorityId?;
    # The signature code.
    string signatureCode?;
    # The date in which this tax region jurisdiction starts to take effect.
    string effectiveDate?;
    # The date in which this tax region jurisdiction stops to take effect.
    string endDate?;
};

# Represents one configuration setting for this account
public type AccountConfigurationModel record {
    # The unique ID number of the account to which this setting applies
    int accountId?;
    # The category of the configuration setting.  Avalara-defined categories include `AddressServiceConfig` and `TaxServiceConfig`.  Customer-defined categories begin with `X-`.
    @constraint:String {maxLength: 25}
    string category;
    # The name of the configuration setting
    @constraint:String {maxLength: 50}
    string name;
    # The current value of the configuration setting
    @constraint:String {maxLength: 200}
    string value?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# This object is used to keep track of custom information about a company.
#             
# The company settings system is a metadata system that you can use to store extra information
# about a company.  Your integration or connector could use this data storage to keep track of
# preference information, reminders, or any other storage that would need to persist even if
# the customer uninstalls your application.
#             
# A setting can refer to any type of data you need to remember about this company object.
# When creating this object, you may define your own `set`, `name`, and `value` parameters.
# To define your own values, please choose a `set` name that begins with `X-` to indicate an extension.
public type SettingModel record {
    # The unique ID number of this setting.
    int id;
    # The unique ID number of the company this setting refers to.
    int companyId?;
    # A user-defined "set" containing this setting.
    #             
    # Avalara defines some sets that cannot be changed.  To create your own set, choose a set
    # name that begins with `X-` to indicate that this is an extension value.
    #             
    # We recommend that you choose a set name that clearly identifies your application, and then
    # store data within name/value pairs within that set.  For example, if you were creating an
    # application called MyApp, you might choose to create a set named `X-MyCompany-MyApp`.
    @constraint:String {maxLength: 25}
    string set;
    # A user-defined "name" for this name-value pair.
    @constraint:String {maxLength: 50}
    string name;
    # The value of this name-value pair.
    @constraint:String {maxLength: 200}
    string value?;
    # The value when the entry was last modified.
    string modifiedDate?;
    # The value identifying who last modified the entry.
    int modifiedUserId?;
};

public type CurrencyModelFetchResult record {
    int '\@recordsetCount?;
    CurrencyModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type TaxAuthorityTypeModelFetchResult record {
    int '\@recordsetCount?;
    TaxAuthorityTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Set Password Model
public type SetPasswordModel record {
    # New Password
    string newPassword;
};

# Represents a parameter associated with an item.
public type ItemParameterModel record {
    # The id of the parameter.
    int id?;
    # The parameter's name.
    string name;
    # The value for the parameter.
    string value;
    # The unit of measurement code for the parameter.
    string unit?;
    # The item id
    int itemId?;
    # This field identifies if parameter is needed for calculation
    boolean isNeededForCalculation?;
    # This field identifies if parameter is needed for returns
    boolean isNeededForReturns?;
    # This field identifies if parameter is needed for classification
    boolean isNeededForClassification?;
};

# Represents a customer to whom you sell products and/or services.
public type LinkCustomersModel record {
    # An array of customerCodes that are exempted by this certificate
    string[] customers?;
};

# Indicates one element of a sales tax rate.
public type RateModel record {
    # The sales tax rate for general tangible personal property in this jurisdiction.
    decimal rate?;
    # A readable name of the tax or taxing jurisdiction related to this tax rate.
    string name?;
    # The type of jurisdiction associated with this tax rate.
    string 'type?;
};

public type PreferredProgramModelFetchResult record {
    int '\@recordsetCount?;
    PreferredProgramModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a request for a new account with Avalara for a new subscriber.
# Contains information about the account requested and the rate plan selected.
public type NewAccountRequestModel record {
    # The offer code provided to you by your Avalara business development contact.
    #             
    # This code controls what services and rates the customer will be provisioned with upon creation.
    #             
    # If you do not know your offer code, please contact your Avalara business development representative.
    string offer;
    # The id associated with the connector
    string connectorId?;
    # If your Avalara business development representative requests, please provide the campaign ID associated with your
    # signup process.  This campaign identifier helps Avalara match users to the context in which they learned about the product
    # to help improve the accuracy of our messaging.
    #             
    # The `campaign` field must be either null or a value provided to you by an Avalara business development representative.
    # If you provide an unexpected value in this field, your API call will fail.
    string campaign?;
    # If your Avalara business development representative requests, please provide the lead source value associated with your
    # signup process.  This lead source identifier helps Avalara match users to the context in which they learned about the product
    # to help improve the accuracy of our messaging.
    #             
    # The `leadSource` field must be either null or a value provided to you by an Avalara business development representative.
    # If you provide an unexpected value in this field, your API call will fail.
    string leadSource?;
    # The date on which the account should take effect.  If null, defaults to today.
    #             
    # You should leave this value `null` unless specifically requested by your Avalara business development manager.
    string effectiveDate?;
    # The date on which the account should expire.
    #             
    # You should leave this value `null` unless specifically requested by your Avalara business development manager.
    string endDate?;
    # The name of the account to create
    @constraint:String {maxLength: 50}
    string accountName;
    # Website of the new customer whose account is being created.
    #             
    # It is strongly recommended to provide the customer's website URL, as this will help our support representatives better
    # assist customers.
    @constraint:String {maxLength: 255}
    string website?;
    # Payment Method to be associated with the account.
    #             
    # This is strictly to be used internally unless your Avalara business development manager specifically asks you to provide this value
    # while attempting to create an account.
    string paymentMethodId?;
    # First name of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string firstName;
    # Last name of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string lastName;
    # Title of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string title?;
    # Phone number of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string phoneNumber?;
    # Email of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string email;
    # The username to be associated with the user created.
    # If this is not provided, email address will be used as the username.
    @constraint:String {maxLength: 50}
    string username?;
    # If instructed by your Avalara business development manager, set this value to a temporary password to permit the user to continue their onboarding process.
    #             
    # If this value is null, a temporary password is generated by the system and emailed to the user.
    #             
    # The user will then be asked to choose a permanent password when they first log on to the AvaTax website.
    string userPassword?;
    # This option controls what type of a welcome email is sent when the account is created.
    #             
    # * `Normal` - A standard welcome email will be sent.
    # * `Suppressed` - No email will be sent.
    # * `Custom` - If your Avalara business development representative provides you with a customized welcome email for your customers, please select this option.
    string welcomeEmail?;
    # Company Address Information
    CompanyAddress companyAddress;
    # Company code to be assigned to the company created for this account.
    #             
    # If no company code is provided, this will be defaulted to "DEFAULT" company code.
    @constraint:String {maxLength: 50}
    string companyCode?;
    # Properties of the primary contact person for this account
    string[] properties?;
    # Set this to true if and only if the owner of the newly created account accepts Avalara's terms and conditions for your account.
    #             
    # Reading and accepting Avalara's terms and conditions is necessary in order for the account to receive a license key.
    boolean acceptAvalaraTermsAndConditions?;
    # Set this to true if and only if the owner of the newly created account has fully read Avalara's terms and conditions for your account.
    #             
    # Reading and accepting Avalara's terms and conditions is necessary in order for the account to receive a license key.
    boolean haveReadAvalaraTermsAndConditions?;
    # A dynamic key-value pair for the marketing context information
    record {} marketingContext?;
    # Type of the account to be created. Regular, Firm or FirmClient
    string accountType?;
    # United States Taxpayer ID number, usually your Employer Identification Number if you are a business or your
    # Social Security Number if you are an individual.
    # This value is required if the address provided is inside the US and if you subscribed to the Avalara Managed Returns or SST Certified Service Provider service. Otherwise it is optional.
    @constraint:String {maxLength: 11}
    string taxPayerIdNumber?;
};

# Represents an item in your company's product catalog.
public type ItemModel record {
    # The unique ID number of this item.
    int id;
    # The unique ID number of the company that owns this item.
    int companyId?;
    # A unique code representing this item.
    @constraint:String {maxLength: 50}
    string itemCode;
    # DEPRECATED - Date: 11/13/2018, Version: 18.12, Message: For identifying an `Item` with `Avalara TaxCode`, please call the [CreateItemClassification API] with your ItemCode and the Avalara TaxCode.
    # The unique ID number of the tax code that is applied when selling this item.
    # When creating or updating an item, you can either specify the Tax Code ID number or the Tax Code string; you do not need to specify both values.
    int taxCodeId?;
    # DEPRECATED - Date: 11/13/2018, Version: 18.12, Message: For identifying an `Item` with `Avalara TaxCode`, please call the [CreateItemClassification API] with your ItemCode and the Avalara TaxCode.
    # The unique code string of the Tax Code that is applied when selling this item.
    # When creating or updating an item, you can either specify the Tax Code ID number or the Tax Code string; you do not need to specify both values.
    @constraint:String {maxLength: 25}
    string taxCode?;
    # A friendly description of this item in your product catalog.
    @constraint:String {maxLength: 255}
    string description;
    # A way to group similar items.
    @constraint:String {maxLength: 50}
    string itemGroup?;
    # A category of product
    @constraint:String {maxLength: 4000}
    string category?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # List of classifications that belong to this item.
    # A single classification consits of a productCode and a systemCode for a particular item.
    ClassificationModel[] classifications?;
    # List of item parameters.
    ItemParameterModel[] parameters?;
    # List of item tags.
    ItemTagDetailModel[] tags?;
};

public type WorksheetDocumentLine record {
    string reportingDate?;
    string lineNo?;
    decimal lineAmount?;
    decimal exemptAmount?;
    decimal taxableAmount?;
    decimal taxAmount?;
    Message[] messages?;
    string resultCode?;
    string transactionId?;
};

# Represents a message to be displayed on an invoice.
public type InvoiceMessageModel record {
    # The content of the invoice message.
    string content?;
    # The applicable tax line numbers and codes.
    string[] lineNumbers?;
};

# The output model for report parameter definitions
public type ReportParametersModel record {
    # The start date filter used for your report
    string startDate?;
    # The end date filter used for your report
    string endDate?;
    # The country filter used for your report
    string country?;
    # The state filter used for your report
    string state?;
    # The date type filter used for your report
    string dateFilter?;
    # The doc type filter used for your report
    string docType?;
    # The date format used for your report
    string dateFormat?;
    # The currency code used for your report
    string currencyCode?;
    # Number of partitions to split the report into.
    int numberOfPartitions?;
    # The zero-based partition number to retrieve in this export request.
    int partition?;
    # If true, include only documents that are locked.
    # If false, include only documents that are not locked.
    # Defaults to false if not specified.
    boolean isLocked?;
    # If set, include only documents associated with this merchantSellerId.
    string merchantSellerId?;
    # The Document status filter used for report
    # For documentStatus, accepted values are: Temporary, Saved, Posted, Committed, Cancelled, Adjusted, Queued, PendingApproval
    string documentStatus?;
    # If true, modified date will be same as document date
    # If false, modified date will not be same as document date
    # Defaults to false if not specified.
    boolean isModifiedDateSameAsDocumentDate?;
    # TaxGroup is required to support Sales tax (Sales + SellersUse) and VAT (Input+ Output).
    # TaxTypes, such as Lodging, Bottle, LandedCost, Ewaste, BevAlc, etc
    string taxGroup?;
    # The description of the tax
    string taxName?;
    # The AvaTax tax code or customer tax code associated with the item or SKU in the transaction
    string taxCode?;
    # The code your business application uses to identify a customer or vendor
    string customerVendorCode?;
    # Defines the individual taxes associated with a TaxType category, such as Lodging TaxType which supports numerous TaxSubTypes, including Hotel, Occupancy, ConventionCenter, Accommotations, etc.
    string taxSubType?;
};

# The resource model returned by the ECommerceTokenController's endpoints.
public type ECommerceTokenOutputModel record {
    # The JWT token that authorizes the gencert tool to operate.
    string token;
    # The list of clients that the token is valid for.
    int[] clientIds?;
    # The date the token was created.
    string createdDate;
    # The date that the token will expire.
    string expirationDate;
};

# Tells you whether this location object has been correctly set up to the local jurisdiction's standards
public type LocationValidationModel record {
    # True if the location has a value for each jurisdiction-required setting.
    # The user is required to ensure that the values are correct according to the jurisdiction; this flag
    # does not indicate whether the taxing jurisdiction has accepted the data you have provided.
    boolean settingsValidated?;
    # A list of settings that must be defined for this location
    LocationQuestionModel[] requiredSettings?;
};

# Represents a PostalCode and its associated data like: country, region, effective dates, etc.
public type PostalCodeModel record {
    # Country this PostalCode locates in
    string country?;
    # The Region/State/Province this PostalCode locates in
    string region?;
    # An Avalara assigned TaxRegion Id associated to the PostalCode
    int taxRegionId?;
    # The date when the PostalCode becomes effective
    string effDate?;
    # The date when the PostalCode becomes expired
    string endDate?;
    # The postalCode
    string postalCode?;
};

public type NoticeModelFetchResult record {
    int '\@recordsetCount?;
    NoticeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type RateTypesModelFetchResult record {
    int '\@recordsetCount?;
    RateTypesModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type TaxTypeGroupModelFetchResult record {
    int '\@recordsetCount?;
    TaxTypeGroupModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Verify that a MultiDocument object matches the information in your accounting system.
#             
# If all attributes of the MultiDocument object match the values in your request, the
# MultiDocument object will be moved to the document status `Posted`.
#             
# For more information on document status, see [DocumentStatus](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/DocumentStatus/).
public type VerifyMultiDocumentModel record {
    # Represents the unique code of this MultiDocument transaction.
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.
    @constraint:String {maxLength: 45}
    string code;
    # Represents the document type of this MultiDocument transaction.  For more information about
    # document types, see [DocumentType](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/DocumentType/).
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.
    string 'type;
    # Set this value if you wish to verify a match between `verifyTransactionDate` and
    # the `documentDate` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    string verifyTransactionDate?;
    # Set this value if you wish to verify a match between `verifyTotalAmount` and
    # the `totalAmount` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    decimal verifyTotalAmount?;
    # Set this value if you wish to verify a match between `verifyTotalTax` and
    # the `totalTax` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    decimal verifyTotalTax?;
};

# A model for displaying report task metadata
public type ReportModel record {
    # The unique identifier of the report task
    int id?;
    # The ID of the account the reported transactions are from
    int accountId?;
    # The ID of the company the reported transactions are from
    int companyId?;
    # The type of the report: ExportDocumentLine, etc.
    string reportType?;
    # The output model for report parameter definitions
    ReportParametersModel parameters?;
    # The current status of the report building task
    string status?;
    # The size of the report file, if available
    int size?;
    # The format of the report file
    string format?;
    # The name of the report file, if available
    string file?;
    # The time when the report task was initiated
    string createdDate?;
    # The Id of the user who initiated this task
    int createdUserId?;
    # The userName of the user who initiated the report task
    string createdUser?;
    # The time when the report was finished building, if completed
    string completedDate?;
};

public type MarketplaceModelFetchResult record {
    int '\@recordsetCount?;
    MarketplaceModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# This is the output model coming from skyscraper services
public type LoginVerificationOutputModel record {
    # The job Id returned from skyscraper
    int jobId;
    # The operation status of the job
    string operationStatus?;
    # The message returned from the job
    string message?;
    # Indicates if the login was successful
    boolean loginSuccess?;
};

# Replace an existing transaction recorded in AvaTax with a new one.
public type AdjustTransactionModel record {
    # A reason code indicating why this adjustment was made
    string adjustmentReason;
    # If the AdjustmentReason is "Other", specify the reason here.
    #             
    # This is required when the AdjustmentReason is 8 (Other).
    string adjustmentDescription?;
    # Create a transaction
    CreateTransactionModel newTransaction;
};

# Tax Authority Model
public type NoticeCustomerTypeModel record {
    # The unique ID number of this tax notice customer type.
    int id;
    # The description name of this tax authority type.
    string description;
    # A flag if the type is active
    boolean activeFlag?;
    # sort order of the types
    int sortOrder?;
};

# Account Linkage Input model
public type FirmClientLinkageInputModel record {
    # Client AccountId that needs to be linked to the firm
    int clientAccountId;
    # Client AccountName that needs to be linked to the firm
    string clientAccountName;
};

public type TaxSubTypeModelFetchResult record {
    int '\@recordsetCount?;
    TaxSubTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type MultiTaxFilingModelFetchResult record {
    int '\@recordsetCount?;
    MultiTaxFilingModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type SecurityRoleModelFetchResult record {
    int '\@recordsetCount?;
    SecurityRoleModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Information about a location type
public type TransactionLocationTypeModel record {
    # Location type ID for this location type in transaction
    int documentLocationTypeId?;
    # Transaction ID
    int documentId?;
    # Address ID for the transaction
    int documentAddressId?;
    # Location type code
    string locationTypeCode?;
};

# A generic global advanced rule encapsulating a script
public type AdvancedRuleModel record {
    # Unique identifier for a rule
    string ruleId?;
    # Rule name
    string name;
    # Description of the rule
    string description?;
    # Advance Rules limited availability
    boolean arEntitlementRequired?;
    # Execution position. Both, Before or After
    string executionPosition?;
};

public type EcmsModelFetchResult record {
    int '\@recordsetCount?;
    EcmsModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Settle this transaction with your ledger by executing one or many actions against that transaction.
#             
# You may use this endpoint to verify the transaction, change the transaction's code, and commit the transaction for reporting purposes.
# This endpoint may be used to execute any or all of these actions at once.
public type SettleTransactionModel record {
    # Verify this transaction by matching it to values in your accounting system.
    #             
    # You may specify one or more of the following fields to verify: `date`, `totalAmount`, or `totalTax`.
    # This call will report an error if there is any difference between the data stored in AvaTax and
    # the data stored in your accounting system.
    VerifyTransactionModel verify?;
    # Settle this transaction with your ledger by verifying its amounts.
    # If the transaction is not yet committed, you may specify the "commit" value to commit it to the ledger and allow it to be reported.
    # You may also optionally change the transaction's code by specifying the "newTransactionCode" value.
    ChangeTransactionCodeModel changeCode?;
    # Commit this transaction as permanent so that it can be reported on a tax filing.
    CommitTransactionModel 'commit?;
};

# A model for return augmentations.
public type FilingAugmentationModel record {
    # The unique ID number for the augmentation.
    int id?;
    # The filing return id that this applies too
    int filingId?;
    # The field amount.
    decimal fieldAmount;
    # The field name.
    string fieldName;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Represents a create transaction batch request model.
public type CreateTransactionBatchRequestModel record {
    # The user-friendly readable name for this batch.
    @constraint:String {maxLength: 194}
    string name;
    # The list of transactions contained in this batch.
    TransactionBatchItemModel[] transactions;
};

# A MultiDocument transaction represents a sale or purchase that occurred between more than two companies.
#             
# A traditional transaction requires exactly two parties: a seller and a buyer.  MultiDocument transactions can
# involve a marketplace of vendors, each of which contributes some portion of the final transaction.  Within
# a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
# document.  This separation of documents allows each seller to file their taxes separately.
public type MultiDocumentModel record {
    # The unique ID number of this MultiDocument object.
    int id?;
    # The unique ID number of the AvaTax customer account that created this MultiDocument object.
    int accountId?;
    # The transaction code of the MultiDocument transaction.
    #             
    # All individual transactions within this MultiDocument object will have this code as a prefix.
    string code?;
    # Indicates the type of MultiDocument transaction.  Common values are:
    #             
    # * SalesOrder - An estimate that is not permanently recorded
    # * SalesInvoice - An invoice that can be reported on a tax return
    #             
    # For more information about document types, see [DocumentType](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/DocumentType/)
    string 'type?;
    # The user ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was created.
    string createdDate?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # A separate document will exist for each unique combination of buyer and seller in this MultiDocument transaction.
    TransactionModel[] documents?;
};

# Create or adjust transaction model
public type CreateOrAdjustTransactionModel record {
    # A reason code indicating why this adjustment was made
    string adjustmentReason?;
    # If the AdjustmentReason is "Other", specify the reason here.
    #             
    # This is required when the AdjustmentReason is 8 (Other).
    string adjustmentDescription?;
    # Create a transaction
    CreateTransactionModel createTransactionModel;
};

# Represents a request to sync items.
public type SyncItemsRequestModel record {
    # A list of items to sync with AvaTax.
    ItemSyncModel[] items;
};

public type ExemptionReasonModelFetchResult record {
    int '\@recordsetCount?;
    ExemptionReasonModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a customer to whom you sell products and/or services.
public type LinkCertificatesModel record {
    # An array of certificate ID numbers to link
    int[] certificates;
};

public type BatchModelFetchResult record {
    int '\@recordsetCount?;
    BatchModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ItemModelFetchResult record {
    int '\@recordsetCount?;
    ItemModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ContactModelFetchResult record {
    int '\@recordsetCount?;
    ContactModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type NoticeReasonModelFetchResult record {
    int '\@recordsetCount?;
    NoticeReasonModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Company Initialization Model
public type CompanyInitializationModel record {
    # Company Name
    @constraint:String {maxLength: 50}
    string name;
    # Company Code - used to distinguish between companies within your accounting system
    @constraint:String {maxLength: 25}
    string companyCode?;
    # Vat Registration Id - leave blank if not known.
    @constraint:String {maxLength: 25}
    string vatRegistrationId?;
    # United States Taxpayer ID number, usually your Employer Identification Number if you are a business or your
    # Social Security Number if you are an individual.
    # This value is required if the address provided is inside the US and if you subscribed to the Avalara Managed Returns or SST Certified Service Provider service. Otherwise it is optional.
    @constraint:String {maxLength: 11}
    string taxpayerIdNumber?;
    # Set this field to true if the taxPayerIdNumber is a FEIN.
    boolean isFein?;
    # Address Line1
    @constraint:String {maxLength: 50}
    string line1;
    # Line2
    @constraint:String {maxLength: 50}
    string line2?;
    # Line3
    @constraint:String {maxLength: 50}
    string line3?;
    # City
    @constraint:String {maxLength: 50}
    string city;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region;
    # Postal Code
    @constraint:String {maxLength: 10}
    string postalCode;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # First Name
    @constraint:String {maxLength: 50}
    string firstName;
    # Last Name
    @constraint:String {maxLength: 50}
    string lastName;
    # Title
    @constraint:String {maxLength: 50}
    string title?;
    # Email
    @constraint:String {maxLength: 50}
    string email;
    # Phone Number
    @constraint:String {maxLength: 25}
    string phoneNumber;
    # Mobile Number
    @constraint:String {maxLength: 25}
    string mobileNumber?;
    # Fax Number
    @constraint:String {maxLength: 25}
    string faxNumber?;
    # Parent Company ID
    int parentCompanyId?;
};

# A company and account
public type MrsCompanyModel record {
    # The unique ID number of this company.
    int companyId?;
    # The name of this company, as shown to customers.
    string companyName?;
    # The unique ID number of the account this company belongs to.
    int accountId?;
    # The name of this account, as shown to customers.
    string accountName?;
    # The taxpayer identification number for the company
    string tin?;
    # The company code for the company
    string companyCode?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

public type TaxAuthorityFormModelFetchResult record {
    int '\@recordsetCount?;
    TaxAuthorityFormModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type JurisdictionOverrideModelFetchResult record {
    int '\@recordsetCount?;
    JurisdictionOverrideModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Summary information about an overall transaction.
public type TransactionSummary record {
    # Two character ISO-3166 country code.
    string country?;
    # Two or three character ISO region, state or province code, if applicable.
    string region?;
    # The type of jurisdiction that collects this tax.
    string jurisType?;
    # Jurisdiction Code for the taxing jurisdiction
    string jurisCode?;
    # The name of the jurisdiction that collects this tax.
    string jurisName?;
    # The unique ID of the Tax Authority Type that collects this tax.
    int taxAuthorityType?;
    # The state assigned number of the jurisdiction that collects this tax.
    string stateAssignedNo?;
    # The tax type of this tax.
    string taxType?;
    # The tax subtype of this tax.
    string taxSubType?;
    # The name of the tax.
    string taxName?;
    # Group code when special grouping is enabled.
    string taxGroup?;
    # DEPRECATED - Date: 3/1/2018, Version: 18.3, Message: Please use rateTypeCode instead.
    # Indicates the tax rate type.
    string rateType?;
    # Indicates the code of the rate type.  Use [ListRateTypesByCountry](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListRateTypesByCountry/) API for a full list of rate type codes.
    string rateTypeCode?;
    # Tax Base - The adjusted taxable amount.
    decimal taxable?;
    # Tax Rate - The rate of taxation, as a fraction of the amount.
    decimal rate?;
    # Tax amount - The calculated tax (Base * Rate).
    decimal tax?;
    # The amount of tax that AvaTax calculated for the transaction.
    #             
    # If you used a `taxOverride` of type `taxAmount`, there may be a difference between
    # the `tax` field which applies your override, and the `TaxCalculated` field which
    # represents the amount of tax that AvaTax calculated for this transaction without override.
    #             
    # You can use this for comparison.
    decimal taxCalculated?;
    # The amount of the transaction that was non-taxable.
    decimal nonTaxable?;
    # The amount of the transaction that was exempt.
    decimal exemption?;
};

# Point-of-Sale Data Request Model
public type PointOfSaleDataRequestModel record {
    # A unique code that references a company within your account.
    string companyCode;
    # The date associated with the response content. Default is current date. This field can be used to backdate or postdate the response content.
    string documentDate?;
    # The format of your response. Formats include JSON, CSV, and XML.
    string responseType?;
    # A list of tax codes to include in this point-of-sale file. If no tax codes are specified, response will include all distinct tax codes associated with the Items within your company.
    string[] taxCodes?;
    # A list of item codes to include in this point-of-sale file. If no item codes are specified, responese will include all distinct item codes associated with the Items within your company.
    string[] itemCodes?;
    # A list of location codes to include in this point-of-sale file. If no location codes are specified, response will include all locations within your company.
    string[] locationCodes?;
    # Set this value to true to include Juris Code in the response.
    boolean includeJurisCodes?;
    # A unique code assoicated with the Partner you may be working with. If you are not working with a Partner or your Partner has not provided you an ID, leave null.
    string partnerId?;
};

# Represents an ISO 4217 currency code used for designating the currency of a transaction.
public type CurrencyModel record {
    # The ISO 4217 currency code for this currency.
    string code?;
    # A friendly human-readable name representing this currency.
    string description?;
    # The number of decimal digits to use when formatting a currency value for display.
    int decimalDigits?;
};

public type AvaFileFormModelFetchResult record {
    int '\@recordsetCount?;
    AvaFileFormModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type CommunicationsTransactionTypeModelFetchResult record {
    int '\@recordsetCount?;
    CommunicationsTransactionTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type CertificateModelFetchResult record {
    int '\@recordsetCount?;
    CertificateModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a code describing the intended use for a product that may affect its taxability
public type EntityUseCodeModel record {
    # The Avalara-recognized entity use code for this definition
    string code?;
    # The name of this entity use code
    string name?;
    # Text describing the meaning of this use code
    string description?;
    # A list of countries where this use code is valid
    string[] validCountries?;
};

public type TaxRuleModelFetchResult record {
    int '\@recordsetCount?;
    TaxRuleModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Regions
public type MultiTaxFilingRegionModel record {
    # The two-character ISO-3166 code for the country.
    string country?;
    # The two or three character region code for the region.
    string region?;
    # Whether or not you have nexus in this region.
    boolean hasNexus?;
    # The current status of the filing region.
    string status?;
    # Represents a listing of all tax calculation data for filings and for accruing to future filings.
    FilingsTaxSummaryModel regionTaxSummary?;
    # A detailed breakdown of the taxes in this filing
    FilingsTaxDetailsModel[] regionTaxDetails?;
    # A list of tax returns in this region.
    FilingsCheckupSuggestedFormModel[] suggestReturns?;
    # A list of tax returns in this region.
    MultiTaxFilingReturnModel[] 'returns?;
};

public type NoticeCommentModelFetchResult record {
    int '\@recordsetCount?;
    NoticeCommentModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Marketplace Location Output model
public type MarketplaceModel record {
    # Marketplace Location Id
    string marketplaceId?;
    # Marketplace Location
    string marketplace?;
};

public type AuditEvent record {
    int auditEventId?;
    int transactionId?;
    int auditEventLevelId?;
    string eventTimestamp?;
    string 'source?;
    string summary?;
    string details?;
};

# Information about all the addresses involved in this transaction.
#             
# For a physical in-person transaction at a retail point-of-sale location, please specify only one address using
# the `singleLocation` field.
#             
# For a transaction that was shipped, delivered, or provided from an origin location such as a warehouse to
# a destination location such as a customer, please specify the `shipFrom` and `shipTo` addresses.
#             
# In the United States, some jurisdictions recognize the address types `pointOfOrderOrigin` and `pointOfOrderAcceptance`.
# These address types affect the sourcing models of some transactions.
#             
# If latitude and longitude information is provided for any of these addresses along with line, city, region, country and postal code information,
# we will be using only latitude and longitude and will discard line, city, region, country and postal code information for the transaction.
# Please ensure that you have the correct latitude/longitude information for the addresses prior to using the API.
# If you provide either latitude or longitude information but not both, we will be using the line, city, region, country and postal code information for the addresses.
public type AddressesModel record {
    # Represents an address to resolve.
    AddressLocationInfo singleLocation?;
    # Represents an address to resolve.
    AddressLocationInfo shipFrom?;
    # Represents an address to resolve.
    AddressLocationInfo shipTo?;
    # Represents an address to resolve.
    AddressLocationInfo pointOfOrderOrigin?;
    # Represents an address to resolve.
    AddressLocationInfo pointOfOrderAcceptance?;
    # Represents an address to resolve.
    AddressLocationInfo goodsPlaceOrServiceRendered?;
    # Represents an address to resolve.
    AddressLocationInfo 'import?;
    # Represents an address to resolve.
    AddressLocationInfo billTo?;
};

# Represents one configuration setting for this company
public type CompanyConfigurationModel record {
    # The unique ID number of the account to which this setting applies
    int companyId?;
    # The category of the configuration setting.  Avalara-defined categories include `AddressServiceConfig` and `TaxServiceConfig`.  Customer-defined categories begin with `X-`.
    @constraint:String {maxLength: 25}
    string category;
    # The name of the configuration setting
    @constraint:String {maxLength: 50}
    string name;
    # The current value of the configuration setting
    @constraint:String {maxLength: 1000}
    string value?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Filing Returns Model
public type MultiTaxFilingReturnModel record {
    # The unique ID number of this filing return.
    int id?;
    # The unique ID number of the filing calendar associated with this return.
    int filingCalendarId?;
    # The current status of the filing return.
    string status?;
    # The filing frequency of the return.
    string filingFrequency?;
    # The filing type of the return.
    string filingType?;
    # The name of the form.
    string formName?;
    # The unique code of the form.
    string formCode?;
    # A description for the return.
    string description?;
    # Tax Authority ID of this return
    int taxAuthorityId?;
    # The date the return was filed by Avalara.
    string filedDate?;
    # Accrual type of the return
    string accrualType?;
    # The start date of this return
    string startPeriod?;
    # The end date of this return
    string endPeriod?;
    # The FilingTaskType for this return.
    string 'type?;
    # Represents a listing of all tax calculation data for filings and for accruing to future filings.
    FilingsTaxSummaryModel returnTaxSummary?;
    # A detailed breakdown of the taxes in this filing
    FilingsTaxDetailsModel[] returnTaxDetails?;
    # An attachment associated with a filing return
    FilingReturnCreditModel excludedCarryOverCredits?;
    # An attachment associated with a filing return
    FilingReturnCreditModel appliedCarryOverCredits?;
    # Total amount of adjustments on this return
    decimal totalAdjustments?;
    # The Adjustments for this return.
    FilingAdjustmentModel[] adjustments?;
    # Total amount of augmentations on this return
    decimal totalAugmentations?;
    # The Augmentations for this return.
    FilingAugmentationModel[] augmentations?;
    # Total amount of payments on this return
    decimal totalPayments?;
    # The payments for this return.
    FilingPaymentModel[] payments?;
    # The attachments for this return.
    FilingAttachmentModel[] attachments?;
};

public type WorksheetDocument record {
    string docCode?;
    string docDate?;
    decimal totalExempt?;
    decimal totalTaxable?;
    decimal totalTax?;
    WorksheetDocumentLine[] lines?;
    Message[] messages?;
    string resultCode?;
    string transactionId?;
};

# Represent what is the current status of certificate request
public type CertExpressInvitationStatusModel record {
    # The status of the CertExpress invitation for this customer.  If this status says
    string status?;
    # Represents an invitation for a customer to use CertExpress to self-report their own certificates.
    # This invitation is delivered by your choice of method, or you can present a hyperlink to the user
    # directly in your connector.  Your customer will be redirected to https://app.certexpress.com/ where
    # they can follow a step-by-step guide to enter information about their exemption certificates.  The
    # certificates entered will be recorded and automatically linked to their customer record.
    CertExpressInvitationModel invitation?;
};

# usage of system defined parameters for returns.
public type ReturnsParameterUsageModel record {
    # The unique ID number of this property.
    int id?;
    # The id of the parameter.
    int parameterId?;
    # Product code for the return parameter usage item.
    string productCode?;
    # tax type for the returns parameter usage item.
    string taxTypeId?;
    # The type of parameter as determined by its application, e.g. Product, Transaction, Calculated
    string attributeType?;
    # The name of the property.  To use this property, add a field on the `parameters` object of a [CreateTransaction](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/) call.
    string name?;
    # The data type of the property.
    string dataType?;
    # Help text to be shown to the user when they are filling out this parameter.  Help text may include HTML links to additional
    # content with more information about a parameter.
    string helpText?;
    # Label that helps the user to identify a parameter
    string label?;
    # A help url that provides more information about the parameter
    string helpUrl?;
    # If the parameter is of enumeration data type, then this list will be populated with all of the possible enumeration values.
    string[] values?;
    # The unit of measurement type of the parameter
    string measurementType?;
};

# Represents a verification request using Skyscraper for a company
public type LoginVerificationInputModel record {
    # CompanyId that we are verifying the login information for
    int companyId;
    # AccountId of the login verification
    int accountId;
    # Region of the verification request
    string region;
    # TaxFormCode for the verification request
    string taxFormCode?;
    # Username that we are using for verification
    string username;
    # Password we are using for verification
    string password;
    # Additional options of the verification
    record {} additionalOptions?;
    # Bulk Request Id of the verification
    int bulkRequestId?;
    # Priority of the verification request
    int priority?;
};

# Tax Notice Type Model
public type NoticeTypeModel record {
    # The unique ID number of this tax notice customer type.
    int id;
    # The description name of this tax authority type.
    string description;
    # A flag if the type is active
    boolean activeFlag?;
    # sort order of the types
    int sortOrder?;
};

# Create a transaction
public type CreateTransactionModel record {
    # The internal reference code used by the client application.  This is used for operations such as
    # Get, Adjust, Settle, and Void.  If you leave the transaction code blank, a GUID will be assigned to each transaction.
    @constraint:String {maxLength: 50}
    string code?;
    # A list of line items that will appear on this transaction.
    LineItemModel[] lines;
    # Specifies the type of document to create.  A document type ending with `Invoice` is a permanent transaction
    # that will be recorded in AvaTax.  A document type ending with `Order` is a temporary estimate that will not
    # be preserved.
    #             
    # If you omit this value, the API will assume you want to create a `SalesOrder`.
    string 'type?;
    # Company Code - Specify the code of the company creating this transaction here.  If you leave this value null,
    # your account's default company will be used instead.
    @constraint:String {maxLength: 50}
    string companyCode?;
    # Transaction Date - The date on the invoice, purchase order, etc.
    #             
    # By default, this date will be used to calculate the tax rates for the transaction.  If you wish to use a
    # different date to calculate tax rates, please specify a `taxOverride` of type `taxDate`.
    string date;
    # Salesperson Code - The client application salesperson reference code.
    @constraint:String {maxLength: 25}
    string salespersonCode?;
    # Customer Code - The client application customer reference code.
    # Note: This field is case sensitive. To have exemption certificates apply, this value should
    # be the same as the one passed to create a customer.
    @constraint:String {maxLength: 50}
    string customerCode;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use entityUseCode instead.
    # Customer Usage Type - The client application customer or usage type.
    @constraint:String {maxLength: 25}
    string customerUsageType?;
    # Entity Use Code - The client application customer or usage type.  For a list of
    # available usage types, use [ListEntityUseCodes](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListEntityUseCodes/) API.
    @constraint:String {maxLength: 25}
    string entityUseCode?;
    # Discount - The discount amount to apply to the document.  This value will be applied only to lines
    # that have the `discounted` flag set to true.  If no lines have `discounted` set to true, this discount
    # cannot be applied.
    decimal discount?;
    # Purchase Order Number for this document.
    #             
    # This is required for single use exemption certificates to match the order and invoice with the certificate.
    @constraint:String {maxLength: 50}
    string purchaseOrderNo?;
    # Exemption Number for this document.
    #             
    # If you specify an exemption number for this document, this document will be considered exempt, and you
    # may be asked to provide proof of this exemption certificate in the event that you are asked by an auditor
    # to verify your exemptions.
    # Note: This is same as 'exemptNo' in TransactionModel.
    @constraint:String {maxLength: 25}
    string exemptionNo?;
    # Information about all the addresses involved in this transaction.
    #             
    # For a physical in-person transaction at a retail point-of-sale location, please specify only one address using
    # the `singleLocation` field.
    #             
    # For a transaction that was shipped, delivered, or provided from an origin location such as a warehouse to
    # a destination location such as a customer, please specify the `shipFrom` and `shipTo` addresses.
    #             
    # In the United States, some jurisdictions recognize the address types `pointOfOrderOrigin` and `pointOfOrderAcceptance`.
    # These address types affect the sourcing models of some transactions.
    #             
    # If latitude and longitude information is provided for any of these addresses along with line, city, region, country and postal code information,
    # we will be using only latitude and longitude and will discard line, city, region, country and postal code information for the transaction.
    # Please ensure that you have the correct latitude/longitude information for the addresses prior to using the API.
    # If you provide either latitude or longitude information but not both, we will be using the line, city, region, country and postal code information for the addresses.
    AddressesModel addresses?;
    # Special parameters for this transaction.
    #             
    # To get a full list of available parameters, please use the [ListParameters](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListParameters/) endpoint.
    TransactionParameterModel[] parameters?;
    # Custom user fields/flex fields for this transaction.
    TransactionUserDefinedFieldModel[] userDefinedFields?;
    # Customer-provided Reference Code with information about this transaction.
    #             
    # This field could be used to reference the original document for a return invoice, or for any other
    # reference purpose.
    @constraint:String {maxLength: 1024}
    string referenceCode?;
    # Sets the sale location code (Outlet ID) for reporting this document to the tax authority.
    #             
    # This value is used by Avalara Managed Returns to group documents together by reporting locations
    # for tax authorities that require location-based reporting.
    @constraint:String {maxLength: 50}
    string reportingLocationCode?;
    # Causes the document to be committed if true.  This option is only applicable for invoice document
    # types, not orders.
    boolean 'commit?;
    # BatchCode for batch operations.
    @constraint:String {maxLength: 25}
    string batchCode?;
    # Represents a tax override for a transaction
    TaxOverrideModel taxOverride?;
    # The three-character ISO 4217 currency code for this transaction.
    @constraint:String {maxLength: 3}
    string currencyCode?;
    # Specifies whether the tax calculation is handled Local, Remote, or Automatic (default).  This only
    # applies when using an AvaLocal server.
    string serviceMode?;
    # Currency exchange rate from this transaction to the company base currency.
    #             
    # This only needs to be set if the transaction currency is different than the company base currency.
    # It defaults to 1.0.
    decimal exchangeRate?;
    # Effective date of the exchange rate.
    string exchangeRateEffectiveDate?;
    # Optional three-character ISO 4217 reporting exchange rate currency code for this transaction. The default value is USD.
    @constraint:String {maxLength: 3}
    string exchangeRateCurrencyCode?;
    # Sets the Point of Sale Lane Code sent by the User for this document.
    @constraint:String {maxLength: 50}
    string posLaneCode?;
    # VAT business identification number for the customer for this transaction.  This number will be used for all lines
    # in the transaction, except for those lines where you have defined a different business identification number.
    #             
    # If you specify a VAT business identification number for the customer in this transaction and you have also set up
    # a business identification number for your company during company setup, this transaction will be treated as a
    # business-to-business transaction for VAT purposes and it will be calculated according to VAT tax rules.
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # Specifies if the transaction should have value-added and cross-border taxes calculated with the seller as the importer of record.
    #             
    # Some taxes only apply if the seller is the importer of record for a product.  In cases where companies are working together to
    # ship products, there may be mutual agreement as to which company is the entity designated as importer of record.  The importer
    # of record will then be the company designated to pay taxes marked as being obligated to the importer of record.
    #             
    # Set this value to `true` to consider your company as the importer of record and collect these taxes.
    #             
    # This value may also be set at the Nexus level.  See `NexusModel` for more information.
    boolean isSellerImporterOfRecord?;
    # User-supplied description for this transaction.
    @constraint:String {maxLength: 2048}
    string description?;
    # User-supplied email address relevant for this transaction.
    @constraint:String {maxLength: 50}
    string email?;
    # If the user wishes to request additional debug information from this transaction, specify a level higher than `normal`.
    string debugLevel?;
    # The name of the supplier / exporter / seller.
    # For sales doctype enter the name of your own company for which you are reporting.
    # For purchases doctype enter the name of the supplier you have purchased from.
    @constraint:String {maxLength: 200}
    string customerSupplierName?;
    # The Id of the datasource from which this transaction originated.
    # This value will be overridden by the system to take the datasource Id from the call header.
    int dataSourceId?;
    # The Delivery Terms is a field used in conjunction with Importer of Record to influence whether AvaTax includes Import Duty and Tax values in the transaction totals or not.
    # Delivered at Place (DAP) and Delivered Duty Paid (DDP) are two delivery terms that  indicate that Import Duty and Tax should be included in the transaction total.
    # This field is also used for reports.
    # This field is used for future feature support. This field is not currently in use.
    string deliveryTerms?;
};

# Commit this MultiDocument object so that all transactions within it can be reported on a tax filing.
public type CommitMultiDocumentModel record {
    # Represents the unique code of this MultiDocument transaction.
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.        ///
    string code;
    # Represents the document type of this MultiDocument transaction.  For more information about
    # document types, see [DocumentType](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/DocumentType/).
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.
    string 'type?;
    # Set this value to be `true` to commit this transaction.
    #             
    # Committing a transaction allows it to be reported on a tax filing.  Uncommitted transactions will not be reported.
    boolean 'commit;
};

public type AdvancedRuleFullDetailsModelFetchResult record {
    int '\@recordsetCount?;
    AdvancedRuleFullDetailsModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type StringFetchResult record {
    int '\@recordsetCount?;
    string[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a batch of uploaded documents.
public type BatchModel record {
    # The type of this batch.
    string 'type;
    # The agent used to create this batch
    @constraint:String {maxLength: 50}
    string batchAgent?;
    # Any optional flags provided for this batch
    @constraint:String {maxLength: 200}
    string options?;
    # The unique ID number of this batch.
    int id?;
    # The user-friendly readable name for this batch.
    @constraint:String {maxLength: 194}
    string name;
    # The Account ID number of the account that owns this batch.
    int accountId?;
    # The Company ID number of the company that owns this batch.
    int companyId?;
    # This batch's current processing status
    string status?;
    # The date/time when this batch started processing
    string startedDate?;
    # The number of records in this batch; determined by the server
    int recordCount?;
    # The current record being processed
    int currentRecord?;
    # The date/time when this batch was completely processed
    string completedDate?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The list of files contained in this batch.
    BatchFileModel[] files?;
};

# Nexus tax type groupe with count
public type NexusTaxTypeGroupCountModel record {
    # Which nexus tax type group
    string nexusTaxTypeGroup?;
    # How many nexus in the group
    int count?;
};

# 
public type FundingInitiateModel record {
    # Set this value to true to request an email to the recipient
    boolean requestEmail?;
    # If you have requested an email for funding setup, this is the recipient who will receive an
    # email inviting them to setup funding configuration for Avalara Managed Returns.  The recipient can
    # then click on a link in the email and setup funding configuration for this company.
    string fundingEmailRecipient;
    # Set this value to true to request an HTML-based funding widget that can be embedded within an
    # existing user interface.  A user can then interact with the HTML-based funding widget to set up
    # funding information for the company.
    boolean requestWidget?;
};

# Represents a form that can be filed with a tax authority.
public type TaxAuthorityFormModel record {
    # The unique ID number of the tax authority.
    int taxAuthorityId;
    # The form name of the form for this tax authority.
    @constraint:String {maxLength: 50}
    string formName;
};

public type AccountModelFetchResult record {
    int '\@recordsetCount?;
    AccountModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# The "Unit of Measurement" model captures information about a type of measurement.  Types of measurement refer to
# different scales for the same dimension.  For example, measurements of type "Distance" may include units of measurement
# such as meters, feet, inches, and miles.
public type UomModel record {
    # The unique ID number of this unit of measurement.
    int id?;
    # The code that refers to this unit of measurement.
    string code?;
    # A short description of this unit of measurement.
    string shortDesc?;
    # A longer description of this unit of measurement.
    string description?;
    # The ID number of the measurement type, such as "Distance" or "Mass".
    int measurementTypeId?;
    # The code describing the measurement type.
    string measurementTypeCode?;
    # For a particular measurement type, this is the ID number of the unit of measurement object corresponding to the
    # International System of Units (abbreviated SI) unit of measurement standard.  This pointer allows you to select
    # the SI unit of measurement for a particular measurement type.
    string siUOM?;
    # A description of the measurement type system.
    string measurementTypeDescription?;
    # True if this measurement is an International System of Units (abbreviated SI) defined standard.
    boolean isSiUom?;
};

# Refund a committed transaction
public type RefundTransactionModel record {
    # The transaction code for the refund.  This code will be saved to the `ReturnInvoice` transaction, and does not need to match the code of the original sale.
    @constraint:String {maxLength: 50}
    string refundTransactionCode?;
    # The date of the refund.  For customers using Avalara's Managed Returns Service, this date controls the month in which the refund
    # transaction will be reported on a tax filing.
    string refundDate;
    # Type of this refund.
    #             
    # To submit a full refund, specify `Full`.
    #             
    # To refund only specific lines from the transaction, specify `Partial` and indicate the lines you wish to apply in the `refundLines` field.
    #             
    # To refund the tax that was paid in the previous transaction, specify `TaxOnly`.
    #             
    # To issue a percentage-based discount, specify `Percentage`.
    string refundType?;
    # The percentage for refund.
    #             
    # This value only applies if you choose `refundType = Percentage` or `refundType = Partial`.
    decimal refundPercentage?;
    # If you chose a refund of type `Partial`, this indicates which lines from the original transaction are being refunded.
    string[] refundLines?;
    # A user-defined reference field containing information about this refund.
    string referenceCode?;
};

public type UPCModelFetchResult record {
    int '\@recordsetCount?;
    UPCModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a single security role.
public type SecurityRoleModel record {
    # The unique ID number of this security role.
    int id?;
    # A description of this security role
    string description?;
};

# A certificate is a document stored in either AvaTax Exemptions or CertCapture.  The certificate document
# can contain information about a customer's eligibility for exemption from sales or use taxes based on
# criteria you specify when you store the certificate.  To view or manage your certificates directly, please
# log onto the administrative website for the product you purchased.
public type CertificateModel record {
    # Unique ID number of this certificate.
    int id?;
    # The unique ID number of the AvaTax company that recorded this certificate.
    int companyId?;
    # The date when this certificate was signed.
    string signedDate;
    # Expiration date when this certificate will no longer be valid.
    string expirationDate;
    # File name for the image of this certificate.
    #             
    # When creating a certificate, if you do not upload a PDF or JPG image, you must specify the filename
    # of the certificate as it is tracked in your repository.
    #             
    # To create a certificate, you must provide one of the following fields: either a `filename`, a `pdf` file,
    # or an array of JPG `pages`.  The API will return an error if you omit these fields or if you attempt to
    # put values in more than one of them.
    string filename?;
    # This value is true if there exists scanned PDF copy of this certificate or the PDF version of the form that the customer filled via the CertCapture wizard on S3 bucket.
    boolean documentExists?;
    # True if this certificate is marked as valid.  A valid certificate can be considered for exemption purposes.
    # When a certificate is marked invalid, it will no longer be considered when calculating exemption for
    # a customer.
    boolean valid?;
    # This value is true if the certificate has gone through the certificate validation process.
    # For more information on the certificate validation process, please see the Avalara Help Center.
    boolean verified?;
    # If this certificate provides exemption from transactional taxes, what percentage of the transaction
    # is considered exempt?
    #             
    # For a fully exempt certificate, this percentage should be 100.
    decimal exemptPercentage?;
    # This value is true if this certificate is a single (or standalone) certificate.  This value is set
    # during the audit stage of the certificate validation process.
    boolean isSingleCertificate?;
    # Indicates the tax number passed in for the certificate.
    string exemptionNumber?;
    # An exemption reason defines why a certificate allows a customer to be exempt
    # for purposes of tax calculation.  For a full list of defined exemption reasons,
    # please call the `ListCertificateExemptionReasons` API.
    ExemptionReasonModel validatedExemptionReason?;
    # An exemption reason defines why a certificate allows a customer to be exempt
    # for purposes of tax calculation.  For a full list of defined exemption reasons,
    # please call the `ListCertificateExemptionReasons` API.
    ExemptionReasonModel exemptionReason;
    # The status of the certificate
    string status?;
    # The date/time when this record was created.
    string createdDate?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The tax number type for the certificate. For example, `FEIN`, `Social Security Number`, or `Employer Identification Number`.
    string taxNumberType?;
    # Description of business for the certificate. For example, `Retail trade`, `Professional services`, or `Construction`.
    string businessNumberType?;
    # Number of pages contained within this certificate.
    int pageCount?;
    # A list of customers to which this certificate applies.  You can fetch this data by specifying
    # `$include=customers` when calling a certificate fetch API.
    CustomerModel[] customers?;
    # A list of purchase order numbers that are valid for use with this certificate.
    #             
    # If this certificate is applicable for all purchase order numbers, this field will be empty.
    #             
    # You can fetch this data by specifying `$include=po_numbers` when calling a certificate fetch API.
    PoNumberModel[] poNumbers?;
    # Information about a physical area or zone in which a certificate can apply.
    # An exposure zone for an exemption certificate will generally be a tax authority such
    # as a state, country, or local government entity.
    ExposureZoneModel exposureZone;
    # A list of certificate attributes that apply to this certificate.
    #             
    # You can fetch this data by specifying `$include=attributes` when calling a certificate fetch API.
    CertificateAttributeModel[] attributes?;
    # The unique ID number of current AvaTax Exemption Certificate that refers this certificate.
    int ecmsId?;
    # The status of current AvaTax Exemption Certificate  that refers to this certificate.
    string ecmsStatus?;
    # This field is available for input only.  To retrieve the image after creation, use the
    # `DownloadCertificateImage` API.
    #             
    # When creating a certificate, you may optionally provide a PDF image in Base64 URLEncoded format.
    # PDFs are automatically parsed into individual page JPG images and can be retrieved back
    # later as either the original PDF or the individual pages.
    #             
    # To create a certificate, you must provide one of the following fields: either a `filename`, a `pdf` file,
    # or an array of JPG `pages`.  The API will return an error if you omit these fields or if you attempt to
    # put values in more than one of them.
    string pdf?;
    # This field is available for input only.  To retrieve the image after creation, use the
    # `DownloadCertificateImage` API.
    #             
    # When creating a certificate, you may optionally provide a list of JPG images, one per page, in
    # Base64 URLEncoded format.  These JPG images are automatically combined into a single downloadable
    # PDF and can be retrieved back later as either the original JPG images or the combined PDF.
    #             
    # To create a certificate, you must provide one of the following fields: either a `filename`, a `pdf` file,
    # or an array of JPG `pages`.  The API will return an error if you omit these fields or if you attempt to
    # put values in more than one of them.
    string[] pages?;
};

# Represents a group of tax types
public type NexusTaxTypeGroupModel record {
    # The unique ID number of this nexus tax type group.
    int id?;
    # The unique human readable Id of this nexus tax type group.
    string nexusTaxTypeGroupId?;
    # The description of this nexus tax type group.
    string description?;
    # If this tax type group requires a subscription, this contains the ID number of the subscription type required to use it.
    int subscriptionTypeId?;
    # If this tax type group requires a subscription, this contains the friendly name of the subscription type required to use it.
    string subscriptionDescription?;
    # The name of the tab in the AvaTax website corresponding to this tax type group.
    string tabName?;
    # True if this tax type group is displayed in the user interface of the AvaTax website.
    boolean showColumn?;
};

public type ErrorTransactionOutputModelCappedFetchResult record {
    boolean '\@isRecordsetCountCapped?;
    int '\@recordsetCount?;
    ErrorTransactionOutputModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Contains information about the original API request and response that created
# a MultiDocument object.
public type ReconstructedMultiDocumentModel record {
    # A MultiDocument transaction represents a sale or purchase that occurred between more than two companies.
    #             
    # A traditional transaction requires exactly two parties: a seller and a buyer.  MultiDocument transactions can
    # involve a marketplace of vendors, each of which contributes some portion of the final transaction.  Within
    # a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
    # document.  This separation of documents allows each seller to file their taxes separately.
    CreateMultiDocumentModel request?;
};

# Model for toggling visibility of an advanced rule for an account
public type AdvancedRuleVisibilityModel record {
    # Should the rule be visible or not visible
    boolean isVisible?;
    # The account Id for which the rule is to be visible/not visible
    int accountId?;
};

# Filing Calendar Edit
public type CycleSafeFilingCalendarEditModel record {
    # Field To Edit
    string fieldName?;
    # Destination is used to identify filing questions' type Other or Settings.
    string destination?;
    # Question
    int questionId?;
    # The filing question code.
    string questionCode?;
    # Old Value
    record {} oldValue?;
    # New Value
    record {} newValue?;
};

public type MarketplaceLocationModelFetchResult record {
    int '\@recordsetCount?;
    MarketplaceLocationModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a request for a new account with Avalara for a new Firm client.
public type NewFirmClientAccountRequestModel record {
    # The name of the account to create
    @constraint:String {maxLength: 50}
    string accountName;
    # First name of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string firstName;
    # Last name of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string lastName;
    # Title of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string title?;
    # Phone number of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string phoneNumber?;
    # Email of the primary contact person for this account
    @constraint:String {maxLength: 50}
    string email;
    # Company code to be assigned to the company created for this account.
    #             
    # If no company code is provided, this will be defaulted to "DEFAULT" company code.
    @constraint:String {maxLength: 50}
    string companyCode?;
    # Company Address Information
    CompanyAddress companyAddress;
    # United States Taxpayer ID number, usually your Employer Identification Number if you are a business or your
    # Social Security Number if you are an individual.
    # This value is required if the address provided is inside the US. Otherwise it is optional.
    @constraint:String {maxLength: 11}
    string taxPayerIdNumber?;
    # Properties of the primary contact person for this account
    string[] properties?;
};

# Verify this transaction by matching it to values in your accounting system.
#             
# You may specify one or more of the following fields to verify: `date`, `totalAmount`, or `totalTax`.
# This call will report an error if there is any difference between the data stored in AvaTax and
# the data stored in your accounting system.
public type VerifyTransactionModel record {
    # Set this value if you wish to verify a match between `verifyTransactionDate` and
    # the `documentDate` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    string verifyTransactionDate?;
    # Set this value if you wish to verify a match between `verifyTotalAmount` and
    # the `totalAmount` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    decimal verifyTotalAmount?;
    # Set this value if you wish to verify a match between `verifyTotalTax` and
    # the `totalTax` value on the transaction recorded in AvaTax.
    #             
    # If you leave this field empty, we will skip verification for this field.
    decimal verifyTotalTax?;
};

# An abridged item model used for syncing product catalogs with AvaTax.
public type ItemSyncModel record {
    # A unique code representing this item.
    string itemCode;
    # A friendly description of the item. If your company has enrolled in Streamlined Sales Tax, this description must be auditable.
    string description;
    # A group to which the item belongs.
    string itemGroup?;
    # The tax code of the item (optional)
    string taxCode?;
};

# An attachment associated with a filing return
public type FilingAttachmentModel record {
    # The resourceFileId used to retrieve the attachment
    int resourceFileId?;
    # The description of the attachment
    string description?;
};

# User Defined fields/Flex Fields at Transaction Line level.
public type TransactionLineUserDefinedFieldModel record {
    # The name of the user defined field.
    string name?;
    # The value of the user defined field.
    string value?;
};

public type TaxTypeModelFetchResult record {
    int '\@recordsetCount?;
    TaxTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# A request to upload a file to Resource Files
public type ResourceFileUploadRequestModel record {
    # This stream contains the bytes of the file being uploaded.
    string content;
    # The username adding the file
    string username?;
    # The account ID to which this file will be attached.
    int accountId?;
    # The company ID to which this file will be attached.
    int companyId?;
    # The original name of this file.
    string name?;
    # The resource type ID of this file.
    int resourceFileTypeId?;
    # Length of the file in bytes.
    int length?;
};

public type EntityUseCodeModelFetchResult record {
    int '\@recordsetCount?;
    EntityUseCodeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Product classification output model.
public type ItemClassificationOutputModel record {
    # The unique ID number of this product.
    int id?;
    # The unique ID number of the item this product belongs to.
    int itemId?;
    # The system id which the product belongs.
    int systemId?;
    # A unique code representing this item.
    string productCode?;
    # A unique code representing this item.
    string systemCode?;
};

# A request to void a previously created transaction
public type VoidTransactionModel record {
    # Please specify the reason for voiding or cancelling this transaction.
    # To void the transaction, please specify the reason 'DocVoided'.
    # If you do not provide a reason, the void command will fail.
    string code;
};

# Represents an invitation for a customer to use CertExpress to self-report their own certificates.
# This invitation is delivered by your choice of method, or you can present a hyperlink to the user
# directly in your connector.  Your customer will be redirected to https://app.certexpress.com/ where
# they can follow a step-by-step guide to enter information about their exemption certificates.  The
# certificates entered will be recorded and automatically linked to their customer record.
public type CreateCertExpressInvitationModel record {
    # If the value of `deliveryMethod` is set to `Email`, please specify the email address of the recipient
    # for the request.
    string recipient?;
    # If this invitation is sent via email or download, please specify the cover letter to use when building this
    # invitation.  For a list of cover letters, please call `ListCoverLetters`.
    string coverLetterTitle?;
    # You may optionally specify a list of exposure zones to request in this CertExpress invitation.  If you list
    # more than one exposure zone, the customer will be prompted to provide an exemption certificate for each one.
    # If you do not provide a list of exposure zones, the customer will be prompted to select an exposure zone.
    #             
    # For a list of available exposure zones, please call `ListCertificateExposureZones`.
    int[] exposureZones?;
    # You may optionally specify a list of exemption reasons to pre-populate in this CertExpress invitation.
    # If you list exemption reasons, the customer will have part of their form already filled in when they visit
    # the CertExpress website.
    #             
    # For a list of available exemption reasons, please call `ListCertificateExemptReasons`.
    int[] exemptReasons?;
    # Specify the type of invitation.  CertExpress invitations can be delivered via email, web link, or
    # facsimile.
    #             
    # * If you specify `Email`, the invitation will be delivered via email.  Please ask the customer to ensure that
    # * If you specify `Fax`, the invitation will be sent via fax to the customer's fax number on file.
    # * If you specify `Download`, the invitation will be prepared as a web link that you can display to the customer.
    string deliveryMethod?;
};

# Model with options for actual filing calendar output based on user edits to filing calendar.
public type CycleEditOptionModel record {
    # Whether or not changes can be made to the filing calendar.
    boolean success?;
    # The message to present to the user when calendar is successfully or unsuccessfully changed.
    string message?;
    # Whether or not the user should be warned of a change, because some changes are risky and may be being done not in accordance with jurisdiction rules.
    # For example, user would be warned if user changes filing frequency to new frequency with a start date during an accrual month of the existing frequency.
    boolean customerMustApprove?;
    # True if the filing calendar must be cloned to allow this change; false if the existing filing calendar can be changed itself.
    boolean mustCloneFilingCalendar?;
    # The effective date of the filing calendar (only applies if cloning).
    string clonedCalendarEffDate?;
    # The expired end date of the old filing calendar (only applies if cloning).
    string expiredCalendarEndDate?;
};

public type CertificateAttributeModelFetchResult record {
    int '\@recordsetCount?;
    CertificateAttributeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Information about questions that the local jurisdictions require for each location
public type LocationQuestionModel record {
    # The unique ID number of this location setting type
    int id;
    # This is the prompt for this question
    string question;
    # If additional information is available about the location setting, this contains descriptive text to help
    # you identify the correct value to provide in this setting.
    string description;
    # If available, this regular expression will verify that the input from the user is in the expected format.
    string regularExpression?;
    # If available, this is an example value that you can demonstrate to the user to show what is expected.
    string exampleValue?;
    # Indicates which jurisdiction requires this question
    string jurisdictionName?;
    # Indicates which type of jurisdiction requires this question
    string jurisdictionType?;
    # Indicates the country that this jurisdiction belongs to
    string jurisdictionCountry?;
    # Indicates the state, region, or province that this jurisdiction belongs to
    string jurisdictionRegion?;
    # Help and guidance for this specific question
    string helpText?;
    # Maximum length of the answer string
    int maxLength?;
    # True if this question must be answered for this filing calendar
    boolean required?;
    # Data type of the answer
    string dataType?;
    # 
    string staticOptions?;
    # 
    boolean unique?;
};

# Replace an existing transaction recorded in AvaTax with a new one.
public type BatchAdjustTransactionModel record {
    # Specifies the code of the company for this transaction.
    @constraint:String {maxLength: 50}
    string companyCode;
    # Please specify the transaction code of the transacion to void.
    string transactionCode;
    # Specifies the type of document to void.
    string documentType?;
    # A reason code indicating why this adjustment was made
    string adjustmentReason;
    # If the AdjustmentReason is "Other", specify the reason here.
    #             
    # This is required when the AdjustmentReason is 8 (Other).
    string adjustmentDescription?;
    # Create a transaction
    CreateTransactionModel newTransaction;
};

# Resource File Type Model
public type ResourceFileTypeModel record {
    # The resource file type id
    int resourceFileTypeId?;
    # The name of the file type
    string name?;
};

# NoticeRootCause Model
public type NoticeRootCauseDetailModel record {
    # The unique ID number of this filing frequency.
    int id;
    # TaxNoticeId
    int noticeId;
    # TaxNoticeRootCauseId
    int taxNoticeRootCauseId;
    # The description name of this root cause
    string description?;
};

public type IsoCountryModelFetchResult record {
    int '\@recordsetCount?;
    IsoCountryModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# An individual tax detail element.  Represents the amount of tax calculated for a particular jurisdiction, for a particular line in an invoice.
public type TransactionLineDetailModel record {
    # The unique ID number of this tax detail.
    int id?;
    # The unique ID number of the line within this transaction.
    int transactionLineId?;
    # The unique ID number of this transaction.
    int transactionId?;
    # The unique ID number of the address used for this tax detail.
    int addressId?;
    # The two character ISO 3166 country code of the country where this tax detail is assigned.
    @constraint:String {maxLength: 2, minLength: 2}
    string country?;
    # The two-or-three character ISO region code for the region where this tax detail is assigned.
    string region?;
    # For U.S. transactions, the Federal Information Processing Standard (FIPS) code for the county where this tax detail is assigned.
    string countyFIPS?;
    # For U.S. transactions, the Federal Information Processing Standard (FIPS) code for the state where this tax detail is assigned.
    string stateFIPS?;
    # The amount of this line that was considered exempt in this tax detail.
    decimal exemptAmount?;
    # The unique ID number of the exemption reason for this tax detail.
    int exemptReasonId?;
    # True if this detail element represented an in-state transaction.
    boolean inState?;
    # The code of the jurisdiction to which this tax detail applies.
    string jurisCode?;
    # The name of the jurisdiction to which this tax detail applies.
    string jurisName?;
    # The unique ID number of the jurisdiction to which this tax detail applies.
    int jurisdictionId?;
    # The Avalara-specified signature code of the jurisdiction to which this tax detail applies.
    string signatureCode?;
    # The state assigned number of the jurisdiction to which this tax detail applies.
    string stateAssignedNo?;
    # DEPRECATED - Date: 12/20/2017, Version: 18.1, Message: Use jurisdictionTypeId instead.
    # The type of the jurisdiction to which this tax detail applies.
    string jurisType?;
    # The type of the jurisdiction in which this tax detail applies.
    string jurisdictionType?;
    # The amount of this line item that was considered nontaxable in this tax detail.
    decimal nonTaxableAmount?;
    # The rule according to which portion of this detail was considered nontaxable.
    int nonTaxableRuleId?;
    # The type of nontaxability that was applied to this tax detail.
    string nonTaxableType?;
    # The rate at which this tax detail was calculated.
    decimal rate?;
    # The unique ID number of the rule according to which this tax detail was calculated.
    int rateRuleId?;
    # The unique ID number of the source of the rate according to which this tax detail was calculated.
    int rateSourceId?;
    # For Streamlined Sales Tax customers, the SST Electronic Return code under which this tax detail should be applied.
    string serCode?;
    # Indicates whether this tax detail applies to the origin or destination of the transaction.
    string sourcing?;
    # The amount of tax for this tax detail.
    decimal tax?;
    # The taxable amount of this tax detail.
    decimal taxableAmount?;
    # The type of tax that was calculated.  Depends on the company's nexus settings as well as the jurisdiction's tax laws.
    string taxType?;
    # The id of the tax subtype.
    string taxSubTypeId?;
    # The id of the tax type group.
    string taxTypeGroupId?;
    # The name of the tax against which this tax amount was calculated.
    string taxName?;
    # The type of the tax authority to which this tax will be remitted.
    int taxAuthorityTypeId?;
    # The unique ID number of the tax region.
    int taxRegionId?;
    # The amount of tax that AvaTax calculated.
    # If an override for tax amount is used, there may be a difference between the tax
    # field which applies your override, and the this amount that is calculated without override.
    decimal taxCalculated?;
    # The amount of tax override that was specified for this tax line.
    decimal taxOverride?;
    # DEPRECATED - Date: 12/20/2017, Version: 18.1, Message: Please use rateTypeCode instead.
    # The rate type for this tax detail.
    string rateType?;
    # Indicates the code of the rate type that was used to calculate this tax detail.  Use [ListRateTypesByCountry](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListRateTypesByCountry/) API for a full list of rate type codes.
    @constraint:String {maxLength: 25}
    string rateTypeCode?;
    # Number of units in this line item that were calculated to be taxable according to this rate detail.
    decimal taxableUnits?;
    # Number of units in this line item that were calculated to be nontaxable according to this rate detail.
    decimal nonTaxableUnits?;
    # Number of units in this line item that were calculated to be exempt according to this rate detail.
    decimal exemptUnits?;
    # When calculating units, what basis of measurement did we use for calculating the units?
    string unitOfBasis?;
    # True if this value is a non-passthrough tax.
    #             
    # A non-passthrough tax is a tax that may not be charged to a customer; it must be paid directly by the company.
    boolean isNonPassThru?;
    # The Taxes/Fee component. True if the fee is applied.
    boolean isFee?;
    # Number of units in this line item that were calculated to be taxable according to this rate detail in the reporting currency.
    decimal reportingTaxableUnits?;
    # Number of units in this line item that were calculated to be nontaxable according to this rate detail in the reporting currency.
    decimal reportingNonTaxableUnits?;
    # Number of units in this line item that were calculated to be exempt according to this rate detail in the reporting currency.
    decimal reportingExemptUnits?;
    # The amount of tax for this tax detail in the reporting currency.
    decimal reportingTax?;
    # The amount of tax that AvaTax calculated in the reporting currency.
    # If an override for tax amount is used, there may be a difference between the tax
    # field which applies your override, and the this amount that is calculated without override.
    decimal reportingTaxCalculated?;
    # LiabilityType identifies the party liable to file the tax. This field is used to filter taxes from reports and tax filings as appropriate.
    string liabilityType?;
};

# Bulk lock documents model
public type BulkLockTransactionModel record {
    # List of documents to lock
    int[] documentIds;
    # The lock status to set for the documents designated in this API
    boolean isLocked;
};

# Approve a set of filings.
public type ApproveFilingsModel record {
    # Set this value to true in order to approve the filings.
    boolean approve;
};

public type FiledReturnModelFetchResult record {
    int '\@recordsetCount?;
    FiledReturnModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Returns information about transactions that were locked
public type BulkLockTransactionResult record {
    # Number of records that have been modified
    int numberOfRecords?;
};

# SendSales Request Model.
public type SendSalesRequestModel record {
    # The companyId for which the send sales file is being generated.
    int companyId;
    # List of taxCodes to be included in send sales file.
    string[] taxCodes;
    # The date for which send sales file is being generated.
    string date;
    # The send sales file format.
    string format?;
    # The send sales file type
    string 'type?;
};

# Represents a declaration of nexus within a particular taxing jurisdiction.
#             
# To create a nexus declaration for your company, you must first call the Definitions API `ListNexus` to obtain a
# list of Avalara-defined nexus.  Once you have determined which nexus you wish to declare, you should customize
# only the user-selectable fields in this object.
#             
# The user selectable fields for the nexus object are `companyId`, `effectiveDate`, `endDate`, `localNexusTypeId`,
# `taxId`, `nexusTypeId`, `hasPermanentEstablishment`, and `isSellerImporterOfRecord`.
#             
# When calling `CreateNexus` or `UpdateNexus`, all values in your nexus object except for the user-selectable fields
# must match an Avalara-defined system nexus object.  You can retrieve a list of Avalara-defined system nexus objects
# by calling `ListNexus`.  If any data does not match, AvaTax may not recognize your nexus declaration.
public type NexusModel record {
    # The unique ID number of this declaration of nexus.
    #             
    # This field is defined automatically when you declare nexus.  You do not need to provide a value for this field.
    int id?;
    # The unique ID number of the company that declared nexus.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    int companyId?;
    # Name or ISO 3166 code identifying the country in which this company declared nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    string country;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    string region;
    # DEPRECATED - Date: 12/20/2017, Version: 18.1, Message: Please use jurisdictionTypeId instead.
    # The jurisdiction type of the jurisdiction in which this company declared nexus.
    string jurisTypeId?;
    # The type of the jurisdiction in which this company declared nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    string jurisdictionTypeId?;
    # The code identifying the jurisdiction in which this company declared nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    @constraint:String {maxLength: 10}
    string jurisCode;
    # The common name of the jurisdiction in which this company declared nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    @constraint:String {maxLength: 200}
    string jurisName;
    # The date when this nexus began.  If not known, set to null.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    string effectiveDate?;
    # If this nexus will end or has ended on a specific date, set this to the date when this nexus ends.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    string endDate?;
    # The short name of the jurisdiction.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    @constraint:String {maxLength: 15}
    string shortName?;
    # The signature code of the boundary region as defined by Avalara.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    @constraint:String {maxLength: 4}
    string signatureCode?;
    # The state assigned number of this jurisdiction.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    @constraint:String {maxLength: 50}
    string stateAssignedNo?;
    # The type of nexus that this company is declaring.
    #             
    # If you are voluntarily declaring nexus in a jurisdiction, you should select `SalesOrSellersUseTax` for your
    # nexus type option.  This option allows you to calculate tax correctly whether you are selling in-state or
    # shipping from an out-of-state location.
    #             
    # If you are legally obligated to declare nexus due to physical presence or other sufficient nexus, you
    # should select `SalesTax`.  This indicates that, as a legal requirement, your company must always collect
    # and remit full sales tax in this jurisdiction.
    #             
    # If you are participating in the Streamlined Sales Tax program, your SST administrator will select nexus
    # settings for you in all SST jurisdictions.  Do not select any SST options by yourself.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    string nexusTypeId?;
    # Indicates whether this nexus is defined as origin or destination nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    string sourcing?;
    # True if you are also declaring local nexus within this jurisdiction.
    # Many U.S. states have options for declaring nexus in local jurisdictions as well as within the state.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    boolean hasLocalNexus?;
    # If you are declaring local nexus within this jurisdiction, this indicates whether you are declaring only
    # a specified list of local jurisdictions, all state-administered local jurisdictions, or all local jurisdictions.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    string localNexusTypeId?;
    # Set this value to true if your company has a permanent establishment within this jurisdiction.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    boolean hasPermanentEstablishment?;
    # Optional - the tax identification number under which you declared nexus.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    @constraint:String {maxLength: 25}
    string taxId?;
    # DEPRECATED - Date: 4/29/2017, Version: 19.4, Message: Please use isSSTActive instead.
    # For the United States, this flag indicates whether this particular nexus falls within a U.S. State that participates
    # in the Streamlined Sales Tax program.  For countries other than the US, this flag is null.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    boolean streamlinedSalesTax?;
    # For the United States, this flag indicates whether this particular nexus falls within a U.S. State that participates
    # in the Streamlined Sales Tax program and if the account associated with the Nexus has an active AvaTaxCsp subscription.
    # For countries other than the US, this flag is null.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    boolean isSSTActive?;
    # The date when this record was created.
    #             
    # This field is defined automatically when you declare nexus.  You do not need to provide a value for this field.
    string createdDate?;
    # The User ID of the user who created this record.
    #             
    # This field is defined automatically when you declare nexus.  You do not need to provide a value for this field.
    int createdUserId?;
    # The date/time when this record was last modified.
    #             
    # This field is defined automatically when you declare nexus.  You do not need to provide a value for this field.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    #             
    # This field is defined automatically when you declare nexus.  You do not need to provide a value for this field.
    int modifiedUserId?;
    # The type group of nexus that this company is declaring
    # Use [ListTaxTypeGroups](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListTaxTypeGroups/) API for a list of nexus tax type groups.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    # NOTE: This optional field will trigger nexus subtype lookup when populated. When using make sure TaxTypeGroup matches corresponding NexusTaxTypeGroup
    string taxTypeGroup?;
    # The type of nexus that this company is declaring.Replaces NexusTypeId.
    # Use [ListNexusTaxTypeGroups](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListNexusTaxTypeGroups/) API for a list of nexus tax type groups.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    string nexusTaxTypeGroup?;
    # A unique ID number of the tax authority that is associated with this nexus.
    #             
    # This field is defined by Avalara.  All Avalara-defined fields must match an Avalara-defined nexus object found by calling `ListNexus`.
    int taxAuthorityId?;
    # For nexus declarations at the country level, specifies whether this company is considered the importer of record in this nexus region.
    #             
    # Some taxes only apply if the seller is the importer of record for a product.  In cases where companies are working together to
    # ship products, there may be mutual agreement as to which company is the entity designated as importer of record.  The importer
    # of record will then be the company designated to pay taxes marked as being obligated to the importer of record.
    #             
    # Set this value to `true` to consider your company as the importer of record and collect these taxes.  Leave this value as false
    # or null and taxes will be calculated as if your company is not the importer of record.
    #             
    # This value may also be set during each transaction API call.  See `CreateTransaction()` for more information.
    #             
    # This field is user-selectable and should be provided when creating or updating a nexus object.
    boolean isSellerImporterOfRecord?;
    # A description of corresponding tax type applied to the nexus.
    #             
    # When a custom nexus is created, it'll have to be matched to a system nexus to be validated successfully. The matched system nexus has a
    # field to describe the tax type applied to it, that field will be copied over to the nexus that is being created.
    #             
    # This field is defined by Avalara. Its main purpose is to give a simple description of the tax type associated with the nexus so
    # users have a better understanding of the nexus when it is displayed.
    string taxName?;
    # List of nexus parameters.
    NexusParameterDetailModel[] parameters?;
    # Shows if system nexus records are associated with tax collection
    boolean taxableNexus?;
};

# Available Cycle object
public type AvailableCycleModel record {
    # Transactional Period Start
    string transactionalPeriodStart?;
    # Transactional Period End
    string transactionalPeriodEnd?;
    # Filing Due Date
    string filingDueDate?;
    # Cycle Name
    string cycleName?;
};

# Represents a tag for an item in your company's product catalog.
public type TagsModel record {
    # The unique ID number of the tag.
    int id?;
    # The tag name.
    string tagName?;
};

public type TransactionModelFetchResult record {
    int '\@recordsetCount?;
    TransactionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type CompanyDistanceThresholdModelFetchResult record {
    int '\@recordsetCount?;
    CompanyDistanceThresholdModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Tax Authority Model
public type TaxAuthorityModel record {
    # The unique ID number of this tax authority.
    int id;
    # The friendly name of this tax authority.
    @constraint:String {maxLength: 128}
    string name;
    # The type of this tax authority.
    int taxAuthorityTypeId?;
    # The unique ID number of the jurisdiction for this tax authority.
    int jurisdictionId?;
};

# Represents a parameter associated with a nexus.
public type NexusParameterDetailModel record {
    # The id of the parameter.
    int id?;
    # The parameter's name.
    string name;
    # The value for the parameter.
    string value;
    # The unit of measurement code for the parameter.
    string unit?;
    # The nexus id
    int nexusId?;
};

public type MultiDocumentModelFetchResult record {
    int '\@recordsetCount?;
    MultiDocumentModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Model for updating rule execution order
public type AdvancedRuleExecutionOrderModel record {
    # The rule execution Ids in the desired order
    string[] ruleExecutionIds;
};

public type ItemTagDetailModelFetchResult record {
    int '\@recordsetCount?;
    ItemTagDetailModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Tax Details by Tax subtype
public type TaxDetailsByTaxSubType record {
    # Tax subtype
    string taxSubType?;
    # Total taxable amount by tax type
    decimal totalTaxable?;
    # Total exempt by tax type
    decimal totalExempt?;
    # Total non taxable by tax type
    decimal totalNonTaxable?;
    # Total tax by tax type
    decimal totalTax?;
};

# Information about a previously created transaction
public type AuditTransactionModel record {
    # Unique ID number of the company that created this transaction
    int companyId?;
    # This model contains a reconstructed CreateTransaction request object that could potentially be used
    # to recreate this transaction.
    #             
    # Note that the API changes over time, and this reconstructed model is likely different from the exact request
    # that was originally used to create this transaction.
    ReconstructedApiRequestResponseModel reconstructed?;
    # Server timestamp, in UTC, of the date/time when the original transaction was created
    string serverTimestamp?;
    # Length of time the original API call took
    string serverDuration?;
    # api call status
    string apiCallStatus?;
    # Represents the exact API request and response from the original transaction API call, if available
    OriginalApiRequestResponseModel original?;
};

# This object represents a single determination factor for a line that is being inspected through the InspectLine API.
public type DeterminationFactorModel record {
    # Determination reason code.
    string code?;
    # Determination reason description.
    string description?;
    # The ids of any applied determination factor.
    string[] ids?;
    # The name of any applied determination factor.
    string[] names?;
    # The name of the user who created the determination factor.
    string createdBy?;
};

# Represents a complex query request to parse using query filter guidelines from Microsoft REST standards
public type QueryRequestModel record {
    # A list of conditions to filter objects.
    string filter?;
    # A list of included commands for this fetch operation.
    string include?;
    # For pagination: This is the maximum number of results to return.
    int maxResults?;
    # For pagination: This is the index of the first result.
    int startIndex?;
    # Sorts the resulting objects in a specific manner.
    string sortBy?;
};

# Represents a service that this account has subscribed to.
public type SubscriptionModel record {
    # The unique ID number of this subscription.
    int id?;
    # The unique ID number of the account this subscription belongs to.
    int accountId?;
    # The unique ID number of the service that the account is subscribed to. If this is provided, subscription description is ignored.
    int subscriptionTypeId?;
    # A friendly description of the service that the account is subscribed to. You can either provide the subscription type Id or this but not both. If
    # subscription type Id is provided, then this information is ignored and this field will be updated with the information from subscription type id.
    @constraint:String {maxLength: 25}
    string subscriptionDescription?;
    # The date when the subscription began.
    string effectiveDate?;
    # If the subscription has ended or will end, this date indicates when the subscription ends.
    string endDate?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Represents a transaction parameter.
public type TransactionParameterModel record {
    # The name of the parameter.
    string name?;
    # The value of the parameter.
    string value?;
    # The unit of measure of the parameter value.
    string unit?;
};

public type ResourceFileTypeModelFetchResult record {
    int '\@recordsetCount?;
    ResourceFileTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# User Entitlement Model
public type UserEntitlementModel record {
    # List of API names and categories that this user is permitted to access
    string[] permissions?;
    # What access privileges does the current user have to see companies?
    string accessLevel?;
    # The identities of all companies this user is permitted to access
    int[] companies?;
};

# Model for distinct jurisdictions.
public type ComplianceJurisdictionModel record {
    # The id of the tax region.
    int taxRegionId?;
    # The state assigned code for the jurisdiction.
    string stateAssignedCode?;
    # The type of the jurisdiction, indicating whether it is a country, state/region, city, for example.
    string jurisdictionTypeId?;
    # The name of the jurisdiction.
    string name?;
    # The name of the county.
    string county?;
    # The name of the city.
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country of this jurisdiction.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # The name of the tax region.
    string taxRegionName?;
    # The id of the tax authority.
    int taxAuthorityId?;
    # Optional: A list of rates for this jurisdiction. To fetch this list, add the query string `?$include=TaxRates` to your URL.
    ComplianceAggregatedTaxRateModel[] rates?;
};

# Represents a license key for this account.
public type LicenseKeyModel record {
    # The primary key of the account
    int accountId?;
    # This is your private license key.  You must record this license key for safekeeping.
    # If you lose this key, you must contact the ResetLicenseKey API in order to request a new one.
    # Each account can only have one license key at a time.
    string privateLicenseKey?;
    # If your software allows you to specify the HTTP Authorization header directly, this is the header string you
    # should use when contacting Avalara to make API calls with this license key.
    string httpRequestHeader?;
};

# Password Change Model
public type PasswordChangeModel record {
    # Old Password
    @constraint:String {maxLength: 50}
    string oldPassword;
    # New Password
    string newPassword;
};

# Provides detailed information about an API call.
#             
# The information on this record was captured by AvaTax when your API call was made.  If you are unsure why you
# received an error, you can fetch these audit objects and examine the `RequestUrl`, `RequestBody`, and `ErrorMessage`
# fields to determine root cause for the error.
public type AuditModel record {
    # A unique ID number referring to this individual API call.
    int transactionId?;
    # The unique ID number of the account to which the user belongs.
    int accountId?;
    # The unique ID number of the user that performed this API call.
    int userId?;
    # The origin IP address from which AvaTax received this API call.  If you use a proxy layer or other
    # gateway, this IP address may be the address of the gateway.  This information is not guaranteed
    # to be accurate and may change based on network conditions between your site and AvaTax.
    string ipAddress?;
    # If your API call specified a `MachineName` in the [Client Profile Headers](https://developer.avalara.com/avatax/client-headers/), this
    # variable will contain its value.  This information is self-reported by the client and is not guaranteed to be present.
    string machineName?;
    # If your API call specified a `ClientName` in the [Client Profile Headers](https://developer.avalara.com/avatax/client-headers/), this
    # variable will contain its value.  This information is self-reported by the client and is not guaranteed to be present.
    string clientName?;
    # If your API call specified a `ClientVersion` in the [Client Profile Headers](https://developer.avalara.com/avatax/client-headers/), this
    # variable will contain its value.  This information is self-reported by the client and is not guaranteed to be present.
    string clientVersion?;
    # If your API call specified a `AdapterName` in the [Client Profile Headers](https://developer.avalara.com/avatax/client-headers/), this
    # variable will contain its value.  This information is self-reported by the client and is not guaranteed to be present.
    string adapterName?;
    # If your API call specified a `AdapterVersion` in the [Client Profile Headers](https://developer.avalara.com/avatax/client-headers/), this
    # variable will contain its value.  This information is self-reported by the client and is not guaranteed to be present.
    string adapterVersion?;
    # The server name of the AvaTax server that responded to this API call.
    string serverName?;
    # The software version number of the currently deployed AvaTax API software on the server that responded to this API call.
    string serverVersion?;
    # A context-dependent reference ID for this API call.  This reference ID is not guaranteed to contain a specific value
    # and may be used differently by various API calls.
    int referenceId?;
    # If the API contained a specific type of error code, this value would contain the unique ID number of the severity level
    # of the response returned to the client.
    int severityLevelId?;
    # The server timestamp, in UTC, of the time when the server received this API call.
    string serverTimestamp?;
    # The number of milliseconds that the AvaTax server took to respond to this API call.
    int serverDuration?;
    # The service name of the AvaTax API service that responded to this API call.
    string serviceName?;
    # The operation name of this API call.
    string operation?;
    # A context-dependent reference code for this API call.  This reference code is not guaranteed to contain a specific value
    # and may be used differently by various API calls.
    string referenceCode?;
    # If this API call reported an error, this contains the name of the error that was returned.  You can look up more
    # information about AvaTax error messages on the [AvaTax REST Error Page](https://developer.avalara.com/avatax/errors/).
    string errorMessage?;
    # Reserved for Avalara internal usage.
    string auditMessage?;
    # Reserved for Avalara internal usage.
    int loadBalancerDuration?;
    # If this API call returned an array of information, this value contains the number of records returned.
    int recordCount?;
    # Reserved for Avalara internal usage.
    string referenceAuthorization?;
    # Reserved for Avalara internal usage.
    boolean isQueued?;
    # If this API call included requests made to any of the AvaTax data layers, this contains the number of requests that were traced.
    #             
    # Please note that not all data layers support this measurement.
    int databaseCallCount?;
    # If this API call included requests made to any of the AvaTax data layers, this contains the total duration time measured for all the requests.
    #             
    # Please note that not all data layers support this measurement.
    string databaseCallDuration?;
    # If this API call included interoperation with other Avalara services, this contains the amount of time taken by those services.
    string remoteCallDuration?;
    # Reserved for Avalara internal usage.
    AuditEvent[] events?;
    # The original request URL as provided by the client.
    string requestUrl?;
    # If this request was an HTTP request that included a body such as a POST or a PUT, this will contain the request body sent by the client.
    #             
    # This request body is represented as a string, exactly as it was received from the client.  Regardless of whether the request was JSON,
    # Base64 encoded bytes, or a CSV file, this contains the exact contents of the request body.
    string requestBody?;
    # The HTTP response code that was sent by the server.
    int responseStatus?;
    # The entire response body sent from the AvaTax server to the client.  This value is returned as a string regardless of whether the results
    # were JSON-formatted text, CSV files, or raw strings.
    string responseBody?;
    # Reserved for Avalara internal usage.
    AuditModel[] remoteCalls?;
};

# Represents estimated financial results from responding to a tax notice.
public type NoticeFinanceModel record {
    # The Unique Id of the Finance Model
    int id?;
    # The unique ID of the the tax notice associated with the the finance detail
    int noticeId?;
    # The date of the notice
    string noticeDate?;
    # The due date of the notice
    string dueDate?;
    # The sequential number of the notice
    string noticeNumber?;
    # The amount of tax due on the notice
    decimal taxDue?;
    # The amound of penalty listed on the notice
    decimal penalty?;
    # The amount of interest listed on the notice
    decimal interest?;
    # The amount of credits listed on the notice
    decimal credits?;
    # The amount of tax abated on the notice
    decimal taxAbated?;
    # The amount of customer penalty on the notice
    decimal customerPenalty?;
    # The amount of customer interest on the notice
    decimal customerInterest?;
    # The amount of CSP Fee Refund on the notice
    decimal cspFeeRefund?;
    # The name of the file attached to the finance detail
    string fileName?;
    # The ResourceFileId of the finance detail attachment
    int resourceFileId?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # A request to upload a file to Resource Files
    ResourceFileUploadRequestModel attachmentUploadRequest?;
};

# Worksheet Checkup Report Suggested Form Model
public type FilingsCheckupSuggestedFormModel record {
    # Tax Authority ID of the suggested form returned
    int taxAuthorityId?;
    # Country of the suggested form returned
    string country?;
    # Region of the suggested form returned
    string region?;
    # Name of the suggested form returned
    string taxFormCode?;
    # Legacy Name of the suggested form returned
    string returnName?;
};

# Represents a commitment to file a tax return on a recurring basis.
# Only used if you subscribe to Avalara Returns.
public type FilingCalendarModel record {
    # The unique ID number of this filing calendar.
    int id?;
    # The unique ID number of the company to which this filing calendar belongs.
    int companyId;
    # DEPRECATED - Date: 9/13/2018, Version: 18.10, Message: Please use `taxFormCode` instead.
    # The legacy return name of the tax form to file.
    @constraint:String {maxLength: 50}
    string returnName?;
    # Name or ISO 3166 code identifying the country that issued the tax form for this filing calendar.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string formCountry?;
    # Name or ISO 3166 code identifying the region that issued the tax form for this filing calendar.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string formRegion?;
    # The Avalara standard tax form code of the tax form for this filing calendar.  The first two characters of the tax form code
    # are the ISO 3166 country code of the country that issued this form.
    string taxFormCode?;
    # The start period of a fiscal year for this form/company
    int fiscalYearStartMonth?;
    # If this calendar is for a location-specific tax return, specify the location code here.  To file for all locations, leave this value NULL.
    @constraint:String {maxLength: 50}
    string locationCode?;
    # DEPRECATED - Date: 9/17/2021, Version: 21.9.0, Message: Field will be no longer be available after the 21.9.0 release.
    # If this calendar is for a location-specific tax return, specify the location-specific behavior here.
    string outletTypeId?;
    # Specify the ISO 4217 currency code for the currency to remit for this tax return.  For all tax returns in the United States, specify "USD".
    @constraint:String {maxLength: 3}
    string paymentCurrency?;
    # The frequency on which this tax form is filed.
    string filingFrequencyId;
    # A 16-bit bitmap containing a 1 for each month when the return should be filed.
    int months?;
    # Tax Registration ID for this Region - in the U.S., this is for your state.
    @constraint:String {maxLength: 50}
    string stateRegistrationId?;
    # Tax Registration ID for the local jurisdiction, if any.
    @constraint:String {maxLength: 50}
    string localRegistrationId?;
    # The Employer Identification Number or Taxpayer Identification Number that is to be used when filing this return.
    @constraint:String {maxLength: 50}
    string employerIdentificationNumber?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The first line of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 50}
    string line1?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The second line of the mailing address that will be used when filling out this tax return.
    # Please note that some tax forms do not support multiple address lines.
    @constraint:String {maxLength: 50}
    string line2?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The city name of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 50}
    string city?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The state, region, or province of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 3}
    string region?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The postal code or zip code of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 25}
    string postalCode?;
    # DEPRECATED - Date: 9/1/2017, Version: 17.9, Message: Field will be no longer be available after the 17.9 release.
    # The two character ISO-3166 country code of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 2}
    string country?;
    # The first line of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 50}
    string mailingAddressLine1?;
    # The second line of the mailing address that will be used when filling out this tax return.
    # Please note that some tax forms do not support multiple address lines.
    @constraint:String {maxLength: 50}
    string mailingAddressLine2?;
    # The city name of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 50}
    string mailingAddressCity?;
    # Name or ISO 3166 code identifying the region of the mailing address that will be used when filling out this tax return.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string mailingAddressRegion?;
    # The postal code or zip code of the mailing address that will be used when filling out this tax return.
    @constraint:String {maxLength: 25}
    string mailingAddressPostalCode?;
    # Name or ISO 3166 code identifying the country of the mailing address that will be used when filling out this tax return.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string mailingAddressCountry?;
    # The phone number to be used when filing this return.
    @constraint:String {maxLength: 50}
    string phone?;
    # DEPRECATED - Date: 9/17/2021, Version: 21.9.0, Message: Field will be no longer be available after the 21.9.0 release.
    # Special filing instructions to be used when filing this return.
    # Please note that requesting special filing instructions may incur additional costs.
    @constraint:String {maxLength: 1000}
    string customerFilingInstructions?;
    # The legal entity name to be used when filing this return.
    @constraint:String {maxLength: 75}
    string legalEntityName?;
    # The earliest date for the tax period when this return should be filed.
    # This date specifies the earliest date for tax transactions that should be reported on this filing calendar.
    # Please note that tax is usually filed one month in arrears: for example, tax for January transactions is typically filed during the month of February.
    string effectiveDate;
    # The last date for the tax period when this return should be filed.
    # This date specifies the last date for tax transactions that should be reported on this filing calendar.
    # Please note that tax is usually filed one month in arrears: for example, tax for January transactions is typically filed during the month of February.
    string endDate?;
    # The method to be used when filing this return.
    string filingTypeId?;
    # If you file electronically, this is the username you use to log in to the tax authority's website.
    @constraint:String {maxLength: 254}
    string eFileUsername?;
    # If you file electronically, this is the password or pass code you use to log in to the tax authority's website.
    @constraint:String {maxLength: 40}
    string eFilePassword?;
    # If you are required to prepay a percentage of taxes for future periods, please specify the percentage in whole numbers;
    # for example, the value 90 would indicate 90%.
    int prepayPercentage?;
    # Determines if a prepayment is required for this filing calendar
    boolean prePaymentRequired?;
    # If your company is required to make a prepayment that is designated by a fixed amount each period, please specify the amount here.
    decimal fixedPrepaymentAmount?;
    # DEPRECATED - Date: , Version: , Message: The 'taxTypes' list field should be used going forward.
    # The type of tax to report on this return.
    string taxTypeId;
    # The list of tax types to report on this return.
    string[] taxTypes?;
    # DEPRECATED - Date: 9/17/2021, Version: 21.9.0, Message: Field will be no longer be available after the 21.9.0 release.
    # Internal filing notes.
    @constraint:String {maxLength: 1000}
    string internalNotes?;
    # Custom filing information field for Alabama.
    @constraint:String {maxLength: 25}
    string alSignOn?;
    # Custom filing information field for Alabama.
    @constraint:String {maxLength: 25}
    string alAccessCode?;
    # Custom filing information field for Maine.
    @constraint:String {maxLength: 50}
    string meBusinessCode?;
    # Custom filing information field for Iowa.
    @constraint:String {maxLength: 50}
    string iaBen?;
    # Custom filing information field for Connecticut.
    @constraint:String {maxLength: 50}
    string ctReg?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other1Name?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other1Value?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other2Name?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other2Value?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other3Name?;
    # Custom filing information field.  Leave blank.
    @constraint:String {maxLength: 50}
    string other3Value?;
    # The unique ID of the tax authority of this return.
    int taxAuthorityId?;
    # The name of the tax authority of this return.
    string taxAuthorityName?;
    # The type description of the tax authority of this return.
    string taxAuthorityType?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # User name of bulk account.
    string bulkAccountId?;
    # The bulk account site code.
    string siteCode?;
    # The status of the bulk account's validation.
    string bulkAccountValidationStatus?;
    # CompanyReturn settings for complext filing calendar
    CompanyReturnSettingModel[] settings?;
};

# Represents a letter received from a tax authority regarding tax filing.
# These letters often have the warning "Notice" printed at the top, which is why
# they are called "Notices".
public type NoticeModel record {
    # The unique ID number of this notice.
    int id;
    # The unique ID number of the company to which this notice belongs.
    int companyId;
    # The status id of the notice
    int statusId;
    # The status of the notice
    string status?;
    # The received date of the notice
    string receivedDate;
    # The closed date of the notice
    string closedDate?;
    # The total remmitance amount for the notice
    decimal totalRemit?;
    # NoticeCustomerTypeID can be retrieved from the definitions API
    string customerTypeId;
    # Name or ISO 3166 code identifying the country that sent this notice.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Name or ISO 3166 code identifying the region within the country that sent this notice.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # The tax authority id of the notice
    int taxAuthorityId?;
    # The filing frequency of the notice
    string filingFrequency?;
    # The filing type of the notice
    string filingTypeId?;
    # The ticket reference number of the notice
    string ticketReferenceNo?;
    # The ticket reference url of the notice
    string ticketReferenceUrl?;
    # The sales force case of the notice
    string salesForceCase?;
    # The URL to the sales force case
    string salesForceCaseUrl?;
    # The tax period of the notice
    string taxPeriod?;
    # The notice reason id
    int reasonId;
    # The notice reason
    string reason?;
    # The tax notice type id
    int typeId?;
    # The tax notice type description
    string 'type?;
    # The notice customer funding options
    string customerFundingOptionId?;
    # The priority of the notice
    string priorityId;
    # Comments from the customer on this notice
    string customerComment?;
    # Indicator to hide from customer
    boolean hideFromCustomer;
    # Expected resolution date of the notice
    string expectedResolutionDate?;
    # Indicator to show customer this resolution date
    boolean showResolutionDateToCustomer;
    # The unique ID number of the user that closed the notice
    int closedByUserId?;
    # The user who created the notice
    string createdByUserName?;
    # The unique ID number of the user that owns the notice
    int ownedByUserId?;
    # The description of the notice
    string description?;
    # The ava file form id of the notice
    int avaFileFormId?;
    # The id of the revenue contact
    int revenueContactId?;
    # The id of the compliance contact
    int complianceContactId?;
    # The tax form code of the notice
    string taxFormCode?;
    # The document reference of the notice
    string documentReference?;
    # The jurisdiction name of the notice
    string jurisdictionName?;
    # The jurisdiction type of the notice
    string jurisdictionType?;
    # Additional comments on the notice
    NoticeCommentModel[] comments?;
    # Finance details of the notice
    NoticeFinanceModel[] finances?;
    # Notice Responsibility Details
    NoticeResponsibilityDetailModel[] responsibility?;
    # Notice Root Cause Details
    NoticeRootCauseDetailModel[] rootCause?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

public type NoticeResponsibilityDetailModelFetchResult record {
    int '\@recordsetCount?;
    NoticeResponsibilityDetailModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Results of the Worksheet Checkup report
public type FilingsCheckupModel record {
    # A collection of authorities in the report
    FilingsCheckupAuthorityModel[] authorities?;
};

# Information about a previously created MultiDocument transaction
public type AuditMultiDocumentModel record {
    # Contains information about the original API request and response that created
    # a MultiDocument object.
    ReconstructedMultiDocumentModel reconstructed?;
    # Represents the unique code of this MultiDocument transaction.
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.
    string code?;
    # Represents the document type of this MultiDocument transaction.  For more information about
    # document types, see [DocumentType](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/DocumentType/).
    #             
    # A MultiDocument transaction is uniquely identified by its `accountId`, `code`, and `type`.
    string 'type?;
    # Server timestamp, in UTC, of the date/time when the original transaction was created
    string serverTimestamp?;
    # Length of time the original API call took
    string serverDuration?;
    # api call status
    string apiCallStatus?;
    # Represents the exact API request and response from the original transaction API call, if available
    OriginalApiRequestResponseModel original?;
};

# An account user who is permitted to use AvaTax.
public type AccountLicenseKeyModel record {
    # The unique name for license key per account
    @constraint:String {maxLength: 30}
    string name;
    # AccountId for required license key
    int accountId;
    # The date when this record was created.
    string createdDate?;
    # The user id for the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user id of user who last modified this record.
    int modifiedUserId?;
};

# Rate types Model
public type RateTypesModel record {
    # The unique ID number of this rate type.
    int id?;
    # The name of this rateType
    string rateType?;
    # The description of this rate type.
    string description?;
};

public type LocationModelFetchResult record {
    int '\@recordsetCount?;
    LocationModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# A company or business entity.
public type CompanyModel record {
    # The unique ID number of this company.
    int id;
    # The unique ID number of the account this company belongs to.
    int accountId;
    # If this company is fully owned by another company, this is the unique identity of the parent company.
    int parentCompanyId?;
    # If this company files Streamlined Sales Tax, this is the PID of this company as defined by the Streamlined Sales Tax governing board.
    @constraint:String {maxLength: 9}
    string sstPid?;
    # A unique code that references this company within your account.
    @constraint:String {maxLength: 25}
    string companyCode?;
    # The name of this company, as shown to customers.
    @constraint:String {maxLength: 50}
    string name;
    # This flag is true if this company is the default company for this account.  Only one company may be set as the default.
    boolean isDefault?;
    # If set, this is the unique ID number of the default location for this company.
    int defaultLocationId?;
    # This flag indicates whether tax activity can occur for this company.  Set this flag to true to permit the company to process transactions.
    boolean isActive?;
    # For United States companies, this field contains your Taxpayer Identification Number.
    # This is a nine digit number that is usually called an EIN for an Employer Identification Number if this company is a corporation,
    # or SSN for a Social Security Number if this company is a person.
    # This value is required if the address provided is inside the US and if you subscribed to the Avalara Managed Returns or SST Certified Service Provider service. Otherwise it is optional.
    @constraint:String {maxLength: 11}
    string taxpayerIdNumber?;
    # Set this field to true if the taxPayerIdNumber is a FEIN.
    boolean isFein?;
    # Set this flag to true to give this company its own unique tax profile.
    # If this flag is true, this company will have its own Nexus, TaxRule, TaxCode, and Item definitions.
    # If this flag is false, this company will inherit all profile values from its parent.
    boolean hasProfile?;
    # Set this flag to true if this company must file its own tax returns.
    # For users who have Returns enabled, this flag turns on monthly Worksheet generation for the company.
    boolean isReportingEntity?;
    # If this company participates in Streamlined Sales Tax, this is the date when the company joined the SST program.
    string sstEffectiveDate?;
    # The two character ISO-3166 country code of the default country for this company.
    @constraint:String {maxLength: 2, minLength: 2}
    string defaultCountry;
    # This is the three character ISO-4217 currency code of the default currency used by this company.
    @constraint:String {maxLength: 3}
    string baseCurrencyCode?;
    # Indicates whether this company prefers to round amounts at the document level or line level.
    string roundingLevelId?;
    # Set this value to true to receive warnings in API calls via SOAP.
    boolean warningsEnabled?;
    # Set this flag to true to indicate that this company is a test company.
    # If you have Returns enabled, Test companies will not file tax returns and can be used for validation purposes.
    boolean isTest?;
    # Used to apply tax detail dependency at a jurisdiction level.
    string taxDependencyLevelId?;
    # Set this value to true to indicate that you are still working to finish configuring this company.
    # While this value is true, no tax reporting will occur and the company will not be usable for transactions.
    boolean inProgress?;
    # Business Identification No
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # Optional: A list of contacts defined for this company.  To fetch this list, add the query string `?$include=Contacts` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    ContactModel[] contacts?;
    # Optional: A list of items defined for this company.  To fetch this list, add the query string `?$include=Items` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    ItemModel[] items?;
    # Optional: A list of locations defined for this company.  To fetch this list, add the query string `?$include=Locations` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    LocationModel[] locations?;
    # Optional: A list of nexus defined for this company.  To fetch this list, add the query string `?$include=Nexus` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    NexusModel[] nexus?;
    # Optional: A list of settings defined for this company.  To fetch this list, add the query string `?$include=Settings` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    SettingModel[] settings?;
    # Optional: A list of tax codes defined for this company.  To fetch this list, add the query string `?$include=TaxCodes` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    TaxCodeModel[] taxCodes?;
    # Optional: A list of tax rules defined for this company.  To fetch this list, add the query string `?$include=TaxRules` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    TaxRuleModel[] taxRules?;
    # Optional: A list of UPCs defined for this company.  To fetch this list, add the query string `?$include=UPCs` to your URL.
    #             
    # When calling `CreateCompany`, you may provide a list of objects in this element and they will be created alongside the company.
    # The `UpdateCompany` API does not permit updating nested objects.
    UPCModel[] upcs?;
    # Optional: A list of non reporting child companies associated with this company.  To fetch this list, add the query string `?$include=NonReportingChildren` to your URL.
    CompanyModel[] nonReportingChildCompanies?;
    # DEPRECATED - Date: 9/15/2017, Version: 17.10, Message: Please use the `ListCertificates` API.
    EcmsModel[] exemptCerts?;
    # The unique identifier of the mini-one-stop-shop used for Value Added Tax (VAT) processing.
    @constraint:String {maxLength: 25}
    string mossId?;
    # The country code of the mini-one-stop-shop used for Value Added Tax (VAT) processing.
    @constraint:String {maxLength: 2}
    string mossCountry?;
    # The parameters of a company
    CompanyParameterDetailModel[] parameters?;
    # The customers and suppliers of a company
    CustomerSupplierModel[] supplierandcustomers?;
};

public type FilingFrequencyModelFetchResult record {
    int '\@recordsetCount?;
    FilingFrequencyModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Status of an Avalara Managed Returns funding configuration for a company
public type FundingStatusModel record {
    # The unique ID number of this funding request
    int requestId?;
    # SubledgerProfileID
    int subledgerProfileID?;
    # CompanyID
    string companyID?;
    # Domain
    string domain?;
    # Recipient
    string recipient?;
    # Sender
    string sender?;
    # DocumentKey
    string documentKey?;
    # DocumentType
    string documentType?;
    # DocumentName
    string documentName?;
    # Represents the current status of a funding ESign method
    FundingESignMethodReturn methodReturn?;
    # Status
    string status?;
    # ErrorMessage
    string errorMessage?;
    # LastPolled
    string lastPolled?;
    # LastSigned
    string lastSigned?;
    # LastActivated
    string lastActivated?;
    # TemplateRequestId
    int templateRequestId?;
};

# Represents a region, province, or state within a country
public type IsoRegionModel record {
    # The two-character ISO 3166 country code this region belongs to
    string countryCode?;
    # The three character ISO 3166 region code
    string code?;
    # The full name, using localized characters, for this region, in uppercase.
    #             
    # For names in proper or formal case, or for names in other languages, please examine the `localizedNames` element for an appropriate name.
    string name?;
    # The word in the local language that classifies what type of a region this represents
    string classification?;
    # For the United States, this flag indicates whether a U.S. State participates in the Streamlined
    # Sales Tax program.  For countries other than the US, this flag is null.
    boolean streamlinedSalesTax?;
    # A list of localized names in a variety of languages.
    #             
    # This list is maintained by the International Standards Organization.
    IsoLocalizedName[] localizedNames?;
    # Whether the region collects tax or not. This field will be populated for US country only and will be null for all the other countries.
    boolean isRegionTaxable?;
};

# Represents a list of statuses of returns available in skyscraper
public type SkyscraperStatusModel record {
    # The specific name of the returns available in skyscraper
    string name?;
    # The tax form codes available to file through skyscrper
    string[] taxFormCodes?;
    # The country of the returns
    string country?;
    # The Scraper type
    string scraperType?;
    # Indicates if the return is currently available
    boolean isAvailable?;
    # The expected response time of the call
    string expectedResponseTime?;
    # Message on the returns
    string message?;
    # A list of required fields to file
    RequiredFilingCalendarDataFieldModel[] requiredFilingCalendarDataFields?;
};

# Account Linkage output model
public type FirmClientLinkageOutputModel record {
    # The unique ID number of firm-client linkage.
    int id?;
    # Firm Account to be linked with the firm
    int firmAccountId?;
    # FIrm Account name
    string firmAccountName?;
    # Client Account to be linked with the firm
    int clientAccountId?;
    # Client Account name
    string clientAccountName?;
    # Created date of the linkage
    string createdDate?;
    # User who created the linkage
    int createdUserId?;
    # Modified date of the linkage
    string modifiedDate?;
    # User who modified the linkage
    int modifiedUserId?;
    # The status of the account linkage. The following are the available statuses
    # * Requested - When a linkage is requested
    # * Approved - When the linkage is approved
    # * Rejected - When the linkage is rejected
    # * Revoked - When the linkage is revoked.
    string status?;
    # This is set to 1 if the linkage is deleted.
    boolean isDeleted?;
    # Name of the firm's point of contact person for the client
    string firmContactName?;
    # Email of the firm's point of contact person for the client
    string firmContactEmail?;
};

public type CustomerModelFetchResult record {
    int '\@recordsetCount?;
    CustomerModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Regions
public type FilingRegionModel record {
    # The unique ID number of this filing region.
    int id?;
    # The filing id that this region belongs too
    int filingId?;
    # The two-character ISO-3166 code for the country.
    string country?;
    # The two or three character region code for the region.
    string region?;
    # The sales amount.
    decimal salesAmount?;
    # The taxable amount.
    decimal taxableAmount?;
    # The tax amount.
    decimal taxAmount?;
    # The tax amount due.
    decimal taxDueAmount?;
    # The amount collected by Avalara for this region
    decimal collectAmount?;
    # Total remittance amount of all returns in region
    decimal totalRemittanceAmount?;
    # The non-taxable amount.
    decimal nonTaxableAmount?;
    # Consumer use tax liability.
    decimal consumerUseTaxAmount?;
    # Consumer use non-taxable amount.
    decimal consumerUseNonTaxableAmount?;
    # Consumer use taxable amount.
    decimal consumerUseTaxableAmount?;
    # The date the filing region was approved.
    string approveDate?;
    # The start date for the filing cycle.
    string startDate?;
    # The end date for the filing cycle.
    string endDate?;
    # Whether or not you have nexus in this region.
    boolean hasNexus?;
    # The current status of the filing region.
    string status?;
    # A list of tax returns in this region.
    FilingReturnModel[] 'returns?;
    # A list of tax returns in this region.
    FilingsCheckupSuggestedFormModel[] suggestReturns?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Commit this transaction as permanent so that it can be reported on a tax filing.
public type CommitTransactionModel record {
    # Set this value to be `true` to commit this transaction.
    #             
    # Committing a transaction allows it to be reported on a tax filing.  Uncommitted transactions will not be reported.
    boolean 'commit;
};

# Represents a transaction parameter.
public type TransactionLineParameterModel record {
    # The name of the parameter.
    string name?;
    # The value of the parameter.
    string value?;
    # The unit of measure of the parameter value.
    string unit?;
};

public type ClassificationParameterUsageMapModelFetchResult record {
    int '\@recordsetCount?;
    ClassificationParameterUsageMapModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ErrorCodeOutputModelCappedFetchResult record {
    boolean '\@isRecordsetCountCapped?;
    int '\@recordsetCount?;
    ErrorCodeOutputModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ParameterModelFetchResult record {
    int '\@recordsetCount?;
    ParameterModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type CustomerSupplierModelFetchResult record {
    int '\@recordsetCount?;
    CustomerSupplierModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type RateTypeModelFetchResult record {
    int '\@recordsetCount?;
    RateTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a transaction/service type pair for telecommunications tax
public type CommunicationsTSPairModel record {
    # The numeric Id of the transaction type.
    int transactionTypeId;
    # The numeric Id of the service type.
    int serviceTypeId;
    # The name of the transaction type.
    string 'AvaTax\.Communications\.TransactionType?;
    # The name of the service type.
    string 'AvaTax\.Communications\.ServiceType?;
    # The description of the transaction/service type pair.
    string description?;
    # List of the parameters (among Charge, Minutes and Lines) that will be used for calculation for this T/S pair.
    string[] requiredParameters?;
};

public type UomModelFetchResult record {
    int '\@recordsetCount?;
    UomModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type NexusModelFetchResult record {
    int '\@recordsetCount?;
    NexusModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Response model of a single error transaction delete
public type DeleteErrorTransactionResponseModel record {
    # Result of the deletion
    string result?;
    # Type of transaction of the error transaction
    string documentType;
    # The internal reference code (used by the client application) of the error transaction
    @constraint:String {maxLength: 50}
    string documentCode;
};

# Represents a tax type group
public type TaxTypeGroupModel record {
    # The unique ID number of this tax type group.
    int id?;
    # The unique human readable Id of this tax type group.
    string taxTypeGroup?;
    # The description of this tax type group.
    string description?;
    # If this tax type group requires a subscription, this contains the ID number of the subscription type required to use it.
    int subscriptionTypeId?;
    # If this tax type group requires a subscription, this contains the friendly name of the subscription type required to use it.
    string subscriptionDescription?;
    # The name of the tab in the AvaTax website corresponding to this tax type group.
    string tabName?;
    # True if this tax type group is displayed in the user interface of the AvaTax website.
    boolean showColumn?;
    # The order this record is being returned in the response
    int displaySequence?;
};

public type ReportModelFetchResult record {
    int '\@recordsetCount?;
    ReportModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a product classification system.
public type ProductClassificationSystemModel record {
    # Its Integer SystemId value for System
    int systemId?;
    # The System code for this System.
    string systemCode?;
    # A friendly human-readable name representing this System.
    string description?;
    # custom value set for the system
    string customsValue?;
    # List of all countries that belong to the system including
    ProductSystemCountryModel[] countries?;
};

# Information about a physical area or zone in which a certificate can apply.
# An exposure zone for an exemption certificate will generally be a tax authority such
# as a state, country, or local government entity.
public type ExposureZoneModel record {
    # A unique ID number representing this exposure zone.
    int id?;
    # The unique ID number of the AvaTax company that recorded this customer.
    int companyId?;
    # The short name of this exposure zone, suitable for use in a drop-down list.
    string name?;
    # A tag indicating
    string tag?;
    # A more complete description of this exposure zone, suitable for use as a tooltip or help text.
    string description?;
    # The date when this record was created.
    string created?;
    # The date/time when this record was last modified.
    string modified?;
    # Two or three character ISO 3166 region, province, or state name of this exposure zone.
    string region?;
    # Two character ISO 3166 county code for the country component of this exposure zone.
    string country?;
};

# Represents one line item in a transaction
public type LineItemModel record {
    # The line number of this line within the document.  This can be any text that is useful to you, such as numeric line numbers, alphabetic line numbers, or other text.
    @constraint:String {maxLength: 50}
    string number?;
    # Quantity of items in this line.  This quantity value should always be a positive value representing the quantity of product that changed hands, even when handling returns or refunds.
    #             
    # If not provided, or if set to zero, the quantity value is assumed to be one (1).
    decimal quantity?;
    # Total amount for this line.  The amount represents the net currency value that changed hands from the customer (represented by the `customerCode` field) to the company (represented by the `companyCode`) field.
    #             
    # For sale transactions, this value must be positive.  It indicates the amount of money paid by the customer to the company.
    #             
    # For refund or return transactions, this value must be negative.
    decimal amount;
    # Information about all the addresses involved in this transaction.
    #             
    # For a physical in-person transaction at a retail point-of-sale location, please specify only one address using
    # the `singleLocation` field.
    #             
    # For a transaction that was shipped, delivered, or provided from an origin location such as a warehouse to
    # a destination location such as a customer, please specify the `shipFrom` and `shipTo` addresses.
    #             
    # In the United States, some jurisdictions recognize the address types `pointOfOrderOrigin` and `pointOfOrderAcceptance`.
    # These address types affect the sourcing models of some transactions.
    #             
    # If latitude and longitude information is provided for any of these addresses along with line, city, region, country and postal code information,
    # we will be using only latitude and longitude and will discard line, city, region, country and postal code information for the transaction.
    # Please ensure that you have the correct latitude/longitude information for the addresses prior to using the API.
    # If you provide either latitude or longitude information but not both, we will be using the line, city, region, country and postal code information for the addresses.
    AddressesModel addresses?;
    # Tax Code - System or Custom Tax Code.
    #             
    # You can use your own tax code mapping or standard Avalara tax codes.  For a full list of tax codes, see `ListTaxCodes`.
    @constraint:String {maxLength: 25}
    string taxCode?;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use `entityUseCode` instead.
    @constraint:String {maxLength: 25}
    string customerUsageType?;
    # Entity Use Code - The client application customer or usage type.  This field allows you to designate a type of usage that
    # may make this transaction considered exempt by reason of exempt usage.
    #             
    # For a list of entity use codes, see the Definitions API `ListEntityUseCodes`.
    @constraint:String {maxLength: 25}
    string entityUseCode?;
    # Item Code (SKU).  If you provide an `itemCode` field, the AvaTax API will look up the item you created with the `CreateItems` API call
    # and use all the information available about that item for this transaction.
    @constraint:String {maxLength: 50}
    string itemCode?;
    # The customer Tax Id Number (tax_number) associated with a certificate - Sales tax calculation requests first determine if there is an applicable
    # ECMS entry available, and will utilize it for exemption processing. If no applicable ECMS entry is available, the AvaTax service
    # will determine if an Exemption Number field is populated or an Entity/Use Code is included in the sales tax calculation request,
    # and will perform exemption processing using either of those two options.
    # Note: This is same as 'exemptNo' in TransactionModel.
    string exemptionCode?;
    # True if the document discount should be applied to this line.  If this value is false, or not provided, discounts will not be
    # applied to this line even if they are specified on the root `discount` element.
    boolean discounted?;
    # Indicates whether the `amount` for this line already includes tax.
    #             
    # If this value is `true`, the final price of this line including tax will equal the value in `amount`.
    #             
    # If this value is `null` or `false`, the final price will equal `amount` plus whatever taxes apply to this line.
    boolean taxIncluded?;
    # Revenue Account (Customer Defined Field).
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 50}
    string revenueAccount?;
    # Ref1 (Customer Defined Field)
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 250}
    string ref1?;
    # Ref2 (Customer Defined Field)
    #             
    # This field is available for you to use to provide whatever information your implementation requires.  It does not affect tax calculation.
    @constraint:String {maxLength: 250}
    string ref2?;
    # Item description.
    #             
    # For Streamlined Sales Tax (SST) customers, this field is required if an unmapped `itemCode` is used.
    @constraint:String {maxLength: 2096}
    string description?;
    # VAT business identification number for the customer for this line item.  If you leave this field empty,
    # this line item will use whatever business identification number you provided at the transaction level.
    #             
    # If you specify a VAT business identification number for the customer in this transaction and you have also set up
    # a business identification number for your company during company setup, this transaction will be treated as a
    # business-to-business transaction for VAT purposes and it will be calculated according to VAT tax rules.
    @constraint:String {maxLength: 25}
    string businessIdentificationNo?;
    # Represents a tax override for a transaction
    TaxOverrideModel taxOverride?;
    # Special parameters that apply to this line within this transaction.
    #             
    # To get a full list of available parameters, please use the `ListParameters` API.
    TransactionLineParameterModel[] parameters?;
    # Custom user fields/flex fields for this line.
    TransactionLineUserDefinedFieldModel[] userDefinedFields?;
    # The Item code for Custom Duty / Global Import tax determination
    # Harmonized Tariff System code for this transaction.
    #             
    # For a list of harmonized tariff codes, see the Definitions API for harmonized tariff codes.
    @constraint:String {maxLength: 25}
    string hsCode?;
    # DEPRECATED - Date: 04/15/2021, Version: 21.4, Message: Please use merchantSellerIdentifier instead.
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    int merchantSellerId?;
    # ID of the merchant selling on the Marketplace. This field must be populated by Marketplace.
    @constraint:String {maxLength: 100}
    string merchantSellerIdentifier?;
    # This field will identify who is remitting Marketplace or Seller. This field must be populated by Marketplace.
    string marketplaceLiabilityType?;
    # The transaction's original ID in its origination system
    @constraint:String {maxLength: 50}
    string originationDocumentId?;
    # Synonym of Marketplace Origination. Name of the Marketplace where the transaction originated from.
    @constraint:String {maxLength: 60}
    string originationSite?;
    # Product category breadcrumbs. This is the full path to the category where item is included. Categories should be separated by “ > “.  Multiple category paths per item are accepted. In this case, category paths should be separated by “;”.
    @constraint:String {maxLength: 4000}
    string category?;
    # A long description of the product.
    @constraint:String {maxLength: 4000}
    string summary?;
};

public type CertExpressInvitationModelFetchResult record {
    int '\@recordsetCount?;
    CertExpressInvitationModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents the answer to one local jurisdiction question for a location.
public type LocationSettingModel record {
    # The unique ID number of the location question answered.
    int questionId?;
    # The name of the question
    string questionName?;
    # The answer the user provided.
    @constraint:String {maxLength: 50}
    string value?;
};

# Represents information about a tax form known to Avalara
public type AvaFileFormModel record {
    # Unique Id of the form
    int id?;
    # Name of the file being returned
    string returnName?;
    # Name of the submitted form
    string formName?;
    # A description of the submitted form
    string description?;
    # The date this form starts to take effect
    string effDate?;
    # The date the form finishes to take effect
    string endDate?;
    # State/Province/Region where the form is submitted for
    string region?;
    # The country this form is submitted for
    string country?;
    # The type of the form being submitted
    string formTypeId?;
    # The type of Filing option
    string filingOptionTypeId?;
    # The type of the due date
    string dueDateTypeId?;
    # Due date
    int dueDay?;
    # The type of E-file due date.
    string efileDueDateTypeId?;
    # The date by when the E-filing should be submitted
    int efileDueDay?;
    # The time of day by when the E-filing should be submitted
    string efileDueTime?;
    # Whether the customer has discount
    boolean hasVendorDiscount?;
    # The way system does the rounding
    string roundingTypeId?;
    # The outlet type of the form
    string outletTypeId?;
};

# Represents communication between Avalara and the company regarding the processing of a tax notice.
public type NoticeCommentModel record {
    # The unique ID number of this notice.
    int id?;
    # The ID of the notice this comment is attached too
    int noticeId;
    # The date this comment was entered
    string date?;
    # TaxNoticeComment
    string comment?;
    # TaxNoticeCommentUserId
    int commentUserId?;
    # TaxNoticeCommentUserName
    string commentUserName?;
    # taxNoticeCommentTypeId
    int commentTypeId?;
    # taxNoticeCommentType
    string commentType;
    # TaxNoticeCommentLink
    string commentLink?;
    # TaxNoticeFileName
    @constraint:String {maxLength: 300}
    string taxNoticeFileName?;
    # resourceFileId
    int resourceFileId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # A request to upload a file to Resource Files
    ResourceFileUploadRequestModel attachmentUploadRequest?;
};

# A model used to initialize a new CertCapture eCommerce token.
public type CreateECommerceTokenInputModel record {
    # The customer's number that the token will be issued for.
    string customerNumber;
};

# Represents a bulk upload response model.
public type ItemBulkUploadOutputModel record {
    # Count of processed objects
    int total?;
    # Dictionary of object and respective list of errors
    ItemUploadErrorModel[] failed?;
};

# An edit to be made on a filing calendar.
public type FilingCalendarEditModel record {
    # The name of the field to be modified.
    string fieldName;
    # The unique ID of the filing calendar question. "Filing calendar question" is the wording displayed to users for a given field.
    int questionId;
    # The current value of the field.
    record {} oldValue;
    # The new/proposed value of the field.
    record {} newValue;
};

public type CoverLetterModelFetchResult record {
    int '\@recordsetCount?;
    CoverLetterModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type UserModelFetchResult record {
    int '\@recordsetCount?;
    UserModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents information about a single legal taxing jurisdiction within a specific Avalara tax region.
public type DenormalizedJurisModel record {
    # The jurisdiction's effective date.
    string effectiveDate?;
    # The jurisdiction's end date.
    string endDate?;
    # The jurisdiction's code.
    string jurisCode?;
    # The jurisdiction's id.
    int jurisdictionId?;
    # The jurisdiction's type.
    string jurisType?;
    # The jurisdiction's name.
    string jurisName?;
    # The state assigned code.
    string stateAssignedCode?;
    # The id of the tax authority.
    int taxAuthorityId?;
    # The jurisdiction's region.
    # This should exist on the TaxRegion, but in practice often doesn't.
    string state?;
    # The jurisdiction's country.
    # This should exist on the TaxRegion, but in practice often doesn't.
    string country?;
    # The jurisdiction's county.
    # This should exist on the TaxRegion, but in practice often doesn't.
    string county?;
    # The jurisdiction's city.
    # This should exist on the TaxRegion, but in practice often doesn't.
    string city?;
    # Is Acm flag
    boolean isAcm?;
    # Is Sst flag
    boolean isSst?;
};

# Represents a customer to whom you sell products and/or services.
public type CustomerModel record {
    # Unique ID number of this customer.
    int id?;
    # The unique ID number of the AvaTax company that recorded this customer.
    int companyId;
    # The unique code identifying this customer.  Must be unique within your company.
    #             
    # This code should be used in the `customerCode` field of any call that creates or adjusts a transaction
    # in order to ensure that all exemptions that apply to this customer are correctly considered.
    #             
    # Note: This field is case sensitive.
    string customerCode;
    # A customer-configurable alternate ID number for this customer.  You may set this value to match any
    # other system that would like to reference this customer record.
    string alternateId?;
    # A friendly name identifying this customer.
    string name;
    # Indicates the "Attn:" component of the address for this customer, if this customer requires mailings to be shipped
    # to the attention of a specific person or department name.
    string attnName?;
    # First line of the street address of this customer.
    string line1;
    # Second line of the street address of this customer.
    string line2?;
    # City component of the street address of this customer.
    string city;
    # Postal Code / Zip Code component of the address of this customer.
    string postalCode;
    # The main phone number for this customer.
    string phoneNumber?;
    # The fax phone number for this customer, if any.
    string faxNumber?;
    # The main email address for this customer.
    string emailAddress?;
    # The name of the main contact person for this customer.
    string contactName?;
    # Date when this customer last executed a transaction.
    string lastTransaction?;
    # The date when this record was created.
    string createdDate?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # ISO 3166 code identifying the region within the country.
    # Two and three character ISO 3166 region codes.
    #             
    # For a full list of all supported codes, please see the Definitions API `ListRegions`.
    @constraint:String {maxLength: 3}
    string region;
    # True if this customer record is specifically used for bill-to purposes.
    boolean isBill?;
    # True if this customer record is specifically used for ship-to purposes.
    boolean isShip?;
    # For customers in the United States, this field is the federal taxpayer ID number.  For businesses, this is
    # a Federal Employer Identification Number.  For individuals, this will be a Social Security Number.
    string taxpayerIdNumber?;
    # A list of exemption certficates that apply to this customer.  You can fetch this data by specifying
    # `$include=certificates` when calling a customer fetch API.
    CertificateModel[] certificates?;
    # A list of custom fields defined on this customer.
    #             
    # For more information about custom fields, see the [Avalara Help Center article about custom fields](https://help.avalara.com/0021_Avalara_CertCapture/All_About_CertCapture/Edit_or_Remove_Details_about_Customers).
    CustomFieldModel[] customFields?;
    # A list of exposure zones where you do business with this customer.
    #             
    # To keep track of certificates that are needed for each customer, set this value to a list of all exposure zones where you
    # sell products to this customer.  You can find a list of exposure zones by calling `ListExposureZones`.
    #             
    # This field is often called "Ship-To States" or "Ship-To Zones", since it generally refers to locations where you ship products
    # when this customer makes a purchase.
    #             
    # This field is useful for audit purposes since it helps you ensure you have the necessary certificates for each customer.
    ExposureZoneModel[] exposureZones?;
    # A list of ship-to customer records that are connected to this bill-to customer.
    #             
    # Customer records represent businesses or individuals who can provide exemption certificates.  Some customers
    # may have certificates that are linked to their shipping address or their billing address.  To group these
    # customer records together, you may link multiple bill-to and ship-to addresses together to represent a single
    # entity that has multiple different addresses of different kinds.
    CustomerModel[] shipTos?;
    # A list of attributes that apply to this customer.
    #             
    # You can fetch this data by specifying `$include=attributes` when calling a customer fetch API.
    CustomerAttributeModel[] attributes?;
};

# Product classification input model.
public type ItemClassificationInputModel record {
    # The product code of an item in a given system.
    @constraint:String {maxLength: 50}
    string productCode;
    # The system code in which the product belongs.
    @constraint:String {maxLength: 50}
    string systemCode?;
};

# Cycle Safe Expiration results.
public type CycleExpireModel record {
    # Whether or not the filing calendar can be expired.
    # e.g. if user makes end date of a calendar earlier than latest filing, this would be set to false.
    boolean success?;
    # The message to present to the user if expiration is successful or unsuccessful.
    string message?;
    # A list of options for expiring the filing calendar.
    CycleExpireOptionModel[] cycleExpirationOptions?;
};

# Represents a listing of all tax calculation data for filings and for accruing to future filings.
public type FilingsTaxSummaryModel record {
    # The total sales amount
    decimal salesAmount?;
    # The taxable amount
    decimal taxableAmount?;
    # The nontaxable amount
    decimal nonTaxableAmount?;
    # The tax amount
    decimal taxAmount?;
    # The remittance amount
    decimal remittanceAmount?;
    # The collect amount
    decimal collectAmount?;
    # The sales accrual amount
    decimal salesAccrualAmount?;
    # The taxable sales accrual amount
    decimal taxableAccrualAmount?;
    # The nontaxable accrual amount
    decimal nonTaxableAccrualAmount?;
    # The tax accrual amount
    decimal taxAccrualAmount?;
    # reportableSalesAmount
    decimal reportableSalesAmount?;
    # reportableNonTaxableAmount
    decimal reportableNonTaxableAmount?;
    # reportableTaxableAmount
    decimal reportableTaxableAmount?;
    # reportableTaxAmount
    decimal reportableTaxAmount?;
};

# Represents a create transaction batch response model.
public type CreateTransactionBatchResponseModel record {
    # The unique ID number of this batch.
    int id?;
    # The user-friendly readable name for this batch.
    @constraint:String {maxLength: 194}
    string name;
    # The Account ID number of the account that owns this batch.
    int accountId?;
    # The Company ID number of the company that owns this batch.
    int companyId?;
    # This batch's current processing status
    string status?;
    # The date/time when this batch started processing
    string startedDate?;
    # The number of records in this batch; determined by the server
    int recordCount?;
    # The current record being processed
    int currentRecord?;
    # The date/time when this batch was completely processed
    string completedDate?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The list of files contained in this batch.
    BatchFileModel[] files?;
};

public type TagsModelFetchResult record {
    int '\@recordsetCount?;
    TagsModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Filing Returns Model
public type FiledReturnModel record {
    # The unique ID number of the company filing return.
    int companyId?;
    # The month of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int endPeriodMonth?;
    # The year of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int endPeriodYear?;
    # The unique code of the form.
    string taxformCode?;
};

# A request to void a previously created transaction.
public type BatchVoidTransactionModel record {
    # Company Code - Specify the code of the company for this transaction.
    @constraint:String {maxLength: 50}
    string companyCode;
    # Please specify the transaction code of the transacion to void.
    string transactionCode;
    # Specifies the type of document to void.
    string documentType?;
    # Please specify the reason for voiding or cancelling this transaction.
    # To void the transaction, please specify the reason 'DocVoided'.
    # If you do not provide a reason, the void command will fail.
    string code;
};

# Model for changing the approved status of an advanced rule
public type ApproveAdvancedRuleModel record {
    # Should the rule be approved
    boolean isApproved?;
};

# Represents information about a single legal taxing jurisdiction
public type JurisdictionModel record {
    # The code that is used to identify this jurisdiction
    string code;
    # The name of this jurisdiction
    string name;
    # The type of the jurisdiction, indicating whether it is a country, state/region, city, for example.
    string 'type;
    # The base rate of tax specific to this jurisdiction.
    decimal rate?;
    # The "Sales" tax rate specific to this jurisdiction.
    decimal salesRate?;
    # The Avalara-supplied signature code for this jurisdiction.
    string signatureCode;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # The "Seller's Use" tax rate specific to this jurisdiction.
    decimal useRate?;
    # The city name of this jurisdiction
    string city?;
    # The county name of this jurisdiction
    string county?;
    # Name or ISO 3166 code identifying the country of this jurisdiction.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # A short name of the jurisidiction
    string shortName?;
    # State FIPS code
    string stateFips?;
    # County FIPS code
    string countyFips?;
    # City FIPS code
    string placeFips?;
    # Unique AvaTax Id of this Jurisdiction
    int id?;
    # The date this jurisdiction starts to take effect on tax calculations
    string effectiveDate?;
    # The date this jurisdiction stops to take effect on tax calculations
    string endDate?;
};

# Tax Details by Tax Type
public type TaxDetailsByTaxType record {
    # Tax Type
    string taxType?;
    # Total taxable amount by tax type
    decimal totalTaxable?;
    # Total exempt by tax type
    decimal totalExempt?;
    # Total non taxable by tax type
    decimal totalNonTaxable?;
    # Total tax by tax type
    decimal totalTax?;
    # Tax subtype details
    TaxDetailsByTaxSubType[] taxSubTypeDetails?;
};

# Represents a transaction parameter.
public type TransactionLineTaxAmountByTaxTypeModel record {
    # The name of the TaxType.
    string taxTypeId?;
    # The value of the TaxOverrideAmount.
    decimal taxAmount?;
};

# Represents information about a tax form known to Avalara
public type FormMasterModel record {
    # Unique ID number of this form master object
    int id?;
    # The type of the form being submitted
    int formTypeId?;
    # Unique tax form code representing this tax form
    string taxFormCode?;
    # Legacy return name as known in the AvaFileForm table
    string legacyReturnName?;
    # Human readable form summary name
    string taxFormName?;
    # Description of this tax form
    string description?;
    # True if this form is available for use
    boolean isEffective?;
    # ISO 3166 code of the country that issued this tax form
    string country?;
    # The region within which this form was issued
    string region?;
    # Tax authority that issued the form
    string authorityName?;
    # DEPRECATED
    string shortCode?;
    # Day of the month when the form is due
    int dueDay?;
    # Day of the month on which the form is considered delinquent. Almost always the same as DueDay
    int delinquentDay?;
    # Month of the year the state considers as the first fiscal month
    int fiscalYearStartMonth?;
    # Can form support multi frequencies
    boolean hasMultiFrequencies?;
    # Does this tax authority require a power of attorney in order to speak to Avalara
    boolean isPOARequired?;
    # True if this form requires that the customer register with the authority
    boolean isRegistrationRequired?;
    # Unused
    boolean hasMultiRegistrationMethods?;
    # Unused
    boolean hasSchedules?;
    # Unused
    boolean hasMultiFilingMethods?;
    # Unused
    boolean hasMultiPayMethods?;
    # Unused
    boolean isEFTRequired?;
    # Unused
    boolean isFilePayMethodLinked?;
    # Unused
    int mailingReceivedRuleId?;
    # Unused
    int proofOfMailingId?;
    # True if you can report a negative amount in a single jurisdiction on the form
    boolean isNegAmountAllowed?;
    # True if the form overall can go negative
    boolean allowNegativeOverallTax?;
    # Unused
    boolean isNettingRequired?;
    # Unused
    int roundingMethodId?;
    # Total amount of discounts that can be received by a vendor each year
    decimal vendorDiscountAnnualMax?;
    # Unused
    boolean versionsRequireAuthorityApproval?;
    # Type of outlet reporting for this form
    int outletReportingMethodId?;
    # Unused
    boolean hasReportingCodes?;
    # Not sure if used
    boolean hasPrepayments?;
    # Unused
    boolean grossIncludesInterstateSales?;
    # Unused
    string grossIncludesTax?;
    # Unused
    boolean hasEfileFee?;
    # Unused
    boolean hasEpayFee?;
    # Unused
    boolean hasDependencies?;
    # Unused
    string requiredEfileTrigger?;
    # Unused
    string requiredEftTrigger?;
    # Unused
    boolean vendorDiscountEfile?;
    # Unused
    boolean vendorDiscountPaper?;
    # Unused
    string peerReviewed?;
    # Unused
    string peerReviewedId?;
    # Unused
    string peerReviewedDate?;
    # ID of the Avalara user who created the form
    int createdUserId?;
    # Date when form was created
    string createdDate?;
    # ID of the Avalara user who modified the form
    int modifiedUserId?;
    # Date when form was modified
    string modifiedDate?;
    # Mailing address of the department of revenue
    string dorAddressMailTo?;
    # Mailing address of the department of revenue
    string dorAddress1?;
    # Mailing address of the department of revenue
    string dorAddress2?;
    # Mailing address of the department of revenue
    string dorAddressCity?;
    # Mailing address of the department of revenue
    string dorAddressRegion?;
    # Mailing address of the department of revenue
    string dorAddressPostalCode?;
    # Mailing address of the department of revenue
    string dorAddressCountry?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddressMailTo?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddress1?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddress2?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddressCity?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddressRegion?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddressPostalCode?;
    # Mailing address to use when a zero dollar form is filed
    string zeroAddressCountry?;
    # Mailing address to use when filing an amended return
    string amendedAddressMailTo?;
    # Mailing address to use when filing an amended return
    string amendedAddress1?;
    # Mailing address to use when filing an amended return
    string amendedAddress2?;
    # Mailing address to use when filing an amended return
    string amendedAddressCity?;
    # Mailing address to use when filing an amended return
    string amendedAddressRegion?;
    # Mailing address to use when filing an amended return
    string amendedAddressPostalCode?;
    # Mailing address to use when filing an amended return
    string amendedAddressCountry?;
    # Unused
    boolean onlineBackFiling?;
    # Unused
    boolean onlineAmendedReturns?;
    # --Need Further Clarification
    string prepaymentFrequency?;
    # Unused
    boolean outletLocationIdentifiersRequired?;
    # --Need Further Clarification
    string listingSortOrder?;
    # Link to the state department of revenue website, if available
    string dorWebsite?;
    # --Need Further Clarification
    boolean fileForAllOutlets?;
    # --Need Further Clarification
    boolean paperFormsDoNotHaveDiscounts?;
    # Internal behavior
    boolean stackAggregation?;
    # --Need Further Clarification
    string roundingPrecision?;
    # --Need Further Clarification
    string inconsistencyTolerance?;
    # Date when this form became effective
    string effDate?;
    # Date when this form expired
    string endDate?;
    # True if this form can be shown to customers
    boolean visibleToCustomers?;
    # True if this form requires that you set up outlets in the state
    boolean requiresOutletSetup?;
    # True if this state permits payment by ACH Credit
    boolean achCreditAllowed?;
    # Jurisdiction level of the state
    string reportLevel?;
    # True if this form is verified filed via email
    boolean postOfficeValidated?;
    # Internal Avalara flag
    string stackAggregationOption?;
    # Internal Avalara flag
    string sstBehavior?;
    # Internal Avalara flag
    string nonSstBehavior?;
    # Phone number of the department of revenue
    string dorPhoneNumber?;
    # Unused
    string averageCheckClearDays?;
    # Unused
    boolean filterZeroRatedLineDetails?;
    # Unused
    boolean allowsBulkFilingAccounts?;
    # Unused
    string bulkAccountInstructionLink?;
    # Unused
    string registrationIdFormat?;
    # Unused
    string thresholdTrigger?;
    # Unused
    string transactionSortingOption?;
    # Unused
    int contentReviewFrequencyId?;
    # Unused
    string aliasForFormMasterId?;
};

public type CompanyParameterDetailModelFetchResult record {
    int '\@recordsetCount?;
    CompanyParameterDetailModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Model representing an execution of an advanced rule for a company
public type AdvancedRuleExecutionModel record {
    # Rule execution unique identifier
    string ruleExecutionId?;
    # Name of rule execution
    string name;
    # Date rule execution starts
    string startDate?;
    # Date rule execution ends
    string endDate?;
    # Is rule execution enabled
    boolean enabled?;
    # Should we keep running if we hit an exception
    boolean continueOnError?;
    # Unique identifier of rule to execute
    string ruleId;
    # A generic global advanced rule encapsulating a script
    AdvancedRuleModel rule?;
    # Json data used for rule execution
    string customerData?;
    # Unique identifier of customer data used in rule execution
    string customerDataId?;
};

# Represents a commitment to file a tax return on a recurring basis.
# Only used if you subscribe to Avalara Returns.
public type FilingRequestModel record {
    # The unique ID number of this filing request.
    int id?;
    # The unique ID number of the company to which this filing request belongs.
    int companyId;
    # The current status of this request
    string filingRequestStatusId?;
    # Represents a commitment to file a tax return on a recurring basis.
    # Only used if you subscribe to Avalara Returns.
    FilingRequestDataModel data;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

public type NexusTaxTypeGroupModelFetchResult record {
    int '\@recordsetCount?;
    NexusTaxTypeGroupModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ItemClassificationOutputModelFetchResult record {
    int '\@recordsetCount?;
    ItemClassificationOutputModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# An account user who is permitted to use AvaTax.
public type UserModel record {
    # The unique ID number of this user.
    int id;
    # The unique ID number of the account to which this user belongs.
    int accountId;
    # If this user is locked to one company (and its children), this is the unique ID number of the company to which this user belongs.
    int companyId?;
    # The username which is used to log on to the AvaTax website, or to authenticate against API calls.
    @constraint:String {maxLength: 50, minLength: 5}
    string userName;
    # The first or given name of the user.
    @constraint:String {maxLength: 50}
    string firstName;
    # The last or family name of the user.
    @constraint:String {maxLength: 50}
    string lastName;
    # The email address to be used to contact this user.  If the user has forgotten a password, an email can be sent to this email address with information on how to reset this password.
    @constraint:String {maxLength: 50}
    string email;
    # The postal code in which this user resides.
    @constraint:String {maxLength: 10}
    string postalCode?;
    # The security level for this user.
    string securityRoleId;
    # The status of the user's password. For a new user created, this is always going to be `UserMustChange`
    string passwordStatus?;
    # True if this user is currently active.
    boolean isActive?;
    # The date when this record was created.
    string createdDate?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # Matches the subjectId of corresponding user record in AI.
    @constraint:String {maxLength: 32}
    string subjectId?;
    # Suppress new user email
    boolean suppressNewUserEmail?;
};

# Represents a listing of all tax calculation data for filings and for accruing to future filings.
public type FilingModel record {
    # The unique ID number of this filing.
    int id?;
    # The unique ID number of the company for this filing.
    int companyId?;
    # The month of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int month?;
    # The year of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int year?;
    # Indicates whether this is an original or an amended filing.
    string 'type?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # A listing of regional tax filings within this time period.
    FilingRegionModel[] filingRegions?;
};

# Represents a tax code that can be applied to items on a transaction.
# A tax code can have specific rules for specific jurisdictions that change the tax calculation behavior.
public type TaxCodeModel record {
    # The unique ID number of this tax code.
    int id?;
    # The unique ID number of the company that owns this tax code.
    int companyId?;
    # A code string that identifies this tax code.
    @constraint:String {maxLength: 25}
    string taxCode;
    # The type of this tax code.
    @constraint:String {maxLength: 2}
    string taxCodeTypeId;
    # A friendly description of this tax code.
    @constraint:String {maxLength: 255}
    string description?;
    # If this tax code is a subset of a different tax code, this identifies the parent code.
    @constraint:String {maxLength: 25}
    string parentTaxCode?;
    # True if this tax code type refers to a physical object.  Read only field.
    boolean isPhysical?;
    # The Avalara Goods and Service Code represented by this tax code.
    int goodsServiceCode?;
    # The Avalara Entity Use Code represented by this tax code.
    @constraint:String {maxLength: 40}
    string entityUseCode?;
    # True if this tax code is active and can be used in transactions.
    boolean isActive?;
    # True if this tax code has been certified by the Streamlined Sales Tax governing board.
    # By default, you should leave this value empty.
    boolean isSSTCertified?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

public type SubscriptionTypeModelFetchResult record {
    int '\@recordsetCount?;
    SubscriptionTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type SettingModelFetchResult record {
    int '\@recordsetCount?;
    SettingModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a tax rule that changes the behavior of Avalara's tax engine for certain products and/or entity use codes
# in certain jurisdictions.
#             
# Avalara supports a few different types of tax rules.  For information about tax rule types, see
# [TaxRuleTypeId](https://developer.avalara.com/api-reference/avatax/rest/v2/models/enums/TaxRuleTypeId/)
#             
# Because different types of tax rules have different behavior, some fields may change their behavior based on
# the type of tax rule selected.  Please read the documentation for each field carefully and ensure that
# the value you send is appropriate for the type of tax rule.
public type TaxRuleModel record {
    # The unique ID number of this tax rule.
    int id;
    # The unique ID number of the company that owns this tax rule.
    int companyId?;
    # For rules that apply to a specific tax code only, this specifies which tax code is affected by this rule.
    #             
    # You can choose to specify a tax code either by passing its unique ID number in the `taxCodeId` field or
    # by passing its alphanumeric code in the `taxCode` field.  To search for the appropriate tax code for your
    # custom rule, use the `ListTaxCodes` API.
    #             
    # The `RateOverrideRule`, `BaseRule`, and `ExemptEntityRule` rule types can be applied to all tax codes.  To
    # make a rule that applies to all tax codes, leave both fields blank.
    #             
    # The `ProductTaxabilityRule` rule must be associated with a tax code.  If you attempt to create a product taxability rule
    # without a tax code, you will get an error message.
    int taxCodeId?;
    # For rules that apply to a specific tax code only, this specifies which tax code is affected by this rule.
    #             
    # You can choose to specify a tax code either by passing its unique ID number in the `taxCodeId` field or
    # by passing its alphanumeric code in the `taxCode` field.  To search for the appropriate tax code for your
    # custom rule, use the `ListTaxCodes` API.
    #             
    # The `RateOverrideRule`, `BaseRule`, and `ExemptEntityRule` rule types can be applied to all tax codes.  To
    # make a rule that applies to all tax codes, leave both fields blank.
    #             
    # The `ProductTaxabilityRule` rule must be associated with a tax code.  If you attempt to create a product taxability rule
    # without a tax code, you will get an error message.
    @constraint:String {maxLength: 25}
    string taxCode?;
    # For U.S. tax rules, this is the state's Federal Information Processing Standard (FIPS) code.
    #             
    # This field is required for rules that apply to specific jurisdictions in the United States.  It is not required
    # if you set the `isAllJuris` flag to true.
    @constraint:String {maxLength: 2}
    string stateFIPS?;
    # The name of the jurisdiction to which this tax rule applies.
    #             
    # Custom tax rules can apply to a specific jurisdiction or to all jurisdictions.  To select a jurisdiction, use the
    # [ListJurisdictions API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictions/)
    # or the [ListJurisdictionsByAddress API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictionsByAddress/).
    # To set a rule that applies to all jurisdictions of a specific type, see `isAllJuris`.
    #             
    # Once you have determined which jurisdiction you wish to assign to the tax rule, you should fill in the `jurisName`, `jurisCode`, and
    # `jurisdictionTypeId` fields using the information you retrieved from the API above.
    @constraint:String {maxLength: 200}
    string jurisName?;
    # The code of the jurisdiction to which this tax rule applies.
    #             
    # Custom tax rules can apply to a specific jurisdiction or to all jurisdictions.  To select a jurisdiction, use the
    # [ListJurisdictions API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictions/)
    # or the [ListJurisdictionsByAddress API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictionsByAddress/).
    #             
    # Once you have determined which jurisdiction you wish to assign to the tax rule, you should fill in the `jurisName`, `jurisCode`, and
    # `jurisdictionTypeId` fields using the information you retrieved from the API above.
    @constraint:String {maxLength: 10}
    string jurisCode;
    # DEPRECATED - Date: 12/20/2017, Version: 18.1, Message: Please use `jurisdictionTypeId` instead.
    string jurisTypeId?;
    # The type of the jurisdiction to which this tax rule applies.
    #             
    # Custom tax rules can apply to a specific jurisdiction or to all jurisdictions.  To select a jurisdiction, use the
    # [ListJurisdictions API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictions/)
    # or the [ListJurisdictionsByAddress API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListJurisdictionsByAddress/).
    #             
    # Once you have determined which jurisdiction you wish to assign to the tax rule, you should fill in the `jurisName`, `jurisCode`, and
    # `jurisdictionTypeId` fields using the information you retrieved from the API above.
    #             
    # To make a custom tax rule for US or Canada that applies to all jurisdictions of a specific type, see the `isAllJuris`
    # field for more information.
    string jurisdictionTypeId?;
    # DEPRECATED - Date: 10/16/2017, Version: 17.11, Message: Please use `entityUseCode` instead.
    @constraint:String {maxLength: 25}
    string customerUsageType?;
    # The entity use code to which this rule applies.
    #             
    # You can create custom `entityUseCode` values with specific behavior using this API, or you can change
    # the behavior of Avalara's system-defined entity use codes.
    #             
    # For a full list of Avalara-defined entity use codes, see the [ListEntityUseCodes API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListEntityUseCodes/).
    @constraint:String {maxLength: 25}
    string entityUseCode?;
    # DEPRECATED - Date: 09/30/2021, Version: 21.9.0, Message: Please use `taxTypeCode` instead.
    # Some tax type groups contain multiple different types of tax.  To create a rule that affects only one
    # type of tax within a tax type group, set this value to the code matching the specific tax type within
    # that group.  The custom tax rule will then only apply to taxes calculated for that specific type.
    #             
    # For rules that affect all tax types, use the value `A` to match `All` tax types within that group.
    string taxTypeId?;
    # Indicates the code of the tax type that applies to this rule. Use /api/v2/definitions/taxtypes endpoint to retrieve the list of tax types applicable for your company.
    string taxTypeCode?;
    # TaxRule Product Detail indicates the HSCode(s) to which the tax rule applies.
    TaxRuleProductDetailModel[] taxRuleProductDetail?;
    # DEPRECATED - Date: 8/27/2018, Version: 18.9, Message: Please use `rateTypeCode`, `taxTypeGroup` and `subTaxType` instead.
    string rateTypeId?;
    # Indicates the code of the rate type that applies to this rule.  Use [ListRateTypesByCountry](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListRateTypesByCountry/) API for a full list of rate type codes.
    #             
    # If you specify a value in the rateTypeCode field, this rule will cause tax lines that are affected by the rule
    # to change to a different rate type code.
    string rateTypeCode?;
    # This type value determines the behavior of the tax rule.
    #             
    # You can specify that this rule controls the product's taxability or exempt / nontaxable status, the product's rate
    # (for example, if you have been granted an official ruling for your product's rate that differs from the official rate),
    # or other types of behavior.
    string taxRuleTypeId;
    # Allows you to make tax rules apply to lower jurisdictions.  This feature is only available in the United States and Canada.
    #             
    # * In the United States, this value can be used for rules written at the `State` jurisdictional level.  If set to `true`, this rule will at the state level, county level, city level, and special jurisdiction level.
    # * In Canada, this value can be used for rules written at the `Country` or `State` jurisdictional levels.  If set to `true`, this rule will at all lower jurisdictional levels.
    #             
    # For any other use case, this value must be `false`.
    boolean isAllJuris?;
    # This field has different behavior based on the type of the tax rule.
    #             
    # * For a product taxability rule, this value is either 1 or 0, indicating taxable or non-taxable.
    # * For a rate override rule, this value is the corrected rate stored as a decimal, for example, a rate of 5% would be stored as 0.05 decimal.  If you use the special value of 1.0, only the cap and threshold values will be applied and the rate will be left alone.
    decimal value?;
    # The maximum cap for the price of this item according to this rule.  Any amount above this cap will not be subject to this rule.
    #             
    # For example, if you must pay 5% of a product's value up to a maximum value of $1000, you would set the `cap` to `1000.00` and the `value` to `0.05`.
    decimal cap?;
    # The per-unit threshold that must be met before this rule applies.
    #             
    # For example, if your product is nontaxable unless it is above $100 per product, you would set the `threshold` value to `100`.  In this case, the rate
    # for the rule would apply to the entire amount above $100.
    #             
    # You can also create rules that make the entire product taxable if it exceeds a threshold, but is nontaxable
    # if it is below the threshold.  To choose this, set the `options` field to the value `TaxAll`.
    decimal threshold?;
    # Supports custom options for your tax rule.
    #             
    # Supported options include:
    # * `TaxAll` - This value indicates that the entire amount of the line becomes taxable when the line amount exceeds the `threshold`.
    @constraint:String {maxLength: 100}
    string options?;
    # The first date at which this rule applies.  If `null`, this rule will apply to all dates prior to the end date.
    string effectiveDate?;
    # The last date for which this rule applies.  If `null`, this rule will apply to all dates after the effective date.
    string endDate?;
    # A friendly name for this tax rule.
    @constraint:String {maxLength: 255}
    string description?;
    # For U.S. tax rules, this is the county's Federal Information Processing Standard (FIPS) code.
    #             
    # This field is required for rules that apply to specific jurisdictions in the United States.  It is not required
    # if you set the `isAllJuris` flag to true.
    @constraint:String {maxLength: 3}
    string countyFIPS?;
    # DEPRECATED - Date: 8/27/2018, Version: 18.9, Message: This field is no longer required.
    boolean isSTPro?;
    # Name or ISO 3166 code identifying the country where this rule will apply.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # Name or ISO 3166 code identifying the region where this rule will apply.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    # NOTE: Region is required for US and not required for non-US countries because the user may be either creating a Country-level or Region-level rule.
    string region?;
    # The sourcing types to which this rule applies.
    string sourcing?;
    # This field has different behavior based on the type of rule.
    #             
    # * For a product taxability rule, if the rule applies to an item, this value will override the tax type group of the original product.
    # * For other rules, this value determines what tax type groups will be affected by the rule.
    #             
    # Refer to `ListTaxTypeGroups` for a list of tax type groups supported by AvaTax.
    string taxTypeGroup?;
    # This field has different behavior based on the type of rule.
    #             
    # * For a product taxability rule, if the rule applies to an item, this value will override the tax sub type of the original product.
    # * For other rules, this value determines what tax sub types will be affected by the rule.
    #             
    # Refer to `ListTaxSubtypes` for a list of tax sub types supported by AvaTax.
    string taxSubType?;
    # Reserved for Avalara internal usage.  Leave this field null.
    @constraint:String {maxLength: 500}
    string nonPassthroughExpression?;
    # The currency code to use for this rule.
    #             
    # For a list of currencies supported by AvaTax, use the [ListCurrencies API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListCurrencies/).
    @constraint:String {maxLength: 3}
    string currencyCode?;
    # Reserved for Avalara internal usage.  Leave this field null.
    int preferredProgramId?;
    # For tax rules that are calculated using units of measurement, this indicates the unit of measurement type
    # used to calculate the amounts for this rule.
    #             
    # For a list of units of measurement, use the [ListUnitsOfMeasurement API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListUnitOfMeasurement/).
    int uomId?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The UnitOfBasis for the TaxRule
    string unitOfBasis?;
};

# Represents a listing of all tax calculation data for filings and for accruing to future filings.
public type MultiTaxFilingModel record {
    # The unique ID number of this filing.
    int id?;
    # The unique ID number of the company for this filing.
    int companyId?;
    # The month of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int month?;
    # The year of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int year?;
    # Indicates whether this is an original or an amended filing.
    string 'type?;
    # Represents a listing of all tax calculation data for filings and for accruing to future filings.
    FilingsTaxSummaryModel taxSummary?;
    # A detailed breakdown of the taxes in this filing
    FilingsTaxDetailsModel[] taxDetails?;
    # A listing of regional tax filings within this time period.
    MultiTaxFilingRegionModel[] filingRegions?;
};

# A company-distance-threshold model indicates the distance between a company
# and the taxing borders of various countries.  Distance thresholds are necessary
# to correctly calculate some value-added taxes.
#             
# Distance thresholds only apply to sales of goods in certain countries.  A distance threshold
# is applied for each ship-from/ship-to combination of countries.  The threshold amount is defined by
# the ship-to country.
#             
# Generally, if you have exceeded a distance threshold for taxes between a pair of countries, your tax calculation
# will be determined to be the rate in the destination country.  If you have not exceeded the threshold,
# your tax calculation will be determined to be the rate in the origin country.
#             
# The amount of a threshold is not tracked or managed in AvaTax, but the decision of your tax compliance department
# as to whether you have exceeded this threshold is maintained in this object.
#             
# By default, you are considered to have exceeded tax thresholds. If you wish to change this default, you can create
# a company-distance-threshold object to select the correct behavior for this origin/destination tax calculation process.
public type CompanyDistanceThresholdModel record {
    # A unique ID number representing this distance threshold object.
    int id?;
    # The ID number of the company that defined this distance threshold.
    int companyId?;
    # The origin country for this threshold.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string originCountry;
    # The destination country for this threshold.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string destinationCountry;
    # For distance threshold values that change over time, this is the earliest date for which this distance
    # threshold is valid.  If null, this distance threshold is valid for all dates earlier than the `endDate` field.
    string effDate?;
    # For distance threshold values that change over time, this is the latest date for which this distance
    # threshold is valid.  If null, this distance threshold is valid for all dates later than the `effDate` field.
    string endDate?;
    # True if your tax professional has determined that the value-added tax distance threshold is exceeded for this pair of countries.
    #             
    # If you set this value to `false`, your value added taxes will be calculated using the origin country.  Otherwise, value
    # added taxes will be calculated on the destination country.
    boolean thresholdExceeded?;
    # Indicates the distance threshold type.
    #             
    # This value can be either `Sale` or `Purchase`.
    @constraint:String {maxLength: 20}
    string 'type;
};

public type ECommerceTokenOutputModelFetchResult record {
    int '\@recordsetCount?;
    ECommerceTokenOutputModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a transaction batch item.
# Only one child transaction model should contain data.
public type TransactionBatchItemModel record {
    # Represents a transaction memo.
    @constraint:String {maxLength: 50000}
    string memo?;
    # Create a transaction
    CreateTransactionModel createTransactionModel?;
    # Replace an existing transaction recorded in AvaTax with a new one.
    BatchAdjustTransactionModel adjustTransactionModel?;
    # Create or adjust transaction model
    CreateOrAdjustTransactionModel createOrAdjustTransactionModel?;
    # A request to void a previously created transaction.
    BatchVoidTransactionModel voidTransactionModel?;
};

# Represents the exact API request and response from the original transaction API call, if available
public type OriginalApiRequestResponseModel record {
    # Create a transaction
    CreateTransactionModel request?;
    # This object represents a single transaction; for example, a sales invoice or purchase order.
    TransactionModel response?;
};

# The response returned after an item sync was requested.
public type SyncItemsResponseModel record {
    # The status of the request
    string status?;
};

# Filing Returns Model
public type FilingReturnModelBasic record {
    # The unique ID number of the company filing return.
    int companyId?;
    # The unique ID number of this filing return.
    int id?;
    # The filing id that this return belongs too
    int filingId?;
    # The resourceFileId of the return
    int resourceFileId?;
    # The region id that this return belongs too
    int filingRegionId?;
    # The unique ID number of the filing calendar associated with this return.
    int filingCalendarId?;
    # The country of the form.
    string country?;
    # The region of the form.
    string region?;
    # The month of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int endPeriodMonth?;
    # The year of the filing period for this tax filing.
    # The filing period represents the year and month of the last day of taxes being reported on this filing.
    # For example, an annual tax filing for Jan-Dec 2015 would have a filing period of Dec 2015.
    int endPeriodYear?;
    # The current status of the filing return.
    string status?;
    # The filing frequency of the return.
    string filingFrequency?;
    # The date the return was filed by Avalara.
    string filedDate?;
    # The sales amount.
    decimal salesAmount?;
    # The filing type of the return.
    string filingType?;
    # The name of the form.
    string formName?;
    # The remittance amount of the return.
    decimal remitAmount?;
    # The unique code of the form.
    string formCode?;
    # A description for the return.
    string description?;
    # The taxable amount.
    decimal taxableAmount?;
    # The tax amount.
    decimal taxAmount?;
    # The amount collected by avalara for this return
    decimal collectAmount?;
    # The tax due amount.
    decimal taxDueAmount?;
    # The non-taxable amount.
    decimal nonTaxableAmount?;
    # The non-taxable due amount.
    decimal nonTaxableDueAmount?;
    # Consumer use tax liability.
    decimal consumerUseTaxAmount?;
    # Consumer use non-taxable amount.
    decimal consumerUseNonTaxableAmount?;
    # Consumer use taxable amount.
    decimal consumerUseTaxableAmount?;
    # The amount of sales excluded from the liability calculation
    decimal excludedSalesAmount?;
    # The amount of non-taxable sales excluded from the liability calculation
    decimal excludedNonTaxableAmount?;
    # The amount of tax excluded from the liability calculation
    decimal excludedTaxAmount?;
    # Accrual type of the return
    string accrualType?;
    # The attachments for this return.
    FilingAttachmentModel[] attachments?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
};

# One Universal Product Code object as defined for your company.
public type UPCModel record {
    # The unique ID number for this UPC.
    int id?;
    # The unique ID number of the company to which this UPC belongs.
    int companyId?;
    # The 12-14 character Universal Product Code, European Article Number, or Global Trade Identification Number.
    @constraint:String {maxLength: 18, minLength: 12}
    string upc;
    # Legacy Tax Code applied to any product sold with this UPC.
    @constraint:String {maxLength: 50}
    string legacyTaxCode?;
    # Description of the product to which this UPC applies.
    @constraint:String {maxLength: 255}
    string description;
    # If this UPC became effective on a certain date, this contains the first date on which the UPC was effective.
    string effectiveDate?;
    # If this UPC expired or will expire on a certain date, this contains the last date on which the UPC was effective.
    string endDate?;
    # A usage identifier for this UPC code.
    int usage?;
    # A flag indicating whether this UPC code is attached to the AvaTax system or to a company.
    int isSystem?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Represents a verification request using Skyscraper for a company
public type RequiredFilingCalendarDataFieldModel record {
    # Region of the verification request
    string name?;
    # Username that we are using for verification
    string description?;
};

# Represents an override of tax jurisdictions for a specific address.
#             
# During the time period represented by EffDate through EndDate, all tax decisions for addresses matching
# this override object will be assigned to the list of jurisdictions designated in this object.
public type JurisdictionOverrideModel record {
    # The unique ID number of this override.
    int id?;
    # The unique ID number assigned to this account.
    int accountId?;
    # A description of why this jurisdiction override was created.
    @constraint:String {maxLength: 50}
    string description;
    # The street address of the physical location affected by this override.
    @constraint:String {maxLength: 50}
    string line1?;
    # The city address of the physical location affected by this override.
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country to be affected by this override.
    #             
    # Note that only United States addresses are affected by the jurisdiction override system.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region;
    # The two character ISO-3166 country code of the country affected by this override.
    #             
    # Note that only United States addresses are affected by the jurisdiction override system.
    string country?;
    # The postal code of the physical location affected by this override.
    @constraint:String {maxLength: 11}
    string postalCode;
    # The date when this override first takes effect.  Set this value to null to affect all dates up to the end date.
    string effectiveDate?;
    # The date when this override will cease to take effect.  Set this value to null to never expire.
    string endDate?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # A list of the tax jurisdictions that will be assigned to this overridden address.
    JurisdictionModel[] jurisdictions;
    # The TaxRegionId of the new location affected by this jurisdiction override.
    int taxRegionId;
    # The boundary level of this override
    string boundaryLevel?;
    # True if this is a default boundary
    boolean isDefault?;
};

# User Defined fields/Flex Fields at Transaction level.
public type TransactionUserDefinedFieldModel record {
    # The name of the user defined field.
    string name?;
    # The value of the user defined field.
    string value?;
};

# Represents information about a type of telecommunications transaction
public type CommunicationsTransactionTypeModel record {
    # The numeric Id of the transaction type.
    int transactionTypeId;
    # The name of the transaction type.
    string 'AvaTax\.Communications\.TransactionType?;
};

# Represents a request to activate an account by reading and accepting its terms and conditions.
public type ActivateAccountModel record {
    # Set this to true if and only if you accept Avalara's terms and conditions for your account.
    boolean acceptAvalaraTermsAndConditions?;
    # Set this to true if and only if you have fully read Avalara's terms and conditions for your account.
    boolean haveReadAvalaraTermsAndConditions?;
};

# This model contains a reconstructed CreateTransaction request object that could potentially be used
# to recreate this transaction.
#             
# Note that the API changes over time, and this reconstructed model is likely different from the exact request
# that was originally used to create this transaction.
public type ReconstructedApiRequestResponseModel record {
    # Create a transaction
    CreateTransactionModel request?;
};

public type FormMasterModelFetchResult record {
    int '\@recordsetCount?;
    FormMasterModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# NoticeResponsibility Model
public type NoticeResponsibilityDetailModel record {
    # The unique ID number of this filing frequency.
    int id?;
    # TaxNoticeId
    int noticeId;
    # TaxNoticeResponsibilityId
    int taxNoticeResponsibilityId;
    # The description name of this filing frequency
    string description?;
};

# Status of an Avalara Managed Returns funding configuration for a company
public type FundingConfigurationModel record {
    # CompanyID
    int companyId?;
    # Domain
    string systemType?;
    # Recipient
    string currency?;
    # Sender
    boolean isFundingSetup?;
    # DocumentKey
    string fundingMethod?;
    # LastPolled
    string lastUpdated?;
};

# A Customer's linked attribute denoting what features applied to the customer. A customer can
# be linked to multiple customer attributes and vice versa.
public type CustomerAttributeModel record {
    # A unique ID number representing this attribute.
    int id?;
    # A friendly readable name for this attribute.
    string name?;
    # A full help text description of the attribute.
    string description?;
    # This value is true if this is a system-defined attribute.  System-defined attributes
    # cannot be modified or deleted on the CertCapture website.
    boolean isSystemCode?;
    # A flag denotes that future exemption certificate request won't be mailed to the customer
    boolean isNonDeliver?;
    # A flag denotes that this attribute can't be removed/added to a customer record
    boolean isChangeable?;
};

public type ErrorDetail record {
    string code?;
    int number?;
    string message?;
    string description?;
    string faultCode?;
    string faultSubCode?;
    string helpLink?;
    string refersTo?;
    string severity?;
};

# Tax Authority Type Model
public type TaxAuthorityTypeModel record {
    # The unique ID number of this tax Authority customer type.
    int id;
    # The description name of this tax authority type.
    string description;
    # Tax Authority Group
    string taxAuthorityGroup?;
};

public type NoticeFilingTypeModelFetchResult record {
    int '\@recordsetCount?;
    NoticeFilingTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type ItemParameterModelFetchResult record {
    int '\@recordsetCount?;
    ItemParameterModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# A certificate attribute can be thought of as a feature or flag that is applied to a certificate.
# A single certificate can be linked to zero, one, or many certificate attributes.  The full list of
# attributes can be obtained by calling the `ListCertificateAttributes` API.
public type CertificateAttributeModel record {
    # A unique ID number representing this certificate attribute.
    int id?;
    # A friendly readable name for this certificate attribute.
    string name?;
    # A full help text description of the certificate attribute.
    string description?;
    # This value is true if this is a system-defined certificate attribute.  System-defined attributes
    # cannot be modified or deleted on the CertCapture website.
    boolean isSystemCode?;
};

public type FilingModelFetchResult record {
    int '\@recordsetCount?;
    FilingModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# An address used within this transaction.
public type TransactionAddressModel record {
    # The unique ID number of this address.
    int id?;
    # The unique ID number of the document to which this address belongs.
    int transactionId?;
    # The boundary level at which this address was validated.
    string boundaryLevel?;
    # The first line of the address.
    string line1?;
    # The second line of the address.
    string line2?;
    # The third line of the address.
    string line3?;
    # The city for the address.
    string city?;
    # The ISO 3166 region code. E.g., the second part of ISO 3166-2.
    string region?;
    # The postal code or zip code for the address.
    string postalCode?;
    # The ISO 3166 country code
    string country?;
    # The unique ID number of the tax region for this address.
    int taxRegionId?;
    # Latitude for this address
    string latitude?;
    # Longitude for this address
    string longitude?;
    # List of all the qualified jurisdictions for the TaxRegionId.
    JurisdictionModel[] jurisdictions?;
};

# Exempt certificate
public type EcmsModel record {
    # The calc_id associated with a certificate in CertCapture.
    int exemptCertId;
    # Company ID
    int companyId;
    # Customer code
    @constraint:String {maxLength: 50}
    string customerCode;
    # Customer name
    @constraint:String {maxLength: 100}
    string customerName?;
    # Address line 1
    @constraint:String {maxLength: 50}
    string address1?;
    # Address line 2
    @constraint:String {maxLength: 50}
    string address2?;
    # Address line 3
    @constraint:String {maxLength: 50}
    string address3?;
    # City
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region;
    # Postal code / zip code
    @constraint:String {maxLength: 10}
    string postalCode?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # The type of exemption certificate. Permitted values are: Blanket and Single.
    string exemptCertTypeId;
    # Document Reference Number, in the case of single-use exemption certificates, the DocumentCode or PurchaseOrderNo to which the certificate should apply.
    @constraint:String {maxLength: 50}
    string documentRefNo?;
    # Business type the customer belongs to.
    int businessTypeId;
    # Other description for this business type
    @constraint:String {maxLength: 255}
    string businessTypeOtherDescription?;
    # Exempt reason associated with the certificate, coded by CustomerUsageType.
    # Example: A - Federal Government.
    @constraint:String {maxLength: 1}
    string exemptReasonId?;
    # Other description for exempt reason i.e. Populated on if exemptReasonId is 'L' - Other.
    @constraint:String {maxLength: 255}
    string exemptReasonOtherDescription?;
    # Effective date for this exempt certificate
    string effectiveDate?;
    # A list of applicable regions for this exempt certificate.
    #             
    # To list more than one applicable region, separate the list of region codes with commas.
    @constraint:String {maxLength: 200}
    string regionsApplicable;
    # Status for this exempt certificate
    string exemptCertStatusId;
    # Date when this exempt certificate was created
    string createdDate?;
    # Date when last transaction with this exempt certificate happened
    string lastTransactionDate?;
    # When this exempt certificate will expire
    string expiryDate?;
    # User that creates the certificate
    int createdUserId?;
    # Date when this exempt certificate was modified
    string modifiedDate?;
    # Who modified this exempt certificate
    int modifiedUserId?;
    # Name or ISO 3166 code identifying the country that issued this ECMS certificate.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string countryIssued;
    # If the certificate record was synced from an AvaTax Certs account(as opposed to being entered in ECMS directly),
    # the unique AvaTax Certs identifier for the certificate record. Usually same as the Id of a Certificate.
    @constraint:String {maxLength: 10}
    string avaCertId?;
    # Review status for this exempt certificate
    string exemptCertReviewStatusId?;
    # Exempt Cert details
    EcmsDetailModel[] details?;
};

public type NoticeCustomerTypeModelFetchResult record {
    int '\@recordsetCount?;
    NoticeCustomerTypeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Request model for when a user is deleting multiple error transaction
public type DeleteErrorTransactionsRequestModel record {
    # List of error transactions to be deleted
    ErrorTransactionModelBase[] models;
};

# CycleSafe Option Result
public type CycleSafeOptionResultModel record {
    # Tax Form Code
    string taxFormCode?;
    # Boolean if the Filing Calendar must be cloned
    boolean mustCloneFilingCalendar?;
    # Cloned Calendar Effective Date
    string clonedCalendarEffDate?;
    # Expired Calendar End Date
    string expiredCalendarEndDate?;
    # Frequencies Available
    FrequencyAvailableModel[] frequenciesAvailable?;
};

# Replace an existing MultiDocument transaction recorded in AvaTax with a new one.
public type AdjustMultiDocumentModel record {
    # A reason code indicating why this adjustment was made
    string adjustmentReason;
    # If the AdjustmentReason is "Other", specify the reason here.
    #             
    # This is required when the AdjustmentReason is 8 (Other).
    string adjustDescription?;
    # A MultiDocument transaction represents a sale or purchase that occurred between more than two companies.
    #             
    # A traditional transaction requires exactly two parties: a seller and a buyer.  MultiDocument transactions can
    # involve a marketplace of vendors, each of which contributes some portion of the final transaction.  Within
    # a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
    # document.  This separation of documents allows each seller to file their taxes separately.
    CreateMultiDocumentModel newTransaction;
};

# Represents a tax rule product detail that changes the behavior of Avalara's tax engine for certain tax rules.
#             
# Avalara supports a two types of tax product detail.  For information about tax rule Product Types
# HSCode and TaxCode
#             
# Because different types of tax rules have different behavior, some fields may change their behavior based on
# the type of tax rule selected.  Please read the documentation for each field carefully and ensure that
# the value you send is appropriate for the type of tax rule.
public type TaxRuleProductDetailModel record {
    # The unique ID number of this Tax rule product detail.
    int taxRuleProductDetailId?;
    # TaxRule Id of TaxRule Product Detail entry
    int taxRuleId?;
    # Product Code value
    string productCode?;
    # The first date at which this product detail applies.  If `null`, this product detail will apply to all dates prior to the end date.
    string effectiveDate?;
    # The last date for which this product detail applies.  If `null`, this product detail will apply to all dates after the effective date.
    string endDate?;
    # Represents the system Id the detail is applicable for.
    int systemId?;
};

# Ping Result Model
public type PingResultModel record {
    # Version number
    string 'version?;
    # Returns true if you provided authentication for this API call; false if you did not.
    boolean authenticated?;
    # Returns the type of authentication you provided, if authenticated
    string authenticationType?;
    # The username of the currently authenticated user, if any.
    string authenticatedUserName?;
    # The ID number of the currently authenticated user, if any.
    int authenticatedUserId?;
    # The ID number of the currently authenticated user's account, if any.
    int authenticatedAccountId?;
    # The ID number of the currently authenticated user's company, if any.
    int authenticatedCompanyId?;
    # The connected Salesforce account.
    string crmid?;
};

public type PostalCodeModelFetchResult record {
    int '\@recordsetCount?;
    PostalCodeModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Model for retrieving customer data schema
public type AdvancedRuleCustomerDataSchemaModel record {
    # Unique identifier for the rule
    string ruleId?;
    # Customer data schema
    string customerDataSchema?;
};

public type CommunicationsTSPairModelFetchResult record {
    int '\@recordsetCount?;
    CommunicationsTSPairModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a parameter associated with a company.
public type CustomerSupplierModel record {
    # Identifier for company parameter
    int id?;
    # CompanyId associated with the parameter
    int companyId?;
    # CustomerCode
    string customerCode;
};

# Represents the current status of a funding ESign method
public type FundingESignMethodReturn record {
    # Method
    string method?;
    # JavaScriptReady
    boolean javaScriptReady?;
    # The actual javascript to use to render this object
    string javaScript?;
};

# Options for expiring a filing calendar.
public type CycleSafeEditRequestModel record {
    # Company Identifier
    int companyId?;
    # Tax Form Code
    string taxFormCode?;
    # Filing Calendar Identifier
    int filingCalendarId?;
    # Filing calendar edits
    CycleSafeFilingCalendarEditModel[] edits?;
};

# Model to specify lines to be removed
public type RemoveTransactionLineModel record {
    # company code
    string companyCode;
    # document code for the transaction to add lines
    string transactionCode;
    # document type
    string documentType?;
    # List of line numbers to be removed
    string[] lines;
    # ption to renumber lines after removal. After renumber, the line number becomes: "1", "2", "3", ...
    boolean renumber?;
};

public type Message record {
    string details?;
    string helpLink?;
    string name?;
    string refersTo?;
    string severity?;
    string 'source?;
    string summary?;
};

public type IdAttachmentBody record {
    # The exemption certificate file you wanted to upload. Accepted formats are: PDF, JPEG, TIFF, PNG.
    string file;
};

# A model for aggregated rates.
public type ComplianceAggregatedTaxRateModel record {
    # The compontent rate.
    decimal rate?;
    # The stack rate based on the aggregation method.
    decimal stackRate?;
    # The date this rate is starts to take effect.
    string effectiveDate?;
    # The date this rate is no longer active.
    string endDate?;
    # The tax type of the rate.
    string taxTypeId?;
    # The rate type of the rate.
    string rateTypeId?;
};

public type NoticeRootCauseModelFetchResult record {
    int '\@recordsetCount?;
    NoticeRootCauseModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type JurisdictionRateTypeTaxTypeMappingModelFetchResult record {
    int '\@recordsetCount?;
    JurisdictionRateTypeTaxTypeMappingModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

public type SkyscraperStatusModelFetchResult record {
    int '\@recordsetCount?;
    SkyscraperStatusModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a tax subtype
public type TaxSubTypeModel record {
    # The unique ID number of this tax sub-type.
    int id;
    # The unique human readable Id of this tax sub-type.
    string taxSubType;
    # The description of this tax sub-type.
    string description;
    # The upper level group of tax types.
    string taxTypeGroup;
};

# Encapsulates the result of uploading a file to the resource system
public type ResourceFileUploadResultModel record {
    # If the request failed, this contains a description of the error.
    string message?;
    # If the request succeeded, this is the ID number of the file.
    int resourceFileId?;
    # True if the upload request succeeded.
    boolean aaa_success?;
};

# Tax Notice Priority Model
public type NoticePriorityModel record {
    # The unique ID number of this tax notice customer Priority.
    int id;
    # The description name of this tax authority Priority.
    string description;
    # A flag if the Priority is active
    boolean activeFlag?;
    # sort order of the Prioritys
    int sortOrder?;
};

# Represents a tag for an item in your company's product catalog.
public type ItemTagDetailModel record {
    # The unique ID number of the item-tag relation.
    int itemTagDetailId?;
    # The unique tag Id for the tags.
    int tagId?;
    # The tag name.
    string tagName;
    # The unique ID number of this item.
    int itemId?;
    # The unique ID number of the company that owns this item.
    int companyId?;
    # The date when this record was created.
    string createdDate?;
};

# A location where this company does business.
# Some jurisdictions may require you to list all locations where your company does business.
public type LocationModel record {
    # The unique ID number of this location.
    int id;
    # The unique ID number of the company that operates at this location.
    int companyId?;
    # A code that identifies this location.  Must be unique within your company.
    @constraint:String {maxLength: 50}
    string locationCode;
    # A friendly name for this location.
    @constraint:String {maxLength: 255}
    string description?;
    # Indicates whether this location is a physical place of business or a temporary salesperson location.
    string addressTypeId;
    # Indicates the type of place of business represented by this location.
    string addressCategoryId;
    # Indicates whether the Marketplace is outside or in USA
    boolean isMarketplaceOutsideUsa?;
    # The first line of the physical address of this location.
    @constraint:String {maxLength: 50}
    string line1;
    # The second line of the physical address of this location.
    @constraint:String {maxLength: 50}
    string line2?;
    # The third line of the physical address of this location.
    @constraint:String {maxLength: 50}
    string line3?;
    # The city of the physical address of this location.
    @constraint:String {maxLength: 50}
    string city?;
    # The county name of the physical address of this location.  Not required.
    @constraint:String {maxLength: 50}
    string county?;
    # Name or ISO 3166 code identifying the region within the country of the physical address of this location.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # The postal code or zip code of the physical address of this location.
    @constraint:String {maxLength: 10}
    string postalCode;
    # Name or ISO 3166 code identifying the country of the physical address of this location.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country;
    # Set this flag to true to indicate that this is the default location for this company.
    boolean isDefault?;
    # Set this flag to true to indicate that this location has been registered with a tax authority.
    boolean isRegistered?;
    # If this location has a different business name from its legal entity name, specify the "Doing Business As" name for this location.
    @constraint:String {maxLength: 100}
    string dbaName?;
    # A friendly name for this location.
    @constraint:String {maxLength: 100}
    string outletName?;
    # The date when this location was opened for business, or null if not known.
    string effectiveDate?;
    # If this place of business has closed, the date when this location closed business.
    string endDate?;
    # The most recent date when a transaction was processed for this location.  Set by AvaTax.
    string lastTransactionDate?;
    # The date when this location was registered with a tax authority.  Not required.
    string registeredDate?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # Extra information required by certain jurisdictions for filing.
    # For a list of settings recognized by Avalara, query the endpoint "/api/v2/definitions/locationquestions".
    # To determine the list of settings required for this location, query the endpoint "/api/v2/companies/(id)/locations/(id)/validate".
    LocationSettingModel[] settings?;
    # List of location parameters.
    LocationParameterModel[] parameters?;
};

# A model used to request the refresh of a CertCapture eCommerce token.
public type RefreshECommerceTokenInputModel record {
    # The token that requires its expiration to be extended.
    string token;
};

# Tax Notice FilingType Model
public type NoticeFilingTypeModel record {
    # The unique ID number of this tax notice customer type.
    int id;
    # The description name of this tax authority type.
    string description;
    # A flag if the type is active
    boolean activeFlag?;
    # sort order of the types
    int sortOrder?;
};

public type MrsCompanyModelFetchResult record {
    int '\@recordsetCount?;
    MrsCompanyModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# NoticeResponsibility Model
public type NoticeResponsibilityModel record {
    # The unique ID number of this notice responsibility.
    int id?;
    # The description name of this notice responsibility
    string description?;
    # Defines if the responsibility is active
    boolean isActive?;
    # The sort order of this responsibility
    int sortOrder?;
};

public type NoticePriorityModelFetchResult record {
    int '\@recordsetCount?;
    NoticePriorityModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a base address element.
public type AddressInfo record {
    # First line of the street address
    string line1?;
    # Second line of the street address
    @constraint:String {maxLength: 100}
    string line2?;
    # Third line of the street address
    @constraint:String {maxLength: 100}
    string line3?;
    # City component of the address
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Postal Code / Zip Code component of the address.
    @constraint:String {maxLength: 11}
    string postalCode?;
    # Geospatial latitude measurement, in Decimal Degrees floating point format.
    decimal latitude?;
    # Geospatial longitude measurement, in Decimal Degrees floating point format.
    decimal longitude?;
};

# An extra property that can change the behavior of tax transactions.
public type ParameterModel record {
    # The unique ID number of this property.
    int id?;
    # DEPRECATED - Date: 07/25/2018, Version: 18.7, Message: This field is deprecated and will return null.
    # The category grouping of this parameter.  When your user interface displays a large number of parameters, they should
    # be grouped by their category value.
    string category?;
    # The name of the property.  To use this property, add a field on the `parameters` object of a [CreateTransaction](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/) call.
    string name?;
    # The data type of the property.
    string dataType?;
    # Help text to be shown to the user when they are filling out this parameter.  Help text may include HTML links to additional
    # content with more information about a parameter.
    string helpText?;
    # A list of service types to which this parameter applies.
    string[] serviceTypes?;
    # DEPRECATED - Date: 07/25/2018, Version: 18.7, Message: This field is deprecated and will return null.
    # The prompt you should use when displaying this parameter to a user.  For example, if your user interface displays a
    # parameter in a text box, this is the label you should use to identify that text box.
    string prompt?;
    # DEPRECATED - Date: 07/25/2018, Version: 18.7, Message: This field is deprecated and will return null.
    # If your user interface permits client-side validation of parameters, this string is a regular expression you can use
    # to validate the user's data entry prior to submitting a tax request.
    string regularExpression?;
    # Label that helps the user to identify a parameter
    string label?;
    # A help url that provides more information about the parameter
    string helpUrl?;
    # The type of parameter as determined by its application, e.g. Product, Transaction, Calculated
    string attributeType?;
    # If the parameter is of enumeration data type, then this list will be populated with all of the possible enumeration values.
    string[] values?;
    # The unit of measurement type of the parameter
    string measurementType?;
    # This field identifies if parameter is needed for calculation
    boolean isNeededForCalculation?;
    # This field identifies if parameter is needed for returns
    boolean isNeededForReturns?;
    # This field identifies if parameter is needed for classification
    boolean isNeededForClassification?;
};

# A model for return payments.
public type FilingPaymentModel record {
    # The unique ID number for the payment.
    int id?;
    # The filing return id that this applies too
    int filingId;
    # The payment amount.
    decimal paymentAmount;
    # The type of the payment.
    string 'type;
    # Whether or not the payment has been calculated.
    boolean isCalculated?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};

# Expire a location without restriction then update with new remittance and dates.
public type UpdateCompanyLocationRemittanceModel record {
    # Indicates whether this location is a physical place of business or a temporary salesperson location.
    string addressCategoryId;
    # The date when this location was opened for business.
    string effectiveDate;
    # If this place of business has closed, the date when this location closed business. If null it'll be set to the date of 9998-12-31.
    string endDate?;
};

# Represents information about location types stored in a line
public type TransactionLineLocationTypeModel record {
    # The unique ID number of this line location address model
    int documentLineLocationTypeId?;
    # The unique ID number of the document line associated with this line location address model
    int documentLineId?;
    # The address ID corresponding to this model
    int documentAddressId?;
    # The location type code corresponding to this model
    string locationTypeCode?;
};

# Data source object
public type DataSourceModel record {
    # The id of the datasource.
    int id?;
    # The id of the company to which the datasource belongs to.
    int companyId;
    # The extractor/connector id.
    string 'source;
    # The unique ID number of this connection.
    string instance?;
    # The connection using the connection_id is enabled. The customer is responsible to enable or disable.
    boolean isEnabled?;
    # If all the information has been transferred from the extractor to the database.
    boolean isSynced?;
    # True if this data source is authorized.
    boolean isAuthorized?;
    # The date when the information was last synched.
    string lastSyncedDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date when this record was created.
    string createdDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The date when this record was deleted.
    string deletedDate?;
    # Specifies whether transactions created by this data source needs to re-calculate tax or not
    boolean recalculate?;
    # Specifies the name of the extractor
    string name?;
    # Specifies any implementation-specific information along with the DataSource.This field has no internal meaning in AvaTax and is purely for the convenience of the DataSource API user
    string externalState?;
};

public type JurisdictionModelFetchResult record {
    int '\@recordsetCount?;
    JurisdictionModel[] value?;
    string '\@nextLink?;
    string pageKey?;
};

# Represents a listing of all tax calculation data for filings and for accruing to future filings.
public type FilingsTaxDetailsModel record {
    # The tax type associated with the summary
    string taxType?;
    # The total sales amount
    decimal salesAmount?;
    # The nontaxable amount
    decimal nonTaxableAmount?;
    # The tax amount
    decimal taxAmount?;
    # The number of nights
    int numberOfNights?;
};

# An attachment associated with a filing return
public type FilingReturnCreditModel record {
    # The resourceFileId used to retrieve the attachment
    decimal totalSales?;
    # The resourceFileId used to retrieve the attachment
    decimal totalExempt?;
    # The resourceFileId used to retrieve the attachment
    decimal totalTaxable?;
    # The resourceFileId used to retrieve the attachment
    decimal totalTax?;
    # The excluded carry over credit documents
    WorksheetDocument[] transactionDetails?;
};

# TextCase info for input address
public type AddressValidationInfo record {
    # First line of the street address
    @constraint:String {maxLength: 50}
    string line1?;
    # Specify the text case for the validated address result.  If not specified, will return uppercase.
    string textCase?;
    # Second line of the street address
    @constraint:String {maxLength: 100}
    string line2?;
    # Third line of the street address
    @constraint:String {maxLength: 100}
    string line3?;
    # City component of the address
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # Postal Code / Zip Code component of the address.
    @constraint:String {maxLength: 11}
    string postalCode?;
    # Geospatial latitude measurement, in Decimal Degrees floating point format.
    decimal latitude?;
    # Geospatial longitude measurement, in Decimal Degrees floating point format.
    decimal longitude?;
};

# A contact person for a company.
public type ContactModel record {
    # The unique ID number of this contact.
    int id?;
    # The unique ID number of the company to which this contact belongs.
    int companyId?;
    # A unique code for this contact.
    @constraint:String {maxLength: 25}
    string contactCode;
    # The first or given name of this contact.
    @constraint:String {maxLength: 50}
    string firstName?;
    # The middle name of this contact.
    @constraint:String {maxLength: 50}
    string middleName?;
    # The last or family name of this contact.
    @constraint:String {maxLength: 50}
    string lastName?;
    # Professional title of this contact.
    @constraint:String {maxLength: 50}
    string title?;
    # The first line of the postal mailing address of this contact.
    @constraint:String {maxLength: 50}
    string line1?;
    # The second line of the postal mailing address of this contact.
    @constraint:String {maxLength: 50}
    string line2?;
    # The third line of the postal mailing address of this contact.
    @constraint:String {maxLength: 50}
    string line3?;
    # The city of the postal mailing address of this contact.
    @constraint:String {maxLength: 50}
    string city?;
    # Name or ISO 3166 code identifying the region within the country.
    #             
    # This field supports many different region identifiers:
    #  * Two and three character ISO 3166 region codes
    #  * Fully spelled out names of the region in ISO supported languages
    #  * Common alternative spellings for many regions
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
    string region?;
    # The postal code or zip code of the postal mailing address of this contact.
    @constraint:String {maxLength: 10}
    string postalCode?;
    # Name or ISO 3166 code identifying the country.
    #             
    # This field supports many different country identifiers:
    #  * Two character ISO 3166 codes
    #  * Three character ISO 3166 codes
    #  * Fully spelled out names of the country in ISO supported languages
    #  * Common alternative spellings for many countries
    #             
    # For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
    string country?;
    # The email address of this contact.
    @constraint:String {maxLength: 50}
    string email?;
    # The main phone number for this contact.
    @constraint:String {maxLength: 25}
    string phone?;
    # The mobile phone number for this contact.
    @constraint:String {maxLength: 25}
    string mobile?;
    # The facsimile phone number for this contact.
    @constraint:String {maxLength: 25}
    string fax?;
    # The date when this record was created.
    string createdDate?;
    # The User ID of the user who created this record.
    int createdUserId?;
    # The date/time when this record was last modified.
    string modifiedDate?;
    # The user ID of the user who last modified this record.
    int modifiedUserId?;
};
