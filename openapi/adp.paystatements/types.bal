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

# The pay distribution (transfer) purpose,e.g. Salary, Travel Expenses, Pension Plan, etc.  Client should provide specific code list.  If no value is provided, Salary (payroll) distribution should be assumed
public type PaystatementDistributionpurposecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # The string representation of the date value. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

# Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden
public type PeriodType record {
    # The label which will be shown in the UI for the section. If this value is not passed then the default value is presented in the UI
    string sectionLabelName?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    LabeledAmountType totalAmount?;
};

public type ProjectedpaystatementPaystatementEmployerTaxids record {
    # Is the Identifier of the given instance of an entity
    string id;
    # The label of the related entity to show on the UI
    string labelName?;
};

# The Amount paid after all deductions are taken out
public type PaystatementsNetpayamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The payroll agreement id
public type PaystatementPayrollagreementid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    PaystatementPayrollagreementidSchemecode schemeCode?;
};

public type PaystatementDepositaccountFinancialpartyCommunicationEmails record {
    # The unique identifier of the object in a collection
    string itemID?;
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    PaystatementDepositaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string emailUri?;
    # The effective date of the related entity. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

# The region in which the payroll is processed
public type PaystatementPayrollregioncode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The type of street, e.g. Lane, Passage, Way
public type PaystatementDepositaccountFinancialpartyAddressStreettypecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ProjectedpaystatementPaystatementOtherpaydetail record {
    # The label to be shown on the UI for the section
    string labelName;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType payAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType payYTDAmount?;
    # Number of hours related to the pay for the pay period
    decimal payPeriodHours?;
    # The amount an individual is paid over time
    RateFormulaType payRate?;
    # Indicates whether amoun is taken pre tax
    boolean preTaxIndicator?;
    # Identifies the percentage
    decimal percentage?;
    # To indicate if a given pay item represents an adjustment.  The regular item is assumed if the indicator is omitted
    boolean adjustmentIndicator?;
};

# Employer location
public type PaystatementEmployerEmployerlocation record {
    # The label to be shown on the UI
    string labelName?;
    # The name of the location
    string locationName?;
    # A list of formatted address lines which will be shown on the UI in the order of the array items.  This is mutually exclusive to the component parts of the the address.  If this is returned in the JSON it will be used to present on the UI
    string[] formattedAddressLines?;
};

public type ProjectedpaystatementPaystatementEarnings record {
    # Identifies the Hours/Earnings Code. The typeCode attribute is used to further refine the EarningCode with the Hours/Earnings Field Number
    string earningCodeName;
    # The earning category name
    string earningCategoryCodeName?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType earningAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType earningYTDAmount?;
    # Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden
    PeriodType earningPeriod?;
    # Number of hours related to the earning for the pay period
    decimal payPeriodHours?;
    # The amount an individual is paid over time
    RateFormulaType payRate?;
    # Indicates whether deduction is taken pre tax. If there is no current period earning and only a year to date amount the pre tax indicator is irrelevant and should not be passed
    boolean preTaxIndicator?;
    # To indicate if a given earning item represents an adjustment.  The regular item is assumed if the indicator is omitted
    boolean adjustmentIndicator?;
};

# The amount an individual is paid over time
public type RateFormulaType record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode?;
    # The units in which the quantity is communicated
    string unitTimeCode?;
    # The formula details for a payment calculation amount result
    CalculationFormulaType calculationFormula?;
};

# The code of the memo. The code can be user defined or statutory.
public type PaystatementNamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Data which provides reference to a position
public type PaystatementsPositionref record {
    # Position identifier a person may enter time against.
    PaystatementsPositionrefPositionid positionID?;
    # The title of the position
    string title?;
};

# The account where the moneis are to be distributed
public type ProjectedpaystatementPaystatementDepositaccountFinancialaccount record {
    # The unique identifier of the account where the moneis are to be distributed
    string accountNumber?;
    # The name of the related account
    string accountName?;
    # The type of account, e.g. Checking, Savings
    CodeType typeCode?;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode?;
};

# The Year To Date Amount paid before any deductions are taken out.  This may not be shown on the pay statement or it may be zero or some value
public type PaystatementsGrosspayytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type FormulaComponentType record {
    string nodeID?;
    string nodeType?;
    string nodeName?;
    NodeValue nodeValue?;
    boolean expandable?;
    string policyInstanceID?;
};

# Position identifier a person may enter time against.
public type PaystatementsPositionrefPositionid record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # name of the identification scheme
    string schemeName?;
    # Agency responsible for the maintenance and definition of the identification scheme
    string schemeAgencyName?;
};

# The amount to show in the main window.  If this amount is not passed then the default property is used
public type AmountType record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode;
};

public type PaystatementsPaystatements record {
    # The name of the employer
    string employerName?;
    # Data which provides reference to a position
    PaystatementsPositionref positionRef?;
    # Pay Date is the date on which the monies (i.e. payment) are available
    string payDate?;
    # To indicate if a given statement represents an adjustment. The regular statement is assumed if the indicator is omitted
    boolean adjustmentIndicator?;
    # To indicate if a given statement has comments
    boolean commentIndicator?;
    # The Amount paid after all deductions are taken out
    PaystatementsNetpayamount netPayAmount?;
    # The Amount paid before any deductions are taken out
    PaystatementsGrosspayamount grossPayAmount?;
    # The Year To Date Amount paid before any deductions are taken out.  This may not be shown on the pay statement or it may be zero or some value
    PaystatementsGrosspayytdamount grossPayYTDAmount?;
    # The total duration in hours for the related pay
    decimal totalHours?;
    # The URI to the detail of a paystatement.  The detail shows all deductions, earnings, direct deposit, etc...
    PaystatementsPaydetailuri payDetailUri?;
    # The URI to the image of the pay statement e.g. pdf. This should be the relative uri
    PaystatementsStatementimageuri statementImageUri?;
};

# The URI to the detail of a paystatement.  The detail shows all deductions, earnings, direct deposit, etc...
public type PaystatementsPaydetailuri record {
    # URI
    string href?;
};

# Position identifier a person may enter time against.  
public type PaystatementPositionrefPositionid record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # name of the identification scheme
    string schemeName?;
    # Agency responsible for the maintenance and definition of the identification scheme
    string schemeAgencyName?;
};

public type ProjectedpaystatementPaystatementEmployerDetailvalues record {
    # The label which describes the related property.  This is user visible and should be in the requested language
    string labelName?;
    # The value
    string valueTxt?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType detailAmount?;
};

# Metadata of the related entity
public type ProjectedpaystatementPaystatementMeta record {
    # Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden
    PeriodType currentPeriod?;
    # Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden
    PeriodType aggregatePeriod?;
};

# Metadata of the related entity.  
public type PaystatementMeta record {
    # Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden.
    PaystatementMetaCurrentperiod currentPeriod?;
    # Existence of the aggregatePeriod object indicates that the default mapping of properties to the agrregatePeriod tab should be overriden.
    PaystatementMetaAggregateperiod aggregatePeriod?;
};

public type PaystatementEarnings record {
    # Identifies the Hours/Earnings Code. The typeCode attribute is used to further refine the EarningCode with the Hours/Earnings Field Number.
    string earningCodeName?;
    # The amount of the earning related to this pay period.
    PaystatementEarningamount earningAmount?;
    # The year to date amount of the earning 
    PaystatementEarningytdamount earningYTDAmount?;
    # Number of hours related to the earning for the pay period.
    decimal payPeriodHours?;
    # The amount an individual is paid over time
    PaystatementPayrate payRate?;
    # Indicates whether deduction is taken pre tax.   If there is no current period earning and only a year to date amount the pre tax indicator is irrelevant and should not be passed.
    boolean preTaxIndicator?;
};

public type PaystatementEmployerTaxids record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # The label of the related entity to show on the UI.
    string labelName?;
};

# A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
public type PaystatementDepositaccountFinancialpartyNamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ProjectedpaystatementPaystatementPaydistributions record {
    # The unique identifier of the related pay distribution within a collection
    string itemID;
    # The type of account, e.g. Checking, Savings
    CodeType payrollRegionCode?;
    # The type of account, e.g. Checking, Savings
    CodeType payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # ID
    IdtypeV2 payrollAgreementID?;
    # Payroll Agreement description is a mechanism to provide the user with the job and or position context of a given payroll agreement, e.g. a file number. It should be readable, user-friendly and might be valued with job or position title(s) or perhaps with the work assignment description(s)
    string payrollAgreementDescription?;
    # Date
    DateType requestedStartDate?;
    # The type of account, e.g. Checking, Savings
    CodeType distributionPurposeCode?;
    StatusType distributionStatusCode?;
    # Distributions made for this specific pay based on the distribution instructions
    ProjectedpaystatementPaystatementDistributions[] distributions?;
};

# The unique identifier of the associated party entity
public type PaystatementDepositaccountFinancialpartyFinancialpartyid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    PaystatementPayrollagreementidSchemecode schemeCode?;
};

public type PaystatementOtherpaydetail record {
    # The label to be shown on the UI for the section
    string labelName?;
    # The amount of the current Pay
    PaystatementPayamount payAmount?;
    # The amount of the aggregated Pay (i.e. Year to Date)
    PaystatementPayytdamount payYTDAmount?;
    # Number of hours related to the pay for the pay period.
    decimal payPeriodHours?;
    # The amount an individual is paid over time
    PaystatementPayrate payRate?;
    # Indicates whether amoun is taken pre tax.   
    boolean preTaxIndicator?;
    # Identifies the percentage
    decimal percentage?;
};

# The amount to show in the main window.  If this amount is not passed then the default property is used
public type LabeledAmountType record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode;
    # The label of the amount
    string labelName?;
};

# The time period which the pay covers
public type ProjectedpaystatementPaystatementPayperiod record {
    # Date
    DateType startDate?;
    # Date
    DateType endDate;
    # Label / description of the associated pay period
    string payPeriodLabelName?;
};

# The amount of the earning related to this pay period.
public type PaystatementEarningamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# Employer location
public type ProjectedpaystatementPaystatementEmployerEmployerlocation record {
    # The label to be shown on the UI
    string labelName?;
    # The name of the location
    string locationName?;
    # A list of formatted address lines which will be shown on the UI in the order of the array items.  This is mutually exclusive to the component parts of the the address. If this is returned in the JSON it will be used to present on the UI
    string[] formattedAddressLines?;
};

# The URI to the image of the pay statement e.g. pdf. This should be the relative uri
public type PaystatementsStatementimageuri record {
    # URI
    string href?;
};

# The total amount deducted in this pay period for deductions belonging to this category.  E.g. all benefit deductions
public type PaystatementDeductioncategorytotalperiodamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# Indicates the order of precedence for a given distribution, e.g. primary, secondary, etc.
public type PaystatementPrecedencecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ProjectedpaystatementPaystatementDeductions record {
    # The deduction code of the deduction. The code can be user defined or a  statutory deduction
    string codeName;
    # The deduction code of the deduction. The code can be user defined or a  statutory deduction
    string deductionCategoryCodeName?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType deductionAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType deductionYTDAmount?;
    # Indicates whether deduction is taken pre tax on the current period deduction.  If there is no current period deduction and only a year to date amount the pre tax indicator is irrelevant and should not be passed
    boolean preTaxIndicator?;
    # Identifies the percentage
    decimal percentage?;
    # To indicate if a given deduction item represents an adjustment.  The regular item is assumed if the indicator is omitted
    boolean adjustmentIndicator?;
};

# The formula details for a payment calculation amount result
public type CalculationFormulaType record {
    # Formula
    string formula?;
    # Formula with values
    string formulaWithValues?;
    # Formula with values only
    string formulaWithValuesOnly?;
    # Formula components
    FormulaComponentType[] formulaComponents?;
};

public type PaystatementGrosspayytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The amount of the aggregated Pay (i.e. Year to Date)
public type PaystatementPayytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The amount an individual is paid over time
public type RateType record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode?;
    # The units in which the quantity is communicated
    string unitTimeCode?;
};

# The account where the moneis are to be distributed
public type PaystatementDepositaccountFinancialparty record {
    # The unique identifier of the associated party entity
    PaystatementDepositaccountFinancialpartyFinancialpartyid financialPartyID?;
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    PaystatementDepositaccountFinancialpartyNamecode nameCode?;
    # The address of the party
    PaystatementDepositaccountFinancialpartyAddress address?;
    # Communication mechanisms, e,g, phone, email, etc
    PaystatementDepositaccountFinancialpartyCommunication communication?;
    # Branch code / number used to compose the routing id, along with the name if applicable
    PaystatementDepositaccountFinancialpartyBranchnamecode branchNameCode?;
    # A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
    PaystatementDepositaccountFinancialpartyRoutingtransitid routingTransitID?;
};

public type ProjectedpaystatementPaystatementDeductioncategorydetails record {
    # The deduction category name
    string deductionCategoryCodeName;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType deductionCategoryTotalPeriodAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType deductionCategoryTotalYTDAmount?;
};

# The Amount paid before any deductions are taken out
public type PaystatementsGrosspayamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type ProjectedpaystatementPaystatementWorkerTaxids record {
    # Identifier of the given instance of an entity
    string id;
    # The label of the related entity to show on the UI
    string labelName?;
};

# The pay distribution status,e.g. Active, Inactive, Pending, etc.  Only one Active distribution should be allowed at any given point of time, while multiple Pending (future) distribution are possible
public type PaystatementDistributionstatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # The string representation of the date value. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

public type PaystatementDeductioncategorydetails record {
    # The deduction category name
    string deductionCategoryCodeName?;
    # The total amount deducted in this pay period for deductions belonging to this category.  E.g. all benefit deductions
    PaystatementDeductioncategorytotalperiodamount deductionCategoryTotalPeriodAmount?;
    # The year to date total amount for the  deduction category
    PaystatementDeductioncategorytotalytdamount deductionCategoryTotalYTDAmount?;
};

# The distribution target, e.g. bank account info
public type PaystatementDepositaccount record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication
    string SWIFTID?;
    # The account where the moneis are to be distributed
    PaystatementDepositaccountFinancialparty financialParty?;
    # The account where the moneis are to be distributed
    PaystatementDepositaccountFinancialaccount financialAccount?;
};

# The amount to show in the main window.  If this amount is not passed then the default property is used
public type AmountFormulaType record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue;
    # List of standard currency codes ISO 4212
    CurrencyCodeType currencyCode;
    # The formula details for a payment calculation amount result
    CalculationFormulaType calculationFormula?;
};

public type PaystatementDirectdeposits record {
    PaystatementGrosspayytdamount depositAmount?;
    # Identifies the routing number for the financial institution (i.e. bank).  For example, in the US this is the RTN (Routing Transit Number - 9 digit bank code)
    string financialPartyRoutingID?;
    # The type of account.  For example: Checking, Savings
    string financialAccountTypeName?;
    # The Financial Account Number.  This is typically masked
    string financialAccountID?;
};

# The Time Period which the pay covers
public type PaystatementPayperiod record {
    # The start date of the time period
    string startDate?;
    # The end date of the time period
    string endDate?;
};

# A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
public type PaystatementDepositaccountFinancialpartyRoutingtransitid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    PaystatementPayrollagreementidSchemecode schemeCode?;
};

# The type of script the address is in. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with inital letter capitalized. For example, Cyrillic is Cyrl
public type PaystatementDepositaccountFinancialpartyAddressScriptcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Existence of the currentPeriod object indicates that the default mapping of properties to the currentPeriod tab should be overriden.
public type PaystatementMetaCurrentperiod record {
    # The label which will be shown in the UI for the section. If this value is not passed then the default value is presented in the UI.
    string sectionLabelName?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used.
    PaystatementMetaCurrentperiodTotalamount totalAmount?;
};

# Value expressed as number and unit
public type ProjectedpaystatementPaystatementWorkerValuequantity record {
    # Quantity value
    decimal quantityValue?;
    # The type of account, e.g. Checking, Savings
    CodeType unitCode?;
};

# Data which provides reference to a position
public type PaystatementPositionref record {
    # Position identifier a person may enter time against.  
    PaystatementPositionrefPositionid positionID?;
    # The title of the position
    string title?;
};

# Existence of the aggregatePeriod object indicates that the default mapping of properties to the agrregatePeriod tab should be overriden.
public type PaystatementMetaAggregateperiod record {
    # The label which will be shown in the UI for the section. If this value is not passed then the default value is presented in the UI.
    string sectionLabelName?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used.
    PaystatementMetaCurrentperiodTotalamount totalAmount?;
};

# Position identifier a person may enter time against
public type IDType record {
    # Is the Identifier of the given instance of an entity
    string id;
    # name of the identification scheme
    string schemeName?;
    # Agency responsible for the maintenance and definition of the identification scheme
    string schemeAgencyName?;
};

public type PaystatementMemos record {
    # The code of the memo. The code can be user defined or statutory.
    PaystatementNamecode nameCode?;
    # The category of Memo. This is to support Taxable Benefits (memos) in Canada.
    record {
        # The code for the related entity.
        string codeValue?;
        # Short description of the related code not to exceed 25 characters
        string shortName?;
        # Long description of the related code
        string longName?;
    } memoCategoryCode?;
    # The amount of the memo related to this pay period
    PaystatementMemoamount memoAmount?;
    # The year to date amount of the memo
    PaystatementMemoytdamount memoYTDAmount?;
};

# The year to date amount of the deduction
public type PaystatementDeductionytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The year to date amount of the earning 
public type PaystatementEarningytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type ProjectedpaystatementPaystatementMemocategorydetails record {
    # The type of account, e.g. Checking, Savings
    CodeType memoCategoryCode;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType memoCategoryTotalPeriodAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType memoCategoryTotalYTDAmount?;
};

# Date
public type DateType string;

# The method by which the distribution is made, e.g. Direct Deposit, Check, Cash, etc.
public type PaystatementPaymentmethodcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The year to date amount of the memo
public type PaystatementMemoytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The year to date total amount for the  deduction category
public type PaystatementDeductioncategorytotalytdamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type PaystatementEmployerDetailvalues record {
    # The label which describes the related property. This is user visible and should be in the requested language.
    string labelName?;
    # The value
    string valueTxt?;
    # An amount
    PaystatementEmployerDetailamount detailAmount?;
};

# ID
public type IdtypeV2 record {
    # An actual ID value
    string idValue?;
    # The type of account, e.g. Checking, Savings
    CodeType schemeCode?;
};

public type ProjectedPayStatement record {
    # Pay detail of a worker pay statement
    ProjectedpaystatementPaystatement payStatement?;
};

# Communication mechanisms, e,g, phone, email, etc
public type PaystatementDepositaccountFinancialpartyCommunication record {
    # A list of land-line telephone numbers
    PaystatementDepositaccountFinancialpartyCommunicationLandlines[] landlines?;
    # A list of mobile telephone numbers
    PaystatementDepositaccountFinancialpartyCommunicationLandlines[] mobiles?;
    # A list of fax telephone numbers
    PaystatementDepositaccountFinancialpartyCommunicationLandlines[] faxes?;
    # A list of pager telephone numbers
    PaystatementDepositaccountFinancialpartyCommunicationLandlines[] pagers?;
    # A list of email addresses
    PaystatementDepositaccountFinancialpartyCommunicationEmails[] emails?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    PaystatementDepositaccountFinancialpartyCommunicationInstantmessages[] instantMessages?;
    # A list of social networks addresses
    PaystatementDepositaccountFinancialpartyCommunicationInstantmessages[] socialNetworks?;
};

# Financial party
public type ProjectedpaystatementPaystatementDepositaccountFinancialparty record {
    # ID
    IdtypeV2 financialPartyID?;
    # The type of account, e.g. Checking, Savings
    CodeType nameCode?;
    # The type of account, e.g. Checking, Savings
    CodeType branchNameCode?;
    # ID
    IdtypeV2 routingTransitID?;
};

# The pay distribution amount, expressed in the account currency. Only one value, either amount or percentage or remaining balance indicator (true) should be provided
public type PaystatementDistributionamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type PaystatementPaydistributions record {
    # The unique identifier of the related pay distribution within a collection
    string itemID?;
    # The region in which the payroll is processed
    PaystatementPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing for this work assignment
    PaystatementPayrollgroupcode payrollGroupCode?;
    # The payroll file number
    string payrollFileNumber?;
    # The payroll agreement id
    PaystatementPayrollagreementid payrollAgreementID?;
    # Payroll Agreement description is a mechanism to provide the user with the job and or position context of a given payroll agreement, e.g. a file number. It should be readable, user-friendly and might be valued with job or position title(s) or perhaps with the work assignment description(s)
    string payrollAgreementDescription?;
    # The date when the distribution instruction set will become or became effective.  May not be the same as the first execution date (payroll date)
    string requestedStartDate?;
    # The pay distribution (transfer) purpose,e.g. Salary, Travel Expenses, Pension Plan, etc.  Client should provide specific code list.  If no value is provided, Salary (payroll) distribution should be assumed
    PaystatementDistributionpurposecode distributionPurposeCode?;
    # The pay distribution status,e.g. Active, Inactive, Pending, etc.  Only one Active distribution should be allowed at any given point of time, while multiple Pending (future) distribution are possible
    PaystatementDistributionstatuscode distributionStatusCode?;
    # Distributions made for this specific pay based on the distribution instructions
    PaystatementDistributions[] distributions?;
};

public type InternetAddressWithItemID record {
    # The unique identifier of the object in a collection
    string itemID?;
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    PaystatementDepositaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string uri?;
    # The effective date of the related entity. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

public type ProjectedpaystatementPaystatementEmployerEmployerdetails record {
    # Identifier of the line.  This identifier is user visible
    string identifier?;
    # The label which describes the related property. This is user visible and should be in the requested language
    string labelName?;
    # A set of values to be shown on a line.  Both properties are optional, but a minimum of 1 is required if the statementValue is passed
    ProjectedpaystatementPaystatementEmployerDetailvalues[] detailValues?;
};

# The worker information
public type ProjectedpaystatementPaystatementWorker record {
    # The label which describes the related property.  This is user visible and should be in the requested language
    string sectionLabelName?;
    # The name of the employer
    string workerName?;
    # Worker location
    ProjectedpaystatementPaystatementWorkerWorkerlocation workerLocation?;
    # A list of tax ids fro a given worker
    ProjectedpaystatementPaystatementWorkerTaxids[] taxIDs?;
    # Additional details related to the worker
    ProjectedpaystatementPaystatementWorkerWorkerdetails[] workerDetails?;
};

public type ProjectedpaystatementPaystatementMemos record {
    # The type of account, e.g. Checking, Savings
    CodeType nameCode?;
    # The type of account, e.g. Checking, Savings
    CodeType memoCategoryCode?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType memoAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType memoYTDAmount?;
    # To indicate if a given memo item represents an adjustment. The regular item is assumed if the indicator is omitted
    boolean adjustmentIndicator?;
};

# The amount an individual is paid over time
public type PaystatementPayrate record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The units in which the quantity is communicated.
    string unitTimeCode?;
};

# An amount
public type PaystatementEmployerDetailamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type ProjectedpaystatementPaystatementDistributions record {
    # The unique identifier of the object in a collection
    string itemID;
    # The type of account, e.g. Checking, Savings
    CodeType precedenceCode?;
    # The type of account, e.g. Checking, Savings
    CodeType paymentMethodCode?;
    # The distribution target, e.g. bank account info
    ProjectedpaystatementPaystatementDepositaccount depositAccount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType distributionAmount?;
    # The percentage of the net pay to be distributed as per the current distribution instruction.  Only one value, either amount or percentage or remaining balance indicator (true) should be provided
    decimal distributionPercentage?;
};

public type NodeValue record {
    string value?;
    string valueType?;
    string code?;
    string formattedValue?;
};

public type PaystatementDepositaccountFinancialpartyCommunicationInstantmessages record {
    # The unique identifier of the object in a collection
    string itemID?;
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    PaystatementDepositaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string uri?;
    # The effective date of the related entity. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

# The type of account, e.g. Checking, Savings
public type PaystatementDepositaccountFinancialaccountTypecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaystatementDeductions record {
    # The deduction code of the deduction. The code can be user defined or a  statutory deduction.
    string codeName?;
    # The deduction code of the deduction. The code can be user defined or a  statutory deduction.
    string deductionCategoryCodeName?;
    # The amount of the deduction related to this pay period
    PaystatementDeductionamount deductionAmount?;
    # The year to date amount of the deduction
    PaystatementDeductionytdamount deductionYTDAmount?;
    # Indicates whether deduction is taken pre tax on the current period deduction.  If there is no current period deduction and only a year to date amount the pre tax indicator is irrelevant and should not be passed.
    boolean preTaxIndicator?;
    # Identifies the percentage
    decimal percentage?;
};

# The URI to be used to request the paystatement to be emailed
public type ProjectedpaystatementPaystatementEmailpaystatementsuri record {
    # URI
    string href?;
};

# Worker location
public type ProjectedpaystatementPaystatementWorkerWorkerlocation record {
    # The label to be shown on the UI
    string labelName?;
    # A list of formatted address lines which will be shown on the UI in the order of the array items.  This is mutually exclusive to the component parts of the the address. If this is returned in the JSON it will be used to present on the UI
    string[] formattedAddressLines?;
};

public type PayStatement record {
    # Metadata of the related entity.  
    PaystatementMeta meta?;
    # Data which provides reference to a position
    PaystatementPositionref positionRef?;
    # Pay Date is the date on which the monies (i.e. payment) are available. ISO 8601 format of YYYY-MM-DD. This may be also be passed as YYYY-MM which is the month the payment represents.
    string payDate?;
    # The Time Period which the pay covers
    PaystatementPayperiod payPeriod?;
    # The Amount paid after all deductions are taken out
    PaystatementsNetpayamount netPayAmount?;
    # The Amount paid before any deductions are taken out
    PaystatementsGrosspayamount grossPayAmount?;
    PaystatementGrosspayytdamount grossPayYTDAmount?;
    # The total duration in hours for the related pay
    decimal totalHours?;
    # Earning represents an instance of a quantity earned for compensation for labor.
    PaystatementEarnings[] earnings?;
    # A collection of deduction category codes with the corresponding total amounts
    PaystatementDeductioncategorydetails[] deductionCategoryDetails?;
    # Deduction is an Amount representing an instance of money deducted from a payroll disbursement. A Deduction maybe a Reverse Deduction. An example of this is the reimbursement of an Expense Report which is added the Disbursement to the Employee after taxes are taken out
    PaystatementDeductions[] deductions?;
    # Memos are similar to deduction in that they represent a code and an amount, but where they differ is in their effect on the Gross to Net calculation. Where a deduction is used to calculate gross to net and memo is not. Some example of memos are: Employer match 401k, Group term life (GTL)
    PaystatementMemos[] memos?;
    # THIS collection is being DEPRECATED.  directDeposits are part of the payDistributions collection.  Direct Deposits will continue going to the directDeposits collection as well as to the payDistributions. Future new version of this API will drop the directDeposits all together. A payment that is electronically deposited into an individual's account at a depository institution.
    PaystatementDirectdeposits[] directDeposits?;
    PaystatementPaydistributions[] payDistributions?;
    # The details of other pay or remuneration
    PaystatementOtherpay[] otherPay?;
    # The employer information
    PaystatementEmployer employer?;
    # The URI to be used to request the paystatement to be emailed
    PaystatementEmailpaystatementsuri emailPayStatementsURI?;
};

# Data which provides reference to a position
public type ProjectedpaystatementPaystatementPositionref record {
    # Position identifier a person may enter time against
    IDType positionID?;
    # The title of the position
    string title?;
};

# List of standard currency codes ISO 4212
public type CurrencyCodeType string;

public type CommentType record {
    # The label which describes the related section  This is user visible and should be in the requested language
    string sectionLabelName?;
    # Actual comment text
    string commentText;
};

# A descriptive coded name of the address
public type PaystatementDepositaccountFinancialpartyAddressNamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaystatementOtherpay record {
    # The label to be shown on the UI for the section
    string sectionLabelName?;
    # The details of other pay or remuneration
    PaystatementOtherpaydetail[] otherPayDetail?;
};

public type PayStatements record {
    # True indicates that the user has the retirement plan feature. If payroll system knows that the user has retirement plan feature then the value is 'true'.  The value is 'false' If the payroll system does not know whether the user has retirement plans feature
    boolean retirementPlanIndicator?;
    #  Paystatements is a list of summary information on the paystatements of an associate and a reference to the detail.
    PaystatementsPaystatements[] payStatements?;
};

public type PaystatementDepositaccountFinancialpartyCommunicationLandlines record {
    # The unique identifier of the object in a collection
    string itemID?;
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    PaystatementDepositaccountFinancialpartyCommunicationNamecode nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country.  
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin).  These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix. Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller. In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number. The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified. Please note that  is used as an escape character in regex, but a double  is needed to escape within the json schema. The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The effective date of the related entity. Follows the ISO-8601:2000 format.
    string effectiveDate?;
};

public type PaystatementDistributions record {
    # The unique identifier of the object in a collection
    string itemID?;
    # Indicates the order of precedence for a given distribution, e.g. primary, secondary, etc.
    PaystatementPrecedencecode precedenceCode?;
    # The method by which the distribution is made, e.g. Direct Deposit, Check, Cash, etc.
    PaystatementPaymentmethodcode paymentMethodCode?;
    # The distribution target, e.g. bank account info
    PaystatementDepositaccount depositAccount?;
    # The pay distribution amount, expressed in the account currency. Only one value, either amount or percentage or remaining balance indicator (true) should be provided
    PaystatementDistributionamount distributionAmount?;
    # The percentage of the net pay to be distributed as per the current distribution instruction.  Only one value, either amount or percentage or remaining balance indicator (true) should be provided
    decimal distributionPercentage?;
};

# The employer information
public type ProjectedpaystatementPaystatementEmployer record {
    # The label which describes the related property.  This is user visible and should be in the requested language
    string sectionLabelName?;
    # The name of the employer
    string employerName?;
    # Employer location
    ProjectedpaystatementPaystatementEmployerEmployerlocation employerLocation?;
    # A list of tax ids
    ProjectedpaystatementPaystatementEmployerTaxids[] taxIDs?;
    # Details related to the employer
    ProjectedpaystatementPaystatementEmployerEmployerdetails[] employerDetails?;
};

# A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
public type PaystatementDepositaccountFinancialpartyAddressCountrysubdivisionlevel1 record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of city sub division, e.g. borough, neighborhood
    string subdivisionType?;
};

# The payroll group relevant to payroll processing for this work assignment
public type PaystatementPayrollgroupcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A country subdivision correlating to a administrative level two levels below country. For example, in the United States, this might be a county
public type PaystatementDepositaccountFinancialpartyAddressCountrysubdivisionlevel2 record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of city sub division, e.g. borough, neighborhood
    string subdivisionType?;
};

# The amount of the memo related to this pay period
public type PaystatementMemoamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type PaystatementEmployerEmployerdetails record {
    # Identifier of the line.  This identifier is user visible
    string identifier?;
    # The label which describes the related property. This is user visible and should be in the requested language.
    string labelName?;
    # A set of values to be shown on a line.  Both properties are optional, but a minimum of 1 is required if the statementValue is passed.
    PaystatementEmployerDetailvalues[] detailValues?;
};

# The URI to be used to request the paystatement to be emailed
public type PaystatementEmailpaystatementsuri record {
    # URI
    string href?;
};

# The amount of the current Pay
public type PaystatementPayamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

# The account where the moneis are to be distributed
public type PaystatementDepositaccountFinancialaccount record {
    # The unique identifier of the account where the moneis are to be distributed
    string accountNumber?;
    # The name of the related account
    string accountName?;
    # The type of account, e.g. Checking, Savings
    PaystatementDepositaccountFinancialaccountTypecode typeCode?;
    # The default account currency code. As per ISO 4212
    string currencyCode?;
};

# Pay detail of a worker pay statement
public type ProjectedpaystatementPaystatement record {
    # Metadata of the related entity
    ProjectedpaystatementPaystatementMeta meta?;
    # Data which provides reference to a position
    ProjectedpaystatementPaystatementPositionref positionRef?;
    # Pay Date is the date on which the monies (i.e. payment) are available. ISO 8601 format of YYYY-MM-DD. This may be also be passed as YYYY-MM which is the month the payment represents
    string payDate?;
    # A list of alternate IDs related to the statement
    IDType[] alternateIDs?;
    # The time period which the pay covers
    ProjectedpaystatementPaystatementPayperiod payPeriod?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType netPayAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType netPayYTDAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType grossPayAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType grossPayYTDAmount?;
    # The total duration in hours for the related pay
    decimal totalHours?;
    # A collection of earning category codes with the corresponding total amounts
    ProjectedpaystatementPaystatementEarningcategorydetails[] earningCategoryDetails?;
    # Earning represents an instance of a quantity earned for compensation for labor
    ProjectedpaystatementPaystatementEarnings[] earnings?;
    # A collection of deduction category codes with the corresponding total amounts
    ProjectedpaystatementPaystatementDeductioncategorydetails[] deductionCategoryDetails?;
    # Deduction is an Amount representing an instance of money deducted from a payroll disbursement. A Deduction maybe a Reverse Deduction.  An example of this is the reimbursement of an Expense Report which is added the Disbursement to the Employee after taxes are taken out
    ProjectedpaystatementPaystatementDeductions[] deductions?;
    # A collection of memo category codes with the corresponding total amounts
    ProjectedpaystatementPaystatementMemocategorydetails[] memoCategoryDetails?;
    # Memos are similar to deduction in that they represent a code and an amount, but where they differ is in their effect on the Gross to Net calculation. Where a deduction is used to calculate gross to net and memo is not. Some example of memos are: Employer match 401k, Group term life (GTL)
    ProjectedpaystatementPaystatementMemos[] memos?;
    # THIS collection is being DEPRECATED.  directDeposits are part of the payDistributions collection.  Direct Deposits will continue going to the directDeposits collection as well as to the payDistributions. Future new version of this API will drop the directDeposits all together.  A payment that is electronically deposited into an individual's account at a depository institution
    ProjectedpaystatementPaystatementDirectdeposits[] directDeposits?;
    # Pay distributions
    ProjectedpaystatementPaystatementPaydistributions[] payDistributions?;
    # The details of other pay or remuneration
    ProjectedpaystatementPaystatementOtherpay[] otherPay?;
    # The employer information
    ProjectedpaystatementPaystatementEmployer employer?;
    # The worker information
    ProjectedpaystatementPaystatementWorker 'worker?;
    # The URI to be used to request the paystatement to be emailed
    ProjectedpaystatementPaystatementEmailpaystatementsuri emailPayStatementsURI?;
    # Statement comments
    CommentType[] statementComments?;
};

# A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
public type PaystatementDepositaccountFinancialpartyCommunicationNamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The distribution target, e.g. bank account info
public type ProjectedpaystatementPaystatementDepositaccount record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account
    string UPIC?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication
    string SWIFTID?;
    # Financial party
    ProjectedpaystatementPaystatementDepositaccountFinancialparty financialParty?;
    # The account where the moneis are to be distributed
    ProjectedpaystatementPaystatementDepositaccountFinancialaccount financialAccount?;
};

# The coordinates of the location of the address
public type PaystatementDepositaccountFinancialpartyAddressGeocoordinate record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

# The address of the party
public type PaystatementDepositaccountFinancialpartyAddress record {
    # A descriptive coded name of the address
    PaystatementDepositaccountFinancialpartyAddressNamecode nameCode?;
    # The type of script the address is in. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with inital letter capitalized. For example, Cyrillic is Cyrl
    PaystatementDepositaccountFinancialpartyAddressScriptcode scriptCode?;
    # Attention of Name
    string attentionOfName?;
    # Care Of Name
    string careOfName?;
    # Line One of Street Address Information
    string lineOne?;
    # Line Two of Street Address Information
    string lineTwo?;
    # Line Three of Street Address Information
    string lineThree?;
    # Line Four of Street Address Information
    string lineFour?;
    # Line Five of Street Address Information
    string lineFive?;
    # The number of a building in the context of a physical address, e.g. House Number
    string buildingNumber?;
    # The name of a building in the context of a physical address, e.g. Rockefeller Center
    string buildingName?;
    # The name the block
    string blockName?;
    # The name of the street
    string streetName?;
    # The type of street, e.g. Lane, Passage, Way
    PaystatementDepositaccountFinancialpartyAddressStreettypecode streetTypeCode?;
    # A unit in the context of an address, e.g. an Apartment Number or an Office
    string unit?;
    # A floor in the context of an address
    string floor?;
    # A reference to a particular staircase in the context of an address
    string stairCase?;
    # A reference to a particular door in the context of an address. e.g. Apartment Number
    string door?;
    # A post office box
    string postOfficeBox?;
    # A way to identify a specific delivery location, e.g. a mail-stop
    string deliveryPoint?;
    # A way to identify a building plot, e.g. a specific building construction site
    string plotID?;
    # A city in the context of an address
    string cityName?;
    # A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
    PaystatementDepositaccountFinancialpartyAddressCountrysubdivisionlevel1 countrySubdivisionLevel1?;
    # A country subdivision correlating to a administrative level two levels below country. For example, in the United States, this might be a county
    PaystatementDepositaccountFinancialpartyAddressCountrysubdivisionlevel2 countrySubdivisionLevel2?;
    # The 2 character country code. As per ISO 3166-1 Alpha 2
    string countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location of the address
    PaystatementDepositaccountFinancialpartyAddressGeocoordinate geoCoordinate?;
    # The date when the current address became effective.  Follows the ISO-8601:2000 format
    string effectiveDate?;
};

public type ProjectedpaystatementPaystatementDirectdeposits record {
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType depositAmount;
    # Identifies the routing number for the financial institution (i.e. bank).  For example, in the US this is the RTN (Routing Transit Number - 9 digit bank code)
    string financialPartyRoutingID?;
    # The type of account.  For example: Checking, Savings
    string financialAccountTypeName?;
    # The Financial Account Number.  This is typically masked
    string financialAccountID?;
};

public type ProjectedpaystatementPaystatementWorkerWorkerdetails record {
    # Identifier of the line.  This identifier is user visible
    string identifier?;
    # The label which describes the related property. This is user visible and should be in the requested language
    string labelName?;
    # A set of values to be shown on a line.  Both properties are optional, but a minimum of 1 is required if the statementValue is passed
    ProjectedpaystatementPaystatementWorkerDetailvalues[] detailValues?;
};

# Branch code / number used to compose the routing id, along with the name if applicable
public type PaystatementDepositaccountFinancialpartyBranchnamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type StatusType record {
    # The code for the related entity
    string codeValue;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # Date
    DateType effectiveDate?;
};

public type ProjectedpaystatementPaystatementEarningcategorydetails record {
    # The earning category name
    string earningCategoryCodeName;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType earningCategoryTotalPeriodAmount?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountFormulaType earningCategoryTotalYTDAmount?;
};

# The type of account, e.g. Checking, Savings
public type CodeType record {
    # The code for the related entity
    string codeValue;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The amount of the deduction related to this pay period
public type PaystatementDeductionamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
};

public type ProjectedpaystatementPaystatementWorkerDetailvalues record {
    # The label which describes the related property.  This is user visible and should be in the requested language
    string labelName?;
    # Value expressed as text
    string valueTxt?;
    # Value expressed as number and unit
    ProjectedpaystatementPaystatementWorkerValuequantity valueQuantity?;
    # The amount to show in the main window.  If this amount is not passed then the default property is used
    AmountType valueAmount?;
};

public type ProjectedpaystatementPaystatementOtherpay record {
    # The label to be shown on the UI for the section
    string sectionLabelName;
    # The details of other pay or remuneration
    ProjectedpaystatementPaystatementOtherpaydetail[] otherPayDetail;
};

# The amount to show in the main window.  If this amount is not passed then the default property is used.
public type PaystatementMetaCurrentperiodTotalamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The label of the amount
    string labelName?;
};

# The scheme code
public type PaystatementPayrollagreementidSchemecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The employer information
public type PaystatementEmployer record {
    # The label which describes the related property.  This is user visible and should be in the requested language.
    string sectionLabelName?;
    # The name of the employer
    string employerName?;
    # Employer location
    PaystatementEmployerEmployerlocation employerLocation?;
    # A list of tax ids
    PaystatementEmployerTaxids[] taxIDs?;
    # Details related to the Employer
    PaystatementEmployerEmployerdetails[] employerDetails?;
};
